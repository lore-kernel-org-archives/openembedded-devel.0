Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512D4C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 05:33:42 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.28530.1635140021360043341
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Oct 2021 22:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZsOOzVqc;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id s136so9808313pgs.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Oct 2021 22:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6r0I+9Zft1M/jyxhakSJ1m35dZ8VS/JIpuY30amDUrM=;
        b=ZsOOzVqcM291NOnFBSMja/jXyJ4tiJeNjXr9NbNzv3WlmvSNDCtFxlIOAvIc8xnGxs
         sWn0fttHrJFodeHxDH2G5Dse9KVwYwrEOlhA2kOz4PSkBBklzyN7Hf7cM02FbzYlJ40N
         O+358qbMtJvwT8y0iz3OJgGPlWrodQKBuHEdeXQOJ2kmoflqV5eQfdEgl55RIdbw15lW
         RyxJj809tAQI4XBt+CFbwawMBs6nWtOz9x2P6pezp8rlAGlZhMXgEktp7/dC6xeAHDYZ
         K/UyXwnMAr0ZvHCzxttpjBm/fAsTe9xbPst4Dr5G6vlufWTjOfq8/Ydn1j42yC5ANVOi
         83dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6r0I+9Zft1M/jyxhakSJ1m35dZ8VS/JIpuY30amDUrM=;
        b=Pluo7tx1c4nx9rsRYDxPGB7PGbr+aZwo3LjWXh2k+7We93Vshn6At6g4hYA1KqF/ZU
         28wxcqI03HmQ6Jnqt8rvYwXXSLibzQ9jgi11TO6q/MdhyYWRhgdHPvIHVj99QqpXByfS
         6AEI+9eoqk8b/6S786TQgyu8V48waxzpywJRGHw0WLKcMiJph76lnMxsnP7AEJ8o4iU8
         cOnWk/ZdJX7DaxuOtVW5dwjVwNvwPErEOspd1I2yS6nAM3ocEktm9KqrsIwGKl5DyvPX
         rCWNQWMKfZ5cTCzVNbBYoZ+d4VflMm4z6DABwAt3LLW7nM+AcZMG8w5hKGxs3Jtemrjj
         9zdg==
X-Gm-Message-State: AOAM530J4rG3Js/PaPq2w9HLji0Dq2oADdbBkW+RG5/4FXbvv3WBoJSq
	lFZXyIGDkeO0ucJIVpkpYumR+2q0SRRghA==
X-Google-Smtp-Source: 
 ABdhPJzuJYLJgg1XLJ/7LPJ72S0+cq8zbT057dFJdIzFaHD/z9pekJ4ZU6uajDT4dbIjEVrFUKDBEA==
X-Received: by 2002:a62:ea16:0:b0:47b:f3d7:7a9 with SMTP id
 t22-20020a62ea16000000b0047bf3d707a9mr2517648pfh.60.1635140020516;
        Sun, 24 Oct 2021 22:33:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 g21sm11008840pfv.127.2021.10.24.22.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 22:33:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mozjs: Add riscv32 support
Date: Sun, 24 Oct 2021 22:33:37 -0700
Message-Id: <20211025053337.673815-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Oct 2021 05:33:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93558

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mozjs/mozjs/riscv32.patch                 | 55 +++++++++++++++++++
 .../recipes-extended/mozjs/mozjs_91.1.0.bb    |  2 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/riscv32.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/riscv32.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/riscv32.patch
new file mode 100644
index 0000000000..1f1f93987a
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/riscv32.patch
@@ -0,0 +1,55 @@
+Add RISCV32 support
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/build/moz.configure/init.configure
++++ b/build/moz.configure/init.configure
+@@ -765,6 +765,9 @@ def split_triplet(triplet, allow_msvc=Fa
+     elif cpu.startswith("aarch64"):
+         canonical_cpu = "aarch64"
+         endianness = "little"
++    elif cpu in ("riscv32", "riscv32gc"):
++        canonical_cpu = "riscv32"
++        endianness = "little"
+     elif cpu in ("riscv64", "riscv64gc"):
+         canonical_cpu = "riscv64"
+         endianness = "little"
+--- a/python/mozbuild/mozbuild/configure/constants.py
++++ b/python/mozbuild/mozbuild/configure/constants.py
+@@ -52,6 +52,7 @@ CPU_bitness = {
+     "mips64": 64,
+     "ppc": 32,
+     "ppc64": 64,
++    'riscv32': 32,
+     "riscv64": 64,
+     "s390": 32,
+     "s390x": 64,
+@@ -94,6 +95,7 @@ CPU_preprocessor_checks = OrderedDict(
+         ("m68k", "__m68k__"),
+         ("mips64", "__mips64"),
+         ("mips32", "__mips__"),
++        ("riscv32", "__riscv && __riscv_xlen == 32"),
+         ("riscv64", "__riscv && __riscv_xlen == 64"),
+         ("sh4", "__sh__"),
+         ("wasm32", "__wasm32__"),
+--- a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
++++ b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
+@@ -1186,6 +1186,7 @@ class LinuxCrossCompileToolchainTest(Bas
+         "m68k-unknown-linux-gnu": big_endian + {"__m68k__": 1},
+         "mips64-unknown-linux-gnuabi64": big_endian + {"__mips64": 1, "__mips__": 1},
+         "mips-unknown-linux-gnu": big_endian + {"__mips__": 1},
++        "riscv32-unknown-linux-gnu": little_endian + {"__riscv": 1, "__riscv_xlen": 32},
+         "riscv64-unknown-linux-gnu": little_endian + {"__riscv": 1, "__riscv_xlen": 64},
+         "sh4-unknown-linux-gnu": little_endian + {"__sh__": 1},
+     }
+--- a/js/src/wasm/WasmFrame.h
++++ b/js/src/wasm/WasmFrame.h
+@@ -230,6 +230,7 @@ class DebugFrame {
+   // Avoid -Wunused-private-field warnings.
+  protected:
+ #if defined(JS_CODEGEN_MIPS32) || defined(JS_CODEGEN_ARM) || \
++    (defined(JS_CODEGEN_NONE) && defined(__riscv) && __riscv_xlen == 32) || \
+     defined(JS_CODEGEN_X86) || defined(__wasi__)
+   // See alignmentStaticAsserts().  For MIPS32, ARM32 and X86 DebugFrame is only
+   // 4-byte aligned, so we add another word to get up to 8-byte
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
index 57bedaa70a..ff0d7bd6ab 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://0004-use-asm-sgidefs.h.patch \
            file://fix-musl-build.patch \
            file://0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch \
+           file://riscv32.patch \
            "
 SRC_URI[sha256sum] = "3b913d6a52c95a8986123c98543f1273812a2d59f2891b4b1c604e35f4580766"
 
@@ -36,6 +37,7 @@ export RUSTFLAGS
 JIT ?= ""
 
 JIT:mipsarch = "--disable-jit"
+JIT:riscv32 = "--disable-jit"
 
 do_configure() {
     cd ${B}
-- 
2.33.1


