-- (Re)criação da tabela regioes_atuacao
DROP TABLE IF EXISTS regioes_atuacao;
CREATE TABLE regioes_atuacao (
  id_chave_regiao_atuacao INT AUTO_INCREMENT PRIMARY KEY,
  nome_regiao_atuacao VARCHAR(255) UNIQUE
) ENGINE=InnoDB;

-- Inserts únicos em regioes_atuacao
INSERT INTO regioes_atuacao (nome_regiao_atuacao) VALUES ('São Paulo - Leste 2');
INSERT INTO regioes_atuacao (nome_regiao_atuacao) VALUES ('São Paulo - ABC');
INSERT INTO regioes_atuacao (nome_regiao_atuacao) VALUES ('São Paulo - Leste 1');
INSERT INTO regioes_atuacao (nome_regiao_atuacao) VALUES ('São Paulo - A confirmar');
INSERT INTO regioes_atuacao (nome_regiao_atuacao) VALUES ('São Paulo - Butantã');
INSERT INTO regioes_atuacao (nome_regiao_atuacao) VALUES ('São Paulo - Zona Norte');
INSERT INTO regioes_atuacao (nome_regiao_atuacao) VALUES ('AM');
INSERT INTO regioes_atuacao (nome_regiao_atuacao) VALUES ('BA');
INSERT INTO regioes_atuacao (nome_regiao_atuacao) VALUES ('CE');

-- Inserts em tipos_vinculos (para perfis do CSV)
INSERT IGNORE INTO tipos_vinculos (nome_tipo_vinculo, descricao) VALUES ('Bolsista com Ação Territorial', 'Inserido automaticamente a partir do CSV');
INSERT IGNORE INTO tipos_vinculos (nome_tipo_vinculo, descricao) VALUES ('Bolsista para a Coordenação Estadual', 'Inserido automaticamente a partir do CSV');

-- Alterações na tabela pessoas para incluir FKs
ALTER TABLE pessoas
  ADD COLUMN id_tipo_vinculo INT,
  ADD COLUMN id_regiao_atuacao INT,
  ADD CONSTRAINT fk_tipo_vinculo FOREIGN KEY (id_tipo_vinculo) REFERENCES tipos_vinculos(id_chave_tipo_vinculo),
  ADD CONSTRAINT fk_regiao_atuacao FOREIGN KEY (id_regiao_atuacao) REFERENCES regioes_atuacao(id_chave_regiao_atuacao);

-- Inserts na tabela pessoas
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Aline Mary Vinci da Silva', 'alinemarypt13@gmail.com', '(11) 9 4758.0905', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista com Ação Territorial'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'São Paulo - Leste 2'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Elenilson de Melo Silva', 'nilsonlesbc@gmail.com', '(11) 96289. 8316', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista com Ação Territorial'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'São Paulo - ABC'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Ivonete Aparecida dos Santos', 'Ivonetedagat@gmail.com', '(11) 97725.6995', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista com Ação Territorial'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'São Paulo - Leste 1'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('José Moisés Vilas Boas Neto', 'oxifotofilme@gmail.com', '(11) 95131.1219', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista com Ação Territorial'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'São Paulo - Leste 1'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Julia Leite Cassa', 'juliacassa2@gmail.com', '(19) 988314224', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista com Ação Territorial'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'São Paulo - A confirmar'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Julia Pedote Lourenção', 'Julia.lourencao@alumni.usp.br', '(11) 9 9102.3534', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista com Ação Territorial'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'São Paulo - Butantã'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Luciana Mena Bellato', 'llucianamena@gmail.com', '(11) 9 4845.3870', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista com Ação Territorial'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'São Paulo - ABC'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Marcia Elena Nascimento Fachini', 'marcia.efachini@gmail.com', '(11) 9 6528.7671', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista com Ação Territorial'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'São Paulo - ABC'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Michel Conz Fukuda Pereira Alves dos Santos', 'michel.fukuda@gmail.com', '(19) 9 8932.7645', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista com Ação Territorial'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'São Paulo - Zona Norte'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Odair Miguel Chaves', 'odairmiguel@hotmail.com', '(12) 9 9662.4991', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista com Ação Territorial'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'São Paulo - Leste 2'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Ricardo Goes Spoladore', 'ritch.spoladore@gmail.com', '(11) 9 1318.4869', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista com Ação Territorial'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'São Paulo - Leste 1'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Rute Ferreira Menezes', 'ruteeferreiramenezes@gmail.com', '(11) 9 7014.2980', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista com Ação Territorial'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'São Paulo - ABC'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Walter Cruz de Oliveira', 'Waltercruzoliveira@hotmail.com', '', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista com Ação Territorial'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'São Paulo - Zona Norte'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Maria Cristina Ribeiro De Oliveira', 'mariac.oliveira@trabalho.gov.br', '(92) 99223-5076', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista para a Coordenação Estadual'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'AM'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Terezinha Silva Barbosa Rosenhaim', 'terezinha.rosenhaim@trabalho.gov.br', '(83) 98906-1298', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista para a Coordenação Estadual'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'AM'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Josélia Cerqueira Paixão', 'Joselia.Paixao@trabalho.gov.br', '(71) 98258-9017', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista para a Coordenação Estadual'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'BA'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Magda De Sousa Almeida', 'magda.almeida@trabalho.gov.br', '(71) 98156-5557', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista para a Coordenação Estadual'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'BA'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Ana Celia Vital Batista', 'anac.batista@trabalho.gov.bR', '(85) 99838-2133', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista para a Coordenação Estadual'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'CE'));
INSERT INTO pessoas (nome_pessoa, email, telefone, id_tipo_vinculo, id_regiao_atuacao) VALUES ('Tamy Barbosa De Sousa', 'tamy.sousa@trabalho.gov.br', '(85) 98627-3795', (SELECT id_chave_tipo_vinculo FROM tipos_vinculos WHERE nome_tipo_vinculo = 'Bolsista para a Coordenação Estadual'), (SELECT id_chave_regiao_atuacao FROM regioes_atuacao WHERE nome_regiao_atuacao = 'CE'));

-- Inserts na tabela usuarios
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('alinemarypt13', '', 'e9e8cd35063d2f043812cbe113dfe229e487f76db66af6988d01be9edd5cdd5c', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'alinemarypt13@gmail.com'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('nilsonlesbc', '', 'dc29d361a6723dc64f3ee248d5552a2e5a25e557a1feb5e3b25478237ccfdff5', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'nilsonlesbc@gmail.com'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('Ivonetedagat', '', 'dc85c72d809b3380e5bcab966b50e959017eecd892d8691d5e4b6eb32fd02fd4', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'Ivonetedagat@gmail.com'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('oxifotofilme', '', '69fc987098d116c2f6c42b550ed9deda8a6d3f046c60ab3f2b9ad11ab45ca9f3', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'oxifotofilme@gmail.com'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('juliacassa2', '', 'd9ceabf659014a22dae20bd3ae81b14074a66f737e3bc4dc5a854a685a890532', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'juliacassa2@gmail.com'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('Julia.lourencao', '', 'e01ec6d16fef40bc5789c2f3c93444380a7b4d8bafe9efea685204d2577d5f97', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'Julia.lourencao@alumni.usp.br'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('llucianamena', '', 'c0906edbe031506ac209dba4994812a836f689a545c8eaf368878bcaf4f3604d', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'llucianamena@gmail.com'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('marcia.efachini', '', '4e4d727a4658a08ad38cc2bc8b170f98ca488443cc2997cd6ebc373a838e9775', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'marcia.efachini@gmail.com'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('michel.fukuda', '', '9327ada14ea0e8620aece8230ab4dcadc3faece50874c86945fb7c4c651e0bcb', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'michel.fukuda@gmail.com'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('odairmiguel', '', 'd36f7ff7fefbf2f6ec16e250f0f6733838bb8e4d2fa4c1def080d1101fcc1837', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'odairmiguel@hotmail.com'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('ritch.spoladore', '', '6d412a93392061c1fbdeb1cc85c248ffb8d95d5564529cad4798cc51946d400d', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'ritch.spoladore@gmail.com'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('ruteeferreiramenezes', '', '3d43dc80de26ca75955a0d9f2aa51faac7c291866b9e8664e7dccd567e0aa440', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'ruteeferreiramenezes@gmail.com'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('Waltercruzoliveira', '', '890522764a3232c50e70f107fa3724e32e6a6653adc3306992477cd6a3cad4b8', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'Waltercruzoliveira@hotmail.com'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('mariac.oliveira', '', 'fa25db31c7345492da8bbdd88575d6c5aa7b618d7292c9ee6f33d6d5050e2f99', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'mariac.oliveira@trabalho.gov.br'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('terezinha.rosenhaim', '', '6601624ed6269a97160e4ae37dda83e14be3ee28d8a06ad237cb8be4b32d0cde', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'terezinha.rosenhaim@trabalho.gov.br'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('Joselia.Paixao', '', '9c1ebb488a3b22ddf57ac09076045dd5e4c6508eabd1323a635b208db96b76dd', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'Joselia.Paixao@trabalho.gov.br'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('magda.almeida', '', 'e87509752ac94999769997fb119397284e0f2c1449961eefbbe6f534fab19653', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'magda.almeida@trabalho.gov.br'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('anac.batista', '', '3dfa19c4eb2edcfb6a4a61f07c98a1b5310b14bc75ba21ca460f158a6a51becc', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'anac.batista@trabalho.gov.bR'));
INSERT INTO usuarios (nome_usuario, senha, hash, data_inicio_cadastro, id_pessoa) VALUES ('tamy.sousa', '', '05151f190288e13750025fb3a1a4fcf07638c36d3a102389e46cbc0168f6c67b', CURDATE(), (SELECT id_chave_pessoa FROM pessoas WHERE email = 'tamy.sousa@trabalho.gov.br'));

SELECT "Limpando dados de email e telefone" as "";

update pessoas set email ="sigilo";
update pessoas set telefone = "sigilo";

