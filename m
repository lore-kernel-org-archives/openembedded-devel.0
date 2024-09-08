Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC641ECE580
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 17:12:27 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.123])
 by mx.groups.io with SMTP id smtpd.web11.34076.1725815542816309636
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 10:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Drovl0z7;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.123, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVC61IDqsapWGdoIn6mmpsvsC41FeEQylqvaBTLNl0cAybJcj3EutsKewV8vY3qxSQwysOVXEiljraOSwQFXAWWWF5JgRwpbbZ4hxaFRLq2LEFY0NzbighsMXy3tMUlHfd1iUGXySS5XFbP6fVdihpWFbiIRWZx1OZL6PMdZnGzlf8ymu88A5cqApWACEpkt2/yJxR6RQcfRfIEoo89gSxpdy+jolwi8vj2NlDYN1MAqt/Ojp6Wn5AiPaaEIKmmSNflCar+K6wRqefXvPK/vLpff2M/IVJawmkKy4ORMOwfUcFFCM+g+kr0dWSuwO7LUE1ubqlM9CtJkVLM0slXOzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7RYvcauWvKNeYCMs4pefmyfQZMVldKSafRIhQT+cpQ=;
 b=KNQ8IQDHtzAcN0JQ8i5MsRdHKHs+0WgcPqs+esa9BfGNrGAl838BO2ddQLRtBvkT9FGCSUZy51+cQyN1d2StBPoj6lFKDJnQa2sn/xllvAXY/WjXAk2xUFui7eoF02qMUvslFKU32OZoma2wLOkC34xi8v6yw6DE0pdSQimFlXPYGF5LBimUQhqrAxbha/y1hHLWNVSHU3kxbZsly9ZgcVGVocVoes+43lPGnE3vJnz6d30ds7IWJXKVkTqLBRFg2rO5rFq+TdylpR4O6HTCOuiqAevklajR+z7bQPYNpmDiP/1N+QxaQturfD3QQYBWnWKW7i4F4XQzjYaozj7vSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7RYvcauWvKNeYCMs4pefmyfQZMVldKSafRIhQT+cpQ=;
 b=Drovl0z70cqBQSF0Xk1zNErfJizO1CWKVFALZtbQH1915zt9PEJ0auq+xpvNe8aabi3728xe67YAO6KafqyHDapbyzdBIF5ZhZudvzwZX6p+MDfrEZXrNcYWhl0KklRXe0nBCpi+up/DBBvlphaMpUz5jU86BAtYCOuKAGgZY29jrNLVQKAhiTMyWhHjMIUDli5KBVnksc2g5z5Gq7FNHVjvDQ31OcU4cC5MPwfC+urymTGuwupgne/d3Tw/jHcopbJhbSH+KebtQ4ZoI3BHKi0xsuz/mwqG+NKd0YPBPmz1Nr2JZ73wfXNfW448rlNLdn1P6Lu2GU8QyAvOyPloqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9098.eurprd06.prod.outlook.com (2603:10a6:150:1b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Sun, 8 Sep
 2024 17:12:19 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 17:12:19 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][kirkstone][PATCH 04/13] python3-crc32c: Amend LICENSE declaration
Date: Sun,  8 Sep 2024 17:11:32 +0000
Message-ID: <20240908171141.99382-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908171141.99382-1-niko.mauno@vaisala.com>
References: <20240908171141.99382-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002BA4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:1b) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8ec4f5-2326-4cf1-be64-08dcd0296540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yCdd4TUOQKXijTUOdLwsKaiASAwk2a2ACryOkZgMIZYowyeXDksNwupUENkn?=
 =?us-ascii?Q?gp1pcbGql4dPc7EhEFWxcH+sJBbKLehFVYErxjSy4IyBRaElJDWLpH1veId/?=
 =?us-ascii?Q?oVDwrHFNxUDCL5IrSLU7jRq8FyE/rZkvTFOPhN6YrkPkOLCn2Te5pX/gUIfR?=
 =?us-ascii?Q?j5SbbF/5FzHnJlnsbgschglSzcW7cTVZep5hHmHqNrXPQWeNEP+eDK+jnY1R?=
 =?us-ascii?Q?eoqYnPmeYhMq98VjTScsMpbkJg5MAJN96XszCtn/QTA1jD0KfgW2VByuy8Dh?=
 =?us-ascii?Q?0TBcL9iIMV5R88ZXOC8NG8lgoPi8HNcnYyPmaUDykk2wYjCGxJIAl+MZIoC1?=
 =?us-ascii?Q?Gbv4Av5hl2h253SatSusyAgcIckkfnsPyoDqfz/jYD2I57r0PxX7RqTYXb6k?=
 =?us-ascii?Q?AQRh1Da94JneHN+7Zgc3Nks2OhfHH1bxuSc2htAJOd83uw9WjXX4lSx/Z6dj?=
 =?us-ascii?Q?BMyKzgrJ5bZmDV69YRTNYQzSK0aUp0MVwMIv26tRjCrbFhNQesfSaSrm8Z4o?=
 =?us-ascii?Q?wJ8OhYDhQve86ky+BuewL1NhOeFvNkr05NFbweWSk89xMG6qlD/4g2RodEty?=
 =?us-ascii?Q?V0b22al/6ry/osLy9Op8P+TDmSF7jPsuD3DH4ebA878zLU/+Czj1+mUcAgy8?=
 =?us-ascii?Q?KWvHDyZHp24QdlU0QGgGjZTQOCszuyGEUxSZ5dhJ/s5OfTSms51teMFukf11?=
 =?us-ascii?Q?UGJ5DaHf2Z4T8fp7Dk7zWMOh8J9neq4IgL1jxeo7kfGHB5Lt2+iMo7hYc517?=
 =?us-ascii?Q?ggvoj0eoLVX26WiiSaRRxSHJh7mvyYHSEzfD4z/WLR5XukLWFdo4qs52TwHB?=
 =?us-ascii?Q?VySwISWMJcajGvR/AUTnX2Mnv6SbLiFvmMf5ZGZ02mVUWlhD/D75C9gryOLd?=
 =?us-ascii?Q?BjVrUoogAp4HME8JEoYM3zJtBH3Z49kC3+tcenqz7Owl7XIKpmgY+AAJd6Xe?=
 =?us-ascii?Q?HRQIQ2VonTW1hPN/YcW4Kj1lWyBeCnj2yAKqixhT4njNPEG7xVOjxZWvoC3D?=
 =?us-ascii?Q?2M10ibn/4lR85I5MIUjDr0dDmcLfh0VxNqly3TiKAHtBj494drOAycYccMQf?=
 =?us-ascii?Q?pD4j+Ivb32MUIGzsP6VooeCoIMGIpXwzJOxMsFPk2KzqMD0TSAacX1u40gSi?=
 =?us-ascii?Q?NoQGAkzYpKvwJewPHPfb0QuVgDWPCd9EZ+nn/UK6hrqwLTqhgROroooJQJTQ?=
 =?us-ascii?Q?gyvQ7EX0KPh0xY7tfjAn4GAC6epUiNq8m22nfLEaDS0UGuJTHX8Ct6DlfRG6?=
 =?us-ascii?Q?3Z32+7IWnH107L2IeApfRlqupoNR8oRcHvDwmt/YJtHWDHpDI05YwmUT8tsM?=
 =?us-ascii?Q?1ncLva9II+latberTOqdFmzYD9bn8yCK8gxqaUPbYZqSMNcIft3pENS4u027?=
 =?us-ascii?Q?huVOSoI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZSOdz4VpnWoN891ulqtVxEsPmwTlLiPc3HVr0TtJYkwtrhiC3S9PeSVGw5P1?=
 =?us-ascii?Q?YZ7Cd1PANopzTVAvqhekoGX9TSDGXcvLoLN30wN3f/GY+vxrcH5ZASdHl2h3?=
 =?us-ascii?Q?8dz/Epm+49R5R7Fn0Icbfnd5xTMnw/x5sLwRPyU4VvZ0I5Ki00icCzZ0EaM1?=
 =?us-ascii?Q?/vUGrZfLMaA+x3fWnMm2NTnTuLxhCdKsYqCf1oEX/Hld4JaF46xu+xvd+Nrp?=
 =?us-ascii?Q?XHS31GOtyjcKTfyOBnSIkLNThjhH/gWLV0igrldp7qrfftqs0sfU6IXV2A4P?=
 =?us-ascii?Q?i7I24a4BKiSzrw7u5VDxid2YAskepQbkNzBZtnPL6lFm6kt66VBJhb43wvuW?=
 =?us-ascii?Q?aAT+Qw5SsYz7dQi6eSYnnQqsCZ3kDk7V8IEEl9in+jYp3A2oPTXDvLxC7k9t?=
 =?us-ascii?Q?94PtqsoG04KPogV72M8aM/oC1wChQmKkP9NWHMvU7YmaZPmiY528nLlb0JjW?=
 =?us-ascii?Q?xDJ075AB/0lkQIOoeBhrTMOAjPW8VcIV/noIM9C/yDNXuBlwOfqJUI9hfvjS?=
 =?us-ascii?Q?Ze0R8sGNCCysxWNd1bZj23xcPYI6OLOz9sLeO62vnBF2GZgBVx6xkfIpqiVc?=
 =?us-ascii?Q?ZOQRGRizLRkqtLrokjQb+V+n0lxraVroz07WCBGCB22r/txLHVZOexL35jGW?=
 =?us-ascii?Q?t3v1URUflUKj4b3SihVrV2OoHmjgqVki/QMAjVagzz74wnjdj94DybfZ2D3p?=
 =?us-ascii?Q?A0+0DiFh7i7Nv7r90tecxSIeZ3hjTDZnHowvz1Q0aUEnsJQ47exGsaGXiguh?=
 =?us-ascii?Q?pMwW+/Ga4uV2znmppZ+kMgE9lhcrJUYRCGXYG7+5/kSTaFZDINXjbomXPCf8?=
 =?us-ascii?Q?A8+HYUYvK09A8HOxkKHHgmF7InJuZ3ASk+b+YHf4R/eBF4B583no6plsMk8V?=
 =?us-ascii?Q?emn2yBEgHB6yBfGYLYndBLOXpF0qbzOk0ZS7b2LAUaFcJfnFQHjUcqG0sxd+?=
 =?us-ascii?Q?Ae+s10PVOWddFeUz2y+nVNeV5i8fpK7zt0XA2ATu2Kpk5Rwnw83wIgIdLwN0?=
 =?us-ascii?Q?d0lgE+1rFaPtvqghv4YkPe7HD6yd/pFPiIDO+yIIaTSqcUv5xcWvK9/fLh09?=
 =?us-ascii?Q?eDlpRzG5EFcNlP/jfNsF9erc0Ws/9p79xU+aiBXDz3yobkStTJbW+CuBA4Mj?=
 =?us-ascii?Q?z+dEczUsLlbnkcR+/YqWIMS8OXmDzFNMQxqxZyqIpwlO4duHvPRRLzv9PaJl?=
 =?us-ascii?Q?Y0aAE4uQ2iOhNbYSIxldwT+NC2YS9BXDrogEXWB3nM2XL+qyviCXu0Y+9XDS?=
 =?us-ascii?Q?2/GGSCILDQ1qHXXc9j9hm9upu89PqJyHWgRJtyjQ+ZffthvnqdlwCpwJ3q7Q?=
 =?us-ascii?Q?jK+faudYRWGLQCcOaMWa49cD6O8Zy6wXDNjv6AuWzAeqOMKyhG3zPfswe0Hh?=
 =?us-ascii?Q?fRZxBq8Enp35vtm5YvyQ1+qDKjLHzFuwdfB93cWazBHOQ2sMNFPG2ZCdO+Q1?=
 =?us-ascii?Q?YNu3qLGh3IYlMtck036etJ3Ig/HvbCymNZQNBf64mo1n/Ha3ggpW0gW07yC3?=
 =?us-ascii?Q?SFBC28zhcT/sG5DF64MXX9kWfyxDT+oqai/Zndi9ohHvuG3ageKZ4VSne+3o?=
 =?us-ascii?Q?V3HReUt0Y5Vq427o805/C1OkfGywb1mYulRCLKq/VHSIRy4tQtQ/dUSbJ8PZ?=
 =?us-ascii?Q?hw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8ec4f5-2326-4cf1-be64-08dcd0296540
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 17:12:19.2366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7wM4HVVj2H+QQ3HfqoQAnskaBSjYTgLAhIB9qLYeEB+8aJX7zeW1CL9KtxcvQ6W+08SfheGtUUI94JsD8vSeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 17:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112164

According to https://github.com/ICRAR/crc32c/blob/v2.2.post0/LICENSE
and https://github.com/ICRAR/crc32c?tab=3Dreadme-ov-file#license change
'LGPL-2.0-or-later' in LICENSE value to 'LGPL-2.1-or-later'.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.b=
b b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
index 4f6a3aba9..27978d8e1 100644
--- a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
+++ b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "A python package implementing the crc32c algorithmin hardware=
 and software"
 HOMEPAGE =3D "https://github.com/ICRAR/crc32c"
=20
-LICENSE =3D "BSD-2-Clause & BSD-3-Clause & CRC32C-ADLER & LGPL-2.0-or-late=
r"
+LICENSE =3D "BSD-2-Clause & BSD-3-Clause & CRC32C-ADLER & LGPL-2.1-or-late=
r"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE;md5=3D4fbd65380cdd255951079008b364516c \
     file://LICENSE.google-crc32c;md5=3De9ed01b5e5ac9eae23fc2bb33701220c \
--=20
2.39.2


