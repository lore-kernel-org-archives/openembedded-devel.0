Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADDEC4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 21:20:15 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.171509.1698700813433992931
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Oct 2023 14:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jGaHsstn;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-32f9268bf8cso242168f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 14:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698700812; x=1699305612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o1WzNPNf9rVjDKtf8+wABUlNvtV6cKROKPSR0NCCN8Y=;
        b=jGaHsstnwQTE+pShequAetInb+4ygJrmPWmKLiaXZzgtnYicZMNfCU7WmwXO61RBHk
         vOFoR6mbclFLqwcjSPguyahTrFANJWzvjvyM6T9Y132hzhyE3/VZgXIyIHJZhMMdcjnL
         RqLTVWwf+vwfHC+H6xb9oUCdDTTwOtSN3lFF+9TcXRDCXWs3NPxZASqE6AHM8TOypGYM
         dD/Bi5uUS2InsVI8a7H8wVzw2bAPqL3EAo6HkjX3rXL0S7TgF2w890ZV0+fnLCkKorPC
         O3n7mE3yzCELVOdLK+7/nxvzQmvjZQWqOUI7KEBhaYzK3Q+dbMi5R2LnCNCve3Iag4lY
         i/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698700812; x=1699305612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1WzNPNf9rVjDKtf8+wABUlNvtV6cKROKPSR0NCCN8Y=;
        b=i4vc9WtzSWx3emFEpjogxeQUovDuFISAHOVaDRKq8vZ7gpyd+ybmqfuYyXjgED5yON
         kIsKYT+M77RqsVpz2FtaHZjsEqYBs8bfzSWT7Fi8NhTbXX1Vr25r/UYKOQU0l/GRjwox
         2rwVZVnA0LJEceCxZ9aihkRScZozvS5q6k+eBY7fThqnoatn4soqsA3jg45GPd2ty1h1
         C5sFmNLMrW3Uv+6gyJXMTRjzZ4iB7gzmiPu5DdMPKRXlzx7yoQMSbI5tRoFiBZd1riSs
         yu9aF9oYv8MVdhy88s5zp5NDhwOKiuvsmFO5yBy2UesTtpdP+c/jxBuG7seM2OvB7JBO
         bT8w==
X-Gm-Message-State: AOJu0YydyZywyHW3yYXq0RIZioez72wv+Gzque2r/+9bZBdpzxqQIx7i
	HM9lb0JHv1o1cf4bxZkNI/T7TCtejT4=
X-Google-Smtp-Source: AGHT+IHXU479xPlA22YYamaQ4W7Yn/IOq4OlrE+5w0qkLEpqxfC6ZRu8kZ7QVkTqs9RaeATS5F8XUg==
X-Received: by 2002:a05:6000:1564:b0:32f:8096:bbe3 with SMTP id 4-20020a056000156400b0032f8096bbe3mr5162545wrz.29.1698700811549;
        Mon, 30 Oct 2023 14:20:11 -0700 (PDT)
Received: from uk-l1.corp.ad.wrs.com ([2a01:4b00:8855:a800:d655:f4ae:76b8:f24d])
        by smtp.gmail.com with ESMTPSA id d14-20020a5d4f8e000000b0032d96dd703bsm8994905wru.70.2023.10.30.14.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 14:20:10 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH v4] mbedtls: upgrade 3.4.1 -> 3.5.0
Date: Mon, 30 Oct 2023 21:19:41 +0000
Message-Id: <20231030211941.313905-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 21:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105798

* Includes security fix for CVE-2023-43615 - Buffer overread in TLS stream cipher suites
* Includes security fix for CVE-2023-45199 - Buffer overflow in TLS handshake parsing with ECDH
* Includes aesce compilation fixes

Full changelog: https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.5.0

The extra patch fixes x86 32-bit builds.

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 ...t-attributes-for-x86-32-bit-intrinsi.patch | 87 +++++++++++++++++++
 ...cify-an-arch-version-when-enabling-c.patch | 33 -------
 ...t-target-attribute-when-building-wit.patch | 34 --------
 .../{mbedtls_3.4.1.bb => mbedtls_3.5.0.bb}    |  5 +-
 4 files changed, 89 insertions(+), 70 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch
 delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
 delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.4.1.bb => mbedtls_3.5.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch
new file mode 100644
index 000000000..5030fb99f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch
@@ -0,0 +1,87 @@
+From 80d3e73ad0648f558a067a9dbfe3bc80e6b614f8 Mon Sep 17 00:00:00 2001
+From: Beniamin Sandu <beniaminsandu@gmail.com>
+Date: Mon, 30 Oct 2023 19:15:56 +0000
+Subject: [PATCH] AES-NI: use target attributes for x86 32-bit intrinsics
+
+This way we build with 32-bit gcc/clang out of the box.
+We also fallback to assembly for 64-bit clang-cl if needed cpu
+flags are not provided, instead of throwing an error.
+
+Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/800f2b7c020678a84abfa9688962b91c36e6693d]
+
+Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
+---
+ library/aesni.c | 20 ++++++++++++++++++++
+ library/aesni.h |  8 +++++---
+ 2 files changed, 25 insertions(+), 3 deletions(-)
+
+diff --git a/library/aesni.c b/library/aesni.c
+index 5f25a8249..481fa3822 100644
+--- a/library/aesni.c
++++ b/library/aesni.c
+@@ -41,6 +41,17 @@
+ #include <immintrin.h>
+ #endif
+
++#if defined(MBEDTLS_ARCH_IS_X86)
++#if defined(MBEDTLS_COMPILER_IS_GCC)
++#pragma GCC push_options
++#pragma GCC target ("pclmul,sse2,aes")
++#define MBEDTLS_POP_TARGET_PRAGMA
++#elif defined(__clang__)
++#pragma clang attribute push (__attribute__((target("pclmul,sse2,aes"))), apply_to=function)
++#define MBEDTLS_POP_TARGET_PRAGMA
++#endif
++#endif
++
+ #if !defined(MBEDTLS_AES_USE_HARDWARE_ONLY)
+ /*
+  * AES-NI support detection routine
+@@ -396,6 +407,15 @@ static void aesni_setkey_enc_256(unsigned char *rk_bytes,
+ }
+ #endif /* !MBEDTLS_AES_ONLY_128_BIT_KEY_LENGTH */
+
++#if defined(MBEDTLS_POP_TARGET_PRAGMA)
++#if defined(__clang__)
++#pragma clang attribute pop
++#elif defined(__GNUC__)
++#pragma GCC pop_options
++#endif
++#undef MBEDTLS_POP_TARGET_PRAGMA
++#endif
++
+ #else /* MBEDTLS_AESNI_HAVE_CODE == 1 */
+
+ #if defined(__has_feature)
+diff --git a/library/aesni.h b/library/aesni.h
+index ba1429029..37ae02c82 100644
+--- a/library/aesni.h
++++ b/library/aesni.h
+@@ -50,6 +50,10 @@
+ #if defined(__GNUC__) && defined(__AES__) && defined(__PCLMUL__)
+ #define MBEDTLS_AESNI_HAVE_INTRINSICS
+ #endif
++/* For 32-bit, we only support intrinsics */
++#if defined(MBEDTLS_ARCH_IS_X86) && (defined(__GNUC__) || defined(__clang__))
++#define MBEDTLS_AESNI_HAVE_INTRINSICS
++#endif
+
+ /* Choose the implementation of AESNI, if one is available.
+  *
+@@ -60,13 +64,11 @@
+ #if defined(MBEDTLS_AESNI_HAVE_INTRINSICS)
+ #define MBEDTLS_AESNI_HAVE_CODE 2 // via intrinsics
+ #elif defined(MBEDTLS_HAVE_ASM) && \
+-    defined(__GNUC__) && defined(MBEDTLS_ARCH_IS_X64)
++    (defined(__GNUC__) || defined(__clang__)) && defined(MBEDTLS_ARCH_IS_X64)
+ /* Can we do AESNI with inline assembly?
+  * (Only implemented with gas syntax, only for 64-bit.)
+  */
+ #define MBEDTLS_AESNI_HAVE_CODE 1 // via assembly
+-#elif defined(__GNUC__)
+-#   error "Must use `-mpclmul -msse2 -maes` for MBEDTLS_AESNI_C"
+ #else
+ #error "MBEDTLS_AESNI_C defined, but neither intrinsics nor assembly available"
+ #endif
+--
+2.34.1
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
deleted file mode 100644
index 44d74754c..000000000
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 2246925e3cb16183e25d4e2cfd13fb800df86270 Mon Sep 17 00:00:00 2001
-From: Beniamin Sandu <beniaminsandu@gmail.com>
-Date: Sun, 25 Jun 2023 19:58:08 +0300
-Subject: [PATCH] aesce: do not specify an arch version when enabling crypto
- instructions
-
-Building mbedtls with different aarch64 tuning variations revealed
-that we should use the crypto extensions without forcing a particular
-architecture version or core, as that can create issues.
-
-Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/471a975942dec76bf0ccb92b6c6da055385683fb]
-
-Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
----
- library/aesce.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/library/aesce.c b/library/aesce.c
-index fe056dc4c..843de3973 100644
---- a/library/aesce.c
-+++ b/library/aesce.c
-@@ -60,7 +60,7 @@
- #           error "A more recent GCC is required for MBEDTLS_AESCE_C"
- #       endif
- #       pragma GCC push_options
--#       pragma GCC target ("arch=armv8-a+crypto")
-+#       pragma GCC target ("+crypto")
- #       define MBEDTLS_POP_TARGET_PRAGMA
- #   else
- #       error "Only GCC and Clang supported for MBEDTLS_AESCE_C"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
deleted file mode 100644
index c8f6cb750..000000000
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 03d3523f974536f2358047382aadb0d4cc762f8a Mon Sep 17 00:00:00 2001
-From: Beniamin Sandu <beniaminsandu@gmail.com>
-Date: Mon, 26 Jun 2023 12:07:21 +0300
-Subject: [PATCH] aesce: use correct target attribute when building with clang
-
-Seems clang has its own issues when it comes to crypto extensions,
-and right now the best way to avoid them is to accurately enable
-the needed instructions instead of the broad crypto feature.
-
-E.g.: https://github.com/llvm/llvm-project/issues/61645
-
-Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/aa4f6219014d863bed51453e5261178adc66be34]
-
-Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
----
- library/aesce.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/library/aesce.c b/library/aesce.c
-index 843de3973..7bea088ba 100644
---- a/library/aesce.c
-+++ b/library/aesce.c
-@@ -53,7 +53,7 @@
- #       if __clang_major__ < 4
- #           error "A more recent Clang is required for MBEDTLS_AESCE_C"
- #       endif
--#       pragma clang attribute push (__attribute__((target("crypto"))), apply_to=function)
-+#       pragma clang attribute push (__attribute__((target("aes"))), apply_to=function)
- #       define MBEDTLS_POP_TARGET_PRAGMA
- #   elif defined(__GNUC__)
- #       if __GNUC__ < 6
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
index a6f8583b2..5f284227e 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
@@ -23,10 +23,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "72718dd87e087215ce9155a826ee5a66cfbe9631"
+SRCREV = "1ec69067fa1351427f904362c1221b31538c8b57"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
-	file://0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch \
-	file://0002-aesce-use-correct-target-attribute-when-building-wit.patch \
+	file://0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch \
 	file://run-ptest"
 
 inherit cmake update-alternatives ptest
-- 
2.34.1


