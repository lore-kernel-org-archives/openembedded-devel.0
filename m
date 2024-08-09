Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1164CC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 11:03:25 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.137])
 by mx.groups.io with SMTP id smtpd.web11.81562.1723201394462770824
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 04:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=BF6kXEjD;
 spf=pass (domain: kpit.com, ip: 52.101.227.137, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5f18PZG4CturP4fHX/H0q+h9auPfr2K+n0rUE9pdg5sWB0nhkjJ8f6aLmS/bcm1sm+aQfwnme3X8BBhmEnUEG2kxTq4jRvzZwzgM4uA6Q3JQm7qshZ8sbusBLe+2FX5aGITw8j9oOJ890AMdC+KtCEY5DW4GDKqdIAX+qj0dJyCmLeNjJzonT5P5j4hI2u5xZi1Z6lliElIgG1q5fPtj80o+vcj6eNh724ZZa65QyHhpG+iOzdqJBzJZzBDnNEBtVe+qK0wN/Y2lVpjS8dDryPEawi54JrKHu7eSm3ylfxkueRBofQ7592tq4eMu6QbmdBs4SdKPxGgNEq+t5SNmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joflNyU8aW3FKtufXrxiTyG5UX/CkSf7RYE1/qNYs9A=;
 b=ffnLXIG55SdezQuttWjpfAAdsoVkWE8wzEIYwk37MFPpUM6euFAPuLojOrLIX6/OmnElXQ/7vuyEfHOW2xmXxqnIC4gZVR7YY9ZwmxOKD7W0B6s+l8uwaGcVTUSzEnLkBk0P1e/m4DR9w9GlqWp0qWicjhAL/qDw1A8ONxPGZMoBTtpuT1D3NOMGCaLqjyy7QX/OWamUXyVZlGkBmecTMnTfY7D++8URiAhr6QJ8o5hHyCWSnYeyUVJ/0WCWEn1U9d6T3cPRqWp7WsL+jPvRmR5+h9Uay+X5a7Y+gkeEQ5Dz//nSdxH5yN2G2HuEpsGbLquXq6kLgZeLGEC2lLd+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 103.243.227.16) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=kpit.com; dmarc=fail (p=reject sp=none pct=100) action=oreject
 header.from=kpit.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joflNyU8aW3FKtufXrxiTyG5UX/CkSf7RYE1/qNYs9A=;
 b=BF6kXEjD9wLTvk94ZQcAg5Pk53IvCGdGWeK5/mAtoctLyh8hzzvtC8aF+57dMWY2KaI1cXuDS/876xU0vQd41Mbf8SBgx1e0LnjCSiMFbpigz/T/13Zq6UCJbMYncgBBJ0gDmku/Q1wlGPA6CNFy9V8UHs7jfOJpv+WGrZGL534=
Received: from SG2PR02CA0045.apcprd02.prod.outlook.com (2603:1096:3:18::33) by
 MAZPR01MB6355.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:4f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.9; Fri, 9 Aug 2024 11:03:07 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:3:18:cafe::e4) by SG2PR02CA0045.outlook.office365.com
 (2603:1096:3:18::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15 via Frontend
 Transport; Fri, 9 Aug 2024 11:03:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 103.243.227.16)
 smtp.mailfrom=kpit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=kpit.com;
Received-SPF: Fail (protection.outlook.com: domain of kpit.com does not
 designate 103.243.227.16 as permitted sender)
 receiver=protection.outlook.com; client-ip=103.243.227.16;
 helo=mail.kpit.com;
Received: from mail.kpit.com (103.243.227.16) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Fri, 9 Aug 2024 11:03:06 +0000
Received: from L-17494.kpit.com (10.30.140.23) by PH3EXCH01.kpit.com
 (10.52.16.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 9 Aug
 2024 16:33:05 +0530
From: Nikhil R <nikhil.r@kpit.com>
To: <openembedded-devel@lists.openembedded.org>, <bindu.bhabu@kpit.com>
Subject: [oe][kirkstone][PATCH] rocksdb: Add an option to set static library
Date: Fri, 9 Aug 2024 16:32:47 +0530
Message-ID: <20240809110247.24607-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.140.23]
X-ClientProxiedBy: PH3ExchFE01.kpit.com (10.52.16.111) To PH3EXCH01.kpit.com
 (10.52.16.25)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|MAZPR01MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf08f50-1604-4bee-0bc4-08dcb862d902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?haMRAYOJDMkaDoKPkgr+R7zusjJudqEaz8cunQRv+e3fyZiB+SNd9Eij60u4?=
 =?us-ascii?Q?jzyiJXI95nv/XnkkBE1vESypxJ4a9GuCRvceLWUCifWnOuuxyq3bYPIZB3nf?=
 =?us-ascii?Q?MeG3EwfYgK54ZoDncxLz+RsIlupsluHVERa2yyNRYvIgzWfDX7wCIMK5nsGW?=
 =?us-ascii?Q?uoT14NNQPPB/IfkqUntzZqy1xHiD5t8m6/FYwM/mhl37egPm3rpl9rpvsCcl?=
 =?us-ascii?Q?PNa1k1LxVRrGVOk/v1cjVC2R0rIuROuk1+tIbXPkTUXZamqr8vcaz8Pa4vXM?=
 =?us-ascii?Q?WF3o6B8KnnCjMUa2G4J+UP0XwN5b2gDwqWGSWqJzHSDqKLBb8nXWwDfiQJun?=
 =?us-ascii?Q?YkeC1PqvlxtyMHSvfbfVFnO7gbyaOjbtUX/rij5HJFLIMn5LTGl65ilygeEY?=
 =?us-ascii?Q?R/WVayJflhEzRxAD5plKyyR+TR2orKZrvMWUKznq5WUBvtZD95Vem6sc8hBE?=
 =?us-ascii?Q?fX8kRpNT+qNCFf3AHKjH4BhQ5W7AP82PqhuioOjAhQKxThDGkNaa++X58Wz3?=
 =?us-ascii?Q?hDZmZHWVbMTJ8/J6bNBfOwZunf3kPla20e+PMwjcrIiRga55+rUxnxtO1d2e?=
 =?us-ascii?Q?nKaveT7X5JOQ3j16yXZ6Ge+x/cavMSgA7JAab4hiSf+mx3jmSVONmaUkIENn?=
 =?us-ascii?Q?btGnyCRc5CSmlCmitbI2JJAh0/rd1m8NeXKGW9PvWMFClwjpS3TpDhL9QBrz?=
 =?us-ascii?Q?PEK95t9DDvUczFQAzoztoj/jJ8Ozn8fK/hxacB5Bv3NkLhjCNoTfIemFafUO?=
 =?us-ascii?Q?Xexp+NUbzzpu7Ei9lHcqEyHKkGLmYh7YS3S+XdChE3//uhegKiWQK4StZgZs?=
 =?us-ascii?Q?ggmmjRraxBB850UFBpKXsNV4O6LYEd3xrc037au6V2ApxPsF0fSjvZ7FIBG3?=
 =?us-ascii?Q?PCXNMQWenREBI4BZlwQdzX5xDSq7YYvDH/pufNGVAQ8mLq3kg98UZxBkafDK?=
 =?us-ascii?Q?vawYXy+/cVIGXv1a+4pF2dzzB7AulL1uxLd/jReabfw/e2Vkr6ucZLzVBByf?=
 =?us-ascii?Q?a1+DEcs2hFgg9jjo7Y1EIkzroqgN4p9SFNdLHuzVm/Ybjp3Zi1bTo5yU8Rgi?=
 =?us-ascii?Q?PIKJzvCFAsHWQjQs8B7IdunTv7qyeeUUp8P3m3qIAQIbeGHa6KBVY8BW4DGS?=
 =?us-ascii?Q?YjiuZsY7kKobasklz3Imn5Cvjv8//aM8bb6yxaM59wUWg7unT1DBApTbH3HQ?=
 =?us-ascii?Q?MBMB13TVw/eKzaJhavLSPXLv7wQUvKLMySxsJ2IH+jy0y4CO5J5HpT7VvOG/?=
 =?us-ascii?Q?srWH6GGMmB/IP4cOPY/qPDLYF7tM5m3rq7YfKj17hHU0zGGMbU1+MXPeMabR?=
 =?us-ascii?Q?QSvgbp6a8QCk8+f9jFE22Zc0AU73t/pNrj09aMRgfnb2rFCpiClsd4sqcLIz?=
 =?us-ascii?Q?cQCqRJEPAyMEfth/XFvtpQmPhEKi?=
X-Forefront-Antispam-Report: 
	CIP:103.243.227.16;CTRY:IN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.kpit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 11:03:06.5769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf08f50-1604-4bee-0bc4-08dcb862d902
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3539451e-b46e-4a26-a242-ff61502855c7;Ip=[103.243.227.16];Helo=[mail.kpit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6355
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 11:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111691

Modify the CMakeLists.txt to add an Option for
STATIC target, as available for shared library.

Link: https://github.com/facebook/rocksdb/pull/12890

Configure static library default to switched off
as shared libraries are sufficient in most cases.

Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
---
 .../files/static_library_as_option.patch      | 68 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb |  2 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/static_library_as_opt=
ion.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.pat=
ch b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
new file mode 100644
index 000000000..4162d1154
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
@@ -0,0 +1,68 @@
+From 285d306494bde3e9c24c8cd6fea1eb380a304d03 Mon Sep 17 00:00:00 2001
+From: Bindu-Bhabu <bindudaniel1996@gmail.com>
+Date: Fri, 26 Jul 2024 15:14:45 +0530
+Subject: Add option to CMake for building static libraries
+
+ROCKSDB creates a STATIC library target reference by default.
+Modify the cmake so that the STATIC library is also an option
+just like creating a SHARED library.
+
+Upstream-Status:Accepted
+Link: https://github.com/facebook/rocksdb/pull/12890
+
+Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
+Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
+---
+ CMakeLists.txt | 29 +++++++++++++++++------------
+ 1 file changed, 17 insertions(+), 12 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 93b884dd9c1..2ca925d505c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -919,6 +919,7 @@ set(ROCKSDB_STATIC_LIB rocksdb${ARTIFACT
+ set(ROCKSDB_SHARED_LIB rocksdb-shared${ARTIFACT_SUFFIX})
+
+ option(ROCKSDB_BUILD_SHARED "Build shared versions of the RocksDB librari=
es" ON)
++option(ROCKSDB_BUILD_STATIC "Build static versions of the RocksDB librari=
es" ON)
+
+ option(WITH_LIBRADOS "Build with librados" OFF)
+ if(WITH_LIBRADOS)
+@@ -938,9 +939,11 @@ else()
+   endif()
+ endif()
+
+-add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC})
+-target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE
+-  ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
++if(ROCKSDB_BUILD_STATIC)
++  add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC}=
)
++  target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE
++    ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
++endif()
+
+ if(ROCKSDB_BUILD_SHARED)
+   add_library(${ROCKSDB_SHARED_LIB} SHARED ${SOURCES} ${BUILD_VERSION_CC}=
)
+@@ -1238,13 +1241,15 @@ if(NOT WIN32 OR ROCKSDB_INSTALL_ON_WINDOWS)
+
+   install(DIRECTORY "${PROJECT_SOURCE_DIR}/cmake/modules" COMPONENT devel=
 DESTINATION ${package_config_destination})
+
+-  install(
+-    TARGETS ${ROCKSDB_STATIC_LIB}
+-    EXPORT RocksDBTargets
+-    COMPONENT devel
+-    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
+-    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
+-  )
++  if(ROCKSDB_BUILD_STATIC)
++    install(
++      TARGETS ${ROCKSDB_STATIC_LIB}
++      EXPORT RocksDBTargets
++      COMPONENT devel
++      ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++      INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
++    )
++  endif()
+
+   if(ROCKSDB_BUILD_SHARED)
+     install(
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipe=
s-dbs/rocksdb/rocksdb_6.20.3.bb
index 2ad2d38a5..4acf93439 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "git://github.com/facebook/${BPN}.git;branch=
=3D${SRCBRANCH};protocol=3Dhtt
            file://ppc64.patch \
            file://mips.patch \
            file://arm.patch \
+           file://static_library_as_option.patch \
           "

 SRC_URI:append:riscv32 =3D " file://0001-replace-old-sync-with-new-atomic-=
builtin-equivalents.patch"
@@ -44,6 +45,7 @@ EXTRA_OECMAKE =3D "\
     -DWITH_BENCHMARK_TOOLS=3DOFF \
     -DWITH_TOOLS=3DOFF \
     -DFAIL_ON_WARNINGS=3DOFF \
+    -DROCKSDB_BUILD_STATIC=3DOFF \
 "

 do_install:append() {
--
2.25.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

