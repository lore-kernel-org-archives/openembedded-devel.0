Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 85EE470466
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 03:59:06 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so10248477pab.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jul 2014 20:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WiV7hQfMFIt/DWiOsnJ0jqvphcjgupe/4mEWsPFPVNY=;
	b=xUtF1xCLhoSyDPOuYmd1oRlfB2xJ/2ayA8l9fsw6Q9jvkN+PO0jd/nBVo5zx66+PVo
	CjKeMnOSeHq/437WCy9tJFULQyrIBAARAktH0xJ1SsVgGtwMJXKgve5fhRj+3v3E1Pg6
	sOnk1JQ2DDsYPy76VRpYzkWw1xPzFt9qEt9ifgmZwBqJO9tmbPkj/DL+0l77hNy2cqzn
	G72FYLUBMMQ7cP3ZWteWAA8j1Xf0iJhPwH9kRL+fyMyQJwyXHGjH+GRRPMd5PxNVkCBT
	RWgzBw0KTQ5hGZgs6J0rShosi46plKNN4NYIIf+ijfuEgEecnIfmNMtPLidFLvjqRi0W
	00Bw==
X-Received: by 10.70.64.201 with SMTP id q9mr5585037pds.130.1404964747280;
	Wed, 09 Jul 2014 20:59:07 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ga1sm60361633pbb.82.2014.07.09.20.59.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Jul 2014 20:59:06 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jul 2014 14:08:35 +1000
Message-Id: <1404965315-9777-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.0.1
Subject: [meta-qt5][PATCH] qtbase: fix 0003-Add-external-hostbindir-option.patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jul 2014 03:59:12 -0000

The isEmpty function takes a variable name instead of a value.
As $$[QT_EXTERNAL_HOST_BINS] is a built-in we need to assign it to a
variable to check if it is empty.

If QT_EXTERNAL_HOST_BINS is empty (as is the case for generated Qt 5
toolchains), we need to fallback to QT_HOST_BINS when determining
the path for tools such as moc otherwise you get the following error
when building a Qt project using the generated toolchain:
make[1]: /moc: Command not found

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../0003-Add-external-hostbindir-option.patch      | 65 +++++++++++++---------
 .../0003-Add-external-hostbindir-option.patch      | 65 +++++++++++++---------
 2 files changed, 78 insertions(+), 52 deletions(-)

diff --git a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
index 44d17ca..2abea8f 100644
--- a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
@@ -1,4 +1,4 @@
-From b45d963702c139ea4f5b5ce572d046511a878d81 Mon Sep 17 00:00:00 2001
+From b544f5f3462e2981ada045a32038b7f116f8590c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH 03/12] Add -external-hostbindir option
@@ -22,25 +22,26 @@ Upstream-Status: Pending
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Simon Busch <morphis@gravedo.de>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
 ---
  configure                                   | 15 +++++++++++++++
- mkspecs/features/qt_functions.prf           |  2 +-
- mkspecs/features/qt_tool.prf                |  3 +--
+ mkspecs/features/qt_functions.prf           |  6 +++++-
+ mkspecs/features/qt_tool.prf                |  4 ++--
  qmake/property.cpp                          |  1 +
- qtbase.pro                                  | 12 +++++++++---
+ qtbase.pro                                  | 14 +++++++++++---
  src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
  src/corelib/global/qlibraryinfo.cpp         |  3 ++-
  src/corelib/global/qlibraryinfo.h           |  1 +
  src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
  src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
  tools/configure/configureapp.cpp            |  8 ++++++++
- 11 files changed, 44 insertions(+), 13 deletions(-)
+ 11 files changed, 51 insertions(+), 13 deletions(-)
 
 diff --git a/configure b/configure
-index 4eae0d3..48d5119 100755
+index d5c2b08..dcd066c 100755
 --- a/configure
 +++ b/configure
-@@ -777,6 +777,7 @@ QT_HOST_BINS=
+@@ -759,6 +759,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -48,7 +49,7 @@ index 4eae0d3..48d5119 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -896,6 +897,7 @@ while [ "$#" -gt 0 ]; do
+@@ -878,6 +879,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -56,7 +57,7 @@ index 4eae0d3..48d5119 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1110,6 +1112,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1092,6 +1094,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -66,7 +67,7 @@ index 4eae0d3..48d5119 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2248,6 +2253,10 @@ Installation options:
+@@ -2230,6 +2235,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -77,7 +78,7 @@ index 4eae0d3..48d5119 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -2915,6 +2924,11 @@ fi
+@@ -2897,6 +2906,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -89,7 +90,7 @@ index 4eae0d3..48d5119 100755
  # update QT_CONFIG to show our current predefined configuration
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
-@@ -3595,6 +3609,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
+@@ -3577,6 +3591,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
      "qt_hbinpath=$QT_HOST_BINS",
      "qt_hlibpath=$QT_HOST_LIBS",
      "qt_hdatpath=$QT_HOST_DATA",
@@ -98,29 +99,37 @@ index 4eae0d3..48d5119 100755
      "qt_hostspec=$shortspec",
  #endif
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index d41fe3b..050a4a7 100644
+index 9a4d80e..dfc1cff 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
-@@ -193,7 +193,7 @@ defineTest(qtAddRpathLink) {
+@@ -193,7 +193,11 @@ defineTest(qtAddRpathLink) {
  defineTest(qtPrepareTool) {
      cmd = $$eval(QT_TOOL.$${2}.binary)
      isEmpty(cmd) {
 -        cmd = $$[QT_HOST_BINS]/$$2
-+        cmd = $$[QT_EXTERNAL_HOST_BINS]/$$2
++        QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
++        isEmpty(QT_EXTERNAL_HOST_BINS): \
++            cmd = $$[QT_HOST_BINS]/$$2
++        else: \
++            cmd = $$[QT_EXTERNAL_HOST_BINS]/$$2
          exists($${cmd}.pl) {
              cmd = perl -w $$system_path($${cmd}.pl)
          } else: contains(QMAKE_HOST.os, Windows) {
 diff --git a/mkspecs/features/qt_tool.prf b/mkspecs/features/qt_tool.prf
-index 1d3e88c..bd44754 100644
+index 1d3e88c..9b26adf 100644
 --- a/mkspecs/features/qt_tool.prf
 +++ b/mkspecs/features/qt_tool.prf
-@@ -15,8 +15,7 @@ CONFIG += console
+@@ -12,11 +12,11 @@
+ load(qt_app)
+ 
+ CONFIG += console
++QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
  
  # If we are doing a prefix build, create a "module" pri which enables
  # qtPrepareTool() to work with the non-installed build.
 -# Non-bootstrapped tools always need this because of the environment setup.
 -!build_pass:if(!host_build|!force_bootstrap|force_independent) {
-+!build_pass:if(!host_build|!force_bootstrap|force_independent):!exists($$[QT_EXTERNAL_HOST_BINS]) {
++!build_pass:if(!host_build|!force_bootstrap|force_independent):isEmpty(QT_EXTERNAL_HOST_BINS) {
      isEmpty(MODULE):MODULE = $$TARGET
  
      !host_build|!force_bootstrap: MODULE_DEPENDS = $$replace(QT, -private$, _private)
@@ -137,15 +146,19 @@ index e50485c..71291ad 100644
      { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
  };
 diff --git a/qtbase.pro b/qtbase.pro
-index d6861cf..92e6a83 100644
+index d6861cf..7fb58a3 100644
 --- a/qtbase.pro
 +++ b/qtbase.pro
-@@ -71,16 +71,22 @@ CONFIG -= qt
+@@ -69,18 +69,26 @@ CONFIG -= qt
+ 
+ ### installations ####
  
++QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
++
  #qmake
  qmake.path = $$[QT_HOST_BINS]
 +qmake.files = $$OUT_PWD/bin/qmake
-+!isEmpty($$[QT_EXTERNAL_HOST_BINS]) {
++!isEmpty(QT_EXTERNAL_HOST_BINS) {
 +   qmake.files = $$[QT_EXTERNAL_HOST_BINS]/bin/qmake
 +}
  equals(QMAKE_HOST.os, Windows) {
@@ -160,7 +173,7 @@ index d6861cf..92e6a83 100644
  syncqt.path = $$[QT_HOST_BINS]
  syncqt.files = $$PWD/bin/syncqt.pl
 +syncqt.files = $$PWD/bin/syncqt.pl
-+!isEmpty($$[QT_EXTERNAL_HOST_BINS]) {
++!isEmpty(QT_EXTERNAL_HOST_BINS) {
 +   syncqt.files = $$[QT_EXTERNAL_HOST_BINS]/bin/syncqt.pl
 +}
  INSTALLS += syncqt
@@ -198,10 +211,10 @@ index 9bda70e..6e3605a 100644
      _qt5_Core_check_file_exists(${imported_location})
  
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 80e0f30..89e13cf 100644
+index 174c1d0..1fe03cb 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -336,7 +336,7 @@ QLibraryInfo::isDebugBuild()
+@@ -333,7 +333,7 @@ QLibraryInfo::isDebugBuild()
   */
  
  static const struct {
@@ -210,7 +223,7 @@ index 80e0f30..89e13cf 100644
  } qtConfEntries[] = {
      { "Prefix", "." },
      { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -362,6 +362,7 @@ static const struct {
+@@ -359,6 +359,7 @@ static const struct {
      { "HostBinaries", "bin" },
      { "HostLibraries", "lib" },
      { "HostData", "." },
@@ -292,5 +305,5 @@ index b756509..7e61845 100644
                    << "    \"qt_hostspec=" << hostSpec << "\"," << endl
                    << "#endif" << endl
 -- 
-2.0.0
+2.0.1
 
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index 66903a3..2abea8f 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,4 +1,4 @@
-From 1fd06315781ada843e473ba2c28c594e05808ca2 Mon Sep 17 00:00:00 2001
+From b544f5f3462e2981ada045a32038b7f116f8590c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH 03/12] Add -external-hostbindir option
@@ -22,25 +22,26 @@ Upstream-Status: Pending
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Simon Busch <morphis@gravedo.de>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
 ---
  configure                                   | 15 +++++++++++++++
- mkspecs/features/qt_functions.prf           |  2 +-
- mkspecs/features/qt_tool.prf                |  3 +--
+ mkspecs/features/qt_functions.prf           |  6 +++++-
+ mkspecs/features/qt_tool.prf                |  4 ++--
  qmake/property.cpp                          |  1 +
- qtbase.pro                                  | 12 +++++++++---
+ qtbase.pro                                  | 14 +++++++++++---
  src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
  src/corelib/global/qlibraryinfo.cpp         |  3 ++-
  src/corelib/global/qlibraryinfo.h           |  1 +
  src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
  src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
  tools/configure/configureapp.cpp            |  8 ++++++++
- 11 files changed, 44 insertions(+), 13 deletions(-)
+ 11 files changed, 51 insertions(+), 13 deletions(-)
 
 diff --git a/configure b/configure
-index 4eae0d3..48d5119 100755
+index d5c2b08..dcd066c 100755
 --- a/configure
 +++ b/configure
-@@ -777,6 +777,7 @@ QT_HOST_BINS=
+@@ -759,6 +759,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -48,7 +49,7 @@ index 4eae0d3..48d5119 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -896,6 +897,7 @@ while [ "$#" -gt 0 ]; do
+@@ -878,6 +879,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -56,7 +57,7 @@ index 4eae0d3..48d5119 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1110,6 +1112,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1092,6 +1094,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -66,7 +67,7 @@ index 4eae0d3..48d5119 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2248,6 +2253,10 @@ Installation options:
+@@ -2230,6 +2235,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -77,7 +78,7 @@ index 4eae0d3..48d5119 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -2915,6 +2924,11 @@ fi
+@@ -2897,6 +2906,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -89,7 +90,7 @@ index 4eae0d3..48d5119 100755
  # update QT_CONFIG to show our current predefined configuration
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
-@@ -3595,6 +3609,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
+@@ -3577,6 +3591,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
      "qt_hbinpath=$QT_HOST_BINS",
      "qt_hlibpath=$QT_HOST_LIBS",
      "qt_hdatpath=$QT_HOST_DATA",
@@ -98,29 +99,37 @@ index 4eae0d3..48d5119 100755
      "qt_hostspec=$shortspec",
  #endif
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 9a4d80e..e60ce37 100644
+index 9a4d80e..dfc1cff 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
-@@ -193,7 +193,7 @@ defineTest(qtAddRpathLink) {
+@@ -193,7 +193,11 @@ defineTest(qtAddRpathLink) {
  defineTest(qtPrepareTool) {
      cmd = $$eval(QT_TOOL.$${2}.binary)
      isEmpty(cmd) {
 -        cmd = $$[QT_HOST_BINS]/$$2
-+        cmd = $$[QT_EXTERNAL_HOST_BINS]/$$2
++        QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
++        isEmpty(QT_EXTERNAL_HOST_BINS): \
++            cmd = $$[QT_HOST_BINS]/$$2
++        else: \
++            cmd = $$[QT_EXTERNAL_HOST_BINS]/$$2
          exists($${cmd}.pl) {
              cmd = perl -w $$system_path($${cmd}.pl)
          } else: contains(QMAKE_HOST.os, Windows) {
 diff --git a/mkspecs/features/qt_tool.prf b/mkspecs/features/qt_tool.prf
-index 1d3e88c..bd44754 100644
+index 1d3e88c..9b26adf 100644
 --- a/mkspecs/features/qt_tool.prf
 +++ b/mkspecs/features/qt_tool.prf
-@@ -15,8 +15,7 @@ CONFIG += console
+@@ -12,11 +12,11 @@
+ load(qt_app)
+ 
+ CONFIG += console
++QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
  
  # If we are doing a prefix build, create a "module" pri which enables
  # qtPrepareTool() to work with the non-installed build.
 -# Non-bootstrapped tools always need this because of the environment setup.
 -!build_pass:if(!host_build|!force_bootstrap|force_independent) {
-+!build_pass:if(!host_build|!force_bootstrap|force_independent):!exists($$[QT_EXTERNAL_HOST_BINS]) {
++!build_pass:if(!host_build|!force_bootstrap|force_independent):isEmpty(QT_EXTERNAL_HOST_BINS) {
      isEmpty(MODULE):MODULE = $$TARGET
  
      !host_build|!force_bootstrap: MODULE_DEPENDS = $$replace(QT, -private$, _private)
@@ -137,15 +146,19 @@ index e50485c..71291ad 100644
      { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
  };
 diff --git a/qtbase.pro b/qtbase.pro
-index d6861cf..92e6a83 100644
+index d6861cf..7fb58a3 100644
 --- a/qtbase.pro
 +++ b/qtbase.pro
-@@ -71,16 +71,22 @@ CONFIG -= qt
+@@ -69,18 +69,26 @@ CONFIG -= qt
+ 
+ ### installations ####
  
++QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
++
  #qmake
  qmake.path = $$[QT_HOST_BINS]
 +qmake.files = $$OUT_PWD/bin/qmake
-+!isEmpty($$[QT_EXTERNAL_HOST_BINS]) {
++!isEmpty(QT_EXTERNAL_HOST_BINS) {
 +   qmake.files = $$[QT_EXTERNAL_HOST_BINS]/bin/qmake
 +}
  equals(QMAKE_HOST.os, Windows) {
@@ -160,7 +173,7 @@ index d6861cf..92e6a83 100644
  syncqt.path = $$[QT_HOST_BINS]
  syncqt.files = $$PWD/bin/syncqt.pl
 +syncqt.files = $$PWD/bin/syncqt.pl
-+!isEmpty($$[QT_EXTERNAL_HOST_BINS]) {
++!isEmpty(QT_EXTERNAL_HOST_BINS) {
 +   syncqt.files = $$[QT_EXTERNAL_HOST_BINS]/bin/syncqt.pl
 +}
  INSTALLS += syncqt
@@ -198,10 +211,10 @@ index 9bda70e..6e3605a 100644
      _qt5_Core_check_file_exists(${imported_location})
  
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 69e614f..a95ca35 100644
+index 174c1d0..1fe03cb 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -336,7 +336,7 @@ QLibraryInfo::isDebugBuild()
+@@ -333,7 +333,7 @@ QLibraryInfo::isDebugBuild()
   */
  
  static const struct {
@@ -210,7 +223,7 @@ index 69e614f..a95ca35 100644
  } qtConfEntries[] = {
      { "Prefix", "." },
      { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -362,6 +362,7 @@ static const struct {
+@@ -359,6 +359,7 @@ static const struct {
      { "HostBinaries", "bin" },
      { "HostLibraries", "lib" },
      { "HostData", "." },
@@ -292,5 +305,5 @@ index b756509..7e61845 100644
                    << "    \"qt_hostspec=" << hostSpec << "\"," << endl
                    << "#endif" << endl
 -- 
-2.0.0
+2.0.1
 
-- 
2.0.1


