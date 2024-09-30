Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E27CF6499
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 12:06:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.138])
 by mx.groups.io with SMTP id smtpd.web10.52670.1727697977170095918
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 05:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=MSRuY/Rb;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.20.138, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgRa9OqhF0jbAhaLwDV6Dc1XxxrYye7NbtPK1JOzLJ3MKXUyJTwuT33bnpLmmd0BwiBeXWnzVVcDZBex2nZPMdJ/EzrHOSDdH/5+7ghlp/5ULnX9gYbVABNJrwKS+T+gSaixa8plwisNQzH8mTPUxtmP1G5JhSMJzNqZGyeI8SsW8nH5BjEKcwoiZoJZPwJTrTHG+4BKmUk2gIFQKvipCtFsprasyXwaeAYmjNLjDtydfEwz47qNMjnlGMZd2hyv9IYbJM4+AFyc+TH/IhmMiYLTH3qkl4i/RwFlzgM4u5TCh7aqn2Vx2USj3x6USyHbSh/EK4rZoynJEhbBYEoxHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnmMC0Kl0E/NUc4Njj32WfLC7oaHXJ/7FbVg/y4Og7g=;
 b=zFjXBBs3jv7SKyoyhRHyyd1QrpKGET83Mlr0Dr+L8i5mC5HRMVUCbqADa9yI14riQdSNDgzpzIbXlgmLHXJezip/fyVkOF8+2SFZe0EYRlwlp0ms6mdif6g0U++262hfawrghdUC9KnymdJutzbFSt1ajot99j6+T5CZHx3kcENUYjdI0xZ1eXyMr3YiBAz7ef7AvsqVi9uieSpI618XuujDUns8ijZTwnAUkOvnxbOTbwUrQwOsPl9uCYQdQRyvJVCvSOKyyP9PrRDmxmVHtlfU71EayYPXdzpZMbyhpwrKbV8G9dwlZOW+x7mTDcBzttbhN4xYp0FVD1lJmUzDqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnmMC0Kl0E/NUc4Njj32WfLC7oaHXJ/7FbVg/y4Og7g=;
 b=MSRuY/RbbixtnFvOjx6cZFSBeEQMl0Mx8VlYzcjhyKb/vNvnCR1V834TcpZIN8H71ithmvnt3keTXoY7aAoWlqAOflPfsVVw0Hw1iUrRQGPRddjL1dArB1CozYCUSdHlMQ7YAvBDQoW+2Yxm2t019glkiNHh0lpdoVOQ8oQTY0ZWZqExd8tXZ46wRxPZx5LVOwGWk96VFve+5MU87y07ol6Fszf63d6eIvoR17UmuD5CI9zEq9j9nqbM4koswkLi9GFPntyVmLLIRyBYc2IGYdaqN6or86vkEdUcS3+Ge7Gr7viltVwwa3mWNwMKeE2gGehGo+7TYrRnTO3zI5vtIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8254.eurprd06.prod.outlook.com (2603:10a6:10:2c0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Mon, 30 Sep
 2024 12:06:13 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 12:06:12 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 1/4] mysql-python: Remove obsolete recipe
Date: Mon, 30 Sep 2024 12:05:21 +0000
Message-Id: <20240930120524.2051403-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00014AEE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::318) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a7853ce-5d76-492f-626d-08dce1484712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?T2Mf7l8JsXIIRWoDd101KQrNFKDA4x/gObPxyUxriv+v8u085K7jUMcDXfnt?=
 =?us-ascii?Q?hLCXaW86tr8Ted1PGTFd7/BedsShhtS7jsQdjWPyYazn6QlzS9VVvlRUCOW0?=
 =?us-ascii?Q?yNYsh8T1/gO2VTv1vyxnFPOsGyNCZoPENASoeGeTm2OTaoOomff4fRUAJXXc?=
 =?us-ascii?Q?kJBe8yHmfHzTrHDJe8mmyKHTU78P71s4QwjN1ECmPzsw81+bU+3kJuqnfGdo?=
 =?us-ascii?Q?LDs1i8SWTkxTDGgFqmaEMZ4orIpnP/Unmd01uuDI8JSgiqYP+stVGx3meW+R?=
 =?us-ascii?Q?yeLD0UppMAmoMjQrQXBrKUCbF4GMB2nOChLwZ0oXvYIM/Gy0+zd6uZTN7+1f?=
 =?us-ascii?Q?wWylvx+R1MEryjMWvpHYQo9TYFD2DbvqAyaMRKqPMHwf2wKnnbJ8rbXtJrJL?=
 =?us-ascii?Q?0dme1BSMxHkoX5S7S03+XBXdyv9mwBgYiywCGkd1DTzRdja/FROWdwhx0Njk?=
 =?us-ascii?Q?TFWWYicU0tEEow09sptIHGpyYs+ft1ldQKIaj/E5n0yZJprNpP5rLrS/GTa1?=
 =?us-ascii?Q?GyZkFEGyJYkZKEi1RSSDNQBr1826F0peAKa1AApKHz8TrO3/cNmx9SCtdx3c?=
 =?us-ascii?Q?vDjdBPNpOCU4jOzNTw+ugGh4fLR0cZ4KdyvNuaC8NYSdmVOLBfp5ZGU87l2K?=
 =?us-ascii?Q?sT4SlZzQ+GDcgc6mNCP2CCoV9Nr1gSN1HWLF+yzPEi/I6Rh1TcwXp15McwDG?=
 =?us-ascii?Q?zej3jWo9i0hNYE+F1vxq2HW2dA2fJy+zpdpO+izN1eSi/EOPGTnHOXhFABR7?=
 =?us-ascii?Q?Gg09pZwNDAewnF49iN26PrTCyRoSWPIki1tvK5DKYMbCZfXyBfzc0EgpwUKc?=
 =?us-ascii?Q?fJsYgmb0c3RvE10l0a4Vt8pt9QVSg+duK2NESBpv+CnvlNnPOOjsFJ2i6HNA?=
 =?us-ascii?Q?EZ1hzg1pT4jhRaSXNJYiK9oRKnx/3/MlgO7aWmV9R8PzcBZwImYYMOTWF0Pn?=
 =?us-ascii?Q?K19bK2LGg21/cRTZMMvKJWMkhh7jedvCswOq2igdEocD2rod4Bmn16jnvKoE?=
 =?us-ascii?Q?bYBkDCZAPvyyiQeQFt31ZBjVPKFlgOQfPyMsFwT+5tIXOAA/KlbIUFNgyU5h?=
 =?us-ascii?Q?1EGU05W8r7uX8sA1ynNkUW7qwJxtKcXRSEba/1I8OITZYzmWftZYq7fp7hIg?=
 =?us-ascii?Q?p68sM9OP6yE4B+FwXwmaqi/NLWTS7TpQwhHL3294OTC2SrMozu+nJ9OC7ytW?=
 =?us-ascii?Q?wxUkGjJx+oFFRyLVzBOiidtoQdOHDvkJ7ngJ85jGmbDf7pwuGHKGUtOrVaIF?=
 =?us-ascii?Q?nlr/9HCLlKpdZ6J9vo1ur8Kf8Mbv/Vnbab3QkYkNg/+GrFSOYXUpbczXZ0pz?=
 =?us-ascii?Q?emWkskthCve+mVzWJtXXXgYH8T84WbmrtTnrhRiqN2jP9g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NvBpnBOpl8Qgz5xZ8wiLFR3PWxxiiSmtSGRS3xq0RHmHp8gY+vkBTUlKiHW6?=
 =?us-ascii?Q?pLUf+y6fYQ05kn8RFA+2j61oIXwGfcX9p1JrGUgd2yEv5ggCwSsCuR1mjlOO?=
 =?us-ascii?Q?XxInLK+Uv9gnC2khVDPW3PZg0/+KljAxmsGhnp23XcREf7f74mmFRfyWiFl1?=
 =?us-ascii?Q?PIMxxFoTR3cg/5jnki7kguL3iJlCllZmbvBlQ3p0uNb40EsbavRAMrrcOdBs?=
 =?us-ascii?Q?ik26GLtMgjkoM8pNNrFdFiSiDkhz6ee3/zL+5DV/+/EfiNz8oroYuY0XBYbv?=
 =?us-ascii?Q?mjbz3mAOwhG/6/FaMi0YUBDTuvssAJgmracWnjhZr4UrDSci75uL/kUhCvP7?=
 =?us-ascii?Q?E3gk6EXI9qVsWFpXyq39gzQCbkxD0AEkIPvLMv5AKy2u3G107sNpPhMO4vua?=
 =?us-ascii?Q?gwf8WDXmJseyOMLCiuvAyhJXiywZ1adirBoUgj07GgbpbW59s++X2S2dYY0O?=
 =?us-ascii?Q?+K6OzcO40D8szxWI/1Med1i9mUDaav+II/h+K0V7s0kRbyykDbccb5odaTCC?=
 =?us-ascii?Q?8L0AAmWik5FlCju7PB+t9+fnZLZy9EvaDxLt5/T6N2mtIwFmX3UGzW9DZkLk?=
 =?us-ascii?Q?ZIG2y9+bop7MDbNRpTZJoOXQrLeizmeYOCMlTePmwxrQHWOShhNNVJUO/RAB?=
 =?us-ascii?Q?XmBCJnK6iY0bmX9BF2BFPHrsEvlHFXIo/iQydiiNTensU33vM/2tgXvXBOMi?=
 =?us-ascii?Q?FiM/FF8CFDNMNoCcRXA9I5+zKsxe0EcByrvSxpTZgPFE46Qb8ahTNHaDsptQ?=
 =?us-ascii?Q?jCfSYxB1BgieMTCRAvGJTbWvTSGiy7xlGOp45Fj7vnasgpVI0tAlq8lroct4?=
 =?us-ascii?Q?/Zx9PJYijtV9m1lavkWYTFI0JnwXHJ6FS1n/RKOINMkeqvoaIKPV0WdEAh9S?=
 =?us-ascii?Q?nf/Gk/89eTo1LAIjWrhXr0Nf7jNk4kzgQLtIQKZC4/5AIwsAzviKpBw8S0ik?=
 =?us-ascii?Q?IDDkb4pUr1dxZrInmZ4Ab1wj4RORUeeNebYOH2yGdzJKkL6wnhZkWp1VwHm9?=
 =?us-ascii?Q?OtC0qLdOn9ECjsB7++T1FvvYvrnmyfekU5jYPwg0b923m5SJPylAmmFgdFDm?=
 =?us-ascii?Q?y5QMIb1iZPRhpcLBQwnig2RWZFmIWBnNDafBLvuK5AW+tfEgrxR/r4Q6F7VJ?=
 =?us-ascii?Q?7VNzrWgAFGTB5nzm5oGtwgTJr3PRGN1DojvT3X9phIH8+nWdCcsfIrvTb8nR?=
 =?us-ascii?Q?rThAWPPHQpXC8gqCPIKahAwUg54w4E4ViDOzG7Eh3tB+0sU8jxU7zqxuyoxl?=
 =?us-ascii?Q?4RgF/qpQideN0hNakgssfj0kvx16KWeUdhpn3VDSzy4U//Ss+G48yOBUEBgX?=
 =?us-ascii?Q?+RRV2Tuq7bWOvKJgrfJAHxA4b9lGnAbM+nOcfuVrdA9Q6DSKgRmkWqkGu2KL?=
 =?us-ascii?Q?DAho+2MEtMT51Dp0dBA3XObmPiOtacXw0uDJsIO0mEMdnf9rlrO0oHA8mb+F?=
 =?us-ascii?Q?EoVlGObVnmDZGkVY2KPIkKD7+tGAVy+/eTWOpnLz/M9+MRJPqG1tIKWLEuFD?=
 =?us-ascii?Q?mC8OGqJwaQCvbRzciC8IGn7oJpxp/OabiNcGi9XvD1N6THlM8sC+tnV4cCcq?=
 =?us-ascii?Q?+CocUpXd4CUZhQLFGMn4U0aC1E+qZSWtwFhji+fkNoRGsuavp5oPDWzCiMZe?=
 =?us-ascii?Q?Aw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7853ce-5d76-492f-626d-08dce1484712
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 12:06:12.6985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBBy7D+D5xZkQJd6IM5+mCOTsUmNwIfw/HADXwUdBWmmtA7TeqM0ITJ6LZ6fDBe8lRA3P5JTVc5LUpI6810nvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8254
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 12:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112601

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


