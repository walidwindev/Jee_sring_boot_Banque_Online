-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 20 juin 2020 à 14:48
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ebanque`
--

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

DROP TABLE IF EXISTS `compte`;
CREATE TABLE IF NOT EXISTS `compte` (
  `numCompte` varchar(255) NOT NULL,
  `dateCreation` datetime DEFAULT NULL,
  `solde` float DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `libCompte` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`numCompte`),
  KEY `FK_q30tswgwl36wv3d84u2ndcsp` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`numCompte`, `dateCreation`, `solde`, `user_id`, `libCompte`) VALUES
('123456', '2020-06-17 00:00:00', 19500, 'admin', 'Compte courant');

-- --------------------------------------------------------

--
-- Structure de la table `dmdcarte`
--

DROP TABLE IF EXISTS `dmdcarte`;
CREATE TABLE IF NOT EXISTS `dmdcarte` (
  `numDemCarte` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) DEFAULT NULL,
  `compte_numCompte` varchar(255) DEFAULT NULL,
  `typeCarte_id` varchar(255) DEFAULT NULL,
  `usr_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`numDemCarte`),
  KEY `FK_ia1me9s0898win4kqjoyqus6m` (`compte_numCompte`),
  KEY `FK_ancmtlrgbxp6tkmy8i7gkvcm7` (`typeCarte_id`),
  KEY `FK_7mmrfxqcklgt134nvvxj1ceb1` (`usr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dmdcarte`
--

INSERT INTO `dmdcarte` (`numDemCarte`, `adresse`, `compte_numCompte`, `typeCarte_id`, `usr_id`) VALUES
(1, NULL, NULL, NULL, 'admin'),
(2, '61 cite nacim', '123456', '1', 'admin'),
(3, 'ariana', '123456', '2', 'admin'),
(4, 'ariana', '123456', '1', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `dmdcheque`
--

DROP TABLE IF EXISTS `dmdcheque`;
CREATE TABLE IF NOT EXISTS `dmdcheque` (
  `numDemCheque` int(11) NOT NULL AUTO_INCREMENT,
  `typebarre` varchar(255) DEFAULT NULL,
  `compte_numCompte` varchar(255) DEFAULT NULL,
  `usr_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`numDemCheque`),
  KEY `FK_p3jqgpft8rtkfgmlh0e1hm3r5` (`compte_numCompte`),
  KEY `FK_3qkqi5afgo84hl6gh9mnqsmy5` (`usr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dmdcheque`
--

INSERT INTO `dmdcheque` (`numDemCheque`, `typebarre`, `compte_numCompte`, `usr_id`) VALUES
(1, 'OUI', '123456', 'admin'),
(2, 'NON', '123456', 'admin'),
(3, 'NON', '123456', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `mouvement`
--

DROP TABLE IF EXISTS `mouvement`;
CREATE TABLE IF NOT EXISTS `mouvement` (
  `idmvt` int(11) NOT NULL AUTO_INCREMENT,
  `datemvt` datetime DEFAULT NULL,
  `montantmvt` float DEFAULT NULL,
  `typemvt` varchar(255) DEFAULT NULL,
  `compte_numCompte` varchar(255) DEFAULT NULL,
  `usr_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idmvt`),
  KEY `FK_k4hrvfv24mkfhcyrwgj5tgt6l` (`compte_numCompte`),
  KEY `FK_3jlsyfdmwtamwbhg2mbn001i1` (`usr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mouvement`
--

INSERT INTO `mouvement` (`idmvt`, `datemvt`, `montantmvt`, `typemvt`, `compte_numCompte`, `usr_id`) VALUES
(1, '2020-06-03 00:00:00', 150, 'Debit', '123456', 'admin'),
(2, '2020-06-12 00:00:00', 2300, 'Credit', '123456', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `typecarte`
--

DROP TABLE IF EXISTS `typecarte`;
CREATE TABLE IF NOT EXISTS `typecarte` (
  `id` varchar(255) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `typecarte`
--

INSERT INTO `typecarte` (`id`, `libelle`) VALUES
('1', 'Gold'),
('2', 'VISA');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` varchar(255) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `password`, `prenom`) VALUES
('admin', 'Ouerghi', 'abc', 'Walid');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
