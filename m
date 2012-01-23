Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpFnB-0006fE-AR
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jan 2012 10:02:21 +0100
Received: by mail-ey0-f175.google.com with SMTP id l12so265605eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2012 00:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=74SNP4a7ll1QtVUcYrCZbfCD89m3yWnNrFy1JnT/uYA=;
	b=gQMuC6rOslE+2iZxrFCjaNUQnRomlCNaq+h1+FmEAIe5yo1nJLqWF5nVt6qFEIExdM
	7EkVQ1PrNBoog81EIYkrV+L6RDSnEmsd0mv+UzNi09TmdIDp9eFTousj7l8KL8FcW85n
	L/t0o/npUplwfPjjBCyQw4+pxAcwpt8l7P2io=
Received: by 10.213.98.78 with SMTP id p14mr1368031ebn.145.1327308879662;
	Mon, 23 Jan 2012 00:54:39 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b49sm51231379eec.9.2012.01.23.00.54.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 00:54:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2012 09:54:18 +0100
Message-Id: <ee185555e03b0138fa7cac05f8ae4972156e63f7.1327308791.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <26b55fdded7124f4666f372ceda4d8c4d959cc94.1327308791.git.Martin.Jansa@gmail.com>
References: <26b55fdded7124f4666f372ceda4d8c4d959cc94.1327308791.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1327308791.git.Martin.Jansa@gmail.com>
References: <cover.1327308791.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome][PATCH 2/8] webkit-efl: upgrade to 1.7.3
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
X-List-Received-Date: Mon, 23 Jan 2012 09:02:21 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-efl/webkit/webkit-efl/CMakeLists.txt   |  160 ++++++++++++++++++++
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |   20 ++-
 2 files changed, 173 insertions(+), 7 deletions(-)
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/CMakeLists.txt

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/CMakeLists.txt b/meta-efl/recipes-efl/webkit/webkit-efl/CMakeLists.txt
new file mode 100644
index 0000000..c130867
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/CMakeLists.txt
@@ -0,0 +1,160 @@
+CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
+PROJECT(WebKit)
+
+# Set a default build type if and only if user did not define one as command
+# line options and he did not give custom CFLAGS or CXXFLAGS. Otherwise, flags
+# from default build type would overwrite user-defined ones.
+IF (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_C_FLAGS AND NOT CMAKE_CXX_FLAGS)
+    SET(CMAKE_BUILD_TYPE Release)
+ENDIF ()
+
+# -----------------------------------------------------------------------------
+# Default library type
+# -----------------------------------------------------------------------------
+SET(ENABLE_WEBCORE On)
+
+IF (NOT ENABLE_WEBKIT AND NOT ENABLE_WEBKIT2)
+    SET(ENABLE_WEBKIT On)
+ENDIF ()
+
+OPTION(ONLY_BUILD_JAVASCRIPTCORE "only build JavaScriptCore")
+IF (ONLY_BUILD_JAVASCRIPTCORE)
+    SET(ENABLE_WEBCORE Off)
+    SET(ENABLE_WEBKIT Off)
+    SET(ENABLE_WEBKIT2 Off)
+ENDIF ()
+
+SET(JAVASCRIPTCORE_DIR "${CMAKE_SOURCE_DIR}/Source/JavaScriptCore")
+SET(WEBCORE_DIR "${CMAKE_SOURCE_DIR}/Source/WebCore")
+SET(WEBKIT_DIR "${CMAKE_SOURCE_DIR}/Source/WebKit")
+SET(WEBKIT2_DIR "${CMAKE_SOURCE_DIR}/Source/WebKit2")
+SET(THIRDPARTY_DIR "${CMAKE_SOURCE_DIR}/Source/ThirdParty")
+
+SET(TOOLS_DIR "${CMAKE_SOURCE_DIR}/Tools")
+
+SET(DERIVED_SOURCES_DIR "${CMAKE_BINARY_DIR}/DerivedSources")
+SET(DERIVED_SOURCES_JAVASCRIPTCORE_DIR "${CMAKE_BINARY_DIR}/DerivedSources/JavaScriptCore")
+SET(DERIVED_SOURCES_WEBCORE_DIR "${CMAKE_BINARY_DIR}/DerivedSources/WebCore")
+SET(DERIVED_SOURCES_WEBKIT2_DIR "${CMAKE_BINARY_DIR}/DerivedSources/WebKit2")
+
+SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/Source/cmake")
+
+INCLUDE(WebKitMacros)
+INCLUDE(WebKitFS)
+INCLUDE(WebKitHelpers)
+INCLUDE(WebKitFeatures)
+
+# -----------------------------------------------------------------------------
+# Determine which port will be built
+# -----------------------------------------------------------------------------
+SET(ALL_PORTS Efl WinCE BlackBerry)
+SET(PORT "NOPORT" CACHE STRING "choose which WebKit port to build (one of ${ALL_PORTS})")
+
+LIST(FIND ALL_PORTS ${PORT} RET)
+IF (${RET} EQUAL -1)
+    MESSAGE(FATAL_ERROR "Please choose which WebKit port to build (one of ${ALL_PORTS})")
+ENDIF ()
+
+STRING(TOLOWER ${PORT} WEBKIT_PORT_DIR)
+
+# -----------------------------------------------------------------------------
+# Find common packages (used by all ports)
+# -----------------------------------------------------------------------------
+FIND_PACKAGE(BISON REQUIRED)
+FIND_PACKAGE(FLEX REQUIRED)
+FIND_PACKAGE(Gperf REQUIRED)
+FIND_PACKAGE(Perl REQUIRED)
+FIND_PACKAGE(PythonInterp REQUIRED)
+
+# -----------------------------------------------------------------------------
+# Determine the target processor
+# -----------------------------------------------------------------------------
+STRING(TOLOWER ${CMAKE_SYSTEM_PROCESSOR} LOWERCASE_CMAKE_SYSTEM_PROCESSOR)
+IF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
+    SET(WTF_CPU_ARM 1)
+ELSEIF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^mips")
+    SET(WTF_CPU_MIPS 1)
+ELSEIF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "(x86_64|amd64)")
+    SET(WTF_CPU_X86_64 1)
+ELSEIF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "(i[3-6]86|x86)")
+    SET(WTF_CPU_X86 1)
+ELSE ()
+    MESSAGE(FATAL_ERROR "Unknown CPU '${CMAKE_SYSTEM_PROCESSOR}'")
+ENDIF ()
+
+# -----------------------------------------------------------------------------
+# Determine the operating system
+# -----------------------------------------------------------------------------
+IF (UNIX)
+    IF (APPLE)
+        SET(WTF_OS_MAC_OS_X 1)
+    ELSE ()
+        SET(WTF_OS_UNIX 1)
+    ENDIF ()
+ELSEIF (CMAKE_SYSTEM_NAME MATCHES "Windows")
+    SET(WTF_OS_WINDOWS 1)
+ELSEIF (CMAKE_SYSTEM_NAME MATCHES "QNX")
+    SET(WTF_OS_QNX 1)
+    SET(WTF_OS_UNIX 1)
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
+SET(WebKit2_LIBRARY_NAME WebKit2)
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
+SET(WebKit2_LIBRARY_TYPE SHARED)
+
+# -----------------------------------------------------------------------------
+# Port-specific options
+# -----------------------------------------------------------------------------
+INCLUDE(OptionsCommon)
+INCLUDE(Options${PORT})
+
+# -----------------------------------------------------------------------------
+# Install JavaScript shell
+# -----------------------------------------------------------------------------
+OPTION(SHOULD_INSTALL_JS_SHELL "generate an installation rule to install the built JavaScript shell")
+
+# -----------------------------------------------------------------------------
+# Define packaging
+# -----------------------------------------------------------------------------
+INCLUDE(WebKitPackaging)
+
+# -----------------------------------------------------------------------------
+# Add module directories
+# -----------------------------------------------------------------------------
+ADD_SUBDIRECTORY(Source)
+
+# -----------------------------------------------------------------------------
+# Add tools
+# -----------------------------------------------------------------------------
+ADD_SUBDIRECTORY(Tools)
+
+# -----------------------------------------------------------------------------
+# Prints a summary of all enabled/disabled features
+# -----------------------------------------------------------------------------
+WEBKIT_PRINT_FEATURES()
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
index 9f02a59..77aef02 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
@@ -1,25 +1,31 @@
 DESCRIPTION = "Webkit browser engine, EFL edition"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://WebKit/LICENSE;md5=4646f90082c40bcf298c285f8bab0b12 \
-                    file://JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
-                    file://WebKit/efl/ewk/EWebKit.h;endline=20;md5=55ea170b1582797d2c69712de850f2fa \
+LIC_FILES_CHKSUM = "file://Source/WebKit/LICENSE;md5=4646f90082c40bcf298c285f8bab0b12 \
+                    file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
+                    file://Source/WebKit/efl/ewk/EWebKit.h;endline=20;md5=55ea170b1582797d2c69712de850f2fa \
 "
 
 DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
            libpng libxt fontconfig cairo freetype glib-2.0 libsoup-2.4 \
            libxml2 pango eina ecore evas edje"
 
-SRCREV = "97724"
-PV = "1.6.1+svnr${SRCPV}"
+SRCREV = "105069"
+PV = "1.7.3+svnr${SRCPV}"
 
 SRCREV_FORMAT = "source"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk;module=Source;name=source;proto=http;subdir=src \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;proto=http;subdir=src \
   svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;proto=http;subdir=src \
- "
+  file://CMakeLists.txt \
+"
+
+S = "${WORKDIR}/src"
 
-S = "${WORKDIR}/src/Source"
+do_configure_prepend() {
+  cp ${WORKDIR}/CMakeLists.txt ${S};
+}
 
 inherit cmake lib_package pkgconfig perlnative
 
-- 
1.7.8.4



