Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PpS4d-0004kT-VI
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 22:04:40 +0100
Received: by mail-fx0-f47.google.com with SMTP id 17so607413fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 13:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=DyeTuXYp4FPx5BNN9/x7CjilLQbmcMqkUniuCkmIPzs=;
	b=Ky6Sx/rP8rBbp6l7UnnaFXqUi0Q2zkoltABLWJZEAvPkEayTZ/5Ooka371Uyv4ZPCw
	i3vRCaevybMWHcG1ALAErPn7kkY23NWuNhJLhVuc4rEf4TzeKRiBUteoYSD0IWfoyB8j
	c7f0L0ahX/BOjvp3gOcLBauvg1ykiaVHLZzS0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=WudkH+R5X00dRu05s33UUDUmCuM1Ru97W4pZ8EE0gCad2lio0MPL1/GWj+8edk18+b
	hjzf6IATf1rM5mEj+ofpfypP5a1Age1fFZ4tif9Mp3SLFaNpMGvYKmknrVD5sF1TkKYS
	hDb40d4QFjy9P3KGHgIPtlrKUKmqkBCCx7oQA=
Received: by 10.223.101.129 with SMTP id c1mr4159643fao.25.1297803811794;
	Tue, 15 Feb 2011 13:03:31 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n26sm1914156fam.13.2011.02.15.13.03.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Feb 2011 13:03:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Feb 2011 22:03:01 +0100
Message-Id: <1297803782-8395-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1297803782-8395-1-git-send-email-Martin.Jansa@gmail.com>
References: <1297803782-8395-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 4/4] webkit-efl: upgrade to 1.3.11, upstream has Source subdirectory now, which makes SRC_URI a lot shorter
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
X-List-Received-Date: Tue, 15 Feb 2011 21:04:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/webkit/webkit-efl/CMakeLists.txt      |  132 -------------------------
 recipes/webkit/webkit-efl/bug.50752.patch     |   37 -------
 recipes/webkit/webkit-efl/cmakeconfig.h.cmake |   41 --------
 recipes/webkit/webkit-efl/revert.r78057.patch |   19 ++++
 recipes/webkit/webkit-efl_svn.bb              |   33 ++-----
 5 files changed, 26 insertions(+), 236 deletions(-)
 delete mode 100644 recipes/webkit/webkit-efl/CMakeLists.txt
 delete mode 100644 recipes/webkit/webkit-efl/bug.50752.patch
 delete mode 100644 recipes/webkit/webkit-efl/cmakeconfig.h.cmake
 create mode 100644 recipes/webkit/webkit-efl/revert.r78057.patch

diff --git a/recipes/webkit/webkit-efl/CMakeLists.txt b/recipes/webkit/webkit-efl/CMakeLists.txt
deleted file mode 100644
index ca8dcf9..0000000
--- a/recipes/webkit/webkit-efl/CMakeLists.txt
+++ /dev/null
@@ -1,132 +0,0 @@
-CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
-PROJECT(WebKit)
-
-# Set a default build type if and only if user did not define one as command
-# line options and he did not give custom CFLAGS or CXXFLAGS. Otherwise, flags
-# from default build type would overwrite user-defined ones.
-IF (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_C_FLAGS AND NOT CMAKE_CXX_FLAGS)
-    SET(CMAKE_BUILD_TYPE Release)
-ENDIF ()
-SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
-
-SET(JAVASCRIPTCORE_DIR "${CMAKE_SOURCE_DIR}/JavaScriptCore")
-SET(WEBCORE_DIR "${CMAKE_SOURCE_DIR}/WebCore")
-SET(WEBKIT_DIR "${CMAKE_SOURCE_DIR}/WebKit")
-SET(WEBKITTOOLS_DIR "${CMAKE_SOURCE_DIR}/WebKitTools")
-SET(DERIVED_SOURCES_DIR "${CMAKE_BINARY_DIR}/DerivedSources")
-
-INCLUDE(WebKitMacros)
-INCLUDE(WebKitFS)
-INCLUDE(WebKitHelpers)
-INCLUDE(WebKitFeatures)
-
-# -----------------------------------------------------------------------------
-# Determine which port will be built
-# -----------------------------------------------------------------------------
-SET(ALL_PORTS Efl)
-OPTION(PORT "choose which WebKit port to build (one of ${ALL_PORTS})" "NOPORT")
-
-# -----------------------------------------------------------------------------
-# Find common packages (used by all ports)
-# -----------------------------------------------------------------------------
-FIND_PACKAGE(BISON REQUIRED)
-FIND_PACKAGE(FLEX REQUIRED)
-FIND_PACKAGE(Gperf REQUIRED)
-FIND_PACKAGE(Perl REQUIRED)
-FIND_PACKAGE(PythonInterp REQUIRED)
-
-# -----------------------------------------------------------------------------
-# Determine the target processor
-# -----------------------------------------------------------------------------
-STRING(TOLOWER ${CMAKE_SYSTEM_PROCESSOR} LOWERCASE_CMAKE_SYSTEM_PROCESSOR)
-IF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
-    SET(WTF_CPU_ARM 1)
-ELSEIF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "(x86_64)")
-    SET(WTF_CPU_X86_64 1)
-ELSEIF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "(i[3-6]86|x86)")
-    SET(WTF_CPU_X86 1)
-ELSE ()
-    MESSAGE(FATAL_ERROR "Unknown CPU '${CMAKE_SYSTEM_PROCESSOR}'")
-ENDIF ()
-
-# -----------------------------------------------------------------------------
-# Determine the operating system
-# -----------------------------------------------------------------------------
-IF (CMAKE_SYSTEM_NAME MATCHES "Linux")
-    SET(WTF_OS_UNIX 1)
-
-    IF (APPLE)
-        SET(WTF_OS_MAC_OS_X 1)
-    ENDIF ()
-ELSEIF (CMAKE_SYSTEM_NAME MATCHES "Windows")
-    SET(WTF_OS_WINDOWS 1)
-ELSE ()
-    MESSAGE(FATAL_ERROR "Unknown OS '${CMAKE_SYSTEM_NAME}'")
-ENDIF ()
-
-# -----------------------------------------------------------------------------
-# Default target names (can be overrriden in Options${PORT}.cmake file)
-# -----------------------------------------------------------------------------
-SET(JSC_EXECUTABLE_NAME JSC)
-SET(WTF_LIBRARY_NAME WTF)
-SET(JavaScriptCore_LIBRARY_NAME JavaScriptCore)
-SET(WebCore_LIBRARY_NAME WebCore)
-SET(WebKit_LIBRARY_NAME WebKit)
-
-# -----------------------------------------------------------------------------
-# Default library types
-# -----------------------------------------------------------------------------
-OPTION(SHARED_CORE "build WTF, JavaScriptCore and WebCore as shared libraries")
-
-IF (SHARED_CORE)
-    SET(WTF_LIBRARY_TYPE SHARED)
-    SET(JavaScriptCore_LIBRARY_TYPE SHARED)
-    SET(WebCore_LIBRARY_TYPE SHARED)
-ELSE ()
-    SET(WTF_LIBRARY_TYPE STATIC)
-    SET(JavaScriptCore_LIBRARY_TYPE STATIC)
-    SET(WebCore_LIBRARY_TYPE STATIC)
-ENDIF ()
-
-SET(WebKit_LIBRARY_TYPE SHARED)
-
-# -----------------------------------------------------------------------------
-# Port-specific options
-# -----------------------------------------------------------------------------
-INCLUDE(OptionsCommon)
-INCLUDE(Options${PORT})
-
-# -----------------------------------------------------------------------------
-# Define packaging
-# -----------------------------------------------------------------------------
-INCLUDE(WebKitPackaging)
-
-# -----------------------------------------------------------------------------
-# Add module directories
-# -----------------------------------------------------------------------------
-ADD_SUBDIRECTORY(JavaScriptCore)
-ADD_SUBDIRECTORY(WebCore)
-ADD_SUBDIRECTORY(WebKit)
-
-# -----------------------------------------------------------------------------
-# Add test browser if exists
-# -----------------------------------------------------------------------------
-INCLUDE_IF_EXISTS(${WEBKITTOOLS_DIR}/CMakeLists${PORT}.txt)
-
-# -----------------------------------------------------------------------------
-# Set compiler flags for all targets
-# -----------------------------------------------------------------------------
-WEBKIT_SET_EXTRA_COMPILER_FLAGS(${WTF_LIBRARY_NAME})
-WEBKIT_SET_EXTRA_COMPILER_FLAGS(${JavaScriptCore_LIBRARY_NAME})
-WEBKIT_SET_EXTRA_COMPILER_FLAGS(${WebCore_LIBRARY_NAME})
-WEBKIT_SET_EXTRA_COMPILER_FLAGS(${WebKit_LIBRARY_NAME})
-
-# -----------------------------------------------------------------------------
-# Create the configuration file
-# -----------------------------------------------------------------------------
-CONFIGURE_FILE(cmakeconfig.h.cmake ${CMAKE_BINARY_DIR}/cmakeconfig.h @ONLY)
-
-# -----------------------------------------------------------------------------
-# Prints a summary of all enabled/disabled features
-# -----------------------------------------------------------------------------
-WEBKIT_PRINT_FEATURES()
diff --git a/recipes/webkit/webkit-efl/bug.50752.patch b/recipes/webkit/webkit-efl/bug.50752.patch
deleted file mode 100644
index 2d65f2e..0000000
--- a/recipes/webkit/webkit-efl/bug.50752.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-https://bugs.webkit.org/show_bug.cgi?id=46258
-
-diff --git a/WebKit/efl/ChangeLog b/WebKit/efl/ChangeLog
-index cfb2f1189e4071cdca7027e81b6fda178ee32490..5ce726ec72fcb530fe0d96e77a4e8fc4b8a8c537 100644
---- a/WebKit/efl/ChangeLog
-+++ b/WebKit/efl/ChangeLog
-@@ -1,3 +1,17 @@
-+2010-12-09  Alex Bredariol Grilo  <abgrilo@profusion.mobi>
-+
-+        Reviewed by NOBODY (OOPS!).
-+
-+        [EFL] Fix scroll operation in WebKit-EFL
-+        https://bugs.webkit.org/show_bug.cgi?id=50752
-+
-+        Add the _ewk_view_scroll_add call in WebKit-EFL scroll function. This
-+        call was wrongly removed in previous commit and performs the scroll
-+        operation on the page.
-+
-+        * ewk/ewk_view.cpp:
-+        (ewk_view_scroll):
-+
- 2010-12-03  Alex Bredariol Grilo  <abgrilo@profusion.mobi>
- 
-         Reviewed by Andreas Kling.
-diff --git a/WebKit/efl/ewk/ewk_view.cpp b/WebKit/efl/ewk/ewk_view.cpp
-index 5147b6d9b7ce518deb8e1b864fe773c1931db42e..d1731e74173b53decd18610657ea4eb97f903397 100644
---- a/WebKit/efl/ewk/ewk_view.cpp
-+++ b/WebKit/efl/ewk/ewk_view.cpp
-@@ -4075,6 +4075,8 @@ void ewk_view_scroll(Evas_Object* o, Evas_Coord dx, Evas_Coord dy, Evas_Coord sx
-     EWK_VIEW_PRIV_GET_OR_RETURN(sd, priv);
-     EINA_SAFETY_ON_TRUE_RETURN(!dx && !dy);
- 
-+    _ewk_view_scroll_add(priv, dx, dy, sx, sy, sw, sh, main_frame);
-+
-     _ewk_view_smart_changed(sd);
- }
- 
diff --git a/recipes/webkit/webkit-efl/cmakeconfig.h.cmake b/recipes/webkit/webkit-efl/cmakeconfig.h.cmake
deleted file mode 100644
index b16b985..0000000
--- a/recipes/webkit/webkit-efl/cmakeconfig.h.cmake
+++ /dev/null
@@ -1,41 +0,0 @@
-#ifndef CMAKECONFIG_H
-#define CMAKECONFIG_H
-
-#define ENABLE_AS_IMAGE @ENABLE_AS_IMAGE_VALUE@
-#define ENABLE_BLOB @ENABLE_BLOB_VALUE@
-#define ENABLE_CHANNEL_MESSAGING @ENABLE_CHANNEL_MESSAGING_VALUE@
-#define ENABLE_DATABASE @ENABLE_DATABASE_VALUE@
-#define ENABLE_DATAGRID @ENABLE_DATAGRID_VALUE@
-#define ENABLE_DATALIST @ENABLE_DATALIST_VALUE@
-#define ENABLE_DOM_STORAGE @ENABLE_DOM_STORAGE_VALUE@
-#define ENABLE_EVENTSOURCE @ENABLE_EVENTSOURCE_VALUE@
-#define ENABLE_FAST_MOBILE_SCROLLING @ENABLE_FAST_MOBILE_SCROLLING_VALUE@
-#define ENABLE_FILTERS @ENABLE_FILTERS_VALUE@
-#define ENABLE_FTPDIR @ENABLE_FTPDIR_VALUE@
-#define ENABLE_GEOLOCATION @ENABLE_GEOLOCATION_VALUE@
-#define ENABLE_GLIB_SUPPORT @ENABLE_GLIB_SUPPORT_VALUE@
-#define ENABLE_ICONDATABASE @ENABLE_ICONDATABASE_VALUE@
-#define ENABLE_INSPECTOR @ENABLE_INSPECTOR_VALUE@
-#define ENABLE_JAVASCRIPT_DEBUGGER @ENABLE_JAVASCRIPT_DEBUGGER_VALUE@
-#define ENABLE_JIT @ENABLE_JIT_VALUE@
-#define ENABLE_MATHML @ENABLE_MATHML_VALUE@
-#define ENABLE_NETSCAPE_PLUGIN_API @ENABLE_NETSCAPE_PLUGIN_API_VALUE@
-#define ENABLE_NOTIFICATIONS @ENABLE_NOTIFICATIONS_VALUE@
-#define ENABLE_OFFLINE_WEB_APPLICATIONS @ENABLE_OFFLINE_WEB_APPLICATIONS_VALUE@
-#define ENABLE_ORIENTATION_EVENTS @ENABLE_ORIENTATION_EVENTS_VALUE@
-#define ENABLE_PROGRESS_TAG @ENABLE_PROGRESS_TAG_VALUE@
-#define ENABLE_SHARED_WORKERS @ENABLE_SHARED_WORKERS_VALUE@
-#define ENABLE_SVG @ENABLE_SVG_VALUE@
-#define ENABLE_SVG_ANIMATION @ENABLE_SVG_ANIMATION_VALUE@
-#define ENABLE_SVG_FONTS @ENABLE_SVG_FONTS_VALUE@
-#define ENABLE_SVG_FOREIGN_OBJECT @ENABLE_SVG_FOREIGN_OBJECT_VALUE@
-#define ENABLE_SVG_USE @ENABLE_SVG_USE_VALUE@
-#define ENABLE_VIDEO @ENABLE_VIDEO_VALUE@
-#define ENABLE_WEB_SOCKETS @ENABLE_WEB_SOCKETS_VALUE@
-#define ENABLE_WML @ENABLE_WML_VALUE@
-#define ENABLE_WORKERS @ENABLE_WORKERS_VALUE@
-#define ENABLE_XHTMLMP @ENABLE_XHTMLMP_VALUE@
-#define ENABLE_XPATH @ENABLE_XPATH_VALUE@
-#define ENABLE_XSLT @ENABLE_XSLT_VALUE@
-
-#endif /* CMAKECONFIG_H */
diff --git a/recipes/webkit/webkit-efl/revert.r78057.patch b/recipes/webkit/webkit-efl/revert.r78057.patch
new file mode 100644
index 0000000..d75f834
--- /dev/null
+++ b/recipes/webkit/webkit-efl/revert.r78057.patch
@@ -0,0 +1,19 @@
+see https://bugs.webkit.org/show_bug.cgi?id=50762
+fixed by:
+http://trac.webkit.org/changeset/78047/trunk/Source/WebCore/CMakeLists.txt
+fix reverted by:
+http://trac.webkit.org/changeset/78057/trunk/Source/WebCore/CMakeLists.txt
+
+so revert revert as we care about webkit-efl and don't care about WinCE
+
+Index: Source/WebCore/CMakeLists.txt
+===================================================================
+--- Source/WebCore/CMakeLists.txt	(revision 78042)
++++ Source/WebCore/CMakeLists.txt	(revision 78047)
+@@ -1157,6 +1157,4 @@
+ 
+     platform/Arena.cpp
+-    platform/ContextMenu.cpp
+-    platform/ContextMenuItem.cpp
+     platform/ContentType.cpp
+     platform/CrossThreadCopier.cpp
diff --git a/recipes/webkit/webkit-efl_svn.bb b/recipes/webkit/webkit-efl_svn.bb
index da93d78..2785fe8 100644
--- a/recipes/webkit/webkit-efl_svn.bb
+++ b/recipes/webkit/webkit-efl_svn.bb
@@ -4,28 +4,18 @@ DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
            libpng libxt fontconfig cairo freetype glib-2.0 libsoup-2.4 \
            libxml2 pango eina ecore evas edje"
 
-# newer revisions are blocked by
-# https://bugs.webkit.org/show_bug.cgi?id=50762
-SRCREV = "73534"
-PV = "1.3.4+svnr${SRCPV}"
-PR = "r1"
+SRCREV = "78547"
+PV = "1.3.11+svnr${SRCPV}"
 
-SRCREV_FORMAT = "webcore-rwebkit"
+SRCREV_FORMAT = "source"
 
 SRC_URI = "\
-  svn://svn.webkit.org/repository/webkit/trunk/;module=JavaScriptCore;proto=http;subdir=src \
-  svn://svn.webkit.org/repository/webkit/trunk/;module=JavaScriptGlue;proto=http;subdir=src \
-  svn://svn.webkit.org/repository/webkit/trunk/;module=WebCore;proto=http;name=webcore;subdir=src \
-  svn://svn.webkit.org/repository/webkit/trunk/;module=WebKit;proto=http;name=webkit;subdir=src \
-  svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;proto=http;subdir=src \
-  svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitTools;proto=http;subdir=src \
-  svn://svn.webkit.org/repository/webkit/trunk/;module=cmake;proto=http;subdir=src \
-  file://bug.50752.patch \
-  file://cmakeconfig.h.cmake \
-  file://CMakeLists.txt \
+  svn://svn.webkit.org/repository/webkit/trunk;module=Source;name=source;proto=http;subdir=src \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;proto=http;subdir=src \
+  file://revert.r78057.patch \
  "
 
-S = "${WORKDIR}/src"
+S = "${WORKDIR}/src/Source"
 
 inherit cmake lib_package pkgconfig
 
@@ -39,15 +29,6 @@ ARM_INSTRUCTION_SET = "ARM"
 
 EXTRA_OECMAKE = "-DPORT=Efl -DSHARED_CORE=ON"
 
-do_unpack_append() {
-	bb.build.exec_func('do_move_files', d)
-}
-
-do_move_files() {
-	mv "${WORKDIR}/cmakeconfig.h.cmake" "${S}"
-	mv "${WORKDIR}/CMakeLists.txt" "${S}"
-}
-
 LEAD_SONAME = "libewebkit.so"
 PACKAGES =+ "${PN}launcher-dbg ${PN}launcher"
 
-- 
1.7.4.1



