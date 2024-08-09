Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBFCC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 11:07:05 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.82])
 by mx.groups.io with SMTP id smtpd.web10.81666.1723201620608630603
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 04:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=WfS1mhvY;
 spf=pass (domain: kpit.com, ip: 52.101.225.82, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGuU305YEbSR7i8hGhueaKLp3GYTyf/nNXJL4KifrSpdlOCUJbctO+SdsU4zeRKXJs+OVPhpFeksqRU3HaAcrOJmJuBbJuHkIWMtFh4U17x5SHD/ugoQ4GWIFgLd7DWFtjzeB3eLnDUcs2v0COmSoErdWOyGLDc2OnAoyWP4+8czEI91OK5YtCi1xF9OUctlLt91X4srwzzNcfM3JpU9e0ESy5E6gjdfzNyQwnxWEgA1kJkqnZ+pWRBsKNB32lJFCrMyiOn4NOfqPp2rlWiYIyVzoOheaogeeFcqxSLc+k0i2cTBu4Jb/GcmyNpxi8lN8nkj2aT/yPZM461wP/w46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1I5rhPpY/X5CJYrdIzOlcnnH8cHYJJCLgs50RB79Yls=;
 b=gphg0bbQ3H33ZYGSAGghu73UkzDJ86VVpZln+ZIqdNQhOwZsB9WcDjwDly7jcd4QkhF0c39Td6Q/4OZXNi3zyGWcUm2JSCXsD2o7FuyI+qrmOEg1o90EzBP5Fc9Q+Rvv1oLJe10N59CGIE6BCQqiaL7XZIOuIro+zfEbyqTnhM4IgRRoxAN7i+B0ADccV56J1MRXPjjIJxOP5Cqx0wTCogG2WcYojB9flNgcn+Uikm8H4q0urOVSeZWSE8xThs/4i0ySZ5TS3WwnFCNyJJMsxbgiXTjtDLHq1w/ii7Cl053vLAhklgVlXyqAT4HRayZhtc+2Gu9/wmMdvUvnWlRyGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 103.243.227.16) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=kpit.com; dmarc=fail (p=reject sp=none pct=100) action=oreject
 header.from=kpit.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1I5rhPpY/X5CJYrdIzOlcnnH8cHYJJCLgs50RB79Yls=;
 b=WfS1mhvYErSu2YlR9krK/RIlal+26jCX/8VrfQ2WIXzdOhVcfUgAtm34ZeAUUSMExyDdgHBU5+ubvpMY5exSIUaBhu6XB1pIq+hQR1i5zjFOftHZ7Kdo95UrMj0Keyv5Xzyz/MbsJTqf9slsGPoxaLVq29efzTJH+1XrFrWpRew=
Received: from PS2PR03CA0011.apcprd03.prod.outlook.com (2603:1096:300:5b::23)
 by MAZPR01MB9162.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.9; Fri, 9 Aug
 2024 11:06:47 +0000
Received: from HK2PEPF00006FAE.apcprd02.prod.outlook.com
 (2603:1096:300:5b:cafe::3a) by PS2PR03CA0011.outlook.office365.com
 (2603:1096:300:5b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.9 via Frontend
 Transport; Fri, 9 Aug 2024 11:06:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 103.243.227.16)
 smtp.mailfrom=kpit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=kpit.com;
Received-SPF: Fail (protection.outlook.com: domain of kpit.com does not
 designate 103.243.227.16 as permitted sender)
 receiver=protection.outlook.com; client-ip=103.243.227.16;
 helo=mail.kpit.com;
Received: from mail.kpit.com (103.243.227.16) by
 HK2PEPF00006FAE.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Fri, 9 Aug 2024 11:06:45 +0000
Received: from L-17494.kpit.com (10.30.140.23) by PH3EXCH01.kpit.com
 (10.52.16.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 9 Aug
 2024 16:36:32 +0530
From: Nikhil R <nikhil.r@kpit.com>
To: <openembedded-devel@lists.openembedded.org>, <bindu.bhabu@kpit.com>
Subject: [oe][scarthgap][master][PATCH] rocksdb: Add an option to set static library
Date: Fri, 9 Aug 2024 16:36:19 +0530
Message-ID: <20240809110619.25499-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.140.23]
X-ClientProxiedBy: PH3ExchFE01.kpit.com (10.52.16.111) To PH3EXCH01.kpit.com
 (10.52.16.25)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAE:EE_|MAZPR01MB9162:EE_
X-MS-Office365-Filtering-Correlation-Id: 766a5b10-ded2-4318-7391-08dcb8635b57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ybbwLoInpH/e26gmODBS6VLSIfSTVVS7aiUhiJmj0TAd4ZWzCdvpK9bDoSpN?=
 =?us-ascii?Q?o0x55o91GuDi6KawgJh50DUC97XwWA8bCBY373KI5hRkUqVK7ppISuSDqX5M?=
 =?us-ascii?Q?NUdn953xCHGAsFEYMCWc/OmUFsSbv7ba0HlKBmgdKv2eUgV7B67fr468UxQn?=
 =?us-ascii?Q?3rxQBC1UAOL7Byh8p9vo51MxjZItjQOyakNtT4OqCCAxeMb1IXnc8+D2Er29?=
 =?us-ascii?Q?jzK8jSa90cTadtdO/2wwxAsetVVp3sQvpP3QZZeypKUhz5587YeqI6s+g66y?=
 =?us-ascii?Q?gkotHuQoqyMHzLddoFyxBWRwb/vCoTBoJmiVIP1RYmYc/fbCl9qo3CJLIEgf?=
 =?us-ascii?Q?9XdZhDPG6EHdFqTrT657113p9KcWWFnsn2wwdSNy+4y8oIypAjuw8IckBZkh?=
 =?us-ascii?Q?GIeLA045YHoLtgdJPMttjFRL7/OWoGIbKcSghtVy3Q0650/uhGp8kbJn8CsE?=
 =?us-ascii?Q?IdCuD/ib1TVmEcFXzFY8VNLxKDBA8NJJzmSBvnVlrwv3sf4ijPqWDdkuNMOQ?=
 =?us-ascii?Q?B+Z6ljy9lMZm+wtBaxwwqlUhOPBTDVvZcHHqFFSXF8aC4lDaQFa5XPDwjRMC?=
 =?us-ascii?Q?xYOEQhiWRKUDx00gfsYbmWThrS/HPavgMzAkd56Eu85t9MYMzOgv/XoAekN9?=
 =?us-ascii?Q?zWMrVVu+f6Vfol2goPLDLIvZpU9sHjhTXLFFlCRgd9G7QRnbeB9fNlKQ2QbR?=
 =?us-ascii?Q?d5ev/Q9R/JeqnMGfvHC17zHOgl3JE1T9oNMA1lRMCdLvoKYh975Uz3v3tAmL?=
 =?us-ascii?Q?rsr0aVQUi7w4Y8kz0CM3Nz8TadSB0E3whB8GbV5/OUwU2JFT0QiWvzBmUGjT?=
 =?us-ascii?Q?znkulyybgeFkVWFftmcI3FTsIohvNRrQIvO3SsXuGM+VOg5Xwwunrrwr7LHY?=
 =?us-ascii?Q?HSF+4oV0cR318s1HmtlsMq3X7oOnvqsA3+ec6/3mw+Mpulu5h30+sjvnxGNg?=
 =?us-ascii?Q?h+vbuniyK3v1TN21slrH5JAlrU7NGMqZa9vCLY2JtPzchWZXajDokIDkgOnz?=
 =?us-ascii?Q?Q/eCa6QCeGD+jwvWGgCeKsuMLnpYGIoZSkTlSTdpt8sQ3l63jW/gFTIxPrfE?=
 =?us-ascii?Q?/tkx7VnLetuOXJeb0a4RkVieLqK92moIn/kokzYY+Z5tik53Ai8TkX1Dnzo9?=
 =?us-ascii?Q?vDmQAU/59qTbxMdEAjybJcGSi9a/QmDjzG+0kXLi/X0MMmGI+CeTvv9TQN/6?=
 =?us-ascii?Q?EsX8L2eeM1lMGwIrzy0yBRy931rlHkqTs5Gf2P9Gfz0EuN/brMty7IzaJp9n?=
 =?us-ascii?Q?hH+BG2hAbB6/zpo16gl5mK0bYeXWR2ikV0UIXlWsWDpRMh1SW9adtAKKoucy?=
 =?us-ascii?Q?d/duAoH4PQKwOTlDXShPbtkGsTAUqqWkmyneLfWELQGi1liFQE1yhSk7yK5m?=
 =?us-ascii?Q?m4EVWuCp7LqK7K2F/PhtnPpW7ePV?=
X-Forefront-Antispam-Report: 
	CIP:103.243.227.16;CTRY:IN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.kpit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 11:06:45.1623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 766a5b10-ded2-4318-7391-08dcb8635b57
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3539451e-b46e-4a26-a242-ff61502855c7;Ip=[103.243.227.16];Helo=[mail.kpit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK2PEPF00006FAE.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB9162
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 11:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111692

Modify the CMakeLists.txt to add an Option for
STATIC target import, as available for shared library.

Link: https://github.com/facebook/rocksdb/pull/12890

Configure static library default to switched off
as shared libraries are sufficient in most cases.

Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
---
 .../files/static_library_as_option.patch      | 72 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb  |  2 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/static_library_as_opt=
ion.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.pat=
ch b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
new file mode 100644
index 000000000..58914bd22
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
@@ -0,0 +1,72 @@
+From 285d306494bde3e9c24c8cd6fea1eb380a304d03 Mon Sep 17 00:00:00 2001
+From: Bindu-Bhabu <bindudaniel1996@gmail.com>
+Date: Fri, 26 Jul 2024 15:14:45 +0530
+Subject: Add option to CMake for building static libraries
+
+ROCKSDB creates a STATIC library target reference by default.
+Modify the cmake so that the STATIC library is also an option
+just like creating a SHARED library and set default to ON.
+
+Upstream-Status: Accepted
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
+@@ -98,6 +98,7 @@ if (WITH_WINDOWS_UTF8_FILENAMES)
+   add_definitions(-DROCKSDB_WINDOWS_UTF8_FILENAMES)
+ endif()
+ option(ROCKSDB_BUILD_SHARED "Build shared versions of the RocksDB librari=
es" ON)
++option(ROCKSDB_BUILD_STATIC "Build static versions of the RocksDB librari=
es" ON)
+
+ if( NOT DEFINED CMAKE_CXX_STANDARD )
+   set(CMAKE_CXX_STANDARD 17)
+@@ -1139,11 +1140,13 @@ string(REGEX REPLACE "[^0-9: /-]+" "" GIT_DATE "${=
GIT_DATE}")
+ set(BUILD_VERSION_CC ${CMAKE_BINARY_DIR}/build_version.cc)
+ configure_file(util/build_version.cc.in ${BUILD_VERSION_CC} @ONLY)
+
+-add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC})
+-target_include_directories(${ROCKSDB_STATIC_LIB} PUBLIC
+-  $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>)
+-target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE
+-  ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
++if(ROCKSDB_BUILD_STATIC)
++  add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC}=
)
++  target_include_directories(${ROCKSDB_STATIC_LIB} PUBLIC
++    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>)
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
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb b/meta-oe/recipes=
-dbs/rocksdb/rocksdb_9.0.0.bb
index 444351dbb..fae54fdba 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/facebook/${BPN}.git;branch=
=3D${SRCBRANCH};protocol=3Dhtt
            file://0005-Implement-timer-implementation-for-mips-platform.pa=
tch \
            file://0006-Implement-timer-for-arm-v6.patch \
            file://0007-Fix-declaration-scope-of-LE_LOAD32-in-crc32c.patch =
\
+           file://static_library_as_option.patch \
           "

 SRC_URI:append:riscv32 =3D " file://0001-replace-old-sync-with-new-atomic-=
builtin-equivalents.patch"
@@ -43,6 +44,7 @@ EXTRA_OECMAKE =3D "\
     -DWITH_BENCHMARK_TOOLS=3DOFF \
     -DWITH_TOOLS=3DOFF \
     -DFAIL_ON_WARNINGS=3DOFF \
+    -DROCKSDB_BUILD_STATIC=3DOFF \
 "

 CXXFLAGS +=3D "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH=
_NO_INLINE_HINTS', '', d)}"
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

