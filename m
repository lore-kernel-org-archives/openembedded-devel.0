Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51092C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 09:21:03 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.101])
 by mx.groups.io with SMTP id smtpd.web11.42345.1723454461623142400
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 02:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=FdSYXkZ6;
 spf=pass (domain: kpit.com, ip: 40.107.57.101, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvXM6IJQiw7o1gBRnl0Cs4JnH/qSMlMfcgbBOFqXPtRL08GYXGYRl0SzwOmNg/icCTiq8UXST1GzgjNJw3lnNvSThRSnkd2trUBH24CrIk7HWxIBsbwPqEGDy6go6HzFltFNKYouE/ZFeDAHBaYMZRqhfXZK2VYFC8br9RY0zpkNWMMQF/EcdzW/wp5QJWf2J0COlyKOXxPZqFB08UY+LZCxK9On9C5EUXvMcmMr/ogZ4fbFQCRvDEO2bFBODnuTEVvdk3rMutFFc/3yaKB1FCTGLjsGMDWGg5uE2n0gEz3OmZr9twxaZVF5e4HOciP3wRCS1Smbhwbn2EmusYPh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLYU/dXP0W+Q+4IVs/clE8HCj78OlcY3+u+BjVqweiw=;
 b=FUov/dXYbx14vDjaeo3JQqFWxCAPrvyJjszunObVG9HpOnwt1Wym7qFOjFsVWU+eksv+Qz7gFzcmFQRlG4kNjsJ+7vyDrZI1v+MfDo8OCZP6mKugQsVYqACWqPW765JQKN5G2SGUZ6vi3OdKH+JUrfi0WUQjDJUJW0a1kv705DoVjggM9BdtuFW2itHdsFcj5NfyRGQFwURbI2qVDLSEbTjmYwehV8IKj0lafrXxjWHNdSQFp5fyFNnsySF1Zrafuticy1JFn+K3A9DdaZMcZpLXur4J5xAD2AD2urXhQ80yK7aEhudfEq6n4aZvyqLgMbYuIaEkJdnBp9N3GWqbRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 103.243.227.16) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=kpit.com; dmarc=fail (p=reject sp=none pct=100) action=oreject
 header.from=kpit.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLYU/dXP0W+Q+4IVs/clE8HCj78OlcY3+u+BjVqweiw=;
 b=FdSYXkZ6cqpvywObJJVcVR87WDpEUn1czbMX+aDvWAyrnVImakHXSrlTrVGB+VZzvsPk6dl6sOOs8PJkNtNXXr74j3J1HMx2Jas8bJ/5KwHiZSY6qTU6Q3fBalcUFyKZGSishsoedQlfHADOcGL3fM32U0mfnBt0m8qYiQ7lONE=
Received: from SG3P274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::14) by
 PN3PR01MB7320.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8b::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.13; Mon, 12 Aug 2024 09:20:51 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:be:cafe::54) by SG3P274CA0002.outlook.office365.com
 (2603:1096:4:be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20 via Frontend
 Transport; Mon, 12 Aug 2024 09:20:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 103.243.227.16)
 smtp.mailfrom=kpit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=kpit.com;
Received-SPF: Fail (protection.outlook.com: domain of kpit.com does not
 designate 103.243.227.16 as permitted sender)
 receiver=protection.outlook.com; client-ip=103.243.227.16;
 helo=mail.kpit.com;
Received: from mail.kpit.com (103.243.227.16) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 09:20:48 +0000
Received: from L-17494.kpit.com (10.30.140.23) by PH3EXCH01.kpit.com
 (10.52.16.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 12 Aug
 2024 14:50:47 +0530
From: Nikhil R <nikhil.r@kpit.com>
To: <openembedded-devel@lists.openembedded.org>, <bindu.bhabu@kpit.com>
Subject: [oe][scarthgap][master][PATCH v2] rocksdb: Add an option to set static library
Date: Mon, 12 Aug 2024 14:50:28 +0530
Message-ID: <20240812092028.86741-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.140.23]
X-ClientProxiedBy: PH3ExchFE01.kpit.com (10.52.16.111) To PH3EXCH01.kpit.com
 (10.52.16.25)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|PN3PR01MB7320:EE_
X-MS-Office365-Filtering-Correlation-Id: 6260f509-13d9-4940-47e7-08dcbab00dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ok07WTIhMwOTSlVc8QY2QrlFC/wMVHw8ZjNR9FhivFTdjAUb2RSETi7hsXbb?=
 =?us-ascii?Q?JvsKVlQz3Lim8gyGFG1varvNnvOeNKR0viA/N9lJqoJUQlu1FvhVq4EnCEO/?=
 =?us-ascii?Q?peCY8afiN2P5lQ6SY7d57K8wsuNA6cGcVjorIJPTYQUAe4/0OZG02LuwhNU0?=
 =?us-ascii?Q?2Mo2bET6nioZyXhSUGHJstfZTpAmOsKloU7KfOS4iswwb1+aKZ052o+JQ9MI?=
 =?us-ascii?Q?Sq7horzK3vq4+FU72+ClCELR3uPOs4sN66dKH5rniTWEBpEuPfFN6fvLTAjY?=
 =?us-ascii?Q?qQhXXk0batQS248L0Gts5e7w+MPU76WU3Y5PATcQ7q/W/slJUg1gKuWFW6JW?=
 =?us-ascii?Q?RReb/DKc0HOG5qDW+132ljXmKnOnusmo9iL7EuBYgcOgT3Hs5Y4cgvCY0zpP?=
 =?us-ascii?Q?1iRqb7nGf+LmHciHEH0vUy+eNMTFyBOoNwlnXFRDkfAfXWEsSDXGhfuKhNtg?=
 =?us-ascii?Q?EFLrfgmvNncaj0+kGkAHs8zjKqk5Vbi+tw3OV2c5pNDf6wrZbbtjK0XRTqNv?=
 =?us-ascii?Q?Kq+PkpPH6aR7fXBYmHpMqfifHNKWiQZ3Yr8eCNobQED7Sn5kodRfvI+w3Fhc?=
 =?us-ascii?Q?MmS0J6u9PpRlSfaJBt3JipYtj+D2T5I/Q9r3L+nizpIc8e+ubJlbBG5jqvRh?=
 =?us-ascii?Q?h2xGjqYb3fAsim1zuJGFMD5UKnlIRT8iQBSqWj10tibl0sDtoKc0117Z2mCg?=
 =?us-ascii?Q?KUON7aZ93JVIlxYC1RZM/nK9LZftru0Fm62rV/9l69cHoW0keMynU4zqceSA?=
 =?us-ascii?Q?z+Udt7TP4tVh047pHG5K9RPUGeljc1b9/k/c+oPW+pJi9019VFq1zTzUl8ci?=
 =?us-ascii?Q?RK9IF7STtCgwKqqgm4Ed8na80uOfAqLQ2Ufc0yXsTwnDzoRcWpsrYBob0YxO?=
 =?us-ascii?Q?6N73TM8dSuxAvEs/Qb7juSXaXoJpKbCoHF26vEK8ogLDgiqsnPtYzIDK6whf?=
 =?us-ascii?Q?y2enHtRNDsSvtRnJAVPJR/04UN/PDajWfEwqIDOqpsXRsq2LTtf9xTvb/mqS?=
 =?us-ascii?Q?Ck+sZk0EPUY72DojGZnk8KshAA+U7BiNmmxjVvZ3t98TycVIH9NRjMpfUbwN?=
 =?us-ascii?Q?7XbtEgj4DTytSpobKwwNSDSjVdYS1tFER6GDC6tZ68Tc4p32AC1F1piqoJ6F?=
 =?us-ascii?Q?2cuGP25JSXDijY38nGRfbKmDg/EUEZGYJxGv5iYoyb3aY+rn2CA8sMezqF41?=
 =?us-ascii?Q?Euaan9JpvDL1fArcg7B6PLY4a12ft+q0IIYEXOCBl+g9d6dnqpQuBBnGQrXY?=
 =?us-ascii?Q?+aQDxqboscMQlhvAcq5hHDD8w1JLwE0sbKfiRAySEOSIc3K8YjRgvZmmsqXi?=
 =?us-ascii?Q?i1jvYeoETRT2bL5ZpoZuaXGkuo27dl37MC7OKUtX0t+Cvd6ykXHqU0+ztUKA?=
 =?us-ascii?Q?lUku2Tq2kizo48J5wUG3hEj3m094m3eg5gehTQfGSWx4MYHAdg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:103.243.227.16;CTRY:IN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.kpit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 09:20:48.6954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6260f509-13d9-4940-47e7-08dcbab00dcb
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3539451e-b46e-4a26-a242-ff61502855c7;Ip=[103.243.227.16];Helo=[mail.kpit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7320
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 09:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111766

Modify the CMakeLists.txt to add an Option for
STATIC target import, as available for shared library.

Link: https://github.com/facebook/rocksdb/pull/12890

Configure static library default to switched off
as shared libraries are sufficient in most cases.

Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
---
 .../files/static_library_as_option.patch      | 71 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb  |  2 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/static_library_as_opt=
ion.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.pat=
ch b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
new file mode 100644
index 000000000..cef551626
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
@@ -0,0 +1,71 @@
+From 285d306494bde3e9c24c8cd6fea1eb380a304d03 Mon Sep 17 00:00:00 2001
+From: Bindu-Bhabu <bindudaniel1996@gmail.com>
+Date: Fri, 26 Jul 2024 15:14:45 +0530
+Subject: Add option to CMake for building static libraries
+
+ROCKSDB creates a STATIC library target reference by default.
+Modify the cmake so that the STATIC library is also an option
+just like creating a SHARED library and set default to ON.
+
+Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/12890=
]
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

