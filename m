Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC95CA6019
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:49 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31578.1768811326273969331
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H+6lCbrE;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso25467105ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811325; x=1769416125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SW1pdmlvM/UauAB/83xkHmWgBLJE5L82WpBnLtFxJgM=;
        b=H+6lCbrEpgWvpbHsmjlpm2ptPhdYI0Fx4PuE2fTC8e4uEIj3rTaIgniVERvMKxMDU5
         mHZaEvmpGlsX9mazfqVt3TH8YfilJzpUwWn4WMmLKEXDHsYwX2KGZTaYyRfqJf3aqNZ9
         tf5EkKTqfyqaTr0jraMxkhVjxtloDCW5abMX2C2muTXer1XpFbEDPsjf9SSioNOJBkDL
         1tVhSZNrbPdsDLZlSwg7Ka/Nd4JPNSJ010Zrc4Da75ZHjQPz9UGofOU7raUX2074ElkV
         iOIDkH9dQ5Rdub7MzGJ2vvAS4qaepL+YNsm6d19PBzxi6WLkFB8K+zCrpik5Tbr3hgOa
         WFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811325; x=1769416125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SW1pdmlvM/UauAB/83xkHmWgBLJE5L82WpBnLtFxJgM=;
        b=U4gzIBXESbhLVXiOAYuCVuQ/YEsaVL5e8QA0ZTZCiQ61M0ZSeAqU4LqYvLewxCF1h9
         fOS+kM4V9/lKuN5Ugg9E4OYlaGEqFWAtoAA1KV7ilp3i/+qc9vit9TLLsewoax4PAfxL
         BlDFsqeCA+Wu3naSHKJUuf8HmCrbt8sdV6CqJY59WCJQR5IoBulZ9Gbdt1GMtRhFYvfs
         eUu2MwMJYi8kMrOOY2y1lTxln6DtXmdXS30Dnh1hmybpuRJ7hRL/RjHwZzN6YIlTD4IU
         gdnR6jazYF5NNugRgpXIxNOCct20Fp38IrwBFUbQXsokukiIk8+jppwgilEOzfGjslez
         E9BA==
X-Gm-Message-State: AOJu0YzL6KWb40OdwP9AnwSh6xgpARItDw1UkCNPgCYpg10ED3vBfzNk
	JJOiqPgX27LKcSZHw6e+UB9HXgftu3zacS7+HL1ik9kORytR8lNHJoeZJFAtUw==
X-Gm-Gg: AZuq6aKM2NPEhIRhGi557zQbAqm1NFtEsg7JrJ9GJ+jdF7MVSUOeRUhyeY82ttXABmM
	FnSBOIUlOjHKEf2EFS1Ucii+f7bx4CrgHb5ARfIT7e+86zAp/PxCP0EQBVYfnveZgS/DBXpLDlf
	uDLiQYkdABL7JWckOm9ay2CdmpQ5j3Uq6s1Bm4t8BtyWM8En838wLs60LFFmwdpNHQVf/kRlZZE
	vOjWBECoxuUBTX2AW71ie45BziL5BI7/0ZVMHA60edszNFQAoPXOKFD+qPOSmWv0GbQNrpy+Vxx
	R6DOfjOT8ML0AUZHL0z+MOJwo91K1mNneDQazciqA1O4XZg+74WfXXr66SkEEMJEPe4OGOR/drq
	OkPZtCbUVR8w42XJ7GWg+LFAOJpM7Aa5JPFPnuoA+3Qqe4NXtNlR3AlgnUq8mO112V4s1r6f3AB
	W3Lw2hxhKaNcMrEylEE/daLj4oA4fjt3xYtg==
X-Received: by 2002:a17:902:d2d0:b0:2a1:10f7:9717 with SMTP id d9443c01a7336-2a7178099e8mr111554615ad.58.1768811325389;
        Mon, 19 Jan 2026 00:28:45 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:45 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 17/28] mozjs-128: Fix build error with arm and musl
Date: Mon, 19 Jan 2026 21:27:39 +1300
Message-ID: <20260119082752.4120991-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123611

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Build fails for qemuarm with musl with following error:
mozglue/misc/StackWalk.o: in function `unwind_callback(_Unwind_Context*, void*)':
| /usr/src/debug/mozjs-128/128.5.2/mozglue/misc/StackWalk.cpp:810:(.text._ZL15unwind_callbackP15_Unwind_ContextPv+0x4): undefined reference to `_Unwind_GetIP'

Referenced commit[1] for the fix, also refreshed patches.

[1] https://github.com/OSSystems/meta-browser/commit/bb8662912354dae13634c0ec35c3803c344b1e72

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 30942cebe8997dbadcd8bcd81ed0e55d42b48677)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...001-Cargo.toml-do-not-abort-on-panic.patch |  2 +-
 ...nfigure-do-not-look-for-llvm-objdump.patch |  2 +-
 ...o-not-try-to-find-a-suitable-upstrea.patch |  2 +-
 .../mozjs-128/0004-use-asm-sgidefs.h.patch    |  2 +-
 ...2.patch => 0005-Add-RISCV32-support.patch} |  2 +-
 ...x-one-occasionally-reproduced-confi.patch} |  2 +-
 ...ewrite-cargo-host-linker-in-python3.patch} |  2 +-
 ...e-stack-unwinder-like-glibc-therefo.patch} |  2 +-
 ...om-firefox-bugzilla-to-fix-compile-.patch} |  2 +-
 ...on-isn-t-available-in-ARMv5-or-v6-s.patch} |  2 +-
 ...ith-icu-uc-to-fix-build-with-ICU-76.patch} |  2 +-
 ...gc-and-riscv32gc-as-valid-architect.patch} | 38 ++++++++++++-------
 .../0013-Fix-build-error-with-musl.patch      | 30 +++++++++++++++
 .../mozjs/mozjs-128_128.5.2.bb                | 17 +++++----
 14 files changed, 75 insertions(+), 32 deletions(-)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv32.patch => 0005-Add-RISCV32-support.patch} (97%)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-util.configure-fix-one-occasionally-reproduced-confi.patch => 0006-util.configure-fix-one-occasionally-reproduced-confi.patch} (96%)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-rewrite-cargo-host-linker-in-python3.patch => 0007-Rewrite-cargo-host-linker-in-python3.patch} (97%)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{musl-disable-stackwalk.patch => 0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch} (94%)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-add-arm-to-list-of-mozinline.patch => 0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch} (95%)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{armv5.patch => 0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch} (93%)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch => 0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch} (92%)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv.patch => 0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch} (60%)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-on-panic.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-on-panic.patch
index 97a4439628..5c81126f0b 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-on-panic.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-on-panic.patch
@@ -1,4 +1,4 @@
-From ddd23f8547f3a56aa542924aa400d3535f734bff Mon Sep 17 00:00:00 2001
+From ffb7b90712189c9fa8634e4dc915c3afb4448d87 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 1 Oct 2021 13:00:24 +0200
 Subject: [PATCH] Cargo.toml: do not abort on panic
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look-for-llvm-objdump.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look-for-llvm-objdump.patch
index 9a82acf77b..0616aa3ee7 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look-for-llvm-objdump.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look-for-llvm-objdump.patch
@@ -1,4 +1,4 @@
-From 1a5331f1997788e9a25bbc2b10eb14e2ee418be9 Mon Sep 17 00:00:00 2001
+From 0f885ae37ef7cd94fd0712cefb5d3314fbcfdf44 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 1 Oct 2021 13:01:10 +0200
 Subject: [PATCH] moz.configure: do not look for llvm-objdump
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch
index 40025fbc68..8367a62a39 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch
@@ -1,4 +1,4 @@
-From 2d7f06cdf631e4d4d94e9d8e33a953dc57672750 Mon Sep 17 00:00:00 2001
+From ca6cf215462de8f82fd27ad75eb20ac24fc0c512 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 1 Oct 2021 13:02:17 +0200
 Subject: [PATCH] rust.configure: do not try to find a suitable upstream target
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch
index eb3ff452b3..5832f36975 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch
@@ -1,4 +1,4 @@
-From 1691939a22ec12245f008993e0b9a1b1dfb91e9c Mon Sep 17 00:00:00 2001
+From af704b888a91fc3a0f88b0ef2f36de1faaf7d6e2 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <amccurdy@gmail.com>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
 Subject: [PATCH] use <asm/sgidefs.h>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.patch
similarity index 97%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.patch
index 67e23c5fcc..2359373999 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.patch
@@ -1,4 +1,4 @@
-From 0cc41bc953974d4852b263708bf8d12f823ca8ad Mon Sep 17 00:00:00 2001
+From 8b7f96cc479c99a286591ac6dcd0be19bcf83b15 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 24 Oct 2021 22:32:50 -0700
 Subject: [PATCH] Add RISCV32 support
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-one-occasionally-reproduced-confi.patch
similarity index 96%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-one-occasionally-reproduced-confi.patch
index d53cc2bd41..9cc7831876 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-one-occasionally-reproduced-confi.patch
@@ -1,4 +1,4 @@
-From 683cd23dd269509a1d913adb2b049b84771e0a94 Mon Sep 17 00:00:00 2001
+From 13b544e4ed51f41138bf200eb84552e169df87b0 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 11 Nov 2021 16:05:54 +0800
 Subject: [PATCH] util.configure: fix one occasionally reproduced configure
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-linker-in-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-linker-in-python3.patch
similarity index 97%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-linker-in-python3.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-linker-in-python3.patch
index 94e1651b33..9d6a89214b 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-linker-in-python3.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-linker-in-python3.patch
@@ -1,4 +1,4 @@
-From 6f6b78628a8edc834aa147c87ebce3eb8e670e7a Mon Sep 17 00:00:00 2001
+From 31d56eba10e7cf856a2a118e0523633195fe9ea2 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 18 Nov 2021 07:16:39 +0000
 Subject: [PATCH] Rewrite cargo-host-linker in python3
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch
similarity index 94%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch
index 3d5452ce4d..91614291c7 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch
@@ -1,4 +1,4 @@
-From d96e9a40e9da9163e0a4b3475178fe30c26deb19 Mon Sep 17 00:00:00 2001
+From fae21326f717f1c0031f3ad0ff4c3112ffb3a936 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 22 Sep 2023 22:59:56 +0000
 Subject: [PATCH] Musl does not have stack unwinder like glibc therefore we can
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-of-mozinline.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch
similarity index 95%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-of-mozinline.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch
index 960b4593c2..a2e3c08edf 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-of-mozinline.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch
@@ -1,4 +1,4 @@
-From 2d1fb35bd81acadc12cc077de86361ac59cee2f1 Mon Sep 17 00:00:00 2001
+From 7dc235e1558b087c69024ed40c6066bd8126f2a3 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 22 Sep 2023 22:59:59 +0000
 Subject: [PATCH] Backport patch from firefox bugzilla to fix compile error for
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch
similarity index 93%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch
index 564f423fb4..e2e935eb03 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch
@@ -1,4 +1,4 @@
-From 0dd6fdbf6a821898617f1bd8e57123be048c07f5 Mon Sep 17 00:00:00 2001
+From e94edc3eba7ea158806283d92ecd71ab87351838 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 16 Dec 2024 05:49:57 +0000
 Subject: [PATCH] The ISB instruction isn't available in ARMv5 or v6, so guard
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch
similarity index 92%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch
index 4fb7a28eeb..2d85e29005 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch
@@ -1,4 +1,4 @@
-From cbb5cc1022cc27edefc8eabbe21458cac9bda6fb Mon Sep 17 00:00:00 2001
+From 8290fd619582651334fbfdfe7be887d539ce0f2c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 23 Nov 2024 13:28:33 -0800
 Subject: [PATCH] Link with icu-uc to fix build with ICU-76
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch
similarity index 60%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch
index cb2dc66525..9cdb9fe913 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch
@@ -1,12 +1,35 @@
-Recognise riscv64gc and riscv32gc as valid architectures
+From 93d586d712bf34c243c6174425c78d3ab274c6a0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 7 Jan 2025 15:17:16 -0800
+Subject: [PATCH] Recognise riscv64gc and riscv32gc as valid architectures
 
 Rust uses above for architecture in tuples
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ build/autoconf/config.sub                                     | 2 +-
+ .../mozbuild/test/configure/test_toolchain_configure.py       | 4 ++++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/build/autoconf/config.sub b/build/autoconf/config.sub
+index 2c6a07ab3c..f7ee82380c 100755
+--- a/build/autoconf/config.sub
++++ b/build/autoconf/config.sub
+@@ -1236,7 +1236,7 @@ case $cpu-$vendor in
+ 			| powerpc | powerpc64 | powerpc64le | powerpcle | powerpcspe \
+ 			| pru \
+ 			| pyramid \
+-			| riscv | riscv32 | riscv32be | riscv64 | riscv64be \
++			| riscv | riscv32 | riscv32be | riscv32gc | riscv64 | riscv64be | riscv64gc \
+ 			| rl78 | romp | rs6000 | rx \
+ 			| s390 | s390x \
+ 			| score \
+diff --git a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
+index 1be0d02e54..a476d787b2 100644
 --- a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
 +++ b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
-@@ -1327,6 +1327,10 @@ class LinuxCrossCompileToolchainTest(Bas
+@@ -1327,6 +1327,10 @@ class LinuxCrossCompileToolchainTest(BaseToolchainTest):
          "mips-unknown-linux-gnu": big_endian + {"__mips__": 1},
          "riscv32-unknown-linux-gnu": little_endian + {"__riscv": 1, "__riscv_xlen": 32},
          "riscv64-unknown-linux-gnu": little_endian + {"__riscv": 1, "__riscv_xlen": 64},
@@ -17,14 +40,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          "sh4-unknown-linux-gnu": little_endian + {"__sh__": 1},
      }
  
---- a/build/autoconf/config.sub
-+++ b/build/autoconf/config.sub
-@@ -1236,7 +1236,7 @@ case $cpu-$vendor in
- 			| powerpc | powerpc64 | powerpc64le | powerpcle | powerpcspe \
- 			| pru \
- 			| pyramid \
--			| riscv | riscv32 | riscv32be | riscv64 | riscv64be \
-+			| riscv | riscv32 | riscv32be | riscv32gc | riscv64 | riscv64be | riscv64gc \
- 			| rl78 | romp | rs6000 | rx \
- 			| s390 | s390x \
- 			| score \
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl.patch
new file mode 100644
index 0000000000..1900c17f74
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl.patch
@@ -0,0 +1,30 @@
+From 0f903fa0be39e39083599306018fa7bd724dba9d Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Date: Wed, 7 Jan 2026 20:26:53 +1300
+Subject: [PATCH] Fix build error with musl
+
+_Unwind_GetIP symbol is not implemented by musl, so use it only with libc.
+
+mozglue/misc/StackWalk.o: in function `unwind_callback(_Unwind_Context*, void*)':
+| /usr/src/debug/mozjs-128/128.5.2/mozglue/misc/StackWalk.cpp:810:(.text._ZL15unwind_callbackP15_Unwind_ContextPv+0x4): undefined reference to `_Unwind_GetIP'
+
+Reference: https://github.com/OSSystems/meta-browser/commit/bb8662912354dae13634c0ec35c3803c344b1e72
+Upstream-Status: Inappropriate [musl-specific]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ mozglue/misc/StackWalk.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mozglue/misc/StackWalk.cpp b/mozglue/misc/StackWalk.cpp
+index d3d9208fdb..9f7155a4f7 100644
+--- a/mozglue/misc/StackWalk.cpp
++++ b/mozglue/misc/StackWalk.cpp
+@@ -696,7 +696,7 @@ MFBT_API bool MozDescribeCodeAddress(void* aPC,
+ //
+ // Changes to to OS/Architecture support here should be reflected in
+ // build/moz.configure/memory.configure
+-#elif HAVE_DLADDR &&                                           \
++#elif defined(__GLIBC__) && HAVE_DLADDR &&                     \
+     (HAVE__UNWIND_BACKTRACE || MOZ_STACKWALK_SUPPORTS_LINUX || \
+      MOZ_STACKWALK_SUPPORTS_MACOSX)
+ 
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
index ceb81d07e5..fbbe3749ba 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
@@ -8,14 +8,15 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://0002-moz.configure-do-not-look-for-llvm-objdump.patch \
            file://0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch \
            file://0004-use-asm-sgidefs.h.patch \
-           file://riscv32.patch \
-           file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch \
-           file://0001-rewrite-cargo-host-linker-in-python3.patch  \
-           file://musl-disable-stackwalk.patch \
-           file://0001-add-arm-to-list-of-mozinline.patch \
-           file://armv5.patch \
-           file://0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
-           file://riscv.patch \
+           file://0005-Add-RISCV32-support.patch \
+           file://0006-util.configure-fix-one-occasionally-reproduced-confi.patch \
+           file://0007-Rewrite-cargo-host-linker-in-python3.patch  \
+           file://0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch \
+           file://0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch \
+           file://0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch \
+           file://0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
+           file://0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch \
+           file://0013-Fix-build-error-with-musl.patch \
            "
 SRC_URI[sha256sum] = "25d633eb81499cbda44b8c64fa1c1a5879d55024b864ef495d4997154d68358f"
 

