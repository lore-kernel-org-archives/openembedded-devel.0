Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkLn-0005DC-Ck
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:44:47 +0200
Received: by wera1 with SMTP id a1so1806484wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6a/kDHlf6qsAxnRokv0dmJg8gD2kr+RZpccccZgkxnc=;
	b=GyCTmSh0cPUp6Hx3AdFdFgQoRZ4KkurAHg4sskqVyrSZVrU+ioim0EuFbosA8ATHlo
	MO0zGfLBp1Y1Ql++Of9Kk+7CUQrCny5TMC+/FAcsQ+nKMAnYUVTg8KOMSaSBxJoU5Niy
	Y9YRAdaRo4nMVi+p3lRvurqAolOvTuExytjSgy8dFVZs4r3cIOGxeJOCZam98N6e46Pf
	9AUh5DsYa4xnnUXLwD6H70HCs0Mt4njGl50Lqmwr6BMiiaddNrqE8vTA+HoIDr9WpPAT
	1kYB6vaAyKQ49EDwQKik93RuF/jEs6fQj65qowgyQRVuxIpQk4h7i8CgjxKje5dxHViR
	Nu9w==
Received: by 10.180.107.101 with SMTP id hb5mr26441499wib.7.1335767706088;
	Sun, 29 Apr 2012 23:35:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff9sm26409031wib.2.2012.04.29.23.35.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:35:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:33:11 +0200
Message-Id: <867053702a7917ed599e87d415a7f210ecd5ff85.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 14/16] gpsd: fix python paths and RPATHs
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
X-List-Received-Date: Mon, 30 Apr 2012 06:44:47 -0000

* see included patch for description

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...prefix-includepy-with-sysroot-and-drop-sy.patch |   72 ++++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |    1 +
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |    1 +
 3 files changed, 74 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
new file mode 100644
index 0000000..c6eb03b
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
@@ -0,0 +1,72 @@
+From dd3ca38b27cce93f7e932abaa27b41371234fa90 Mon Sep 17 00:00:00 2001
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
+index 3c919fc..8478181 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -932,6 +932,12 @@ else:
+         if vars[i] is None:
+             vars[i] = []
+     (cc, cxx, opt, basecflags, ccshared, ldshared, so_ext, includepy, ldflags) = vars
++
++    if env['sysroot']:
++        print "Prefixing includepy '%s' with sysroot prefix" % includepy
++        includepy = os.path.normpath("%s/%s/%s/%s" % (env['sysroot'], env['prefix'], env['includedir'], includepy))
++        print "'%s'" % includepy
++
+     # in case CC/CXX was set to the scan-build wrapper,
+     # ensure that we build the python modules with scan-build, too
+     if env['CC'] is None or env['CC'].find('scan-build') < 0:
+@@ -1165,11 +1171,14 @@ if not env['python']:
+     python_install = []
+ else:
+     python_lib_dir = sysconfig.get_python_lib(plat_specific=1)
++    python_lib_dir = python_lib_dir.replace(env['sysroot'], '')
+     python_module_dir = python_lib_dir + os.sep + 'gps'
+     python_extensions_install = python_env.Install( DESTDIR + python_module_dir,
+                                                     python_built_extensions)
+     if not env['debug'] and not env['profiling'] and env['strip']:
+         python_env.AddPostAction(python_extensions_install, '$STRIP $TARGET')
++    env.AddPostAction(python_extensions_install, '$CHRPATH -r "%s" "$TARGET"' \
++                     % (python_lib_dir, ))
+ 
+     python_modules_install = python_env.Install( DESTDIR + python_module_dir,
+                                                 python_modules)
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
index bd65eae..a1c8f9f 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
   file://0003-Revert-The-strptime-prototype-is-not-provided-unless.patch \
   file://0004-SConstruct-remove-rpath.patch \
+  file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
   file://gpsd-default \
   file://gpsd \
   file://60-gpsd.rules \
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_git.bb b/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
index 8bb0d3e..68f0b9d 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://git.sv.gnu.org/gpsd.git;protocol=git;branch=master \
   file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
   file://0003-Revert-The-strptime-prototype-is-not-provided-unless.patch \
   file://0004-SConstruct-remove-rpath.patch \
+  file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
   file://gpsd-default \
   file://gpsd \
   file://60-gpsd.rules \
-- 
1.7.8.6



