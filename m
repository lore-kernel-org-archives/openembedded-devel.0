Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12023.1794070365952830823
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MSV3HnnM;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490d59c3edaso387390f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070364; x=1794675164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhWf2jsdhNivPK3PZgSr9KIlme2PaBmV4lz09IuTvaU=;
        b=MSV3HnnMcFaCOcnsF3xnC79reylu+4hDR2pO5AP6ADEqTxjilwpJjmYEF9YGcI6hlb
         uLtAdxD+/z56/1nLQiAinYvioCdwHWjwHOhbJSYuzjTO0GvcANMq+xbYK3ayrAhJc1K+
         qyV95ChBwP2M5jVFaUgyL0Sh9JRSCHTbQyjzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070364; x=1794675164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dhWf2jsdhNivPK3PZgSr9KIlme2PaBmV4lz09IuTvaU=;
        b=Cb7SUDgoLTqJT6fQkfR4HSy8oL5UNmF1acPbN7dKJPZ5V+hRMO1PHW7gMygpWn8foe
         GbZJ56JpTx1p8FPeUCo1C83KSkLT7+YKqhqbzlNf9bGJXEAJAa5NSyeuMa7qYgbpaFUe
         VmpUIdtpOyspftD3Qy22YDJad92PMYIRDq+rYDmWc6TdudZRgiCkRP3I6j9emkx9SBIN
         dheWhE8h9BHRM9Vag3dknx3JYqqcrB42sq7yRSyO0dCRZmQH/xXn6MRfB64KtOultfky
         bVzSUTvMmRQ3AkptlFrX0fVGqYwdsUrx+Mal/xN5Y7CQF4FtNO28rTq4a+87mUB+fEj4
         7qFw==
X-Gm-Message-State: APuU4Z/ZbztBD5LLaJU8lKLIuX/NH94h7TmnCCm/8aq39KTzAjmq3EiP
	IHags6iH2SnWdzKaOVv1KcPSluOxoy+WjgvyTVLnnY8GCkCIOdrKG8OJ6bXQpKexoIdKc6mC/LS
	ekbr0
X-Gm-Gg: AYBFou33M5Q9yLRwnPEUWqyVpRHAr4f2SabLtkIPyLn0Vz6jSP9bBH9G36H3xbhR2Dh
	sYdRwi3j3f1bHsIqNpI1m8ywnOugIpJY1T7A5IZzPkNdD+6tUnPnjdTa3lKBPTFl4U8JHE0t4+A
	KJ+EtyqOB4z1801ekFJ6Kt00Sf4PDjD93bBu8IztplCYIRK0h6XFmjnxlgcjzAK7xbnZ97H9uEt
	5LEIKnWBKw2DMoVjC5XZ8VqDYeeWyoc88KrOQPGlkpcI0p6nz7+lUE/DFsc1cXOYT1H0C2N7QUS
	BpUMlIU1GXqQ89cqHwJusD2vUssiFZMfJKg8TK1SgRiMu3yzK5QVghfZABgEWPA0xK/gBsQJn4L
	ajqu/wCbmhBcA1wt63fuKua8sm5gyai/yEowJWyJApz2YXwoNvedFQ5o4u2Gev+xgovaVEdQq3R
	zdwLgaCMl6uOzs7Bk8+meEbqo1YgNdvCFnS69xcTG+ZCJBs9ld4iuEiuZkJ6oQ/KrtWrghcIpuy
	8kzv4k4KItJSTz2dOm0nxIicQ5TT4SqO7oiuh4ifmcYyJ3GYdwsadRjndSzjnfS7I2jvpvql1YP
	r96yyrqzyr4fDthvu8Ek8ZJHpiiXi4bCboQO7k5cHtQhGvZzgtZ1DF+ptjvFuGm/arK6B3ZzBMy
	77bwqDMpn/lmbOUja3XO2G8G28Ldo1OR+d8clHDPs8Udm/sSm/SMmXw==
X-Received: by 2002:a05:6000:41d3:b0:491:eb12:e151 with SMTP id ffacd0b85a97d-4941f5733a1mr4197826f8f.4.1794070364180;
        Sat, 07 Nov 2026 08:52:44 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 21/22] nss: Upgrade 3.132 -> 3.133
Date: Sat,  7 Nov 2026 18:52:20 +0200
Message-ID: <20261107165221.122340-21-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132006
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.133:

- Bug 1989541 - Use FIPS-aware key extraction in the PBKDF2 long
  password test.
- Bug 1989541 - Prehash PBKDF2 passwords longer than the HMAC block
  size.
- Bug 1989541 - Use CK_PKCS5_PBKD2_PARAMS with softoken older than
  3.114.
- Bug 2087641 - Harden inline attribute value handling in softoken.
- Bug 2082793 - Don't cache sessions when ECH was rejected.
- Bug 2082792 - Keep DTLS handshake messages whole in the send
  buffer.
- Bug 2082077 - Initialize sftk_MACCtx in sftk_MAC_Init.
- Bug 2082027 - reorder session context setup in sftk_doMACInit.
- Bug 2083840 - Move CLAUDE.md into AGENTS.md.
- Bug 2083840 - Add text to CLAUDE.md regarding code comments and
  searchfox-cli.
- Bug 2084251 - Fix cf_status_nss clearing base-release bugs on
  point releases.
- Bug 2039884 - Use vectorized Hacl_Chacha20Poly1305_128 on aarch64
  above 512 bytes.
- Bug 2046805 - Add SSL_EnablePlaintextResumptionExport
  experimental API.
- Bug 2046805 - Collapse resumption token append boilerplate into
  macros.
- Bug 2086058 - Reject not empty parameters in ML-KEM && ML-DSA
  AlgorithmIdentifiers.
- Bug 2085825 - harden release assertion in
  sftk_DestroySessionObjectData.
- Bug 2085776 - signver: Exit with 0 after a successful -A.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../nss/nss/0001-nss-fix-support-cross-compiling.patch   | 9 +++------
 .../nss/nss/0002-nss-no-rpath-for-cross-compiling.patch  | 5 +----
 .../nss/nss/0003-nss-fix-incorrect-shebang-of-perl.patch | 5 +----
 .../nss/nss/0004-nss-disable-Wvarargs-with-clang.patch   | 5 +----
 ...oes-not-build-on-mips-with-clang-because-wrong-.patch | 7 ++-----
 ...6-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch | 5 +----
 ...l-add-a-configure-option-to-disable-ARM-HW-cryp.patch | 4 ++--
 .../recipes-support/nss/{nss_3.132.bb => nss_3.133.bb}   | 2 +-
 8 files changed, 12 insertions(+), 30 deletions(-)
 rename meta-oe/recipes-support/nss/{nss_3.132.bb => nss_3.133.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
index 5733bb068f..3b235cf858 100644
--- a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
+++ b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
@@ -1,4 +1,4 @@
-From c15470d6b52986a8e41f9be4579c88ed80413b44 Mon Sep 17 00:00:00 2001
+From 456896494f7299b479a56fa630cc1cc204af4465 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 22 Feb 2017 11:36:11 +0200
 Subject: [PATCH] nss: fix support cross compiling
@@ -15,7 +15,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
-index 711d19d..a163d24 100644
+index fbc15ef..2449821 100644
 --- a/nss/coreconf/arch.mk
 +++ b/nss/coreconf/arch.mk
 @@ -26,11 +26,11 @@ OS_ARCH := $(subst /,_,$(shell uname -s))
@@ -33,7 +33,7 @@ index 711d19d..a163d24 100644
  
  
 diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index e744314..0ebfc92 100644
+index 057b458..22977e1 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
 @@ -36,6 +36,12 @@ ifdef USE_64
@@ -49,6 +49,3 @@ index e744314..0ebfc92 100644
  ifdef USE_ABI32_FPU
  	DEFINES += -DNSS_USE_ABI32_FPU
  endif
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/nss/nss/0002-nss-no-rpath-for-cross-compiling.patch b/meta-oe/recipes-support/nss/nss/0002-nss-no-rpath-for-cross-compiling.patch
index 19fa5a7261..5d7de326e6 100644
--- a/meta-oe/recipes-support/nss/nss/0002-nss-no-rpath-for-cross-compiling.patch
+++ b/meta-oe/recipes-support/nss/nss/0002-nss-no-rpath-for-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 621023bc696d3d26a4179dbbafb42d79bef1faf9 Mon Sep 17 00:00:00 2001
+From d8f6570863ca3d553d98e7491f6d65eba8440e15 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sat, 7 Mar 2020 08:34:02 -0800
 Subject: [PATCH] nss:no rpath for cross compiling
@@ -26,6 +26,3 @@ index 6401778..e5c4e16 100644
  endif
  endif
  
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/nss/nss/0003-nss-fix-incorrect-shebang-of-perl.patch b/meta-oe/recipes-support/nss/nss/0003-nss-fix-incorrect-shebang-of-perl.patch
index 61b7565739..bfeff3caeb 100644
--- a/meta-oe/recipes-support/nss/nss/0003-nss-fix-incorrect-shebang-of-perl.patch
+++ b/meta-oe/recipes-support/nss/nss/0003-nss-fix-incorrect-shebang-of-perl.patch
@@ -1,4 +1,4 @@
-From 6aec640342088498cb1b0a2e395eb3da297a48b4 Mon Sep 17 00:00:00 2001
+From bdd47ee2ad3c6e04fac9ff6e6d06851bcc063a1a Mon Sep 17 00:00:00 2001
 From: Ovidiu Panait <ovidiu.panait@windriver.com>
 Date: Mon, 13 Jul 2020 12:12:31 +0300
 Subject: [PATCH] nss: fix incorrect shebang of perl
@@ -89,6 +89,3 @@ index f29f60a..850332a 100755
  
  ########################################################################
  #
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/nss/nss/0004-nss-disable-Wvarargs-with-clang.patch b/meta-oe/recipes-support/nss/nss/0004-nss-disable-Wvarargs-with-clang.patch
index fa4c5bacbf..8f78b87c38 100644
--- a/meta-oe/recipes-support/nss/nss/0004-nss-disable-Wvarargs-with-clang.patch
+++ b/meta-oe/recipes-support/nss/nss/0004-nss-disable-Wvarargs-with-clang.patch
@@ -1,4 +1,4 @@
-From 72c3150300975524bb0001b5a731f077852c95ab Mon Sep 17 00:00:00 2001
+From d20bdad1360fb57c62660522d5a385e51dca641e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 7 Mar 2020 08:34:02 -0800
 Subject: [PATCH] nss: disable Wvarargs with clang
@@ -40,6 +40,3 @@ index a569a49..687fe58 100644
        # -Wno-parentheses-equality : because clang warns about macro expansions
        WARNING_CFLAGS += $(call disable_warning,parentheses-equality)
        ifdef BUILD_OPT
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/nss/nss/0005-nss-does-not-build-on-mips-with-clang-because-wrong-.patch b/meta-oe/recipes-support/nss/nss/0005-nss-does-not-build-on-mips-with-clang-because-wrong-.patch
index f12a278ef2..3c74077e77 100644
--- a/meta-oe/recipes-support/nss/nss/0005-nss-does-not-build-on-mips-with-clang-because-wrong-.patch
+++ b/meta-oe/recipes-support/nss/nss/0005-nss-does-not-build-on-mips-with-clang-because-wrong-.patch
@@ -1,4 +1,4 @@
-From 5935755eef43ac7cb8f4567e7bed5892180f954c Mon Sep 17 00:00:00 2001
+From 452f42bb1c6dc4281b5879c6fb6f85e5c33c21f3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 7 Mar 2020 08:34:02 -0800
 Subject: [PATCH] nss: does not build on mips with clang because wrong types
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/nss/lib/freebl/pqg.c b/nss/lib/freebl/pqg.c
-index 62d46b5..8c8665d 100644
+index 73ff540..64a5e22 100644
 --- a/nss/lib/freebl/pqg.c
 +++ b/nss/lib/freebl/pqg.c
 @@ -326,8 +326,8 @@ generate_h_candidate(SECItem *hit, mp_int *H)
@@ -30,6 +30,3 @@ index 62d46b5..8c8665d 100644
            SECItem *seedout)
  {
      mp_int s, sum, modulus, tmp;
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/nss/nss/0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch b/meta-oe/recipes-support/nss/nss/0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch
index afe11821af..a97423de6c 100644
--- a/meta-oe/recipes-support/nss/nss/0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch
+++ b/meta-oe/recipes-support/nss/nss/0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch
@@ -1,4 +1,4 @@
-From 895e76e75dbb993a8f445072c190a9db4ee50d15 Mon Sep 17 00:00:00 2001
+From 8bc8f1e64df1a285c902c4cbf272fa6e6f0f8e69 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Sat, 7 Mar 2020 08:34:02 -0800
 Subject: [PATCH] Fix nss multilib build on openSUSE 11.x 32bit
@@ -40,6 +40,3 @@ index 337cbeb..dd77fbe 100644
  ifeq (,$(filter-out WIN%,$(OS_TARGET)))
  PROGRAM		=
  TARGETS		=
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
index 1d2d7b4f38..77ee7d90a9 100644
--- a/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
+++ b/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -1,4 +1,4 @@
-From 459ee39104228a958a0999e1a7d4c43e4e6fe4f0 Mon Sep 17 00:00:00 2001
+From c36282f11d9714502c82d290e968634c1e8b0db6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 18 Dec 2019 12:29:50 +0100
 Subject: [PATCH] freebl: add a configure option to disable ARM HW crypto
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index 0ebfc92..3ee7623 100644
+index 22977e1..febe407 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
 @@ -142,6 +142,8 @@ endif
diff --git a/meta-oe/recipes-support/nss/nss_3.132.bb b/meta-oe/recipes-support/nss/nss_3.133.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.132.bb
rename to meta-oe/recipes-support/nss/nss_3.133.bb
index 4d24497eef..b7481bd13e 100644
--- a/meta-oe/recipes-support/nss/nss_3.132.bb
+++ b/meta-oe/recipes-support/nss/nss_3.133.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "ee9cf4837ba801141a804321c4462ad8f452ff4314275c6d5108a6b05af227ff"
+SRC_URI[sha256sum] = "4d752526b9846a1d962588cfbd09b7cc2a4f6a4effbd9157d58a30e8a2573065"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.47.3

