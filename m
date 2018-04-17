Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6C0B460116
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 12:40:08 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u4so3701175wrg.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 05:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=N70VW1Kdku4Ssla/sbAR6xsK5PF/PZckvhL6u4XX07w=;
	b=T+nTGre8dFZwGPm2VIAHmEMQ4YEGpNJIZBwEaiTZrxUA0svpMu+NN+/JdtPzRFhXph
	WmXsCL/3uyx4vqr/ZxPX9PvafWJLWdiKSDAaAd37EVmWVoU0vovjwkEf27sFnDPZfyUb
	4TAH5dols1HwNKJWHqGoXRD3fbWzUcVF8vCOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N70VW1Kdku4Ssla/sbAR6xsK5PF/PZckvhL6u4XX07w=;
	b=tMo5FZehRffIcl+jEjSnZkSdCZG2MkA3dZJX1EMXUad5ITtasiJHzimWQ4JrdyBDa8
	HZrYrQrK8dVkJ75cj2wBiyxVDDLeQgyJ4zBHzFHPQYLP5LnIe28AVC8kaxmncn8FX0jC
	bMKChshWyQGIaNM0NjCw1txPpDR0tg/nlav3xBN4JAKiA+QxyMIv8EAJuwKbJ+YWOo2G
	f/fqIYHfSn90elQSpXQ+9QMAM4gxwlFtrTP4XfjKqqNlj8i7zsIoekPs3C2woMeE7Q9P
	EVXNsXJY677opi2OPJp8mch4CnmlUVCRuaJmLZtpyWGmKuOPGs9wC5arcuBX4yz3N/dv
	gsyw==
X-Gm-Message-State: ALQs6tA0u85s8tKZPYuVgboneKFBW2HQF2mqx+4x/6/nyddJEn4Ru428
	yDJQxUN/xg0R7Mh9lrcp0XpgADU/ItU=
X-Google-Smtp-Source: AIpwx49FnmBmkTEOavYtrqyDs83yAsLFqo27XmbWhitwMEFZXuthDJiGSHn+jsV7EA6QwoYQ+TBaCA==
X-Received: by 10.28.186.136 with SMTP id k130mr874562wmf.101.1523968809140;
	Tue, 17 Apr 2018 05:40:09 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	c141sm14638425wmh.21.2018.04.17.05.40.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Apr 2018 05:40:06 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Apr 2018 14:38:02 +0200
Message-Id: <20180417123802.4466-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.14.2
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, ramon.fried@linaro.org
Subject: [PATCH] gpsd: upgrade to 3.17
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
X-List-Received-Date: Tue, 17 Apr 2018 12:40:09 -0000

This is based on out of tree recipe in meta-medusa-dist, from Tristan
Ramseyer. Tested on Dragonboard 410c.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 ...prefix-includepy-with-sysroot-and-drop-sy.patch | 52 ++++++++++++----------
 .../0001-include-sys-ttydefaults.h.patch           |  4 +-
 ...disable-html-and-man-docs-building-becaus.patch | 11 +++--
 .../gpsd/{gpsd_3.16.bb => gpsd_3.17.bb}            |  4 +-
 4 files changed, 38 insertions(+), 33 deletions(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.16 => gpsd-3.17}/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch (54%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.16 => gpsd-3.17}/0001-include-sys-ttydefaults.h.patch (94%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.16 => gpsd-3.17}/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch (89%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.16.bb => gpsd_3.17.bb} (97%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.16/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
similarity index 54%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.16/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
index 2ea3226a4..1fa27c210 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.16/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
@@ -39,36 +39,42 @@ Signed-off-by: Peter A. Bigot <pab@pabigot.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/SConstruct b/SConstruct
-index 6c93311..cde8b3d 100644
+index 3318bb48..e1c4f963 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -1148,6 +1148,12 @@ else:
-         basecflags += ' -coverage'
-         ldflags += ' -coverage'
-         ldshared += ' -coverage'
-+
-+    if env['sysroot']:
-+        print "Prefixing includepy '%s' with sysroot prefix" % includepy
-+        includepy = os.path.normpath("%s/%s/%s/%s" % (env['sysroot'], env['prefix'], env['includedir'], includepy))
-+        print "'%s'" % includepy
-+
-     # in case CC/CXX was set to the scan-build wrapper,
-     # ensure that we build the python modules with scan-build, too
-     if env['CC'] is None or env['CC'].find('scan-build') < 0:
-@@ -1408,11 +1414,14 @@ if not env['python']:
+@@ -934,7 +934,7 @@ else:
+ 
+ # Set up configuration for target Python
+ 
+-PYTHON_LIBDIR_CALL = 'sysconfig.get_python_lib()'
++PYTHON_LIBDIR_CALL = 'sysconfig.get_python_lib(plat_specific=1)'
+ 
+ PYTHON_CONFIG_NAMES = ['CC', 'CXX', 'OPT', 'BASECFLAGS',
+                        'CCSHARED', 'LDSHARED', 'SO', 'INCLUDEPY', 'LDFLAGS']
+@@ -1364,7 +1364,7 @@ else:
+                        LINK=ldshared,
+                        SHLIBPREFIX="",
+                        SHLIBSUFFIX=python_config['SO'],
+-                       CPPPATH=[python_config['INCLUDEPY']],
++                       CPPPATH=[os.path.normpath("%s/%s/%s/%s" % (env['sysroot'], env['prefix'], env['includedir'], python_config['INCLUDEPY']))] if env['sysroot'] else [python_config['INCLUDEPY']],
+                        CPPFLAGS=python_config['OPT'],
+                        CFLAGS=python_config['BASECFLAGS'],
+                        CXXFLAGS=python_config['BASECFLAGS'])
+@@ -1662,12 +1662,15 @@ if ((not env['debug'] and not env['profiling'] and not env['nostrip']
+ if not env['python']:
      python_install = []
  else:
-     python_lib_dir = env['python_libdir']
-+    python_lib_dir = python_lib_dir.replace(env['sysroot'], '')
-     python_module_dir = python_lib_dir + os.sep + 'gps'
-     python_extensions_install = python_env.Install( DESTDIR + python_module_dir,
-                                                     python_built_extensions)
-     if not env['debug'] and not env['profiling'] and not env['nostrip'] and not sys.platform.startswith('darwin'):
++    python_libdir = python_libdir.replace(env['sysroot'], '')
+     python_module_dir = python_libdir + os.sep + 'gps'
+     python_extensions_install = python_env.Install(DESTDIR + python_module_dir,
+                                                    python_built_extensions)
+     if ((not env['debug'] and not env['profiling']
+          and not env['nostrip'] and not sys.platform.startswith('darwin'))):
          python_env.AddPostAction(python_extensions_install, '$STRIP $TARGET')
 +    env.AddPostAction(python_extensions_install, '$CHRPATH -r "%s" "$TARGET"' \
-+                     % (python_lib_dir, ))
++                     % (python_libdir, ))
  
-     python_modules_install = python_env.Install( DESTDIR + python_module_dir,
+     python_modules_install = python_env.Install(DESTDIR + python_module_dir,
                                                  python_modules)
 -- 
 2.1.0
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.16/0001-include-sys-ttydefaults.h.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-include-sys-ttydefaults.h.patch
similarity index 94%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.16/0001-include-sys-ttydefaults.h.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-include-sys-ttydefaults.h.patch
index f496b5e7d..e91e4e9fb 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.16/0001-include-sys-ttydefaults.h.patch
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-include-sys-ttydefaults.h.patch
@@ -19,10 +19,10 @@ Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/gpsmon.c b/gpsmon.c
-index ead84d0..f205cb1 100644
+index 89c43ee2..5cc0dabd 100644
 --- a/gpsmon.c
 +++ b/gpsmon.c
-@@ -20,6 +20,7 @@
+@@ -24,6 +24,7 @@
  #include <sys/types.h>
  #include <sys/stat.h>
  #include <sys/select.h>
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.16/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch
similarity index 89%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.16/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.17/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch
index 8527f0db3..ba3d205d1 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.16/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch
@@ -29,23 +29,22 @@ Signed-off-by: Peter A. Bigot <pab@pabigot.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/SConstruct b/SConstruct
-index 0e518e7..c01a71b 100644
+index 3318bb48..a5bb756d 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -704,12 +704,12 @@ size_t strlcpy(/*@out@*/char *dst, /*@in@*/const char *src, size_t size);
+@@ -889,11 +889,11 @@ else:
  
-     manbuilder = mangenerator = htmlbuilder = None
+     manbuilder = htmlbuilder = None
      if env['manbuild']:
 -        if config.CheckXsltproc():
 +        if False and config.CheckXsltproc():
-             mangenerator = 'xsltproc'
              build = "xsltproc --nonet %s $SOURCE >$TARGET"
              htmlbuilder = build % docbook_html_uri
              manbuilder = build % docbook_man_uri
 -        elif WhereIs("xmlto"):
 +        elif False and WhereIs("xmlto"):
-             mangenerator = 'xmlto'
-             xmlto = "xmlto %s $SOURCE || mv `basename $TARGET` `dirname $TARGET`"
+             xmlto = "xmlto %s $SOURCE || mv `basename $TARGET` " \
+                     "`dirname $TARGET`"
              htmlbuilder = xmlto % "html-nochunks"
 -- 
 1.8.5.5
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
similarity index 97%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
index 41f01bb89..d526db2be 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
@@ -12,8 +12,8 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0004-SConstruct-disable-html-and-man-docs-building-becaus.patch \
     file://0001-include-sys-ttydefaults.h.patch \
 "
-SRC_URI[md5sum] = "68691b5de4c94f82ec4062b042b5eb63"
-SRC_URI[sha256sum] = "03579af13a4d3fe0c5b79fa44b5f75c9f3cac6749357f1d99ce5d38c09bc2029"
+SRC_URI[md5sum] = "e0cfadcf4a65dfbdd2afb11c58f4e4a1"
+SRC_URI[sha256sum] = "68e0dbecfb5831997f8b3d6ba48aed812eb465d8c0089420ab68f9ce4d85e77a"
 
 inherit scons update-rc.d python-dir pythonnative systemd bluetooth update-alternatives
 
-- 
2.14.2


