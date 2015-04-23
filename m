Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8BD6AC24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 16:48:36 +0000 (UTC)
Received: by qgdy78 with SMTP id y78so10916818qgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 09:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=EHM/aDDhhJXtfNFnFeFjFrrtf/q6YkpzHgdRSrU9jZg=;
	b=ptmsldbiG9ZckwTiITSnZLGSYYcKdA1mchCKS/uyNpSHd3BtOtG9yr41USh9hUfDz+
	c2vrrbxWcN7pZCYamvS/lAnu6bNxwPRqPkbkgaCkQKZtyeLq73Fa6nEIJmkpYdplbSEU
	tgUOvuVJFt9QZ7rz5QhunvR05W3IW9CYpTx96BuejQNj113FTTeIPsj12yeg8FGC6P9A
	Mv8cFNxtFwlHo86kBYncTpF0u/iXaWIOaF2tbwsitYc2PGQ33TDLq6EAphGxhM3d56NQ
	XflKw5ikmuOp++1hk6PHMcmRgZwUGVuCqVCMGVp0cimn2nDW42LnkLeAVEjT45DZw6pp
	6l9g==
X-Received: by 10.140.231.85 with SMTP id b82mr4502444qhc.2.1429807717571;
	Thu, 23 Apr 2015 09:48:37 -0700 (PDT)
Received: from thuvia.localdomain ([108.44.121.228])
	by mx.google.com with ESMTPSA id f64sm6290215qhc.37.2015.04.23.09.48.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Apr 2015 09:48:37 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2015 12:48:33 -0400
Message-Id: <1429807713-14290-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH] gpsd: Update to 3.14.
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
X-List-Received-Date: Thu, 23 Apr 2015 16:48:37 -0000

 * _NO_ATOMICS patches are from upstream
 * Update the SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
 * Fix some QA warnings
 * Add PACKAGECONFIG for qt support

Signed-off-by: Philip Balister <philip@balister.org>
---
 ..._STDC_NO_ATOMICS__-before-using-stdatomic.patch | 25 ++++++++++
 ...refix-includepy-with-sysroot-and-drop-sy.patch} | 18 +++----
 ...struct-respect-sysroot-also-in-SPLINTOPTS.patch |  0
 ...for-C11-and-check-we-have-C11-before-usin.patch | 57 ++++++++++++++++++++++
 .../0002-SConstruct-remove-rpath.patch             |  0
 ...k-for-C11-not-for-not-C11-in-stdatomic.h-.patch | 26 ++++++++++
 ...disable-html-and-man-docs-building-becaus.patch |  0
 .../gpsd/{gpsd_3.10.bb => gpsd_3.14.bb}            | 17 ++++---
 8 files changed, 128 insertions(+), 15 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Check-for-__STDC_NO_ATOMICS__-before-using-stdatomic.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.10/0003-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch => gpsd-3.14/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch} (86%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.10 => gpsd-3.14}/0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch (100%)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.10 => gpsd-3.14}/0002-SConstruct-remove-rpath.patch (100%)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.10 => gpsd-3.14}/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.10.bb => gpsd_3.14.bb} (87%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Check-for-__STDC_NO_ATOMICS__-before-using-stdatomic.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Check-for-__STDC_NO_ATOMICS__-before-using-stdatomic.patch
new file mode 100644
index 0000000..82ac5aa
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Check-for-__STDC_NO_ATOMICS__-before-using-stdatomic.patch
@@ -0,0 +1,25 @@
+From c30716be9e615513fe66993fd3cdc818c3d70410 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Sun, 15 Mar 2015 11:51:45 -0700
+Subject: [PATCH 1/3] Check for __STDC_NO_ATOMICS__ before using stdatomic.h
+
+---
+ SConstruct | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/SConstruct b/SConstruct
+index adf473d..566c14a 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -633,7 +633,7 @@ else:
+         announce("You do not have kernel CANbus available.")
+         env["nmea2000"] = False
+ 
+-    if config.CheckHeader("stdatomic.h"):
++    if not config.CheckCompilerDefines("__STDC_NO_ATOMICS__") and config.CheckHeader("stdatomic.h"):
+         confdefs.append("#define HAVE_STDATOMIC_H 1\n")
+     else:
+ 	confdefs.append("/* #undef HAVE_STDATOMIC_H */\n")
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0003-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
similarity index 86%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.10/0003-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
index 1d8c14b..2ea3226 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0003-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
@@ -1,8 +1,8 @@
-From ad7b06d375730b30f181c5efb3bf21418f296f73 Mon Sep 17 00:00:00 2001
+From 1e2cea8945bc2183fbe1a012dcd633a352125952 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 24 Apr 2012 18:45:14 +0200
-Subject: [PATCH 3/4] SConstruct: prefix includepy with sysroot and drop
- sysroot from python_lib_dir
+Subject: [PATCH] SConstruct: prefix includepy with sysroot and drop sysroot
+ from python_lib_dir
 
 * without PYTHONPATH, distutil's sysconfig returns INCLUDEPY without sysroot prefix
   and with PYTHONPATH from OE it's pointing to native python dir
@@ -39,10 +39,10 @@ Signed-off-by: Peter A. Bigot <pab@pabigot.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/SConstruct b/SConstruct
-index ff46713..0e518e7 100644
+index 6c93311..cde8b3d 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -1089,6 +1089,12 @@ else:
+@@ -1148,6 +1148,12 @@ else:
          basecflags += ' -coverage'
          ldflags += ' -coverage'
          ldshared += ' -coverage'
@@ -55,15 +55,15 @@ index ff46713..0e518e7 100644
      # in case CC/CXX was set to the scan-build wrapper,
      # ensure that we build the python modules with scan-build, too
      if env['CC'] is None or env['CC'].find('scan-build') < 0:
-@@ -1353,11 +1359,14 @@ if not env['python']:
+@@ -1408,11 +1414,14 @@ if not env['python']:
      python_install = []
  else:
-     python_lib_dir = sysconfig.get_python_lib(plat_specific=1)
+     python_lib_dir = env['python_libdir']
 +    python_lib_dir = python_lib_dir.replace(env['sysroot'], '')
      python_module_dir = python_lib_dir + os.sep + 'gps'
      python_extensions_install = python_env.Install( DESTDIR + python_module_dir,
                                                      python_built_extensions)
-     if not env['debug'] and not env['profiling'] and env['strip']:
+     if not env['debug'] and not env['profiling'] and not env['nostrip'] and not sys.platform.startswith('darwin'):
          python_env.AddPostAction(python_extensions_install, '$STRIP $TARGET')
 +    env.AddPostAction(python_extensions_install, '$CHRPATH -r "%s" "$TARGET"' \
 +                     % (python_lib_dir, ))
@@ -71,5 +71,5 @@ index ff46713..0e518e7 100644
      python_modules_install = python_env.Install( DESTDIR + python_module_dir,
                                                  python_modules)
 -- 
-1.8.5.5
+2.1.0
 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.10/0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.patch
new file mode 100644
index 0000000..22ee1bd
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.patch
@@ -0,0 +1,57 @@
+From 99444b3d2c4a4f7fd7128e60461005780d0c5c83 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Sun, 15 Mar 2015 12:05:15 -0700
+Subject: [PATCH 2/3] Add a test for C11 and check we have C11 before using
+ stdatomic.h
+
+---
+ SConstruct | 19 ++++++++++++++++++-
+ 1 file changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/SConstruct b/SConstruct
+index 566c14a..faa8651 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -473,6 +473,20 @@ def CheckCompilerDefines(context, define):
+     context.Result(ret)
+     return ret
+ 
++# Check if this compiler is C11 or better
++def CheckC11(context):
++    context.Message( 'Checking if compiler is C11 ...' )
++    ret = context.TryLink("""
++	#if (__STDC_VERSION__ < 201112L) 
++        #error Not C11
++        #endif
++        int main(int argc, char **argv) {
++            return 0;
++        }
++    """,'.c')
++    context.Result(ret)
++    return ret
++
+ def GetLoadPath(context):
+     context.Message("Getting system load path ...")
+ 
+@@ -491,6 +505,7 @@ else:
+                                              'CheckXsltproc' : CheckXsltproc,
+                                              'CheckCompilerOption' : CheckCompilerOption,
+                                              'CheckCompilerDefines' : CheckCompilerDefines,
++                                             'CheckC11' : CheckC11,
+                                              'CheckHeaderDefines' : CheckHeaderDefines})
+ 
+ 
+@@ -633,7 +648,9 @@ else:
+         announce("You do not have kernel CANbus available.")
+         env["nmea2000"] = False
+ 
+-    if not config.CheckCompilerDefines("__STDC_NO_ATOMICS__") and config.CheckHeader("stdatomic.h"):
++    # check for C11 or better, and __STDC__NO_ATOMICS__ is no defined
++    # before looking for stdatomic.h
++    if not config.CheckC11() and  not config.CheckCompilerDefines("__STDC_NO_ATOMICS__") and config.CheckHeader("stdatomic.h"):
+         confdefs.append("#define HAVE_STDATOMIC_H 1\n")
+     else:
+ 	confdefs.append("/* #undef HAVE_STDATOMIC_H */\n")
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0002-SConstruct-remove-rpath.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-SConstruct-remove-rpath.patch
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.10/0002-SConstruct-remove-rpath.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-SConstruct-remove-rpath.patch
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch
new file mode 100644
index 0000000..8bb0928
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch
@@ -0,0 +1,26 @@
+From 674c50ee54fd7cd304e8b3c4b33d3ff1272ed191 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Sun, 15 Mar 2015 12:17:51 -0700
+Subject: [PATCH 3/3] Whoops, check for C11, not for not C11 in stdatomic.h
+ test.
+
+---
+ SConstruct | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/SConstruct b/SConstruct
+index faa8651..f4ea145 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -650,7 +650,7 @@ else:
+ 
+     # check for C11 or better, and __STDC__NO_ATOMICS__ is no defined
+     # before looking for stdatomic.h
+-    if not config.CheckC11() and  not config.CheckCompilerDefines("__STDC_NO_ATOMICS__") and config.CheckHeader("stdatomic.h"):
++    if config.CheckC11() and  not config.CheckCompilerDefines("__STDC_NO_ATOMICS__") and config.CheckHeader("stdatomic.h"):
+         confdefs.append("#define HAVE_STDATOMIC_H 1\n")
+     else:
+ 	confdefs.append("/* #undef HAVE_STDATOMIC_H */\n")
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.10/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.14/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
similarity index 87%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index 93cf1ae..f92d132 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -10,15 +10,18 @@ EXTRANATIVEPATH += "chrpath-native"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
     file://0002-SConstruct-remove-rpath.patch \
-    file://0003-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
+    file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
     file://0004-SConstruct-disable-html-and-man-docs-building-becaus.patch \
+    file://0001-Check-for-__STDC_NO_ATOMICS__-before-using-stdatomic.patch \
+    file://0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.patch \
+    file://0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch \
     file://gpsd-default \
     file://gpsd \
     file://60-gpsd.rules \
     file://gpsd.service \
 "
-SRC_URI[md5sum] = "fc5b03aae38b9b5b6880b31924d0ace3"
-SRC_URI[sha256sum] = "706fc2c1cf3dfbf87c941f543381bccc9c4dc9f8240eec407dcbf2f70b854320"
+SRC_URI[md5sum] = "bc7467009b99e07ba461377b5da6c039"
+SRC_URI[sha256sum] = "504fc812f3c1525a1a48e04bf4d77f9a8066c201448d98089df89d58ef53a8cb"
 
 inherit scons update-rc.d python-dir pythonnative systemd bluetooth
 
@@ -30,14 +33,15 @@ SYSTEMD_OESCONS = "${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
+PACKAGECONFIG ??= "qt ${@base_contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
 PACKAGECONFIG[bluez4] = "bluez='true',bluez='false',bluez4"
-
+PACKAGECONFIG[qt] = "qt='yes',qt='no',qt4-x11-free"
 EXTRA_OESCONS = " \
     sysroot=${STAGING_DIR_TARGET} \
     libQgpsmm='false' \
     debug='true' \
     strip='false' \
+    chrpath='yes' \
     systemd='${SYSTEMD_OESCONS}' \
     ${EXTRA_OECONF} \
 "
@@ -99,7 +103,8 @@ pkg_postrm_${PN}-conf() {
 
 PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
 
-FILES_${PN}-dev += "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc"
+FILES_${PN}-dev += "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc \
+                    ${libdir}/libQgpsmm.prl"
 
 FILES_python-pygps-dbg += " ${libdir}/python*/site-packages/gps/.debug"
 
-- 
2.1.0


