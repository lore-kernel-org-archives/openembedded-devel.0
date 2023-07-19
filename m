Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E57C001DC
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 10:53:35 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.101])
 by mx.groups.io with SMTP id smtpd.web11.11016.1689764008305433387
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jul 2023 03:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=jnj3mbYu;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.101, mailfrom: jasper@fancydomain.eu)
From: Jasper Orschulko <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1689764006;
	bh=NhWGdqECqBmZORoYyHsUfZfplTDhxKi7OIque6DKxNk=;
	h=From:To:Cc:Subject;
	b=jnj3mbYusdPJ5RWuGaBsPTG7vGZb06LkfXqnaU9m9lFiHhoQzA/IO52MjbdVCzEkO
	 yCut6JwLPiWkVRTv0MYXf9Kpdhjh/5ygfNW0aofjHMfEsoN/ZE3yxgNg5ulHM4p6Ye
	 /tbCuP/RNVXj6wYcBTX4CZyzIRt+VzUFN+78Qo8OANdThAMLxsIM86lL2ErC8ulyzT
	 GmymydUjGj3qSVNrQkf8PhjoLaai2gW+z/hBzhtAvlnwWgyZCfH1JODGxQmdnjjvvT
	 /vl71juLOgVsfe4ErNuR1Amv55MO98//8/yBPjfIeH8J9Xt4vKI1qt+krA8wCqRhwT
	 WizEzfwx17ZsQ==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-oe][kirkstone][PATCH v2] yaml-cpp: Fix cmake export
Date: Wed, 19 Jul 2023 12:52:09 +0200
Message-ID: <20230719105209.18489-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jul 2023 10:53:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103963

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 .../0001-Fix-CMake-export-files-1077.patch    | 117 ++++++++++++++++++
 .../yaml-cpp/yaml-cpp_0.7.0.bb                |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta-oe/recipes-support/yaml-cpp/yaml-cpp/0001-Fix-CM=
ake-export-files-1077.patch

diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp/0001-Fix-CMake-exp=
ort-files-1077.patch b/meta-oe/recipes-support/yaml-cpp/yaml-cpp/0001-Fix=
-CMake-export-files-1077.patch
new file mode 100644
index 000000000..b6c4a3b88
--- /dev/null
+++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp/0001-Fix-CMake-export-fil=
es-1077.patch
@@ -0,0 +1,117 @@
+From 3d436f6cfc2dfe52fc1533c01f57c25ae7ffac9c Mon Sep 17 00:00:00 2001
+From: Felix Schwitzer <flx107809@gmail.com>
+Date: Fri, 1 Apr 2022 05:26:47 +0200
+Subject: [PATCH] Fix CMake export files (#1077)
+
+After configuring the file `yaml-cpp-config.cmake.in`, the result ends u=
p with
+empty variables.  (see also the discussion in #774).
+
+Rework this file and the call to `configure_package_config_file` accordi=
ng the
+cmake documentation
+(https://cmake.org/cmake/help/v3.22/module/CMakePackageConfigHelpers.htm=
l?highlight=3Dconfigure_package_config#command:configure_package_config_f=
ile)
+to overcome this issue and allow a simple `find_package` after install.
+
+As there was some discussion about the place where to install the
+`yaml-cpp-config.cmake` file, e.g. #1055, factor out the install locatio=
n into
+an extra variable to make it easier changing this location in the future=
.
+
+Also untabify CMakeLists.txt in some places to align with the other code=
 parts in this file.
+
+Upstream-Status: Accepted [https://github.com/jbeder/yaml-cpp/pull/1077]
+
+Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>=20
+---
+ CMakeLists.txt           | 29 ++++++++++++++++++-----------
+ yaml-cpp-config.cmake.in | 10 ++++++----
+ 2 files changed, 24 insertions(+), 15 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b230b9e..983d1a4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -127,10 +127,16 @@ set_target_properties(yaml-cpp PROPERTIES
+   PROJECT_LABEL "yaml-cpp ${yaml-cpp-label-postfix}"
+   DEBUG_POSTFIX "${CMAKE_DEBUG_POSTFIX}")
+=20
++# FIXME(felix2012): A more common place for the cmake export would be
++# `CMAKE_INSTALL_LIBDIR`, as e.g. done in ubuntu or in this project for=
 GTest
++set(CONFIG_EXPORT_DIR "${CMAKE_INSTALL_DATADIR}/cmake/yaml-cpp")
++set(EXPORT_TARGETS yaml-cpp)
+ configure_package_config_file(
+   "${PROJECT_SOURCE_DIR}/yaml-cpp-config.cmake.in"
+   "${PROJECT_BINARY_DIR}/yaml-cpp-config.cmake"
+-  INSTALL_DESTINATION "${CMAKE_INSTALL_DATADIR}/cmake/yaml-cpp")
++  INSTALL_DESTINATION "${CONFIG_EXPORT_DIR}"
++  PATH_VARS CMAKE_INSTALL_INCLUDEDIR CONFIG_EXPORT_DIR)
++unset(EXPORT_TARGETS)
+=20
+ write_basic_package_version_file(
+   "${PROJECT_BINARY_DIR}/yaml-cpp-config-version.cmake"
+@@ -139,30 +145,31 @@ write_basic_package_version_file(
+ configure_file(yaml-cpp.pc.in yaml-cpp.pc @ONLY)
+=20
+ if (YAML_CPP_INSTALL)
+-	install(TARGETS yaml-cpp
++  install(TARGETS yaml-cpp
+     EXPORT yaml-cpp-targets
+     RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+     ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
+-	install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/
++  install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/
+     DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
+-		FILES_MATCHING PATTERN "*.h")
++                FILES_MATCHING PATTERN "*.h")
+   install(EXPORT yaml-cpp-targets
+-    DESTINATION "${CMAKE_INSTALL_DATADIR}/cmake/yaml-cpp")
+-	install(FILES
+-		"${PROJECT_BINARY_DIR}/yaml-cpp-config.cmake"
+-		"${PROJECT_BINARY_DIR}/yaml-cpp-config-version.cmake"
+-    DESTINATION "${CMAKE_INSTALL_DATADIR}/cmake/yaml-cpp")
++    DESTINATION "${CONFIG_EXPORT_DIR}")
++  install(FILES
++      "${PROJECT_BINARY_DIR}/yaml-cpp-config.cmake"
++      "${PROJECT_BINARY_DIR}/yaml-cpp-config-version.cmake"
++    DESTINATION "${CONFIG_EXPORT_DIR}")
+   install(FILES "${PROJECT_BINARY_DIR}/yaml-cpp.pc"
+     DESTINATION ${CMAKE_INSTALL_DATADIR}/pkgconfig)
+ endif()
++unset(CONFIG_EXPORT_DIR)
+=20
+ if(YAML_CPP_BUILD_TESTS)
+-	add_subdirectory(test)
++  add_subdirectory(test)
+ endif()
+=20
+ if(YAML_CPP_BUILD_TOOLS)
+-	add_subdirectory(util)
++  add_subdirectory(util)
+ endif()
+=20
+ if (YAML_CPP_CLANG_FORMAT_EXE)
+diff --git a/yaml-cpp-config.cmake.in b/yaml-cpp-config.cmake.in
+index 7b41e3f..a7ace3d 100644
+--- a/yaml-cpp-config.cmake.in
++++ b/yaml-cpp-config.cmake.in
+@@ -3,12 +3,14 @@
+ #  YAML_CPP_INCLUDE_DIR - include directory
+ #  YAML_CPP_LIBRARIES    - libraries to link against
+=20
+-# Compute paths
+-get_filename_component(YAML_CPP_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" =
PATH)
+-set(YAML_CPP_INCLUDE_DIR "@CONFIG_INCLUDE_DIRS@")
++@PACKAGE_INIT@
++
++set_and_check(YAML_CPP_INCLUDE_DIR "@PACKAGE_CMAKE_INSTALL_INCLUDEDIR@"=
)
+=20
+ # Our library dependencies (contains definitions for IMPORTED targets)
+-include("${YAML_CPP_CMAKE_DIR}/yaml-cpp-targets.cmake")
++include(@PACKAGE_CONFIG_EXPORT_DIR@/yaml-cpp-targets.cmake)
+=20
+ # These are IMPORTED targets created by yaml-cpp-targets.cmake
+ set(YAML_CPP_LIBRARIES "@EXPORT_TARGETS@")
++
++check_required_components(@EXPORT_TARGETS@)
+--=20
+2.39.2
+
diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb b/meta-oe=
/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
index d3984abe8..e04d4705a 100644
--- a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
+++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6a8aaf0595c2ef=
c1a9c2e0913e9c1a2c"
 # yaml-cpp releases are stored as archive files in github.
 # download the exact revision of release
 SRC_URI =3D "git://github.com/jbeder/yaml-cpp.git;branch=3Dmaster;protoc=
ol=3Dhttps"
+SRC_URI +=3D "file://0001-Fix-CMake-export-files-1077.patch"
 SRCREV =3D "0579ae3d976091d7d664aa9d2527e0d0cff25763"
=20
 S =3D "${WORKDIR}/git"
--=20
2.41.0


