Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885C3CD13DE
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:48:04 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18386.1777549676081442516
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Sx45F81p;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so466446a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549675; x=1778154475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7pHaZ7dlrpJmFLIX3ky1+teR+hE4/1H9nxdNDElQiA=;
        b=Sx45F81pAnbB4GOmAkk/05x4MYJU76EH0nvinp1uZ+Dlk+VJRwlziivHDSFRvNvOzJ
         hQ+jZLuRJsmDK+l6tY3UijeHNGBNx/lj7h9C77uX0YZWBS2zl5AjkocSX/LOhbPBiy8M
         tSovwsJgfMk9So7t3rfrVO1utTykrj76jYHvbHFspVI8Lktr2V2Lp1tdWfnAZBvLLZjQ
         UXAfcqPffa0ge5ZXtcT03rWHw7BoJS6FogiJaoWeGxF/od6+fS1LWs1UxAwEcIjxkUnO
         STNhIPAMGR7LNZLDLMXTB9lmI62FicC64gc6hG4k9FihkpQFauPng2EHpDgb9+dogkBr
         vP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549675; x=1778154475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c7pHaZ7dlrpJmFLIX3ky1+teR+hE4/1H9nxdNDElQiA=;
        b=IaBMqIaYeBlP2xMn6IBwmfxj/kjc2IJejjZO2NLDxpE0YPYMh+v7MzJ5G9OZsELJ1F
         JntnrlfAuzzgGhvafU94rF8AyJ7QzZuTuFjeo9lEcLDR3KG1V8refmgQAnFxuuX8w5oK
         cpOGoYRt3H1FNtuQVwooMCU5sGKlHvHrHncdHV/6kHqtiXpUXn38xYKC8fYR8M9odBO7
         IRZj7R2Ze2zlEN6OMoscvCKRfSjcQImLgm/8iTcWxsma+WoFscCoE3Goj1suRb0A1Bou
         tKopwyekftl8B5SGc/nasQzpwVNt/S2u0ny5tLCExAYKnwPd2cl2yOTXP7G30c6B8Zd0
         +oJw==
X-Gm-Message-State: AOJu0Yybk/SOaUd72xgDQKK14I5ZTbnLUeMMe6qtjGLS9SjosHx1kJAb
	k2CzqmNbWE1u1p5AtBdAQ3LTRX215yA1BpBuyem+WZjt5VBs6wSE0xsF+mVVyll/
X-Gm-Gg: AeBDiev99M6QIdVZhEd46VVjXCvYF2hZPqmz/XvTlXNtl35S5yW6ruNXk+36Q8IaQ9V
	Z0kfS13jyGT2cA5pS5PKAMbN7GGAKiRySEQ9I6QztoiD1iEewXI0WEE4iAyqm/HjYs79s6OOHRY
	6qDV0NVdexgPcDh2FaGBllN/uphyrTsIde+EYRKKkYcqUNsv4K7Hyr3AhLqdEk9NadpXtfVnIZj
	+P1QZrVdKrqKEXdFjRaUV0XudciX2uihjhMMKA3dKnYxTuqOi7KPkROiE1+KU9M4uM5ZEfPOzf4
	JnAVEvUofQKLoteirXl5DQKXZnmDXVzuDTJ8m4rX+LfI8R0XYT0lfRNkCH3Vd+lkxdhrplahOwW
	mlIyfoq7BGxCcskXmwoTRZPBJYiYsacPEzsdcUtDwUky6dpNsBZuxS6VT/j/1b0eFIWeu2iZCdi
	OrwskBzUyGutqhleFWDNiTsTrowpr7KiC2bD0Tuctf3yInpXc=
X-Received: by 2002:a17:90b:6cd:b0:35f:b313:84ca with SMTP id 98e67ed59e1d1-364c31a1cffmr2694954a91.27.1777549675188;
        Thu, 30 Apr 2026 04:47:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 21/24] wolfssl: patch CVE-2026-5446
Date: Thu, 30 Apr 2026 23:46:44 +1200
Message-ID: <20260430114649.4184890-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126755

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commits from the PR[1] mentioned in the nvd[2]

[1]https://github.com/wolfSSL/wolfssl/pull/10111
[2]https://nvd.nist.gov/vuln/detail/CVE-2026-5446

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-5446-1.patch       | 62 +++++++++++++++++++
 .../wolfssl/files/CVE-2026-5446-2.patch       | 27 ++++++++
 .../wolfssl/wolfssl_5.8.0.bb                  |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5446-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5446-2.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5446-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5446-1.patch
new file mode 100644
index 0000000000..33823c2b9f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5446-1.patch
@@ -0,0 +1,62 @@
+From 6d6d06c05f84b190c43c9b75c6fa11375d2be424 Mon Sep 17 00:00:00 2001
+From: Eric Blankenhorn <eric@wolfssl.com>
+Date: Tue, 31 Mar 2026 08:31:14 -0500
+Subject: [PATCH] Fix ARIA build issue and FIPS guard
+
+(cherry picked from commit 6495e8e94115f7f6beb67497e07bac5cba8dca9c)
+
+CVE: CVE-2026-5446
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/6495e8e94115f7f6beb67497e07bac5cba8dca9c]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/internal.c | 21 ++++++++++++++++-----
+ 1 file changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/src/internal.c b/src/internal.c
+index 992c10d2c..fbf227a93 100644
+--- a/src/internal.c
++++ b/src/internal.c
+@@ -19023,7 +19023,9 @@ static int DoDtlsHandShakeMsg(WOLFSSL* ssl, byte* input, word32* inOutIdx,
+ #if (!defined(NO_PUBLIC_GCM_SET_IV) && \
+     ((defined(HAVE_FIPS) || defined(HAVE_SELFTEST)) && \
+     (!defined(HAVE_FIPS_VERSION) || (HAVE_FIPS_VERSION < 2)))) || \
+-    (defined(HAVE_POLY1305) && defined(HAVE_CHACHA))
++    (defined(HAVE_POLY1305) && defined(HAVE_CHACHA)) || \
++    defined(HAVE_ARIA) || \
++    defined(WOLFSSL_SM4_GCM) || defined(WOLFSSL_SM4_CCM)
+ static WC_INLINE void AeadIncrementExpIV(WOLFSSL* ssl)
+ {
+     int i;
+@@ -20006,10 +20008,9 @@ static WC_INLINE int Encrypt(WOLFSSL* ssl, byte* out, const byte* input,
+                 sizeof(ssl->encrypt.sanityCheck));
+         #endif
+ 
+-        #if defined(BUILD_AESGCM) || defined(HAVE_AESCCM) || defined(HAVE_ARIA)
++        #if defined(BUILD_AESGCM) || defined(HAVE_AESCCM)
+             if (ssl->specs.bulk_cipher_algorithm == wolfssl_aes_ccm ||
+-                ssl->specs.bulk_cipher_algorithm == wolfssl_aes_gcm ||
+-                ssl->specs.bulk_cipher_algorithm == wolfssl_aria_gcm)
++                ssl->specs.bulk_cipher_algorithm == wolfssl_aes_gcm)
+             {
+                 /* finalize authentication cipher */
+ #if !defined(NO_PUBLIC_GCM_SET_IV) && \
+@@ -20020,7 +20021,17 @@ static WC_INLINE int Encrypt(WOLFSSL* ssl, byte* out, const byte* input,
+                 if (ssl->encrypt.nonce)
+                     ForceZero(ssl->encrypt.nonce, AESGCM_NONCE_SZ);
+             }
+-        #endif /* BUILD_AESGCM || HAVE_AESCCM || HAVE_ARIA */
++        #endif /* BUILD_AESGCM || HAVE_AESCCM */
++        #ifdef HAVE_ARIA
++            if (ssl->specs.bulk_cipher_algorithm == wolfssl_aria_gcm)
++            {
++                /* finalize authentication cipher — wc_AriaEncrypt is
++                 * stateless, so the explicit IV must always advance */
++                AeadIncrementExpIV(ssl);
++                if (ssl->encrypt.nonce)
++                    ForceZero(ssl->encrypt.nonce, AESGCM_NONCE_SZ);
++            }
++        #endif /* HAVE_ARIA */
+         #if defined(WOLFSSL_SM4_GCM) || defined(WOLFSSL_SM4_CCM)
+             if (ssl->specs.bulk_cipher_algorithm == wolfssl_sm4_ccm ||
+                 ssl->specs.bulk_cipher_algorithm == wolfssl_sm4_gcm)
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5446-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5446-2.patch
new file mode 100644
index 0000000000..9368ff3d0b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5446-2.patch
@@ -0,0 +1,27 @@
+From 88fc52b8e3bca58389a4a107a77f9dc52e3baa12 Mon Sep 17 00:00:00 2001
+From: Eric Blankenhorn <eric@wolfssl.com>
+Date: Tue, 31 Mar 2026 09:35:43 -0500
+Subject: [PATCH] Fix feedback from review
+
+(cherry picked from commit a3fad2af91da39e2a4bdaf528bcfb2a94c4dd67c)
+
+CVE: CVE-2026-5446
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/a3fad2af91da39e2a4bdaf528bcfb2a94c4dd67c]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/internal.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/internal.c b/src/internal.c
+index fbf227a93..ccfecc235 100644
+--- a/src/internal.c
++++ b/src/internal.c
+@@ -20025,7 +20025,7 @@ static WC_INLINE int Encrypt(WOLFSSL* ssl, byte* out, const byte* input,
+         #ifdef HAVE_ARIA
+             if (ssl->specs.bulk_cipher_algorithm == wolfssl_aria_gcm)
+             {
+-                /* finalize authentication cipher — wc_AriaEncrypt is
++                /* finalize authentication cipher -- wc_AriaEncrypt is
+                  * stateless, so the explicit IV must always advance */
+                 AeadIncrementExpIV(ssl);
+                 if (ssl->encrypt.nonce)
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index 7597c8390d..bad03c5f2a 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -31,6 +31,8 @@ SRC_URI = " \
     file://CVE-2026-3580.patch \
     file://CVE-2026-5188.patch \
     file://CVE-2026-5392.patch \
+    file://CVE-2026-5446-1.patch \
+    file://CVE-2026-5446-2.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

