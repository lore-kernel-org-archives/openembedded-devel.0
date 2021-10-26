Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A16C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 17:38:24 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.466.1635269904125594215
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 10:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g3jB6jHs;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id t21so65141plr.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 10:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dPeLYzArqGlFoefwzRUT+BcYJTPDgwedJEDyzvIMPRg=;
        b=g3jB6jHsHCZ5GudJTaZN4lHdmCtrDmgqiRPWzQuAWXxZgUCFX2sJxakNrCXc23AcmH
         GdiJxX5yFTePQxjlnlyyR/HPShSeatB+Uj4iMrdebTxE+hE7RMkJwT0v/9/uJoFI091l
         4iwhM86Bg9V1hR8ZPgC8GPXByN0jqqYmnsMnzrTmR1Od74UogAyV5U2YoiAd9vMWTqyd
         GGfS3siIbC5L1iF4KTlldeww4fqXrdJhQmdJL4lAC2ZK5ZDfOEQD8Wj8xZZbc5GiqGyZ
         o6jHFG+9Bytjg18wVx8P1Z3xxgGbkckiEm5Gfxb7BLa9TUHzP/DY2SxFWNzHsGz2ZrUT
         zFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dPeLYzArqGlFoefwzRUT+BcYJTPDgwedJEDyzvIMPRg=;
        b=N3sEabb4Uk685NCkQTaNdl2ZaLrAH+roycpbq+HPyOCumLELUQoeIqrPGhBJ53h8QK
         q0yRcRcPqvz/3V+kSdcHAA9fwcWOL53z9B58jzkT3WbfK+dr8mtbhce2hHl9H77XpRXK
         KjCckRNfMKHNnxzo2Iz0f+jLchRyMIilxi6cCQpdJAqD7fFwLi2BhTmbAZOC/jSwOeBd
         /tt3rd7dI9/Skat28QZgnSwDGA2ZAR+y42Cv2uhEGyS0xoNbE8aC4DtmFcSqHU9A5Ahx
         +dbEogVn14cv/eB4EwnQsKHREcAYej7bPjG5wblZsPwPf0terB3XaEU2BFk4hwPlZI7V
         ulZw==
X-Gm-Message-State: AOAM530WV8ILnw0gEHyGW/UT7Z/D/INC3bnuVweMAabLowjxs4Y/tpfu
	rDJ2URYYhOC7xMkj3OmRQiRrmQuUqGQ=
X-Google-Smtp-Source: 
 ABdhPJw3OaqmLeJjFjrUxDpPwprYwjVETM/Aonm9BcWLPmgVBu8WNBgbTRD/2riaMnYiBrmo3RfVTg==
X-Received: by 2002:a17:90a:8912:: with SMTP id
 u18mr84484pjn.69.1635269903182;
        Tue, 26 Oct 2021 10:38:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 lp9sm1745610pjb.35.2021.10.26.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 10:38:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mozjs: Fix build for 32bit systems disabling JIT
Date: Tue, 26 Oct 2021 10:38:21 -0700
Message-Id: <20211026173821.3019739-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 17:38:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93604

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mozjs/mozjs/nojit-32bit-arch-fix.patch    | 21 +++++++++++++++++++
 .../mozjs/mozjs/riscv32.patch                 | 10 ---------
 .../recipes-extended/mozjs/mozjs_91.2.0.bb    |  1 +
 3 files changed, 22 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch
new file mode 100644
index 0000000000..f308b4863f
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch
@@ -0,0 +1,21 @@
+Fix build when JIT is disabled on 32bit systems
+
+This fixes a compile time assert
+js/src/wasm/WasmFrame.cpp:57:3: error: static_assert failed due to requirement '(__builtin_offsetof(js::wasm::DebugFrame, frame_) + sizeof(js::wasm::Frame)) % Alignment == 0' "Aligned after pushing DebugFrame"
+  static_assert((offsetof(DebugFrame, frame_) + sizeof(Frame)) % Alignment == 0,
+  ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/js/src/wasm/WasmFrame.h
++++ b/js/src/wasm/WasmFrame.h
+@@ -230,6 +230,8 @@ class DebugFrame {
+   // Avoid -Wunused-private-field warnings.
+  protected:
+ #if defined(JS_CODEGEN_MIPS32) || defined(JS_CODEGEN_ARM) || \
++    (defined(JS_CODEGEN_NONE) && \
++     (defined(__riscv) && __riscv_xlen == 32) || defined(__mips__)) || \
+     defined(JS_CODEGEN_X86) || defined(__wasi__)
+   // See alignmentStaticAsserts().  For MIPS32, ARM32 and X86 DebugFrame is only
+   // 4-byte aligned, so we add another word to get up to 8-byte
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/riscv32.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/riscv32.patch
index 1f1f93987a..fe9c332a00 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/riscv32.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/riscv32.patch
@@ -43,13 +43,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          "riscv64-unknown-linux-gnu": little_endian + {"__riscv": 1, "__riscv_xlen": 64},
          "sh4-unknown-linux-gnu": little_endian + {"__sh__": 1},
      }
---- a/js/src/wasm/WasmFrame.h
-+++ b/js/src/wasm/WasmFrame.h
-@@ -230,6 +230,7 @@ class DebugFrame {
-   // Avoid -Wunused-private-field warnings.
-  protected:
- #if defined(JS_CODEGEN_MIPS32) || defined(JS_CODEGEN_ARM) || \
-+    (defined(JS_CODEGEN_NONE) && defined(__riscv) && __riscv_xlen == 32) || \
-     defined(JS_CODEGEN_X86) || defined(__wasi__)
-   // See alignmentStaticAsserts().  For MIPS32, ARM32 and X86 DebugFrame is only
-   // 4-byte aligned, so we add another word to get up to 8-byte
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.2.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.2.0.bb
index 45f0145313..a1a5ddc3b0 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.2.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.2.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://fix-musl-build.patch \
            file://0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch \
            file://riscv32.patch \
+           file://nojit-32bit-arch-fix.patch \
            "
 SRC_URI[sha256sum] = "3ef3cfd321d0c2c80ee1b41b8baf7a1ea4daf93c29e1377274933440ff5e42c3"
 
-- 
2.33.1


