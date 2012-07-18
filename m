Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srbqn-0000fg-WF
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 23:32:06 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1625270wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Liih8ckvgMZGU8Os3kYmpgSpOpfk9Qp3BosRJNV6oRg=;
	b=WzEa5/EA9fs8n6R7SFBQRC4UYJCgmWYlUQjMAWBXETqJXFc9rtLfh/p14vyJHoICyE
	NJmh0nHYeKbgPXxLl+sKOKjHG35AG3sGUfdHO+r1z0F2jMMwsOBM41i/WL0HbDBR0ASl
	9wkxFGK9Y7Gc7y7a5BreHd8KkVf33+grFYUqwWVvnZFW6VXr3jvUFXKXotscBXHMBM4U
	vDrqgmGvGqkRUqZSVe61bAD6N9KOvHyIfH8rDV0g8OWGy4vFY07ZgX3NiXAxdW1N7vWB
	LUyl1Snot8nNUsNu5gpGu5a0ivNdnyAtuTd9tr7hH7uD7g/CoEMY0k2uJ7Vrkv12+lYj
	PIDA==
Received: by 10.180.99.232 with SMTP id et8mr9918365wib.11.1342646447144;
	Wed, 18 Jul 2012 14:20:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm34642799wib.6.2012.07.18.14.20.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 14:20:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 23:19:22 +0200
Message-Id: <ddfe73847f3bbfff6ab6f4a9396170018906246f.1342645937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][RFC 12/14] webkit-efl: upgrade to 1.9.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 21:32:06 -0000

* some revisions are broken for armv4t, see my comment at
  https://bugs.webkit.org/show_bug.cgi?id=80354
* and newer then this need developement snapshot of
  glib/glib-networking/libsoup-2.4
  https://bugs.webkit.org/show_bug.cgi?id=91626

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...t-pass-P-to-the-preprocessor-when-running.patch |   76 --------------------
 ...ore-add-EINA_LIBRARIES-to-shell-build-for.patch |   28 -------
 .../recipes-efl/webkit/webkit-efl/CMakeLists.txt   |   38 ++++++----
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |   10 +--
 4 files changed, 26 insertions(+), 126 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-CMake-Do-not-pass-P-to-the-preprocessor-when-running.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0001-CMake-Do-not-pass-P-to-the-preprocessor-when-running.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0001-CMake-Do-not-pass-P-to-the-preprocessor-when-running.patch
deleted file mode 100644
index dcd3a46..0000000
--- a/meta-efl/recipes-efl/webkit/webkit-efl/0001-CMake-Do-not-pass-P-to-the-preprocessor-when-running.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 3dfc99730b99472d642f19b825fb9794e32a05c4 Mon Sep 17 00:00:00 2001
-From: "rakuco@webkit.org"
- <rakuco@webkit.org@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
-Date: Tue, 10 Apr 2012 22:59:04 +0000
-Subject: [PATCH] [CMake] Do not pass -P to the preprocessor when running
- make_names.pl.
- https://bugs.webkit.org/show_bug.cgi?id=83225
-
-Reviewed by Rob Buis.
-
-This is necessary to make CMake-based ports build with the
-recently-released GCC 4.7.0, whose preprocessor seems to ignore
-empty lines when -P is passed to it.  Such behavior breaks
-make_names.pl (in fact, InFilesParser.pm), which expects an empty
-line to separate common and specific sections in .in files.
-
-A fix for this same problem has been supposedly done in r84123,
-but as the CMake-based ports always pass --preprocessor to the
-Perl tools the fix never reached us.
-
-The idea is to define CODE_GENERATOR_PREPROCESSOR_WITH_LINEMARKERS
-for (!MSVC && !QNX) and use it in the macros which call
-make_names.pl.
-
-* Source/cmake/OptionsCommon.cmake:
-* Source/cmake/WebKitMacros.cmake:
-
-git-svn-id: http://svn.webkit.org/repository/webkit/trunk@113786 268f45cc-cd09-0410-ab3c-d52691b4dbfc
----
- ChangeLog                        |   24 ++++++++++++++++++++++++
- Source/cmake/OptionsCommon.cmake |    7 +++++++
- Source/cmake/WebKitMacros.cmake  |    2 +-
- 3 files changed, 32 insertions(+), 1 deletions(-)
-
-diff --git a/Source/cmake/OptionsCommon.cmake b/Source/cmake/OptionsCommon.cmake
-index 11581e6..37cb4a8 100644
---- a/Source/cmake/OptionsCommon.cmake
-+++ b/Source/cmake/OptionsCommon.cmake
-@@ -5,14 +5,21 @@ IF (WTF_OS_UNIX)
-     ADD_DEFINITIONS(-DXP_UNIX)
- ENDIF (WTF_OS_UNIX)
- 
-+# CODE_GENERATOR_PREPROCESSOR_WITH_LINEMARKERS only matters with GCC >= 4.7.0.  Since this
-+# version, -P does not output empty lines, which currently breaks make_names.pl in
-+# WebCore. Investigating whether make_names.pl should be changed instead is left as an exercise to
-+# the reader.
- IF (MSVC)
-     # FIXME: Some codegenerators don't support paths with spaces. So use the executable name only.
-     GET_FILENAME_COMPONENT(CODE_GENERATOR_PREPROCESSOR_EXECUTABLE ${CMAKE_CXX_COMPILER} NAME)
-     SET(CODE_GENERATOR_PREPROCESSOR "${CODE_GENERATOR_PREPROCESSOR_EXECUTABLE} /nologo /EP")
-+    SET(CODE_GENERATOR_PREPROCESSOR_WITH_LINEMARKERS "${CODE_GENERATOR_PREPROCESSOR}")
- ELSEIF (CMAKE_SYSTEM_NAME MATCHES QNX)
-     SET(CODE_GENERATOR_PREPROCESSOR "${CMAKE_CXX_COMPILER} -E -Wp,-P -x c++")
-+    SET(CODE_GENERATOR_PREPROCESSOR_WITH_LINEMARKERS "${CODE_GENERATOR_PREPROCESSOR}")
- ELSE ()
-     SET(CODE_GENERATOR_PREPROCESSOR "${CMAKE_CXX_COMPILER} -E -P -x c++")
-+    SET(CODE_GENERATOR_PREPROCESSOR_WITH_LINEMARKERS "${CMAKE_CXX_COMPILER} -E -x c++")
- ENDIF ()
- 
- SET_PROPERTY(GLOBAL PROPERTY USE_FOLDERS ON)
-diff --git a/Source/cmake/WebKitMacros.cmake b/Source/cmake/WebKitMacros.cmake
-index 3abe342..4e7ca9f 100644
---- a/Source/cmake/WebKitMacros.cmake
-+++ b/Source/cmake/WebKitMacros.cmake
-@@ -89,7 +89,7 @@ MACRO (GENERATE_DOM_NAMES _namespace _attrs)
-     ADD_CUSTOM_COMMAND(
-         OUTPUT  ${_outputfiles}
-         DEPENDS ${NAMES_GENERATOR} ${SCRIPTS_BINDINGS} ${_attrs} ${_tags}
--        COMMAND ${PERL_EXECUTABLE} -I${WEBCORE_DIR}/bindings/scripts ${NAMES_GENERATOR} --preprocessor "${CODE_GENERATOR_PREPROCESSOR}" --outputDir ${DERIVED_SOURCES_WEBCORE_DIR} ${_arguments} ${_additionArguments}
-+        COMMAND ${PERL_EXECUTABLE} -I${WEBCORE_DIR}/bindings/scripts ${NAMES_GENERATOR} --preprocessor "${CODE_GENERATOR_PREPROCESSOR_WITH_LINEMARKERS}" --outputDir ${DERIVED_SOURCES_WEBCORE_DIR} ${_arguments} ${_additionArguments}
-         VERBATIM)
- ENDMACRO ()
- 
--- 
-1.7.7
-
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch
deleted file mode 100644
index 6958b9e..0000000
--- a/meta-efl/recipes-efl/webkit/webkit-efl/0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 079acc344dc12818d8b56bf80a42065d8429f7ef Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 14 Feb 2012 09:56:53 +0100
-Subject: [PATCH] JavaScriptCore: add EINA_LIBRARIES to shell build for Efl
-
-* needed for libwtf_efl
-* otherwise fails with ../wtf/libwtf_efl.so.0.1.0: error: undefined reference to 'eina_module_free'
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Source/JavaScriptCore/shell/PlatformEfl.cmake |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/Source/JavaScriptCore/shell/PlatformEfl.cmake b/Source/JavaScriptCore/shell/PlatformEfl.cmake
-index c35af2d..ef3f437 100644
---- a/Source/JavaScriptCore/shell/PlatformEfl.cmake
-+++ b/Source/JavaScriptCore/shell/PlatformEfl.cmake
-@@ -1,6 +1,7 @@
- LIST(APPEND JSC_LIBRARIES
-     ${Glib_LIBRARIES}
-     ${ECORE_LIBRARIES}
-+    ${EINA_LIBRARIES}
-     ${CMAKE_DL_LIBS}
- )
- 
--- 
-1.7.8.4
-
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/CMakeLists.txt b/meta-efl/recipes-efl/webkit/webkit-efl/CMakeLists.txt
index c130867..8071d61 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl/CMakeLists.txt
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/CMakeLists.txt
@@ -11,19 +11,15 @@ ENDIF ()
 # -----------------------------------------------------------------------------
 # Default library type
 # -----------------------------------------------------------------------------
-SET(ENABLE_WEBCORE On)
+SET(ENABLE_WEBCORE ON)
 
 IF (NOT ENABLE_WEBKIT AND NOT ENABLE_WEBKIT2)
-    SET(ENABLE_WEBKIT On)
+    SET(ENABLE_WEBKIT ON)
 ENDIF ()
 
-OPTION(ONLY_BUILD_JAVASCRIPTCORE "only build JavaScriptCore")
-IF (ONLY_BUILD_JAVASCRIPTCORE)
-    SET(ENABLE_WEBCORE Off)
-    SET(ENABLE_WEBKIT Off)
-    SET(ENABLE_WEBKIT2 Off)
-ENDIF ()
+SET(ENABLE_TOOLS ON)
 
+SET(WTF_DIR "${CMAKE_SOURCE_DIR}/Source/WTF")
 SET(JAVASCRIPTCORE_DIR "${CMAKE_SOURCE_DIR}/Source/JavaScriptCore")
 SET(WEBCORE_DIR "${CMAKE_SOURCE_DIR}/Source/WebCore")
 SET(WEBKIT_DIR "${CMAKE_SOURCE_DIR}/Source/WebKit")
@@ -35,10 +31,15 @@ SET(TOOLS_DIR "${CMAKE_SOURCE_DIR}/Tools")
 SET(DERIVED_SOURCES_DIR "${CMAKE_BINARY_DIR}/DerivedSources")
 SET(DERIVED_SOURCES_JAVASCRIPTCORE_DIR "${CMAKE_BINARY_DIR}/DerivedSources/JavaScriptCore")
 SET(DERIVED_SOURCES_WEBCORE_DIR "${CMAKE_BINARY_DIR}/DerivedSources/WebCore")
+SET(DERIVED_SOURCES_WEBKIT_DIR "${CMAKE_BINARY_DIR}/DerivedSources/WebKit")
 SET(DERIVED_SOURCES_WEBKIT2_DIR "${CMAKE_BINARY_DIR}/DerivedSources/WebKit2")
 
 SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/Source/cmake")
 
+SET(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
+SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
+SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
+
 INCLUDE(WebKitMacros)
 INCLUDE(WebKitFS)
 INCLUDE(WebKitHelpers)
@@ -109,24 +110,24 @@ SET(JavaScriptCore_LIBRARY_NAME JavaScriptCore)
 SET(WebCore_LIBRARY_NAME WebCore)
 SET(WebKit_LIBRARY_NAME WebKit)
 SET(WebKit2_LIBRARY_NAME WebKit2)
+SET(WebCoreTestSupport_LIBRARY_NAME WebCoreTestSupport)
 
 # -----------------------------------------------------------------------------
 # Default library types
 # -----------------------------------------------------------------------------
-OPTION(SHARED_CORE "build WTF, JavaScriptCore and WebCore as shared libraries")
+OPTION(SHARED_CORE "build JavaScriptCore and WebCore as shared libraries")
 
 IF (SHARED_CORE)
-    SET(WTF_LIBRARY_TYPE SHARED)
     SET(JavaScriptCore_LIBRARY_TYPE SHARED)
     SET(WebCore_LIBRARY_TYPE SHARED)
 ELSE ()
-    SET(WTF_LIBRARY_TYPE STATIC)
     SET(JavaScriptCore_LIBRARY_TYPE STATIC)
     SET(WebCore_LIBRARY_TYPE STATIC)
 ENDIF ()
 
 SET(WebKit_LIBRARY_TYPE SHARED)
 SET(WebKit2_LIBRARY_TYPE SHARED)
+SET(WebCoreTestSupport_LIBRARY_TYPE STATIC)
 
 # -----------------------------------------------------------------------------
 # Port-specific options
@@ -135,6 +136,13 @@ INCLUDE(OptionsCommon)
 INCLUDE(Options${PORT})
 
 # -----------------------------------------------------------------------------
+# Enable API unit tests and create a target for the test runner
+# -----------------------------------------------------------------------------
+IF (ENABLE_API_TESTS)
+    ENABLE_TESTING()
+ENDIF ()
+
+# -----------------------------------------------------------------------------
 # Install JavaScript shell
 # -----------------------------------------------------------------------------
 OPTION(SHOULD_INSTALL_JS_SHELL "generate an installation rule to install the built JavaScript shell")
@@ -152,9 +160,7 @@ ADD_SUBDIRECTORY(Source)
 # -----------------------------------------------------------------------------
 # Add tools
 # -----------------------------------------------------------------------------
-ADD_SUBDIRECTORY(Tools)
+IF (ENABLE_TOOLS)
+    ADD_SUBDIRECTORY(Tools)
+ENDIF ()
 
-# -----------------------------------------------------------------------------
-# Prints a summary of all enabled/disabled features
-# -----------------------------------------------------------------------------
-WEBKIT_PRINT_FEATURES()
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
index 0c490c3..4ef4759 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
@@ -9,9 +9,9 @@ DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
            libpng libxt fontconfig cairo freetype glib-2.0 libsoup-2.4 \
            libxml2 pango eina ecore evas edje"
 
-SRCREV = "105069"
-PV = "1.7.3+svnr${SRCPV}"
-PR = "r2"
+# 120145 and 122103 introduces dependency on libsoup-2.39.3 and glib-networking-2.33.2
+SRCREV = "120144"
+PV = "1.9.3+svnr${SRCPV}"
 
 SRCREV_FORMAT = "source"
 
@@ -19,8 +19,6 @@ SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk;module=Source;name=source;protocol=http;subdir=src \
   svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;protocol=http;subdir=src \
   svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;protocol=http;subdir=src \
-  file://0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch \
-  file://0001-CMake-Do-not-pass-P-to-the-preprocessor-when-running.patch \
   file://CMakeLists.txt \
 "
 
@@ -34,7 +32,7 @@ inherit cmake lib_package pkgconfig perlnative
 
 ARM_INSTRUCTION_SET = "arm"
 
-EXTRA_OECMAKE = "-DPORT=Efl -DSHARED_CORE=ON"
+EXTRA_OECMAKE = "-DPORT=Efl -DSHARED_CORE=On -DENABLE_DRAG_SUPPORT=On"
 
 LEAD_SONAME = "libewebkit.so"
 PACKAGES =+ "${PN}launcher-dbg ${PN}launcher"
-- 
1.7.8.6



