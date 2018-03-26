Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id E4B227865E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 21:43:37 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id r82so18177708wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=W+Q+vubid3dye3ZwtxahVKmDO3fdzxqgh2wTSHxEn8c=;
	b=iOjfAJHNawj9sJbMQnP9hpda1kQLhPkzZhXXmNTSePwu7+P9ZDg0hC5AnQBPOe0ib3
	Rfnf/fJ4mTUwVPK8q0D1UKeT7XBYIzLCIfz0QGFcRfo3Kw9df7qH1l32Sy3LnY4HsFTw
	MeUtzufGUhAMlrJ9NVjkUc23fppMl7thmb3abJ99dmlJxLp1LCqSsBgSOhtm2HrovrRX
	1TCXrLbBF9DnkzfKvbnsjPOSou/8b+pT0jTj0MHsassL4oF4LajJgj43JrfyHLtHDjvv
	UlQRkVJAPipeaSwISjZVWtCHSoxdoj7jpwZ+ANrG9SYql6SWN6oVzUuiGI48juDWrTeu
	J9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=W+Q+vubid3dye3ZwtxahVKmDO3fdzxqgh2wTSHxEn8c=;
	b=a4KDD8PHBICkeCR5N5oztIIZ7YOiSB82wB1nV0XwAz8x8irSEvVN9KeRtJjX/tjTYJ
	jNMjBxkonO1od8X8HlT2HBVjBBWNrT9WZtg3oVLUpb0JzBFo3U4Ahit0Ea2peE/8iu6z
	e3alHpDDHDYc34XHsXtiOmM9x+/fGdPtjI0AlLl1Vk1+PFm4bGeZOHHsFZh/Wz54uqRs
	RsH5K16qzPypWEF+piWJiB3UYx3fHgWcCe+vaaJeJSPNSdop8Tzm93R7xdY21jHBFpMP
	urvPKpXnimRQ/iuNuGD2g7Ee+pnhYv7sxg/pjzOiK3WwQqb667otimC6KUlw3YnHd66+
	U0vg==
X-Gm-Message-State: AElRT7FP8Ovtu34hx2FMCkyha/h3MM80JjyeMAjtrtVC21FEAKA8bSvc
	cTo+/XjVf22gL/Tmm9DT/UYexQ==
X-Google-Smtp-Source: AG47ELtzDESu6vvtNNOxw0tc1cyTrI/sA9Nhm0cKwJ9+qeEkepRHN7qTDuIJKWg0eqhOcB3wOwvAYA==
X-Received: by 10.28.171.193 with SMTP id u184mr15398884wme.32.1522100618441; 
	Mon, 26 Mar 2018 14:43:38 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	95sm17759695wrb.47.2018.03.26.14.43.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 26 Mar 2018 14:43:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Mar 2018 21:43:34 +0000
Message-Id: <20180326214334.26378-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <CA+chaQdLz1OuDFa2BMTRz-D=xwFk4PFbASJOsxR=578_jQuP4w@mail.gmail.com>
References: <CA+chaQdLz1OuDFa2BMTRz-D=xwFk4PFbASJOsxR=578_jQuP4w@mail.gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCHv3] mozjs: refresh patches
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
X-List-Received-Date: Mon, 26 Mar 2018 21:43:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WARNING: mozjs-17.0.0-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch Manually_mmap_heap_memory_esr17.patch
patching file js/src/gc/Memory.cpp
Hunk #1 succeeded at 309 with fuzz 1 (offset 3 lines).
Hunk #2 succeeded at 391 (offset 3 lines).

Now at patch Manually_mmap_heap_memory_esr17.patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ozjs17.0.0-fix-the-compile-bug-of-powerpc.patch | 17 +++++++-------
 ...not-include-RequiredDefines.h-for-depend.patch} | 17 +++++++-------
 ...3-Move-JS_BYTES_PER_WORD-out-of-config.h.patch} | 12 ++++------
 ...upport.patch => 0004-Add-AArch64-support.patch} | 14 +++++------
 ...-mozbug746112-no-decommit-on-large-pages.patch} | 12 ++++------
 ...-64k-page.patch => 0006-aarch64-64k-page.patch} | 12 ++++------
 ...-regenerate-configure-with-autoconf-2.13.patch} |  8 +++----
 .../0008-fix-the-compile-error-of-powerpc64.patch  | 27 ++++++++++++++++++++++
 ...9-fix-the-compile-error-do-to-perl-update.patch | 27 ++++++++++++++++++++++
 ...010-fix-cross-compilation-on-i586-targets.patch | 11 ++++-----
 ...Manually-mmap-on-arm64-to-ensure-high-17.patch} | 14 +++++------
 ...first-character-of-string-to-be-null-or-.patch} |  7 +++---
 .../mozjs/fix-the-compile-error-of-powerpc64.patch | 18 ---------------
 .../mozjs/mozjs/fix_milestone_compile_issue.patch  | 20 ----------------
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     | 26 ++++++++++-----------
 15 files changed, 122 insertions(+), 120 deletions(-)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch => 0002-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch} (80%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch => 0003-Move-JS_BYTES_PER_WORD-out-of-config.h.patch} (92%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0003-Add-AArch64-support.patch => 0004-Add-AArch64-support.patch} (92%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0004-mozbug746112-no-decommit-on-large-pages.patch => 0005-mozbug746112-no-decommit-on-large-pages.patch} (95%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0005-aarch64-64k-page.patch => 0006-aarch64-64k-page.patch} (88%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0001-regenerate-configure.patch => 0007-regenerate-configure-with-autoconf-2.13.patch} (99%)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0008-fix-the-compile-error-of-powerpc64.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0009-fix-the-compile-error-do-to-perl-update.patch
 rename meta-oe/recipes-extended/mozjs/mozjs/{Manually_mmap_heap_memory_esr17.patch => 0011-Bug-1143022-Manually-mmap-on-arm64-to-ensure-high-17.patch} (94%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0001-compare-the-first-character-of-string-to-be-null-or-.patch => 0012-compare-the-first-character-of-string-to-be-null-or-.patch} (92%)
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_compile_issue.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch
index de72d4f9a3..6df7815bbe 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch
@@ -1,4 +1,4 @@
-From da3929a96d9c74e11bf37d128890e18fcb745365 Mon Sep 17 00:00:00 2001
+From 08b62f039e0fee50e9399ce2e48b56770f8f71e3 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Mon, 26 Jan 2015 08:53:19 +0900
 Subject: [PATCH] mozjs17.0.0: fix the compile bug of powerpc
@@ -10,14 +10,16 @@ argument '5' to 'JSBool TryArgumentFormatter(JSContext*, const char**,
 JSBool, jsval**, __va_list_tag (*)[1])'
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+
+
 ---
- jscpucfg.h | 6 ++++++
+ js/src/jscpucfg.h | 6 ++++++
  1 file changed, 6 insertions(+)
 
-diff --git a/jscpucfg.h b/jscpucfg.h
-index dfb1c14..8683491 100644
---- a/jscpucfg.h
-+++ b/jscpucfg.h
+diff --git a/js/src/jscpucfg.h b/js/src/jscpucfg.h
+index 3d2022d..58d3987 100644
+--- a/js/src/jscpucfg.h
++++ b/js/src/jscpucfg.h
 @@ -47,6 +47,12 @@
  #elif defined(JS_HAVE_ENDIAN_H)
  # include <endian.h>
@@ -31,6 +33,3 @@ index dfb1c14..8683491 100644
  # if defined(__BYTE_ORDER)
  #  if __BYTE_ORDER == __LITTLE_ENDIAN
  #   define IS_LITTLE_ENDIAN 1
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch b/meta-oe/recipes-extended/mozjs/mozjs/0002-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
similarity index 80%
rename from meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
rename to meta-oe/recipes-extended/mozjs/mozjs/0002-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
index bc141d9d57..1921d9068e 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0002-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
@@ -1,4 +1,4 @@
-From 0a61b0b98c152f10404ccbdeeac583a486638a7a Mon Sep 17 00:00:00 2001
+From 979cf045d71d8d00b6359e27b70b27f4cbefca4a Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Thu, 6 Jun 2013 18:36:01 +0200
 Subject: [PATCH] js.pc.in: do not include RequiredDefines.h for depending
@@ -16,20 +16,19 @@ and currently it only defines __STDC_LIMIT_MACROS
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
+
 ---
- js.pc.in |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ js/src/js.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/js.pc.in b/js.pc.in
+diff --git a/js/src/js.pc.in b/js/src/js.pc.in
 index 13d761d..a95a7bd 100644
---- a/js.pc.in
-+++ b/js.pc.in
+--- a/js/src/js.pc.in
++++ b/js/src/js.pc.in
 @@ -8,4 +8,4 @@ Description: The Mozilla library for JavaScript
  Version: @MOZILLA_VERSION@
  Requires.private: @NSPR_PKGCONF_CHECK@
  Libs: -L${libdir} -l@LIBRARY_NAME@
 -Cflags: -include ${includedir}/@MODULE@/js/RequiredDefines.h -I${includedir}/@MODULE@
 +Cflags: -I${includedir}/@MODULE@
--- 
-1.7.6.5
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch b/meta-oe/recipes-extended/mozjs/mozjs/0003-Move-JS_BYTES_PER_WORD-out-of-config.h.patch
similarity index 92%
rename from meta-oe/recipes-extended/mozjs/mozjs/0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch
rename to meta-oe/recipes-extended/mozjs/mozjs/0003-Move-JS_BYTES_PER_WORD-out-of-config.h.patch
index 6aeb2f6836..500c143244 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0003-Move-JS_BYTES_PER_WORD-out-of-config.h.patch
@@ -1,15 +1,16 @@
-From d4a15ad82292ff6d772dcc631df98754d20be31b Mon Sep 17 00:00:00 2001
+From 8440685a6e2abd3d6adc7c53a98b5a1ff2d47084 Mon Sep 17 00:00:00 2001
 From: Colin Walters <walters@verbum.org>
 Date: Tue, 18 Mar 2014 11:46:05 -0400
-Subject: [PATCH 2/5] Move JS_BYTES_PER_WORD out of config.h
+Subject: [PATCH] Move JS_BYTES_PER_WORD out of config.h
 
 Instead define it in terms of the already extant GNU C extension
 __SIZEOF_POINTER__.  This avoids multiarch conflicts when 32 and 64
 bit packages of js are co-installed.
----
 
-Upstream-status: Pending
+Upstream-Status: Pending
+
 
+---
  js/src/configure.in   |  9 ---------
  js/src/js-config.h.in |  1 -
  js/src/jstypes.h      | 12 ++++++++++++
@@ -70,6 +71,3 @@ index d0cf183..3e7928f 100644
  
  /***********************************************************************
  ** MACROS:      JS_EXTERN_API
--- 
-1.9.3
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0003-Add-AArch64-support.patch b/meta-oe/recipes-extended/mozjs/mozjs/0004-Add-AArch64-support.patch
similarity index 92%
rename from meta-oe/recipes-extended/mozjs/mozjs/0003-Add-AArch64-support.patch
rename to meta-oe/recipes-extended/mozjs/mozjs/0004-Add-AArch64-support.patch
index 6e724292a4..f4a588679e 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0003-Add-AArch64-support.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0004-Add-AArch64-support.patch
@@ -1,11 +1,14 @@
-From 15e710e331d36eb279852b5cd1ba37a9a6005217 Mon Sep 17 00:00:00 2001
+From 3da3d5331905da69215044b645a0080bc36f5262 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen.kooi@linaro.org>
 Date: Mon, 2 Mar 2015 19:08:22 +0800
-Subject: [PATCH 3/5] Add AArch64 support
+Subject: [PATCH] Add AArch64 support
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
----
-Upstream-status: Pending
 
+---
  js/src/assembler/jit/ExecutableAllocator.h | 6 ++++++
  js/src/assembler/wtf/Platform.h            | 4 ++++
  js/src/configure.in                        | 4 ++++
@@ -71,6 +74,3 @@ index 0eec2d9..fe26dab 100644
      defined(_MIPS_ARCH_MIPS32R2)
  #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
  #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
--- 
-1.9.3
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0004-mozbug746112-no-decommit-on-large-pages.patch b/meta-oe/recipes-extended/mozjs/mozjs/0005-mozbug746112-no-decommit-on-large-pages.patch
similarity index 95%
rename from meta-oe/recipes-extended/mozjs/mozjs/0004-mozbug746112-no-decommit-on-large-pages.patch
rename to meta-oe/recipes-extended/mozjs/mozjs/0005-mozbug746112-no-decommit-on-large-pages.patch
index 8bd35d4055..891ef0cfc9 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0004-mozbug746112-no-decommit-on-large-pages.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0005-mozbug746112-no-decommit-on-large-pages.patch
@@ -1,11 +1,12 @@
-From 0128c5a9eeee0d3fc0deb9129dd20eb79338c8f4 Mon Sep 17 00:00:00 2001
+From 487eb121c65b3df72a847984304c0b212e450353 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen.kooi@linaro.org>
 Date: Mon, 2 Mar 2015 19:08:59 +0800
-Subject: [PATCH 4/5] mozbug746112-no-decommit-on-large-pages
+Subject: [PATCH] mozbug746112-no-decommit-on-large-pages
+
+Upstream-Status: Pending
 
----
-Upstream-status: Pending
 
+---
  js/src/gc/Heap.h | 15 ++++++++++-----
  js/src/jsgc.cpp  | 15 ++++++++++++---
  2 files changed, 22 insertions(+), 8 deletions(-)
@@ -98,6 +99,3 @@ index b3caf05..a258d2d 100644
              }
  
              if (ok) {
--- 
-1.9.3
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0005-aarch64-64k-page.patch b/meta-oe/recipes-extended/mozjs/mozjs/0006-aarch64-64k-page.patch
similarity index 88%
rename from meta-oe/recipes-extended/mozjs/mozjs/0005-aarch64-64k-page.patch
rename to meta-oe/recipes-extended/mozjs/mozjs/0006-aarch64-64k-page.patch
index bc99ecc504..2a6b146f4e 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0005-aarch64-64k-page.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0006-aarch64-64k-page.patch
@@ -1,11 +1,12 @@
-From 9c42920c2b635a399bd1f93833efdeb1696f17ee Mon Sep 17 00:00:00 2001
+From 9774ec850c0042d5121b4176150c40e701640600 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen.kooi@linaro.org>
 Date: Mon, 2 Mar 2015 19:09:57 +0800
-Subject: [PATCH 5/5] aarch64-64k-page
+Subject: [PATCH] aarch64-64k-page
+
+Upstream-Status: Pending
 
----
-Upstream-status: Pending
 
+---
  js/src/gc/Heap.h     | 2 +-
  js/src/gc/Memory.cpp | 3 +++
  2 files changed, 4 insertions(+), 1 deletion(-)
@@ -39,6 +40,3 @@ index 5b386a2..e5ad018 100644
  }
  
  void *
--- 
-1.9.3
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-regenerate-configure.patch b/meta-oe/recipes-extended/mozjs/mozjs/0007-regenerate-configure-with-autoconf-2.13.patch
similarity index 99%
rename from meta-oe/recipes-extended/mozjs/mozjs/0001-regenerate-configure.patch
rename to meta-oe/recipes-extended/mozjs/mozjs/0007-regenerate-configure-with-autoconf-2.13.patch
index fa413ea9f3..67d910f34b 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-regenerate-configure.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0007-regenerate-configure-with-autoconf-2.13.patch
@@ -1,4 +1,4 @@
-From 6440b4901c6f4bcc69686ff10806e311cc5a927b Mon Sep 17 00:00:00 2001
+From cc0e4a1a806fcb7250809dccc20a69efd77d555a Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen.kooi@linaro.org>
 Date: Tue, 3 Mar 2015 19:12:17 +0800
 Subject: [PATCH] regenerate configure with autoconf-2.13
@@ -6,12 +6,13 @@ Subject: [PATCH] regenerate configure with autoconf-2.13
 Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
 Upstream-status: Inappropriate [generated file]
 
+
 ---
  js/src/configure | 838 ++++++++++++++++++++++++++-----------------------------
  1 file changed, 389 insertions(+), 449 deletions(-)
 
 diff --git a/js/src/configure b/js/src/configure
-index cb6b41b..b05298f 100755
+index cb6b41b..d019b0f 100755
 --- a/js/src/configure
 +++ b/js/src/configure
 @@ -5757,6 +5757,10 @@ arm*)
@@ -3233,6 +3234,3 @@ index cb6b41b..b05298f 100755
    rm -rf conftest*
    eval "ac_cv_func_$ac_func=yes"
  else
--- 
-1.9.3
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0008-fix-the-compile-error-of-powerpc64.patch b/meta-oe/recipes-extended/mozjs/mozjs/0008-fix-the-compile-error-of-powerpc64.patch
new file mode 100644
index 0000000000..f17af420ef
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0008-fix-the-compile-error-of-powerpc64.patch
@@ -0,0 +1,27 @@
+From bad8389bc110bd4b4b5f266c63edcf0099f56acc Mon Sep 17 00:00:00 2001
+From: Chunrong Guo <B40290@freescale.com>
+Date: Fri, 24 Apr 2015 15:15:12 +0800
+Subject: [PATCH] fix the compile error of powerpc64
+
+Upstream-status: Accepted
+
+ fix the following error
+ |error: 'jsuword' does not name a type
+
+
+---
+ js/src/jsval.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/js/src/jsval.h b/js/src/jsval.h
+index a6858ce..187f1b9 100644
+--- a/js/src/jsval.h
++++ b/js/src/jsval.h
+@@ -304,7 +304,6 @@ typedef union jsval_layout
+             int32_t        i32;
+             uint32_t       u32;
+             JSWhyMagic     why;
+-            jsuword        word;
+         } payload;
+     } s;
+     double asDouble;
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0009-fix-the-compile-error-do-to-perl-update.patch b/meta-oe/recipes-extended/mozjs/mozjs/0009-fix-the-compile-error-do-to-perl-update.patch
new file mode 100644
index 0000000000..3ad100bf29
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0009-fix-the-compile-error-do-to-perl-update.patch
@@ -0,0 +1,27 @@
+From 221d01fc756f2e7ebb6f477b1ff046f249f370c4 Mon Sep 17 00:00:00 2001
+From: Armin Kuster <akuster808@gmail.com>
+Date: Fri, 10 Jul 2015 20:49:41 -0700
+Subject: [PATCH] fix the compile error do to perl update
+
+Upstream-status: Inappropriate
+
+Signed-of-by: Armin Kuster <akuster808@gmail.com>
+
+
+---
+ js/src/config/milestone.pl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/js/src/config/milestone.pl b/js/src/config/milestone.pl
+index db3f6dd..49b9568 100644
+--- a/js/src/config/milestone.pl
++++ b/js/src/config/milestone.pl
+@@ -55,7 +55,7 @@ $MILESTONE_FILE  = "$TOPSRCDIR/config/milestone.txt";
+ #
+ my $milestone = Moz::Milestone::getOfficialMilestone($MILESTONE_FILE);
+ 
+-if (defined(@TEMPLATE_FILE)) {
++if (@TEMPLATE_FILE) {
+   my $TFILE;
+ 
+   foreach $TFILE (@TEMPLATE_FILE) {
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch b/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
index 6432e1fb7b..596ba2ab85 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
@@ -1,4 +1,4 @@
-From a452138a1dd274bfad381a701729783360dc86fb Mon Sep 17 00:00:00 2001
+From 25499199019de9766da4a4d70d01a322186ff889 Mon Sep 17 00:00:00 2001
 From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
 Date: Tue, 5 Jan 2016 22:04:17 +0100
 Subject: [PATCH] fix cross compilation on i586 targets
@@ -10,13 +10,15 @@ regenerate configure, similar fix is applied there.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
+
+
 ---
  js/src/configure    | 2 +-
  js/src/configure.in | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/js/src/configure b/js/src/configure
-index d019b0fdba44233596541de94307010d85a8e32e..5aa40f757a3dbb7d6887175046f44212c15c2eac 100755
+index d019b0f..5aa40f7 100755
 --- a/js/src/configure
 +++ b/js/src/configure
 @@ -5555,7 +5555,7 @@ TARGET_MD_ARCH=unix
@@ -29,7 +31,7 @@ index d019b0fdba44233596541de94307010d85a8e32e..5aa40f757a3dbb7d6887175046f44212
  MOZ_COMPONENT_NSPR_LIBS='-L$(LIBXUL_DIST)/bin $(NSPR_LIBS)'
  
 diff --git a/js/src/configure.in b/js/src/configure.in
-index 0673aca12f6d83035549ade2a4a83906bf91f0f0..39b22724f9535ac1a6dba04658c91e4ef667fc47 100644
+index 0673aca..39b2272 100644
 --- a/js/src/configure.in
 +++ b/js/src/configure.in
 @@ -919,7 +919,7 @@ TARGET_MD_ARCH=unix
@@ -41,6 +43,3 @@ index 0673aca12f6d83035549ade2a4a83906bf91f0f0..39b22724f9535ac1a6dba04658c91e4e
  
  MOZ_COMPONENT_NSPR_LIBS='-L$(LIBXUL_DIST)/bin $(NSPR_LIBS)'
  
--- 
-2.5.0
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch b/meta-oe/recipes-extended/mozjs/mozjs/0011-Bug-1143022-Manually-mmap-on-arm64-to-ensure-high-17.patch
similarity index 94%
rename from meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch
rename to meta-oe/recipes-extended/mozjs/mozjs/0011-Bug-1143022-Manually-mmap-on-arm64-to-ensure-high-17.patch
index 15ad03f712..10f6717c8b 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0011-Bug-1143022-Manually-mmap-on-arm64-to-ensure-high-17.patch
@@ -1,4 +1,4 @@
-From a0c0f32299419359b44ac0f880c1ea9073ae51e1 Mon Sep 17 00:00:00 2001
+From e577e1838a46c16200bb3bfa5cf2faf84a7da904 Mon Sep 17 00:00:00 2001
 From: Zheng Xu <zheng.xu@linaro.org>
 Date: Fri, 2 Sep 2016 17:40:05 +0800
 Subject: [PATCH] Bug 1143022 - Manually mmap on arm64 to ensure high 17 bits
@@ -11,16 +11,17 @@ Change-Id: Ic5d2b2fe4b758b3c87cc0688348af7e71a991146
 
 Upstream-status: Backport
 
+
 ---
  js/src/gc/Memory.cpp | 73 ++++++++++++++++++++++++++++++++++++++++++++++++++--
  1 file changed, 71 insertions(+), 2 deletions(-)
 
 diff --git a/js/src/gc/Memory.cpp b/js/src/gc/Memory.cpp
-index 5b386a2..38101cf 100644
+index e5ad018..4149adf 100644
 --- a/js/src/gc/Memory.cpp
 +++ b/js/src/gc/Memory.cpp
-@@ -306,6 +306,75 @@ InitMemorySubsystem()
-         MOZ_CRASH();
+@@ -309,6 +309,75 @@ InitMemorySubsystem()
+ #endif
  }
  
 +static inline void *
@@ -95,7 +96,7 @@ index 5b386a2..38101cf 100644
  void *
  MapAlignedPages(size_t size, size_t alignment)
  {
-@@ -319,12 +388,12 @@ MapAlignedPages(size_t size, size_t alignment)
+@@ -322,12 +391,12 @@ MapAlignedPages(size_t size, size_t alignment)
  
      /* Special case: If we want page alignment, no further work is needed. */
      if (alignment == PageSize) {
@@ -110,6 +111,3 @@ index 5b386a2..38101cf 100644
      if (region == MAP_FAILED)
          return NULL;
  
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-compare-the-first-character-of-string-to-be-null-or-.patch b/meta-oe/recipes-extended/mozjs/mozjs/0012-compare-the-first-character-of-string-to-be-null-or-.patch
similarity index 92%
rename from meta-oe/recipes-extended/mozjs/mozjs/0001-compare-the-first-character-of-string-to-be-null-or-.patch
rename to meta-oe/recipes-extended/mozjs/mozjs/0012-compare-the-first-character-of-string-to-be-null-or-.patch
index 40d646c7df..61fb529e17 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-compare-the-first-character-of-string-to-be-null-or-.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0012-compare-the-first-character-of-string-to-be-null-or-.patch
@@ -1,4 +1,4 @@
-From f36c9476d2816e0d3e61c9e13c22ed73883cb54a Mon Sep 17 00:00:00 2001
+From b79d8fefb78c0cfb2144db9282a28fb1aa1ad372 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 24 Apr 2017 12:13:43 -0700
 Subject: [PATCH] compare the first character of string to be null or not
@@ -10,6 +10,8 @@ error: ISO C++ forbids comparison between pointer and integer [-fpermissive]
 |                          ^~~~
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
 ---
  js/src/shell/jsoptparse.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -27,6 +29,3 @@ index b49d0a5..612aa00 100644
              return error("A value is required for option %.*s", eq - argv[*i], argv[*i]);
          return Okay;
      }
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch b/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch
deleted file mode 100644
index 43c459042b..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-fix the compile error of powerpc64
- 
-Upstream-status: Accepted
-
- fix the following error
- |error: 'jsuword' does not name a type
-
-
---- a/js/src/jsval.hold	2015-04-24 01:15:06.692970731 -0500
-+++ b/js/src/jsval.h	2015-04-24 01:15:41.792969478 -0500
-@@ -304,7 +304,6 @@
-             int32_t        i32;
-             uint32_t       u32;
-             JSWhyMagic     why;
--            jsuword        word;
-         } payload;
-     } s;
-     double asDouble;
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_compile_issue.patch b/meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_compile_issue.patch
deleted file mode 100644
index abde01bcdb..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_compile_issue.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-fix the compile error do to perl update
-
-Upstream-status: Inappropriate
-
-
-Signed-of-by: Armin Kuster <akuster808@gmail.com>
-
-Index: src/config/milestone.pl
-===================================================================
---- src.orig/config/milestone.pl
-+++ src/config/milestone.pl
-@@ -55,7 +55,7 @@ $MILESTONE_FILE  = "$TOPSRCDIR/config/mi
- #
- my $milestone = Moz::Milestone::getOfficialMilestone($MILESTONE_FILE);
- 
--if (defined(@TEMPLATE_FILE)) {
-+if (@TEMPLATE_FILE) {
-   my $TFILE;
- 
-   foreach $TFILE (@TEMPLATE_FILE) {
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 49b7f156e1..13be7caef9 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -4,19 +4,19 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://../../LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
 SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/${BPN}${PV}.tar.gz \
-           file://0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch \
-           file://0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch \
-           file://0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch;patchdir=../../ \
-           file://0003-Add-AArch64-support.patch;patchdir=../../ \
-           file://0004-mozbug746112-no-decommit-on-large-pages.patch;patchdir=../../ \
-           file://0005-aarch64-64k-page.patch;patchdir=../../ \
-           file://0001-regenerate-configure.patch;patchdir=../../ \
-           file://fix-the-compile-error-of-powerpc64.patch;patchdir=../../ \
-           file://fix_milestone_compile_issue.patch \
-           file://0010-fix-cross-compilation-on-i586-targets.patch;patchdir=../../ \
-           file://Manually_mmap_heap_memory_esr17.patch;patchdir=../../ \
-           file://0001-compare-the-first-character-of-string-to-be-null-or-.patch;patchdir=../../ \
-           "
+    file://0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch;patchdir=../.. \
+    file://0002-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch;patchdir=../.. \
+    file://0003-Move-JS_BYTES_PER_WORD-out-of-config.h.patch;patchdir=../.. \
+    file://0004-Add-AArch64-support.patch;patchdir=../.. \
+    file://0005-mozbug746112-no-decommit-on-large-pages.patch;patchdir=../.. \
+    file://0006-aarch64-64k-page.patch;patchdir=../.. \
+    file://0007-regenerate-configure-with-autoconf-2.13.patch;patchdir=../.. \
+    file://0008-fix-the-compile-error-of-powerpc64.patch;patchdir=../.. \
+    file://0009-fix-the-compile-error-do-to-perl-update.patch;patchdir=../.. \
+    file://0010-fix-cross-compilation-on-i586-targets.patch;patchdir=../.. \
+    file://0011-Bug-1143022-Manually-mmap-on-arm64-to-ensure-high-17.patch;patchdir=../.. \
+    file://0012-compare-the-first-character-of-string-to-be-null-or-.patch;patchdir=../.. \
+"
 
 SRC_URI[md5sum] = "20b6f8f1140ef6e47daa3b16965c9202"
 SRC_URI[sha256sum] = "321e964fe9386785d3bf80870640f2fa1c683e32fe988eeb201b04471c172fba"
-- 
2.15.1


