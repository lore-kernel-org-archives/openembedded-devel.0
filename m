Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CE4C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 09:35:03 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.82])
 by mx.groups.io with SMTP id smtpd.web11.42488.1723455295844130893
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 02:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=bMkpNtVQ;
 spf=pass (domain: kpit.com, ip: 52.101.225.82, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ds2Yt+Dh1ZOSe9RtKxwQ/UV8k6kGlYo5JN73uukCLyJnZXGwZAhOE5Z/NfJPM6Ao76BxWCd6xT3WMngldqMjXVT7n8oF9F9Y0aOZtcw3oJC3HFUQuUG8MXc1NCg3AmkkLdPoMUJ8Yzs5YJvqv/CLqoCXaaLf7NW7hLXM1WXXvczYzBY/7vDO3V0UsigL1T56fc/Faa8r3sGtpvaoP4uErD+45TKXJlY4jCmQ8kepnOIW/l3HZTLoRbYJFE4xRqPLbioveQrDL1BccT62TYqO/tW6apxO+OqdE4BISv4vcS+w2n8YsgwT6ES6mi8/SCza9e+46fXwuDjlkb+5H15FeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIEZ0gnrlsyC15Urbx0YoyV/t1gUQMQ/n/tv/cZGoJY=;
 b=AqXPH2tR6+6QuA7G3RwTC9Rg6AAKgsMkwMf8TmGsLbD0tDUNQduOkFTTOCPptkhrIrKb+gCdkCispy8jfCATgnIuUZhVh/qBLS9v9Fxms5NuUxSx4aQFa5aiGqXjv28jUvECtFef/dXZ0re4Z2JeLfyBmVnyhWMBx/8sfMizYG3hto+1IEUqG8WbdEdAGwABRKvbRnoWAsP4iOl6Yd/+OSN7Bkv3iIGNhbPsxLSSHlpCN918O/KAnWrjiEwOfgcGvsSdsX2Z03ObT0Jt7CPCMYYZoUNxX1abwzQGBCAUq15XxjE9PtpkuQtXH4V4dw/Dx/JWqWiCwfes+M6pF9kJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 103.243.227.16) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=kpit.com; dmarc=fail (p=reject sp=none pct=100) action=oreject
 header.from=kpit.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIEZ0gnrlsyC15Urbx0YoyV/t1gUQMQ/n/tv/cZGoJY=;
 b=bMkpNtVQsPqNSSVfWpp4BtAUhAU2Wo+yKL5/wAlckSRbYhBJNLDPo7BB/ApREz9y9KDjMUBOdu6HhXlRs8rq/vj0WTmLre0z1jpLpJL1Q5X/owAAnpaungT3sAcymYL5qNkLfXD0d74FcSFcA6qUVsOBsJHlyTJJ79FYbFEBf6I=
Received: from SG2PR02CA0081.apcprd02.prod.outlook.com (2603:1096:4:90::21) by
 PN3PR01MB9357.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.9; Mon, 12 Aug 2024 09:34:47 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:4:90:cafe::8) by SG2PR02CA0081.outlook.office365.com
 (2603:1096:4:90::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20 via Frontend
 Transport; Mon, 12 Aug 2024 09:34:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 103.243.227.16)
 smtp.mailfrom=kpit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=kpit.com;
Received-SPF: Fail (protection.outlook.com: domain of kpit.com does not
 designate 103.243.227.16 as permitted sender)
 receiver=protection.outlook.com; client-ip=103.243.227.16;
 helo=mail.kpit.com;
Received: from mail.kpit.com (103.243.227.16) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 09:34:46 +0000
Received: from L-17494.kpit.com (10.30.140.23) by PH3EXCH01.kpit.com
 (10.52.16.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 12 Aug
 2024 15:04:41 +0530
From: Nikhil R <nikhil.r@kpit.com>
To: <openembedded-devel@lists.openembedded.org>, <bindu.bhabu@kpit.com>
Subject: [oe][kirkstone][PATCH v2] rocksdb: Add an option to set static library
Date: Mon, 12 Aug 2024 15:04:24 +0530
Message-ID: <20240812093424.88800-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.140.23]
X-ClientProxiedBy: PH3ExchFE01.kpit.com (10.52.16.111) To PH3EXCH01.kpit.com
 (10.52.16.25)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|PN3PR01MB9357:EE_
X-MS-Office365-Filtering-Correlation-Id: a42f397b-391f-40ab-d9b3-08dcbab200f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NFZl6WC054hioWvgC+KmvuFJjmjW6TtluukNXS6ainu8uCjQ1QTezYdBiUHN?=
 =?us-ascii?Q?MxMJIV6wAruNA9+KGSv5yl294K2jKh69H1MBkmXjxYv7hMUGJFmER8ufGve/?=
 =?us-ascii?Q?vSAr6XujTnP2CzGxMR6jAKo7QQ8wkFEBQ8r/WJDpXfeUZyW4EhDv/BhT2WY2?=
 =?us-ascii?Q?AkSKhARuwCtFR0rIoy4sWa0Q+grbiVY2FrLlcTCiDe8zKjVQ5WHtDxcyHV8V?=
 =?us-ascii?Q?tHrp8cYAIohlpk5yNXCAzMJXEg4c4/rsxYS3Bxx4iur0hk+tdIaOCU7WmWJG?=
 =?us-ascii?Q?vt2aFMlcPCXqfIlOxxoaZ5iGRkejKrk2CWLG4LikdUh2c0x/re5VAQw/NmK2?=
 =?us-ascii?Q?L2CzfQQqpg2ZshinHBhagLtGe48PsnXDO1hscqpcl6gnhlwanjHNgndDW+ss?=
 =?us-ascii?Q?jw6IpmMeqW5Sz5iXiqsDgGrVSFbJjRE01vTDSXPgZoDBQgRQ5M6kotyY0HPx?=
 =?us-ascii?Q?VM9UzWXGkwW4ANZDngZTPehmkfnHm3vULv6YIVYPQVL5SEgWGigHL5JCD6br?=
 =?us-ascii?Q?Ecuq4kS6jUIYKGSY3JDToCnn26mcEc9iL8C4lmXSOeBBpN0C6Ylri7kN48cq?=
 =?us-ascii?Q?+p0NadXne3y6wZMWgeYlJxf7A2KLGAB4uh3fhEyGRoY/qyV7Xxg96dv5C0Sm?=
 =?us-ascii?Q?JqXzQEq9RbYTI6Nku1auNNwfJpwXaXxUb4hrUBUca1+phEQAh94iOo48DD+l?=
 =?us-ascii?Q?0UIY0ZGIY4QUgpmhqNhs7lmjRgoAiNHU802hyJK2GU6cqC6MKlHcVekhP9Z9?=
 =?us-ascii?Q?w0W02sxRWDsNNB0OqsGnrooyDj1a9++M9S/OAoQVVQDCmpznDIyRfo6W5wy+?=
 =?us-ascii?Q?jr5rYCiL3RPzq0Al3PR02CjpmGhdnArROdYFaTEhQzng8syh7kRQ6UlSW3q7?=
 =?us-ascii?Q?8gVDiuyZ3dCvCvY/m511rR4niOoSsdsoFjaj67XEjg2NZ7KJ5D/8Rii2CWLb?=
 =?us-ascii?Q?OIWQw2P7KReGz543PoU4naod/j3Pucyc+didrkWQB5GklX7j/HjwApiYfmCC?=
 =?us-ascii?Q?eevQneZj2Y9h1JDhWivnjg1pLl3ZP1x5KVNsVOcWpi2TkYLvuA7PfMogvHeK?=
 =?us-ascii?Q?ILTUfmN3CuhBHFsm9E82C8i+Gx/TCAk/wqommnVXqq4j/ujjPeW/OV3AghHo?=
 =?us-ascii?Q?4ZTGOuc2dfc90alO/m40nD2s7dgiOC2SAxQAZYHLKTr0GpfOazHvRUwjg14q?=
 =?us-ascii?Q?CO6KQJC8KbsDJgeTxtnUynMdjt8Ltkx3PBJrFmRmeW5l8NtqF0a/yuEcZt7x?=
 =?us-ascii?Q?ZUiTCeDEu/h/4VxIxy1XUbjiqWgaCxxbFX3O7d4GSPqXAy2irpSeh03GTaKq?=
 =?us-ascii?Q?wHkBYMjzUVrEb6PfhjKVL7azLGlyjdwO95vEwwNU43luySyXD7dYq1nxAOTX?=
 =?us-ascii?Q?Js3MSHNyrfCfWkWkJCUqEl6h0zulCTGKMatKJZlU/QpZmzxyNg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:103.243.227.16;CTRY:IN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.kpit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 09:34:46.1927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a42f397b-391f-40ab-d9b3-08dcbab200f8
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3539451e-b46e-4a26-a242-ff61502855c7;Ip=[103.243.227.16];Helo=[mail.kpit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9357
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 09:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111767

Modify the CMakeLists.txt to add an Option for
STATIC target, as available for shared library.

Link: https://github.com/facebook/rocksdb/pull/12890

Configure static library default to switched off
as shared libraries are sufficient in most cases.

Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
---
 .../files/static_library_as_option.patch      | 67 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb |  2 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/static_library_as_opt=
ion.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.pat=
ch b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
new file mode 100644
index 000000000..3bdf151a0
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
@@ -0,0 +1,67 @@
+From 285d306494bde3e9c24c8cd6fea1eb380a304d03 Mon Sep 17 00:00:00 2001
+From: Bindu-Bhabu <bindudaniel1996@gmail.com>
+Date: Fri, 26 Jul 2024 15:14:45 +0530
+Subject: Add option to CMake for building static libraries
+
+ROCKSDB creates a STATIC library target reference by default.
+Modify the cmake so that the STATIC library is also an option
+just like creating a SHARED library.
+
+Upstream-Status: Submitted[https://github.com/facebook/rocksdb/pull/12890]
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

