Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2644C47073
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 15:11:36 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.25180.1703257890770808584
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 07:11:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O2YY8fn5;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cc6c028229so23194601fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 07:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703257889; x=1703862689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSKcjJ4uyE3+TEZ189DRTJH0+wCgp1jowd/cKoCEqzU=;
        b=O2YY8fn5UCACsYy7QDUrZASQ1EvCuSosYo0ymPd4dBGA6lZpfS007bNKadI5yATWlN
         edq1FGk5JmUEdW1magW3tThrbcDMGPHUqqWIpM6nbKV3EN6YsrXnM8IYqzMfhQNjX6CP
         Y+4dQt0i1EMv/hERtAnDgYi/7R1Rt8Fbr0CL0MbPumcBf/UZVvYV+KDDzkMLUNRe24ON
         sMrNPz9a+iKIGVaUXMZBT80l4pCdjMUHXn57TpzsdCmY9aQM3fHuyBkOSfGNdiGfwpl1
         Kg6UqgYEBONlnjBzf/V7wXH/Ztf7FYPHhYnoumZn/GNe1MwgUsO0C83Zlt01Ft9bjKw2
         Cmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703257889; x=1703862689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSKcjJ4uyE3+TEZ189DRTJH0+wCgp1jowd/cKoCEqzU=;
        b=sQ7SgrVrUeGkaZGhP+aeNCLjWnWSIg14I/yLlQOTEJKq2RtM6JmJQxjvZYOiTsi1ah
         3ziMrvEG71peQWfv3k4aKJqNRhyrGdkmRcZX4Sa8tCicTFVdbousLOyI2WEX0ecy6+Tn
         wgfeEE2WgMdpQXmVHZFOCi24OcySDLlFwDCicwy/Np5Qk9FuzbbzHrIZO6JKMlOaXQZz
         WGChJGgJ4wdQoVKU+7X+qnv2XV0BnVV9qyR05jUeLK7ZxZIfTHMmwfeV7oNGwwwdctSz
         fnt5eR2gXXJOy5Jwyw3ukcf+oW9vL8ZiAQJShr64YSAcaA6Flytpx4w7VXPoe6yi2AF5
         Vuxw==
X-Gm-Message-State: AOJu0YwyoVbnNMOdZYXYy1NHqUlFAeN2b7/3Ax7ZV9MM2n9ncmt/yK3+
	pWvyT2jrNmM8rdRkOabdWP1Jst3AFsJEWA==
X-Google-Smtp-Source: AGHT+IF42FadWQu5G4PLNg7UeunhCCA0aAnLW0MNdxEL4FE3kC4QaFOss5KZ0wWuYDQGo5XERP4VXQ==
X-Received: by 2002:a2e:9092:0:b0:2cc:6579:9e35 with SMTP id l18-20020a2e9092000000b002cc65799e35mr797398ljg.23.1703257888287;
        Fri, 22 Dec 2023 07:11:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m9-20020aa7c2c9000000b00552666f4745sm2650247edp.22.2023.12.22.07.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 07:11:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/9] mozjs-102: remove the recipe
Date: Fri, 22 Dec 2023 16:11:05 +0100
Message-Id: <20231222151108.645675-6-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231222151108.645675-1-alex@linutronix.de>
References: <20231222151108.645675-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 15:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107760

mozjs-102 was retained for the purpose of supporting polkit;
with the backport of mozjs-115 patch for polkit there are no
further consumers, and it's not compatible with python 3.12.

I didn't look into what specifically breaks with 3.12, as getting
mozjs-115 to work with it was tricky enough, so I'd rather drop
mozjs-102, than attempt to make it work.

mozjs-115 is esr (long term support) release like mozjs-102,
but it is also newer and therefore will remain in support longer.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../packagegroup-meta-oe.bbappend             |  1 -
 ...001-Cargo.toml-do-not-abort-on-panic.patch | 32 --------
 .../0001-add-arm-to-list-of-mozinline.patch   | 25 ------
 ...-autoconf-s-config.sub-to-canonicali.patch | 29 -------
 ...rewrite-cargo-host-linker-in-python3.patch | 54 ------------
 ...ix-one-occasionally-reproduced-confi.patch | 48 -----------
 ...nfigure-do-not-look-for-llvm-objdump.patch | 44 ----------
 ...o-not-try-to-find-a-suitable-upstrea.patch | 66 ---------------
 .../mozjs-102/0004-use-asm-sgidefs.h.patch    | 38 ---------
 .../mozjs/mozjs-102/fix-musl-build.patch      | 29 -------
 .../mozjs-102/musl-disable-stackwalk.patch    | 18 ----
 .../mozjs/mozjs-102/riscv32.patch             | 60 --------------
 .../mozjs/mozjs-102_102.15.1.bb               | 82 -------------------
 13 files changed, 526 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/0001-Cargo.toml-do-not-abort-on-panic.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/0001-add-arm-to-list-of-mozinline.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/0001-rewrite-cargo-host-linker-in-python3.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/0002-moz.configure-do-not-look-for-llvm-objdump.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/0004-use-asm-sgidefs.h.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/musl-disable-stackwalk.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/riscv32.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102_102.15.1.bb

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
index c3d4cbc50..db1813189 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -14,7 +14,6 @@ RDEPENDS:packagegroup-meta-oe-connectivity += "\
 
 RDEPENDS:packagegroup-meta-oe-extended += "\
     lcdproc \
-    mozjs-102 \
 "
 RDEPENDS:packagegroup-meta-oe-support += "\
     nvmetcli \
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/0001-Cargo.toml-do-not-abort-on-panic.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-Cargo.toml-do-not-abort-on-panic.patch
deleted file mode 100644
index 0dd936197..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/0001-Cargo.toml-do-not-abort-on-panic.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From bb46a8a729cc4d66ad36db40c17e36a5111f19c3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 1 Oct 2021 13:00:24 +0200
-Subject: [PATCH] Cargo.toml: do not abort on panic
-
-OE's rust is configured to unwind, and this setting clashes with it/
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- Cargo.toml | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/Cargo.toml b/Cargo.toml
-index f576534bf3..5ecc17c319 100644
---- a/Cargo.toml
-+++ b/Cargo.toml
-@@ -56,13 +56,11 @@ opt-level = 1
- rpath = false
- lto = false
- debug-assertions = true
--panic = "abort"
- 
- [profile.release]
- opt-level = 2
- rpath = false
- debug-assertions = false
--panic = "abort"
- 
- # Optimize build dependencies, because bindgen and proc macros / style
- # compilation take more to run than to build otherwise.
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/0001-add-arm-to-list-of-mozinline.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-add-arm-to-list-of-mozinline.patch
deleted file mode 100644
index 02f5e5c7e..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/0001-add-arm-to-list-of-mozinline.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Backport patch from firefox bugzilla to fix compile error for qemuarm with
-some armv7ve tunes such as 'armv7vethf' and 'armv7vet-vfpv3d16':
-
-| /path/to/build/tmp/work/armv7vet2hf-vfp-poky-linux-gnueabi/mozjs-102/102.5.0-r0/build/js/src/jit/AtomicOperationsGenerated.h:240:17:
-  error: 'asm' operand has impossible constraints
-|  240 |                 asm volatile (
-|      |                 ^~~
-
-Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=1761665]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-diff --git a/js/src/jit/GenerateAtomicOperations.py b/js/src/jit/GenerateAtomicOperations.py
-index d8a38a0..65f91ab 100644
---- a/js/src/jit/GenerateAtomicOperations.py
-+++ b/js/src/jit/GenerateAtomicOperations.py
-@@ -856,7 +856,7 @@ def generate_atomics_header(c_out):
- 
-         # Work around a GCC issue on 32-bit x86 by adding MOZ_NEVER_INLINE.
-         # See bug 1756347.
--        if is_gcc and cpu_arch == "x86":
-+        if is_gcc and cpu_arch in ("x86", "arm"):
-             contents = contents.replace("INLINE_ATTR", "MOZ_NEVER_INLINE inline")
-         else:
-             contents = contents.replace("INLINE_ATTR", "inline")
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
deleted file mode 100644
index fe905fe4d..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c860dcbe63b0e393c95bfb0131238f91aaac11d3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 7 Oct 2021 12:44:18 +0200
-Subject: [PATCH] build: do not use autoconf's config.sub to 'canonicalize'
- names
-
-The outcome is that processed names no longer match our custom rust
-target definitions, and the build fails.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- build/moz.configure/init.configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/moz.configure/init.configure b/build/moz.configure/init.configure
-index 81f500a0b7..0b7a2ff60f 100644
---- a/build/moz.configure/init.configure
-+++ b/build/moz.configure/init.configure
-@@ -585,7 +585,7 @@ def help_host_target(help, host, target):
- 
- def config_sub(shell, triplet):
-     config_sub = os.path.join(os.path.dirname(__file__), "..", "autoconf", "config.sub")
--    return check_cmd_output(shell, config_sub, triplet).strip()
-+    return triplet
- 
- 
- @depends("--host", shell)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/0001-rewrite-cargo-host-linker-in-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-rewrite-cargo-host-linker-in-python3.patch
deleted file mode 100644
index 73bcffe94..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/0001-rewrite-cargo-host-linker-in-python3.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 8e318c4e7e732327dabf51027860de45b6fb731e Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 18 Nov 2021 07:16:39 +0000
-Subject: [PATCH] Rewrite cargo-host-linker in python3
-
-Mozjs compile failed with this failure:
-/bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' not found (required by /build/tmp-glibc/work/corei7-64-wrs-linux/mozjs/91.1.0-r0/recipe-sysroot-native/usr/lib/libtinfo.so.5)
-
-Root Cause:
-cargo-host-linker has /bin/sh as it's interpreter, but cargo run the cmd
-with LD_LIBRARY_PATH set to recipe-sysroot-native. The host /bin/sh links
-libtinfo.so.5 under recipe-sysroot-native, which needs higher libc. But
-host libc is older libc. So the incompatible problem occurred.
-
-Solution:
-rewrite cargo-host-linker in python3
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- build/cargo-host-linker | 24 +++++++++++++++++++++---
- 1 file changed, 21 insertions(+), 3 deletions(-)
-
-diff --git a/build/cargo-host-linker b/build/cargo-host-linker
-index cbd0472bf7..87d43ce9ec 100755
---- a/build/cargo-host-linker
-+++ b/build/cargo-host-linker
-@@ -1,3 +1,21 @@
--#!/bin/sh
--# See comment in cargo-linker.
--eval ${MOZ_CARGO_WRAP_HOST_LD} ${MOZ_CARGO_WRAP_HOST_LDFLAGS} '"$@"'
-+#!/usr/bin/env python3
-+
-+import os,sys
-+
-+if os.environ['MOZ_CARGO_WRAP_HOST_LD'].strip():
-+    binary=os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]
-+else:
-+    sys.exit(0)
-+
-+if os.environ['MOZ_CARGO_WRAP_HOST_LDFLAGS'].strip():
-+    if os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:]:
-+        args=[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:] + [os.environ['MOZ_CARGO_WRAP_HOST_LDFLAGS']] + sys.argv[1:]
-+    else:
-+        args=[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + [os.environ['MOZ_CARGO_WRAP_HOST_LDFLAGS']] + sys.argv[1:]
-+else:
-+    if os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:]:
-+        args=[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:] + sys.argv[1:]
-+    else:
-+        args=[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + sys.argv[1:]
-+
-+os.execvp(binary, args)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/0001-util.configure-fix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
deleted file mode 100644
index d732fdaf6..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 2a6f66f39b4e623428b6d282bd4cb72dde67c1a6 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 11 Nov 2021 16:05:54 +0800
-Subject: [PATCH] util.configure: fix one occasionally reproduced configure
- failure
-
-error:
-| checking whether the C++ compiler supports -Wno-range-loop-analysis...
-| DEBUG: Creating /tmp/conftest.jr1qrcw3.cpp with content:
-| DEBUG: | int
-| DEBUG: | main(void)
-| DEBUG: | {
-| DEBUG: |
-| DEBUG: | ;
-| DEBUG: | return 0;
-| DEBUG: | }
-| DEBUG: Executing: aarch64-wrs-linux-g++ -mcpu=cortex-a53 -march=armv8-a+crc -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/mozjs/91.1.0-r0/recipe-sysroot /tmp/conftest.jr1qrcw3.cpp -Werror -Wrange-loop-analysis -c
-| DEBUG: The command returned non-zero exit status 1.
-| DEBUG: Its error output was:
-...
-| File "/mozjs/91.1.0-r0/firefox-91.1.0/build/moz.configure/util.configure", line 239, in try_invoke_compiler
-| os.remove(path)
-| FileNotFoundError: [Errno 2] No such file or directory: '/tmp/conftest.jr1qrcw3.cpp'
-
-It should be another process that deleted this file by using
-"rm -rf conftest*" inappropriately
-
-Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=1740667]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- build/moz.configure/util.configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/moz.configure/util.configure b/build/moz.configure/util.configure
-index 80c3a34522..0ac0c6b611 100644
---- a/build/moz.configure/util.configure
-+++ b/build/moz.configure/util.configure
-@@ -216,7 +216,7 @@ def try_invoke_compiler(compiler, language, source, flags=None, onerror=None):
-         "C++": ".cpp",
-     }[language]
- 
--    fd, path = mkstemp(prefix="conftest.", suffix=suffix, text=True)
-+    fd, path = mkstemp(prefix="try_invoke_compiler_conftest.", suffix=suffix, text=True)
-     try:
-         source = source.encode("ascii", "replace")
- 
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/0002-moz.configure-do-not-look-for-llvm-objdump.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0002-moz.configure-do-not-look-for-llvm-objdump.patch
deleted file mode 100644
index b3d3c1ffa..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/0002-moz.configure-do-not-look-for-llvm-objdump.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 0133ddb86eb6e0741e02b0032c41468db6438530 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 1 Oct 2021 13:01:10 +0200
-Subject: [PATCH] moz.configure: do not look for llvm-objdump
-
-This avoid dragging in a dependency that isn't even needed
-for js builds.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- moz.configure | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/moz.configure b/moz.configure
-index fc66b520d0..15de9a2ee0 100755
---- a/moz.configure
-+++ b/moz.configure
-@@ -785,15 +785,15 @@
-     return llvm_tool
- 
- 
--llvm_objdump = check_prog(
--    "LLVM_OBJDUMP",
--    llvm_tool("llvm-objdump"),
--    what="llvm-objdump",
--    when="--enable-compile-environment",
--    paths=clang_search_path,
--)
--
--add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump)
-+#llvm_objdump = check_prog(
-+#    "LLVM_OBJDUMP",
-+#    llvm_tool("llvm-objdump"),
-+#    what="llvm-objdump",
-+#    when="--enable-compile-environment",
-+#    paths=clang_search_path,
-+#)
-+#
-+#add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump)
- 
- 
- @depends(llvm_tool("llvm-readelf"), toolchain_prefix)
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch
deleted file mode 100644
index 202f12612..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 33ff25e2b126dd4135006139641d8b7f6e4da200 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 1 Oct 2021 13:02:17 +0200
-Subject: [PATCH] rust.configure: do not try to find a suitable upstream target
-
-OE is using custom targets and so this is bound to fail.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- build/moz.configure/rust.configure | 34 ++----------------------------
- 1 file changed, 2 insertions(+), 32 deletions(-)
-
-diff --git a/build/moz.configure/rust.configure b/build/moz.configure/rust.configure
-index e64dc5d5ec..edf21baca6 100644
---- a/build/moz.configure/rust.configure
-+++ b/build/moz.configure/rust.configure
-@@ -471,33 +471,7 @@ def assert_rust_compile(host_or_target, rustc_target, rustc):
- def rust_host_triple(
-     rustc, host, compiler_info, rustc_host, rust_supported_targets, arm_target
- ):
--    rustc_target = detect_rustc_target(
--        host, compiler_info, arm_target, rust_supported_targets
--    )
--    if rustc_target != rustc_host:
--        if host.alias == rustc_target:
--            configure_host = host.alias
--        else:
--            configure_host = "{}/{}".format(host.alias, rustc_target)
--        die(
--            dedent(
--                """\
--        The rust compiler host ({rustc}) is not suitable for the configure host ({configure}).
--
--        You can solve this by:
--        * Set your configure host to match the rust compiler host by editing your
--        mozconfig and adding "ac_add_options --host={rustc}".
--        * Or, install the rust toolchain for {configure}, if supported, by running
--        "rustup default stable-{rustc_target}"
--        """.format(
--                    rustc=rustc_host,
--                    configure=configure_host,
--                    rustc_target=rustc_target,
--                )
--            )
--        )
--    assert_rust_compile(host, rustc_target, rustc)
--    return rustc_target
-+    return rustc_host
- 
- 
- @depends(
-@@ -507,11 +481,7 @@ def rust_host_triple(
- def rust_target_triple(
-     rustc, target, compiler_info, rust_supported_targets, arm_target
- ):
--    rustc_target = detect_rustc_target(
--        target, compiler_info, arm_target, rust_supported_targets
--    )
--    assert_rust_compile(target, rustc_target, rustc)
--    return rustc_target
-+    return target.alias
- 
- 
- set_config("RUST_TARGET", rust_target_triple)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/0004-use-asm-sgidefs.h.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0004-use-asm-sgidefs.h.patch
deleted file mode 100644
index ff28654b5..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/0004-use-asm-sgidefs.h.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 0ec73937b01869a701ed9b60a6a84469e035ded4 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <amccurdy@gmail.com>
-Date: Sat, 30 Apr 2016 15:29:06 -0700
-Subject: [PATCH] use <asm/sgidefs.h>
-
-Build fix for MIPS with musl libc
-
-The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
-but not by musl. Regardless of the libc, the kernel headers provide
-<asm/sgidefs.h> which provides the same definitions, so use that
-instead.
-
-Upstream-Status: Pending
-
-[Vincent:
-Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=21070]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
----
- mfbt/RandomNum.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mfbt/RandomNum.cpp b/mfbt/RandomNum.cpp
-index 23381db0cd..7f127c0715 100644
---- a/mfbt/RandomNum.cpp
-+++ b/mfbt/RandomNum.cpp
-@@ -52,7 +52,7 @@ extern "C" BOOLEAN NTAPI RtlGenRandom(PVOID RandomBuffer,
- #  elif defined(__s390__)
- #    define GETRANDOM_NR 349
- #  elif defined(__mips__)
--#    include <sgidefs.h>
-+#    include <asm/sgidefs.h>
- #    if _MIPS_SIM == _MIPS_SIM_ABI32
- #      define GETRANDOM_NR 4353
- #    elif _MIPS_SIM == _MIPS_SIM_ABI64
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch
deleted file mode 100644
index 6905282eb..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1110483c6c06adf2d03ed9154a8957defc175c80 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Oct 2021 16:21:14 -0700
-Subject: [PATCH] mozjs: Fix musl miscompiles with HAVE_THREAD_TLS_KEYWORD
-
-Upstream: No
-Reason: mozjs60 miscompiles on musl if built with HAVE_THREAD_TLS_KEYWORD:
-https://github.com/void-linux/void-packages/issues/2598
-
----
-Upstream-Status: Pending
-
- js/src/old-configure.in | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/js/src/old-configure.in b/js/src/old-configure.in
-index 8dfd75c63d..c82e580428 100644
---- a/js/src/old-configure.in
-+++ b/js/src/old-configure.in
-@@ -839,6 +839,9 @@ if test "$ac_cv_thread_keyword" = yes; then
-     *-android*|*-linuxandroid*)
-       :
-       ;;
-+    *-musl*)
-+      :
-+      ;;
-     *)
-       AC_DEFINE(HAVE_THREAD_TLS_KEYWORD)
-       ;;
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/musl-disable-stackwalk.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/musl-disable-stackwalk.patch
deleted file mode 100644
index a3ba469a4..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/musl-disable-stackwalk.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Musl does not have stack unwinder like glibc therefore
-we can not assume that its always available on musl, we
-do need to check for target environment as well which
-could be musl or glibc.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/mozglue/misc/StackWalk.cpp
-+++ b/mozglue/misc/StackWalk.cpp
-@@ -44,7 +44,7 @@ using namespace mozilla;
- #  define MOZ_STACKWALK_SUPPORTS_MACOSX 0
- #endif
- 
--#if (defined(linux) &&                                            \
-+#if (defined(linux) && defined(__GLIBC__) &&                      \
-      ((defined(__GNUC__) && (defined(__i386) || defined(PPC))) || \
-       defined(HAVE__UNWIND_BACKTRACE)))
- #  define MOZ_STACKWALK_SUPPORTS_LINUX 1
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/riscv32.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/riscv32.patch
deleted file mode 100644
index a6a0a9ede..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/riscv32.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 81385fe53ffde5e1636e9ace0736d914da8dbc0f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 24 Oct 2021 22:32:50 -0700
-Subject: [PATCH] Add RISCV32 support
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- build/moz.configure/init.configure                             | 3 +++
- python/mozbuild/mozbuild/configure/constants.py                | 2 ++
- .../mozbuild/test/configure/test_toolchain_configure.py        | 1 +
- 3 files changed, 6 insertions(+)
-
-diff --git a/build/moz.configure/init.configure b/build/moz.configure/init.configure
-index 0b7a2ff60f..54f8325b44 100644
---- a/build/moz.configure/init.configure
-+++ b/build/moz.configure/init.configure
-@@ -524,6 +524,9 @@ def split_triplet(triplet, allow_msvc=False, allow_wasi=False):
-     elif cpu.startswith("aarch64"):
-         canonical_cpu = "aarch64"
-         endianness = "little"
-+    elif cpu in ("riscv32", "riscv32gc"):
-+        canonical_cpu = "riscv32"
-+        endianness = "little"
-     elif cpu in ("riscv64", "riscv64gc"):
-         canonical_cpu = "riscv64"
-         endianness = "little"
-diff --git a/python/mozbuild/mozbuild/configure/constants.py b/python/mozbuild/mozbuild/configure/constants.py
-index c71460cb20..15bef93e19 100644
---- a/python/mozbuild/mozbuild/configure/constants.py
-+++ b/python/mozbuild/mozbuild/configure/constants.py
-@@ -53,6 +53,7 @@ CPU_bitness = {
-     "mips64": 64,
-     "ppc": 32,
-     "ppc64": 64,
-+    'riscv32': 32,
-     "riscv64": 64,
-     "s390": 32,
-     "s390x": 64,
-@@ -95,6 +96,7 @@ CPU_preprocessor_checks = OrderedDict(
-         ("m68k", "__m68k__"),
-         ("mips64", "__mips64"),
-         ("mips32", "__mips__"),
-+        ("riscv32", "__riscv && __riscv_xlen == 32"),
-         ("riscv64", "__riscv && __riscv_xlen == 64"),
-         ("loongarch64", "__loongarch64"),
-         ("sh4", "__sh__"),
-diff --git a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
-index 059cde0139..4f9986eb31 100644
---- a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
-+++ b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
-@@ -1192,6 +1192,7 @@ class LinuxCrossCompileToolchainTest(BaseToolchainTest):
-         "m68k-unknown-linux-gnu": big_endian + {"__m68k__": 1},
-         "mips64-unknown-linux-gnuabi64": big_endian + {"__mips64": 1, "__mips__": 1},
-         "mips-unknown-linux-gnu": big_endian + {"__mips__": 1},
-+        "riscv32-unknown-linux-gnu": little_endian + {"__riscv": 1, "__riscv_xlen": 32},
-         "riscv64-unknown-linux-gnu": little_endian + {"__riscv": 1, "__riscv_xlen": 64},
-         "sh4-unknown-linux-gnu": little_endian + {"__sh__": 1},
-     }
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.1.bb b/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.1.bb
deleted file mode 100644
index 3a7b51c14..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.1.bb
+++ /dev/null
@@ -1,82 +0,0 @@
-SUMMARY = "SpiderMonkey is Mozilla's JavaScript engine written in C/C++"
-HOMEPAGE = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey"
-LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dc9b6ecd19a14a54a628edaaf23733bf"
-
-SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/firefox-${PV}esr.source.tar.xz \
-           file://0001-Cargo.toml-do-not-abort-on-panic.patch \
-           file://0002-moz.configure-do-not-look-for-llvm-objdump.patch \
-           file://0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch \
-           file://0004-use-asm-sgidefs.h.patch \
-           file://fix-musl-build.patch \
-           file://0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch \
-           file://riscv32.patch \
-           file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch \
-           file://0001-rewrite-cargo-host-linker-in-python3.patch  \
-           file://musl-disable-stackwalk.patch \
-           file://0001-add-arm-to-list-of-mozinline.patch \
-           "
-SRC_URI[sha256sum] = "09194fb765953bc6979a35aa8834118c453b9d6060bf1ec4e134551bad740113"
-
-S = "${WORKDIR}/firefox-${PV}"
-
-inherit pkgconfig perlnative python3native rust
-
-DEPENDS += "zlib cargo-native python3 icu"
-DEPENDS:remove:mipsarch = "icu"
-DEPENDS:remove:powerpc:toolchain-clang = "icu"
-
-B = "${WORKDIR}/build"
-
-export PYTHONPATH = "${S}/build:${S}/third_party/python/PyYAML/lib3:${S}/testing/mozbase/mozfile:${S}/python/mozboot:${S}/third_party/python/distro:${S}/testing/mozbase/mozinfo:${S}/config:${S}/testing/mozbase/manifestparser:${S}/third_party/python/pytoml:${S}/testing/mozbase/mozprocess:${S}/third_party/python/six:${S}/python/mozbuild:${S}/python/mozbuild/mozbuild:${S}/python/mach:${S}/third_party/python/jsmin:${S}/python/mozversioncontrol"
-
-export HOST_CC = "${BUILD_CC}"
-export HOST_CXX = "${BUILD_CXX}"
-export HOST_CFLAGS = "${BUILD_CFLAGS}"
-export HOST_CPPFLAGS = "${BUILD_CPPFLAGS}"
-export HOST_CXXFLAGS = "${BUILD_CXXFLAGS}"
-
-export AS = "${CC}"
-
-export RUSTFLAGS
-
-JIT ?= ""
-JIT:mipsarch = "--disable-jit"
-ICU ?= "--with-system-icu"
-ICU:mipsarch = ""
-ICU:powerpc:toolchain-clang = ""
-
-do_configure() {
-    cd ${B}
-    python3 ${S}/configure.py \
-        --enable-project=js \
-        --target=${RUST_HOST_SYS} \
-        --host=${BUILD_SYS} \
-        --prefix=${prefix} \
-        --libdir=${libdir} \
-        --disable-jemalloc \
-        --disable-strip \
-        ${JIT} \
-        ${ICU}
-}
-
-do_install() {
-    oe_runmake 'DESTDIR=${D}' install
-}
-
-inherit multilib_script multilib_header
-
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 1)}"
-MULTILIB_SCRIPTS += "${PN}-dev:${bindir}/js${MAJ_VER}-config"
-
-do_install:append() {
-    oe_multilib_header mozjs-${MAJ_VER}/js-config.h
-    sed -e 's@${STAGING_DIR_HOST}@@g' \
-        -i ${D}${bindir}/js${MAJ_VER}-config
-    rm -f ${D}${libdir}/libjs_static.ajs
-    # remove the build path
-    sed -i -e 's@${WORKDIR}@@g' `find ${B} -name Unified_c*.c*`
-}
-
-PACKAGES =+ "lib${BPN}"
-FILES:lib${BPN} += "${libdir}/lib*"
-- 
2.39.2


