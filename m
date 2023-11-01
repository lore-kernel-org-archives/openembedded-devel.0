Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C7FC4167D
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 19:27:03 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.37595.1698866816045342628
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 12:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d5dc3+bL;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: beniaminsandu@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-507bd64814fso92402e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 12:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698866814; x=1699471614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qpfvXN6oNL0p6oihdDocs6c1M8dGXTgSFZGce+p7ZvY=;
        b=d5dc3+bL+rxMrc8rH1gRXDNcc0/gtcY60zLHnzhYqyDQuW5f+eq7HzyUkunTyWZkcn
         +5a4wIvAry9Bilpik46YZQcOGQv68DGuFfLVTMpHeXn4fRi7ww7jG8kwaNkFptCfjARz
         FU0XYLduscadZ30s3ylMuADkG1dnc35IczUbh+vs1tTVw4r9Rxdbjg2Gq5sIluWv+lKS
         YVJ2S3MImapL1hsIBiyrQshWqijwITnh19o9HHlg22trVZyjKjcQ0ykpFpNdeLKmZ5QC
         Y140fl7BF3lMf6e6LJYiFEp8q0RU73YBcT+7R7Juddtr2mvQ0H64kRM+pw+1h9tZXqzN
         MyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698866814; x=1699471614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpfvXN6oNL0p6oihdDocs6c1M8dGXTgSFZGce+p7ZvY=;
        b=jl2zRZ6MGi+QOkjQuXKWRNc9H27md6SM12P9Y7jMAcsC61vHFa/S3MiuLRH8s+/SWN
         zdVZgXm4cRFa/phMmES9d9si11CS9lPb5YL5J15vEHyuuZLjt3/mz8Nz3b6RAoKQ9uoU
         S6hOyodbpFD4S597YsQkQrLXkXHsrLPl4PP3ioaEHIVpQbaK04icn4tfGOSjp/9x6KgO
         IsWMiKy/uYnirwLk6B+7+7HRE8YXo9/E2xBElyz2zPXH4kzVXfXGVxcxzPlLjCgnyJTd
         JWQuRN9mBAlfTJvVkyzxZzPH3anP0IhOTLErhGLyY8L7c7oHUKOvucXhs2Tm3eDfaCv/
         kn7Q==
X-Gm-Message-State: AOJu0YzUw8Cs8o9h+OHqwTyT4Ks7fTe6gYQ+ykCmmzIFKC72FII9J4Ni
	h9jggu/x5NdbRDSuQKGmJBOdicb1PcUN6g==
X-Google-Smtp-Source: AGHT+IGyeN337t9ETCY2BDq7y61zBbibHgIipLOIz5e+2J0akDa7kcZ966eim7mf34XUJ0GGFgN2ng==
X-Received: by 2002:ac2:47f4:0:b0:507:9784:644d with SMTP id b20-20020ac247f4000000b005079784644dmr11560403lfp.15.1698866813808;
        Wed, 01 Nov 2023 12:26:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:8855:a800:7caf:ea75:b126:ca8f])
        by smtp.gmail.com with ESMTPSA id d12-20020a056000114c00b0032d2489a399sm539698wrx.49.2023.11.01.12.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 12:26:53 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][kirkstone][PATCH] mbedtls: upgrade 3.4.0 -> 3.5.0
Date: Wed,  1 Nov 2023 19:26:29 +0000
Message-Id: <20231101192629.517192-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 19:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105825

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
 .../{mbedtls_3.4.0.bb => mbedtls_3.5.0.bb}    | 10 +--
 4 files changed, 89 insertions(+), 75 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch
 delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
 delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.4.0.bb => mbedtls_3.5.0.bb} (87%)

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
index d98d8fa57..000000000
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
-Upstream-Status: Submitted [https://github.com/Mbed-TLS/mbedtls/pull/7834]
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
index 4775c8ddb..000000000
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
-Upstream-Status: Pending
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
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
similarity index 87%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
index 3a355bb43..d57e717bd 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
@@ -23,10 +23,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
+SRCREV = "1ec69067fa1351427f904362c1221b31538c8b57"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
-	file://0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch \
-	file://0002-aesce-use-correct-target-attribute-when-building-wit.patch \
+	file://0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch \
 	file://run-ptest"
 
 inherit cmake update-alternatives ptest
@@ -61,11 +60,6 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "mbed_tls"
 
-# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310
-CVE_CHECK_IGNORE += "CVE-2021-43666"
-# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c
-CVE_CHECK_IGNORE += "CVE-2021-45451"
-
 # Strip host paths from autogenerated test files
 do_compile:append() {
 	sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
-- 
2.34.1


