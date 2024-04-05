Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC14BC67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 11:11:26 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.8404.1712315486065766103
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 04:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P9Af1s6E;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-343d6b55c42so817374f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 04:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712315484; x=1712920284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQXh5elNzqxnLBFIbzL/XMspBMB5GxnFYBNbf0k99pY=;
        b=P9Af1s6EGAQq8q6b8gakWCoMu21h/pdaTAE/W71ym6wG6yl8Lob6aa6vGY6i1NjaKW
         7o1/AYrvlzMEavL96548rfUVk9SbKMn12lMped6OblONqAjvU1iiCYaz0yZOh8ExzRLs
         O1AymeZMBv0AxwiMKf+2LcYF8ejlLqdE2wGSRJgBbCqBbgAjYLmPxfs1sMjtoRpSL12U
         dloh7OgTXVRi1PVrWtJep4TXzHwaBE7KuqJYJJmT9r6ekwcAahoqNZ2utZ5MIiBVuDtL
         E0QuuYIKvGC2R+Bg6AhMf4IdN3jVosvkYLXu+sgAzK4sYfV4OwErU5+lXr7RNlVhXDDo
         6HLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712315484; x=1712920284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQXh5elNzqxnLBFIbzL/XMspBMB5GxnFYBNbf0k99pY=;
        b=Qp4uhQZh39fe4WgnnFYnYnoWs+MRVyYvXL32u3S4GFoUnJBTY+2wDYMPfbF3Qi0MdH
         kQ+CYldIUzcs2YEeTMa9Y3oz1T5/7sdet0caC6BPa5R5mFtP8oO2IfJjCZ2upRXqcPij
         WC3XDxXqqFCr02hvpveLakj4ZREjVtTDa11eum8gpMJYKodpYWIfM3Lt91w81dE5bRUK
         4SThMQ94lqKm4P3J2CuG4c530rdkenblwVR6UNtCHAS/MOxg2LgVqAZfTivw/TwjITLc
         K86p8kW/fSRapEL4eTj8G7GEp5blYc8NhfiE/8fs2qQVYTqO5EJSj8O5qL+dYWBwjQeB
         CJMg==
X-Gm-Message-State: AOJu0YySCp/fZ56fcd+2iUXBSlErFtfgFKoeCcAPLcGCzu5hVUbc8l2b
	2GhmdpzLGCpw6lzItzvPwpMNorkgLGEnGSn4p99wcdQv42iBggzXDSXqOuqP
X-Google-Smtp-Source: AGHT+IE54EhUKe/3HWSixwX0rYxC3m2FruqYAtQ+Ey5d95X1JHlaUemn9vgkjLJAxy1K2B4n0uwkgw==
X-Received: by 2002:adf:ff8a:0:b0:33e:c528:c900 with SMTP id j10-20020adfff8a000000b0033ec528c900mr1087744wrr.55.1712315484042;
        Fri, 05 Apr 2024 04:11:24 -0700 (PDT)
Received: from swi-bsandu-l1.corp.ad.wrs.com (finc-23-b2-v4wan-163330-cust316.vm7.cable.virginm.net. [82.30.59.61])
        by smtp.gmail.com with ESMTPSA id z11-20020a5d654b000000b003437fec702dsm1773492wrv.21.2024.04.05.04.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 04:11:23 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: upgrade 3.5.2 -> 3.6.0
Date: Fri,  5 Apr 2024 12:10:53 +0100
Message-Id: <20240405111053.35069-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 11:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109819

This is an LTS release.

Includes security fixes:
* CVE-2024-28960 - Insecure handling of shared memory in PSA Crypto APIs

Full release notes:
https://github.com/Mbed-TLS/mbedtls/releases/tag/v3.6.0

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 ...t-attributes-for-x86-32-bit-intrinsi.patch | 87 -------------------
 .../{mbedtls_3.5.2.bb => mbedtls_3.6.0.bb}    |  8 +-
 2 files changed, 6 insertions(+), 89 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.5.2.bb => mbedtls_3.6.0.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch
deleted file mode 100644
index 5030fb99f..000000000
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 80d3e73ad0648f558a067a9dbfe3bc80e6b614f8 Mon Sep 17 00:00:00 2001
-From: Beniamin Sandu <beniaminsandu@gmail.com>
-Date: Mon, 30 Oct 2023 19:15:56 +0000
-Subject: [PATCH] AES-NI: use target attributes for x86 32-bit intrinsics
-
-This way we build with 32-bit gcc/clang out of the box.
-We also fallback to assembly for 64-bit clang-cl if needed cpu
-flags are not provided, instead of throwing an error.
-
-Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/800f2b7c020678a84abfa9688962b91c36e6693d]
-
-Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
----
- library/aesni.c | 20 ++++++++++++++++++++
- library/aesni.h |  8 +++++---
- 2 files changed, 25 insertions(+), 3 deletions(-)
-
-diff --git a/library/aesni.c b/library/aesni.c
-index 5f25a8249..481fa3822 100644
---- a/library/aesni.c
-+++ b/library/aesni.c
-@@ -41,6 +41,17 @@
- #include <immintrin.h>
- #endif
-
-+#if defined(MBEDTLS_ARCH_IS_X86)
-+#if defined(MBEDTLS_COMPILER_IS_GCC)
-+#pragma GCC push_options
-+#pragma GCC target ("pclmul,sse2,aes")
-+#define MBEDTLS_POP_TARGET_PRAGMA
-+#elif defined(__clang__)
-+#pragma clang attribute push (__attribute__((target("pclmul,sse2,aes"))), apply_to=function)
-+#define MBEDTLS_POP_TARGET_PRAGMA
-+#endif
-+#endif
-+
- #if !defined(MBEDTLS_AES_USE_HARDWARE_ONLY)
- /*
-  * AES-NI support detection routine
-@@ -396,6 +407,15 @@ static void aesni_setkey_enc_256(unsigned char *rk_bytes,
- }
- #endif /* !MBEDTLS_AES_ONLY_128_BIT_KEY_LENGTH */
-
-+#if defined(MBEDTLS_POP_TARGET_PRAGMA)
-+#if defined(__clang__)
-+#pragma clang attribute pop
-+#elif defined(__GNUC__)
-+#pragma GCC pop_options
-+#endif
-+#undef MBEDTLS_POP_TARGET_PRAGMA
-+#endif
-+
- #else /* MBEDTLS_AESNI_HAVE_CODE == 1 */
-
- #if defined(__has_feature)
-diff --git a/library/aesni.h b/library/aesni.h
-index ba1429029..37ae02c82 100644
---- a/library/aesni.h
-+++ b/library/aesni.h
-@@ -50,6 +50,10 @@
- #if defined(__GNUC__) && defined(__AES__) && defined(__PCLMUL__)
- #define MBEDTLS_AESNI_HAVE_INTRINSICS
- #endif
-+/* For 32-bit, we only support intrinsics */
-+#if defined(MBEDTLS_ARCH_IS_X86) && (defined(__GNUC__) || defined(__clang__))
-+#define MBEDTLS_AESNI_HAVE_INTRINSICS
-+#endif
-
- /* Choose the implementation of AESNI, if one is available.
-  *
-@@ -60,13 +64,11 @@
- #if defined(MBEDTLS_AESNI_HAVE_INTRINSICS)
- #define MBEDTLS_AESNI_HAVE_CODE 2 // via intrinsics
- #elif defined(MBEDTLS_HAVE_ASM) && \
--    defined(__GNUC__) && defined(MBEDTLS_ARCH_IS_X64)
-+    (defined(__GNUC__) || defined(__clang__)) && defined(MBEDTLS_ARCH_IS_X64)
- /* Can we do AESNI with inline assembly?
-  * (Only implemented with gas syntax, only for 64-bit.)
-  */
- #define MBEDTLS_AESNI_HAVE_CODE 1 // via assembly
--#elif defined(__GNUC__)
--#   error "Must use `-mpclmul -msse2 -maes` for MBEDTLS_AESNI_C"
- #else
- #error "MBEDTLS_AESNI_C defined, but neither intrinsics nor assembly available"
- #endif
---
-2.34.1
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
index d61c54edb..92a2de82a 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
@@ -23,10 +23,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "daca7a3979c22da155ec9dce49ab1abf3b65d3a9"
 SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=master \
-	file://0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch \
+	git://github.com/Mbed-TLS/mbedtls-framework.git;protocol=https;branch=main;destsuffix=git/framework;name=framework \
 	file://run-ptest"
+
+SRCREV = "2ca6c285a0dd3f33982dd57299012dacab1ff206"
+SRCREV_framework = "750634d3a51eb9d61b59fd5d801546927c946588"
+SRCREV_FORMAT .= "_framework"
+
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake update-alternatives ptest
-- 
2.34.1


