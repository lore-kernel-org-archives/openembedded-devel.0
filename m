Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id E16F47F7E4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:25:49 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id n96so6935900pjc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZanRSj8LG8uCOYnz0mLwudpJj7KhfBAGX2d0nNdUnNI=;
	b=AVbrRC+/wSUX9smLkgYOQFj/xErF7sO/VSmZ8nwDMY9uyWqvzTu1kZE63MlBG+GBah
	XcPm+X5I0O3xdciPuZo2j5zO5Cmmumtkd/+kU4VbJxleIvFMnVt1acgdcjKfwRDUbeBX
	4FTfdDNeAtapOYV9Rz+JWHxYPseIbx1ken2Cp+3JsKxdeBb6oa4UJC1qK2/JM2Xfmlvc
	xnVIiPMr5940Q0zHqvrMSoa82GgjZBRYabzUQHV1UBU6qoCQGG+M8g4VMfjktC4d41f1
	Fzeq5RVOQVdevfxuwJ9aRNr8qImqgQ2RqzJeYJvZUF3qwdObBe/TBgF7oKI1lWPFVElV
	8Ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZanRSj8LG8uCOYnz0mLwudpJj7KhfBAGX2d0nNdUnNI=;
	b=j2F9camu5LLKOiFwisM4t+4tCNIEQhaA8CaehpVxFDukiGpmCilAybuRVSTgHOinQl
	XRXBSjGeR48tmkr5TrjVizKf7SJVPPW1aFGSxRILOi2SrS+Eu7WS8IkumZcJ+Q50d9fX
	rhBiZmptlDkyxFmiMQO3roTeUJEqds77Qp6ecssgWsWIzFm4hX21rOMWqa6eA9a9vxA5
	q79SsPq9AiuucvFUz4eVuZ28g3I0HPZy1fa1i4sh6Bnlt+lw4YI2q39VdeQG0W1/1HQ1
	J16XL5SX2b5m9Mt+TU2Afphm/AXsL8HLDAOeg+O/Jnr8m0w6lnwDzqOdpAKfYzKmPwoY
	M1EQ==
X-Gm-Message-State: APjAAAXJDk95GPmaFaEn4MtB8LcU9avPIiWycZKhdlnTgdDeIAaLzR84
	j463fhzM3K0b5Vl1ZyEm3cDV1KBr4E0=
X-Google-Smtp-Source: APXvYqxep8KpzicOaF0VHpy+WDXFei196E74mNeW+BjN1cMnttQRVZcBviLrjIZIFev6Y+D0kP6JjA==
X-Received: by 2002:a17:902:9b86:: with SMTP id
	y6mr60156298plp.253.1577643950311; 
	Sun, 29 Dec 2019 10:25:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	gc1sm21395010pjb.20.2019.12.29.10.25.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:25:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:25:40 -0800
Message-Id: <20191229182544.16104-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 1/5] glm: Upgrade to 0.9.9.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Dec 2019 18:25:50 -0000
Content-Transfer-Encoding: 8bit

License-Update: Use copying.txt for checksum, no change in licenses as
such

Fix type conversion warnings

Upstream conveniently deleted cmake install/uninstall pieces, therefore
apply the bandaids as needed see [1]

[1] https://github.com/g-truc/glm/issues/947

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix the cmake install/uninstall removal

 ...t-float-conversion-warnings-with-cla.patch | 158 ++++++++++++++++++
 meta-oe/recipes-graphics/glm/glm/glm.pc.in    |   7 +
 .../glm/glm/glmConfig.cmake.in                |  20 +++
 .../glm/glm/glmConfigVersion.cmake.in         |  31 ++++
 .../recipes-graphics/glm/glm/glmTargets.cmake | 107 ++++++++++++
 meta-oe/recipes-graphics/glm/glm_0.9.9.5.bb   |  23 ---
 meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb   |  39 +++++
 7 files changed, 362 insertions(+), 23 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/glm/glm/0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch
 create mode 100644 meta-oe/recipes-graphics/glm/glm/glm.pc.in
 create mode 100644 meta-oe/recipes-graphics/glm/glm/glmConfig.cmake.in
 create mode 100644 meta-oe/recipes-graphics/glm/glm/glmConfigVersion.cmake.in
 create mode 100644 meta-oe/recipes-graphics/glm/glm/glmTargets.cmake
 delete mode 100644 meta-oe/recipes-graphics/glm/glm_0.9.9.5.bb
 create mode 100644 meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb

diff --git a/meta-oe/recipes-graphics/glm/glm/0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch b/meta-oe/recipes-graphics/glm/glm/0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch
new file mode 100644
index 0000000000..2eb50a5a3a
--- /dev/null
+++ b/meta-oe/recipes-graphics/glm/glm/0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch
@@ -0,0 +1,158 @@
+From 461861cd2e34294830b121db834c05ff39424f6f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 27 Dec 2019 18:42:51 -0800
+Subject: [PATCH] Fix Wimplicit-int-float-conversion warnings with clang 10+
+
+This is a new warning in clang which will be available in clang 10
+onwards
+
+Fixes
+error: implicit conversion from 'const int' to 'float' may lose precision [-Werror,-Wimplicit-int-float-conversion]
+
+Upstream-Status: Submitted [https://github.com/g-truc/glm/pull/986]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ glm/gtx/scalar_multiplication.hpp  |  2 +-
+ test/gtx/gtx_fast_trigonometry.cpp | 32 +++++++++++++++---------------
+ 2 files changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/glm/gtx/scalar_multiplication.hpp b/glm/gtx/scalar_multiplication.hpp
+index f391f8de..496ba193 100644
+--- a/glm/gtx/scalar_multiplication.hpp
++++ b/glm/gtx/scalar_multiplication.hpp
+@@ -54,7 +54,7 @@ namespace glm
+ 	template<typename T> \
+ 	return_type_scalar_multiplication<T, Vec> \
+ 	operator/(Vec lh, T const& s){ \
+-		return lh *= 1.0f / s; \
++		return lh *= 1.0f / static_cast<float>(s); \
+ 	}
+ 
+ GLM_IMPLEMENT_SCAL_MULT(vec2)
+diff --git a/test/gtx/gtx_fast_trigonometry.cpp b/test/gtx/gtx_fast_trigonometry.cpp
+index f3bf17bf..f3c4e957 100644
+--- a/test/gtx/gtx_fast_trigonometry.cpp
++++ b/test/gtx/gtx_fast_trigonometry.cpp
+@@ -239,12 +239,12 @@ namespace taylorCos
+ 		std::vector<glm::vec4> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = fastCosNew(AngleShift + glm::vec4(Begin + Steps * i));
++			Results[i] = fastCosNew(AngleShift + glm::vec4(Begin + Steps * float(i)));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+@@ -280,12 +280,12 @@ namespace taylorCos
+ 		std::vector<glm::vec4> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = taylorCos::fastCosDeterminisctic(AngleShift + glm::vec4(Begin + Steps * i));
++			Results[i] = taylorCos::fastCosDeterminisctic(AngleShift + glm::vec4(Begin + Steps * float(i)));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+@@ -327,12 +327,12 @@ namespace taylorCos
+ 		std::vector<glm::vec4> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = taylorCos::fastRefCos(AngleShift + glm::vec4(Begin + Steps * i));
++			Results[i] = taylorCos::fastRefCos(AngleShift + glm::vec4(Begin + Steps * float(i)));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+@@ -349,12 +349,12 @@ namespace taylorCos
+ 		std::vector<glm::vec4> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = glm::fastCos(AngleShift + glm::vec4(Begin + Steps * i));
++			Results[i] = glm::fastCos(AngleShift + glm::vec4(Begin + Steps * float(i)));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+@@ -371,12 +371,12 @@ namespace taylorCos
+ 		std::vector<glm::vec4> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = glm::cos(AngleShift + glm::vec4(Begin + Steps * i));
++			Results[i] = glm::cos(AngleShift + glm::vec4(Begin + Steps * float(i)));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+@@ -466,12 +466,12 @@ namespace taylor2
+ 		std::vector<float> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = taylorCosA(AngleShift.x + Begin + Steps * i);
++			Results[i] = taylorCosA(AngleShift.x + Begin + Steps * float(i));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+@@ -488,12 +488,12 @@ namespace taylor2
+ 		std::vector<float> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = taylorCosB(AngleShift.x + Begin + Steps * i);
++			Results[i] = taylorCosB(AngleShift.x + Begin + Steps * float(i));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+@@ -510,12 +510,12 @@ namespace taylor2
+ 		std::vector<float> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = taylorCosC(AngleShift.x + Begin + Steps * i);
++			Results[i] = taylorCosC(AngleShift.x + Begin + Steps * float(i));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-graphics/glm/glm/glm.pc.in b/meta-oe/recipes-graphics/glm/glm/glm.pc.in
new file mode 100644
index 0000000000..54052e287d
--- /dev/null
+++ b/meta-oe/recipes-graphics/glm/glm/glm.pc.in
@@ -0,0 +1,7 @@
+prefix=/usr
+includedir=${prefix}/include
+
+Name: GLM
+Description: OpenGL Mathematics
+Version: @VERSION@
+Cflags: -I${includedir}
diff --git a/meta-oe/recipes-graphics/glm/glm/glmConfig.cmake.in b/meta-oe/recipes-graphics/glm/glm/glmConfig.cmake.in
new file mode 100644
index 0000000000..8ab23a18d7
--- /dev/null
+++ b/meta-oe/recipes-graphics/glm/glm/glmConfig.cmake.in
@@ -0,0 +1,20 @@
+set(GLM_VERSION "@VERSION@")
+
+
+####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
+get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)
+
+macro(set_and_check _var _file)
+  set(${_var} "${_file}")
+  if(NOT EXISTS "${_file}")
+    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
+  endif()
+endmacro()
+
+####################################################################################
+
+set_and_check(GLM_INCLUDE_DIRS "${PACKAGE_PREFIX_DIR}/include")
+
+if (NOT CMAKE_VERSION VERSION_LESS "3.0")
+    include("${CMAKE_CURRENT_LIST_DIR}/glmTargets.cmake")
+endif()
diff --git a/meta-oe/recipes-graphics/glm/glm/glmConfigVersion.cmake.in b/meta-oe/recipes-graphics/glm/glm/glmConfigVersion.cmake.in
new file mode 100644
index 0000000000..561a0db61f
--- /dev/null
+++ b/meta-oe/recipes-graphics/glm/glm/glmConfigVersion.cmake.in
@@ -0,0 +1,31 @@
+# This is a basic version file for the Config-mode of find_package().
+# It is used by write_basic_package_version_file() as input file for configure_file()
+# to create a version-file which can be installed along a config.cmake file.
+#
+# The created file sets PACKAGE_VERSION_EXACT if the current version string and
+# the requested version string are exactly the same and it sets
+# PACKAGE_VERSION_COMPATIBLE if the current version is >= requested version.
+# The variable CVF_VERSION must be set before calling configure_file().
+
+set(PACKAGE_VERSION "@VERSION@")
+
+if(PACKAGE_VERSION VERSION_LESS PACKAGE_FIND_VERSION)
+  set(PACKAGE_VERSION_COMPATIBLE FALSE)
+else()
+  set(PACKAGE_VERSION_COMPATIBLE TRUE)
+  if(PACKAGE_FIND_VERSION STREQUAL PACKAGE_VERSION)
+    set(PACKAGE_VERSION_EXACT TRUE)
+  endif()
+endif()
+
+# if the installed or the using project don't have CMAKE_SIZEOF_VOID_P set, ignore it:
+if("${CMAKE_SIZEOF_VOID_P}" STREQUAL "" OR "8" STREQUAL "")
+   return()
+endif()
+
+# check that the installed version has the same 32/64bit-ness as the one which is currently searching:
+if(NOT CMAKE_SIZEOF_VOID_P STREQUAL "8")
+   math(EXPR installedBits "8 * 8")
+   set(PACKAGE_VERSION "${PACKAGE_VERSION} (${installedBits}bit)")
+   set(PACKAGE_VERSION_UNSUITABLE FALSE)
+endif()
diff --git a/meta-oe/recipes-graphics/glm/glm/glmTargets.cmake b/meta-oe/recipes-graphics/glm/glm/glmTargets.cmake
new file mode 100644
index 0000000000..905b67731b
--- /dev/null
+++ b/meta-oe/recipes-graphics/glm/glm/glmTargets.cmake
@@ -0,0 +1,107 @@
+# Generated by CMake
+
+if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.5)
+   message(FATAL_ERROR "CMake >= 2.6.0 required")
+endif()
+cmake_policy(PUSH)
+cmake_policy(VERSION 2.6)
+#----------------------------------------------------------------
+# Generated CMake target import file.
+#----------------------------------------------------------------
+
+# Commands may need to know the format version.
+set(CMAKE_IMPORT_FILE_VERSION 1)
+
+# Protect against multiple inclusion, which would fail when already imported targets are added once more.
+set(_targetsDefined)
+set(_targetsNotDefined)
+set(_expectedTargets)
+foreach(_expectedTarget glm)
+  list(APPEND _expectedTargets ${_expectedTarget})
+  if(NOT TARGET ${_expectedTarget})
+    list(APPEND _targetsNotDefined ${_expectedTarget})
+  endif()
+  if(TARGET ${_expectedTarget})
+    list(APPEND _targetsDefined ${_expectedTarget})
+  endif()
+endforeach()
+if("${_targetsDefined}" STREQUAL "${_expectedTargets}")
+  unset(_targetsDefined)
+  unset(_targetsNotDefined)
+  unset(_expectedTargets)
+  set(CMAKE_IMPORT_FILE_VERSION)
+  cmake_policy(POP)
+  return()
+endif()
+if(NOT "${_targetsDefined}" STREQUAL "")
+  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_targetsDefined}\nTargets not yet defined: ${_targetsNotDefined}\n")
+endif()
+unset(_targetsDefined)
+unset(_targetsNotDefined)
+unset(_expectedTargets)
+
+
+# Compute the installation prefix relative to this file.
+get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
+# Use original install prefix when loaded through a
+# cross-prefix symbolic link such as /lib -> /usr/lib.
+get_filename_component(_realCurr "${_IMPORT_PREFIX}" REALPATH)
+get_filename_component(_realOrig "/usr/lib/cmake/glm" REALPATH)
+if(_realCurr STREQUAL _realOrig)
+  set(_IMPORT_PREFIX "/usr/lib/cmake/glm")
+endif()
+unset(_realOrig)
+unset(_realCurr)
+get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
+get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
+get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
+if(_IMPORT_PREFIX STREQUAL "/")
+  set(_IMPORT_PREFIX "")
+endif()
+
+# Create imported target glm
+add_library(glm INTERFACE IMPORTED)
+
+set_target_properties(glm PROPERTIES
+  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
+)
+
+if(CMAKE_VERSION VERSION_LESS 3.0.0)
+  message(FATAL_ERROR "This file relies on consumers using CMake 3.0.0 or greater.")
+endif()
+
+# Load information for each installed configuration.
+get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
+file(GLOB CONFIG_FILES "${_DIR}/glmTargets-*.cmake")
+foreach(f ${CONFIG_FILES})
+  include(${f})
+endforeach()
+
+# Cleanup temporary variables.
+set(_IMPORT_PREFIX)
+
+# Loop over all imported files and verify that they actually exist
+foreach(target ${_IMPORT_CHECK_TARGETS} )
+  foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )
+    if(NOT EXISTS "${file}" )
+      message(FATAL_ERROR "The imported target \"${target}\" references the file
+   \"${file}\"
+but this file does not exist.  Possible reasons include:
+* The file was deleted, renamed, or moved to another location.
+* An install or uninstall procedure did not complete successfully.
+* The installation package was faulty and contained
+   \"${CMAKE_CURRENT_LIST_FILE}\"
+but not all the files it references.
+")
+    endif()
+  endforeach()
+  unset(_IMPORT_CHECK_FILES_FOR_${target})
+endforeach()
+unset(_IMPORT_CHECK_TARGETS)
+
+# This file does not depend on other imported targets which have
+# been exported from the same project but in a separate export set.
+
+# Commands beyond this point should not need to know the version.
+set(CMAKE_IMPORT_FILE_VERSION)
+cmake_policy(POP)
diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.5.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9.5.bb
deleted file mode 100644
index f367e4eae0..0000000000
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.5.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "OpenGL Mathematics Library"
-DESCRIPTION = "OpenGL Mathematics (GLM) is a header only C++ \
-mathematics library for graphics software based on the OpenGL \
-Shading Language (GLSL) specifications."
-HOMEPAGE = "https://glm.g-truc.net"
-BUGTRACKER = "https://github.com/g-truc/glm/issues"
-SECTION = "libs"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://readme.md;beginline=21;endline=22;md5=3075b5727d36f29edccf97b93e72b790"
-
-SRC_URI = " \
-    git://github.com/g-truc/glm;branch=master \
-"
-# v0.9.9.5
-SRCREV = "d162eee1e6f7c317a09229fe6ceab8ec6ab9a4b4"
-
-S = "${WORKDIR}/git"
-
-inherit cmake
-
-RDEPENDS_${PN}-dev = ""
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
new file mode 100644
index 0000000000..e2f4dbebc5
--- /dev/null
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
@@ -0,0 +1,39 @@
+SUMMARY = "OpenGL Mathematics Library"
+DESCRIPTION = "OpenGL Mathematics (GLM) is a header only C++ \
+mathematics library for graphics software based on the OpenGL \
+Shading Language (GLSL) specifications."
+HOMEPAGE = "https://glm.g-truc.net"
+BUGTRACKER = "https://github.com/g-truc/glm/issues"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://copying.txt;md5=4a735e33f271f57404fda17e80085411"
+
+SRC_URI = " \
+    git://github.com/g-truc/glm;branch=master \
+    file://0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch \
+    file://glmConfig.cmake.in \
+    file://glmConfigVersion.cmake.in \
+    file://glm.pc.in \
+    file://glmTargets.cmake \
+"
+SRCREV = "4db8f89aace8f04c839b606e15b39fb8383ec732"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+do_install() {
+    install -d ${D}${includedir} ${D}${docdir}/glm ${D}${libdir}/pkgconfig ${D}${libdir}/cmake/glm
+    cp -R --no-dereference --preserve=mode,links ${S}/glm ${D}${includedir}
+    cp -R --no-dereference --preserve=mode,links ${S}/doc ${D}${docdir}/glm
+    rm ${D}${includedir}/glm/CMakeLists.txt
+    sed "s/@VERSION@/${PV}/" ${WORKDIR}/glmConfigVersion.cmake.in > ${D}${libdir}/cmake/glm/glmConfigVersion.cmake
+    sed "s/@VERSION@/${PV}/" ${WORKDIR}/glmConfig.cmake.in > ${D}${libdir}/cmake/glm/glmConfig.cmake
+    sed "s/@VERSION@/${PV}/" ${WORKDIR}/glm.pc.in > ${D}${libdir}/pkgconfig/glm.pc
+    install -Dm644 ${WORKDIR}/glmTargets.cmake ${D}${libdir}/cmake/glm/glmTargets.cmake
+
+}
+
+RDEPENDS_${PN}-dev = ""
+
+BBCLASSEXTEND = "native"
-- 
2.24.1


