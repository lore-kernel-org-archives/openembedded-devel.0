Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11562.1792467250709471408
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 20:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YZJMx011;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15943c9c005so2445271c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 20:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792467250; x=1793072050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtgZ1XY3EKjODheGScoFTKN7AomJVr0jz4iTdKeG6tk=;
        b=YZJMx011x/Fyc43sk9NNuzWxx2cnfdeaeoVzIhgcx6KMO8sYDyidAoh/tIDTrA7Uic
         +hbXruKeWtgYK89pAhu0Gzmm35wjP/6HAGI/B9GirkrMIrS2zjgZwDu/OaN+cWNaPx5p
         Fx7sGtQvAgX4CaQsM/3ISSc2QWL9TaZLi81WBo6DR11dzQWaeA3EeM4XIVyMPv9wJL/h
         zgomaf6AKwV+zFe9y7jwXH6Tpmmyyg4fR5QjpVSL3mVD8V+9QutZR1lH9uHnKhKqJ8vU
         963iG2PsgAjgG+ZFgx4PBS0ua8zcgEIrk/d96pq6DUPYlxqCEaNG9LZDkRXwWdJoIuXj
         1pXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792467250; x=1793072050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mtgZ1XY3EKjODheGScoFTKN7AomJVr0jz4iTdKeG6tk=;
        b=z2j9oNxoDaPzX5TTUxbMSN6nefDFrAJeDcNNX4LRnbk39rOvF1K3JcP9ST6aPEZMcb
         yoRG+voutjESyHeEWdjEGrOXctDqu5xnOQqCOiCbUXTUibp/kiyuFFCO+Fsar1l432MX
         KXA0xOs93vuklejdyK2P0FNThfHVgwgcOhD1QZJrcZXYCeKZVT+DHGWvsj2zgOBkX7ca
         2brGAvSurJdmaeJcuNrheuRbbxvvVNbc/yBuVBQm35tEAC1+VJbSPYuTxcQxYfIk4EZc
         JPzZtna3v/2E0+iuSnbTtIvrF42cYPT8cWk0PsuzMj5+IIMv6kMywqrN3/gdNercvufG
         YZog==
X-Gm-Message-State: AFq9FYKi2iakzvpw16FCtkbXfYVZlfL0eLL316fHY3dhZ5FIfJu2fj1O
	x/2NjOCXfCxBZPCe2DyEMLI4/LD9NK8PJhbJv1RYOlUIrNy9za77mq+0htQF1bX3lcE=
X-Gm-Gg: AYBFou2ekiKcnKeLpVMQ3L68xVLK2gx+9d0x3DrIjJUn0le2kgNFos6rZRiMP9RDCap
	LY0jrgaux+yvbKeVOZM4cTr2G0wnfP5b1/y89bSTIjYk7ESHycSPw9IhhakLFVu3uXgqJgVvnXt
	ur5hqrH/fJ9ZreFmp7t+3Eptk7C35NRsHnyVg8X6dtGFvQj5vG3AtVcGMIBQJWw0KN3TKGwrAB6
	t60GILnZPJ0dR/m2gQkoGBOuw6xHRjrV43eyEFc9LGAdBZvKkx+RrA2sGMgG+HlgUuNieUqKDC0
	GQYXYm6mkpgLmV1h0A4LnmFJXMrG788KdrHfPakTFBbFU3/0cx3jNEAxqkMZmXUZev4TrqWs3QQ
	EA913Qt5VtfoOZXUdYbLKAV9W3lqil2F0A2oZHxuD4xhIKgsjwHJedWgR+vnjyXlmzkC/O6pU9W
	EdPURkK4cR6bONkgQMRAZ6sxbg0Hazd2SAkTBOyQP4MOcTepEB4UrlQxT09Z388i+aT1ozcWMAO
	FRO1Uqr2RnJgUgRq05h58XhY8xaezTGrryv/FLJGUChwDz6ULcyKjnoewL0ZwJ3WALiPU7KiWUU
	TJdL9Cedj0cwL80ZWzjoG2Gm5koGCoL1yq92JZR4H71QCVjUW22B+X6k+FherieUo9rIghfQz72
	SN8z1sSd6ROX8K8ajj14NgpZ7K/o72XpDv31z93oNQU+8LnU6T4hVY85uSVc8/9I0Hb0sazUK6D
	NrgbzQ4FmOYSh7Z4NFikm8G6xh3k3jbV/UD3do4vQoxjNu17uT1h20bJI33Q==
X-Received: by 2002:a05:7022:7e88:b0:153:7a27:b7d with SMTP id a92af1059eb24-18512c381a4mr20155974c88.20.1792467249945;
        Mon, 19 Oct 2026 20:34:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831996071csm33498887c88.9.2026.10.19.20.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 20:34:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 2/2] x265: Fix riscv64 build with clang
Date: Mon, 19 Oct 2026 20:34:05 -0700
Message-ID: <20261020033405.1126399-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020033405.1126399-1-khem.raj@oss.qualcomm.com>
References: <20261020033405.1126399-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 03:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131153
Content-Type: text/plain; charset="utf-8"

The riscv64 ADDPTR assembler macro invokes "stride_shift" while the
macro is defined as STRIDE_SHIFT. GNU as matches macro names
case-insensitively, but the LLVM integrated assembler does not, so
building sad-a.S with high bit depth (the default 10bit PACKAGECONFIG)
fails with clang:

  error: unrecognized instruction mnemonic
  stride_shift a6, a7, t5, t5, 1, 1

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ase-of-STRIDE_SHIFT-macro-invocation.patch | 37 +++++++++++++++++++
 .../recipes-multimedia/x265/x265_4.3.bb       |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/x265/x265/0003-riscv64-Fix-case-of-STRIDE_SHIFT-macro-invocation.patch

diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0003-riscv64-Fix-case-of-STRIDE_SHIFT-macro-invocation.patch b/meta-multimedia/recipes-multimedia/x265/x265/0003-riscv64-Fix-case-of-STRIDE_SHIFT-macro-invocation.patch
new file mode 100644
index 0000000000..2bc9d0d436
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/x265/x265/0003-riscv64-Fix-case-of-STRIDE_SHIFT-macro-invocation.patch
@@ -0,0 +1,37 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 19 Oct 2026 19:50:54 -0700
+Subject: [PATCH] riscv64: Fix case of STRIDE_SHIFT macro invocation
+
+The ADDPTR macro invokes "stride_shift", but the macro is defined as
+STRIDE_SHIFT. GNU as matches macro names case-insensitively, so this
+works with GCC, but the LLVM integrated assembler is case-sensitive
+and fails to build the high bit depth SAD functions with clang:
+
+  <instantiation>:1:1: error: unrecognized instruction mnemonic
+  stride_shift a6, a7, t5, t5, 1, 1
+  ^
+  common/riscv64/sad-a.S:666:1: note: while in macro instantiation
+  SAD_FUNC_COMMON 24, 32, 1 , 2
+
+Use the name the macro is defined with.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ source/common/riscv64/asm.S | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/source/common/riscv64/asm.S b/source/common/riscv64/asm.S
+index 39953af..09eab48 100644
+--- a/source/common/riscv64/asm.S
++++ b/source/common/riscv64/asm.S
+@@ -332,7 +332,7 @@ ELF     .size   \name, . - \name
+ .endm
+
+ .macro ADDPTR t0, t1, s0, s1, stride0, stride1, shift0, shift1
+-    stride_shift \t0, \t1, \stride0, \stride1, \shift0, \shift1
++    STRIDE_SHIFT \t0, \t1, \stride0, \stride1, \shift0, \shift1
+     add      \s0, \s0, \t0
+     add      \s1, \s1, \t1
+ .endm
diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb b/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
index 01edc1dc42..c657421783 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     git://github.com/Multicorewareinc/x265.git;protocol=https;branch=master;tag=${PV} \
     file://0001-fix-dynamicHDR10-undefined-uint8_t.patch;patchdir=.. \
     file://0002-x265-fix-build-with-cmake-4.patch;patchdir=.. \
+    file://0003-riscv64-Fix-case-of-STRIDE_SHIFT-macro-invocation.patch;patchdir=.. \
 "
 SRCREV = "e9b88125dc21393b3fd8d68e98083bdfb89778a8"
 S = "${UNPACKDIR}/x265-${PV}/source"
