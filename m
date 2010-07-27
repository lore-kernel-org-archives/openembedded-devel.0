Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1OdYeB-0003hj-Kg
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 03:08:12 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id CA44C43D12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 03:07:40 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz CA44C43D12
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1280192860; i=@fjfi.cvut.cz; bh=ziQJdebevKPTevJHELJes/1IAUU=;
	h=From:Date:Subject:To:Message-Id;
	b=JF8jAbeNwiIV8sZaGy4bCQ7KHNyzggjsLd6SFPksAAnUA6UgiYcd/8dwViXno7q4S
	lwFm52LCiXAPD2SuUDUZQ==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id CRH8DtAQw9r2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 03:07:33 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 7A55A43D16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 03:07:33 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 7A55A43D16
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz 7A55A43D16
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id 3AE504677C; Tue, 27 Jul 2010 03:07:33 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
Date: Tue, 27 Jul 2010 02:38:55 +0200
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100727010733.3AE504677C@linux.fjfi.cvut.cz>
X-SA-Exim-Connect-IP: 147.32.9.3
X-SA-Exim-Mail-From: zub@linux.fjfi.cvut.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] webkit-efl: update to recent webkit-efl (r64079), package launcher too
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
X-List-Received-Date: Tue, 27 Jul 2010 01:08:12 -0000

The launcher was tested on om-gta02.

This update breaks openmoko-3rdparty/ventura_svn.bb, as the API has changed.

Signed-off-by: David Kozub <zub@linux.fjfi.cvut.cz>
---
 recipes/webkit/webkit-efl/CMakeLists.txt           |  121 ++++++++++++++++++++
 recipes/webkit/webkit-efl/cmakeconfig.h.cmake      |   40 +++++++
 .../webkit-efl/fix-build-with-newer-ecore.patch    |   10 --
 .../webkit-efl/fix-build-with-newer-evas.patch     |   26 ----
 .../webkit/webkit-efl/install-efl-launcher.patch   |   10 ++
 recipes/webkit/webkit-efl/set-so-version.patch     |   11 ++
 recipes/webkit/webkit-efl_git.bb                   |   24 ----
 recipes/webkit/webkit-efl_svn.bb                   |   46 ++++++++
 8 files changed, 228 insertions(+), 60 deletions(-)
 create mode 100644 recipes/webkit/webkit-efl/CMakeLists.txt
 create mode 100644 recipes/webkit/webkit-efl/cmakeconfig.h.cmake
 delete mode 100644 recipes/webkit/webkit-efl/fix-build-with-newer-ecore.patch
 delete mode 100644 recipes/webkit/webkit-efl/fix-build-with-newer-evas.patch
 create mode 100644 recipes/webkit/webkit-efl/install-efl-launcher.patch
 create mode 100644 recipes/webkit/webkit-efl/set-so-version.patch
 delete mode 100644 recipes/webkit/webkit-efl_git.bb
 create mode 100644 recipes/webkit/webkit-efl_svn.bb

diff --git a/recipes/webkit/webkit-efl/CMakeLists.txt b/recipes/webkit/webkit-efl/CMakeLists.txt
new file mode 100644
index 0000000..996b457
--- /dev/null
+++ b/recipes/webkit/webkit-efl/CMakeLists.txt
@@ -0,0 +1,121 @@
+CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
+PROJECT(WebKit)
+
+IF (NOT CMAKE_BUILD_TYPE)
+    SET(CMAKE_BUILD_TYPE Release)
+ENDIF ()
+SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
+
+SET(JAVASCRIPTCORE_DIR "${CMAKE_SOURCE_DIR}/JavaScriptCore")
+SET(WEBCORE_DIR "${CMAKE_SOURCE_DIR}/WebCore")
+SET(WEBKIT_DIR "${CMAKE_SOURCE_DIR}/WebKit")
+SET(DERIVED_SOURCES_DIR "${CMAKE_BINARY_DIR}/DerivedSources")
+
+INCLUDE(WebKitMacros)
+INCLUDE(WebKitGenerators)
+INCLUDE(WebKitHelpers)
+INCLUDE(WebKitFeatures)
+
+# -----------------------------------------------------------------------------
+# Determine which port will be built
+# -----------------------------------------------------------------------------
+SET(ALL_PORTS Efl)
+OPTION(PORT "choose which WebKit port to build (one of ${ALL_PORTS})" "NOPORT")
+
+# -----------------------------------------------------------------------------
+# Find common packages (used by all ports)
+# -----------------------------------------------------------------------------
+FIND_PACKAGE(BISON REQUIRED)
+FIND_PACKAGE(FLEX REQUIRED)
+FIND_PACKAGE(Perl REQUIRED)
+FIND_PACKAGE(PythonInterp REQUIRED)
+
+# -----------------------------------------------------------------------------
+# Determine the target processor
+# -----------------------------------------------------------------------------
+IF (CMAKE_SYSTEM_PROCESSOR MATCHES "arm")
+    SET(WTF_CPU_ARM 1)
+ELSEIF (CMAKE_SYSTEM_PROCESSOR MATCHES "(x86_64)")
+    SET(WTF_CPU_X86_64 1)
+ELSEIF (CMAKE_SYSTEM_PROCESSOR MATCHES "(i[3-6]86|x86)")
+    SET(WTF_CPU_X86 1)
+ELSE ()
+    MESSAGE(FATAL_ERROR "Unknown CPU '${CMAKE_SYSTEM_PROCESSOR}'")
+ENDIF ()
+
+# -----------------------------------------------------------------------------
+# Determine the operating system
+# -----------------------------------------------------------------------------
+IF (CMAKE_SYSTEM_NAME MATCHES "Linux")
+    SET(WTF_OS_UNIX 1)
+
+    IF (APPLE)
+        SET(WTF_OS_MAC_OS_X 1)
+    ENDIF ()
+ELSEIF (CMAKE_SYSTEM_NAME MATCHES "Windows")
+    SET(WTF_OS_WINDOWS 1)
+ELSE ()
+    MESSAGE(FATAL_ERROR "Unknown OS '${CMAKE_SYSTEM_NAME}'")
+ENDIF ()
+
+# -----------------------------------------------------------------------------
+# Default target names (can be overrriden in Options${PORT}.cmake file)
+# -----------------------------------------------------------------------------
+SET(JSC_EXECUTABLE_NAME JSC)
+SET(WTF_LIBRARY_NAME WTF)
+SET(JavaScriptCore_LIBRARY_NAME JavaScriptCore)
+SET(WebCore_LIBRARY_NAME WebCore)
+SET(WebKit_LIBRARY_NAME WebKit)
+
+# -----------------------------------------------------------------------------
+# Default library types
+# -----------------------------------------------------------------------------
+OPTION(SHARED_CORE "build WTF, JavaScriptCore and WebCore as shared libraries")
+
+IF (SHARED_CORE)
+    SET(WTF_LIBRARY_TYPE SHARED)
+    SET(JavaScriptCore_LIBRARY_TYPE SHARED)
+    SET(WebCore_LIBRARY_TYPE SHARED)
+ELSE ()
+    SET(WTF_LIBRARY_TYPE STATIC)
+    SET(JavaScriptCore_LIBRARY_TYPE STATIC)
+    SET(WebCore_LIBRARY_TYPE STATIC)
+ENDIF ()
+
+SET(WebKit_LIBRARY_TYPE SHARED)
+
+# -----------------------------------------------------------------------------
+# Port-specific options
+# -----------------------------------------------------------------------------
+INCLUDE(OptionsCommon)
+INCLUDE(Options${PORT})
+
+# -----------------------------------------------------------------------------
+# Define packaging
+# -----------------------------------------------------------------------------
+INCLUDE(WebKitPackaging)
+
+# -----------------------------------------------------------------------------
+# Add module directories
+# -----------------------------------------------------------------------------
+ADD_SUBDIRECTORY(JavaScriptCore)
+ADD_SUBDIRECTORY(WebCore)
+ADD_SUBDIRECTORY(WebKit)
+
+# -----------------------------------------------------------------------------
+# Set compiler flags for all targets
+# -----------------------------------------------------------------------------
+WEBKIT_SET_EXTRA_COMPILER_FLAGS(${WTF_LIBRARY_NAME})
+WEBKIT_SET_EXTRA_COMPILER_FLAGS(${JavaScriptCore_LIBRARY_NAME})
+WEBKIT_SET_EXTRA_COMPILER_FLAGS(${WebCore_LIBRARY_NAME})
+WEBKIT_SET_EXTRA_COMPILER_FLAGS(${WebKit_LIBRARY_NAME})
+
+# -----------------------------------------------------------------------------
+# Create the configuration file
+# -----------------------------------------------------------------------------
+CONFIGURE_FILE(cmakeconfig.h.cmake ${CMAKE_BINARY_DIR}/cmakeconfig.h @ONLY)
+
+# -----------------------------------------------------------------------------
+# Prints a summary of all enabled/disabled features
+# -----------------------------------------------------------------------------
+WEBKIT_PRINT_FEATURES()
diff --git a/recipes/webkit/webkit-efl/cmakeconfig.h.cmake b/recipes/webkit/webkit-efl/cmakeconfig.h.cmake
new file mode 100644
index 0000000..14f7a80
--- /dev/null
+++ b/recipes/webkit/webkit-efl/cmakeconfig.h.cmake
@@ -0,0 +1,40 @@
+#ifndef CMAKECONFIG_H
+#define CMAKECONFIG_H
+
+#define ENABLE_AS_IMAGE @ENABLE_AS_IMAGE_VALUE@
+#define ENABLE_BLOB_SLICE @ENABLE_BLOB_SLICE_VALUE@
+#define ENABLE_CHANNEL_MESSAGING @ENABLE_CHANNEL_MESSAGING_VALUE@
+#define ENABLE_DATABASE @ENABLE_DATABASE_VALUE@
+#define ENABLE_DATAGRID @ENABLE_DATAGRID_VALUE@
+#define ENABLE_DATALIST @ENABLE_DATALIST_VALUE@
+#define ENABLE_DOM_STORAGE @ENABLE_DOM_STORAGE_VALUE@
+#define ENABLE_EVENTSOURCE @ENABLE_EVENTSOURCE_VALUE@
+#define ENABLE_FAST_MOBILE_SCROLLING @ENABLE_FAST_MOBILE_SCROLLING_VALUE@
+#define ENABLE_FILTERS @ENABLE_FILTERS_VALUE@
+#define ENABLE_GEOLOCATION @ENABLE_GEOLOCATION_VALUE@
+#define ENABLE_GLIB_SUPPORT @ENABLE_GLIB_SUPPORT_VALUE@
+#define ENABLE_ICONDATABASE @ENABLE_ICONDATABASE_VALUE@
+#define ENABLE_JAVASCRIPT_DEBUGGER @ENABLE_JAVASCRIPT_DEBUGGER_VALUE@
+#define ENABLE_JIT @ENABLE_JIT_VALUE@
+#define ENABLE_MATHML @ENABLE_MATHML_VALUE@
+#define ENABLE_NOTIFICATIONS @ENABLE_NOTIFICATIONS_VALUE@
+#define ENABLE_OFFLINE_WEB_APPLICATIONS @ENABLE_OFFLINE_WEB_APPLICATIONS_VALUE@
+#define ENABLE_ORIENTATION_EVENTS @ENABLE_ORIENTATION_EVENTS_VALUE@
+#define ENABLE_PROGRESS_TAG @ENABLE_PROGRESS_TAG_VALUE@
+#define ENABLE_RUBY @ENABLE_RUBY_VALUE@
+#define ENABLE_SANDBOX @ENABLE_SANDBOX_VALUE@
+#define ENABLE_SHARED_WORKERS @ENABLE_SHARED_WORKERS_VALUE@
+#define ENABLE_SVG @ENABLE_SVG_VALUE@
+#define ENABLE_SVG_ANIMATION @ENABLE_SVG_ANIMATION_VALUE@
+#define ENABLE_SVG_FONTS @ENABLE_SVG_FONTS_VALUE@
+#define ENABLE_SVG_FOREIGN_OBJECT @ENABLE_SVG_FOREIGN_OBJECT_VALUE@
+#define ENABLE_SVG_USE @ENABLE_SVG_USE_VALUE@
+#define ENABLE_VIDEO @ENABLE_VIDEO_VALUE@
+#define ENABLE_WEB_SOCKETS @ENABLE_WEB_SOCKETS_VALUE@
+#define ENABLE_WML @ENABLE_WML_VALUE@
+#define ENABLE_WORKERS @ENABLE_WORKERS_VALUE@
+#define ENABLE_XHTMLMP @ENABLE_XHTMLMP_VALUE@
+#define ENABLE_XPATH @ENABLE_XPATH_VALUE@
+#define ENABLE_XSLT @ENABLE_XSLT_VALUE@
+
+#endif /* CMAKECONFIG_H */
diff --git a/recipes/webkit/webkit-efl/fix-build-with-newer-ecore.patch b/recipes/webkit/webkit-efl/fix-build-with-newer-ecore.patch
deleted file mode 100644
index bbfba43..0000000
--- a/recipes/webkit/webkit-efl/fix-build-with-newer-ecore.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- git.orig/WebKit/efl/EWebLauncher/main.c	2010-03-26 11:07:23.000000000 +0100
-+++ git/WebKit/efl/EWebLauncher/main.c	2010-03-26 11:07:29.000000000 +0100
-@@ -28,7 +28,6 @@
- #include "Api/EWebKit.h"
- 
- #include <Ecore.h>
--#include <Ecore_Data.h>
- #include <Ecore_Evas.h>
- #include <Ecore_Getopt.h>
- #include <Ecore_X.h>
diff --git a/recipes/webkit/webkit-efl/fix-build-with-newer-evas.patch b/recipes/webkit/webkit-efl/fix-build-with-newer-evas.patch
deleted file mode 100644
index 6adf0dd..0000000
--- a/recipes/webkit/webkit-efl/fix-build-with-newer-evas.patch
+++ /dev/null
@@ -1,26 +0,0 @@
---- git/WebCore/platform/graphics/IntPoint.h	2009-11-16 19:14:36.000000000 +0100
-+++ webkit-efl/WebCore/platform/graphics/IntPoint.h	2010-02-26 10:32:48.000000000 +0100
-@@ -33,6 +33,10 @@
- #include <QDataStream>
- #endif
- 
-+#if PLATFORM(EFL)
-+#include <Evas.h>
-+#endif
-+
- #if PLATFORM(CG)
- typedef struct CGPoint CGPoint;
- #endif
-@@ -55,12 +59,6 @@
- QT_END_NAMESPACE
- #elif PLATFORM(GTK)
- typedef struct _GdkPoint GdkPoint;
--#elif PLATFORM(EFL)
--typedef struct _Evas_Point Evas_Point;
--struct _Evas_Point{
--    int x;
--    int y;
--};
- #endif
- 
- #if PLATFORM(WX)
diff --git a/recipes/webkit/webkit-efl/install-efl-launcher.patch b/recipes/webkit/webkit-efl/install-efl-launcher.patch
new file mode 100644
index 0000000..8f059be
--- /dev/null
+++ b/recipes/webkit/webkit-efl/install-efl-launcher.patch
@@ -0,0 +1,10 @@
+diff -ru webkit.original/WebKit/CMakeListsEfl.txt webkit/WebKit/CMakeListsEfl.txt
+--- webkit.original/WebKit/CMakeListsEfl.txt	2010-07-21 09:20:50.000000000 +0200
++++ webkit/WebKit/CMakeListsEfl.txt	2010-07-21 11:51:21.000000000 +0200
+@@ -118,3 +118,6 @@
+ 
+ INSTALL(FILES ${EWebKit_HEADERS}
+         DESTINATION include/EWebKit)
++
++INSTALL(TARGETS ../Programs/EWebLauncher RUNTIME DESTINATION bin)
++SET_TARGET_PROPERTIES(../Programs/EWebLauncher PROPERTIES SKIP_BUILD_RPATH TRUE)
diff --git a/recipes/webkit/webkit-efl/set-so-version.patch b/recipes/webkit/webkit-efl/set-so-version.patch
new file mode 100644
index 0000000..7cf81a2
--- /dev/null
+++ b/recipes/webkit/webkit-efl/set-so-version.patch
@@ -0,0 +1,11 @@
+diff -ru webkit.original/WebKit/CMakeLists.txt webkit/WebKit/CMakeLists.txt
+--- webkit.original/WebKit/CMakeLists.txt	2010-07-24 00:14:06.000000000 +0200
++++ webkit/WebKit/CMakeLists.txt	2010-07-23 23:55:01.000000000 +0200
+@@ -59,6 +59,7 @@
+ ADD_LIBRARY(${WebKit_LIBRARY_NAME} ${WebKit_LIBRARY_TYPE} ${WebKit_SOURCES})
+ TARGET_LINK_LIBRARIES(${WebKit_LIBRARY_NAME} ${WebKit_LIBRARIES})
+ ADD_TARGET_PROPERTIES(${WebKit_LIBRARY_NAME} LINK_FLAGS "${WebKit_LINK_FLAGS}")
++SET_TARGET_PROPERTIES(${WebKit_LIBRARY_NAME} PROPERTIES VERSION 0.0.0 SOVERSION 0)
+ 
+ INSTALL(TARGETS ${WebKit_LIBRARY_NAME} DESTINATION lib)
+ 
diff --git a/recipes/webkit/webkit-efl_git.bb b/recipes/webkit/webkit-efl_git.bb
deleted file mode 100644
index f750061..0000000
--- a/recipes/webkit/webkit-efl_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = " Webkit browser engine, EFL edition"
-LICENSE = "GPL"
-DEPENDS = "icu flex gst-plugins-base gstreamer jpeg libpng libxml2 pango \
-           libsoup-2.4 eina ecore evas edje cairo fontconfig freetype curl \
-           sqlite3 libxslt gperf-native libxt"
-
-SRCREV = "3a5ee77664c898ed51a2b2d5759822f8c0a06472"
-PV = "1.1.11+gitr${SRCPV}"
-PR = "r8"
-
-SRC_URI = "git://gitorious.org/webkit-efl/webkit-efl.git;protocol=git;branch=master \
-           file://fix-build-with-newer-evas.patch \
-           file://fix-build-with-newer-ecore.patch"
-
-S = "${WORKDIR}/git"
-
-inherit autotools lib_package pkgconfig
-
-EXTRA_OECONF = "--disable-video --host=${TARGET_SYS} --with-port=efl --enable-web-workers=no"
-
-PACKAGES =+ "${PN}-webinspector"
-
-FILES_${PN} += "${datadir}/webkit-1.0/theme/default.edj"
-FILES_${PN}-webinspector = "${datadir}/webkit-1.0/webinspector/"
diff --git a/recipes/webkit/webkit-efl_svn.bb b/recipes/webkit/webkit-efl_svn.bb
new file mode 100644
index 0000000..f2c6e80
--- /dev/null
+++ b/recipes/webkit/webkit-efl_svn.bb
@@ -0,0 +1,46 @@
+DESCRIPTION = "Webkit browser engine, EFL edition"
+LICENSE = "GPL"
+DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
+           libpng libxt fontconfig cairo freetype glib-2.0 libsoup-2.4 \
+           libxml2 pango eina ecore evas edje"
+
+SRCREV = "64079"
+PV = "1.1.11+svnr${SRCPV}"
+PR = "r9"
+
+SRCREV_FORMAT = "webcore-rwebkit"
+
+SRC_URI = "\
+  svn://svn.webkit.org/repository/webkit/trunk/;module=JavaScriptCore;proto=http;subdir=src \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=JavaScriptGlue;proto=http;subdir=src \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=WebCore;proto=http;name=webcore;subdir=src \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=WebKit;proto=http;name=webkit;subdir=src \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;proto=http;subdir=src \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitTools;proto=http;subdir=src \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=cmake;proto=http;subdir=src \
+  file://cmakeconfig.h.cmake \
+  file://CMakeLists.txt \
+  file://install-efl-launcher.patch \
+  file://set-so-version.patch \
+ "
+
+S = "${WORKDIR}/src"
+
+inherit cmake lib_package pkgconfig
+
+EXTRA_OECMAKE = "-DPORT=Efl"
+
+do_unpack_append() {
+	bb.build.exec_func('do_move_files', d)
+}
+
+do_move_files() {
+	mv "${WORKDIR}/cmakeconfig.h.cmake" "${S}"
+	mv "${WORKDIR}/CMakeLists.txt" "${S}"
+}
+
+PACKAGES =+ "${PN}launcher-dbg ${PN}launcher"
+
+FILES_${PN} += "${datadir}/webkit-1.0/theme/default.edj"
+FILES_${PN}launcher = "${bindir}/EWebLauncher"
+FILES_${PN}launcher-dbg = "${bindir}/.debug/EWebLauncher"
-- 
1.7.1



