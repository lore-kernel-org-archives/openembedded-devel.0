Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39DACEB2EE
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 04:25:06 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.128])
 by mx.groups.io with SMTP id smtpd.web11.73994.1727756701186100776
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 21:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=PJImyjUA;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.128, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5Yut4wp6KD7poexuU160zxTHSpPubwT+9uJcbA7YlRxu8usgnlCq5NXyrRhFawBBwM1TYOvw4JDf0BmZEFEWdMLraFD+fyoi/+qheopYRW6r00+k8qU9czUtFZHqrKpdhLXniQG94cQA2sbcsr/JsUy+SQElAlAfQRYiht9eS0Cr4o1Nn7oH8zkODLi24VrdaarCLIk4LbihMlRWC8aEU1CLLKBnlkdJsRuCjJ0u7Ojh+HuoBddZQ1Qo+mwd3x9Aca5xdZePc5hr+LL6DlIu7ii5KwMsYlAJMaohJjDnTekZcMgVew9N8HAYSYusOvQjgmUzVaDtNDiII+WbffOew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnmMC0Kl0E/NUc4Njj32WfLC7oaHXJ/7FbVg/y4Og7g=;
 b=c0hN897sS4lemm8z/SUMrThbcYdbYfmCrvgBkiDSnWgAQr1yu63SOsagDj6sGsqA1lZQVfi4PASOQNSfwxalPtHqXdd4Mndu99IKtY7j5CqpKvAGVvFpuh6ZTVRxmS4djfRvT8nNDi0z7fAdVHHh5FKvz442l9fnnMUdoamFLwcKFQscunixqVuj9t94m865ucNKpnFGBH5jf+7aLMWbdQNhqPpdWhbdB2RKsnRrnKgbECMGi9swrEyx9XSdrlxBmRAncX9s5v0DStQqMLvjdONx8C8ExAH543X2uyMfR030j0hW+azM+uS4HPn1cmMHH8x4ql6EfvwKpMfo3h7asQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnmMC0Kl0E/NUc4Njj32WfLC7oaHXJ/7FbVg/y4Og7g=;
 b=PJImyjUA6Kz2LNFNKekh1aoI8YlSwoHH2qb7MPAV/po1i4WvLoLgbnQP4Wl6VC5N459tfgU6Y57yRh77Wi9OsMxMBpxzF+0sih4Hn3Xxzpoj81EcN6pEd9buJyzTq4saT4DkDWc6JDqur2/anYKz205f18/tKR0YdS9hexak5I/BF/8CvmpC9MQhM5BblfM7KDrFXJF0/vOjqi287W1KiLcWJASYIDfTLTMoqcdkhg4sDBJdOI6pcQ34BTE0nNSrlmAIoJc3WfxJeRpwmdHYdXUkC9Gps82JMdp5x/wShVRZhNp3r52gs/rYwtWn7k7GVwhcDfxRsxUX1DjnDUlFKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by VI2PR06MB9500.eurprd06.prod.outlook.com (2603:10a6:800:223::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 04:24:57 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%4]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 04:24:56 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv3 1/4] mysql-python: Remove obsolete recipe
Date: Tue,  1 Oct 2024 04:24:26 +0000
Message-Id: <20241001042429.3651-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0000384A.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:8) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|VI2PR06MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 48986294-edc5-48b6-bfd7-08dce1d10179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aWUjsS+6/HVaYvfS3+1HVqQUb4MzTu82I6wHm6el4LY1OPdMubvX6wHMDDNg?=
 =?us-ascii?Q?g6IUS9eBEOvMPXmrKsSJus6antgrj34MtFphoyZWJOZHdvxuzJUHtSoQa44m?=
 =?us-ascii?Q?sMCBCfk4E3bWeY/6E5Q/U7u7eabHBsMMUXm6O98JrZeLOd8dOLlcJwCto68z?=
 =?us-ascii?Q?axFDUXeDxSsoPua1hsC2YRc942QAOhNxjboilEq8St13vx4Uu7W+rTIx/ECh?=
 =?us-ascii?Q?vIkg+bSh1Pk8bzHMsqYaCXesN8Y+e6SufOX8XKYH4JglUxbDOGp2lZS6fPBX?=
 =?us-ascii?Q?2KKMiTYmAHy+D4PylPbJ3s7Jnzw0lIn9HC7apRK9RjsXUVOQhUDZ8L2CYD8O?=
 =?us-ascii?Q?9E+47r6NSp/OOdO8gRG1QnyGl3aEMk+W9VjIUCpHDn5288gL6Y7I5X6E4HGa?=
 =?us-ascii?Q?Oc6+OE520E2NbnMHtoZOPOSEnf4+Yz9sdAQu0MFTcrG2sd7b6lbEw5zdCpkC?=
 =?us-ascii?Q?pJdpNn8z2hq4YQNtZL6fW17XO1p8igcDYjyQuiw/ZAmyLBt92muwFysVaCRI?=
 =?us-ascii?Q?jFQDsdlzrRb7J+3fs4Ir5jODNOgr+A/QR4HuQe6BNiI+LeO47RPj/bUnf9en?=
 =?us-ascii?Q?PY1tbqHTcq1RbHZCRNxuj/CMbqAZrz0WM7JYXFzbN5D+P+toncqjteTSxIyg?=
 =?us-ascii?Q?TEC1kS3vFFDczV5WT9HnP7wk4OZ2zXIcFkmVLx3IDadi6f5TWarBotpyHyzE?=
 =?us-ascii?Q?yjBIQb26U+s0covhmWgMsYq4x3vawJ4cbGh10ySl8e3C6XLgs07qd5CLnORb?=
 =?us-ascii?Q?ZnpoC7fCSMxW5atb/LgC/IYIZe35Ac29dnaf9QaiOc9aDIBp0EOt7+0hBM3J?=
 =?us-ascii?Q?8Ac186SIh3JEgkSpWoccd2ztJsGWbAPExnqF615fSCr2/uz8CGQMDLaaKIt9?=
 =?us-ascii?Q?2aK0UjUF5ruwEUzSeBzwjLDQAfYgWkVCpRoZxpd8eC7B9c1jhM3K/jcU/4aE?=
 =?us-ascii?Q?LVzzfQCQImkWF7eOiSpr2x3yWWDKPUg2SnPiwjmbTLtRkHHYcq8Jbyx7G2Z0?=
 =?us-ascii?Q?f9QUaIml8O8jF/eMjB2ry7Y5py35HdPTMOkGLqIEDnYP7nBDbl6CdaW73q7H?=
 =?us-ascii?Q?KcsWL15TiJTAWzpEzWZRkNhU3pD4r6re6cEIyGgVwlG2E00wWy0dNpxaMtYc?=
 =?us-ascii?Q?/MLXwk+u5nm9ozNI2iV/Y0ByabRi1U1zJufaU41n/4e7Q8Z2UUrBJBmQlTCu?=
 =?us-ascii?Q?q9d3AzTCxlrsERQU0oWF17pWMNcqpNpAO4jfqE0Wjg8cJxyVW4cV4fhGX9cv?=
 =?us-ascii?Q?C8Q2mPE7cjcKOXtMrVSwO9KbGfXNmMmNQoeXtBAAFQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HllYoECwkRjCAYBvcWWr1TxMOWAGXCX5RPJ1eVuF6PbT663wTzwOoNxzOI9+?=
 =?us-ascii?Q?uxQM+NRi5XZRst0esH6FmBiBKIT29JD4nPgMr+QbNgqkhnKHIRqboPR8gRC6?=
 =?us-ascii?Q?sF3Ai28ealwomvu7vw2RyoVYfEJ5oHnGvwhN9N8ZCS6d4pbUpSGlD0LzrFPN?=
 =?us-ascii?Q?G5PQnfVzIAahSM/nuuhjQB9Q//tjxsD/IXbZ9GDoRMKhqY0l/Y0c0b9EXTiw?=
 =?us-ascii?Q?Y83+w/M8sN6yJwdUjbjn4k6BOuEGvkfmltYtVRPw6wEHNGAyAX+VFrjyEPaB?=
 =?us-ascii?Q?BQs33bjL/PE8vjn0KRQKQejnECh7sQUXkmMpKLc+TvEVMjQU6BPsTEXNwPPR?=
 =?us-ascii?Q?jyt2UoA7ZbgkrpWdAaAsRS2THWvlCFKVebkSDIgZf2iXsvejMx6hJJ3RBBVX?=
 =?us-ascii?Q?9JJoJpNI1hcgRzOiWBmrepe9vZXZoTivhjkMlkMOw4b7VXObj9Q63L06Klzo?=
 =?us-ascii?Q?R/bOmUFLGM/5XLeNFqDZDcJsc6B5wi7CjIDz0r6Diu4tG+r/qX7K3AtfFGRi?=
 =?us-ascii?Q?5RJBxe6HftR1NzyT1B/C1+IJGzm9K2f/51b5/oqXE2JN8wyFSEnuzU6YltnF?=
 =?us-ascii?Q?Y8zndJ4LtJ27ts8IRgLjcsXs4Mck8DKSDD6hOoasjOhGWZI64Z/WGD2/e5kF?=
 =?us-ascii?Q?xz4uO9SRdLy3k+YR5h7bsTZFLWF1uc/vJwiooCmGE7ZB5vwup1ccYVjW+bhe?=
 =?us-ascii?Q?BQm3Ywqy7GI4XO3VWna6FPX0CE/kvFdsGGuK7Z4qQK0TS2uI/NEclcrAFH/J?=
 =?us-ascii?Q?o57LAon8FGeJMd6Z0+K6RqJoI84c5uOiPnw/92017e/tIufiH9/7q1kFXHWx?=
 =?us-ascii?Q?/DlftZoqc5oUtWov9UyZ6frPBFxNPOSaVpxWunJI+yVkCVnkmLMyb03ELCPL?=
 =?us-ascii?Q?+dtVFDkpJ92BNhS8EJet8M3bumHR3EQWuURvj6kcNba1lfwfy1WPBii/68gw?=
 =?us-ascii?Q?+fhDC4gCWuQIx8z1CtlZP0HOTFRNqolNo2LjSc5uOtfTLYr2GT6mlIEpB182?=
 =?us-ascii?Q?LSdu1sUN3KaKQzyBtA/K1c6Xys29omgMvdt8PiwCfhpIYJxg2ADlvx7E0dfC?=
 =?us-ascii?Q?tWJCbLHvL25Yf53+6i+n5/NAgcjYiEhyYs7E5WkToBpZOcSNrxrN2m1u0Ukc?=
 =?us-ascii?Q?1aaKSWYBd258t33UH//gJ6W9PlWMe8alJnZNHdo7JjTJ2bnYjGOJCR+JRukb?=
 =?us-ascii?Q?NhDfguq3tgbkHv8Jhu3+6GqkSVYhUgyNK25j0f1UGZF9d8UNSiY/Wrr+c+Ek?=
 =?us-ascii?Q?/5Zw9T6apWcFtaq09FPyB6zOLUcrgwYKMt+CQYGwln3nyNhSymH0XAw0I5IN?=
 =?us-ascii?Q?97MmUk9Uwh5bB7fFK205KUUenqjqmjZsE1wJ8raaX7U7dBB7fMk3UHC6SscY?=
 =?us-ascii?Q?LZ35pa9Vt5iKRPUE6RU2QWoeu6/sXoQUfdHvzHrqYk8Qg0oGsmU0m1v2PAy+?=
 =?us-ascii?Q?LlZKy6xiT7rUlSvxziItLewqQZLi10/fVXKCqeQ8N5Jxq91J4t4q3gsQnrU3?=
 =?us-ascii?Q?ovpWHY6piUDoex/j0BQOZavJ54FmhTCeD+/WkTtIfmOJ02y3VZdDTLCbIyAU?=
 =?us-ascii?Q?t8j4MW1QvMRlEswrPqaxjX1nRS6iiuphA9rtm02rm2h3xPpbwcyUOXRvXsKr?=
 =?us-ascii?Q?bQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48986294-edc5-48b6-bfd7-08dce1d10179
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 04:24:56.9764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MuIb9iKXzjdcD5kamkRo5GzwqeO/eVIGQkeSFNnKyL027BuQPnChwlBYfl8oNcOlnD6ofse2yuTUn/++uZeKOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR06MB9500
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 04:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112618

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


