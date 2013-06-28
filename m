Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id EECDE61E92
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:37:15 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id ld11so2623518pab.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=IbqDXZ/EEFIhSMzRmFeLA+DQ5nhgys7LbzADGQ7bzQY=;
	b=I8mAhWqvFWCXG0T3fD0bwDvufhVTqBVO4dw0kW4EPEwdTzmBoGEA/3DfEcaBSm9BbZ
	3g8+EcaleNuTv5OgOiJkwPOE4BwKTx8xqjVfeHs4uiqZBrFDlrq95IVd5MV/0U6wsCPk
	Sst6tIrQYZhtxoL2MrSqOO6mSiF5SfTVvEopLisPdKgWqFst7h99DsfbE62tsmoiPKho
	4AzGpZ+V44NNe+tso+XpdJxIy4W/D+L+J24TwjxhKXgGK01bhJ7hKMqCIDrXGdE2hG3H
	sGocuCiN2YMkVWeXiha4IY5KnL74pri8f6xfstF7/fVXcmWf93nG5AilpFNA+kqXzUaz
	RHzw==
X-Received: by 10.68.41.106 with SMTP id e10mr12416354pbl.136.1372437436975;
	Fri, 28 Jun 2013 09:37:16 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id xz1sm9736917pab.5.2013.06.28.09.37.15
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 09:37:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jun 2013 09:36:56 -0700
Message-Id: <1372437419-31205-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-browser][PATCH V2 1/3] chromium: Remove older recipes
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
X-List-Received-Date: Fri, 28 Jun 2013 16:37:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ser_main_loop.cc-fix-build-with-glib-2.35.patch |   42 --
 .../chromium-24.0.1312.52/armv6/include.gypi       |    8 -
 .../chromium-24.0.1312.52/armv6/oe-defaults.gypi   |   15 -
 .../chromium-24.0.1312.52/armv7a/include.gypi      |    9 -
 .../chromium-24.0.1312.52/armv7a/oe-defaults.gypi  |   15 -
 .../glib-2.16-use-siginfo_t.patch                  |   35 --
 .../chromium-24.0.1312.52/i586/include.gypi        |    5 -
 .../chromium-24.0.1312.52/i586/oe-defaults.gypi    |   15 -
 .../chromium-24.0.1312.52/ui-gl-no-narrowing.patch |   20 -
 .../chromium/chromium-24.0.1312.52/unistd-2.patch  |   27 -
 .../chromium-24.0.1312.52/x86-64/include.gypi      |    5 -
 .../chromium-24.0.1312.52/x86-64/oe-defaults.gypi  |   15 -
 .../chromium/chromium-29.0.1518.2/google-chrome    |    7 +
 .../chromium-29.0.1518.2/google-chrome.desktop     |  222 ++++++++
 .../chromium/chromium/armv6/include.gypi           |   26 -
 .../chromium/chromium/armv7a/include.gypi          |   26 -
 recipes-browser/chromium/chromium/bison-2.6.patch  |  558 --------------------
 recipes-browser/chromium/chromium/google-chrome    |    7 -
 .../chromium/chromium/google-chrome.desktop        |  222 --------
 recipes-browser/chromium/chromium/gypi.patch       |   19 -
 recipes-browser/chromium/chromium/memset.patch     |   13 -
 .../chromium/chromium/softfloat-fix.patch          |   22 -
 recipes-browser/chromium/chromium/unistd.patch     |   51 --
 recipes-browser/chromium/chromium_19.0.1049.3.bb   |  150 ------
 recipes-browser/chromium/chromium_20.0.1086.0.bb   |  141 -----
 recipes-browser/chromium/chromium_24.0.1312.52.bb  |   76 ---
 26 files changed, 229 insertions(+), 1522 deletions(-)
 delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch
 delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/armv6/include.gypi
 delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/armv6/oe-defaults.gypi
 delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/armv7a/include.gypi
 delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/armv7a/oe-defaults.gypi
 delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/glib-2.16-use-siginfo_t.patch
 delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/i586/include.gypi
 delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/i586/oe-defaults.gypi
 delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/ui-gl-no-narrowing.patch
 delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/unistd-2.patch
 delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/x86-64/include.gypi
 delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/x86-64/oe-defaults.gypi
 create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/google-chrome
 create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop
 delete mode 100644 recipes-browser/chromium/chromium/armv6/include.gypi
 delete mode 100644 recipes-browser/chromium/chromium/armv7a/include.gypi
 delete mode 100644 recipes-browser/chromium/chromium/bison-2.6.patch
 delete mode 100755 recipes-browser/chromium/chromium/google-chrome
 delete mode 100644 recipes-browser/chromium/chromium/google-chrome.desktop
 delete mode 100644 recipes-browser/chromium/chromium/gypi.patch
 delete mode 100644 recipes-browser/chromium/chromium/memset.patch
 delete mode 100644 recipes-browser/chromium/chromium/softfloat-fix.patch
 delete mode 100644 recipes-browser/chromium/chromium/unistd.patch
 delete mode 100644 recipes-browser/chromium/chromium_19.0.1049.3.bb
 delete mode 100644 recipes-browser/chromium/chromium_20.0.1086.0.bb
 delete mode 100644 recipes-browser/chromium/chromium_24.0.1312.52.bb

diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch b/recipes-browser/chromium/chromium-24.0.1312.52/0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch
deleted file mode 100644
index cdf8051..0000000
--- a/recipes-browser/chromium/chromium-24.0.1312.52/0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From eb0c0c982322c0e366c1c854475ceda6342dd55a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 2 May 2013 15:12:24 +0200
-Subject: [PATCH] browser_main_loop.cc: fix build with glib > 2.35
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Applied [1]
-
-[1] http://code.ohloh.net/file?fid=pYuYekcDZUhiAoN5uY-KdIaKFTI&cid=0W4KUpSYxGo&s=&browser=Default#L0
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- content/browser/browser_main_loop.cc |    5 +++++
- 1 files changed, 5 insertions(+), 0 deletions(-)
-
-diff --git a/content/browser/browser_main_loop.cc b/content/browser/browser_main_loop.cc
-index ad4b0c6..86deea3 100644
---- a/content/browser/browser_main_loop.cc
-+++ b/content/browser/browser_main_loop.cc
-@@ -687,12 +687,17 @@ void BrowserMainLoop::InitializeToolkit() {
-   // TODO(stevenjb): Move platform specific code into platform specific Parts
-   // (Need to add InitializeToolkit stage to BrowserParts).
- #if defined(OS_LINUX) || defined(OS_OPENBSD)
-+  // g_type_init will be deprecated in 2.36. 2.35 is the development
-+  // version for 2.36, hence do not call g_type_init starting 2.35.
-+  // http://developer.gnome.org/gobject/unstable/gobject-Type-Information.html#g-type-init
-+#if !GLIB_CHECK_VERSION(2, 35, 0)
-   // Glib type system initialization. Needed at least for gconf,
-   // used in net/proxy/proxy_config_service_linux.cc. Most likely
-   // this is superfluous as gtk_init() ought to do this. It's
-   // definitely harmless, so retained as a reminder of this
-   // requirement for gconf.
-   g_type_init();
-+#endif
- 
- #if !defined(USE_AURA)
-   gfx::GtkInitFromCommandLine(parsed_command_line_);
--- 
-1.7.6.5
-
diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/armv6/include.gypi b/recipes-browser/chromium/chromium-24.0.1312.52/armv6/include.gypi
deleted file mode 100644
index 2c88271..0000000
--- a/recipes-browser/chromium/chromium-24.0.1312.52/armv6/include.gypi
+++ /dev/null
@@ -1,8 +0,0 @@
-{
-  'variables': {
-    # Configure for armv6 compilation
-    'target_arch': 'arm',
-    'armv7': 0,
-    'arm_neon': 0,
-  }
-}
diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/armv6/oe-defaults.gypi b/recipes-browser/chromium/chromium-24.0.1312.52/armv6/oe-defaults.gypi
deleted file mode 100644
index 27e1cfe..0000000
--- a/recipes-browser/chromium/chromium-24.0.1312.52/armv6/oe-defaults.gypi
+++ /dev/null
@@ -1,15 +0,0 @@
-{
-  'variables': {
-    'use_system_bzip2': 1,
-    'disable_nacl': 1,
-    'proprietary_codecs': 1,
-    'v8_use_snapshot': 1,
-    'use_system_ffmpeg': 0,
-    'linux_use_tcmalloc': 0,
-    'linux_link_kerberos': 0,
-    'use_kerberos': 0,
-    'use_cups': 0,
-    'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0
-  }, 
-}
diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/armv7a/include.gypi b/recipes-browser/chromium/chromium-24.0.1312.52/armv7a/include.gypi
deleted file mode 100644
index 316cf48..0000000
--- a/recipes-browser/chromium/chromium-24.0.1312.52/armv7a/include.gypi
+++ /dev/null
@@ -1,9 +0,0 @@
-{
-  'variables': {
-    # Configure for armv7 compilation
-    'target_arch': 'arm',
-    'armv7': 1,
-    'arm_thumb': 1,
-    'arm_neon': 1,
-  }, 
-}
diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/armv7a/oe-defaults.gypi b/recipes-browser/chromium/chromium-24.0.1312.52/armv7a/oe-defaults.gypi
deleted file mode 100644
index 27e1cfe..0000000
--- a/recipes-browser/chromium/chromium-24.0.1312.52/armv7a/oe-defaults.gypi
+++ /dev/null
@@ -1,15 +0,0 @@
-{
-  'variables': {
-    'use_system_bzip2': 1,
-    'disable_nacl': 1,
-    'proprietary_codecs': 1,
-    'v8_use_snapshot': 1,
-    'use_system_ffmpeg': 0,
-    'linux_use_tcmalloc': 0,
-    'linux_link_kerberos': 0,
-    'use_kerberos': 0,
-    'use_cups': 0,
-    'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0
-  }, 
-}
diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/glib-2.16-use-siginfo_t.patch b/recipes-browser/chromium/chromium-24.0.1312.52/glib-2.16-use-siginfo_t.patch
deleted file mode 100644
index f4ee9fb..0000000
--- a/recipes-browser/chromium/chromium-24.0.1312.52/glib-2.16-use-siginfo_t.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-diff -upr chromium-20.0.1132.57.orig/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h chromium-20.0.1132.57/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
---- chromium-20.0.1132.57.orig/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h	2012-07-10 10:48:31.000000000 +0300
-+++ chromium-20.0.1132.57/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h	2012-07-11 23:44:11.000000000 +0300
-@@ -243,14 +243,13 @@ struct kernel_rusage {
-   long               ru_nivcsw;
- };
-
--struct siginfo;
- #if defined(__i386__) || defined(__arm__) || defined(__PPC__)
-
- /* include/asm-{arm,i386,mips,ppc}/signal.h                                  */
- struct kernel_old_sigaction {
-   union {
-     void             (*sa_handler_)(int);
--    void             (*sa_sigaction_)(int, struct siginfo *, void *);
-+    void             (*sa_sigaction_)(int, siginfo_t *, void *);
-   };
-   unsigned long      sa_mask;
-   unsigned long      sa_flags;
-@@ -287,13 +286,13 @@ struct kernel_sigaction {
-   unsigned long      sa_flags;
-   union {
-     void             (*sa_handler_)(int);
--    void             (*sa_sigaction_)(int, struct siginfo *, void *);
-+    void             (*sa_sigaction_)(int, siginfo_t *, void *);
-   };
-   struct kernel_sigset_t sa_mask;
- #else
-   union {
-     void             (*sa_handler_)(int);
--    void             (*sa_sigaction_)(int, struct siginfo *, void *);
-+    void             (*sa_sigaction_)(int, siginfo_t *, void *);
-   };
-   unsigned long      sa_flags;
-   void               (*sa_restorer)(void);
diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/i586/include.gypi b/recipes-browser/chromium/chromium-24.0.1312.52/i586/include.gypi
deleted file mode 100644
index 69f3a08..0000000
--- a/recipes-browser/chromium/chromium-24.0.1312.52/i586/include.gypi
+++ /dev/null
@@ -1,5 +0,0 @@
-{
-  'variables': {
-    'target_arch': 'ia32',
-  }
-}
diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/i586/oe-defaults.gypi b/recipes-browser/chromium/chromium-24.0.1312.52/i586/oe-defaults.gypi
deleted file mode 100644
index 0a6e8e8..0000000
--- a/recipes-browser/chromium/chromium-24.0.1312.52/i586/oe-defaults.gypi
+++ /dev/null
@@ -1,15 +0,0 @@
-{
-  'variables': {
-    'use_system_bzip2': 1,
-    'disable_nacl': 1,
-    'proprietary_codecs': 0,
-    'v8_use_snapshot': 1,
-    'use_system_ffmpeg': 0,
-    'linux_use_tcmalloc': 1,
-    'linux_link_kerberos': 0,
-    'use_kerberos': 0,
-    'use_cups': 0,
-    'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0,
-  }, 
-}
diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/ui-gl-no-narrowing.patch b/recipes-browser/chromium/chromium-24.0.1312.52/ui-gl-no-narrowing.patch
deleted file mode 100644
index d48befb..0000000
--- a/recipes-browser/chromium/chromium-24.0.1312.52/ui-gl-no-narrowing.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-diff --git a/ui/gl/gl.gyp b/ui/gl/gl.gyp
-index 3d0ffb8..d38e87a 100644
---- a/ui/gl/gl.gyp
-+++ b/ui/gl/gl.gyp
-@@ -36,6 +36,15 @@
-           '<(gl_binding_output_dir)',
-         ],
-       },
-+     # Disable narrowing-conversion-in-initialization-list warnings in that we
-+     # do not want to fix
-+     # ../../ui/gl/gl_image_glx.cc: In member function 'virtual bool gfx::GLImageGLX::Initialize()'
-+     # ../../ui/gl/gl_image_glx.cc:90:3: error: narrowing conversion of
-+     # 'visinfo.scoped_ptr_malloc<C, FreeProc>::operator-><XVisualInfo,
-+     #   gfx::{anonymous}::ScopedPtrXFree>()->XVisualInfo::visualid'
-+     # from 'VisualID {aka long unsigned int}' to 'int' inside { } is ill-formed in C++11 [-Werror=narrowing]
-+     'cflags+': ['-Wno-narrowing'],
-+     'cflags_cc+': ['-Wno-narrowing'],
-      'sources': [
-         'gl_bindings.h',
-         'gl_bindings_skia_in_process.cc',
diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/unistd-2.patch b/recipes-browser/chromium/chromium-24.0.1312.52/unistd-2.patch
deleted file mode 100644
index 6b5018b..0000000
--- a/recipes-browser/chromium/chromium-24.0.1312.52/unistd-2.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-diff --git a/chrome/browser/memory_details_linux.cc b/chrome/browser/memory_details_linux.cc
-index bee24ce..299f237 100644
---- a/chrome/browser/memory_details_linux.cc
-+++ b/chrome/browser/memory_details_linux.cc
-@@ -7,6 +7,10 @@
- #include <map>
- #include <set>
- 
-+#if defined(OS_POSIX)
-+#include <unistd.h>
-+#endif
-+
- #include "base/bind.h"
- #include "base/process_util.h"
- #include "base/string_util.h"
-diff --git a/ipc/ipc_channel.h b/ipc/ipc_channel.h
-index 14c375b..345f9eb 100644
---- a/ipc/ipc_channel.h
-+++ b/ipc/ipc_channel.h
-@@ -10,6 +10,7 @@
- 
- #if defined(OS_POSIX)
- #include <sys/types.h>
-+#include <unistd.h>
- #endif
- 
- #include "base/compiler_specific.h"
diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/x86-64/include.gypi b/recipes-browser/chromium/chromium-24.0.1312.52/x86-64/include.gypi
deleted file mode 100644
index c2e2a7d..0000000
--- a/recipes-browser/chromium/chromium-24.0.1312.52/x86-64/include.gypi
+++ /dev/null
@@ -1,5 +0,0 @@
-{
-  'variables': {
-    'target_arch': 'x64',
-  }
-}
diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/x86-64/oe-defaults.gypi b/recipes-browser/chromium/chromium-24.0.1312.52/x86-64/oe-defaults.gypi
deleted file mode 100644
index 0a6e8e8..0000000
--- a/recipes-browser/chromium/chromium-24.0.1312.52/x86-64/oe-defaults.gypi
+++ /dev/null
@@ -1,15 +0,0 @@
-{
-  'variables': {
-    'use_system_bzip2': 1,
-    'disable_nacl': 1,
-    'proprietary_codecs': 0,
-    'v8_use_snapshot': 1,
-    'use_system_ffmpeg': 0,
-    'linux_use_tcmalloc': 1,
-    'linux_link_kerberos': 0,
-    'use_kerberos': 0,
-    'use_cups': 0,
-    'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0,
-  }, 
-}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome b/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome
new file mode 100644
index 0000000..2d17772
--- /dev/null
+++ b/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+if [ "${USER}" = "root" ] ; then 
+	/usr/bin/chrome/chrome --user-data-dir=${HOME}/.chromium/ $@
+else
+	/usr/bin/chrome/chrome $@
+fi
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop b/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop
new file mode 100644
index 0000000..0b639a9
--- /dev/null
+++ b/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop
@@ -0,0 +1,222 @@
+[Desktop Entry]
+Version=1.0
+Name=Chromium
+# Only KDE 4 seems to use GenericName, so we reuse the KDE strings.
+# From Ubuntu's language-pack-kde-XX-base packages, version 9.04-20090413.
+GenericName=Web Browser
+GenericName[ar]=متصفح الشبكة
+GenericName[bg]=Уеб браузър
+GenericName[ca]=Navegador web
+GenericName[cs]=WWW prohlížeč
+GenericName[da]=Browser
+GenericName[de]=Web-Browser
+GenericName[el]=Περιηγητής ιστού
+GenericName[en_GB]=Web Browser
+GenericName[es]=Navegador web
+GenericName[et]=Veebibrauser
+GenericName[fi]=WWW-selain
+GenericName[fr]=Navigateur Web
+GenericName[gu]=વેબ બ્રાઉઝર
+GenericName[he]=דפדפן אינטרנט
+GenericName[hi]=वेब ब्राउज़र
+GenericName[hu]=Webböngésző
+GenericName[it]=Browser Web
+GenericName[ja]=ウェブブラウザ
+GenericName[kn]=ಜಾಲ ವೀಕ್ಷಕ
+GenericName[ko]=웹 브라우저
+GenericName[lt]=Žiniatinklio naršyklė
+GenericName[lv]=Tīmekļa pārlūks
+GenericName[ml]=വെബ് ബ്രൌസര്‍
+GenericName[mr]=वेब ब्राऊजर
+GenericName[nb]=Nettleser
+GenericName[nl]=Webbrowser
+GenericName[pl]=Przeglądarka WWW
+GenericName[pt]=Navegador Web
+GenericName[pt_BR]=Navegador da Internet
+GenericName[ro]=Navigator de Internet
+GenericName[ru]=Веб-браузер
+GenericName[sl]=Spletni brskalnik
+GenericName[sv]=Webbläsare
+GenericName[ta]=இணைய உலாவி
+GenericName[th]=เว็บเบราว์เซอร์
+GenericName[tr]=Web Tarayıcı
+GenericName[uk]=Навігатор Тенет
+GenericName[zh_CN]=网页浏览器
+GenericName[zh_HK]=網頁瀏覽器
+GenericName[zh_TW]=網頁瀏覽器
+# Not translated in KDE, from Epiphany 2.26.1-0ubuntu1.
+GenericName[bn]=ওয়েব ব্রাউজার
+GenericName[fil]=Web Browser
+GenericName[hr]=Web preglednik
+GenericName[id]=Browser Web
+GenericName[or]=ଓ୍ବେବ ବ୍ରାଉଜର
+GenericName[sk]=WWW prehliadač
+GenericName[sr]=Интернет прегледник
+GenericName[te]=మహాతల అన్వేషి
+GenericName[vi]=Bộ duyệt Web
+# Gnome and KDE 3 uses Comment.
+Comment=Access the Internet
+Comment[ar]=الدخول إلى الإنترنت
+Comment[bg]=Достъп до интернет
+Comment[bn]=ইন্টারনেটটি অ্যাক্সেস করুন
+Comment[ca]=Accedeix a Internet
+Comment[cs]=Přístup k internetu
+Comment[da]=Få adgang til internettet
+Comment[de]=Internetzugriff
+Comment[el]=Πρόσβαση στο Διαδίκτυο
+Comment[en_GB]=Access the Internet
+Comment[es]=Accede a Internet.
+Comment[et]=Pääs Internetti
+Comment[fi]=Käytä internetiä
+Comment[fil]=I-access ang Internet
+Comment[fr]=Accéder à Internet
+Comment[gu]=ઇંટરનેટ ઍક્સેસ કરો
+Comment[he]=גישה אל האינטרנט
+Comment[hi]=इंटरनेट तक पहुंच स्थापित करें
+Comment[hr]=Pristup Internetu
+Comment[hu]=Internetelérés
+Comment[id]=Akses Internet
+Comment[it]=Accesso a Internet
+Comment[ja]=インターネットにアクセス
+Comment[kn]=ಇಂಟರ್ನೆಟ್ ಅನ್ನು ಪ್ರವೇಶಿಸಿ
+Comment[ko]=인터넷 연결
+Comment[lt]=Interneto prieiga
+Comment[lv]=Piekļūt internetam
+Comment[ml]=ഇന്റര്‍‌നെറ്റ് ആക്‌സസ് ചെയ്യുക
+Comment[mr]=इंटरनेटमध्ये प्रवेश करा
+Comment[nb]=Gå til Internett
+Comment[nl]=Verbinding maken met internet
+Comment[or]=ଇଣ୍ଟର୍ନେଟ୍ ପ୍ରବେଶ କରନ୍ତୁ
+Comment[pl]=Skorzystaj z internetu
+Comment[pt]=Aceder à Internet
+Comment[pt_BR]=Acessar a internet
+Comment[ro]=Accesaţi Internetul
+Comment[ru]=Доступ в Интернет
+Comment[sk]=Prístup do siete Internet
+Comment[sl]=Dostop do interneta
+Comment[sr]=Приступите Интернету
+Comment[sv]=Gå ut på Internet
+Comment[ta]=இணையத்தை அணுகுதல்
+Comment[te]=ఇంటర్నెట్‌ను ఆక్సెస్ చెయ్యండి
+Comment[th]=เข้าถึงอินเทอร์เน็ต
+Comment[tr]=İnternet'e erişin
+Comment[uk]=Доступ до Інтернету
+Comment[vi]=Truy cập Internet
+Comment[zh_CN]=访问互联网
+Comment[zh_HK]=連線到網際網路
+Comment[zh_TW]=連線到網際網路
+Exec=/usr/bin/google-chrome %U
+Terminal=false
+Icon=/usr/bin/chrome/product_logo_48.png
+Type=Application
+Categories=Network;WebBrowser;
+MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
+X-Ayatana-Desktop-Shortcuts=NewWindow;NewIncognito
+
+[NewWindow Shortcut Group]
+Name=New Window
+Name[am]=አዲስ መስኮት
+Name[ar]=نافذة جديدة
+Name[bg]=Нов прозорец
+Name[bn]=নতুন উইন্ডো
+Name[ca]=Finestra nova
+Name[cs]=Nové okno
+Name[da]=Nyt vindue
+Name[de]=Neues Fenster
+Name[el]=Νέο Παράθυρο
+Name[en_GB]=New Window
+Name[es]=Nueva ventana
+Name[et]=Uus aken
+Name[fa]=پنجره جدید
+Name[fi]=Uusi ikkuna
+Name[fil]=New Window
+Name[fr]=Nouvelle fenêtre
+Name[gu]=નવી વિંડો
+Name[hi]=नई विंडो
+Name[hr]=Novi prozor
+Name[hu]=Új ablak
+Name[id]=Jendela Baru
+Name[it]=Nuova finestra
+Name[iw]=חלון חדש
+Name[ja]=新規ウインドウ
+Name[kn]=ಹೊಸ ವಿಂಡೊ
+Name[ko]=새 창
+Name[lt]=Naujas langas
+Name[lv]=Jauns logs
+Name[ml]=പുതിയ വിന്‍ഡോ
+Name[mr]=नवीन विंडो
+Name[nl]=Nieuw venster
+Name[no]=Nytt vindu
+Name[pl]=Nowe okno
+Name[pt]=Nova janela
+Name[pt_BR]=Nova janela
+Name[ro]=Fereastră nouă
+Name[ru]=Новое окно
+Name[sk]=Nové okno
+Name[sl]=Novo okno
+Name[sr]=Нови прозор
+Name[sv]=Nytt fönster
+Name[sw]=Dirisha Jipya
+Name[ta]=புதிய சாளரம்
+Name[te]=క్రొత్త విండో
+Name[th]=หน้าต่างใหม่
+Name[tr]=Yeni Pencere
+Name[uk]=Нове вікно
+Name[vi]=Cửa sổ Mới
+Name[zh_CN]=新建窗口
+Name[zh_TW]=開新視窗
+Exec=/usr/bin/google-chrome
+TargetEnvironment=Unity
+
+[NewIncognito Shortcut Group]
+Name=New Incognito Window
+Name[ar]=نافذة جديدة للتصفح المتخفي
+Name[bg]=Нов прозорец „инкогнито“
+Name[bn]=নতুন ছদ্মবেশী উইন্ডো
+Name[ca]=Finestra d'incògnit nova
+Name[cs]=Nové anonymní okno
+Name[da]=Nyt inkognitovindue
+Name[de]=Neues Inkognito-Fenster
+Name[el]=Νέο παράθυρο για ανώνυμη περιήγηση
+Name[en_GB]=New Incognito window
+Name[es]=Nueva ventana de incógnito
+Name[et]=Uus inkognito aken
+Name[fa]=پنجره جدید حالت ناشناس
+Name[fi]=Uusi incognito-ikkuna
+Name[fil]=Bagong Incognito window
+Name[fr]=Nouvelle fenêtre de navigation privée
+Name[gu]=નવી છુપી વિંડો
+Name[hi]=नई गुप्त विंडो
+Name[hr]=Novi anoniman prozor
+Name[hu]=Új Inkognitóablak
+Name[id]=Jendela Penyamaran baru
+Name[it]=Nuova finestra di navigazione in incognito
+Name[iw]=חלון חדש לגלישה בסתר
+Name[ja]=新しいシークレット ウィンドウ
+Name[kn]=ಹೊಸ ಅಜ್ಞಾತ ವಿಂಡೋ
+Name[ko]=새 시크릿 창
+Name[lt]=Naujas inkognito langas
+Name[lv]=Jauns inkognito režīma logs
+Name[ml]=പുതിയ വേഷ പ്രച്ഛന്ന വിന്‍ഡോ
+Name[mr]=नवीन गुप्त विंडो
+Name[nl]=Nieuw incognitovenster
+Name[no]=Nytt inkognitovindu
+Name[pl]=Nowe okno incognito
+Name[pt]=Nova janela de navegação anónima
+Name[pt_BR]=Nova janela anônima
+Name[ro]=Fereastră nouă incognito
+Name[ru]=Новое окно в режиме инкогнито
+Name[sk]=Nové okno inkognito
+Name[sl]=Novo okno brez beleženja zgodovine
+Name[sr]=Нови прозор за прегледање без архивирања
+Name[sv]=Nytt inkognitofönster
+Name[ta]=புதிய மறைநிலைச் சாளரம்
+Name[te]=క్రొత్త అజ్ఞాత విండో
+Name[th]=หน้าต่างใหม่ที่ไม่ระบุตัวตน
+Name[tr]=Yeni Gizli pencere
+Name[uk]=Нове вікно в режимі анонімного перегляду
+Name[vi]=Cửa sổ ẩn danh mới
+Name[zh_CN]=新建隐身窗口
+Name[zh_TW]=新增無痕式視窗
+Exec=/usr/bin/google-chrome --incognito
+TargetEnvironment=Unity
diff --git a/recipes-browser/chromium/chromium/armv6/include.gypi b/recipes-browser/chromium/chromium/armv6/include.gypi
deleted file mode 100644
index 394b4fa..0000000
--- a/recipes-browser/chromium/chromium/armv6/include.gypi
+++ /dev/null
@@ -1,26 +0,0 @@
-{
-  'variables': {
-
-    # Configure for armv7 compilation
-    'target_arch': 'arm',
-    'armv7': 0,
-    'arm_neon': 0,
-
-    # Disable native client (Google's settings)
-    'disable_nacl': 1,
-
-    # V8 config (Google's settings)
-    'v8_use_snapshot': 'false',
-
-    # No ffmpeg binaries in the tree, so make sure the build will not fail
-    'use_system_ffmpeg' : '1',
-
-    # Needed for ARM compilation (build fails otherwise)
-    'linux_use_tcmalloc': 0,
-
-    # Change to your rootfs path
-    'sysroot': '__PATH__TO_BE_REPLACED__',
-
-    #'arm_thumb': 1,
-  }
-}
diff --git a/recipes-browser/chromium/chromium/armv7a/include.gypi b/recipes-browser/chromium/chromium/armv7a/include.gypi
deleted file mode 100644
index 9ff0d45..0000000
--- a/recipes-browser/chromium/chromium/armv7a/include.gypi
+++ /dev/null
@@ -1,26 +0,0 @@
-{
-  'variables': {
-
-    # Configure for armv7 compilation
-    'target_arch': 'arm',
-    'armv7': 1,
-    'arm_neon': 1,
-
-    # Disable native client (Google's settings)
-    'disable_nacl': 1,
-
-    # V8 config (Google's settings)
-    'v8_use_snapshot': 'false',
-    
-    # No ffmpeg binaries in the tree, so make sure the build will not fail
-    'use_system_ffmpeg' : '1',	
-
-    # Needed for ARM compilation (build fails otherwise)
-    'linux_use_tcmalloc': 0,
-
-    # Change to your rootfs path
-    'sysroot': '__PATH__TO_BE_REPLACED__',
-
-    #'arm_thumb': 1,
-  }
-}
diff --git a/recipes-browser/chromium/chromium/bison-2.6.patch b/recipes-browser/chromium/chromium/bison-2.6.patch
deleted file mode 100644
index b327e60..0000000
--- a/recipes-browser/chromium/chromium/bison-2.6.patch
+++ /dev/null
@@ -1,558 +0,0 @@
-Upstream-Status: Backport
-http://trac.webkit.org/changeset/124099
-
-Subversion Revision: 123651
-diff --git a/third_party/WebKit/Source/WebCore/css/CSSGrammar.y b/third_party/WebKit/Source/WebCore/css/CSSGrammar.y
-index c7c10b541cd46ad4febc6efe289e81b2cfb0861e..1c604e76b4da4cc65f395bc4a73b112561bd5c84 100644
---- a/third_party/WebKit/Source/WebCore/css/CSSGrammar.y
-+++ b/third_party/WebKit/Source/WebCore/css/CSSGrammar.y
-@@ -53,14 +53,13 @@ using namespace HTMLNames;
- #define YYMAXDEPTH 10000
- #define YYDEBUG 0
- 
--// FIXME: Replace with %parse-param { CSSParser* parser } once we can depend on bison 2.x
--#define YYPARSE_PARAM parser
--#define YYLEX_PARAM parser
--
- %}
- 
- %pure_parser
- 
-+%parse-param { CSSParser* parser }
-+%lex-param { CSSParser* parser }
-+
- %union {
-     bool boolean;
-     char character;
-@@ -89,7 +88,7 @@ using namespace HTMLNames;
- 
- %{
- 
--static inline int cssyyerror(const char*)
-+static inline int cssyyerror(void*, const char*)
- {
-     return 1;
- }
-diff --git a/third_party/WebKit/Source/WebCore/css/CSSParser.cpp b/third_party/WebKit/Source/WebCore/css/CSSParser.cpp
-index 650844060477cfc6ea6fdeaf11ec63b34ac646e7..8369549dbff25537cf93a11237a9bbbac4fe50f2 100644
---- a/third_party/WebKit/Source/WebCore/css/CSSParser.cpp
-+++ b/third_party/WebKit/Source/WebCore/css/CSSParser.cpp
-@@ -114,7 +114,7 @@
- extern int cssyydebug;
- #endif
- 
--extern int cssyyparse(void* parser);
-+extern int cssyyparse(WebCore::CSSParser*);
- 
- using namespace std;
- using namespace WTF;
-diff --git a/third_party/WebKit/Source/WebCore/xml/XPathGrammar.y b/third_party/WebKit/Source/WebCore/xml/XPathGrammar.y
-index 2eba5b35bd2338272a0f4ec756d137e47d2d59c8..d558211db2d89ea13716762a51397755560f66f3 100644
---- a/third_party/WebKit/Source/WebCore/xml/XPathGrammar.y
-+++ b/third_party/WebKit/Source/WebCore/xml/XPathGrammar.y
-@@ -34,6 +34,7 @@
- #include "XPathParser.h"
- #include "XPathPath.h"
- #include "XPathPredicate.h"
-+#include "XPathStep.h"
- #include "XPathVariableReference.h"
- #include <wtf/FastMalloc.h>
- 
-@@ -44,8 +45,6 @@
- #define YYLTYPE_IS_TRIVIAL 1
- #define YYDEBUG 0
- #define YYMAXDEPTH 10000
--#define YYPARSE_PARAM parserParameter
--#define PARSER static_cast<Parser*>(parserParameter)
- 
- using namespace WebCore;
- using namespace XPath;
-@@ -53,6 +52,7 @@ using namespace XPath;
- %}
- 
- %pure_parser
-+%parse-param { WebCore::XPath::Parser* parser }
- 
- %union
- {
-@@ -71,7 +71,7 @@ using namespace XPath;
- %{
- 
- static int xpathyylex(YYSTYPE* yylval) { return Parser::current()->lex(yylval); }
--static void xpathyyerror(const char*) { }
-+static void xpathyyerror(void*, const char*) { }
-     
- %}
- 
-@@ -118,7 +118,7 @@ static void xpathyyerror(const char*) { }
- Expr:
-     OrExpr
-     {
--        PARSER->m_topExpr = $1;
-+        parser->m_topExpr = $1;
-     }
-     ;
- 
-@@ -138,7 +138,7 @@ AbsoluteLocationPath:
-     '/'
-     {
-         $$ = new LocationPath;
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     |
-     '/' RelativeLocationPath
-@@ -150,7 +150,7 @@ AbsoluteLocationPath:
-     {
-         $$ = $2;
-         $$->insertFirstStep($1);
--        PARSER->unregisterParseNode($1);
-+        parser->unregisterParseNode($1);
-     }
-     ;
- 
-@@ -159,22 +159,22 @@ RelativeLocationPath:
-     {
-         $$ = new LocationPath;
-         $$->appendStep($1);
--        PARSER->unregisterParseNode($1);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     RelativeLocationPath '/' Step
-     {
-         $$->appendStep($3);
--        PARSER->unregisterParseNode($3);
-+        parser->unregisterParseNode($3);
-     }
-     |
-     RelativeLocationPath DescendantOrSelf Step
-     {
-         $$->appendStep($2);
-         $$->appendStep($3);
--        PARSER->unregisterParseNode($2);
--        PARSER->unregisterParseNode($3);
-+        parser->unregisterParseNode($2);
-+        parser->unregisterParseNode($3);
-     }
-     ;
- 
-@@ -183,58 +183,58 @@ Step:
-     {
-         if ($2) {
-             $$ = new Step(Step::ChildAxis, *$1, *$2);
--            PARSER->deletePredicateVector($2);
-+            parser->deletePredicateVector($2);
-         } else
-             $$ = new Step(Step::ChildAxis, *$1);
--        PARSER->deleteNodeTest($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteNodeTest($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     NAMETEST OptionalPredicateList
-     {
-         String localName;
-         String namespaceURI;
--        if (!PARSER->expandQName(*$1, localName, namespaceURI)) {
--            PARSER->m_gotNamespaceError = true;
-+        if (!parser->expandQName(*$1, localName, namespaceURI)) {
-+            parser->m_gotNamespaceError = true;
-             YYABORT;
-         }
-         
-         if ($2) {
-             $$ = new Step(Step::ChildAxis, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI), *$2);
--            PARSER->deletePredicateVector($2);
-+            parser->deletePredicateVector($2);
-         } else
-             $$ = new Step(Step::ChildAxis, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI));
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     AxisSpecifier NodeTest OptionalPredicateList
-     {
-         if ($3) {
-             $$ = new Step($1, *$2, *$3);
--            PARSER->deletePredicateVector($3);
-+            parser->deletePredicateVector($3);
-         } else
-             $$ = new Step($1, *$2);
--        PARSER->deleteNodeTest($2);
--        PARSER->registerParseNode($$);
-+        parser->deleteNodeTest($2);
-+        parser->registerParseNode($$);
-     }
-     |
-     AxisSpecifier NAMETEST OptionalPredicateList
-     {
-         String localName;
-         String namespaceURI;
--        if (!PARSER->expandQName(*$2, localName, namespaceURI)) {
--            PARSER->m_gotNamespaceError = true;
-+        if (!parser->expandQName(*$2, localName, namespaceURI)) {
-+            parser->m_gotNamespaceError = true;
-             YYABORT;
-         }
- 
-         if ($3) {
-             $$ = new Step($1, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI), *$3);
--            PARSER->deletePredicateVector($3);
-+            parser->deletePredicateVector($3);
-         } else
-             $$ = new Step($1, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI));
--        PARSER->deleteString($2);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($2);
-+        parser->registerParseNode($$);
-     }
-     |
-     AbbreviatedStep
-@@ -259,23 +259,23 @@ NodeTest:
-         else if (*$1 == "comment")
-             $$ = new Step::NodeTest(Step::NodeTest::CommentNodeTest);
- 
--        PARSER->deleteString($1);
--        PARSER->registerNodeTest($$);
-+        parser->deleteString($1);
-+        parser->registerNodeTest($$);
-     }
-     |
-     PI '(' ')'
-     {
-         $$ = new Step::NodeTest(Step::NodeTest::ProcessingInstructionNodeTest);
--        PARSER->deleteString($1);        
--        PARSER->registerNodeTest($$);
-+        parser->deleteString($1);
-+        parser->registerNodeTest($$);
-     }
-     |
-     PI '(' LITERAL ')'
-     {
-         $$ = new Step::NodeTest(Step::NodeTest::ProcessingInstructionNodeTest, $3->stripWhiteSpace());
--        PARSER->deleteString($1);        
--        PARSER->deleteString($3);
--        PARSER->registerNodeTest($$);
-+        parser->deleteString($1);
-+        parser->deleteString($3);
-+        parser->registerNodeTest($$);
-     }
-     ;
- 
-@@ -293,14 +293,14 @@ PredicateList:
-     {
-         $$ = new Vector<Predicate*>;
-         $$->append(new Predicate($1));
--        PARSER->unregisterParseNode($1);
--        PARSER->registerPredicateVector($$);
-+        parser->unregisterParseNode($1);
-+        parser->registerPredicateVector($$);
-     }
-     |
-     PredicateList Predicate
-     {
-         $$->append(new Predicate($2));
--        PARSER->unregisterParseNode($2);
-+        parser->unregisterParseNode($2);
-     }
-     ;
- 
-@@ -315,7 +315,7 @@ DescendantOrSelf:
-     SLASHSLASH
-     {
-         $$ = new Step(Step::DescendantOrSelfAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -323,13 +323,13 @@ AbbreviatedStep:
-     '.'
-     {
-         $$ = new Step(Step::SelfAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     |
-     DOTDOT
-     {
-         $$ = new Step(Step::ParentAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -337,8 +337,8 @@ PrimaryExpr:
-     VARIABLEREFERENCE
-     {
-         $$ = new VariableReference(*$1);
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     '(' Expr ')'
-@@ -349,15 +349,15 @@ PrimaryExpr:
-     LITERAL
-     {
-         $$ = new StringExpression(*$1);
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     NUMBER
-     {
-         $$ = new Number($1->toDouble());
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     FunctionCall
-@@ -369,8 +369,8 @@ FunctionCall:
-         $$ = createFunction(*$1);
-         if (!$$)
-             YYABORT;
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     FUNCTIONNAME '(' ArgumentList ')'
-@@ -378,9 +378,9 @@ FunctionCall:
-         $$ = createFunction(*$1, *$3);
-         if (!$$)
-             YYABORT;
--        PARSER->deleteString($1);
--        PARSER->deleteExpressionVector($3);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->deleteExpressionVector($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -389,14 +389,14 @@ ArgumentList:
-     {
-         $$ = new Vector<Expression*>;
-         $$->append($1);
--        PARSER->unregisterParseNode($1);
--        PARSER->registerExpressionVector($$);
-+        parser->unregisterParseNode($1);
-+        parser->registerExpressionVector($$);
-     }
-     |
-     ArgumentList ',' Argument
-     {
-         $$->append($3);
--        PARSER->unregisterParseNode($3);
-+        parser->unregisterParseNode($3);
-     }
-     ;
- 
-@@ -412,9 +412,9 @@ UnionExpr:
-         $$ = new Union;
-         $$->addSubExpression($1);
-         $$->addSubExpression($3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -430,9 +430,9 @@ PathExpr:
-     {
-         $3->setAbsolute(true);
-         $$ = new Path(static_cast<Filter*>($1), $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     |
-     FilterExpr DescendantOrSelf RelativeLocationPath
-@@ -440,10 +440,10 @@ PathExpr:
-         $3->insertFirstStep($2);
-         $3->setAbsolute(true);
-         $$ = new Path(static_cast<Filter*>($1), $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($2);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($2);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -453,9 +453,9 @@ FilterExpr:
-     PrimaryExpr PredicateList
-     {
-         $$ = new Filter($1, *$2);
--        PARSER->unregisterParseNode($1);
--        PARSER->deletePredicateVector($2);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->deletePredicateVector($2);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -465,9 +465,9 @@ OrExpr:
-     OrExpr OR AndExpr
-     {
-         $$ = new LogicalOp(LogicalOp::OP_Or, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -477,9 +477,9 @@ AndExpr:
-     AndExpr AND EqualityExpr
-     {
-         $$ = new LogicalOp(LogicalOp::OP_And, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -489,9 +489,9 @@ EqualityExpr:
-     EqualityExpr EQOP RelationalExpr
-     {
-         $$ = new EqTestOp($2, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -501,9 +501,9 @@ RelationalExpr:
-     RelationalExpr RELOP AdditiveExpr
-     {
-         $$ = new EqTestOp($2, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -513,17 +513,17 @@ AdditiveExpr:
-     AdditiveExpr PLUS MultiplicativeExpr
-     {
-         $$ = new NumericOp(NumericOp::OP_Add, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     |
-     AdditiveExpr MINUS MultiplicativeExpr
-     {
-         $$ = new NumericOp(NumericOp::OP_Sub, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -533,9 +533,9 @@ MultiplicativeExpr:
-     MultiplicativeExpr MULOP UnaryExpr
-     {
-         $$ = new NumericOp($2, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -546,8 +546,8 @@ UnaryExpr:
-     {
-         $$ = new Negative;
-         $$->addSubExpression($2);
--        PARSER->unregisterParseNode($2);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($2);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-diff --git a/third_party/WebKit/Source/WebCore/xml/XPathParser.cpp b/third_party/WebKit/Source/WebCore/xml/XPathParser.cpp
-index 62d8ee37fd6ebb74a580a00c59beb6cd40c5a8b7..b5e6a9237593b4aaa2a243f2ff9d86e57f930a97 100644
---- a/third_party/WebKit/Source/WebCore/xml/XPathParser.cpp
-+++ b/third_party/WebKit/Source/WebCore/xml/XPathParser.cpp
-@@ -32,24 +32,21 @@
- #include "XPathEvaluator.h"
- #include "XPathException.h"
- #include "XPathNSResolver.h"
-+#include "XPathPath.h"
- #include "XPathStep.h"
- #include <wtf/StdLibExtras.h>
- #include <wtf/text/StringHash.h>
- 
--int xpathyyparse(void*);
--
-+using namespace WebCore;
- using namespace WTF;
- using namespace Unicode;
-+using namespace XPath;
- 
--namespace WebCore {
--namespace XPath {
--
--class LocationPath;
--
--#include "XPathGrammar.h"    
-+extern int xpathyyparse(WebCore::XPath::Parser*);
-+#include "XPathGrammar.h"
- 
- Parser* Parser::currentParser = 0;
--    
-+
- enum XMLCat { NameStart, NameCont, NotPartOfName };
- 
- typedef HashMap<String, Step::Axis> AxisNamesMap;
-@@ -630,5 +627,3 @@ void Parser::deleteNodeTest(Step::NodeTest* t)
-     delete t;
- }
- 
--}
--}
diff --git a/recipes-browser/chromium/chromium/google-chrome b/recipes-browser/chromium/chromium/google-chrome
deleted file mode 100755
index 2d17772..0000000
--- a/recipes-browser/chromium/chromium/google-chrome
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-
-if [ "${USER}" = "root" ] ; then 
-	/usr/bin/chrome/chrome --user-data-dir=${HOME}/.chromium/ $@
-else
-	/usr/bin/chrome/chrome $@
-fi
diff --git a/recipes-browser/chromium/chromium/google-chrome.desktop b/recipes-browser/chromium/chromium/google-chrome.desktop
deleted file mode 100644
index 0b639a9..0000000
--- a/recipes-browser/chromium/chromium/google-chrome.desktop
+++ /dev/null
@@ -1,222 +0,0 @@
-[Desktop Entry]
-Version=1.0
-Name=Chromium
-# Only KDE 4 seems to use GenericName, so we reuse the KDE strings.
-# From Ubuntu's language-pack-kde-XX-base packages, version 9.04-20090413.
-GenericName=Web Browser
-GenericName[ar]=متصفح الشبكة
-GenericName[bg]=Уеб браузър
-GenericName[ca]=Navegador web
-GenericName[cs]=WWW prohlížeč
-GenericName[da]=Browser
-GenericName[de]=Web-Browser
-GenericName[el]=Περιηγητής ιστού
-GenericName[en_GB]=Web Browser
-GenericName[es]=Navegador web
-GenericName[et]=Veebibrauser
-GenericName[fi]=WWW-selain
-GenericName[fr]=Navigateur Web
-GenericName[gu]=વેબ બ્રાઉઝર
-GenericName[he]=דפדפן אינטרנט
-GenericName[hi]=वेब ब्राउज़र
-GenericName[hu]=Webböngésző
-GenericName[it]=Browser Web
-GenericName[ja]=ウェブブラウザ
-GenericName[kn]=ಜಾಲ ವೀಕ್ಷಕ
-GenericName[ko]=웹 브라우저
-GenericName[lt]=Žiniatinklio naršyklė
-GenericName[lv]=Tīmekļa pārlūks
-GenericName[ml]=വെബ് ബ്രൌസര്‍
-GenericName[mr]=वेब ब्राऊजर
-GenericName[nb]=Nettleser
-GenericName[nl]=Webbrowser
-GenericName[pl]=Przeglądarka WWW
-GenericName[pt]=Navegador Web
-GenericName[pt_BR]=Navegador da Internet
-GenericName[ro]=Navigator de Internet
-GenericName[ru]=Веб-браузер
-GenericName[sl]=Spletni brskalnik
-GenericName[sv]=Webbläsare
-GenericName[ta]=இணைய உலாவி
-GenericName[th]=เว็บเบราว์เซอร์
-GenericName[tr]=Web Tarayıcı
-GenericName[uk]=Навігатор Тенет
-GenericName[zh_CN]=网页浏览器
-GenericName[zh_HK]=網頁瀏覽器
-GenericName[zh_TW]=網頁瀏覽器
-# Not translated in KDE, from Epiphany 2.26.1-0ubuntu1.
-GenericName[bn]=ওয়েব ব্রাউজার
-GenericName[fil]=Web Browser
-GenericName[hr]=Web preglednik
-GenericName[id]=Browser Web
-GenericName[or]=ଓ୍ବେବ ବ୍ରାଉଜର
-GenericName[sk]=WWW prehliadač
-GenericName[sr]=Интернет прегледник
-GenericName[te]=మహాతల అన్వేషి
-GenericName[vi]=Bộ duyệt Web
-# Gnome and KDE 3 uses Comment.
-Comment=Access the Internet
-Comment[ar]=الدخول إلى الإنترنت
-Comment[bg]=Достъп до интернет
-Comment[bn]=ইন্টারনেটটি অ্যাক্সেস করুন
-Comment[ca]=Accedeix a Internet
-Comment[cs]=Přístup k internetu
-Comment[da]=Få adgang til internettet
-Comment[de]=Internetzugriff
-Comment[el]=Πρόσβαση στο Διαδίκτυο
-Comment[en_GB]=Access the Internet
-Comment[es]=Accede a Internet.
-Comment[et]=Pääs Internetti
-Comment[fi]=Käytä internetiä
-Comment[fil]=I-access ang Internet
-Comment[fr]=Accéder à Internet
-Comment[gu]=ઇંટરનેટ ઍક્સેસ કરો
-Comment[he]=גישה אל האינטרנט
-Comment[hi]=इंटरनेट तक पहुंच स्थापित करें
-Comment[hr]=Pristup Internetu
-Comment[hu]=Internetelérés
-Comment[id]=Akses Internet
-Comment[it]=Accesso a Internet
-Comment[ja]=インターネットにアクセス
-Comment[kn]=ಇಂಟರ್ನೆಟ್ ಅನ್ನು ಪ್ರವೇಶಿಸಿ
-Comment[ko]=인터넷 연결
-Comment[lt]=Interneto prieiga
-Comment[lv]=Piekļūt internetam
-Comment[ml]=ഇന്റര്‍‌നെറ്റ് ആക്‌സസ് ചെയ്യുക
-Comment[mr]=इंटरनेटमध्ये प्रवेश करा
-Comment[nb]=Gå til Internett
-Comment[nl]=Verbinding maken met internet
-Comment[or]=ଇଣ୍ଟର୍ନେଟ୍ ପ୍ରବେଶ କରନ୍ତୁ
-Comment[pl]=Skorzystaj z internetu
-Comment[pt]=Aceder à Internet
-Comment[pt_BR]=Acessar a internet
-Comment[ro]=Accesaţi Internetul
-Comment[ru]=Доступ в Интернет
-Comment[sk]=Prístup do siete Internet
-Comment[sl]=Dostop do interneta
-Comment[sr]=Приступите Интернету
-Comment[sv]=Gå ut på Internet
-Comment[ta]=இணையத்தை அணுகுதல்
-Comment[te]=ఇంటర్నెట్‌ను ఆక్సెస్ చెయ్యండి
-Comment[th]=เข้าถึงอินเทอร์เน็ต
-Comment[tr]=İnternet'e erişin
-Comment[uk]=Доступ до Інтернету
-Comment[vi]=Truy cập Internet
-Comment[zh_CN]=访问互联网
-Comment[zh_HK]=連線到網際網路
-Comment[zh_TW]=連線到網際網路
-Exec=/usr/bin/google-chrome %U
-Terminal=false
-Icon=/usr/bin/chrome/product_logo_48.png
-Type=Application
-Categories=Network;WebBrowser;
-MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
-X-Ayatana-Desktop-Shortcuts=NewWindow;NewIncognito
-
-[NewWindow Shortcut Group]
-Name=New Window
-Name[am]=አዲስ መስኮት
-Name[ar]=نافذة جديدة
-Name[bg]=Нов прозорец
-Name[bn]=নতুন উইন্ডো
-Name[ca]=Finestra nova
-Name[cs]=Nové okno
-Name[da]=Nyt vindue
-Name[de]=Neues Fenster
-Name[el]=Νέο Παράθυρο
-Name[en_GB]=New Window
-Name[es]=Nueva ventana
-Name[et]=Uus aken
-Name[fa]=پنجره جدید
-Name[fi]=Uusi ikkuna
-Name[fil]=New Window
-Name[fr]=Nouvelle fenêtre
-Name[gu]=નવી વિંડો
-Name[hi]=नई विंडो
-Name[hr]=Novi prozor
-Name[hu]=Új ablak
-Name[id]=Jendela Baru
-Name[it]=Nuova finestra
-Name[iw]=חלון חדש
-Name[ja]=新規ウインドウ
-Name[kn]=ಹೊಸ ವಿಂಡೊ
-Name[ko]=새 창
-Name[lt]=Naujas langas
-Name[lv]=Jauns logs
-Name[ml]=പുതിയ വിന്‍ഡോ
-Name[mr]=नवीन विंडो
-Name[nl]=Nieuw venster
-Name[no]=Nytt vindu
-Name[pl]=Nowe okno
-Name[pt]=Nova janela
-Name[pt_BR]=Nova janela
-Name[ro]=Fereastră nouă
-Name[ru]=Новое окно
-Name[sk]=Nové okno
-Name[sl]=Novo okno
-Name[sr]=Нови прозор
-Name[sv]=Nytt fönster
-Name[sw]=Dirisha Jipya
-Name[ta]=புதிய சாளரம்
-Name[te]=క్రొత్త విండో
-Name[th]=หน้าต่างใหม่
-Name[tr]=Yeni Pencere
-Name[uk]=Нове вікно
-Name[vi]=Cửa sổ Mới
-Name[zh_CN]=新建窗口
-Name[zh_TW]=開新視窗
-Exec=/usr/bin/google-chrome
-TargetEnvironment=Unity
-
-[NewIncognito Shortcut Group]
-Name=New Incognito Window
-Name[ar]=نافذة جديدة للتصفح المتخفي
-Name[bg]=Нов прозорец „инкогнито“
-Name[bn]=নতুন ছদ্মবেশী উইন্ডো
-Name[ca]=Finestra d'incògnit nova
-Name[cs]=Nové anonymní okno
-Name[da]=Nyt inkognitovindue
-Name[de]=Neues Inkognito-Fenster
-Name[el]=Νέο παράθυρο για ανώνυμη περιήγηση
-Name[en_GB]=New Incognito window
-Name[es]=Nueva ventana de incógnito
-Name[et]=Uus inkognito aken
-Name[fa]=پنجره جدید حالت ناشناس
-Name[fi]=Uusi incognito-ikkuna
-Name[fil]=Bagong Incognito window
-Name[fr]=Nouvelle fenêtre de navigation privée
-Name[gu]=નવી છુપી વિંડો
-Name[hi]=नई गुप्त विंडो
-Name[hr]=Novi anoniman prozor
-Name[hu]=Új Inkognitóablak
-Name[id]=Jendela Penyamaran baru
-Name[it]=Nuova finestra di navigazione in incognito
-Name[iw]=חלון חדש לגלישה בסתר
-Name[ja]=新しいシークレット ウィンドウ
-Name[kn]=ಹೊಸ ಅಜ್ಞಾತ ವಿಂಡೋ
-Name[ko]=새 시크릿 창
-Name[lt]=Naujas inkognito langas
-Name[lv]=Jauns inkognito režīma logs
-Name[ml]=പുതിയ വേഷ പ്രച്ഛന്ന വിന്‍ഡോ
-Name[mr]=नवीन गुप्त विंडो
-Name[nl]=Nieuw incognitovenster
-Name[no]=Nytt inkognitovindu
-Name[pl]=Nowe okno incognito
-Name[pt]=Nova janela de navegação anónima
-Name[pt_BR]=Nova janela anônima
-Name[ro]=Fereastră nouă incognito
-Name[ru]=Новое окно в режиме инкогнито
-Name[sk]=Nové okno inkognito
-Name[sl]=Novo okno brez beleženja zgodovine
-Name[sr]=Нови прозор за прегледање без архивирања
-Name[sv]=Nytt inkognitofönster
-Name[ta]=புதிய மறைநிலைச் சாளரம்
-Name[te]=క్రొత్త అజ్ఞాత విండో
-Name[th]=หน้าต่างใหม่ที่ไม่ระบุตัวตน
-Name[tr]=Yeni Gizli pencere
-Name[uk]=Нове вікно в режимі анонімного перегляду
-Name[vi]=Cửa sổ ẩn danh mới
-Name[zh_CN]=新建隐身窗口
-Name[zh_TW]=新增無痕式視窗
-Exec=/usr/bin/google-chrome --incognito
-TargetEnvironment=Unity
diff --git a/recipes-browser/chromium/chromium/gypi.patch b/recipes-browser/chromium/chromium/gypi.patch
deleted file mode 100644
index cd5542f..0000000
--- a/recipes-browser/chromium/chromium/gypi.patch
+++ /dev/null
@@ -1,19 +0,0 @@
---- a/tools/gyp/pylib/gyp/__init__.py	2009-12-10 22:36:18.000000000 +0800
-+++ b/tools/gyp/pylib/gyp/__init__.py	2009-12-10 22:39:23.000000000 +0800
-@@ -376,10 +376,12 @@
- 
-   # If ~/.gyp/include.gypi exists, it'll be forcibly included into every
-   # .gyp file that's loaded, before anything else is included.
--  if home_dot_gyp != None:
--    default_include = os.path.join(home_dot_gyp, 'include.gypi')
--    if os.path.exists(default_include):
--      includes.append(default_include)
-+  #if home_dot_gyp != None:
-+  #  default_include = os.path.join(home_dot_gyp, 'include.gypi')
-+  #  if os.path.exists(default_include):
-+  #    includes.append(default_include)
-+
-+  includes.append(__PATH__TO_BE_REPLACED__)
- 
-   # Command-line --include files come after the default include.
-   if options.includes:
diff --git a/recipes-browser/chromium/chromium/memset.patch b/recipes-browser/chromium/chromium/memset.patch
deleted file mode 100644
index 491002a..0000000
--- a/recipes-browser/chromium/chromium/memset.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: chromium-19.0.1049.3/skia/skia.gyp
-===================================================================
---- chromium-19.0.1049.3.orig/skia/skia.gyp	2012-05-14 17:15:13.906097364 +0200
-+++ chromium-19.0.1049.3/skia/skia.gyp	2012-05-14 17:15:50.082099369 +0200
-@@ -1091,7 +1091,7 @@
-             '../third_party/skia/src/opts/opts_check_arm.cpp',
-           ],
-         }],
--        [ 'armv7 == 1 and arm_neon == 0', {
-+        [ 'arm_neon == 0', {
-           'sources': [
-             '../third_party/skia/src/opts/memset.arm.S',
-         ],
diff --git a/recipes-browser/chromium/chromium/softfloat-fix.patch b/recipes-browser/chromium/chromium/softfloat-fix.patch
deleted file mode 100644
index 3aa07a2..0000000
--- a/recipes-browser/chromium/chromium/softfloat-fix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: chromium-19.0.1049.3/v8/src/platform-linux.cc
-===================================================================
---- chromium-19.0.1049.3.orig/v8/src/platform-linux.cc	2012-05-18 13:56:10.405297259 +0200
-+++ chromium-19.0.1049.3/v8/src/platform-linux.cc	2012-05-18 13:56:44.693296511 +0200
-@@ -188,7 +188,7 @@
- // calling this will return 1.0 and otherwise 0.0.
- static void ArmUsingHardFloatHelper() {
-   asm("mov r0, #0");
--#if defined(__VFP_FP__) && !defined(__SOFTFP__)
-+#if defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
-   // Load 0x3ff00000 into r1 using instructions available in both ARM
-   // and Thumb mode.
-   asm("mov r1, #3");
-@@ -213,7 +213,7 @@
- #else
-   asm("vmov d0, r0, r1");
- #endif  // __thumb__
--#endif  // defined(__VFP_FP__) && !defined(__SOFTFP__)
-+#endif  // defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
-   asm("mov r1, #0");
- }
- 
diff --git a/recipes-browser/chromium/chromium/unistd.patch b/recipes-browser/chromium/chromium/unistd.patch
deleted file mode 100644
index 5e33300..0000000
--- a/recipes-browser/chromium/chromium/unistd.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Index: chromium-19.0.1049.3/ipc/ipc_channel.h
-===================================================================
---- chromium-19.0.1049.3.orig/ipc/ipc_channel.h	2012-02-23 22:13:19.000000000 +0100
-+++ chromium-19.0.1049.3/ipc/ipc_channel.h	2012-05-14 16:00:42.473854656 +0200
-@@ -6,6 +6,8 @@
- #define IPC_IPC_CHANNEL_H_
- #pragma once
- 
-+#include <unistd.h>
-+
- #include "base/compiler_specific.h"
- #include "ipc/ipc_channel_handle.h"
- #include "ipc/ipc_message.h"
-Index: chromium-19.0.1049.3/base/message_pump_libevent.cc
-===================================================================
---- chromium-19.0.1049.3.orig/base/message_pump_libevent.cc	2012-02-23 22:13:19.000000000 +0100
-+++ chromium-19.0.1049.3/base/message_pump_libevent.cc	2012-05-14 16:00:42.485854655 +0200
-@@ -6,6 +6,7 @@
- 
- #include <errno.h>
- #include <fcntl.h>
-+#include <unistd.h>
- 
- #include "base/auto_reset.h"
- #include "base/compiler_specific.h"
-Index: chromium-19.0.1049.3/chrome/browser/policy/policy_path_parser_linux.cc
-===================================================================
---- chromium-19.0.1049.3.orig/chrome/browser/policy/policy_path_parser_linux.cc	2012-02-23 22:13:36.000000000 +0100
-+++ chromium-19.0.1049.3/chrome/browser/policy/policy_path_parser_linux.cc	2012-05-14 16:00:42.485854655 +0200
-@@ -3,6 +3,7 @@
- // found in the LICENSE file.
- 
- #include <pwd.h>
-+#include <unistd.h>
- 
- #include "chrome/browser/policy/policy_path_parser.h"
- 
-Index: chromium-19.0.1049.3/ipc/ipc_platform_file.cc
-===================================================================
---- chromium-19.0.1049.3.orig/ipc/ipc_platform_file.cc	2012-05-14 16:07:55.493878160 +0200
-+++ chromium-19.0.1049.3/ipc/ipc_platform_file.cc	2012-05-14 16:08:01.713878495 +0200
-@@ -4,9 +4,7 @@
- 
- #include "ipc/ipc_platform_file.h"
- 
--#if defined(OS_ANDROID)
- #include <unistd.h>
--#endif
- 
- namespace IPC {
- 
diff --git a/recipes-browser/chromium/chromium_19.0.1049.3.bb b/recipes-browser/chromium/chromium_19.0.1049.3.bb
deleted file mode 100644
index 6744ee1..0000000
--- a/recipes-browser/chromium/chromium_19.0.1049.3.bb
+++ /dev/null
@@ -1,150 +0,0 @@
-DESCRIPTION = "Chromium browser"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3cb55cc4ec38bb01d2ceaaa66b5436c2"
-DEPENDS = "xextproto cairo nss gtk+ gtk+-native zlib-native libxi gconf udev \
-	libgnome-keyring libxss cups cairo-native libxi-native alsa-lib"
-
-SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P}.tar.bz2 \
-	file://include.gypi \
-	file://unistd.patch \
-	file://memset.patch \
-	file://softfloat-fix.patch \
-	file://bison-2.6.patch \
-"
-
-# include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
-COMPATIBLE_MACHINE = "(-)"
-COMPATIBLE_MACHINE_armv6 = "(.*)"
-COMPATIBLE_MACHINE_armv7a = "(.*)"
-
-PR = "r3"
-
-SRC_URI[md5sum] = "0cdd94b2be21180af93f719e9a9a2883"
-SRC_URI[sha256sum] = "3bdce0bd8381cd699014e7ec72ab02c7d8444ba511c27afff76bf015361c4021"
-
-inherit gettext
-
-EXTRA_OEGYP =	" \
-	-Duse_system_bzip2=1 \
-	\
-	-Dproprietary_codecs=1 \
-	\
-	-Dtarget_arch=${TARGET_ARCH} \ 
-	-Ddisable_nacl=1 \
-	-Dlinux_use_tcmalloc=0 \
-	\
-	-Dlinux_link_kerberos=0 \
-	-Duse_kerberos=0 \
-	-Duse_cups=1 \
-	-Duse_gnome_keyring=1 \
-	-Dlinux_link_gnome_keyring=1 \
-	\
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0', d)} \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
-"
-
-EXTRA_OEGYP_append_armv6 = " \
-	-Darmv7=0 \
-	-Darm_neon=0 \
-"
-
-EXTRA_OEGYP_append_armv7a = " \
-	-Darmv7=1 \
-	-Darm_neon=1 \
-"
-
-do_configure() {
-	cd ${WORKDIR}
-	export GYP_GENERATORS=make
-	rm -f ${S}/tools/gyp/pylib/gyp/__init__.pyc
-	rm -f ${S}/tools/gyp/pylib/gyp/__init__.pyo
-	sed -e 's|__PATH__TO_BE_REPLACED__|"${WORKDIR}/include.gypi"|' -i ${S}/tools/gyp/pylib/gyp/__init__.py
-	sed -e "s|__PATH__TO_BE_REPLACED__||" -i ${WORKDIR}/include.gypi
-
-	cd ${S}
-	build/gyp_chromium --depth=. ${EXTRA_OEGYP}
-}
-
-EXTRA_OEMAKE = "-r ${PARALLEL_MAKE} LDFLAGS.host=-L${STAGING_LIBDIR_NATIVE} V=1 BUILDTYPE=Release chrome"
-
-TARGET_CFLAGS += "-I${STAGING_INCDIR}/mozilla/nss -I${STAGING_INCDIR}/dst"
-TARGET_CXXFLAGS += "-I${STAGING_INCDIR}/mozilla/nss -I${STAGING_INCDIR}/dst"
-
-TARGET_CC_ARCH += " -Wno-error=deprecated-declarations -Wno-error=narrowing -Wno-error=c++0x-compat"
-
-do_compile_prepend() {
-	export CROSSTOOL=${TARGET_PREFIX}
-	export AR=${CROSSTOOL}ar
-	export AS=${CROSSTOOL}as
-	export RANLIB=${CROSSTOOL}ranlib
-	# host tools are supposed to be linked with gold so we hack the
-	# makefiles to use gold which must be present on the host and named
-	# ld.gold.
-	# -fuse-ld=gold could be an option but that actually fails on Fedora
-	ln -sf `which ld.gold` ${WORKDIR}/ld
-	sed -i "s#LDFLAGS.host ?=#LDFLAGS.host = -B${WORKDIR}/#g" Makefile
-	for i in `find . -iname *.host*.mk`; do 
-		sed -i "s#-B\$(builddir)/../../third_party/gold#-B${WORKDIR}/#g" $i
-	done
-	# chromium seems to force the usage of its internal copy of a binary
-	# gold linker so remove this setting
-	for i in `find . -iname *.target*.mk`; do 
-		sed -i "s#-B\$(builddir)/../../third_party/gold# #g" $i
-	done
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -d ${D}${bindir}/chrome/
-	install -m 0755 ${S}/out/Release/chrome ${D}${bindir}/chrome/chrome
-	install -m 0644 ${S}/out/Release/chrome.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/resources.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/product_logo_48.png ${D}${bindir}/chrome/
-	install -d ${D}${bindir}/chrome/locales/
-	install -m 0644 ${S}/out/Release/locales/en-US.pak ${D}${bindir}/chrome/locales
-	cp -a ${S}/out/Release/obj ${D}${bindir}/chrome/
-	cp -a ${S}/out/Release/obj.target ${D}${bindir}/chrome/
-	cp -a ${S}/out/Release/resources ${D}${bindir}/chrome/
-
-	mv ${D}${bindir}/chrome/obj.target/third_party/ffmpeg/libffmpegsumo.so ${D}/${bindir}/chrome/libffmpegsumo.so
-
-	find ${D}${bindir}/chrome/ -name "*.d" -delete
-	find ${D}${bindir}/chrome/ -name "*.o" -delete
-	find ${D}${bindir}/chrome/ -name "*.a" -delete
-	find ${D}${bindir}/chrome/ -name "*.cpp" -delete
-	find ${D}${bindir}/chrome/ -name "*.h" -delete
-	find ${D}${bindir}/chrome/ -name "*.cc" -delete
-}
-
-# FIXME : hundred of WARNINGs
-FILES_${PN} = "/usr/bin/chrome/"
-FILES_${PN}-dbg = " \
-	${bindir}/chrome/.debug \
-	${bindir}/chrome/obj.target/third_party/WebKit/Source/WebKit/chromium/.debug \
-	${bindir}/chrome/obj.target/third_party/ffmpeg/.debug \
-	${bindir}/chrome/obj.target/third_party/angle/src/.debug \
-	${bindir}/chrome/obj.target/third_party/icu/.debug \
-	${bindir}/chrome/obj.target/third_party/icu/.debug \
-	${bindir}/chrome/obj.target/content/.debug \
-	${bindir}/chrome/obj.target/webkit/support/.debug \
-	${bindir}/chrome/obj.target/webkit/support/.debug \
-	${bindir}/chrome/obj.target/webkit/support/.debug \
-	${bindir}/chrome/obj.target/ui/gfx/surface/.debug \
-	${bindir}/chrome/obj.target/ui/gfx/gl/.debug \
-	${bindir}/chrome/obj.target/ui/.debug \
-	${bindir}/chrome/obj.target/sql/.debug \
-	${bindir}/chrome/obj.target/v8/tools/gyp/.debug \
-	${bindir}/chrome/obj.target/printing/.debug \
-	${bindir}/chrome/obj.target/crypto/.debug \
-	${bindir}/chrome/obj.target/net/.debug \
-	${bindir}/chrome/obj.target/base/.debug \
-	${bindir}/chrome/obj.target/base/.debug \
-	${bindir}/chrome/obj.target/ipc/.debug \
-	${bindir}/chrome/obj.target/media/.debug \
-	${bindir}/chrome/obj.target/skia/.debug \
-	${bindir}/chrome/obj.target/gpu/command_buffer/.debug \
-	${bindir}/chrome/obj.target/gpu/.debug \
-	${bindir}/chrome/obj.target/ppapi/.debug \
-	${bindir}/chrome/obj.target/ppapi/.debug \
-	${bindir}/chrome/obj.target/build/temp_gyp/.debug \
-"
diff --git a/recipes-browser/chromium/chromium_20.0.1086.0.bb b/recipes-browser/chromium/chromium_20.0.1086.0.bb
deleted file mode 100644
index 50fad5c..0000000
--- a/recipes-browser/chromium/chromium_20.0.1086.0.bb
+++ /dev/null
@@ -1,141 +0,0 @@
-DESCRIPTION = "Chromium browser"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0750f191c9bbf46869b70508e7eb455b"
-DEPENDS = "xextproto cairo nss gtk+-native zlib-native libav libxi libgnome-keyring libxss cups"
-
-SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P}.tar.bz2 \
-        file://include.gypi \
-        file://unistd.patch \
-"
-
-# include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
-COMPATIBLE_MACHINE = "(-)"
-COMPATIBLE_MACHINE_armv6 = "(.*)"
-COMPATIBLE_MACHINE_armv7a = "(.*)"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI[md5sum] = "86535af2d00d157b358e8fd6fb6ad38c"
-SRC_URI[sha256sum] = "6d215eed43cc607e54991d1a87798ed0ac1683dfde9a0cf2f64ed06be79a9423"
-
-inherit gettext
-
-EXTRA_OEGYP =	" \
-	-Duse_system_bzip2=1 \
-	\
-	-Dproprietary_codecs=1 \
-	\
-	-Dtarget_arch=${TARGET_ARCH} \ 
-	-Ddisable_nacl=1 \
-	-Dlinux_use_tcmalloc=0 \
-	\
-	-Dlinux_link_kerberos=0 \
-	-Duse_kerberos=0 \
-	-Duse_cups=1 \
-	-Duse_gnome_keyring=1 \
-	-Dlinux_link_gnome_keyring=1 \
-	\
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0', d)} \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
-"
-
-EXTRA_OEGYP_append_armv7a = " \
-	-Darmv7=1 \
-	-Darm_neon=1 \
-"
-
-do_configure() {
-	cd ${WORKDIR}
-	export GYP_GENERATORS=make
-	rm -f ${S}/tools/gyp/pylib/gyp/__init__.pyc
-	rm -f ${S}/tools/gyp/pylib/gyp/__init__.pyo
-	sed -e 's|__PATH__TO_BE_REPLACED__|"${WORKDIR}/include.gypi"|' -i ${S}/tools/gyp/pylib/gyp/__init__.py
-	sed -e "s|__PATH__TO_BE_REPLACED__||" -i ${WORKDIR}/include.gypi
-
-	cd ${S}
-	build/gyp_chromium --depth=. ${EXTRA_OEGYP}
-}
-
-EXTRA_OEMAKE = "-r ${PARALLEL_MAKE} LDFLAGS.host=-L${STAGING_LIBDIR_NATIVE} V=1 BUILDTYPE=Release chrome"
-
-TARGET_CFLAGS += "-I${STAGING_INCDIR}/mozilla/nss -I${STAGING_INCDIR}/dst"
-TARGET_CXXFLAGS += "-I${STAGING_INCDIR}/mozilla/nss -I${STAGING_INCDIR}/dst"
-
-TARGET_CC_ARCH += " -Wno-error=deprecated-declarations"
-
-do_compile_prepend() {
-	export CROSSTOOL=${TARGET_PREFIX}
-	export AR=${CROSSTOOL}ar
-	export AS=${CROSSTOOL}as
-	export RANLIB=${CROSSTOOL}ranlib
-	# host tools are supposed to be linked with gold so we hack the
-	# makefiles to use gold which must be present on the host and named
-	# ld.gold.
-	# -fuse-ld=gold could be an option but that actually fails on Fedora
-	ln -sf `which ld.gold` ${WORKDIR}/ld
-	sed -i "s#LDFLAGS.host ?=#LDFLAGS.host = -B${WORKDIR}/#g" Makefile
-	for i in `find . -iname *.host*.mk`; do 
-		sed -i "s#-B\$(builddir)/../../third_party/gold#-B${WORKDIR}/#g" $i
-	done
-	# chromium seems to force the usage of its internal copy of a binary
-	# gold linker so remove this setting
-	for i in `find . -iname *.target*.mk`; do 
-		sed -i "s#-B\$(builddir)/../../third_party/gold# #g" $i
-	done
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -d ${D}${bindir}/chrome/
-	install -m 0755 ${S}/out/Release/chrome ${D}${bindir}/chrome/chrome
-	install -m 0644 ${S}/out/Release/chrome.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/resources.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/product_logo_48.png ${D}${bindir}/chrome/
-	install -d ${D}${bindir}/chrome/locales/
-	install -m 0644 ${S}/out/Release/locales/en-US.pak ${D}${bindir}/chrome/locales
-	cp -a ${S}/out/Release/obj ${D}${bindir}/chrome/
-	cp -a ${S}/out/Release/obj.target ${D}${bindir}/chrome/
-	cp -a ${S}/out/Release/resources ${D}${bindir}/chrome/
-
-	mv ${D}${bindir}/chrome/obj.target/third_party/ffmpeg/libffmpegsumo.so ${D}/${bindir}/chrome/libffmpegsumo.so
-
-	find ${D}${bindir}/chrome/ -name "*.d" -delete
-	find ${D}${bindir}/chrome/ -name "*.o" -delete
-	find ${D}${bindir}/chrome/ -name "*.a" -delete
-	find ${D}${bindir}/chrome/ -name "*.cpp" -delete
-	find ${D}${bindir}/chrome/ -name "*.h" -delete
-	find ${D}${bindir}/chrome/ -name "*.cc" -delete
-}
-
-# FIXME : hundred of WARNINGs
-FILES_${PN} = "/usr/bin/chrome/"
-FILES_${PN}-dbg = " \
-	${bindir}/chrome/.debug \
-	${bindir}/chrome/obj.target/third_party/WebKit/Source/WebKit/chromium/.debug \
-	${bindir}/chrome/obj.target/third_party/ffmpeg/.debug \
-	${bindir}/chrome/obj.target/third_party/angle/src/.debug \
-	${bindir}/chrome/obj.target/third_party/icu/.debug \
-	${bindir}/chrome/obj.target/third_party/icu/.debug \
-	${bindir}/chrome/obj.target/content/.debug \
-	${bindir}/chrome/obj.target/webkit/support/.debug \
-	${bindir}/chrome/obj.target/webkit/support/.debug \
-	${bindir}/chrome/obj.target/webkit/support/.debug \
-	${bindir}/chrome/obj.target/ui/gfx/surface/.debug \
-	${bindir}/chrome/obj.target/ui/gfx/gl/.debug \
-	${bindir}/chrome/obj.target/ui/.debug \
-	${bindir}/chrome/obj.target/sql/.debug \
-	${bindir}/chrome/obj.target/v8/tools/gyp/.debug \
-	${bindir}/chrome/obj.target/printing/.debug \
-	${bindir}/chrome/obj.target/crypto/.debug \
-	${bindir}/chrome/obj.target/net/.debug \
-	${bindir}/chrome/obj.target/base/.debug \
-	${bindir}/chrome/obj.target/base/.debug \
-	${bindir}/chrome/obj.target/ipc/.debug \
-	${bindir}/chrome/obj.target/media/.debug \
-	${bindir}/chrome/obj.target/skia/.debug \
-	${bindir}/chrome/obj.target/gpu/command_buffer/.debug \
-	${bindir}/chrome/obj.target/gpu/.debug \
-	${bindir}/chrome/obj.target/ppapi/.debug \
-	${bindir}/chrome/obj.target/ppapi/.debug \
-	${bindir}/chrome/obj.target/build/temp_gyp/.debug \
-"
diff --git a/recipes-browser/chromium/chromium_24.0.1312.52.bb b/recipes-browser/chromium/chromium_24.0.1312.52.bb
deleted file mode 100644
index f877812..0000000
--- a/recipes-browser/chromium/chromium_24.0.1312.52.bb
+++ /dev/null
@@ -1,76 +0,0 @@
-DESCRIPTION = "Chromium browser"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0750f191c9bbf46869b70508e7eb455b"
-DEPENDS = "xextproto cairo nss gtk+ zlib-native libav libxi libgnome-keyring libxss cups ninja-native gconf"
-
-SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P}.tar.bz2 \
-        file://include.gypi \
-        file://oe-defaults.gypi \
-        file://unistd-2.patch \
-        file://glib-2.16-use-siginfo_t.patch \
-        file://ui-gl-no-narrowing.patch \
-        file://google-chrome \
-        file://google-chrome.desktop \
-        file://0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch \
-"
-
-PR = "r2"
-
-# include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
-COMPATIBLE_MACHINE = "(-)"
-COMPATIBLE_MACHINE_i586 = "(.*)"
-COMPATIBLE_MACHINE_x86-64 = "(.*)"
-COMPATIBLE_MACHINE_armv6 = "(.*)"
-COMPATIBLE_MACHINE_armv7a = "(.*)"
-
-SRC_URI[md5sum] = "ed027b16b20e673af6dcf1831a6d8652"
-SRC_URI[sha256sum] = "f30df8b0f4c999185bb11d873f0caa5d8bc581eb4f37ce0fe85fb7900a01d711"
-
-inherit gettext
-
-EXTRA_OEGYP =	" \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0', d)} \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
-	-I ${WORKDIR}/oe-defaults.gypi \
-	-I ${WORKDIR}/include.gypi \
-	-f ninja \
-"
-ARMFPABI_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
-export GYP_DEFINES="${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs'"
-do_configure() {
-	cd ${S}
-	# replace LD with CXX, to workaround a possible gyp issue?
-	LD="${CXX}" export LD
-	CC="${CC}" export CC
-	CXX="${CXX}" export CXX
-	CC_host="gcc" export CC_host
-	CXX_host="g++" export CXX_host
-	build/gyp_chromium --depth=. ${EXTRA_OEGYP}
-}
-
-do_compile() {
-	# build with ninja
-	ninja -C ${S}/out/Release chrome 
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 ${WORKDIR}/google-chrome ${D}${bindir}/
-
-	install -d ${D}${datadir}/applications
-	install -m 0644 ${WORKDIR}/google-chrome.desktop ${D}${datadir}/applications/
-
-	install -d ${D}${bindir}/chrome/
-	install -m 0755 ${S}/out/Release/chrome ${D}${bindir}/chrome/chrome
-	install -m 0644 ${S}/out/Release/chrome.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/resources.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/chrome_100_percent.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/product_logo_48.png ${D}${bindir}/chrome/
-	install -m 0755 ${S}/out/Release/libffmpegsumo.so ${D}${bindir}/chrome/
-
-	install -d ${D}${bindir}/chrome/locales/
-	install -m 0644 ${S}/out/Release/locales/en-US.pak ${D}${bindir}/chrome/locales
-}
-
-FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications"
-FILES_${PN}-dbg = "${bindir}/chrome/.debug/"
-- 
1.7.9.5


