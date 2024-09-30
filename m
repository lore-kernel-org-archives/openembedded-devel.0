Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4D5CE8373
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:26:22 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.106])
 by mx.groups.io with SMTP id smtpd.web10.59036.1727713570740389019
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 09:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=kAvyTlwN;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.106, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGGwZY7QzcyAwPC2+HPY+GVJLZC1ZPkHkFXbmKW67HLPqvx57hl6+Hs0DzOfjsCjq1M5WnJo4jQ9KXo2a04uYi8fuAZy3CYnLsV/KY/gRKoGeMHmHCW9PxPxvanVaFG4sPvt3z9/OgEim42y4LoDVZHz0+lsQ3xdd2ESUszQgpfFgVoMEkeFthxaeapBIl1CzzrTZ9SbBvy+h22acoyPmuxkdONTfQGqdz0Jee1YASq/hY9CYulk6AE1aSY5AYWDcAGTDy9sSIPDMp7TVEPeuqMOVc25wZDKemFfX+67+fhy50LoCJ6bh5bB1ddJ/8fCXNrZ7R26O5QAaFa9GWrLlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnmMC0Kl0E/NUc4Njj32WfLC7oaHXJ/7FbVg/y4Og7g=;
 b=h8wxdmnhakQRUHOtcOsCqxvgWEM69jEh1bNiN6FPnsC/pl55z/o59wSYHo6Z3Yjw7Zsm9hbLM9DX2NDLaYnLAggAQMsl0nr5Iia1El2D/UFD/ukXcXyaRVngn3efWjockYw9WfJ3UPAmICDNcMUounvQoiZMMUopPbzVJ+QUMYr6+2SXAFcBfVbgtIXTvyXc6yIquub3I4ENuc06dmpL8wg/SmZlmgGk1BP+jDNYbdf5zazjKxSbDdPU6GmrMYR36+Y50WYZihJVhrteixzw/6Lj9VLuKhsfhxAGYpRWMK4ka6yUIVkOLn5ZqOBjGeeQSV9Mt1WQA+ACWLOaCU6XXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnmMC0Kl0E/NUc4Njj32WfLC7oaHXJ/7FbVg/y4Og7g=;
 b=kAvyTlwN6meLUUQ+4usNeDIPO/rKQvkrGU6RuXYQ2Oa0DTYu9lbgRAdGn4ll7Uyl2QhCtXtXPfQzlEQKRVWVDd6gWOtNp4tcr1uDxPJI+obuMpe7+8tJ9Q/zuKfNq4e7qUxWZLNpULBsDYoh8DZO/6ZlkEEp+WFnzJ3Fu4muLl470TpXl3Ksxmmh/t6L3hp8+qtFR7CNRP+9AN5iNpd6zaBNIo8v7bjdKyEhRXDc24RRCHUWKpD5EzXu2q5OyNS2EZRUgut/ceETbgse9sQzO0VyJWW6r8euUMxbtXbsUsIRGjxUuss9Yos5SDSEI1LZLCjq41IdzGCGOuLB+eZtJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB8PR06MB6426.eurprd06.prod.outlook.com (2603:10a6:10:12a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 16:26:05 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 16:26:05 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv2 1/4] mysql-python: Remove obsolete recipe
Date: Mon, 30 Sep 2024 16:25:29 +0000
Message-Id: <20240930162532.4064184-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR05CA0083.eurprd05.prod.outlook.com
 (2603:10a6:208:136::23) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB8PR06MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: d06001e9-02ea-4753-3c6c-08dce16c9553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ze2E7sFHCmZA+kLqfsV9kl7oz0flHKA0khqabUmU915oXC2K5YsD6rOdPMBl?=
 =?us-ascii?Q?iYZhHeNxkAEjaR63TmzcGQhMaiBi1IK0YqMotbfZn024WSJSO1kTzAJE5q5b?=
 =?us-ascii?Q?r92d9TJJzIczAZmrCar+DxdD1F6GhXMvs/gkWBgG8obHEROdL9nQKJvoTVsL?=
 =?us-ascii?Q?f4eORkLg7edckzSCNsjeAvJUzfuNR/KCtUTKT6jJl6UhzjHs5/aPOe4biEon?=
 =?us-ascii?Q?enBYfhrMCN8y9ZnkqltI1nK9Zc0vnA6tGSp1l4AsEEDabQdhIMsnVqytzUjP?=
 =?us-ascii?Q?A9QKb1ZYqvnd+iBARCfou8IDQZF0tyaDCjrbhZ80LeePMVY7+mcHlVgl5Yj5?=
 =?us-ascii?Q?eNdXGKCRiU+8cu4ZaVxDeVALWxyKF/cpg9MikyIFdF4z+pOM9XD+wCtcRsQc?=
 =?us-ascii?Q?1qtrJCMEJxZw75YnGvfA+bsZjKsv91CsGL4GzCD3X7rkXRq3FIt8LizUPlZj?=
 =?us-ascii?Q?Z4ReKLUFMqS9/NBepdRt/U+Af5xmY0ltd0Qu0OJc06+IZPYo1AYr2q+5ynk7?=
 =?us-ascii?Q?zxVND4ul30b/kP3jdjodfuzxKSqNqbRDpcMiCclbsOwqcdqU5dqPD3KaWT9F?=
 =?us-ascii?Q?j8//XlwZTnIyBJEYDG2ZoK35X91OynyPGV/04haqnkOo1VfVeJrsRiCXtgoW?=
 =?us-ascii?Q?gn63Fex0tvCUwhNq/JXIx7MKuJBzp8GvfZ/7lX27HCeb8crbmqOgTpJd2TIz?=
 =?us-ascii?Q?BVNqmYsW/jM+toFeXGqzy3U6IvzoT1YJ+ax4gXF2mKz/QpSCOVDYK91hKzX0?=
 =?us-ascii?Q?65UQ8kdAewJVnQ9ZKAFA2nyl7dTcqnKLFDNHZCfH607W2poiIFR2e+pMvaQ/?=
 =?us-ascii?Q?x01OJFh+pNCsOFbawVJvWb1KAUCrdN4ut5FWQZu77+BVe/udtJLs1mvZi/De?=
 =?us-ascii?Q?inH6jvK65bdh5ugrfyzpgspJo9NfTCJPlZNpRq/2+AMWq8U9vZ2f3xriDXpP?=
 =?us-ascii?Q?dVq39ptHJ6jRdjlKPEnhr1RhmMJ07+pK6x8qH5bjHaSey5qOHEvSNArtJglR?=
 =?us-ascii?Q?EnhCe35XrvOwBuyVMLEFmFnsMpZZX+2+3Kecc4VXEt1b+fya+SLd3HzKCCVM?=
 =?us-ascii?Q?sKJB1fNKpupoRT+bh94YEhdXS/5eC7L3m2lM9VkC2wIZw61SnJspg5AEHGm7?=
 =?us-ascii?Q?qSnlXUs81zohjLp7L7QWS71ouJF58HTOS4BsARJ2XeEihyr5Eytvg7gLy/5T?=
 =?us-ascii?Q?As/Zq1GvviSWvnscchJLB9XVYyAV934qtcO1C266bSS4snucId5Zw3I079qU?=
 =?us-ascii?Q?dhgBkEfgRVPc7aQ6rLnrKOfTxXFpFbIHfY5HwAJRNw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i/CKQkTgHO3ReJNEqgmcEQplfP0fNrylkr4/16q5p9DeeQZy5bPmxq3k7BnR?=
 =?us-ascii?Q?zYUBlg7Jt80RJ1dQhlnBgkpgEmqv0vp3vU5E326HeRuzRTFqUAWoKqi6yY31?=
 =?us-ascii?Q?2UqJTSYqN4RDVstk0u1UZf5WWaoenIArnE2gqmawXgj7ws0yf9MazgAQkl6N?=
 =?us-ascii?Q?Bdq9PYsvSPBgv7Ag7goL57NfnSf1KmNJvsVCLy1Fgc9qgM7KYgJJU+jeXd7h?=
 =?us-ascii?Q?HW48AyVZRNMiyzuvIg4qcEu+SvYJ58pjwOD5wBf+06bOOXDHUTT9sNHkr2UI?=
 =?us-ascii?Q?KBkq7DTfM3mljpSlm/KEq0qeJUef9T+u+LqSD9ScAg19heOUjeqjejTMWsvo?=
 =?us-ascii?Q?KovdCg6x9r5l8u4FhHZ4R8oNTD2l4Xd+qowNGNvZI/GGgZEnqapoJH4ex5ux?=
 =?us-ascii?Q?l6hdl9ki5xrac50lD8seoxK1bryZ6r2/HUFXV+0yqAIS1Xj+7GAzKsDA//Pa?=
 =?us-ascii?Q?t2KEyvI78932ovtuO/A+B2Q7YM5ZBkgYjFKGyseGXPhbvPJhw9cAQ3NrCcLJ?=
 =?us-ascii?Q?tla+SjJ3psts7S3Suy234yPdey4IBhEJneC753C83VwEgVRdUYz5/F4YcvIl?=
 =?us-ascii?Q?0S2/JzZJVZqNUkmjfLSbtAZ7yc8t/b+OSo1iC3SIy2HOEQM7Rk+nmjSGRUp9?=
 =?us-ascii?Q?iBYc/tYXxA9+QPfk7fz9r9npvMVZsKcQgGvYhL0E6dOiBA/r8rAZu6vxhuvO?=
 =?us-ascii?Q?XXMwmj6qkTFtd+/nIA7jcdnWsaDM9CLlVklEYSN3Em6lIA5Q1vngMj2r6/7p?=
 =?us-ascii?Q?UTSSxAhshnEgtG5ZE5INPEy4RgncPHZ6uALEPR58Lxc8nXQRMfbEfmGcbs5Z?=
 =?us-ascii?Q?9MCL2Jtbmcyc3wsqsa0cZ2A37Ap/lQloDiP0kU6lBsxz8MXSZlLg2xO53ECf?=
 =?us-ascii?Q?LjNJmis1RhDyDGrxRBWJWFGdMr8qPWRF251uhbVoTXB6SKRQarIMJqe+dYI8?=
 =?us-ascii?Q?XAMq+d/WHH7iasgk0s8EC1ocH/mjjo8KtdWTZOtB/KEVkn+7I5zbEmO+bQYR?=
 =?us-ascii?Q?fQ4i+o03mfv7ti+stoSRsCrqMkEGqoQUzl0pt2tyzXpyPg6eR3ZisW4Ut/Rc?=
 =?us-ascii?Q?Dkg3pGe+/FIcG8z9g6sbvQf0EDatmtmfKw7CbAV5OuQ31jKC5/nlXf4YE98S?=
 =?us-ascii?Q?OJu9rLi7Ud/RgqNNZWVYmh/aOfc8m8kYofqmTTxJ2QHz8TJUGb9v4ctSII6q?=
 =?us-ascii?Q?rOfRU7hDhyl/Oveukt4284op2YIFeSYHMFoJ7xZb2P0Wn7Opw8d1KpUA5i6u?=
 =?us-ascii?Q?b8je+9AwxQXx4KxoaX+DYQPrWfLeZFDXs0gNSHY8Yy6vO3R1evIj8rocw6dw?=
 =?us-ascii?Q?2tQeVl3znLGUg3CDfP/74xuioiAPL+Z7wX50Rs+lLbszNdVCh9e4IJTvERPh?=
 =?us-ascii?Q?82RnxTD/Nl6KVpY5DAcVtrg/AI3ZSkD9KdENYgJ+TsuO4AwaM069EfR/IcQo?=
 =?us-ascii?Q?J1SGLPatibEFAVlQaAHz8elNIMR27+0EqjgM+MuzuYmShJiCPN9PnkliuiCt?=
 =?us-ascii?Q?p6sKREt96T6XXk8G/qPwtMGf+mqkwDisSQdEvg1VORJgSDYIMOG9R2Ss7kW6?=
 =?us-ascii?Q?NLYvRvHDpbs4a/pn33FtutlQKnODGuml29YAEz+8klYffZMd1qSqeAj7jmjk?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d06001e9-02ea-4753-3c6c-08dce16c9553
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 16:26:05.8723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guEl9Ywgb9Set0JzG0dif7D/d/1oJJZx2O/quyHns877tekkrWx/UnqVCWpRvReOsbhw2tqjgwUoiuEXLb+CLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6426
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112610

This recipe depends on meta-python2, master branch of which has not
been updated sine February 2022, see
https://git.openembedded.org/meta-python2/log/?h=3Dmaster

Also, master branch of the associated source code repository has not
been updated since January 2014, see
https://github.com/farcepest/MySQLdb1/commits/master/

Thus, remove the obsolete recipe, along with associated packagegroup
declarations/references.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  6 ----
 ...ompilation-with-MariaDB-with-10.3.13.patch | 34 -------------------
 .../recipes-dbs/mysql/mysql-python_1.2.5.bb   | 26 --------------
 3 files changed, 66 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fi=
x-compilation-with-MariaDB-with-10.3.13.patch
 delete mode 100644 meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 6f31283fb..9523e78dd 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -13,7 +13,6 @@ PACKAGES =3D "\
     packagegroup-meta-oe-crypto \
     packagegroup-meta-oe-bsp \
     packagegroup-meta-oe-dbs \
-    packagegroup-meta-oe-dbs-python2 \
     packagegroup-meta-oe-devtools \
     packagegroup-meta-oe-extended \
     packagegroup-meta-oe-extended-python2 \
@@ -40,7 +39,6 @@ RDEPENDS:packagegroup-meta-oe =3D "\
     packagegroup-meta-oe-core \
     packagegroup-meta-oe-crypto \
     packagegroup-meta-oe-dbs \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packagegro=
up-meta-oe-dbs-python2", "", d)} \
     packagegroup-meta-oe-devtools \
     packagegroup-meta-oe-extended \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packagegro=
up-meta-oe-extended-python2", "", d)} \
@@ -225,10 +223,6 @@ RDEPENDS:packagegroup-meta-oe-dbs =3D"\
 "
 RDEPENDS:packagegroup-meta-oe-dbs:remove:libc-musl:powerpc =3D "rocksdb"
=20
-RDEPENDS:packagegroup-meta-oe-dbs-python2 =3D"\
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", bb.utils.co=
ntains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'mysql-python', '', d), "", =
d)} \
-"
-
 RDEPENDS:packagegroup-meta-oe-devtools =3D"\
     abseil-cpp \
     apitrace \
diff --git a/meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compi=
lation-with-MariaDB-with-10.3.13.patch b/meta-oe/recipes-dbs/mysql/mysql-py=
thon/0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch
deleted file mode 100644
index 173241ea5..000000000
--- a/meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-=
with-MariaDB-with-10.3.13.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 45436592aa64308b2ab46f84c6107c6d7de0a3ec Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 6 Mar 2019 00:16:17 -0800
-Subject: [PATCH] _mysql.c: fix compilation with MariaDB 10.3.13
-
-Use standard API function MYSQL_OPT_RECONNECT
-instead of direct modification of internal structures
-which does not work for MariaDB.
-
-Upstream-Status: Pending
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- _mysql.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
---- a/_mysql.c
-+++ b/_mysql.c
-@@ -2002,7 +2002,14 @@ _mysql_ConnectionObject_ping(
- 	int r, reconnect =3D -1;=0D
- 	if (!PyArg_ParseTuple(args, "|I", &reconnect)) return NULL;=0D
- 	check_connection(self);=0D
--	if ( reconnect !=3D -1 ) self->connection.reconnect =3D reconnect;=0D
-+	if ( reconnect !=3D -1 ) {=0D
-+#if MYSQL_VERSION_ID >=3D 50013=0D
-+		my_bool recon =3D reconnect;=0D
-+		mysql_options(&self->connection, MYSQL_OPT_RECONNECT, &recon);=0D
-+#else=0D
-+		self->connection.reconnect =3D reconnect;=0D
-+#endif=0D
-+        }=0D
- 	Py_BEGIN_ALLOW_THREADS=0D
- 	r =3D mysql_ping(&(self->connection));=0D
- 	Py_END_ALLOW_THREADS=0D
diff --git a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb b/meta-oe/reci=
pes-dbs/mysql/mysql-python_1.2.5.bb
deleted file mode 100644
index 15f6b6fb9..000000000
--- a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY =3D "Python interface to MySQL"
-HOMEPAGE =3D "https://github.com/farcepest/MySQLdb1"
-SECTION =3D "devel/python"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://GPL-2.0;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
-
-DEPENDS =3D "mysql5"
-
-SRCNAME =3D "MySQL-python"
-
-SRC_URI =3D "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAM=
E}-${PV}.zip \
-           file://0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.=
patch \
-"
-SRC_URI[md5sum] =3D "654f75b302db6ed8dc5a898c625e030c"
-SRC_URI[sha256sum] =3D "811040b647e5d5686f84db415efd697e6250008b112b6909ba=
77ac059e140c74"
-
-S =3D "${WORKDIR}/${SRCNAME}-${PV}"
-
-SKIP_RECIPE[mysql-python] ?=3D "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_T=
O_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https=
://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to "yes"', d)}"
-
-inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "setupt=
ools", "", d)}
-
-python() {
-    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
-        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
-}
--=20
2.39.2


