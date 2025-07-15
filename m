Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB2BC83F1D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 11:07:47 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.5721.1752577663346260553
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 04:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LS5OB7L0;
 spf=pass (domain: konsulko.com, ip: 209.85.218.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso929356566b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 04:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1752577661; x=1753182461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1C+YXiFk7OECAUtdK8eiPRyRsRQQp3CGHPS02Cln8JQ=;
        b=LS5OB7L00y5nFFo71VBbjE5VF/Ha2AnXUECkz7TS0qMAB9EMJPLFpfjRVkMAwbfUjc
         ctmBD+teCdc0jRjxTN8jF58YC+IR739NX/ofmTkA1tI/bgcb+m0bIVZPpCP/ydiw2Auy
         xD2lzrxs0XGkBzw7VY+l5So7z65Ss7S2cnDAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752577661; x=1753182461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1C+YXiFk7OECAUtdK8eiPRyRsRQQp3CGHPS02Cln8JQ=;
        b=TkDF1NgxQ28PJEyTLKb0Rh8SmYqGwy9HqusBl/pDWxl92h+XV8bV0OmJePuY9qGGCN
         77ovLqA7KOyipPEzmBR4w6FIkKLfB9o7tOuLLiPmaRhj+ZwaJEgsb9eOHacsAU7G2Y3M
         2jkpiQOlUH1XNVokIO64QBsEqAUBqWq7IYhU8TDyqac9MuXnL+xTImmoDFRCrT88aPAy
         lBkn/5ydSHwkgB36jfb0MWyEThfx/ymzSpg8ycP5W+0VnsjAIUC1OGt9PtaWmtxUHrZR
         ZxFsrSZayKvKefEuJCytD+FPm1E+Lzm+wrvko7Hqb2I6L+S8cCaJdpZSjKMiiu9nHzFe
         OdFQ==
X-Gm-Message-State: AOJu0Yy9vGKkgi+RIe1DrBeAOhYnVGxx56ucxHrRukBrEGJzMHezEYx+
	HXuZ4ou6rGXDdED3I1IeZOlCcJ8ZvDevKXtC9dUZH/ITdV8+XJQQdSfF8/LO6f5YFV2+3s2sTJc
	THU3o
X-Gm-Gg: ASbGncuikCTrPLyY2MYcTG7C+ogSVvaV/EfKu+KBwh2u+jayP+JmEdlk45WvL4s2ZlK
	rm/S15WFmbx9yYvQ2/GdhmsGWjRbn+MIBXXRg7SoYYEJUnzxUoooxCuApeiiqRcpBSN9GRLNi3M
	ulSxJ/OMWkNkbLbs3FBiFYHVry5PlGvioudvNhn3RGB3nz4RcN0ryLjoSrJB0KvfxIUo/Dasu8X
	AxchhCnPS3lZj9C+aDgBQ/SrWeAwHDAVkddhVrLz1k6UpmtHJFGzOV7ZjWaLvwgwMUE+PipWwuJ
	I1EAl1A1rewxMrX/3PVreHD8u89CCloUmcLO5XF6msd+M74ooYlKH4gAm5LZAllhc2oeCCIO2oq
	+/CL2uEEhR2LYAxKhxBRWjx2LXWrIgvEl6id4
X-Google-Smtp-Source: AGHT+IEOrde8AwA2RfbVdM7Xig7nkCdXYey/BWAnEgnOUy+GG4KJS0LI718K/FlvsnMVymdj4Mow5A==
X-Received: by 2002:a17:906:c142:b0:ae3:6038:ad60 with SMTP id a640c23a62f3a-ae9b5bc6084mr286644166b.1.1752577661270;
        Tue, 15 Jul 2025 04:07:41 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee46cdsm1000843066b.60.2025.07.15.04.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 04:07:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-ckzg: Add recipe version 2.1.1
Date: Tue, 15 Jul 2025 14:07:36 +0300
Message-Id: <20250715110738.1033272-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 11:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118559

Add release 2.1.1:

- Fix python release publishingFix python release publishing
- Call test_compute_cells in python bindings
- Fix elixir default path
- Re-enable spec test comparison check
- chore(rust): Cleanup fmt/clippy and ci
- feat: add arbitrary feature
- Update github checkout actions

Apply the same patches used in the Fedora package, which are
currently pending upstream acceptance:
https://src.fedoraproject.org/rpms/python-ckzg/tree/f42

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ort-64-bit-limbs-on-no-asm-platforms.patch | 92 +++++++++++++++++++
 .../python-ckzg-0001-Let-override-CC.patch    | 21 +++++
 .../python-ckzg-0002-Disable-Werror.patch     | 30 ++++++
 .../python/python3-ckzg_2.1.1.bb              | 15 +++
 4 files changed, 158 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ckzg/blst-0001-Support-64-bit-limbs-on-no-asm-platforms.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0001-Let-override-CC.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0002-Disable-Werror.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-ckzg_2.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-ckzg/blst-0001-Support-64-bit-limbs-on-no-asm-platforms.patch b/meta-python/recipes-devtools/python/python3-ckzg/blst-0001-Support-64-bit-limbs-on-no-asm-platforms.patch
new file mode 100644
index 0000000000..e112db9dea
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ckzg/blst-0001-Support-64-bit-limbs-on-no-asm-platforms.patch
@@ -0,0 +1,92 @@
+From: Ulrich Weigand <ulrich.weigand@de.ibm.com>
+Date: Fri, 4 Mar 2022 17:41:12 +0100
+Subject: [PATCH] Support 64-bit limbs on no-asm platforms
+
+Currently, platforms without assembler support always use 32-bit limbs,
+but the Rust bindings always assume 64-bit limbs.  This breaks on
+big-endian platforms like our IBM Z (s390x).
+
+This patch enables 64-bit limbs on 64-bit platforms even if there is
+no hand-written assembler, by using a 128-bit integer type in the
+C implementation (this is an extension that is widely supported on
+64-bit platforms with GCC or LLVM).
+
+Note that this means that the argument "n" to quot_rem_n is no
+longer guaranteed to always be a multiple of 2, so the corresponding
+assertion needs to be removed as well.
+
+This fixes the broken Rust bindings on IBM Z, and also improves
+performance by a factor or 3 or more, because compiler-generated
+code handling __int128 already uses the 64x64->128 multiply
+instruction our ISA provides.
+
+To improve performance of compiler-generated code a bit more, this
+also switches to the -O3 optimization level, which helps with
+unrolling of the Montgomery multiply core loop.
+
+Upstream-Status: Pending
+
+diff --git a/blst/bindings/rust/build.rs b/blst/bindings/rust/build.rs
+index d823057..093a072 100644
+--- a/blst/bindings/rust/build.rs
++++ b/blst/bindings/rust/build.rs
+@@ -234,7 +234,11 @@ fn main() {
+         cc.define("SCRATCH_LIMIT", "(45 * 1024)");
+     }
+     if !cfg!(debug_assertions) {
+-        cc.opt_level(2);
++        if target_arch.eq("s390x") {
++            cc.opt_level(3);
++        } else {
++            cc.opt_level(2);
++        }
+     }
+     cc.files(&file_vec).compile("blst");
+ 
+diff --git a/blst/src/no_asm.h b/blst/src/no_asm.h
+index be7bf47..802b78f 100644
+--- a/blst/src/no_asm.h
++++ b/blst/src/no_asm.h
+@@ -6,6 +6,8 @@
+ 
+ #if LIMB_T_BITS==32
+ typedef unsigned long long llimb_t;
++#else
++typedef unsigned __int128 llimb_t;
+ #endif
+ 
+ #if !defined(__STDC_VERSION__) || __STDC_VERSION__<199901 || defined(__STDC_NO_VLA__)
+@@ -1155,7 +1157,7 @@ limb_t div_3_limbs(const limb_t div_top[2], limb_t d_lo, limb_t d_hi)
+ static limb_t quot_rem_n(limb_t *div_rem, const limb_t *divisor,
+                                           limb_t quotient, size_t n)
+ {
+-    __builtin_assume(n != 0 && n%2 == 0);
++    __builtin_assume(n != 0);
+     llimb_t limbx;
+     limb_t tmp[n+1], carry, mask, borrow;
+     size_t i;
+diff --git a/blst/src/vect.h b/blst/src/vect.h
+index 19640b1..938a5ff 100644
+--- a/blst/src/vect.h
++++ b/blst/src/vect.h
+@@ -18,7 +18,7 @@ typedef unsigned long long limb_t;
+ typedef unsigned __int64 limb_t;
+ # define LIMB_T_BITS    64
+ 
+-#elif defined(__BLST_NO_ASM__) || defined(__wasm64__)
++#elif defined(__wasm64__)
+ typedef unsigned int limb_t;
+ # define LIMB_T_BITS    32
+ # ifndef __BLST_NO_ASM__
+@@ -31,8 +31,10 @@ typedef unsigned long limb_t;
+ #   define LIMB_T_BITS   64
+ #  else
+ #   define LIMB_T_BITS   32
+-#   define __BLST_NO_ASM__
+ #  endif
++# ifndef __BLST_NO_ASM__
++#  define __BLST_NO_ASM__
++# endif
+ #endif
+ 
+ /*
diff --git a/meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0001-Let-override-CC.patch b/meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0001-Let-override-CC.patch
new file mode 100644
index 0000000000..c58089cc15
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0001-Let-override-CC.patch
@@ -0,0 +1,21 @@
+From: Peter Lemenkov <lemenkov@gmail.com>
+Date: Wed, 6 Nov 2024 16:35:23 +0300
+Subject: [PATCH] Let override CC
+
+Upstream-Status: Pending
+
+Signed-off-by: Peter Lemenkov <lemenkov@gmail.com>
+
+diff --git a/src/Makefile b/src/Makefile
+index b733a11..c688005 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -79,7 +79,7 @@ ifeq ($(PLATFORM),Windows)
+ 	CFLAGS += -D_CRT_SECURE_NO_WARNINGS
+ 	CFLAGS += -Wno-missing-braces -Wno-format
+ else
+-	CC = clang
++	CC ?= clang
+ 	CFLAGS += -fPIC
+ 	CFLAGS += -Wmissing-braces -Wformat=2
+ endif
diff --git a/meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0002-Disable-Werror.patch b/meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0002-Disable-Werror.patch
new file mode 100644
index 0000000000..9b0baa358a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0002-Disable-Werror.patch
@@ -0,0 +1,30 @@
+From: rpm-build <rpm-build>
+Date: Tue, 26 Nov 2024 11:13:18 +0100
+Subject: [PATCH] Disable Werror
+
+Upstream-Status: Pending
+
+Signed-off-by: rpm-build <rpm-build>
+
+diff --git a/src/Makefile b/src/Makefile
+index c688005..01b7a80 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -20,7 +20,7 @@ ifeq ($(PLATFORM),Darwin)
+ endif
+ 
+ # The base compiler flags. More can be added on command line.
+-CFLAGS += -I. -I../inc -O2 -Werror
++CFLAGS += -I. -I../inc
+ # Enable a bunch of optional warnings.
+ CFLAGS += \
+ 	-pedantic \
+@@ -81,7 +81,7 @@ ifeq ($(PLATFORM),Windows)
+ else
+ 	CC ?= clang
+ 	CFLAGS += -fPIC
+-	CFLAGS += -Wmissing-braces -Wformat=2
++	CFLAGS += -Wmissing-braces
+ endif
+ 
+ # Settings for blst.
diff --git a/meta-python/recipes-devtools/python/python3-ckzg_2.1.1.bb b/meta-python/recipes-devtools/python/python3-ckzg_2.1.1.bb
new file mode 100644
index 0000000000..5a6196bf75
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ckzg_2.1.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Python Bindings for the C-KZG Library"
+HOMEPAGE = "https://github.com/ethereum/c-kzg-4844"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI += " \
+	file://blst-0001-Support-64-bit-limbs-on-no-asm-platforms.patch \
+	file://python-ckzg-0001-Let-override-CC.patch \
+	file://python-ckzg-0002-Disable-Werror.patch \
+"
+
+SRC_URI[sha256sum] = "d6b306b7ec93a24e4346aa53d07f7f75053bc0afc7398e35fa649e5f9d48fcc4"
+
+inherit pypi setuptools3
-- 
2.39.5


