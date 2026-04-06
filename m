Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DE1EF4ED5
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 12:03:25 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53472.1775477004607803589
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 05:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z4frEofh;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cf5ad500fso3367487f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 05:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775477003; x=1776081803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DDi8Tp+xmMM6uFm9baiHHPXShDnVPvcfuJkdwGk60Ow=;
        b=Z4frEofhIQ+0bn9jYluZOn4IhH6SZO05gED//cmlYUnEKItG3fOd1CxuJPn/Jybvx5
         ekdno5yT2WpHvC5x83ppLuqKlaOXKOSdyCzllDxZpxD9K0i11mTBuOsPkifKGs1Jo///
         rz+52xuQTi/E4/DMkyKjCqdBtSfP2rQPEH+7e/xVhPmr41x9+5xcYKDuvtVccuD5EjYq
         dK8oleHVBkXyA9DqA8c8u+5y7mQC4HAnmK3ShfA2H9FxiPPGeoctx+1EVWF2gqAEVVkr
         Wg9sY0sC7OafRRTr8q9A8LecQUeYapxk+if4Kqnl/0we7anXFI2UrHCjS2jo9sjuMi/t
         84JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775477003; x=1776081803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDi8Tp+xmMM6uFm9baiHHPXShDnVPvcfuJkdwGk60Ow=;
        b=hOreiyDnunt9lF0O9Uylc1iNQL7SkO6EaopnzTm4Ytq/kgn/7lVpkG6CMDfJn81ADQ
         NgKrqWX0omlNmnhS/HOqO4eyUEW/F9mr/xcve1Nm1sFDbK/lSTHUebH35yPyKnj2zZmZ
         5pdB5S+NUlFM+BGt2MkiTmhXWznSh7fdVGbpgTFpwUKNDWg0ZyTL45AUc82nb8DjP9d/
         L42ko5L6TvsvTw5WliD7rSPJEdZ/qRylXBx4epDGzkrIG41iWVjuZd98XZ+vtUwDAYY8
         Rlx0hP2ASwpNrI8XWcs9OfVRUx7jRK0hh8B2aJ8GuHo3/jpjc053mxoV57v34JMyl/Z6
         1MkA==
X-Gm-Message-State: AOJu0YzZArxPYpPVUXof7K12O3f+qkD8BmzYJN6oDSyfoJ4w6JeiNGuB
	9lieOYuwZNGVrS2b1DDTLt2hKb4eJKAfmz0/wKDuKLayb4xkO4hevHBM5KYckA==
X-Gm-Gg: AeBDieutWqS2MjdW7xQj42Z5l03RTuz3Wd4/jC7cNhpi0b8ffycvM5GJjtTXNxeR1PS
	VR8bMlg6b6sHnMJ4vqFq2RAEpbLdw8ePnnv83N9tAjvv8nHMmoR12naMS/vgu17IS6sJGJsoaId
	TnWQfy4Sc2DAFa1BhiMt7LKxA0AXbQ7lEdrkirQvgfdaKdDYtjyMjPLGgNUoB1eHEWdt5f870LP
	vtn4e7+8qf63WRjm0LPJ+TidTbvV7kv//yrB9Ps34ZZjeO4IvGDitPoI2ADd+X37hd7jH3ZBK85
	RrCSaDmMWBd/oLiNq/jzvpUhRZ1DT+pdKT18g4WkT6S2cIuYrBenwTQIpkxijmN1PV/hvmyPxj/
	xP/JaCeislJaqOb3q6o/N+o2YOvPK9CS4N9MKoXROOPd7k466anlDvbXVZ71EZQbmEHGFcTfH0y
	DOnPEGDF6MY1nZRx8CakF4
X-Received: by 2002:a05:6000:230c:b0:43d:2581:3053 with SMTP id ffacd0b85a97d-43d292ff9c6mr17118563f8f.45.1775477002601;
        Mon, 06 Apr 2026 05:03:22 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f843dsm38673310f8f.37.2026.04.06.05.03.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:03:20 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/7] botan: upgrade 3.11.0 -> 3.11.1
Date: Mon,  6 Apr 2026 14:03:08 +0200
Message-ID: <20260406120314.3514982-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 12:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126038

Contains fixes for CVE-2026-35580 and CVE-2026-35582

Changelog: https://botan.randombit.net/news.html#version-3-11-1-2026-03-31

-CVE-2026-35580: Resolve certificate verification bypass bug introduced in 3.11.0
-CVE-2026-35582: Resolve TLS 1.3 client authentication bypass
-Add optimized Argon2 implementation using AVX512
-Add optimized and constant-time Twofish implementation using AVX512/GFNI
-Add optimized and constant-time SEED implementation using AVX512/GFNI
-Add optimized and constant-time Whirlpool implementations using AVX2 and AVX512
-Add SSSE3/NEON and AVX2 optimized codepaths for CTR
-Add constant time implementations of Camellia, ARIA, SEED and SM4 using
 AES-NI or ARMv8 AES instructions to implement sbox lookups
-Improve performance of the AVX512 implementation of SHA-512 especially for Clang
-Optimizations for the IDEA modular multiplication
-Fix various minor TLS conformance issues flagged by TLS-Anvil
-Fix bug in Ed25519 where an invalid signature checked with PK_Verifier
 might cause a later valid signature to be rejected.
-Fix a bug in handling of ECDSA DER-encode signatures where an invalid
 signature checked with PK_Verifier might cause a later valid signature to be rejected.
-Fix a problem introduced in 3.11.0 which could cause crashes on processors without
 SSSE3 support, particularly when compiled by GCC.
-Fix various new warnings from clang-tidy 22
-Fix a compilation error introduced in 3.11.0 which prevented using ffi
 unless bcrypt was also enabled.
-Avoid a macro collision with Microsoft headers that could cause a compilation
 problem in amalgamation mode.
-Enable explicit_bzero, getentropy, getrandom on Hurd

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-crypto/botan/{botan_3.11.0.bb => botan_3.11.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/botan/{botan_3.11.0.bb => botan_3.11.1.bb} (95%)

diff --git a/meta-oe/recipes-crypto/botan/botan_3.11.0.bb b/meta-oe/recipes-crypto/botan/botan_3.11.1.bb
similarity index 95%
rename from meta-oe/recipes-crypto/botan/botan_3.11.0.bb
rename to meta-oe/recipes-crypto/botan/botan_3.11.1.bb
index e60d826459..d3d0498ec6 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.11.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.11.1.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "e8dd48556818da2c03a9a30932ad05db9e50b12fec90809301ecc64ea51bd11e"
+SRC_URI[sha256sum] = "c1cd7152519f4188591fa4f6ddeb116bc1004491f5f3c58aa99b00582eb8a137"
 
 S = "${UNPACKDIR}/Botan-${PV}"
 

