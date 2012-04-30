Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkKp-0004Pt-GW
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:43:47 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so1806017wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=q9gpXiIGdmvcJoegWBSbVnkyHkANSfxtiaBHx2lhF60=;
	b=02GNqq5zvbG3HVRL94abfUGvZIFIrtFAniBaiGDSLlgcNMHjrJbeGgQRpHynFxCjpw
	8JyZWc0Pd9/CIjKZbuILrYX3VCoPZUDoXPdEhchF8X6VsN+kBPrLMij7pLxgpewkLO6J
	jjEb8h5SQNM9N1c5Y12OUnUs9eA9EqhL0qSgD0OiAZdw9OOYqy7W/X+eQbDnqyvIXjDj
	4KVr/+HnbQyHf3V/U4p3xp+FzPh2MHvkKfgbW/+f3fawWEVG6Bcsle9jOKq0fCoR7SNW
	Tv5l409J6fbADEcT3mTtYxzNmmhV9HI9m8G8AzDG0ltCjgNW/OHkOS47rEw1Wrt/8FQn
	HlEg==
Received: by 10.180.24.7 with SMTP id q7mr3795216wif.11.1335767648223;
	Sun, 29 Apr 2012 23:34:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm26402835wix.0.2012.04.29.23.34.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:34:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:33:03 +0200
Message-Id: <1c4eff918d6268cf211e77b8b0a22603f9d6c4f3.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/16] gpsd: pass sysroot param to scons and fix SConstruct to respect that
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
X-List-Received-Date: Mon, 30 Apr 2012 06:43:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...respect-sysroot-setting-when-prepending-L.patch |   36 ++++++++++++++++++++
 ...struct-respect-sysroot-also-in-SPLINTOPTS.patch |   29 ++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |    7 +++-
 3 files changed, 71 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch
new file mode 100644
index 0000000..6b720a5
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch
@@ -0,0 +1,36 @@
+From 7427bb23092b3e395d14e42cd3b64691082fe826 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 24 Apr 2012 10:58:26 +0200
+Subject: [PATCH 1/4] SConstruct: respect sysroot setting when prepending
+ LIBPATH/RPATH
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ SConstruct |   11 ++++++++---
+ 1 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index 22bc9f4..21b2205 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -269,9 +269,14 @@ def installdir(dir, add_destdir=True):
+     return wrapped
+ 
+ # Honor the specified installation prefix in link paths.
+-env.Prepend(LIBPATH=[installdir('libdir')])
+-if env["shared"]:
+-    env.Prepend(RPATH=[installdir('libdir')])
++if env['sysroot']:
++    env.Prepend(LIBPATH=[os.path.normpath("%s/%s/%s" % (env['sysroot'], env['prefix'], env['libdir']))])
++    if env["shared"]:
++        env.Prepend(RPATH=[os.path.normpath("%s/%s/%s" % (env['sysroot'], env['prefix'], env['libdir']))])
++else:
++    env.Prepend(LIBPATH=[installdir('libdir')])
++    if env["shared"]:
++        env.Prepend(RPATH=[installdir('libdir')])
+ 
+ # Give deheader a way to set compiler flags
+ if 'MORECFLAGS' in os.environ:
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
new file mode 100644
index 0000000..55ef704
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
@@ -0,0 +1,29 @@
+From 5266eb72cbc8193faa2345b8774b0f159e61c067 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 24 Apr 2012 11:52:35 +0200
+Subject: [PATCH 2/4] SConstruct: respect sysroot also in SPLINTOPTS
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ SConstruct |    5 ++++-
+ 1 files changed, 4 insertions(+), 1 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index 21b2205..0cf5799 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -1224,7 +1224,10 @@ def Utility(target, source, action):
+ 
+ # Report splint warnings
+ # Note: test_bits.c is unsplintable because of the PRI64 macros.
+-env['SPLINTOPTS'] = "-I/usr/include/libusb-1.0 +quiet"
++if env['sysroot']:
++    env['SPLINTOPTS'] = "-I%s/usr/include/libusb-1.0 +quiet" % env['sysroot']
++else:
++    env['SPLINTOPTS'] = "-I/usr/include/libusb-1.0 +quiet"
+ 
+ def Splint(target,sources, description, params):
+     return Utility(target,sources+generated_sources,[
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index bb79368..7502f9a 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -7,6 +7,8 @@ PROVIDES = "virtual/gpsd"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch \
+  file://0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch \
+  file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
   file://gpsd-default \
   file://gpsd \
   file://gpsd.socket \
@@ -28,16 +30,19 @@ export STAGING_INCDIR
 export STAGING_LIBDIR
 
 EXTRA_OESCONS = " \
+  sysroot=${STAGING_DIR_TARGET} \
   libQgpsmm='false' \
   debug='true' \
   strip='false' \
   systemd='true' \
 "
+# this cannot be used, because then chrpath is not found and only static lib is built
+# target=${HOST_SYS}
 
 do_compile_prepend() {
-    export LIBPATH="${STAGING_LIBDIR}"
     export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
     export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
+
     export BUILD_SYS="${BUILD_SYS}"
     export HOST_SYS="${HOST_SYS}"
 }
-- 
1.7.8.6



