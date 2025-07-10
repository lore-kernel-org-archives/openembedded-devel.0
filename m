Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350ECC83F18
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 07:51:32 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.3173.1752133888727538829
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 00:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout05.t-online.de (Postfix) with SMTP id 17F936D9
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 09:50:55 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.234.74]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uZm3N-2ocba50; Thu, 10 Jul 2025 09:50:50 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] x265: fix build with cmake 4
Date: Thu, 10 Jul 2025 09:50:42 +0200
Message-ID: <20250710075042.515930-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1752133850-607F650C-F9C1CC6D/0/0 CLEAN NORMAL
X-TOI-MSGID: f9b1d0fe-c0e9-4966-8250-62c4845b3050
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 07:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118398

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-x265-fix-build-with-cmake-4.patch    | 63 +++++++++++++++++++
 .../recipes-multimedia/x265/x265_4.1.bb       |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/x265/x265/0001-x26=
5-fix-build-with-cmake-4.patch

diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-b=
uild-with-cmake-4.patch b/meta-multimedia/recipes-multimedia/x265/x265/00=
01-x265-fix-build-with-cmake-4.patch
new file mode 100644
index 0000000000..f218fec5f7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-wi=
th-cmake-4.patch
@@ -0,0 +1,63 @@
+From de68f4d02946d588af6a0c21cf966288c40b039f Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 10 Jul 2025 09:04:27 +0200
+Subject: [PATCH] x265: fix build with cmake 4
+
+drop policies that have been removed in cmake 4 and allow to build
+with 4.0
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Submitted [https://github.com/videolan/x265/pull/17]
+---
+ source/CMakeLists.txt              | 8 +-------
+ source/dynamicHDR10/CMakeLists.txt | 4 ++--
+ 2 files changed, 3 insertions(+), 9 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5c6dda9e8..bd9e0f8d9 100755
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -6,18 +6,12 @@ if(NOT CMAKE_BUILD_TYPE)
+         FORCE)
+ endif()
+ message(STATUS "cmake version ${CMAKE_VERSION}")
+-if(POLICY CMP0025)
+-    cmake_policy(SET CMP0025 OLD) # report Apple's Clang as just Clang
+-endif()
+ if(POLICY CMP0042)
+     cmake_policy(SET CMP0042 NEW) # MACOSX_RPATH
+ endif()
+-if(POLICY CMP0054)
+-    cmake_policy(SET CMP0054 OLD) # Only interpret if() arguments as va=
riables or keywords when unquoted
+-endif()
+=20
+ project (x265)
+-cmake_minimum_required (VERSION 2.8.8) # OBJECT libraries require 2.8.8
++cmake_minimum_required (VERSION 2.8.8...4.0) # OBJECT libraries require=
 2.8.8
+ include(CheckIncludeFiles)
+ include(CheckFunctionExists)
+ include(CheckSymbolExists)
+diff --git a/dynamicHDR10/CMakeLists.txt b/dynamicHDR10/CMakeLists.txt
+index 22fb79d44..03c866b1f 100644
+--- a/dynamicHDR10/CMakeLists.txt
++++ b/dynamicHDR10/CMakeLists.txt
+@@ -10,7 +10,7 @@ add_library(dynamicHDR10 OBJECT
+     hdr10plus.h
+     api.cpp )
+=20
+-cmake_minimum_required (VERSION 2.8.11)
++cmake_minimum_required (VERSION 2.8.11...4.0)
+ project(dynamicHDR10)
+ include(CheckIncludeFiles)
+ include(CheckFunctionExists)
+@@ -150,4 +150,4 @@ set(BIN_INSTALL_DIR bin CACHE STRING "Install locati=
on of executables")
+ option(ENABLE_SHARED "Build shared library" OFF)
+=20
+ install(FILES hdr10plus.h DESTINATION include)
+-endif()
+\ No newline at end of file
++endif()
+--=20
+2.49.0
+
diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb b/meta-m=
ultimedia/recipes-multimedia/x265/x265_4.1.bb
index dedc3aa4d3..79dd99220e 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
@@ -11,6 +11,7 @@ DEPENDS =3D "nasm-native gnutls zlib libpcre numactl"
 SRC_URI =3D " \
     https://bitbucket.org/multicoreware/x265_git/downloads/x265_${PV}.ta=
r.gz \
     file://0001-json11.cpp-Include-cstdint.patch \
+    file://0001-x265-fix-build-with-cmake-4.patch \
 "
 SRC_URI[sha256sum] =3D "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5e=
bf8a4379d7af8f29"
 S =3D "${UNPACKDIR}/x265_${PV}/source"
--=20
2.49.0


