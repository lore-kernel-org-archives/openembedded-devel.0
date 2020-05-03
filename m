Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.92.65.92])
 by mx.groups.io with SMTP id smtpd.web11.22784.1588514564138705224
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 May 2020 07:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=G32htIcB;
 spf=pass (domain: outlook.com, ip: 40.92.65.92, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tts/GUMCOq3C2QGbvQI+HC3jV9LO8KClZmROcLSq1ajEsYa49I6+J1xZ7quooxeeJZYc81caY4+58jQCENKbiLLudUiNPafJxY3ZRXswSX7T7h0WQmw2iIdwsKtbzC0/PbwhsoQscqtjytJTYbQRatpDV8oqvrCY/OvnqktBYjWEvceH+OMBLFCJUfzfSOyjxEp61Q70eH/SYr1C4TaX6o3ggtaT/jLhtJWgltHz8DzIlFoSaML3Wjal1cFRzbgD+n854W37eV1SvgCxeeLAC1LiwWxaGKWRdm4w3jg6rBbDoxVnCN7tkNCLJ0Ct2wIGiucjcBjybx62ZlT7xGgSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qknF9E7JqUtx7l34OQsfqdFnHmaolDLdT0prt7h5EDk=;
 b=NC92aVzanSq9krmGc169fCahskPEtUuAxPp2d2cE0NcW0GcZ4vxB8oShrLdT2HZpTtLvoNuWrZWJOGTM7cKLTGpiK81cgFp7Es38xooBgl5Xs9h6NtRnuH8IgkhdHdPq+mDmlFtXBwCDJdsDHK78Gg7i1s8fLh9HAyJA76GgegZGcQRx8IjKh4jClhjDTd3jJjGSg5kwDyAB8Pm+S3jXreehQM8AqOgoBkrXAC0rrbAjDmP7dYJzvk0rV2noL2dwvEZHKRdMSqf0vUrrXTV6SkLhE1mBbuj7lkfaYb7HCstd4c6vjbXGphbOLvTPT/g4oTH3xpsHtQdhF5/ME3JRaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qknF9E7JqUtx7l34OQsfqdFnHmaolDLdT0prt7h5EDk=;
 b=G32htIcB3TOPS0DZnoqXrs4bJj3Fk2wGW/lgIRBLo50YBTeoAdrIGu7Lni/A6n2E1l4UpnVAoFbJMRIe8+xu4yZWAVdiTRc3S+G4JFmva1bH7VGhpgvoZH6KpVo8AhDu9Y03BICaoSP4jhpdFrSBsxKzvibyCjVjJrIH0nrNHQ/zVFwOOnnTOH3ToIgSR40VkruOblfvspsUiVU3vSrI54GnaebZCLGHLkY0ik4einZRq77ZSqpq6xwhuZLaugQA2+UhiW5/+OXSNKgYf4jg8HtED+6IuugQvZLQyDWtDd2n7REekpI5X0Dq9yB0qHwCGbbXChJ9tMJINwOhwcMYBw==
Received: from DB5EUR01FT037.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e1a::4f) by
 DB5EUR01HT219.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e1a::162)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Sun, 3 May
 2020 14:02:42 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1a::52) by DB5EUR01FT037.mail.protection.outlook.com
 (2a01:111:e400:7e1a::212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Sun, 3 May 2020 14:02:42 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1A43454267D356ACDF2CC5FDDB8F790A685088BB618698736B87ED7EAFB40811;UpperCasedChecksum:69794E6154489F48B4552252CA59AB1A2B78038B7E4B1623EB119C64E5249331;SizeAsReceived:7465;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%7]) with mapi id 15.20.2958.029; Sun, 3 May 2020
 14:02:41 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 1/2] php: fix zip package config
Date: Sun,  3 May 2020 16:02:23 +0200
Message-ID: <AM7PR05MB6881083A186F3B7300002730A8A90@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6P194CA0036.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::49) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200503140224.27018-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.87.181) by AM6P194CA0036.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend Transport; Sun, 3 May 2020 14:02:40 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200503140224.27018-1-kweihmann@outlook.com>
X-TMN: [1ERhiNEccf/5q2KbFBGftxLy2Sp8fgj1]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 8590e07f-7d10-4706-4e2d-08d7ef6aa493
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyLZjHvRyHEJ2yv1rq5fk3tpnAou+7bDE5FZU83nELAL+HDCYa6fwoY8YXPNnbQPRrmNcBVq/rSe5xGUmGN1Wz7WPEgCmFnfkTvgFNQPk7B3RZ2qqXpM/H9CoCrhMLUgOB8zLR6owIyqsNB/wXT5vIa0OW0Vy9oaNn5v+oLHko7Vu1Z9+A5MoiLqzjaXtVF/DFnwogzSxhbQAfbUrv1MgRJFA6UW8ljQ8rZZf6XuIA8CLCSPVqcA7BiDEsPEJRjBfcEUCqM7a6aFxtUH6QH3b2AnP1iJdx7oaoIWkCiJQhfgTtDgb3vG1B8fpZiFj9XGSLIWMQZU1x0FE2P+HbwYQztX/a+u37QIL25bA86ES4H1lVsXUw9AohOtWs/9bEw+S9jOwApe8pb1XKYchJDCfM2bXd97+OsmhIsMA3qlvBVdSO5U/HZq/FtSR3x5JxzXGEThQymDq/s0luD2hn9PuS//h/SZbN9W2gxJIx4bYN7yXv6ivRZhLbrMnCR6AodbUJu1qt9xpfve87eB93jpgByIbFC5zxwZEf5qgy0jrafDmnjdEeDhX1E54UqvMhScyap0XAbeSfyHb8uNTeJyzRU3Es1YuDgg/U4KoZJI/h1SUAs1GhApDytvaV44rbKOwfFnZh4I0YBtzPB3/slHChLJUlhSNUtugj6yXzPYSs5ha+uOc8v4/r8MiL/xg+xJ2viE7lgP3nVLKg4U48l/Nck85xrSz2zNUdnNbeh9n2xxEKWk19KwYfE5U4IWLZLxh7U=
X-MS-TrafficTypeDiagnostic: DB5EUR01HT219:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+uwdiu0FEpRxLNq0fF4vtMUW5piTPjO1PHrSo60ygoyg0sui902BaH3gb0b30vzKaT5zqGJFTOb5Ro3e+WgByhBAi8V4DHc1cVqGHaBsQDF3romL6Um+zB1PDu8HMGMoXOCEfFgmqZfHtFSyrnHlwpD49E8ld7mXwyPowp5F3fmzio7CRze9qZDjQuf0i/pHx1e2EnpULjjOC8pZ5Np7bg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	8n0riLtl+pmfK3hrZVniZy1nFeJaS1DoJG+xB5DYWHxYa+INX5uaoveDnaUxMvNCl8zvNZjs8Xrl3tE1VumL+y7tbcsRo0JTELbd7F8Ivqp5C9B6f6qZqnhxKjyBop+ZKtH+VrwYnyiTIhjNxf3EKg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8590e07f-7d10-4706-4e2d-08d7ef6aa493
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2020 14:02:41.9072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT219
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

--enable-zip and --with-libzip were removed in PHP 7.x.
These are replaced by --with-zip --with-zlib-dir.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-oe/recipes-devtools/php/php_7.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-de=
vtools/php/php_7.4.4.bb
index ff4c28e13..c1784a78d 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
@@ -81,7 +81,7 @@ PACKAGECONFIG ??=3D "mysql sqlite3 imap opcache openssl \
 "
 PACKAGECONFIG_class-native =3D ""
=20
-PACKAGECONFIG[zip] =3D "--enable-zip --with-libzip=3D${STAGING_EXECPREFIXD=
IR},,libzip"
+PACKAGECONFIG[zip] =3D "--with-zip --with-zlib-dir=3D${STAGING_EXECPREFIXD=
IR},,libzip"
=20
 PACKAGECONFIG[mysql] =3D "--with-mysqli=3Dmysqlnd \
                         --with-pdo-mysql=3Dmysqlnd \
--=20
2.20.1

