Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2193378168
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 May 2017 11:11:36 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id k15so10985916wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 May 2017 04:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r5HzTvlwoXUeiTURPHxq+KJctRDusbEQ8T6F6DWGhzU=;
	b=unbSJH62E+YU1bkvy0DUbAnXeL+S8uN6mk/soiYzXE/eeUy+zRd2SsfxcG8CeQf/Q4
	PbrkfmB8Uu6fiMW2+5nmIW33Gt2Hox0uAlzqeoOEP3gFXcQMARgA/QAeoppl2b8+1XKz
	hQk14/JBr9qO7eUbhjMkBffB/YZa+MzuZlqKmnbSCa/GJghJ7Nu5U3ySI43DKtGfB8sc
	pp/7zQ5j7EAIjohVPH4HKCB9WmYzfvTsU9j/YO2/eEShQ/iYyu55xzbHfVAXkdO+58Cr
	ENWAmqOVoIxdwmIHlMMgJy4/5pwKzgXS7bR0NmaZQxoxPXZvWpWRiC/UaGyMhUDkzSLs
	yBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=r5HzTvlwoXUeiTURPHxq+KJctRDusbEQ8T6F6DWGhzU=;
	b=d/pqabJfmVC2WqCZ1z066Qtk0qXraUuFmhK5AHJ/cyOEzPwe0Pt6luy8DVmFQ5NPX+
	OU+fFFj/2mWpR45TWtp8wX0WAv5ywAIWBBUhrvDIKdjXoli50FEFyeTUfNp54iy974PL
	XFzGv2fBhRjeNP4ppu3OG9wrusqdeX4PJcoSPUAVGG9bHtR5nUvoL1ScTlC/UhVPcUEi
	5BgTITrHbbb/4lPNKKjDpc89MaE/buHykwgjtIXPq4boYNEkOj/9XtmAExu6mKOtoyy7
	IHwWBjWyIp0X9Y45lyc9gi7/ESEVxDclicU7YZJ0y+jIwx0pcsBadgFOOfgz8CSXXKv0
	nP0A==
X-Gm-Message-State: AODbwcDr/FznJPth3l50naD+Dmzdau8+XzwqMIA7w6X4ydgi8KY/G/SG
	UI161j+7vsaO//Uc
X-Received: by 10.80.135.188 with SMTP id a57mr9086326eda.90.1495969896914;
	Sun, 28 May 2017 04:11:36 -0700 (PDT)
Received: from Saturn.local.all (138-14-48-195.pool.dsl-net.ch.
	[195.48.14.138])
	by smtp.gmail.com with ESMTPSA id l4sm7210385edd.69.2017.05.28.04.11.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 28 May 2017 04:11:36 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 May 2017 13:10:40 +0200
Message-Id: <20170528111040.22809-2-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170528111040.22809-1-max.krummenacher@toradex.com>
References: <20170528111040.22809-1-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH 2/2] gpsd: update to 3.16
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
X-List-Received-Date: Sun, 28 May 2017 11:11:41 -0000

3.16 can be linked with gold, so drop forcing to bfd.

Patches:
Do not apply and SConstruct dropped these constructs
    0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
    0002-SConstruct-remove-rpath.patch

Fixed upstream (or plain backports)
    0001-Check-for-__STDC_NO_ATOMICS__-before-using-stdatomic.patch
    0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.patch
    0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch
    0001-Include-stdatomic.h-only-in-C-mode.patch
    0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 ..._STDC_NO_ATOMICS__-before-using-stdatomic.patch | 25 ----------
 .../0001-Include-stdatomic.h-only-in-C-mode.patch  | 43 ----------------
 ...struct-respect-sysroot-also-in-SPLINTOPTS.patch | 33 -------------
 ...e-Fix-issue-with-ACTIVATE-hook-not-being-.patch | 35 -------------
 ...for-C11-and-check-we-have-C11-before-usin.patch | 57 ----------------------
 .../gpsd-3.14/0002-SConstruct-remove-rpath.patch   | 45 -----------------
 ...k-for-C11-not-for-not-C11-in-stdatomic.h-.patch | 26 ----------
 ...prefix-includepy-with-sysroot-and-drop-sy.patch |  0
 .../0001-include-sys-ttydefaults.h.patch           | 13 ++---
 ...disable-html-and-man-docs-building-becaus.patch |  0
 .../gpsd/{gpsd_3.14.bb => gpsd_3.16.bb}            | 13 +----
 11 files changed, 9 insertions(+), 281 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Check-for-__STDC_NO_ATOMICS__-before-using-stdatomic.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Include-stdatomic.h-only-in-C-mode.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-SConstruct-remove-rpath.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.14 => gpsd-3.16}/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.14 => gpsd-3.16}/0001-include-sys-ttydefaults.h.patch (79%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.14 => gpsd-3.16}/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.14.bb => gpsd_3.16.bb} (87%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Check-for-__STDC_NO_ATOMICS__-before-using-stdatomic.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Check-for-__STDC_NO_ATOMICS__-before-using-stdatomic.patch
deleted file mode 100644
index 82ac5aa6e..000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Check-for-__STDC_NO_ATOMICS__-before-using-stdatomic.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From c30716be9e615513fe66993fd3cdc818c3d70410 Mon Sep 17 00:00:00 2001
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Sun, 15 Mar 2015 11:51:45 -0700
-Subject: [PATCH 1/3] Check for __STDC_NO_ATOMICS__ before using stdatomic.h
-
----
- SConstruct | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/SConstruct b/SConstruct
-index adf473d..566c14a 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -633,7 +633,7 @@ else:
-         announce("You do not have kernel CANbus available.")
-         env["nmea2000"] = False
- 
--    if config.CheckHeader("stdatomic.h"):
-+    if not config.CheckCompilerDefines("__STDC_NO_ATOMICS__") and config.CheckHeader("stdatomic.h"):
-         confdefs.append("#define HAVE_STDATOMIC_H 1\n")
-     else:
- 	confdefs.append("/* #undef HAVE_STDATOMIC_H */\n")
--- 
-2.1.0
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Include-stdatomic.h-only-in-C-mode.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Include-stdatomic.h-only-in-C-mode.patch
deleted file mode 100644
index bc9167eee..000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Include-stdatomic.h-only-in-C-mode.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 79f6d9133378325d70a92e66f7352c1becefbb88 Mon Sep 17 00:00:00 2001
-From: Gleb Smirnoff <glebius@FreeBSD.org>
-Date: Sat, 16 May 2015 02:47:28 +0300
-Subject: [PATCH] Include <stdatomic.h> only in C mode.
-
-Upstream-Status: Backport from 3.15
-
-Without this build with gcc-5.2 fails with:
-| arm-oe-linux-gnueabi-g++ -march=armv4t -mthumb -mthumb-interwork -mtune=arm920t --sysroot=/OE/build/shr-core/tmp-glibc/sysroots/om-gta02 -o clock_gettime-qt.os -c -O2 -pipe -g -feliminate-unused-debug-types --sysroot=/OE/build/shr-core/tmp-glibc/sysroots/om-gta02 -Wextra -Wall -Wno-uninitialized -Wno-missing-field-initializers -Wcast-align -Wmissing-declarations -Wpointer-arith -Wreturn-type -pthread -Wmissing-declarations -g -O0 -pthread -fPIC -DUSE_QT -DQT_SHARED -I/OE/build/shr-core/tmp-glibc/sysroots/om-gta02/usr/include/dbus-1.0 -I/OE/build/shr-core/tmp-glibc/sysroots/om-gta02/usr/lib/dbus-1.0/include -I/OE/build/shr-core/tmp-glibc/sysroots/om-gta02/usr/include/qt4/QtNetwork -I/OE/build/shr-core/tmp-glibc/sysroots/om-gta02/usr/include/qt4 -I/OE/build/shr-core/tmp-glibc/sysroots/om-gta02/usr/include/qt4/QtCore clock_gettime.c
-| In file included from compiler.h:50:0,
-|                  from clock_gettime.c:10:
-| /OE/build/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/5.2.0/include/stdatomic.h:40:9: error: '_Atomic' does not name a type
-|  typedef _Atomic _Bool atomic_bool;
-|          ^
-....
-
-More info:
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60932
-
-Signed-off-by: Gary E. Miller <gem@rellim.com>
----
- compiler.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/compiler.h b/compiler.h
-index 837c935..03430c0 100644
---- a/compiler.h
-+++ b/compiler.h
-@@ -66,9 +66,9 @@
-     } while (0)
- 
- #ifdef HAVE_STDATOMIC_H
--#ifndef __COVERITY__	/* Coverity is confused by a GNU typedef */
-+#if !defined(__COVERITY__) && !defined(__cplusplus)
- #include <stdatomic.h>
--#endif /* __COVERITY__ */
-+#endif /* __COVERITY__ || __cplusplus */
- #endif /* HAVE_STDATOMIC_H */
- 
- #ifdef HAVE_OSATOMIC_H
--- 
-2.5.1
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
deleted file mode 100644
index c4134f4b5..000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3c5fb3a8691ac711ea93edf8e0b42bffc62b197e Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 24 Apr 2012 11:52:35 +0200
-Subject: [PATCH 1/4] SConstruct: respect sysroot also in SPLINTOPTS
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
-Signed-off-by: Peter A. Bigot <pab@pabigot.com>
----
- SConstruct | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/SConstruct b/SConstruct
-index 14e2f59..f0cafa8 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -1414,7 +1414,10 @@ def Utility(target, source, action):
- # Report splint warnings
- # Note: test_bits.c is unsplintable because of the PRI64 macros.
- # If you get preprocessor or fatal errors, add +showscan.
--splintopts = "-I/usr/include/libusb-1.0 +quiet"
-+if not env['sysroot']:
-+    splintopts = "-I/usr/include/libusb-1.0 +quiet"
-+else:
-+    splintopts = "-I%s/usr/include/libusb-1.0 +quiet" % env['sysroot']
- # splint does not know about multi-arch, work around that
- ma_status, ma = _getstatusoutput('dpkg-architecture -qDEB_HOST_MULTIARCH')
- if ma_status == 0:
--- 
-1.8.5.5
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch
deleted file mode 100644
index 7a0679505..000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6ff099b1ba8de74df9ddeb61e3825264b96ef692 Mon Sep 17 00:00:00 2001
-From: Moritz Fischer <moritz.fischer@ettus.com>
-Date: Tue, 22 Dec 2015 19:38:31 -0800
-Subject: [PATCH] libgpsd-core: Fix issue with ACTIVATE hook not being called.
-
-In the current system session->mode seemed to ignore the
-O_OPTIMIZE flag, leading to the ACTIVATE hook being ignored.
-
-Another way to fix this would be to keep the session->mode
-condition pull up the check for O_CONTINUE.
-
-Upstream-Status: Backported
-This patch is in upstream git
-
-Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
----
- libgpsd_core.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libgpsd_core.c b/libgpsd_core.c
-index 31fec2a..a84e85f 100644
---- a/libgpsd_core.c
-+++ b/libgpsd_core.c
-@@ -543,7 +543,7 @@ int gpsd_open(struct gps_device_t *session)
- int gpsd_activate(struct gps_device_t *session, const int mode)
- /* acquire a connection to the GPS device */
- {
--    if (session->mode == O_OPTIMIZE)
-+    if (mode == O_OPTIMIZE)
- 	gpsd_run_device_hook(&session->context->errout,
- 			     session->gpsdata.dev.path, "ACTIVATE");
-     session->gpsdata.gps_fd = gpsd_open(session);
--- 
-2.4.3
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.patch
deleted file mode 100644
index 22ee1bdcf..000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 99444b3d2c4a4f7fd7128e60461005780d0c5c83 Mon Sep 17 00:00:00 2001
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Sun, 15 Mar 2015 12:05:15 -0700
-Subject: [PATCH 2/3] Add a test for C11 and check we have C11 before using
- stdatomic.h
-
----
- SConstruct | 19 ++++++++++++++++++-
- 1 file changed, 18 insertions(+), 1 deletion(-)
-
-diff --git a/SConstruct b/SConstruct
-index 566c14a..faa8651 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -473,6 +473,20 @@ def CheckCompilerDefines(context, define):
-     context.Result(ret)
-     return ret
- 
-+# Check if this compiler is C11 or better
-+def CheckC11(context):
-+    context.Message( 'Checking if compiler is C11 ...' )
-+    ret = context.TryLink("""
-+	#if (__STDC_VERSION__ < 201112L) 
-+        #error Not C11
-+        #endif
-+        int main(int argc, char **argv) {
-+            return 0;
-+        }
-+    """,'.c')
-+    context.Result(ret)
-+    return ret
-+
- def GetLoadPath(context):
-     context.Message("Getting system load path ...")
- 
-@@ -491,6 +505,7 @@ else:
-                                              'CheckXsltproc' : CheckXsltproc,
-                                              'CheckCompilerOption' : CheckCompilerOption,
-                                              'CheckCompilerDefines' : CheckCompilerDefines,
-+                                             'CheckC11' : CheckC11,
-                                              'CheckHeaderDefines' : CheckHeaderDefines})
- 
- 
-@@ -633,7 +648,9 @@ else:
-         announce("You do not have kernel CANbus available.")
-         env["nmea2000"] = False
- 
--    if not config.CheckCompilerDefines("__STDC_NO_ATOMICS__") and config.CheckHeader("stdatomic.h"):
-+    # check for C11 or better, and __STDC__NO_ATOMICS__ is no defined
-+    # before looking for stdatomic.h
-+    if not config.CheckC11() and  not config.CheckCompilerDefines("__STDC_NO_ATOMICS__") and config.CheckHeader("stdatomic.h"):
-         confdefs.append("#define HAVE_STDATOMIC_H 1\n")
-     else:
- 	confdefs.append("/* #undef HAVE_STDATOMIC_H */\n")
--- 
-2.1.0
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-SConstruct-remove-rpath.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-SConstruct-remove-rpath.patch
deleted file mode 100644
index 083a6621f..000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-SConstruct-remove-rpath.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From d090638ff983e509162d5e3b62aa4918de4aa5fa Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 24 Apr 2012 16:24:35 +0200
-Subject: [PATCH 2/4] SConstruct: remove rpath
-
-* even with correct prefix (without DESTDIR) included it's redundant
-  WARNING: QA Issue: libgps:
-  /work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/packages-split/libgps/usr/lib/libgps.so.20.0
-  contains probably-redundant RPATH /usr/lib
-* and with prefix from scons.bbclass it's invalid
-  WARNING: QA Issue: package libgps contains bad RPATH
-  /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/image/usr/lib
-  in file
-  /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/packages-split/libgps/usr/lib/libgps.so.20.0
-
-Upstream-Status: Inapppropriate [embedded specific]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
-Signed-off-by: Peter A. Bigot <pab@pabigot.com>
----
- SConstruct | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/SConstruct b/SConstruct
-index f0cafa8..ff46713 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -1340,8 +1340,11 @@ if qt_env:
-     binaryinstall.append(LibraryInstall(qt_env, installdir('libdir'), compiled_qgpsmmlib))
- 
- if env["shared"] and env["chrpath"]:
--    env.AddPostAction(binaryinstall, '$CHRPATH -r "%s" "$TARGET"' \
--                      % (installdir('libdir', False), ))
-+    if not env['sysroot']:
-+        env.AddPostAction(binaryinstall, '$CHRPATH -r "%s" "$TARGET"' \
-+                          % (installdir('libdir', False), ))
-+    else:
-+        env.AddPostAction(binaryinstall, '$CHRPATH -d "$TARGET"')
- 
- if not env['debug'] and not env['profiling'] and env['strip']:
-     env.AddPostAction(binaryinstall, '$STRIP $TARGET')
--- 
-1.8.5.5
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch
deleted file mode 100644
index 8bb0928ce..000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 674c50ee54fd7cd304e8b3c4b33d3ff1272ed191 Mon Sep 17 00:00:00 2001
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Sun, 15 Mar 2015 12:17:51 -0700
-Subject: [PATCH 3/3] Whoops, check for C11, not for not C11 in stdatomic.h
- test.
-
----
- SConstruct | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/SConstruct b/SConstruct
-index faa8651..f4ea145 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -650,7 +650,7 @@ else:
- 
-     # check for C11 or better, and __STDC__NO_ATOMICS__ is no defined
-     # before looking for stdatomic.h
--    if not config.CheckC11() and  not config.CheckCompilerDefines("__STDC_NO_ATOMICS__") and config.CheckHeader("stdatomic.h"):
-+    if config.CheckC11() and  not config.CheckCompilerDefines("__STDC_NO_ATOMICS__") and config.CheckHeader("stdatomic.h"):
-         confdefs.append("#define HAVE_STDATOMIC_H 1\n")
-     else:
- 	confdefs.append("/* #undef HAVE_STDATOMIC_H */\n")
--- 
-2.1.0
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.16/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.16/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-include-sys-ttydefaults.h.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.16/0001-include-sys-ttydefaults.h.patch
similarity index 79%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-include-sys-ttydefaults.h.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.16/0001-include-sys-ttydefaults.h.patch
index b27c67144..f496b5e7d 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-include-sys-ttydefaults.h.patch
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.16/0001-include-sys-ttydefaults.h.patch
@@ -1,4 +1,4 @@
-From 543f79222520cc6ab65d20f9fa356dac5c848e3b Mon Sep 17 00:00:00 2001
+From f221fa959c80b43c65426500a6836a1b5cf6fe0c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 17 Aug 2016 02:16:12 +0000
 Subject: [PATCH] include sys/ttydefaults.h
@@ -11,14 +11,15 @@ clang-3.9: error: linker command failed with exit code 1 (use -v to see invocati
 scons: *** [gpsmon] Error 1
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
 
+Foreward port to gpsd 3.16
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
  gpsmon.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/gpsmon.c b/gpsmon.c
-index bee05b8..daed818 100644
+index ead84d0..f205cb1 100644
 --- a/gpsmon.c
 +++ b/gpsmon.c
 @@ -20,6 +20,7 @@
@@ -27,8 +28,8 @@ index bee05b8..daed818 100644
  #include <sys/select.h>
 +#include <sys/ttydefaults.h>
  #include <fcntl.h>
- #ifndef S_SPLINT_S
  #include <unistd.h>
+ 
 -- 
-1.8.3.1
+2.12.0
 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.16/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.14/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.16/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
similarity index 87%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
index fb02f9598..27a600f70 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
@@ -8,23 +8,16 @@ PROVIDES = "virtual/gpsd"
 EXTRANATIVEPATH += "chrpath-native"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
-    file://0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
-    file://0002-SConstruct-remove-rpath.patch \
     file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
     file://0004-SConstruct-disable-html-and-man-docs-building-becaus.patch \
-    file://0001-Check-for-__STDC_NO_ATOMICS__-before-using-stdatomic.patch \
-    file://0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.patch \
-    file://0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch \
-    file://0001-Include-stdatomic.h-only-in-C-mode.patch \
-    file://0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch \
     file://0001-include-sys-ttydefaults.h.patch \
     file://gpsd-default \
     file://gpsd \
     file://60-gpsd.rules \
     file://gpsd.service \
 "
-SRC_URI[md5sum] = "bc7467009b99e07ba461377b5da6c039"
-SRC_URI[sha256sum] = "504fc812f3c1525a1a48e04bf4d77f9a8066c201448d98089df89d58ef53a8cb"
+SRC_URI[md5sum] = "68691b5de4c94f82ec4062b042b5eb63"
+SRC_URI[sha256sum] = "03579af13a4d3fe0c5b79fa44b5f75c9f3cac6749357f1d99ce5d38c09bc2029"
 
 inherit scons update-rc.d python-dir pythonnative systemd bluetooth
 
@@ -36,8 +29,6 @@ SYSTEMD_OESCONS = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'f
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
 PACKAGECONFIG[bluez] = "bluez='true',bluez='false',${BLUEZ}"
 PACKAGECONFIG[qt] = "qt='yes',qt='no',qt4-x11-free"
-- 
2.12.0


