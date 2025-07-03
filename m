Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99B1C83030
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 11:22:45 +0000 (UTC)
Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web11.20016.1751541755439539156
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 04:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=SyQXVVjr;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=2724bd385=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751541755; x=1783077755;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C3TuI1BYdPH0orGo4kiq+yunpkpc2J6srR0q1MXDx1s=;
  b=SyQXVVjrDyOvOnuShFV8PvXvpzyvLKSOcnEofur/WG59xJprEJSwcsdn
   iWlR8zgZDskXhIx2gNLNWyA7LJL11u7WQMSEK1y8JD7TiLqOpdDVxG+nz
   CGR9SFDPQGtuRViauKeDpoe4F9VS7BT+Vb7J5zLMYdA+54Dejn3sxaysQ
   k=;
X-CSE-ConnectionGUID: qNWc0PuZTzy0wX7Hgwi2Fg==
X-CSE-MsgGUID: VI+QFA7+RG6cU4tx6+NVQQ==
Received: from 160.46.252.35.spf.bmwgroup.com.bmwgroup.com (HELO esagw3.muc)
 ([160.46.252.35]) by esa2.hc324-48.eu.iphmx.com with ESMTP/TLS;
 03 Jul 2025 13:22:32 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw3.muc with ESMTP/TLS;
 03 Jul 2025 13:22:32 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 03 Jul 2025 13:22:33 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.201) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Thu, 3 Jul 2025 13:22:32 +0200
X-CSE-ConnectionGUID: vietAChKTeykC3AU/Y1yTA==
X-CSE-MsgGUID: WKSX72VFR7y0UM+UgWya3g==
X-CSE-ConnectionGUID: 9ji/BFFVRzOb2JlEgf1irQ==
X-CSE-MsgGUID: fwCmgJz4TdCH/nVV2jf+bA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, <antonin.godard@bootlin.com>,
	<alex.kanavin@gmail.com>
Subject: [meta-oe][PATCH] libftdi: Backport patches to support builds with CMake 4+
Date: Thu, 3 Jul 2025 13:22:02 +0200
Message-ID: <20250703112202.3112387-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP09H.europe.bmw.corp (2a03:1e80:a15:58f::1:25) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 11:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118222

The commits have been merged upstream, but there hasn't been a release
containing them yet (last upstream release was years ago). Pulling them in
unblocks builds with CMake 4+ in the context of a patch series bumping CMake to
4.0.3 in openembedded-core (see [0]).

[0]: https://lists.openembedded.org/g/openembedded-core/topic/113946576

CC: antonin.godard@bootlin.com
CC: alex.kanavin@gmail.com
Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...e-minimal-required-version-to-2.8.12.patch | 86 +++++++++++++++++++
 ...ake-require-2.8.12-for-cmake_example.patch | 24 ++++++
 ...-the-minimal-required-version-to-3.5.patch | 34 ++++++++
 .../recipes-support/libftdi/libftdi_1.5.bb    |  3 +
 4 files changed, 147 insertions(+)
 create mode 100644 meta-oe/recipes-support/libftdi/files/0001-CMake-bump-the-minimal-required-version-to-2.8.12.patch
 create mode 100644 meta-oe/recipes-support/libftdi/files/0002-CMake-require-2.8.12-for-cmake_example.patch
 create mode 100644 meta-oe/recipes-support/libftdi/files/0003-CMake-bump-the-minimal-required-version-to-3.5.patch

diff --git a/meta-oe/recipes-support/libftdi/files/0001-CMake-bump-the-minimal-required-version-to-2.8.12.patch b/meta-oe/recipes-support/libftdi/files/0001-CMake-bump-the-minimal-required-version-to-2.8.12.patch
new file mode 100644
index 0000000000..544ea00c35
--- /dev/null
+++ b/meta-oe/recipes-support/libftdi/files/0001-CMake-bump-the-minimal-required-version-to-2.8.12.patch
@@ -0,0 +1,86 @@
+From 9b1419d46b156c3c61d30e761ee3636431187cc0 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 1 Aug 2023 11:53:35 +0200
+Subject: [PATCH] CMake: bump the minimal required version to 2.8.12
+
+The older CMake versions are deprecated.
+
+Remove support for CMake code compatible with CMake older than 2.8.8.
+
+Also move cmake_minimum_required() command before the project()
+command invocation.
+
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+Upstream-Status: Backport [3861e7dc9e83f2f6ff4e1579cf3bbf63a6827105]
+---
+ CMakeLists.txt | 46 +++++++++++++++++++++-------------------------
+ 1 file changed, 21 insertions(+), 25 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3b0b87c..41ddf58 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,3 +1,5 @@
++cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
++
+ # Project
+ project(libftdi1 C)
+ set(MAJOR_VERSION 1)
+@@ -12,7 +14,6 @@ if("${CMAKE_BUILD_TYPE}" STREQUAL "")
+    set(CMAKE_BUILD_TYPE     RelWithDebInfo)
+ endif("${CMAKE_BUILD_TYPE}" STREQUAL "")
+ set(CMAKE_COLOR_MAKEFILE ON)
+-cmake_minimum_required(VERSION 2.6 FATAL_ERROR)
+ 
+ add_definitions(-Wall)
+ 
+@@ -202,30 +203,25 @@ set ( LIBFTDI_VERSION_MINOR ${MINOR_VERSION} )
+ 
+ set ( LIBFTDI_USE_FILE ${CMAKE_INSTALL_PREFIX}/${LIBFTDI_CMAKE_CONFIG_DIR}/UseLibFTDI1.cmake )
+ 
+-if(CMAKE_VERSION VERSION_LESS 2.8.8) 
+-  configure_file ( cmake/LibFTDI1Config.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/LibFTDI1Config.cmake @ONLY )
+-  configure_file ( cmake/LibFTDI1ConfigVersion.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/LibFTDI1ConfigVersion.cmake @ONLY )
+-else ()
+-  include(CMakePackageConfigHelpers)
+-
+-  configure_package_config_file (
+-    cmake/LibFTDI1Config.cmake.in
+-    ${CMAKE_CURRENT_BINARY_DIR}/LibFTDI1Config.cmake
+-    INSTALL_DESTINATION ${LIBFTDI_CMAKE_CONFIG_DIR}
+-    PATH_VARS
+-      LIBFTDI_USE_FILE
+-      LIBFTDI_ROOT_DIR
+-      LIBFTDI_INCLUDE_DIR
+-      LIBFTDI_INCLUDE_DIRS
+-      LIBFTDI_LIBRARY_DIRS
+-    NO_CHECK_REQUIRED_COMPONENTS_MACRO
+-  )
+-  write_basic_package_version_file (
+-    LibFTDI1ConfigVersion.cmake 
+-    VERSION ${LIBFTDI_VERSION_STRING} 
+-    COMPATIBILITY AnyNewerVersion
+-  )
+-endif ()
++include(CMakePackageConfigHelpers)
++
++configure_package_config_file (
++  cmake/LibFTDI1Config.cmake.in
++  ${CMAKE_CURRENT_BINARY_DIR}/LibFTDI1Config.cmake
++  INSTALL_DESTINATION ${LIBFTDI_CMAKE_CONFIG_DIR}
++  PATH_VARS
++    LIBFTDI_USE_FILE
++    LIBFTDI_ROOT_DIR
++    LIBFTDI_INCLUDE_DIR
++    LIBFTDI_INCLUDE_DIRS
++    LIBFTDI_LIBRARY_DIRS
++  NO_CHECK_REQUIRED_COMPONENTS_MACRO
++)
++write_basic_package_version_file (
++  LibFTDI1ConfigVersion.cmake
++  VERSION ${LIBFTDI_VERSION_STRING}
++  COMPATIBILITY AnyNewerVersion
++)
+ 
+ 
+ install ( FILES 
diff --git a/meta-oe/recipes-support/libftdi/files/0002-CMake-require-2.8.12-for-cmake_example.patch b/meta-oe/recipes-support/libftdi/files/0002-CMake-require-2.8.12-for-cmake_example.patch
new file mode 100644
index 0000000000..a31a67df88
--- /dev/null
+++ b/meta-oe/recipes-support/libftdi/files/0002-CMake-require-2.8.12-for-cmake_example.patch
@@ -0,0 +1,24 @@
+From 579c08ec00d7cfd72071a86c67fb3b3c5fec5a9e Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Thu, 31 Aug 2023 09:23:29 +0200
+Subject: [PATCH] CMake: require 2.8.12 for cmake_example
+
+Make CMake minimal version requirement consistent for the entire
+project.
+
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+Upstream-Status: Backport [61a6bac98bbac623fb33b6153a063b6436f84721]
+---
+ examples/cmake_example/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/cmake_example/CMakeLists.txt b/examples/cmake_example/CMakeLists.txt
+index fe203ed..264752d 100644
+--- a/examples/cmake_example/CMakeLists.txt
++++ b/examples/cmake_example/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required ( VERSION 2.8 )
++cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
+ 
+ project ( example C )
+ 
diff --git a/meta-oe/recipes-support/libftdi/files/0003-CMake-bump-the-minimal-required-version-to-3.5.patch b/meta-oe/recipes-support/libftdi/files/0003-CMake-bump-the-minimal-required-version-to-3.5.patch
new file mode 100644
index 0000000000..b541cb69f4
--- /dev/null
+++ b/meta-oe/recipes-support/libftdi/files/0003-CMake-bump-the-minimal-required-version-to-3.5.patch
@@ -0,0 +1,34 @@
+From e6d18a015907b22345bf8994110f68f0609949a9 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 12 Dec 2023 14:20:36 +0100
+Subject: [PATCH] CMake: bump the minimal required version to 3.5
+
+Older CMake versions are treated as deprecated.
+
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+Upstream-Status: Backport [de9f01ece34d2fe6e842e0250a38f4b16eda2429]
+---
+ CMakeLists.txt                        | 2 +-
+ examples/cmake_example/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 41ddf58..c37887b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
++cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
+ 
+ # Project
+ project(libftdi1 C)
+diff --git a/examples/cmake_example/CMakeLists.txt b/examples/cmake_example/CMakeLists.txt
+index 264752d..cbdd2e4 100644
+--- a/examples/cmake_example/CMakeLists.txt
++++ b/examples/cmake_example/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
++cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
+ 
+ project ( example C )
+ 
diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
index 8c30eca0e7..6faab82ad5 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
@@ -14,6 +14,9 @@ DEPENDS = "libusb1 python3 swig-native"
 SRC_URI = "\
     http://www.intra2net.com/en/developer/${BPN}/download/${BPN}1-${PV}.tar.bz2 \
     file://CMakeLists-txt-fix-paths-when-FTDIPP-is-set.patch \
+    file://0001-CMake-bump-the-minimal-required-version-to-2.8.12.patch \
+    file://0002-CMake-require-2.8.12-for-cmake_example.patch \
+    file://0003-CMake-bump-the-minimal-required-version-to-3.5.patch \
 "
 SRC_URI[sha256sum] = "7c7091e9c86196148bd41177b4590dccb1510bfe6cea5bf7407ff194482eb049"
 

