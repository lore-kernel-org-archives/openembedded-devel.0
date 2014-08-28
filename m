Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa12-08.prod.phx3.secureserver.net
	(p3plsmtpa12-08.prod.phx3.secureserver.net [68.178.252.237])
	by mail.openembedded.org (Postfix) with ESMTP id F0A1D71081
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 12:13:42 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa12-08.prod.phx3.secureserver.net with 
	id kC6Q1o0081mTNtu01C6VDn; Thu, 28 Aug 2014 05:06:29 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Aug 2014 07:06:18 -0500
Message-Id: <1409227581-20888-3-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1409227581-20888-1-git-send-email-pab@pabigot.com>
References: <1409227581-20888-1-git-send-email-pab@pabigot.com>
Subject: [meta-oe][PATCH 2/5] gpsd: update to 3.10
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
X-List-Received-Date: Thu, 28 Aug 2014 12:13:43 -0000

Patches rebased onto new version with no material changes.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 ...truct-respect-sysroot-also-in-SPLINTOPTS.patch} | 19 ++++++----
 .../0002-SConstruct-remove-rpath.patch}            | 19 ++++++----
 ...refix-includepy-with-sysroot-and-drop-sy.patch} | 27 ++++++++------
 ...isable-html-and-man-docs-building-becaus.patch} | 43 ++++++++++++----------
 .../gpsd/{gpsd_3.7.bb => gpsd_3.10.bb}             | 14 +++----
 5 files changed, 66 insertions(+), 56 deletions(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.7/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch => gpsd-3.10/0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch} (61%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.7/0004-SConstruct-remove-rpath.patch => gpsd-3.10/0002-SConstruct-remove-rpath.patch} (75%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.7/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch => gpsd-3.10/0003-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch} (82%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.7/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch => gpsd-3.10/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch} (62%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.7.bb => gpsd_3.10.bb} (92%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.7/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
similarity index 61%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.7/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.10/0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
index 40baa01..c4134f4 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.7/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
@@ -1,22 +1,25 @@
-From f5f262be8ae54bd0c0f52802f2007ec89163756f Mon Sep 17 00:00:00 2001
+From 3c5fb3a8691ac711ea93edf8e0b42bffc62b197e Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 24 Apr 2012 11:52:35 +0200
-Subject: [PATCH 1/2] SConstruct: respect sysroot also in SPLINTOPTS
+Subject: [PATCH 1/4] SConstruct: respect sysroot also in SPLINTOPTS
+
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
+Signed-off-by: Peter A. Bigot <pab@pabigot.com>
 ---
- SConstruct |    5 ++++-
- 1 files changed, 4 insertions(+), 1 deletions(-)
+ SConstruct | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/SConstruct b/SConstruct
-index a25e88a..a1bddb9 100644
+index 14e2f59..f0cafa8 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -1277,7 +1277,10 @@ def Utility(target, source, action):
- 
+@@ -1414,7 +1414,10 @@ def Utility(target, source, action):
  # Report splint warnings
  # Note: test_bits.c is unsplintable because of the PRI64 macros.
+ # If you get preprocessor or fatal errors, add +showscan.
 -splintopts = "-I/usr/include/libusb-1.0 +quiet"
 +if not env['sysroot']:
 +    splintopts = "-I/usr/include/libusb-1.0 +quiet"
@@ -26,5 +29,5 @@ index a25e88a..a1bddb9 100644
  ma_status, ma = _getstatusoutput('dpkg-architecture -qDEB_HOST_MULTIARCH')
  if ma_status == 0:
 -- 
-1.7.5.4
+1.8.5.5
 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.7/0004-SConstruct-remove-rpath.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0002-SConstruct-remove-rpath.patch
similarity index 75%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.7/0004-SConstruct-remove-rpath.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.10/0002-SConstruct-remove-rpath.patch
index 83b98bb..083a662 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.7/0004-SConstruct-remove-rpath.patch
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0002-SConstruct-remove-rpath.patch
@@ -1,7 +1,7 @@
-From 7d736bbd517c12d19d7b85a5b0db84732b2f86da Mon Sep 17 00:00:00 2001
+From d090638ff983e509162d5e3b62aa4918de4aa5fa Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 24 Apr 2012 16:24:35 +0200
-Subject: [PATCH 2/2] SConstruct: remove rpath
+Subject: [PATCH 2/4] SConstruct: remove rpath
 
 * even with correct prefix (without DESTDIR) included it's redundant
   WARNING: QA Issue: libgps:
@@ -13,19 +13,22 @@ Subject: [PATCH 2/2] SConstruct: remove rpath
   in file
   /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/packages-split/libgps/usr/lib/libgps.so.20.0
 
+Upstream-Status: Inapppropriate [embedded specific]
+
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
+Signed-off-by: Peter A. Bigot <pab@pabigot.com>
 ---
- SConstruct |    7 +++++--
- 1 files changed, 5 insertions(+), 2 deletions(-)
+ SConstruct | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/SConstruct b/SConstruct
-index a1bddb9..3e7c607 100644
+index f0cafa8..ff46713 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -1205,8 +1205,11 @@ if qt_env:
+@@ -1340,8 +1340,11 @@ if qt_env:
+     binaryinstall.append(LibraryInstall(qt_env, installdir('libdir'), compiled_qgpsmmlib))
  
- # We don't use installdir here in order to avoid having DESTDIR affect the rpath
  if env["shared"] and env["chrpath"]:
 -    env.AddPostAction(binaryinstall, '$CHRPATH -r "%s" "$TARGET"' \
 -                      % (installdir('libdir', False), ))
@@ -38,5 +41,5 @@ index a1bddb9..3e7c607 100644
  if not env['debug'] and not env['profiling'] and env['strip']:
      env.AddPostAction(binaryinstall, '$STRIP $TARGET')
 -- 
-1.7.5.4
+1.8.5.5
 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.7/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0003-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
similarity index 82%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.7/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.10/0003-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
index c6eb03b..1d8c14b 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.7/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0003-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
@@ -1,8 +1,8 @@
-From dd3ca38b27cce93f7e932abaa27b41371234fa90 Mon Sep 17 00:00:00 2001
+From ad7b06d375730b30f181c5efb3bf21418f296f73 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 24 Apr 2012 18:45:14 +0200
-Subject: [PATCH] SConstruct: prefix includepy with sysroot and drop sysroot
- from python_lib_dir
+Subject: [PATCH 3/4] SConstruct: prefix includepy with sysroot and drop
+ sysroot from python_lib_dir
 
 * without PYTHONPATH, distutil's sysconfig returns INCLUDEPY without sysroot prefix
   and with PYTHONPATH from OE it's pointing to native python dir
@@ -30,19 +30,22 @@ Subject: [PATCH] SConstruct: prefix includepy with sysroot and drop sysroot
 * python_lib_dir = python_lib_dir.replace(env['sysroot'], '')
   returns path to target sysroot
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Peter A. Bigot <pab@pabigot.com>
 ---
- SConstruct |    9 +++++++++
- 1 files changed, 9 insertions(+), 0 deletions(-)
+ SConstruct | 9 +++++++++
+ 1 file changed, 9 insertions(+)
 
 diff --git a/SConstruct b/SConstruct
-index 3c919fc..8478181 100644
+index ff46713..0e518e7 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -932,6 +932,12 @@ else:
-         if vars[i] is None:
-             vars[i] = []
-     (cc, cxx, opt, basecflags, ccshared, ldshared, so_ext, includepy, ldflags) = vars
+@@ -1089,6 +1089,12 @@ else:
+         basecflags += ' -coverage'
+         ldflags += ' -coverage'
+         ldshared += ' -coverage'
 +
 +    if env['sysroot']:
 +        print "Prefixing includepy '%s' with sysroot prefix" % includepy
@@ -52,7 +55,7 @@ index 3c919fc..8478181 100644
      # in case CC/CXX was set to the scan-build wrapper,
      # ensure that we build the python modules with scan-build, too
      if env['CC'] is None or env['CC'].find('scan-build') < 0:
-@@ -1165,11 +1171,14 @@ if not env['python']:
+@@ -1353,11 +1359,14 @@ if not env['python']:
      python_install = []
  else:
      python_lib_dir = sysconfig.get_python_lib(plat_specific=1)
@@ -68,5 +71,5 @@ index 3c919fc..8478181 100644
      python_modules_install = python_env.Install( DESTDIR + python_module_dir,
                                                  python_modules)
 -- 
-1.7.8.5
+1.8.5.5
 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.7/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch
similarity index 62%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.7/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.10/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch
index 9db2432..8527f0d 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.7/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch
@@ -1,7 +1,7 @@
-From ca1a781afbd68697ef2f573557f1f93ec7ab8d3c Mon Sep 17 00:00:00 2001
+From 697e2e9ff97487266d817cdd41bacc83f681e3d7 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sun, 29 Apr 2012 00:05:59 +0200
-Subject: [PATCH] SConstruct: disable html and man docs building because
+Subject: [PATCH 4/4] SConstruct: disable html and man docs building because
  xmlto-native from OE is broken
 
 It will try to load dtd and fail:
@@ -20,30 +20,33 @@ It will try to load dtd and fail:
 | scons: *** [gpsctl.1] Error 1
 | scons: building terminated because of errors.
 
+Upstream-Status: Inappropriate [disable feature]
+
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Peter A. Bigot <pab@pabigot.com>
 ---
- SConstruct |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ SConstruct | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/SConstruct b/SConstruct
-index 9c0f751..8236abb 100644
+index 0e518e7..c01a71b 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -560,12 +560,12 @@ size_t strlcpy(/*@out@*/char *dst, /*@in@*/const char *src, size_t size);
- 
+@@ -704,12 +704,12 @@ size_t strlcpy(/*@out@*/char *dst, /*@in@*/const char *src, size_t size);
  
- manbuilder = mangenerator = htmlbuilder = None
--if config.CheckXsltproc():
-+if False and config.CheckXsltproc():
-     mangenerator = 'xsltproc'
-     build = "xsltproc --nonet %s $SOURCE >$TARGET"
-     htmlbuilder = build % docbook_html_uri
-     manbuilder = build % docbook_man_uri
--elif WhereIs("xmlto"):
-+elif False and WhereIs("xmlto"):
-     mangenerator = 'xmlto'
-     htmlbuilder = "xmlto html-nochunks $SOURCE; mv `basename $TARGET` $TARGET"
-     manbuilder = "xmlto man $SOURCE; mv `basename $TARGET` $TARGET"
+     manbuilder = mangenerator = htmlbuilder = None
+     if env['manbuild']:
+-        if config.CheckXsltproc():
++        if False and config.CheckXsltproc():
+             mangenerator = 'xsltproc'
+             build = "xsltproc --nonet %s $SOURCE >$TARGET"
+             htmlbuilder = build % docbook_html_uri
+             manbuilder = build % docbook_man_uri
+-        elif WhereIs("xmlto"):
++        elif False and WhereIs("xmlto"):
+             mangenerator = 'xmlto'
+             xmlto = "xmlto %s $SOURCE || mv `basename $TARGET` `dirname $TARGET`"
+             htmlbuilder = xmlto % "html-nochunks"
 -- 
-1.7.8.6
+1.8.5.5
 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
similarity index 92%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
index 8c6a6f7..d12c7a8 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
@@ -7,20 +7,18 @@ PROVIDES = "virtual/gpsd"
 
 EXTRANATIVEPATH += "chrpath-native"
 
-PR = "r14"
-
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
-    file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
-    file://0004-SConstruct-remove-rpath.patch \
-    file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
-    file://0001-SConstruct-disable-html-and-man-docs-building-becaus.patch \
+    file://0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
+    file://0002-SConstruct-remove-rpath.patch \
+    file://0003-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
+    file://0004-SConstruct-disable-html-and-man-docs-building-becaus.patch \
     file://gpsd-default \
     file://gpsd \
     file://60-gpsd.rules \
     file://gpsd.service \
 "
-SRC_URI[md5sum] = "52d9785eaf1a51298bb8900dbde88f98"
-SRC_URI[sha256sum] = "7800c478ee9d7ca7a502b0f892828561b1fbf7bc69d9d38c447c82c3628302ac"
+SRC_URI[md5sum] = "fc5b03aae38b9b5b6880b31924d0ace3"
+SRC_URI[sha256sum] = "706fc2c1cf3dfbf87c941f543381bccc9c4dc9f8240eec407dcbf2f70b854320"
 
 inherit scons update-rc.d python-dir pythonnative systemd
 
-- 
1.8.5.5


