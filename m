Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EDBE6F088
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 20:16:24 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.584.1730481640124112718
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Nov 2024 10:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MZZM+XVW;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e9f69cc576so16571367b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Nov 2024 10:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730481639; x=1731086439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LnB5SdoV4hh2vpL1Z1s9mZjO/yX5YidLU5o2EjP14+w=;
        b=MZZM+XVWovdlOOXUNTFDo+AsmErCQIq8Yd4wA4N1LopGq427WHcgB3wsSafLDTL2RW
         GXIHspv9cGwiNUls6pNwFEpdQb2wyAd5ECW9tOCjh9a54I5dkGaFdaKbwHzPHmf9rMG9
         KZbBER+rEFo0Jk2gBcaiLf3uZhaMRj839sWP7U54H7hSnavUmRniCpkLGQIMDPe6FeHs
         uRhe6ql6Il+HN+57ptFrSPdNFSr2ynUh5JYnwMH4+7lVfG8RS9WCO55MwSEM0KjQR0yY
         hQ8OW/ceOZ6ngSYqlmtm/crF8J6n3waB08+qY8bWAGQ9CDHgnb+c+fn5jgbWazRgXHC3
         8w/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730481639; x=1731086439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnB5SdoV4hh2vpL1Z1s9mZjO/yX5YidLU5o2EjP14+w=;
        b=Ycy4vvKq80sAHzeOuwVHuVQJ/mGbAP7e0wY4Yolf3noB5bQQILIU4858XgddDl2B+R
         fBD4FCKGfhKPlBiR08341uW9i5vwweWpPGAZJg0ylhOp3eahrpTLbrLA9SA0D8UYsRw2
         WNhz8iOP8oWsqBZuoReYVmOwraopFfEZdITk3t1lKcxy73V3RfyfjeqYjR/vd8ikoqEA
         4iCZREJlLeQbu2kIQe8AOAuSez7lYofpkpfEtxN0mkTNiamlWJrxLwFc9HVh2eH4lzO9
         v1AFS4AvKwsUkaVHp84msOSFkp3j/jvORQEnOwEf9S4PkUpS2oBsaRtC0eM1NfLtveyG
         /DdQ==
X-Gm-Message-State: AOJu0Yyjd57ovtG3KTBEPve4RvhxsSrbMEjL3gCmyTHgNwBSwAHcRPF/
	g5e6RZnXi5jSx9cYG94htYPO30QGMHrYq4Sb1F0SCr/d/qs00TOwr+TdBY2b
X-Google-Smtp-Source: AGHT+IHEu+qXegjIhJri/3ZwEKh2lcTmWeMGd9dAhK+VQVanCbZwSlcTbwLACB8V5Lv5J2WGY7Hciw==
X-Received: by 2002:a05:690c:9690:b0:6b1:8834:1588 with SMTP id 00721157ae682-6e9d8b00311mr250239477b3.35.1730481638586;
        Fri, 01 Nov 2024 10:20:38 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55b0fdc5sm7537287b3.31.2024.11.01.10.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 10:20:38 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 20.18.0 -> 22.11.0
Date: Fri,  1 Nov 2024 13:18:40 -0400
Message-ID: <20241101172018.7129-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Nov 2024 20:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113390

This moves us from the previous Long Term Support version codenamed 'Iron' to the newly
released Long Term Support version 22.11.0  Codename 'Jod'

Changelog: https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V22.md#22.11.0

License-Update:

    Add amaro dependency under MIT License.
    Add swc dependency under Aapche License Version 2.0.
    Add simdjson dependency under Apache License Version 2.0.
    Add on-exit-leak-free under MIT License.
    Remove ESLint.
    Remove base64 dependency.

Removed patchs:

    182d9c05e78.patch - This was a backport to 20.x it is now integrated in 22.x

Added patches:

  Two small patches here to use Bourne Shell instad of BASH.
    0001-custom-env.patch
    0001-positional-args.patch

  This patch from https://github.com/nodejs/node/commit/686da19abb that addressed CVE-2024-22017
    0001-deps-disable-io_uring-support-in-libuv.patch

  Other patches were refreshed.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                              |   0
 ....18.bb => nodejs-oe-cache-native_22.11.bb} |   0
 ...e-running-gyp-files-for-bundled-deps.patch |  15 +-
 .../nodejs/nodejs/0001-custom-env.patch       |  18 ++
 ...ps-disable-io_uring-support-in-libuv.patch |  52 +++++
 ...-liftoff-Correct-function-signatures.patch |  38 ++--
 .../nodejs/nodejs/0001-positional-args.patch  |  19 ++
 .../0004-v8-don-t-override-ARM-CFLAGS.patch   |  11 +-
 .../nodejs/nodejs/182d9c05e78.patch           | 182 ------------------
 .../nodejs/nodejs/system-c-ares.patch         |  12 +-
 .../{nodejs_20.18.0.bb => nodejs_22.11.0.bb}  |  12 +-
 11 files changed, 136 insertions(+), 223 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.18 => nodejs-oe-cache-22.11}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.18.bb => nodejs-oe-cache-native_22.11.bb} (100%)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-custom-env.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-positional-args.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.18.0.bb => nodejs_22.11.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.18/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.18/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.11.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.18.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.11.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
index 12f6cd8b9..f692eedd4 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
@@ -1,4 +1,4 @@
-From 7d94bfe53beeb2d25eb5f2ff6b1d509df7e6ab80 Mon Sep 17 00:00:00 2001
+From 689e098cbde130ecde523ae39df3567456271fda Mon Sep 17 00:00:00 2001
 From: Zuzana Svetlikova <zsvetlik@redhat.com>
 Date: Thu, 27 Apr 2017 14:25:42 +0200
 Subject: [PATCH] Disable running gyp on shared deps
@@ -28,19 +28,20 @@ python prune_sources() {
         shutil.rmtree(d.getVar('S') + '/deps/zlib')
 }
 do_unpack[postfuncs] += "prune_sources"
-
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/Makefile b/Makefile
+index dba16e5e..da4faffc 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -169,7 +169,7 @@ with-code-cache test-code-cache:
+@@ -173,7 +173,7 @@ with-code-cache test-code-cache:
  	$(warning '$@' target is a noop)
  
- out/Makefile: config.gypi common.gypi node.gyp \
+ out/Makefile: config.gypi common.gypi common_node.gypi node.gyp \
 -	deps/uv/uv.gyp deps/llhttp/llhttp.gyp deps/zlib/zlib.gyp \
 +	deps/llhttp/llhttp.gyp \
- 	deps/simdutf/simdutf.gyp deps/ada/ada.gyp \
- 	tools/v8_gypfiles/toolchain.gypi tools/v8_gypfiles/features.gypi \
- 	tools/v8_gypfiles/inspector.gypi tools/v8_gypfiles/v8.gyp
+ 	deps/simdutf/simdutf.gyp deps/ada/ada.gyp deps/nbytes/nbytes.gyp \
+ 	tools/v8_gypfiles/toolchain.gypi \
+ 	tools/v8_gypfiles/features.gypi \
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-custom-env.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-custom-env.patch
new file mode 100644
index 000000000..532d3c5f5
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-custom-env.patch
@@ -0,0 +1,18 @@
+From 9c1a31afdcf368f794b9f5378cb3fe759570f905 Mon Sep 17 00:00:00 2001
+From: Jason Schonberg <schonm@gmail.com>
+Date: Tue, 30 Apr 2024 21:48:33 -0400
+Subject: [PATCH] Update to nodejs 22.0.0
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ test/fixtures/run-script/node_modules/.bin/custom-env | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/fixtures/run-script/node_modules/.bin/custom-env b/test/fixtures/run-script/node_modules/.bin/custom-env
+index e6f291c6..1430f2e9 100755
+--- a/test/fixtures/run-script/node_modules/.bin/custom-env
++++ b/test/fixtures/run-script/node_modules/.bin/custom-env
+@@ -1,2 +1,2 @@
+-#!/bin/bash
++#!/bin/sh
+ echo "$CUSTOM_ENV"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
new file mode 100644
index 000000000..04398ac68
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
@@ -0,0 +1,52 @@
+From 2bb296f169f86dbb04ee47e9a0dc1e3ee13d4f73 Mon Sep 17 00:00:00 2001
+From: Jason Schonberg <schonm@gmail.com>
+Date: Thu, 7 Mar 2024 12:55:56 -0500
+Subject: [PATCH] Update to nodejs 20.11.1
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ ...ps-disable-io_uring-support-in-libuv.patch | 35 +++++++++++++++++++
+ 1 file changed, 35 insertions(+)
+ create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
+
+diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
+new file mode 100644
+index 00000000..5ac711fb
+--- /dev/null
++++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
+@@ -0,0 +1,35 @@
++From 9838be9c710ab4249df86726fa390232a3b6a6e7 Mon Sep 17 00:00:00 2001
++From: Changqing Li <changqing.li@windriver.com>
++Date: Fri, 1 Mar 2024 15:46:11 +0800
++Subject: [PATCH] deps: disable io_uring support in libuv
++
++Refer [1], Pseudo fails to intercept some of the syscalls when io_uring
++enabled. Refer [2], always disable io_uring support in libuv to fix
++issue in [1].
++
++[1] https://git.openembedded.org/meta-openembedded/commit/?id=d08453978c31ee41d28206c6ff198d7d9d701d88
++[2] https://github.com/nodejs/node/commit/686da19abb
++
++Upstream-Status: Inappropriate [oe-specific]
++
++Signed-off-by: Changqing Li <changqing.li@windriver.com>
++---
++ deps/uv/src/unix/linux.c | 2 +-
++ 1 file changed, 1 insertion(+), 1 deletion(-)
++
++diff --git a/deps/uv/src/unix/linux.c b/deps/uv/src/unix/linux.c
++index 0c997185..7508409d 100644
++--- a/deps/uv/src/unix/linux.c
+++++ b/deps/uv/src/unix/linux.c
++@@ -433,7 +433,7 @@ static int uv__use_io_uring(void) {
++   if (use == 0) {
++     /* Disable io_uring by default due to CVE-2024-22017. */
++     val = getenv("UV_USE_IO_URING");
++-    use = val != NULL && atoi(val) ? 1 : -1;
+++    use = 0;
++     atomic_store_explicit(&use_io_uring, use, memory_order_relaxed);
++   }
++ 
++-- 
++2.25.1
++
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-signatures.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-signatures.patch
index 5af87d866..5e617e655 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-signatures.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-signatures.patch
@@ -1,7 +1,7 @@
-From dc3652c0abcdf8573fd044907b19d8eda7ca1124 Mon Sep 17 00:00:00 2001
+From 33393507ba8209f0d6b85b391c525b4c70807275 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 3 Jul 2023 12:33:16 +0000
-Subject: [PATCH] [liftoff] Correct function signatures
+Subject: [PATCH] Correct function signatures
 
 Fixes builds on mips where clang reports an error
 ../deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h:661:5: error: no matching member function for call to 'Move'
@@ -13,15 +13,15 @@ Upstream-Status: Submitted [https://chromium-review.googlesource.com/c/v8/v8/+/3
 Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
  deps/v8/src/wasm/baseline/liftoff-assembler.h               | 6 +++---
- deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h | 2 +-
- deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h | 2 +-
+ .../src/wasm/baseline/mips64/liftoff-assembler-mips64-inl.h | 2 +-
+ .../src/wasm/baseline/riscv/liftoff-assembler-riscv64-inl.h | 2 +-
  3 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/deps/v8/src/wasm/baseline/liftoff-assembler.h b/deps/v8/src/wasm/baseline/liftoff-assembler.h
-index aef63c64..f2a11b01 100644
+index 7cb2f500..713d16db 100644
 --- a/deps/v8/src/wasm/baseline/liftoff-assembler.h
 +++ b/deps/v8/src/wasm/baseline/liftoff-assembler.h
-@@ -717,7 +717,7 @@ class LiftoffAssembler : public MacroAssembler {
+@@ -681,7 +681,7 @@ class LiftoffAssembler : public MacroAssembler {
    void FinishCall(const ValueKindSig*, compiler::CallDescriptor*);
  
    // Move {src} into {dst}. {src} and {dst} must be different.
@@ -30,7 +30,7 @@ index aef63c64..f2a11b01 100644
  
    // Parallel register move: For a list of tuples <dst, src, kind>, move the
    // {src} register of kind {kind} into {dst}. If {src} equals {dst}, ignore
-@@ -884,8 +884,8 @@ class LiftoffAssembler : public MacroAssembler {
+@@ -851,8 +851,8 @@ class LiftoffAssembler : public MacroAssembler {
    inline void MoveStackValue(uint32_t dst_offset, uint32_t src_offset,
                               ValueKind);
  
@@ -41,24 +41,24 @@ index aef63c64..f2a11b01 100644
  
    inline void Spill(int offset, LiftoffRegister, ValueKind);
    inline void Spill(int offset, WasmValue);
-diff --git a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
-index 96cba24c..53e1842d 100644
---- a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
-+++ b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
-@@ -592,7 +592,7 @@ void LiftoffAssembler::Store(Register dst_addr, Register offset_reg,
+diff --git a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64-inl.h b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64-inl.h
+index bd59f162..56b4d70c 100644
+--- a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64-inl.h
++++ b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64-inl.h
+@@ -672,7 +672,7 @@ void LiftoffAssembler::Store(Register dst_addr, Register offset_reg,
      pinned.set(dst_op.rm());
-     LiftoffRegister tmp = GetUnusedRegister(src.reg_class(), pinned);
+     LiftoffRegister tmp = kScratchReg2;
      // Save original value.
 -    Move(tmp, src, type.value_type());
 +    Move(tmp, src, type.value_type().kind());
  
      src = tmp;
      pinned.set(tmp);
-diff --git a/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h b/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h
-index 1d6ae09e..397e82b2 100644
---- a/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h
-+++ b/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h
-@@ -286,7 +286,7 @@ void LiftoffAssembler::Store(Register dst_addr, Register offset_reg,
+diff --git a/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64-inl.h b/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64-inl.h
+index a3c94af0..456e5334 100644
+--- a/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64-inl.h
++++ b/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64-inl.h
+@@ -452,7 +452,7 @@ void LiftoffAssembler::Store(Register dst_addr, Register offset_reg,
      pinned.set(dst_op.rm());
      LiftoffRegister tmp = GetUnusedRegister(src.reg_class(), pinned);
      // Save original value.
@@ -67,5 +67,3 @@ index 1d6ae09e..397e82b2 100644
  
      src = tmp;
      pinned.set(tmp);
---
-2.40.0
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-positional-args.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-positional-args.patch
new file mode 100644
index 000000000..5fd6aee35
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-positional-args.patch
@@ -0,0 +1,19 @@
+From 07ee84863fa4a9e4d5f155632478587b0acbf71a Mon Sep 17 00:00:00 2001
+From: Jason Schonberg <schonm@gmail.com>
+Date: Tue, 30 Apr 2024 21:48:33 -0400
+Subject: [PATCH] Update to nodejs 22.0.0
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ test/fixtures/run-script/node_modules/.bin/positional-args | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/fixtures/run-script/node_modules/.bin/positional-args b/test/fixtures/run-script/node_modules/.bin/positional-args
+index 2d809237..3dc5314f 100755
+--- a/test/fixtures/run-script/node_modules/.bin/positional-args
++++ b/test/fixtures/run-script/node_modules/.bin/positional-args
+@@ -1,3 +1,3 @@
+-#!/bin/bash
++#!/bin/sh
+ echo "Arguments: '$@'"
+ echo "The total number of arguments are: $#"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM-CFLAGS.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM-CFLAGS.patch
index 97ed972ce..cc920118a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM-CFLAGS.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM-CFLAGS.patch
@@ -1,4 +1,4 @@
-From 47ee5cc5501289205d3e8e9f27ea9daf18cebac1 Mon Sep 17 00:00:00 2001
+From afc085af7b6b935a5e14fc3f40db47df02ca3af2 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
 Date: Sat, 9 Nov 2019 14:45:30 +0000
 Subject: [PATCH] v8: don't override ARM CFLAGS
@@ -28,10 +28,10 @@ Signed-off-by: André Draszik <git@andred.net>
  1 file changed, 2 insertions(+), 50 deletions(-)
 
 diff --git a/tools/v8_gypfiles/toolchain.gypi b/tools/v8_gypfiles/toolchain.gypi
-index 264b3e478e..0b41848145 100644
+index 9d1b0987..4df15e60 100644
 --- a/tools/v8_gypfiles/toolchain.gypi
 +++ b/tools/v8_gypfiles/toolchain.gypi
-@@ -211,31 +211,7 @@
+@@ -203,31 +203,7 @@
          'target_conditions': [
            ['_toolset=="host"', {
              'conditions': [
@@ -64,7 +64,7 @@ index 264b3e478e..0b41848145 100644
                  # Host not built with an Arm CXX compiler (simulator build).
                  'conditions': [
                    [ 'arm_float_abi=="hard"', {
-@@ -254,31 +230,7 @@
+@@ -246,31 +222,7 @@
            }],  # _toolset=="host"
            ['_toolset=="target"', {
              'conditions': [
@@ -97,6 +97,3 @@ index 264b3e478e..0b41848145 100644
                  # Target not built with an Arm CXX compiler (simulator build).
                  'conditions': [
                    [ 'arm_float_abi=="hard"', {
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch b/meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch
deleted file mode 100644
index 689512cb6..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch
+++ /dev/null
@@ -1,182 +0,0 @@
-From 182d9c05e78b1ddb1cb8242cd3628a7855a0336f Mon Sep 17 00:00:00 2001
-From: Andrey Kosyakov <caseq@chromium.org>
-Date: Thu, 17 Aug 2023 13:50:11 -0700
-Subject: [PATCH] Define UChar as char16_t
-
-We used to have UChar defined as uint16_t which does not go along
-with STL these days if you try to have an std::basic_string<> of it,
-as there are no standard std::char_traits<> specialization for uint16_t.
-
-This switches UChar to char16_t where practical, introducing a few
-compatibility shims to keep CL size small, as (1) this would likely
-have to be back-ported and (2) crdtp extensively uses uint16_t for
-wide chars.
-
-Bug: b:296390693
-Change-Id: I66a32d8f0050915225b187de56896c26dd76163d
-Reviewed-on: https://chromium-review.googlesource.com/c/v8/v8/+/4789966
-Reviewed-by: Jaroslav Sevcik <jarin@chromium.org>
-Commit-Queue: Jaroslav Sevcik <jarin@chromium.org>
-Auto-Submit: Andrey Kosyakov <caseq@chromium.org>
-Cr-Commit-Position: refs/heads/main@{#89559}
-
-Upstream-Status: Backport [https://chromium-review.googlesource.com/c/v8/v8/+/4789966]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/inspector/string-16.cc                             |  8 +++++++-
- src/inspector/string-16.h                              | 10 ++++++++--
- src/inspector/v8-string-conversions.cc                 |  6 +++---
- src/inspector/v8-string-conversions.h                  |  6 ++++--
- .../inspector_protocol/crdtp/test_platform_v8.cc       |  9 ++++++---
- 5 files changed, 28 insertions(+), 11 deletions(-)
-
---- a/deps/v8/src/inspector/string-16.cc
-+++ b/deps/v8/src/inspector/string-16.cc
-@@ -27,7 +27,7 @@ bool isSpaceOrNewLine(UChar c) {
-   return isASCII(c) && c <= ' ' && (c == ' ' || (c <= 0xD && c >= 0x9));
- }
- 
--int64_t charactersToInteger(const UChar* characters, size_t length,
-+int64_t charactersToInteger(const uint16_t* characters, size_t length,
-                             bool* ok = nullptr) {
-   std::vector<char> buffer;
-   buffer.reserve(length + 1);
-@@ -50,6 +50,8 @@ int64_t charactersToInteger(const UChar*
- 
- String16::String16(const UChar* characters, size_t size)
-     : m_impl(characters, size) {}
-+String16::String16(const uint16_t* characters, size_t size)
-+    : m_impl(reinterpret_cast<const UChar*>(characters), size) {}
- 
- String16::String16(const UChar* characters) : m_impl(characters) {}
- 
-@@ -241,6 +243,10 @@ String16 String16::fromUTF16LE(const UCh
- #endif  // V8_TARGET_BIG_ENDIAN
- }
- 
-+String16 String16::fromUTF16LE(const uint16_t* stringStart, size_t length) {
-+  return fromUTF16LE(reinterpret_cast<const UChar*>(stringStart), length);
-+}
-+
- std::string String16::utf8() const {
-   return UTF16ToUTF8(m_impl.data(), m_impl.size());
- }
---- a/deps/v8/src/inspector/string-16.h
-+++ b/deps/v8/src/inspector/string-16.h
-@@ -6,6 +6,7 @@
- #define V8_INSPECTOR_STRING_16_H_
- 
- #include <stdint.h>
-+#include <uchar.h>
- 
- #include <cctype>
- #include <climits>
-@@ -17,7 +18,7 @@
- 
- namespace v8_inspector {
- 
--using UChar = uint16_t;
-+using UChar = char16_t;
- 
- class String16 {
-  public:
-@@ -27,6 +28,7 @@ class String16 {
-   String16(const String16&) V8_NOEXCEPT = default;
-   String16(String16&&) V8_NOEXCEPT = default;
-   String16(const UChar* characters, size_t size);
-+  String16(const uint16_t* characters, size_t size);
-   V8_EXPORT String16(const UChar* characters);
-   V8_EXPORT String16(const char* characters);
-   String16(const char* characters, size_t size);
-@@ -48,7 +50,9 @@ class String16 {
-   int toInteger(bool* ok = nullptr) const;
-   std::pair<size_t, size_t> getTrimmedOffsetAndLength() const;
-   String16 stripWhiteSpace() const;
--  const UChar* characters16() const { return m_impl.c_str(); }
-+  const uint16_t* characters16() const {
-+    return reinterpret_cast<const uint16_t*>(m_impl.c_str());
-+  }
-   size_t length() const { return m_impl.length(); }
-   bool isEmpty() const { return !m_impl.length(); }
-   UChar operator[](size_t index) const { return m_impl[index]; }
-@@ -78,6 +82,8 @@ class String16 {
-   // On Big endian architectures, byte order needs to be flipped.
-   V8_EXPORT static String16 fromUTF16LE(const UChar* stringStart,
-                                         size_t length);
-+  V8_EXPORT static String16 fromUTF16LE(const uint16_t* stringStart,
-+                                        size_t length);
- 
-   std::size_t hash() const {
-     if (!hash_code) {
---- a/deps/v8/src/inspector/v8-string-conversions.cc
-+++ b/deps/v8/src/inspector/v8-string-conversions.cc
-@@ -12,7 +12,7 @@
- 
- namespace v8_inspector {
- namespace {
--using UChar = uint16_t;
-+using UChar = char16_t;
- using UChar32 = uint32_t;
- 
- bool isASCII(UChar c) { return !(c & ~0x7F); }
-@@ -386,7 +386,7 @@ std::string UTF16ToUTF8(const UChar* str
- 
- std::basic_string<UChar> UTF8ToUTF16(const char* stringStart, size_t length) {
-   if (!stringStart || !length) return std::basic_string<UChar>();
--  std::vector<uint16_t> buffer(length);
-+  std::vector<UChar> buffer(length);
-   UChar* bufferStart = buffer.data();
- 
-   UChar* bufferCurrent = bufferStart;
-@@ -395,7 +395,7 @@ std::basic_string<UChar> UTF8ToUTF16(con
-                          reinterpret_cast<const char*>(stringStart + length),
-                          &bufferCurrent, bufferCurrent + buffer.size(), nullptr,
-                          true) != conversionOK)
--    return std::basic_string<uint16_t>();
-+    return std::basic_string<UChar>();
-   size_t utf16Length = bufferCurrent - bufferStart;
-   return std::basic_string<UChar>(bufferStart, bufferStart + utf16Length);
- }
---- a/deps/v8/src/inspector/v8-string-conversions.h
-+++ b/deps/v8/src/inspector/v8-string-conversions.h
-@@ -5,14 +5,16 @@
- #ifndef V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
- #define V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
- 
-+#include <uchar.h>
-+
- #include <cstdint>
- #include <string>
- 
- // Conversion routines between UT8 and UTF16, used by string-16.{h,cc}. You may
- // want to use string-16.h directly rather than these.
- namespace v8_inspector {
--std::basic_string<uint16_t> UTF8ToUTF16(const char* stringStart, size_t length);
--std::string UTF16ToUTF8(const uint16_t* stringStart, size_t length);
-+std::basic_string<char16_t> UTF8ToUTF16(const char* stringStart, size_t length);
-+std::string UTF16ToUTF8(const char16_t* stringStart, size_t length);
- }  // namespace v8_inspector
- 
- #endif  // V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
---- a/deps/v8/third_party/inspector_protocol/crdtp/test_platform_v8.cc
-+++ b/deps/v8/third_party/inspector_protocol/crdtp/test_platform_v8.cc
-@@ -11,13 +11,16 @@
- namespace v8_crdtp {
- 
- std::string UTF16ToUTF8(span<uint16_t> in) {
--  return v8_inspector::UTF16ToUTF8(in.data(), in.size());
-+  return v8_inspector::UTF16ToUTF8(reinterpret_cast<const char16_t*>(in.data()),
-+                                   in.size());
- }
- 
- std::vector<uint16_t> UTF8ToUTF16(span<uint8_t> in) {
--  std::basic_string<uint16_t> utf16 = v8_inspector::UTF8ToUTF16(
-+  std::basic_string<char16_t> utf16 = v8_inspector::UTF8ToUTF16(
-       reinterpret_cast<const char*>(in.data()), in.size());
--  return std::vector<uint16_t>(utf16.begin(), utf16.end());
-+  return std::vector<uint16_t>(
-+      reinterpret_cast<const uint16_t*>(utf16.data()),
-+      reinterpret_cast<const uint16_t*>(utf16.data()) + utf16.size());
- }
- 
- }  // namespace v8_crdtp
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/system-c-ares.patch b/meta-oe/recipes-devtools/nodejs/nodejs/system-c-ares.patch
index 141889ad2..6f08c71e1 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/system-c-ares.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/system-c-ares.patch
@@ -1,11 +1,19 @@
-keep nodejs compatible with c-ares 1.17.1
+From ce931ad5f5aba60e8e77f39e0af43bce7d25d287 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 4 Mar 2024 11:05:25 -0500
+Subject: [PATCH] keep nodejs compatible with c-ares 1.17.1
 
 Upstream-Status: Inappropriate [c-ares specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cares_wrap.h | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
 
+diff --git a/src/cares_wrap.h b/src/cares_wrap.h
+index 021ef1c9..820c5d88 100644
 --- a/src/cares_wrap.h
 +++ b/src/cares_wrap.h
-@@ -22,7 +22,15 @@
+@@ -23,7 +23,15 @@
  # include <netdb.h>
  #endif  // __POSIX__
  
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_20.18.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
index cb11ad296..49a5f350d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c83fcdcd43ab352be6429ee1fd8827a0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=25e89142a2f4b075904a9986c45fbdb2"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -25,7 +25,9 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
            file://libatomic.patch \
-           file://182d9c05e78.patch \
+           file://0001-deps-disable-io_uring-support-in-libuv.patch \
+           file://0001-positional-args.patch \
+           file://0001-custom-env.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \
@@ -34,7 +36,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "7d9433e91fd88d82ba8de86e711ec41907638e227993d22e95126b02f6cd714a"
+SRC_URI[sha256sum] = "bbf0297761d53aefda9d7855c57c7d2c272b83a7b5bad4fea9cb29006d8e1d35"
 
 S = "${WORKDIR}/node-v${PV}"
 
@@ -98,7 +100,7 @@ do_unpack[postfuncs] += "prune_sources"
 # 1. If host and target have the different bit width, run those
 #    binaries for the target and run them on the host with QEMU.
 # 2. If host and target have the same bit width, enable upstream
-#    cross crompile support and no QEMU
+#    cross compile support and no QEMU
 python do_create_v8_qemu_wrapper () {
     """Creates a small wrapper that invokes QEMU to run some target V8 binaries
     on the host."""
@@ -192,7 +194,7 @@ python set_gyp_variables () {
         d.setVar("LDFLAGS_host", d.getVar("LDFLAGS"))
         d.setVar("AR_host", d.getVar("AR"))
     elif d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "1":
-        # Enable upstream cross crompile support
+        # Enable upstream cross compile support
         d.setVar("CC_host", d.getVar("BUILD_CC"))
         d.setVar("CFLAGS_host", d.getVar("BUILD_CFLAGS"))
         d.setVar("CXX_host", d.getVar("BUILD_CXX"))
-- 
2.43.0


