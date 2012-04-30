Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkLe-0004jm-37
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:44:38 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2078332wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Z69C2TgvoHLEsPGGCwFe4bF4XxX8im6qZvsI/J35Nb8=;
	b=tpkRpkuXfRC6ufBjX/VHhEmMnTUgnS4QXUgX3Azsz68zzCodeauJQfOGbeMrVxEReL
	7bqrmvYf3zdPcmCmznXX7zciWcqxNZ5flz90kC3QBWC1OMz8aUcpAaWKU8qsGSga94o4
	ZZu6qkIK5GErzvTqefL8HDMHqegO3Y5WGvMhZg0B7c7PfIKLqVbJRd2wq2x/0vRcYL6k
	0Qqhi2sZmY6KmPX3bjSjLiIcvILnCapW/G63mPWsKKrrqapQgiMpy8XYjvpAUJY5wquX
	uFQI8O2yfZJOxS+OhU+fiHzEPycwR2r7oyfestnoM1J3+dQU3JWERZqFKDw9WaO+Wxfw
	ugQg==
Received: by 10.180.79.135 with SMTP id j7mr26017636wix.19.1335767698739;
	Sun, 29 Apr 2012 23:34:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff2sm41902048wib.9.2012.04.29.23.34.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:34:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:33:10 +0200
Message-Id: <c6135b0d88a39354ba4213e71ef0941c48d88707.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 13/16] gpsd-3.4: fix python paths and RPATHs
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
X-List-Received-Date: Mon, 30 Apr 2012 06:44:38 -0000

* see included patch for description

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...prefix-includepy-with-sysroot-and-drop-sy.patch |   72 ++++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |    1 +
 2 files changed, 73 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
new file mode 100644
index 0000000..27c6aad
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
@@ -0,0 +1,72 @@
+From bc224302f1665078c8d15138318709c1a1c2c0a0 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 24 Apr 2012 18:45:14 +0200
+Subject: [PATCH] SConstruct: prefix includepy with sysroot and drop sysroot
+ from python_lib_dir
+
+* without PYTHONPATH, distutil's sysconfig returns INCLUDEPY without sysroot prefix
+  and with PYTHONPATH from OE it's pointing to native python dir
+
+    $ export PYTHONPATH=/OE/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib/python2.7/
+    $ python
+    Python 2.7.2 (default, Apr 18 2012, 09:19:59)
+    [GCC 4.6.2] on linux2
+    Type "help", "copyright", "credits" or "license" for more information.
+    >>> from distutils import sysconfig
+    >>> sysconfig.get_config_vars('INCLUDEPY')
+    ['/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/python2.7']
+    >>>
+    $ unset PYTHONPATH
+    $ python
+    Python 2.7.2 (default, Apr 18 2012, 09:19:59)
+    [GCC 4.6.2] on linux2
+    Type "help", "copyright", "credits" or "license" for more information.
+    >>> from distutils import sysconfig
+    >>> sysconfig.get_config_vars('INCLUDEPY')
+    ['/python2.7']
+    >>> import sysconfig
+    >>> sysconfig.get_config_vars('INCLUDEPY')
+    ['/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/python2.7']
+* python_lib_dir = python_lib_dir.replace(env['sysroot'], '')
+  returns path to target sysroot
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ SConstruct |    9 +++++++++
+ 1 files changed, 9 insertions(+), 0 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index 9ff00c1..9c0f751 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -924,6 +924,12 @@ else:
+         if vars[i] is None:
+             vars[i] = ""
+     (cc, cxx, opt, basecflags, ccshared, ldshared, so_ext, includepy) = vars
++
++    if env['sysroot']:
++        print "Prefixing includepy '%s' with sysroot prefix" % includepy
++        includepy = os.path.normpath("%s/%s/%s/%s" % (env['sysroot'], env['prefix'], env['includedir'], includepy))
++        print "'%s'" % includepy
++
+     # in case CC/CXX was set to the scan-build wrapper,
+     # ensure that we build the python modules with scan-build, too
+     if env['CC'] is None or env['CC'].find('scan-build') < 0:
+@@ -1158,11 +1164,14 @@ if not env['python']:
+     python_install = []
+ else:
+     python_lib_dir = sysconfig.get_python_lib(plat_specific=1)
++    python_lib_dir = python_lib_dir.replace(env['sysroot'], '')
+     python_module_dir = python_lib_dir + os.sep + 'gps'
+     python_extensions_install = python_env.Install( DESTDIR + python_module_dir,
+                                                     python_built_extensions)
+     if not env['debug'] or env['profiling']:
+         python_env.AddPostAction(python_extensions_install, '$STRIP $TARGET')
++    env.AddPostAction(python_extensions_install, '$CHRPATH -r "%s" "$TARGET"' \
++                     % (python_lib_dir, ))
+ 
+     python_modules_install = python_env.Install( DESTDIR + python_module_dir,
+                                                 python_modules)
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index 0796c34..37bd319 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch \
   file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
   file://0004-SConstruct-remove-rpath.patch \
+  file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
   file://gpsd-default \
   file://gpsd \
   file://60-gpsd.rules \
-- 
1.7.8.6



