Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE29C25B0F
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 07:52:44 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.60])
 by mx.groups.io with SMTP id smtpd.web11.8206.1660290754330040845
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 00:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=o8EhPii4;
 spf=pass (domain: kpit.com, ip: 40.107.222.60,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rr2xd5+wuP62R5NFSWDVdml8HGyqEq4fI+7HyztESD/SmoI+8K+cGf9Th9CPbgPgrBi4TJgQwAr4g5mQFxg5w+an6K81GptUTzn2ERkxN6zHw+vNpijr1yu/bxppvjIhScj1DVC8rJPn3rmIQRRJU312u75/Q2Kg69trPfU9OHDDL3DOPFFW7Pmjy83c3l5Aejz+ktkjfJEIyxw90O6kFpfH9NWJzpSh2Z1Pgmf7ujF8+xJs/JE1Q9vltaQ/VAfiOnWdNPFUc/yhfzYsNaFc4hy/PTKSm+pQgvjagO3KjXmHepOKKOS6LODlUtRFq1+xOz+vtz987kj7lq382fybTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjQXyPYEOxvKDuOyqE72r0pGyjjzR/XrEhwObERxKY8=;
 b=mulzW19tg+SSw097nIgCwjIenKClsIobSGDZ8/TK3OC+Cx5C0VGXYQvVGSV3RQwlI5fWIL58wL8vNLz1oDKsfvuqTuDHCmJzAbtczvzJVHmLChfcsocvjODOPB6QB+00KGK4HaagTnxdik9K5fGDYXGdOszt1yFoZ3khZgYlzDqF0OxYB4z35j7OFHBs5q9XR2sW0AJnat8a/xje/OZQhfjtkHyx05vdSLv4yQ25srCJPo6ENbX08xi10YS/j64EZH/wRoloWYw6hVzW0sSUDxGbBl8S0NfRdhFeTfKhYuH5owWTYo3y3JIlxTUg8Z86U3xkchz28Zjojn5VW2+k1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjQXyPYEOxvKDuOyqE72r0pGyjjzR/XrEhwObERxKY8=;
 b=o8EhPii4IgT8htXgiUUffqVNjS4WrnciFBqjvV2nQK1Dzk+TT7JzRnzv/ffUPSn2ZT1Q64UCXy/DwEt6xnqAV+EoaQJSk6F/hxNByaBroXIAE0YxnfgQ6MwsCArONbuZHcT8I1NSv5jjCmdTZjJr2bKsgo/Q9diH0vyjXoRbMNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by PNZPR01MB8490.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:5f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 12 Aug
 2022 07:52:33 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5d77:6438:def1:ac50]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5d77:6438:def1:ac50%5]) with mapi id 15.20.5504.025; Fri, 12 Aug 2022
 07:52:33 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [oe][meta-oe][dunfell][PATCH 2/5] c-ares: Upgrade to 1.17.1 release
Date: Fri, 12 Aug 2022 09:51:33 +0200
Message-Id: <20220812075136.31326-2-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220812075136.31326-1-akash.hadke@kpit.com>
References: <20220812075136.31326-1-akash.hadke@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91bebcf1-1d1f-4f8f-4702-08da7c379d29
X-MS-TrafficTypeDiagnostic: PNZPR01MB8490:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iFKNrcwRcOIl6xEk6JiSRElpqiyYaFp28Nijlnu4Um2uxW2yCS+bzFy28Rgtb03iB2FuMrCJJ8Q4kqmmyKdUVgozjtuIMz+lruYJ2et0FnCJOSzxvAH766w5+71Vbl7RiybMvg5jCpRTpIQUxckhJB0j44GCNYGY0PtWJuLQmmG01yBN4B6bC02nz8YMEOmaULaoyEKuhN1jmQ0K5pSnKDWT55WqmddQPtn00891vY8s0j4Coak+vYggb3XMXNutV+ksJN3RZ022Re2+sVXR3GnEN7hr25dE3eNH+4x2YkkKhAovkZ5fOFM/MftI+0Fp1b2gWWbFjFmWjLfpn+6tv5cSzvV49aQ37HTQKJYmtY4RmZT1Yb7KG19zOsTEU9poBi0hMihWR8Rsluyw8ZkXVWw6rwlSLZIgzS7UhDBhxdrcZ3sYCIYXmyhfGtizMubkDJbKrag0rXGmmbPGpz8zGVJbOyNpD5k6+BaA9EuZ5I4f4lByziJWbT0kYTs3rw8zBRabLy/yIXiCniN+KPoVntz8kj/ouEi5yR+h7EMtWMhq+0bi9UZk2/U0+bdLtKhnz7Ilr0S95pgAFN3ZL2u1RqeBxO00qzpYHbE7Ew9mEv2lG0MUJ3CwFL65rtnzHEidL2LDUjTXl7JTkdwhM7D/yg3pD1O5BBnrYBb+d+5B60lNuTPVDxtRutnNGbPPPqhjuU45IRdU4NJmO5EMZxTltBEfXcndbDM1lXy67HwSLyizT94iwUIlZcoKmhtLopy4e7AMxV5nBxBJFTi3AZac3+luamyM12sqSBHwVjJqf8w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(36756003)(5660300002)(2906002)(44832011)(478600001)(8936002)(316002)(66946007)(6916009)(2616005)(38100700002)(38350700002)(6506007)(26005)(66476007)(6512007)(6486002)(86362001)(54906003)(41300700001)(52116002)(186003)(8676002)(4326008)(66556008)(53546011)(107886003)(83380400001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?asX/MRAzr2kMLgC7DdbX0LnxxBKP5Md7F4OTeQZoMe02CT7MJfeIJdiU9Ee0?=
 =?us-ascii?Q?33SS4/DMwKxITXvISyOsWDSAUcFtUXdHIGM9e+MeQVpyQVJZfzDeBuErRmOb?=
 =?us-ascii?Q?ey2PDfnGJ+xFJHgtZYiE12JO8qfY6FvRKDa1Lw0GhofxzYfWTLzxYvd59PQv?=
 =?us-ascii?Q?sB+JK1bWJcwQmrdRtuN4JBV/8xjq7uWS/Fxl7azFu4yE4s/TThbc4mCur5Nu?=
 =?us-ascii?Q?rQO195oh5DpqelGpcBP7g/ZnpfOrQ6R0ktQ0FB6rGmWP+pb5MMkpXNbkcjlW?=
 =?us-ascii?Q?zeAR59Cf61r/sQDLqjOtOOSzDkpAbkjUOQft82xedw0JlSoMtPYnHokaCH8B?=
 =?us-ascii?Q?ZHWsMo2jpQ8de9SUrYVZjeSsBE9FfLI6J/9e+IfYHy5AdkDmzBhLLWmXIu26?=
 =?us-ascii?Q?0WnLxdf/GG7VRErBNgUNaj1c+WTuDDJLyobb8z9De8W2U2X4HsAYU84dhQlr?=
 =?us-ascii?Q?H49jHx0DcJ9Ty+etlkA0glFi8OHk1HKBSpxc3XVDWDxhbMuDnxRUlM2D8CM9?=
 =?us-ascii?Q?8/plDoPqtOtt1tio5ykM+TCcJmALrjZmlmq56lA5wsIIJmjeWa1PFl24Low+?=
 =?us-ascii?Q?t1c8tU+8GA+fnMXxUIYDfurJX7A6Hvu+5aeekzwhzXxkooV+sjfnt7LvpGfX?=
 =?us-ascii?Q?VZnUdWMgpriOZ1l/6zCgSgQyzNeZ4aNOXpTNM7Yw5qRl+vQdlnp7h8hCGpfX?=
 =?us-ascii?Q?9/4NCW8qemn3DTKCLx1bge8ffCi49Shl5hTECdqO+GxH+rA2Hk/8QhjdBTOB?=
 =?us-ascii?Q?iOV3EsxncKA2PvZic/sIz5TAoQV7OHnh6DpJgPyGqy/ZUBYTrlopS9P+h1Xn?=
 =?us-ascii?Q?jVYy1BvL43eoFRpKXyP0j5JDtp/dn46udjP/R0Svei0R+kqvIEZ3/A3OixIL?=
 =?us-ascii?Q?jRAPxQrhUAVeQx+RfWCl8jjjoYxlFUAuTDxgQ3NWQjRWvCxBMIyouPr7AMh5?=
 =?us-ascii?Q?dfecg5ThtBpRN6Fsc0bhvmx1GWxaDw+dBwt57sREh9K+Q3pGKaPr6H2npPGA?=
 =?us-ascii?Q?yyrI+7a0+NZQ6NZO69KbeHNYclAwZRuVi1ucXnadH/KiF4HJh8fFDGiRBowh?=
 =?us-ascii?Q?5UF83WLmCOk4QIDTDff5iw+CSfwivrNaoetXmD+dQ8GIjJYA61Ph/Mn33nOk?=
 =?us-ascii?Q?AhhEaiOORnwtBG1hjhi4mYsIMP27m5E6hMerPFtOA4o7h5iLZNRsEIOuWVLR?=
 =?us-ascii?Q?8vuBSbGtzFhOs0fTPJjTyeKg1mb3b23vA195/yq2uC1vccfKL3G+m8zzh4OC?=
 =?us-ascii?Q?15kuc+WebmXM4+OpSq8Qo33um8VbL2t6t9nQCp81A1nMEN3tLWVUqeo6ixzp?=
 =?us-ascii?Q?XXaU8UzfST34Jz6dwxgA7fQZtfS5y+ys57gFAnN/ADWndF5WN+fTFJzYjVZ4?=
 =?us-ascii?Q?IrLm/DyABTOXXsKq5ChjtWJVEFRxJWgcYGebozk+5JmOoGAFy1TRbo0WztaZ?=
 =?us-ascii?Q?vdwNvOJtylMuC6LuiLyFZsCaA1jiH24BtQxIhw5smvSlnyt0858RIe4jNKOm?=
 =?us-ascii?Q?3izuzk/OZGG/ofYQvJoGaH4OZPCZx5Su527Yk9go0jB3DVtLxFreDyPwA0Ct?=
 =?us-ascii?Q?5FIDbl78RM0x56VWpPp5bDKhEGi/QkXb1WU19w+T?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 91bebcf1-1d1f-4f8f-4702-08da7c379d29
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 07:52:33.0307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cpQLqLjyChDR72F951IiQPHVeBZ2jDHn3eVCW3MpxsImdoJJwZMiiSK6rcMScqoByrg+eiVvTo4XD9rLsa1qeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB8490
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Aug 2022 07:52:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98203

From: Khem Raj <raj.khem@gmail.com>

Forward port cmake-install-libcares.pc.patch, drop the need to install
pkgconfig files as its already being done by main Makefile

Conflicts:
meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b65f2904191b8d309b3971d4e65c5e1701156b1c)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 .../c-ares/cmake-install-libcares.pc.patch    | 27 +++++++------------
 .../{c-ares_1.16.1.bb => c-ares_1.17.1.bb}    |  4 +--
 2 files changed, 12 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.16.1.bb => c-ares_1.17.1.bb} (89%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
index 0eb7e4bbb3..c6f9c6de61 100644
--- a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
+++ b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
@@ -1,4 +1,4 @@
-From 12414304245cce6ef0e8b9547949be5109845353 Mon Sep 17 00:00:00 2001
+From 2cc41bee63223cb398ea932aad6ecc94ff5b61dd Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 24 Jul 2018 13:33:33 +0800
 Subject: [PATCH] cmake: Install libcares.pc
@@ -11,12 +11,13 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
 update to 1.14.0, fix patch warning
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
- CMakeLists.txt | 28 +++++++++++++++++++++++-----
- 1 file changed, 23 insertions(+), 5 deletions(-)
+ CMakeLists.txt | 23 +++++++++++++++++------
+ 1 file changed, 17 insertions(+), 6 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fd123e1..3a5878d 100644
+index 08c0247..0020d6b 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -214,22 +214,25 @@ ADD_DEFINITIONS(${SYSFLAGS})
@@ -50,9 +51,9 @@ index fd123e1..3a5878d 100644
  
  # When checking for symbols, we need to make sure we set the proper
  # headers, libraries, and definitions for the detection to work properly
-@@ -554,6 +557,15 @@ CONFIGURE_FILE (ares_build.h.cmake ${PROJECT_BINARY_DIR}/ares_build.h)
- # Write ares_config.h configuration file.  This is used only for the build.
- CONFIGURE_FILE (ares_config.h.cmake ${PROJECT_BINARY_DIR}/ares_config.h)
+@@ -551,6 +554,15 @@ ENDIF()
+ # Record toplevel CMakeLists.txt path
+ set(CARES_TOPLEVEL_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
  
 +# Pass required CFLAGS to pkg-config in case of static library
 +IF (CARES_STATIC)
@@ -66,19 +67,11 @@ index fd123e1..3a5878d 100644
  
  # TRANSFORM_MAKEFILE_INC
  #
-@@ -728,6 +740,12 @@ IF (CARES_INSTALL)
+@@ -624,7 +636,6 @@ IF (CARES_INSTALL)
  	INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" COMPONENT Devel DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
  ENDIF ()
  
-+# pkg-config file
-+IF (CARES_INSTALL)
-+       SET (PKGCONFIG_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
-+       INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" DESTINATION ${PKGCONFIG_INSTALL_DIR})
-+ENDIF ()
-+
+-
  # Legacy chain-building variables (provided for compatibility with old code).
  # Don't use these, external code should be updated to refer to the aliases directly (e.g., Cares::cares).
  SET (CARES_FOUND 1 CACHE INTERNAL "CARES LIBRARY FOUND")
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
similarity index 89%
rename from meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
index 0e118c88ff..de27d736ad 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
@@ -5,14 +5,14 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
-PV = "1.16.1+gitr${SRCPV}"
+PV = "1.17.1"
 
 SRC_URI = "\
     git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
     file://cmake-install-libcares.pc.patch \
     file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
 "
-SRCREV = "74a1426ba60e2cd7977e53a22ef839c87415066e"
+SRCREV = "39c73b503d9ef70a58ad1f4a4643f15b01407c66"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.17.1


