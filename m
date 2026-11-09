Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.138])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1845.1794212299200831375
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 00:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=okH61cE9;
 spf=pass (domain: topic.nl, ip: 40.107.162.138, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPfUVI6KYq567SMLbHlYcXWay5jg5wV9e+b4bIeSSnh9Q76MzxqHRQcpzc0IEtJL14/2TLQjiOX71WAkWAAChI+Deufie2xMCF4J+DUOW9zMDo3/nCMYCfMLh2xZhkyfsISaSOKakgOV4AuyohOJXBr1FlbqBM94eZEvjGXE3/J94bfI8EHeYUP3o+1XLgqDTh3bwvl1A/6OhA4RRwC8S0iMtnBw0KqucZ2FkrezqyIQ2yp8FfIRKrYT+iLIIv0Zsxctg8qSxpSBAwADySJSc6Zxc6JKLkZ1q27aex1H00HmyP5dIwO3v9y33RtmE0tPiAEzlPZfOo45trOySdUoPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5tOZ2GEYqupyisMcRLiAatuIH88yX4flUTZP81Tyd0=;
 b=CHALd4cuaisOJ3UCEydBEFbNTV+gvUnPbUm9dc2YqUkGj6jHi8SPAwsX4zJrHM500POP18gyUSATldAaelIWtEwpgsH/5DCoFGcErl3AinNswxQeo4hFxWfKu1ka2zaLDpJoFwNDd3ddO6iAcTBAfRUvtdXth7iFc1sy+cY15BPFYTsqerV6UMTDPY7xmdTVyf3AYk95pSluBY8LsFm/oNmtld5gHB22S90JpEY8nBqvxoY84/rX/Q7YU3B287V+TmRBjS9U1WKWpgTf0zghWbMjGKQVYuLZqV4bvQAhcrppl+VzPYMIOsGi3IHjDYrl8D0m+JyQRMqopUKDRZklCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5tOZ2GEYqupyisMcRLiAatuIH88yX4flUTZP81Tyd0=;
 b=okH61cE945xT7ugKZFwJA5Yeg9rPfC1nF0Ks/w1uTc7ld+WVEPOb54mzbZm6Wh8Vyql1IeSESoFHQkwVVx6RBACb9IzxrgqWGJ/5k3PtsXnJW3TyncdNMEsk8OIEbme/SgECdcVsiTZkxgMjhIw8I2RseeEMQYoIRaeEYBp5AcCZbpU9lSv7FAudh4QCnaixwH8qGxfJVjq+fDDJ3sDYoIX+IFR/mQ2baBGFaUwlHeKj++omA2fET6UMqjL7laGv6KhZzTs/OuSTtkAsyUnzpgsWHEC53/yKZ00F7qWk7E5+nksSWZqS3WSg4a1N5OUgA8guyA0AqaGAPBWriYAetw==
Received: from DUZPR01CA0172.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::29) by PR3PR04MB7450.eurprd04.prod.outlook.com
 (2603:10a6:102:8a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 08:18:13 +0000
Received: from MAD0EPF000008A9.eurprd04.prod.outlook.com
 (2603:10a6:10:4b3:cafe::7) by DUZPR01CA0172.outlook.office365.com
 (2603:10a6:10:4b3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 08:18:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.93.157.195) smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 MAD0EPF000008A9.mail.protection.outlook.com (10.167.241.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 08:18:11 +0000
Received: from DB6PR07CU003.outbound.protection.outlook.com (40.93.64.94) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 09 Nov 2026 08:18:10 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by DB9PR04MB11658.eurprd04.prod.outlook.com
 (2603:10a6:10:608::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 08:18:09 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 08:18:09 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
CC: Gyorgy Sarvari <skandigraun@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>,
	Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 4/4] mongodb: ignore CVE-2025-14911
Date: Mon, 9 Nov 2026 09:17:53 +0100
Message-ID: <20261109081800.69803-5-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109081800.69803-1-mike.looijmans@topic.nl>
References: <20261109081800.69803-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.670c1e34-c7d2-4409-adc1-8c70fda66c67@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4PR10CA0006.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::6) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
Return-Path: mike.looijmans@topic.nl
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR04MB12030:EE_|DB9PR04MB11658:EE_|MAD0EPF000008A9:EE_|PR3PR04MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f1c2a3-7997-4674-ef36-08df3e39fedf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|10067099003|56012099006|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info-Original: oMOHQLwe0PfUw+KqMK8wpX3JhvemyYSiOgZw3XVIeNHFDSHPViUJ2R4t9/XtWQMnuxUFN104ToHS3iVCDU6qPEIYCqLNN2yTgM9qS7X0tLA1p/J3EBupLAPnJhjBg7VOlRtlGQ6B7eP7Df21ag8QkkIU1DXNfe7gkbceH9qtvZbH4hh2Ryp580CjSZtKeEnsRUVaBLvr74Wgp08c85ms8Oz7VZCFDO1V8bTjib3C9tlLU5MXUp5oRXg1SZukg2TCwVDeYcs93QSpef3B4+T0/ITrXp40wK/C+6P9FHQ5H/CMtUIv3D1PpJOWmvwNPoiXAMchN5w/MgoXFasRgZIRLbWXWAtHxT5h/173QZ50QLUMeKguYdkd9xZ8C9j2Vzzdrr2+lTeTj8KwvBnl3u5V07BQlf9PBbOiTfdWzqfRg2b3kRGlyAix/hLKR/ZbQvpLjeN2J5iykxmUutVAEQM0PYHP19WhP2FR6njhIMhk97YEnDn/KAtk2nF0DDrpuuAJSRyHNzzm7xJWbJ2u45kHmmwoLSWkMOwN/z1cws0s54c3hjKRI2UyupPYwn+rHsLxOWFg8X/9v/O0PuaID7ELMIQwdTMexLYcB+C2+oeKTpp6PkHn+nsvvSmnB2n2qkvKLcWqTEnvFPuz6z7bKo1i3HjuD2BScgGauWMPcq0ElUYeys/YQ3vMxIsPNTfGypCxr8mTrwVL54FZIT09XnX4G8BnuKcvdUzMQQ0H2oAuH9Q=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(10067099003)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: LSEUK2falQvMrzMMBPXQzmT07Xy8sqv4qhnV60U1l19KgrAGe6JBcLiwFC9dUsP8EniDnNGgzBhXHuUB6zYDXtiz3bT9vOEM7QgYyCs+3+nrB3qsiS2qZzVQ4UXTSLFfyP0g/VrYkaG/X9FI9FzZ8W4ifCB9if1Qi+GPY7PiqkE1kZ8RncjyB/imHGMcusO6I/ENLr+bGVyGHuJjHa+dEERbn2s52+w36x4x7DePyJ6IalfK53JT0EgE6gmZxxFQ+v0BxLDCr+9Enbq8sMJQ81mO/o11u5chj67WnaukV2na+YxYBkWBOKv86jRegLjxOcN1kvjFTyRpuKdwhvUWfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11658
X-CodeTwo-MessageID: 90a25834-7c84-4eb6-b014-23ed053198e1.20261109081810@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MAD0EPF000008A9.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1a0b200d-de89-43dc-b038-08df3e39fd33
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|376014|23010399003|36860700016|1800799024|82310400026|4143699003|56012099006|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: HLcNBE8EquX5VVnD22EJK1X3ErDqq6wY6dGRM5vkDcVVsbFH6k5GZqwPHbePa7b0ZZjItzkkPJQSmLOSlV2Hv+z0GGCNHFEMrSLiC8ba4bfvPmXvCrSFnVpQFemY5aOn74/p1pQmblIuXkP1mHYhyzB/MqA6AvOU4AIhnoWz1lP6Ra4pOgcLbr9CzQBFFA4fMEawK7OVxLDzSBwyiNAcwSyjNjOdfbNwd3IuO/6pXMJYPXYaj/cn7LNUirQ1CKlpkYlYM4yLN7NdAAMoBxkBudXloh7/YVabqaIgIfzXkVhau+zq+z0o3PyH1df/URWo84S40esNUrjBOVj6UowEIKXjoFaNi6C5kVx2Fg0V//bcNk77YCSw2FTTP94/FJ0wFV88fdX+k2jt/xvI5vkjKuqZyYJKCPrVKycrCSo/f/Sr/5hl7usx1L5T1t8nMQxNBpigy++nrXaI61NekD1lnBhwo+6X/CecmXNtSyFLw3MJXyvzNOJxnhQS4czhG2+5JPuaHPFYtX8OMEmGMiWD3FPDSSackafPIXyYrZJm5YjsN5bjJrMmMaW9aXaYI0Pe71pd8l4lo7hbwEUyLU1Lia88tl/If0mnA/IY45aX7z8b6rWsxS/Vt6oZzobDcFLog+RlUt92LBe411JpszI2ng==
X-Forefront-Antispam-Report: CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(4143699003)(56012099006)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6KWLqSCU/sLf4FB8qVsPy1DSFMSPJwshUAO9tlfhdnYYD9hFG6AJPmEGmRLmW0AKHufpoNIHUoB7pbA6/eOHNDmINMyz0kSqrr/jpDKWIRje3nwj0HhUawffr/JdbFqbz1YBb32jP5Glh79/pkbn38yWO44mVjQBEo+fgCKBwbocNb2ILF38aEGpXcqZgQxJxJ41PeGGjYPOhjz8/V0Szh2XqL2UrFdnkKF9bnVzoLwYvivReJHezGUtGYwSviuJ9G3J31fE/uEt0TY1iDtjXX521q5JXs9TkRlX979ALUn5ieAIlx760qU3OGwNmdv09O7s02Dx71jBaCX+JKFUNoL5xsP8gIEp/+1y7IQ3cL6/MjcUBMcAS6GNTxj7uMs74iXgU7nB5mCm8amGfpGxwuA4aCZ15RInAWu+DOmsRq1SHBn9qigHKDAimm766dGR
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 08:18:11.8588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f1c2a3-7997-4674-ef36-08df3e39fedf
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008A9.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7450
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 08:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132050
Content-Type: text/plain; charset="utf-8"

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14911

The CVE is currently tracked without valid CPE. The vulnerability
affects mongo-c-driver component, not mongodb. They are also stored
in different repositories.

Due to this, ignore this CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb               | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb=
_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_gi=
t.bb
index 720ddef416..b7f2c3aaac 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -51,6 +51,7 @@ SRC_URI:append:toolchain-clang =3D "\
=20
 CVE_STATUS[CVE-2014-8180] =3D "not-applicable-config: Not affecting our co=
nfiguration so it can be safely ignored."
 CVE_STATUS[CVE-2017-2665] =3D "not-applicable-config: Not affecting our co=
nfiguration so it can be safely ignored."
+CVE_STATUS[CVE-2025-14911] =3D "cpe-incorrect: The vulnerability is about =
mongo-c-driver application, not mongodb"
=20
 COMPATIBLE_HOST ?=3D '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
=20
--=20
2.43.0


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
