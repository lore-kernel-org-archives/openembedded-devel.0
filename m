Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE0DFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:54 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18193.1777549669677338742
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l7PBmawe;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso488985a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549669; x=1778154469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txROMBHekSeupWW0CDSQa0XfoIwy8tg3Ew1wy847cHQ=;
        b=l7PBmaweofrDcTEB17o1r/IYahht76kSYRppIafGJ3aYKqg4tgMC5wFMoVGbI1grcf
         EWK60K05Q+Cs6AsC3vig15cut4s/ny2MKf6aCw8Vc4RMF2i/iRNY04gBGY6a6ijNkHB6
         uyLG4JdDW85JfcNd7RI6jgdtiBxTsCPKAwhfGYMcXrHgrefRvsWspp86DdPAadT6J1An
         Lp0CYwFCxt/xYRsib8Fg8lNo+KmzOmGpQqK0mUpAV9YlUtoPAAFp0sXu1eHRORV4bj07
         erDLdzgfespsFuWCLzfmgJTobWJfjww3NeXSEJW7SWe/bf3EfnIK686jy4B4ebDudlxg
         Iokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549669; x=1778154469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=txROMBHekSeupWW0CDSQa0XfoIwy8tg3Ew1wy847cHQ=;
        b=oxxWmQFejciyGnYIh9MkeUtOPWc8NhWwxU700DGET4gR1qhfPTSWNYCbkplFeRpMnN
         o7aBHMQcslrnCwbel3HtF7GBpxPoooxL9B2NU6B98SSwEtZE7RvBPQuORCwy1cBoA0/6
         q/A8PfowqhkhgDk5cMdg0Z98de0Hdq+wy+jDeg690Cq63Iz+j26FUtTCRhhwOTpYp3FS
         Yr30uy8HTbFiO5162vhdzT2G4+fNaWID54iV+ZkH4bIvXZx66ETrxE3vE3dEygTd+MYD
         P6ijZ/VxnfNMkPukBgrUDOjRoD9x8axsqWJgsNlOrn4seJUcKX5Rejh3PxQMtXXiCtYC
         FgWg==
X-Gm-Message-State: AOJu0Yz2CK2Q3XIKr6nw7ldlxZERQEdujVRvNR8RA6dH1Pk1qxnT/vV6
	Q4S3ByAC6o5jCyNEQtFIgbRjJR/2G1GPTlhKTXpaa7YdXv2omIGQP0PsWDf9uvZv
X-Gm-Gg: AeBDiesTVfhi0idbMA0dr+WzOnM86ou67KxgirKG6eUBs43YkegyoJIDdvUKRF79LJf
	wipF2WYnayCaDnfqmnwRCFcewrI+ktqz/jEK7z7C5KS6bs8b602+rjts50d99UnTboc/S3Us1Aj
	wnqECvDHNtChqjqz57OttwWcVmykLrPjoJGeIoGceYtWlOYEHZtqKHDnapm4Py731q3VB/R8eMO
	hYZ5KwI+BJq7CyAO4r4krYf2w5oiElnbevI7Uh0Jrw4RiwGvWvdVXB7en1UtV62Te2jH9p+SF8o
	YrzzBWR89ZUlA7Ses65i9EJrTmBx3e2tkAfwyHYTiT12NWnu7OcNTuOfKX9gQQyQhhF+rW/1pGM
	r2LNmCLYNHiJvGqRNLmGlhGpJamJhafflIGsYj5+4xWHT/nBUAEr7pdP6Jsy5+BoL473VrlOndq
	ZKwEV1VwZaUdSlwnTdOhv4Pxu0+cwhfxuH+mny+7SO8ylc5kU=
X-Received: by 2002:a17:90b:3f8b:b0:35b:96bb:47ba with SMTP id 98e67ed59e1d1-364c32cbcbdmr2697971a91.26.1777549668705;
        Thu, 30 Apr 2026 04:47:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 18/24] wolfssl: patch CVE-2026-3580
Date: Thu, 30 Apr 2026 23:46:41 +1200
Message-ID: <20260430114649.4184890-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126752

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit from the PR[1] mentioned in the nvd[2]

[1]https://github.com/wolfSSL/wolfssl/pull/9855
[2]https://nvd.nist.gov/vuln/detail/CVE-2026-3580

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-3580.patch         | 425 ++++++++++++++++++
 .../wolfssl/wolfssl_5.8.0.bb                  |   1 +
 2 files changed, 426 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3580.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3580.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3580.patch
new file mode 100644
index 0000000000..245ed606d2
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3580.patch
@@ -0,0 +1,425 @@
+From 2741f67d1cd56887991fc09d6dccc9b25b3ed79b Mon Sep 17 00:00:00 2001
+From: Sean Parkinson <sean@wolfssl.com>
+Date: Tue, 3 Mar 2026 23:18:52 +1000
+Subject: [PATCH] RISC-V 32 no mul SP C: implement multiplication
+
+No multiplication instructions when M extension not included.
+Standard implementation of __muldi3 is not constant time.
+Include a constant time implementation when SP_NO_MUL_INSTRUCTION is
+defined
+Define it when compiling for RISC-V 32 and no multiplication extension.
+
+Also fix get_entry in SP C implementation to do constant time
+comparison.
+
+(cherry picked from commit 71226b68b69404206c74694715f11bb6630750dc)
+
+CVE: CVE-2026-3580
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/71226b68b69404206c74694715f11bb6630750dc]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ .wolfssl_known_macro_extras     |  1 +
+ wolfcrypt/src/sp_arm32.c        | 24 +++++++---
+ wolfcrypt/src/sp_armthumb.c     | 24 +++++++---
+ wolfcrypt/src/sp_c32.c          | 77 +++++++++++++++++++++++++++++++--
+ wolfcrypt/src/sp_c64.c          | 12 +++--
+ wolfcrypt/src/sp_cortexm.c      | 24 +++++++---
+ wolfcrypt/src/sp_x86_64_asm.asm |  2 +-
+ wolfssl/wolfcrypt/sp.h          |  4 ++
+ 8 files changed, 143 insertions(+), 25 deletions(-)
+
+diff --git a/.wolfssl_known_macro_extras b/.wolfssl_known_macro_extras
+index 3e728fa5f..301b1a211 100644
+--- a/.wolfssl_known_macro_extras
++++ b/.wolfssl_known_macro_extras
+@@ -1000,6 +1000,7 @@ __must_check
+ __ppc64__
+ __ppc__
+ __riscv
++__riscv_mul
+ __riscv_xlen
+ __s390x__
+ __sparc
+diff --git a/wolfcrypt/src/sp_arm32.c b/wolfcrypt/src/sp_arm32.c
+index a70eb35eb..ed8cd0296 100644
+--- a/wolfcrypt/src/sp_arm32.c
++++ b/wolfcrypt/src/sp_arm32.c
+@@ -75850,7 +75850,9 @@ static void sp_256_get_entry_16_8(sp_point_256* r,
+     r->y[6] = 0;
+     r->y[7] = 0;
+     for (i = 1; i < 16; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -76271,7 +76273,9 @@ static void sp_256_get_entry_256_8(sp_point_256* r,
+     r->y[6] = 0;
+     r->y[7] = 0;
+     for (i = 1; i < 256; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -93989,7 +93993,9 @@ static void sp_384_get_entry_16_12(sp_point_384* r,
+     r->y[10] = 0;
+     r->y[11] = 0;
+     for (i = 1; i < 16; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -94426,7 +94432,9 @@ static void sp_384_get_entry_256_12(sp_point_384* r,
+     r->y[10] = 0;
+     r->y[11] = 0;
+     for (i = 1; i < 256; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -121504,7 +121512,9 @@ static void sp_521_get_entry_16_17(sp_point_521* r,
+     r->y[15] = 0;
+     r->y[16] = 0;
+     for (i = 1; i < 16; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -121961,7 +121971,9 @@ static void sp_521_get_entry_256_17(sp_point_521* r,
+     r->y[15] = 0;
+     r->y[16] = 0;
+     for (i = 1; i < 256; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+diff --git a/wolfcrypt/src/sp_armthumb.c b/wolfcrypt/src/sp_armthumb.c
+index 4868f7f93..0f112aaef 100644
+--- a/wolfcrypt/src/sp_armthumb.c
++++ b/wolfcrypt/src/sp_armthumb.c
+@@ -101420,7 +101420,9 @@ static void sp_256_get_entry_16_8(sp_point_256* r,
+     r->y[6] = 0;
+     r->y[7] = 0;
+     for (i = 1; i < 16; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -101841,7 +101843,9 @@ static void sp_256_get_entry_256_8(sp_point_256* r,
+     r->y[6] = 0;
+     r->y[7] = 0;
+     for (i = 1; i < 256; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -112269,7 +112273,9 @@ static void sp_384_get_entry_16_12(sp_point_384* r,
+     r->y[10] = 0;
+     r->y[11] = 0;
+     for (i = 1; i < 16; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -112706,7 +112712,9 @@ static void sp_384_get_entry_256_12(sp_point_384* r,
+     r->y[10] = 0;
+     r->y[11] = 0;
+     for (i = 1; i < 256; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -125892,7 +125900,9 @@ static void sp_521_get_entry_16_17(sp_point_521* r,
+     r->y[15] = 0;
+     r->y[16] = 0;
+     for (i = 1; i < 16; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -126349,7 +126359,9 @@ static void sp_521_get_entry_256_17(sp_point_521* r,
+     r->y[15] = 0;
+     r->y[16] = 0;
+     for (i = 1; i < 256; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+diff --git a/wolfcrypt/src/sp_c32.c b/wolfcrypt/src/sp_c32.c
+index 10d646a81..13e3abe00 100644
+--- a/wolfcrypt/src/sp_c32.c
++++ b/wolfcrypt/src/sp_c32.c
+@@ -63,6 +63,71 @@
+ 
+ #ifndef WOLFSSL_SP_ASM
+ #if SP_WORD_SIZE == 32
++#ifdef SP_NO_MUL_INSTRUCTION
++sp_uint64 __muldi3(sp_uint64 a, sp_uint64 b);
++sp_uint64 __muldi3(sp_uint64 a, sp_uint64 b)
++{
++    sp_uint64 r;
++    sp_uint64 am[16];
++
++    /* if b is negative, convert it to positive and negate a. */
++    r = 0 - (b >> 63);
++    a = a ^ r;
++    b = b ^ r;
++    a -= r;
++    b -= r;
++
++#if defined(WOLFSSL_SP_SMALL)
++    int i;
++
++    am[0] = 0;
++    for (i = 1; i < 16; i++) {
++        am[i] = am[i-1] + a;
++    }
++
++    r = am[(b >> 28) & 0xf];
++    for (i = 24; i >= 0; i -= 4) {
++        r <<= 4;
++        r += am[(b >> i) & 0xf];
++    }
++#else
++    am[ 0] = 0;
++    am[ 1] =          a;
++    am[ 2] = a << 1;
++    am[ 3] = am[ 2] + a;
++    am[ 4] = a << 2;
++    am[ 5] = am[ 4] + a;
++    am[ 6] = am[ 5] + a;
++    am[ 7] = am[ 6] + a;
++    am[ 8] = a << 3;
++    am[ 9] = am[ 8] + a;
++    am[10] = am[ 9] + a;
++    am[11] = am[10] + a;
++    am[12] = am[11] + a;
++    am[13] = am[12] + a;
++    am[14] = am[13] + a;
++    am[15] = am[14] + a;
++
++    r  = am[(b >> 28) & 0xf];
++    r <<= 4;
++    r += am[(b >> 24) & 0xf];
++    r <<= 4;
++    r += am[(b >> 20) & 0xf];
++    r <<= 4;
++    r += am[(b >> 16) & 0xf];
++    r <<= 4;
++    r += am[(b >> 12) & 0xf];
++    r <<= 4;
++    r += am[(b >>  8) & 0xf];
++    r <<= 4;
++    r += am[(b >>  4) & 0xf];
++    r <<= 4;
++    r += am[(b >>  0) & 0xf];
++#endif
++
++    return r;
++}
++#endif /* SP_NO_MUL_INSTRUCTION */
+ #define SP_PRINT_NUM(var, name, total, words, bits)   \
+     do {                                              \
+         int ii;                                       \
+@@ -22891,7 +22956,9 @@ static void sp_256_get_entry_256_9(sp_point_256* r,
+     r->y[7] = 0;
+     r->y[8] = 0;
+     for (i = 1; i < 256; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -30408,7 +30475,9 @@ static void sp_384_get_entry_256_15(sp_point_384* r,
+     r->y[13] = 0;
+     r->y[14] = 0;
+     for (i = 1; i < 256; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -37975,7 +38044,9 @@ static void sp_521_get_entry_256_21(sp_point_521* r,
+     r->y[19] = 0;
+     r->y[20] = 0;
+     for (i = 1; i < 256; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+diff --git a/wolfcrypt/src/sp_c64.c b/wolfcrypt/src/sp_c64.c
+index 06dc0bd69..66397f64f 100644
+--- a/wolfcrypt/src/sp_c64.c
++++ b/wolfcrypt/src/sp_c64.c
+@@ -23795,7 +23795,9 @@ static void sp_256_get_entry_256_5(sp_point_256* r,
+     r->y[3] = 0;
+     r->y[4] = 0;
+     for (i = 1; i < 256; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint64)i - (sp_uint64)idx) >> 63) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint64)idx - (sp_uint64)i) >> 63) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -30747,7 +30749,9 @@ static void sp_384_get_entry_256_7(sp_point_384* r,
+     r->y[5] = 0;
+     r->y[6] = 0;
+     for (i = 1; i < 256; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint64)i - (sp_uint64)idx) >> 63) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint64)idx - (sp_uint64)i) >> 63) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -38160,7 +38164,9 @@ static void sp_521_get_entry_256_9(sp_point_521* r,
+     r->y[7] = 0;
+     r->y[8] = 0;
+     for (i = 1; i < 256; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint64)i - (sp_uint64)idx) >> 63) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint64)idx - (sp_uint64)i) >> 63) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+diff --git a/wolfcrypt/src/sp_cortexm.c b/wolfcrypt/src/sp_cortexm.c
+index fc756ffbe..d4af12332 100644
+--- a/wolfcrypt/src/sp_cortexm.c
++++ b/wolfcrypt/src/sp_cortexm.c
+@@ -37267,7 +37267,9 @@ static void sp_256_get_entry_16_8(sp_point_256* r,
+     r->y[6] = 0;
+     r->y[7] = 0;
+     for (i = 1; i < 16; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -37688,7 +37690,9 @@ static void sp_256_get_entry_256_8(sp_point_256* r,
+     r->y[6] = 0;
+     r->y[7] = 0;
+     for (i = 1; i < 256; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -47354,7 +47358,9 @@ static void sp_384_get_entry_16_12(sp_point_384* r,
+     r->y[10] = 0;
+     r->y[11] = 0;
+     for (i = 1; i < 16; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -47791,7 +47797,9 @@ static void sp_384_get_entry_256_12(sp_point_384* r,
+     r->y[10] = 0;
+     r->y[11] = 0;
+     for (i = 1; i < 256; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -59584,7 +59592,9 @@ static void sp_521_get_entry_16_17(sp_point_521* r,
+     r->y[15] = 0;
+     r->y[16] = 0;
+     for (i = 1; i < 16; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+@@ -60041,7 +60051,9 @@ static void sp_521_get_entry_256_17(sp_point_521* r,
+     r->y[15] = 0;
+     r->y[16] = 0;
+     for (i = 1; i < 256; i++) {
+-        mask = (sp_digit)0 - (i == idx);
++        sp_digit gte = (sp_digit)((((sp_uint32)i - (sp_uint32)idx) >> 31) - 1);
++        sp_digit lte = (sp_digit)((((sp_uint32)idx - (sp_uint32)i) >> 31) - 1);
++        mask = gte & lte;
+         r->x[0] |= mask & table[i].x[0];
+         r->x[1] |= mask & table[i].x[1];
+         r->x[2] |= mask & table[i].x[2];
+diff --git a/wolfcrypt/src/sp_x86_64_asm.asm b/wolfcrypt/src/sp_x86_64_asm.asm
+index 4df93a976..30bdc8add 100644
+--- a/wolfcrypt/src/sp_x86_64_asm.asm
++++ b/wolfcrypt/src/sp_x86_64_asm.asm
+@@ -1,6 +1,6 @@
+ ; /* sp_x86_64_asm.asm */
+ ; /*
+-;  * Copyright (C) 2006-2025 wolfSSL Inc.
++;  * Copyright (C) 2006-2026 wolfSSL Inc.
+ ;  *
+ ;  * This file is part of wolfSSL.
+ ;  *
+diff --git a/wolfssl/wolfcrypt/sp.h b/wolfssl/wolfcrypt/sp.h
+index 9e7a9c945..fcfd2dd8e 100644
+--- a/wolfssl/wolfcrypt/sp.h
++++ b/wolfssl/wolfcrypt/sp.h
+@@ -26,6 +26,10 @@
+ #include <wolfssl/wolfcrypt/types.h>
+ #include <wolfssl/wolfcrypt/settings.h>
+ 
++#if defined(__riscv) && (__riscv_xlen == 32) && !defined(__riscv_mul)
++    #define SP_NO_MUL_INSTRUCTION
++#endif
++
+ #if defined(WOLFSSL_HAVE_SP_RSA) || defined(WOLFSSL_HAVE_SP_DH) || \
+                                     defined(WOLFSSL_HAVE_SP_ECC)
+ #ifdef _WIN32_WCE
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index cb3184a40e..671bae1e59 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -28,6 +28,7 @@ SRC_URI = " \
     file://CVE-2025-7394-5.patch \
     file://CVE-2025-7394-6.patch \
     file://CVE-2026-1005.patch \
+    file://CVE-2026-3580.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

