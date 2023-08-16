Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB47C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:55:15 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.152031.1692150909487876473
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="127723239"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="127723239"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:55:07 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 05328DDC66
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:55:05 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E9D3BF3CD
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:55:04 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 36E7E2007685C;
	Wed, 16 Aug 2023 10:55:03 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] yaml-cpp: upgrade 0.7.0 -> 0.8.0
Date: Wed, 16 Aug 2023 09:54:16 +0800
Message-Id: <1692150856-6228-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10--16.839000-10.000000
X-TMASE-MatchedRID: aIDvRctzImKjz0nOeth/ySrLqyE6Ur/jCZa9cSpBObl/iZ1aNsYG7v44
	pYPD16CL4K9FmervsqWmKaU7uZLa5se3wV6A2hch8t4fUUGeErTVy4hHC3/gyMC5DTEMxpeQB1e
	gkZdCJXdsXqCizdUSQ/iVXIDhJ9ZK+dVjQNaxOrfkKCFOKwAEzDYvC/PFFfSAFYgmMxsy40k6SI
	YaJ07sjxBUX5F1HACZGj6D26QZDjirofp7IohGwxqkhv3OdF4DMrX+p1uNztBASVmamJze2mlYX
	rGe71blkBbnzTdF4yeht2sn4wCqCZBmKwxzr+uEa87CDXaKRVKfmd9HsjZ0U4Ajsy+r+wvnO3ig
	RTX1/Yo1vel/vyUT9x6nlH/P8z5HbQDLI/Izaw2628cXbnOhT+Museq8CJLLclEZ0EDaOYjPq1A
	dLPc/QnpHVzsD2hOWj0RC7hmppJtKhwtBAyHbWFk1hIeTdmvR853YiZBxTIR1x0KuswXklM5vii
	fI31LdxgmzH/N5TxRhafan3Io4vU7x8xnBqoiCngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIqxB32
	o9eGclVaBFytIQUtw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104407

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-CMake-export-files-1077.patch
removed since it's included in 0.8.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Fix-CMake-export-files-1077.patch    | 117 ------------------
 .../{yaml-cpp_0.7.0.bb => yaml-cpp_0.8.0.bb}  |   3 +-
 2 files changed, 1 insertion(+), 119 deletions(-)
 delete mode 100644 meta-oe/recipes-support/yaml-cpp/yaml-cpp/0001-Fix-CMake-export-files-1077.patch
 rename meta-oe/recipes-support/yaml-cpp/{yaml-cpp_0.7.0.bb => yaml-cpp_0.8.0.bb} (84%)

diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp/0001-Fix-CMake-export-files-1077.patch b/meta-oe/recipes-support/yaml-cpp/yaml-cpp/0001-Fix-CMake-export-files-1077.patch
deleted file mode 100644
index b6c4a3b883..0000000000
--- a/meta-oe/recipes-support/yaml-cpp/yaml-cpp/0001-Fix-CMake-export-files-1077.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 3d436f6cfc2dfe52fc1533c01f57c25ae7ffac9c Mon Sep 17 00:00:00 2001
-From: Felix Schwitzer <flx107809@gmail.com>
-Date: Fri, 1 Apr 2022 05:26:47 +0200
-Subject: [PATCH] Fix CMake export files (#1077)
-
-After configuring the file `yaml-cpp-config.cmake.in`, the result ends up with
-empty variables.  (see also the discussion in #774).
-
-Rework this file and the call to `configure_package_config_file` according the
-cmake documentation
-(https://cmake.org/cmake/help/v3.22/module/CMakePackageConfigHelpers.html?highlight=configure_package_config#command:configure_package_config_file)
-to overcome this issue and allow a simple `find_package` after install.
-
-As there was some discussion about the place where to install the
-`yaml-cpp-config.cmake` file, e.g. #1055, factor out the install location into
-an extra variable to make it easier changing this location in the future.
-
-Also untabify CMakeLists.txt in some places to align with the other code parts in this file.
-
-Upstream-Status: Accepted [https://github.com/jbeder/yaml-cpp/pull/1077]
-
-Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu> 
----
- CMakeLists.txt           | 29 ++++++++++++++++++-----------
- yaml-cpp-config.cmake.in | 10 ++++++----
- 2 files changed, 24 insertions(+), 15 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b230b9e..983d1a4 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -127,10 +127,16 @@ set_target_properties(yaml-cpp PROPERTIES
-   PROJECT_LABEL "yaml-cpp ${yaml-cpp-label-postfix}"
-   DEBUG_POSTFIX "${CMAKE_DEBUG_POSTFIX}")
- 
-+# FIXME(felix2012): A more common place for the cmake export would be
-+# `CMAKE_INSTALL_LIBDIR`, as e.g. done in ubuntu or in this project for GTest
-+set(CONFIG_EXPORT_DIR "${CMAKE_INSTALL_DATADIR}/cmake/yaml-cpp")
-+set(EXPORT_TARGETS yaml-cpp)
- configure_package_config_file(
-   "${PROJECT_SOURCE_DIR}/yaml-cpp-config.cmake.in"
-   "${PROJECT_BINARY_DIR}/yaml-cpp-config.cmake"
--  INSTALL_DESTINATION "${CMAKE_INSTALL_DATADIR}/cmake/yaml-cpp")
-+  INSTALL_DESTINATION "${CONFIG_EXPORT_DIR}"
-+  PATH_VARS CMAKE_INSTALL_INCLUDEDIR CONFIG_EXPORT_DIR)
-+unset(EXPORT_TARGETS)
- 
- write_basic_package_version_file(
-   "${PROJECT_BINARY_DIR}/yaml-cpp-config-version.cmake"
-@@ -139,30 +145,31 @@ write_basic_package_version_file(
- configure_file(yaml-cpp.pc.in yaml-cpp.pc @ONLY)
- 
- if (YAML_CPP_INSTALL)
--	install(TARGETS yaml-cpp
-+  install(TARGETS yaml-cpp
-     EXPORT yaml-cpp-targets
-     RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-     ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
--	install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/
-+  install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/
-     DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
--		FILES_MATCHING PATTERN "*.h")
-+                FILES_MATCHING PATTERN "*.h")
-   install(EXPORT yaml-cpp-targets
--    DESTINATION "${CMAKE_INSTALL_DATADIR}/cmake/yaml-cpp")
--	install(FILES
--		"${PROJECT_BINARY_DIR}/yaml-cpp-config.cmake"
--		"${PROJECT_BINARY_DIR}/yaml-cpp-config-version.cmake"
--    DESTINATION "${CMAKE_INSTALL_DATADIR}/cmake/yaml-cpp")
-+    DESTINATION "${CONFIG_EXPORT_DIR}")
-+  install(FILES
-+      "${PROJECT_BINARY_DIR}/yaml-cpp-config.cmake"
-+      "${PROJECT_BINARY_DIR}/yaml-cpp-config-version.cmake"
-+    DESTINATION "${CONFIG_EXPORT_DIR}")
-   install(FILES "${PROJECT_BINARY_DIR}/yaml-cpp.pc"
-     DESTINATION ${CMAKE_INSTALL_DATADIR}/pkgconfig)
- endif()
-+unset(CONFIG_EXPORT_DIR)
- 
- if(YAML_CPP_BUILD_TESTS)
--	add_subdirectory(test)
-+  add_subdirectory(test)
- endif()
- 
- if(YAML_CPP_BUILD_TOOLS)
--	add_subdirectory(util)
-+  add_subdirectory(util)
- endif()
- 
- if (YAML_CPP_CLANG_FORMAT_EXE)
-diff --git a/yaml-cpp-config.cmake.in b/yaml-cpp-config.cmake.in
-index 7b41e3f..a7ace3d 100644
---- a/yaml-cpp-config.cmake.in
-+++ b/yaml-cpp-config.cmake.in
-@@ -3,12 +3,14 @@
- #  YAML_CPP_INCLUDE_DIR - include directory
- #  YAML_CPP_LIBRARIES    - libraries to link against
- 
--# Compute paths
--get_filename_component(YAML_CPP_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
--set(YAML_CPP_INCLUDE_DIR "@CONFIG_INCLUDE_DIRS@")
-+@PACKAGE_INIT@
-+
-+set_and_check(YAML_CPP_INCLUDE_DIR "@PACKAGE_CMAKE_INSTALL_INCLUDEDIR@")
- 
- # Our library dependencies (contains definitions for IMPORTED targets)
--include("${YAML_CPP_CMAKE_DIR}/yaml-cpp-targets.cmake")
-+include(@PACKAGE_CONFIG_EXPORT_DIR@/yaml-cpp-targets.cmake)
- 
- # These are IMPORTED targets created by yaml-cpp-targets.cmake
- set(YAML_CPP_LIBRARIES "@EXPORT_TARGETS@")
-+
-+check_required_components(@EXPORT_TARGETS@)
--- 
-2.39.2
-
diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
similarity index 84%
rename from meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
rename to meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
index e04d4705a4..44ac0687a7 100644
--- a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
+++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"
 # yaml-cpp releases are stored as archive files in github.
 # download the exact revision of release
 SRC_URI = "git://github.com/jbeder/yaml-cpp.git;branch=master;protocol=https"
-SRC_URI += "file://0001-Fix-CMake-export-files-1077.patch"
-SRCREV = "0579ae3d976091d7d664aa9d2527e0d0cff25763"
+SRCREV = "f7320141120f720aecc4c32be25586e7da9eb978"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


