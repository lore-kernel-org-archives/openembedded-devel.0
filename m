Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449ABCEB2FA
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 04:58:57 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.105])
 by mx.groups.io with SMTP id smtpd.web11.74360.1727758734777106992
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 21:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=sYohUmI4;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.105, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqoDqTumvrXhcnufsRIHbn6WKD/Ngc8gvoIX2CvGGv8mTgBxvq1quAOthYM6Q5qrVisRxCZkThjHvqtZO+3ex8ugfmR46awZRompogLU07eeiZEyZWvaHqZk2WLkaNevZ4JKzeRLsbHKpCW9He1t4kQDE9TXUsPzv5snrgriHqoMjzw49tvlAaFkiZBEs24H5mZ7kBVRUvilt096NB1EXKle4zVzFZFbk14Jeg1zZEaBMf3+dsquvUr6Wzc+7VtC9DitUgTz86jozXBYplER4pWGRZAmLqrhVPwWj2+E6dqS9RfckHIbSpDVfEU1KxNMnOmiwKmm/2HEXSTV6bq+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnmMC0Kl0E/NUc4Njj32WfLC7oaHXJ/7FbVg/y4Og7g=;
 b=yERSzG0d/Qyq3tLkbWzdBSJvBNdLGmzEOHAz/NHoY0Xyh4fjdkum1rgPDwjVBPteC/nuawm/4+wOCnu8I0/C9p3fPxiH/rfg9CmIBymLw98D9LaPMbVwcl0tjkpveey7SqvQADzLP4wP2PylGnXC+rsUbnmk7njRPoiUDNYUPrYK2Gxhzbw8//pUD7iXvNBBLlniQC1UQCsjfRsybtNbqVLBq0o/xtDOXLosd2QvuJkJYhHHAtRnsEry0HIWxe5XGzY7i0JFFd+3TsdEXDMEbj0xsJBD+NKjsLaADvdTQZghovtTYTEg6xUaIS19Xq1lpCaGShOhTNvqtGR8dqcMpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnmMC0Kl0E/NUc4Njj32WfLC7oaHXJ/7FbVg/y4Og7g=;
 b=sYohUmI4eeKaUvRoFtL4dObXjX6axmlKxocrIANl3qJb2a/HVUA1EzJcS0f980hdxbnNC6Dtr6hw+jOZ2x+48ZXBbZNqPUhtO6j2yqF+iy16eBy5Trml3rpQHr6uqGwIFo//iqZST2PNj7DLsm7ME//7vfDsLQYCY/o8TViltKHwYfloh/IRwmmCCemjWA6TDDaRPFgXHtq9/i7IDcWyGHUaeScwVQL2KnGEINdM1t3BHkyqY4NPOo2AMr4wo1E9EEyhHtTKc4hAgd+434wMYy2hA64E6jMfdvlaLfPt1bTI4LE18oXcPp5S+u6pUB33VvzQ9SGhJq1lpTprGH4HmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM0PR06MB6465.eurprd06.prod.outlook.com (2603:10a6:208:198::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 04:58:50 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8026.014; Tue, 1 Oct 2024
 04:58:50 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv4 1/4] mysql-python: Remove obsolete recipe
Date: Tue,  1 Oct 2024 04:58:18 +0000
Message-Id: <20241001045821.103617-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003840.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:15) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM0PR06MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: 1caa9234-4f59-4e90-3452-08dce1d5bd71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/sHl3Rm1x45sxz+ZxASmoSy4ncTmEAU01iGaP9dOLaj1wYAfgFbkjJQSF7ip?=
 =?us-ascii?Q?XjardzhQSsjrJdorTSZPfv3bXxxO/1GM4wcNl4KPT7gJE9EkWoyKVlaDlVzD?=
 =?us-ascii?Q?T+8FjqqZYvS92QKhBNfLfxmmZZRJ+n78nXWNIXYSa8PpUEFc6RA1PkI9EQJg?=
 =?us-ascii?Q?9meQ+WkAryMHNueM+5JEtbFuKxkm5SOEKyAxJbsNI1QZnIuRtBybYXw4JOFP?=
 =?us-ascii?Q?xTCNODTAiMLs2LlT8IsC6CnMmKOBiAiVfEu/GCXcIvIhdQjeZquAXAbYpeP5?=
 =?us-ascii?Q?8MemfNsSqC2bVp8/1Tty8DfhiRsOMKXXRgNDl1Ud8tRX5y6IPspjHJuXmRSX?=
 =?us-ascii?Q?+kLnnNZ5HekaQHvdO1/z5Mj4tOSjVGK8/XHEyOm53jr5Ce0Ur+QuhYIIXXeX?=
 =?us-ascii?Q?cPK5eK24cHDG+7HaEvepNCTwbY8V0iIaTZkd7bgTMn8bAImBvtap0oxA5LfG?=
 =?us-ascii?Q?SQvNMeN/NBYv1bZiL4FFhCVk7r1b3UkVExocy7zCpXY2b/yLX/5B0ygzKWa7?=
 =?us-ascii?Q?2LyYm8VJdmm7jlMgw+kRN+brWPHzMuB3OzRWJxMPPTkigLTEX8E4Bh4r8XVg?=
 =?us-ascii?Q?SFOVP47H/IC1fxbzSf0j1n3/IVL3xiuNFENG1LYZTYiuVM+Btlv6//hIJn4O?=
 =?us-ascii?Q?N4XCCuUOoI8IhVIS0Kqifue7UiXhCDC1UH7DbI5ptzs5AxxWndvXlxK6epJI?=
 =?us-ascii?Q?p4R6E2xuNohG51wo+DdpBUQuXhOv0VoWfu2/Wp3f79s+eoW7Ta1dxAYDOiJ8?=
 =?us-ascii?Q?4SiLDsCBZ+bFqaOoGrj9w8OyHsGc8lvO4+W9CFJy1ebmwgziOAk+4PfRMk7K?=
 =?us-ascii?Q?7ELoq0Q1S0ZJDRLnRx7ThHETgAyykPwQbdLskxGHVbz3b8zq6NNVfKliAIiX?=
 =?us-ascii?Q?ajzCXhfNUGHqGdZXUcyVmNhsTgyT2/ew+OVD+9fWdk5hoppY8/pGHfpx6uRl?=
 =?us-ascii?Q?B9RNPE+MGMTFlwbYp9T0k2HgVhO7MxbIne1DMroezh2C7/VCawJh7823Fwma?=
 =?us-ascii?Q?XvLmHvuKtaylW9LXOw4GVndkzLLpA7kIoYaYf4R48XEM73yB8iU33jk8SD8s?=
 =?us-ascii?Q?WTqz0xPa6zDo4JXVevSEhkeZqS6njMVhr94DbjfA0THEwPtApEwYqXPMefOw?=
 =?us-ascii?Q?hC0zWsQFCdeDdVxJnXwuLH/9sMeJyLD8oP8rGMYndH3i5PQKUElGSpsiBA+A?=
 =?us-ascii?Q?f1NaRTKjuzlkDq3syUMYqsjTYIEl2bog7PJK6EHe0HhVg4g8ctnMJpVDSdDY?=
 =?us-ascii?Q?yx/QXyp/nitPB75EOjmLHd6ovyeCRywesCDg6BeE5A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/hXvlDLf28hkA9sYOhhHnF6oTkenG/jXJ+PO113faqFT+N8LoXapqum4p6m9?=
 =?us-ascii?Q?irTnfzljoVd2ba2/ItCGE1u8v4fTEHkq67zHB4+yCIK36sRNvEJSLo7IbP0X?=
 =?us-ascii?Q?MZNS2uHgGWOTOmx28ozJ94U76xHL80voHnbkMfRsw7FanHgsxBzW9D3rI9QS?=
 =?us-ascii?Q?ZoIWd0n0dWpjzYMiBMR3mkN7O42RPJw5v1VyoBcvpIBL0rDQbnMF/BEQcy81?=
 =?us-ascii?Q?iH2Aqj1y/asL2ojNZYYcD3pVLpVlIkKdFQ2lKEplmyhQT3b1E3KaSKzXt2/C?=
 =?us-ascii?Q?MyU9265nirXW405+UhASybZAvxcmbCe2VCcijUfUiLjGirRvKTCMjIy4b4nh?=
 =?us-ascii?Q?Uc0dmsQfTGx5EHJdnqIslM5ALZ9/ex6fFEXlo5+lyYqMPVdzTh7KYhR8t2+a?=
 =?us-ascii?Q?rJqiNzArMhuZUHjb6WgVnnb4t7EYEr1NNrUWkmdVRXQA8gJC50qNo7KUSViX?=
 =?us-ascii?Q?l0OkwxuA0OMYU72NKXi33yYwba70gU4+yBo7Nf6KB4DmhoL8CEeu3UFLbhH0?=
 =?us-ascii?Q?fFwAUBOGj0kuGIgMlUrV6Sg2heGfciHSfkiToeUZtnVhKCA+uwr4tmk5Nj5c?=
 =?us-ascii?Q?LScVHFn68N5bD+M7nbVEHq35eSEm/XM575Cm8JaTJ8U9ECeTitEB0oBR5ARp?=
 =?us-ascii?Q?C9JdUuqxDMBoWn0gN9sQFPJ4txTALNRybLCEPMV8unkO0R8C/67AOq/OShKH?=
 =?us-ascii?Q?fnkgiynNEChxsb/JVXNHSaK1HrIY7rBoggplWlWFlaxDYtL/5eG5v5qeh5QS?=
 =?us-ascii?Q?l4apkcm8BT/+nt8X/qLUZCTZFj67ybbPKt2zqU71KHt8/CGSpjB3qVh4NywD?=
 =?us-ascii?Q?icewkhOg5aJH+P2yZs1wAAvMRTLNinFa3gDGT8jr/EoRVKJWj+fGCxLFgcqB?=
 =?us-ascii?Q?JPXgHcw7siBcHpQFfE3GjjMRIzn2wVKtDGwTtXJdrqecod9Ie9usdHO3CNOf?=
 =?us-ascii?Q?3x+Y+4YtzsYKYEn2rKcbgMmeYLZvWn/uh8YJdN07EtRTorXVVO8uzoIaZim5?=
 =?us-ascii?Q?p04yrE1Xms1bBnQp6nauDzkJMJE+huviSYdWS1Vr2XfrqrnPYzkbX6CSHiCD?=
 =?us-ascii?Q?/7Yxcw3eZYjCfRyXwRSijfda2HnI4UGkT3svrVjXn1DY1wCTBzwFv3VYr69i?=
 =?us-ascii?Q?Ne/EyJjPVclXkEsCMhgyRpSlWGBe9tShnerHSFKryOTodZs0+q0o1cxqbem4?=
 =?us-ascii?Q?1gY69bbkGYlTXjzZvMVRgIP+njyeXOuM7Z7okAG6AG//ahqBad14V+xKOeo7?=
 =?us-ascii?Q?3WSO9lf5TXGEdM4WAzl94w0QP92DtgWOfpJzCNWojSClqBq167ed5txCna8A?=
 =?us-ascii?Q?hrrmLwOcpb4N1ki7XGCv9RbaBr1/Tdnqq35FNf1l7HoBRPOsn82nglo5grj+?=
 =?us-ascii?Q?IF1x+2BT38iDw0xPSUetQedhvlSmXfvaSLwUREGbOPow6oQcQJWLRLO8yauy?=
 =?us-ascii?Q?imNNuJasWTbD26+q6epfZaLAhV7s+JyDNtlUzQFw57PbohcVEKYVb6T49yoe?=
 =?us-ascii?Q?UFlgjO9VN2gT3itnMxwTtdZ/xgkcz6Qf8gjQ1T8zVkZtjJGeNFmKcWXQ7Fzx?=
 =?us-ascii?Q?jM0j7Fd1peqbq3w+sxFW9QkGvDuL9dSbp9E/xTNzBWi7q/W5q2CdCVTOnRZ9?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1caa9234-4f59-4e90-3452-08dce1d5bd71
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 04:58:50.3266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dna2rLYUsnJe+4UP2aurm66Qcy6vz7fOwt6cC+87EZmdFELV6GtlurZTnHEeRHakSUJgmqgNJvNvfmNiM8k3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6465
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 04:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112625

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


