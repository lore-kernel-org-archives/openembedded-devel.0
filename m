Return-Path: <lianux.mm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB697C44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 08:08:54 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7917.1784189334288432002
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 01:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jna60TOi;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: lianux.mm@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cab973140bso76482595ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 01:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784189334; x=1784794134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3k6hbS0a/BJtFciAM5jZtgTS1AU/qKEhgdNJRvSnX6g=;
        b=Jna60TOiTCxGP+6L8izvi3osUMNODvSm7GqzavSH3OY4NhflOSkRvwO84WwxqRETN0
         QZKoEKdfjOsOtOfPeTJV66ztp5wPcf/FUnv4bMQG1N1HabSverCq6aRsZ+czp52dtkZr
         o7eNdVdQWIIqkaq3LwFVfCLV2f/Oq/elz2SoovYGmLj1VKEjyX/7ThKHFYQCqe4nD88p
         byImO60Zh40n4cNgmICqe+eFaOaV0CQW0yJZm0yzZKB8YjU38OcLjoyQeZo4CONPbVq0
         fj3MQfRbbmVZd3FqrAGToM0ybzr4MYILp7x6VJStvBBLrjMEwyb5xY9MmJr80cxKnpbf
         JkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784189334; x=1784794134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3k6hbS0a/BJtFciAM5jZtgTS1AU/qKEhgdNJRvSnX6g=;
        b=hqZu8g4uHdp/JRpXnG46ceFxePucIBpZ5zooOCgJjEoKjNVlAxdIC1IgPKS76mwD37
         +eTj+7m1jASq5q0CK7NwfgRDZRYkolUpygxUMr4/ktdS0daukXN4J5Q4ZQ1bJWf7RHV7
         jcRyzkjEiSS2VCxQ2oSGsevE8ZgX9T+dug+aga+BX+mvS48bJmIdY2+xSWb3dBG5VvVs
         9PvotBS+8scbqo6lJj4nuzEDuker8/dOLGibm6aOnx2Cnpz3ioZulT3pcKsDmxnJJoxL
         o75HzrZhr6Q16POExD3LL9dO/cmrFxoCMpUhcIIKeOxdOIBgk2prcH9kxoBS/MVuqUP0
         cV0w==
X-Gm-Message-State: AOJu0YxTO312nL/RPPm98fIvGGJYsvekQi3HhiSthOQGKK7JQcKq6hcT
	x+jfem3qBbuq08dd/FtESGXCsieIPFaa6hAPwVlAr7ygau+ootoK48gwKVhhbbJ5T4F2OQ==
X-Gm-Gg: AfdE7clv1BQJrWGe5ldIvK4aB/WnfCHwU1NURIfrFcbbLeXvvann00RXfJTXskJpMR9
	JFx6/otFgBl7E495hjjFtXsYQWOGsHCyVo95SPN8tyQ6RG0UqB4oVYtH1ujlWma3u0lKhYxB3ER
	tEE5gRERyBpLWwWWsW4w0hZxk5G90q2dKC9A3w30Gi9WkvSqkiSMSiIF5oHywPpZ6BSU2LFBTiA
	j8UTNJiVcc7xrXI2/bGiXCjKPqAeZoCRUP1PaRuIC/uHRyaa1yBwlktDSTphOSEuUc4/oekp8gh
	LEDDVt9xhtKWNZxVzzVBnYk09D1FlOsP0DlUYPBRT4ytfL4hoiBTwfblpAYcownoxjEP4OF70dU
	pfPUUqUo053555zdrE5IcKlKSgnUC89ftc8W7fih99W6ueZbY+lHIIoO1TNaAHY2G+D/5bwre7J
	ckySzdDr9itA==
X-Received: by 2002:a17:902:cccb:b0:2cc:e620:e307 with SMTP id d9443c01a7336-2cf03c3a4a1mr57918615ad.20.1784189333273;
        Thu, 16 Jul 2026 01:08:53 -0700 (PDT)
Received: from localhost.localdomain ([2605:a141:2231:7698::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf105b4f78sm16401185ad.62.2026.07.16.01.08.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 01:08:52 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
X-Google-Original-From: Lian Wang <lianux.wang@processmission.com>
To: openembedded-devel@lists.openembedded.org
Cc: Lian Wang <lianux.wang@processmission.com>
Subject: [PATCH 1/2] wolfssl: upgrade 5.7.2 -> 5.9.2
Date: Thu, 16 Jul 2026 16:08:39 +0800
Message-ID: <20260716080840.19806-1-lianux.wang@processmission.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 08:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128230

- Drop 9 CVE patches (CVE-2025-7394, CVE-2025-7395) fixed upstream
- All security fixes included in 5.9.2 release

Signed-off-by: Lian Wang <lianux.wang@processmission.com>
---
 .../wolfssl/files/CVE-2025-7394-1.patch       |  46 ---
 .../wolfssl/files/CVE-2025-7394-2.patch       | 275 ------------------
 .../wolfssl/files/CVE-2025-7394-3.patch       | 125 --------
 .../wolfssl/files/CVE-2025-7394-4.patch       |  85 ------
 .../wolfssl/files/CVE-2025-7394-5.patch       |  40 ---
 .../wolfssl/files/CVE-2025-7394-6.patch       |  48 ---
 .../wolfssl/files/CVE-2025-7395-1.patch       |  84 ------
 .../wolfssl/files/CVE-2025-7395-2.patch       |  27 --
 .../wolfssl/files/CVE-2025-7395-3.patch       |  25 --
 .../{wolfssl_5.7.2.bb => wolfssl_5.9.2.bb}    |  11 +-
 10 files changed, 1 insertion(+), 765 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patch
 delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patch
 delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patch
 delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patch
 delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patch
 delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patch
 delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
 delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch
 delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.7.2.bb => wolfssl_5.9.2.bb} (78%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patch
deleted file mode 100644
index e561b26..0000000
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 6d0ee56813d69eee72108e1dc859743e02f70077 Mon Sep 17 00:00:00 2001
-From: Josh Holtrop <josh@wolfssl.com>
-Date: Thu, 5 Jun 2025 19:48:34 -0400
-Subject: [PATCH] Reseed DRBG in RAND_poll()
-
-CVE: CVE-2025-7394
-Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/0c12337194ee6dd082f082f0ccaed27fc4ee44f5]
-(cherry picked from commit 0c12337194ee6dd082f082f0ccaed27fc4ee44f5)
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/ssl.c | 20 +++++++++++++++++---
- 1 file changed, 17 insertions(+), 3 deletions(-)
-
-diff --git a/src/ssl.c b/src/ssl.c
-index 9ba891d62..a1421d523 100644
---- a/src/ssl.c
-+++ b/src/ssl.c
-@@ -24159,11 +24159,25 @@ int wolfSSL_RAND_poll(void)
-         return  WOLFSSL_FAILURE;
-     }
-     ret = wc_GenerateSeed(&globalRNG.seed, entropy, entropy_sz);
--    if (ret != 0){
-+    if (ret != 0) {
-         WOLFSSL_MSG("Bad wc_RNG_GenerateBlock");
-         ret = WOLFSSL_FAILURE;
--    }else
--        ret = WOLFSSL_SUCCESS;
-+    }
-+    else {
-+#ifdef HAVE_HASHDRBG
-+        ret = wc_RNG_DRBG_Reseed(&globalRNG, entropy, entropy_sz);
-+        if (ret != 0) {
-+            WOLFSSL_MSG("Error reseeding DRBG");
-+            ret = WOLFSSL_FAILURE;
-+        }
-+        else {
-+            ret = WOLFSSL_SUCCESS;
-+        }
-+#else
-+        WOLFSSL_MSG("RAND_poll called with HAVE_HASHDRBG not set");
-+        ret = WOLFSSL_FAILURE;
-+#endif
-+    }
- 
-     return ret;
- }
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patch
deleted file mode 100644
index 883a5a1..0000000
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patch
+++ /dev/null
@@ -1,275 +0,0 @@
-From b506ed4aeb2c86788422427624a03eb9bda52efc Mon Sep 17 00:00:00 2001
-From: JacobBarthelmeh <jacob@wolfssl.com>
-Date: Tue, 10 Jun 2025 12:49:08 -0600
-Subject: [PATCH] add sanity checks on pid with RNG
-
-CVE: CVE-2025-7394
-Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/31490ab813a5aac096f50800c26c690d8ae586d2]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- CMakeLists.txt             |   1 +
- configure.ac               |   4 +-
- src/ssl.c                  |  40 +++++++++++-
- wolfcrypt/src/random.c     | 126 ++++++++++++++++++++++---------------
- wolfssl/wolfcrypt/random.h |   3 +
- 5 files changed, 118 insertions(+), 56 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4e6f05fc6..910a36648 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -124,6 +124,7 @@ check_function_exists("memset" HAVE_MEMSET)
- check_function_exists("socket" HAVE_SOCKET)
- check_function_exists("strftime" HAVE_STRFTIME)
- check_function_exists("__atomic_fetch_add" HAVE_C___ATOMIC)
-+check_function_exists("getpid" HAVE_GETPID)
- 
- include(CheckTypeSize)
- 
-diff --git a/configure.ac b/configure.ac
-index c973b7e39..43ddd4767 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -125,8 +125,8 @@ AC_CHECK_HEADER(stdatomic.h, [AM_CPPFLAGS="$AM_CPPFLAGS -DWOLFSSL_HAVE_ATOMIC_H"
- # check if functions of interest are linkable, but also check if
- # they're declared by the expected headers, and if not, supersede the
- # unusable positive from AC_CHECK_FUNCS().
--AC_CHECK_FUNCS([gethostbyname getaddrinfo gettimeofday gmtime_r gmtime_s inet_ntoa memset socket strftime atexit])
--AC_CHECK_DECLS([gethostbyname, getaddrinfo, gettimeofday, gmtime_r, gmtime_s, inet_ntoa, memset, socket, strftime, atexit], [], [
-+AC_CHECK_FUNCS([gethostbyname getaddrinfo gettimeofday gmtime_r gmtime_s inet_ntoa memset socket strftime atexit getpid])
-+AC_CHECK_DECLS([gethostbyname, getaddrinfo, gettimeofday, gmtime_r, gmtime_s, inet_ntoa, memset, socket, strftime, atexit, getpid], [], [
- if test "$(eval echo \$"$(eval 'echo ac_cv_func_${as_decl_name}')")" = "yes"
- then
-     AC_MSG_NOTICE([    note: earlier check for $(eval 'echo ${as_decl_name}') superseded.])
-diff --git a/src/ssl.c b/src/ssl.c
-index a1421d523..872aed594 100644
---- a/src/ssl.c
-+++ b/src/ssl.c
-@@ -23615,6 +23615,10 @@ int wolfSSL_RAND_Init(void)
-         if (initGlobalRNG == 0) {
-             ret = wc_InitRng(&globalRNG);
-             if (ret == 0) {
-+            #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
-+                FIPS_VERSION3_LT(6,0,0)))
-+                currentPid = getpid();
-+            #endif
-                 initGlobalRNG = 1;
-                 ret = WOLFSSL_SUCCESS;
-             }
-@@ -24045,8 +24049,30 @@ int wolfSSL_RAND_pseudo_bytes(unsigned char* buf, int num)
-     return ret;
- }
- 
--/* returns WOLFSSL_SUCCESS if the bytes generated are valid otherwise
-- * WOLFSSL_FAILURE */
-+#if defined(HAVE_GETPID) && defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)))
-+/* In older FIPS bundles add check for reseed here since it does not exist in
-+ * the older random.c certified files. */
-+static pid_t currentPid = 0;
-+
-+/* returns WOLFSSL_SUCCESS on success and WOLFSSL_FAILURE on failure */
-+static int RandCheckReSeed()
-+{
-+    int ret = WOLFSSL_SUCCESS;
-+    pid_t p;
-+
-+    p = getpid();
-+    if (p != currentPid) {
-+        currentPid = p;
-+        if (wolfSSL_RAND_poll() != WOLFSSL_SUCCESS) {
-+            ret = WOLFSSL_FAILURE;
-+        }
-+    }
-+    return ret;
-+}
-+#endif
-+
-+/* returns WOLFSSL_SUCCESS (1) if the bytes generated are valid otherwise 0
-+ * on failure */
- int wolfSSL_RAND_bytes(unsigned char* buf, int num)
- {
-     int     ret = 0;
-@@ -24089,6 +24115,16 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int num)
-          */
-         if (initGlobalRNG) {
-             rng = &globalRNG;
-+
-+        #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
-+                FIPS_VERSION3_LT(6,0,0)))
-+            if (RandCheckReSeed() != WOLFSSL_SUCCESS) {
-+                wc_UnLockMutex(&globalRNGMutex);
-+                WOLFSSL_MSG("Issue with check pid and reseed");
-+                return ret;
-+            }
-+        #endif
-+
-             used_global = 1;
-         }
-         else {
-diff --git a/wolfcrypt/src/random.c b/wolfcrypt/src/random.c
-index 89c7411c9..b440e274b 100644
---- a/wolfcrypt/src/random.c
-+++ b/wolfcrypt/src/random.c
-@@ -1599,6 +1599,9 @@ static int _InitRng(WC_RNG* rng, byte* nonce, word32 nonceSz,
- #else
-     rng->heap = heap;
- #endif
-+#ifdef HAVE_GETPID
-+    rng->pid = getpid();
-+#endif
- #if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)
-     rng->devId = devId;
-     #if defined(WOLF_CRYPTO_CB)
-@@ -1849,6 +1852,63 @@ int wc_InitRngNonce_ex(WC_RNG* rng, byte* nonce, word32 nonceSz,
-     return _InitRng(rng, nonce, nonceSz, heap, devId);
- }
- 
-+#ifdef HAVE_HASHDRBG
-+static int PollAndReSeed(WC_RNG* rng)
-+{
-+    int ret   = DRBG_NEED_RESEED;
-+    int devId = INVALID_DEVID;
-+#if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)
-+    devId = rng->devId;
-+#endif
-+    if (wc_RNG_HealthTestLocal(1, rng->heap, devId) == 0) {
-+    #ifndef WOLFSSL_SMALL_STACK
-+        byte newSeed[SEED_SZ + SEED_BLOCK_SZ];
-+        ret = DRBG_SUCCESS;
-+    #else
-+        byte* newSeed = (byte*)XMALLOC(SEED_SZ + SEED_BLOCK_SZ, rng->heap,
-+            DYNAMIC_TYPE_SEED);
-+        ret = (newSeed == NULL) ? MEMORY_E : DRBG_SUCCESS;
-+    #endif
-+        if (ret == DRBG_SUCCESS) {
-+        #ifdef WC_RNG_SEED_CB
-+            if (seedCb == NULL) {
-+                ret = DRBG_NO_SEED_CB;
-+            }
-+            else {
-+                ret = seedCb(&rng->seed, newSeed, SEED_SZ + SEED_BLOCK_SZ);
-+                if (ret != 0) {
-+                    ret = DRBG_FAILURE;
-+                }
-+            }
-+        #else
-+            ret = wc_GenerateSeed(&rng->seed, newSeed,
-+                              SEED_SZ + SEED_BLOCK_SZ);
-+        #endif
-+            if (ret != 0)
-+                ret = DRBG_FAILURE;
-+        }
-+        if (ret == DRBG_SUCCESS)
-+            ret = wc_RNG_TestSeed(newSeed, SEED_SZ + SEED_BLOCK_SZ);
-+
-+        if (ret == DRBG_SUCCESS)
-+            ret = Hash_DRBG_Reseed((DRBG_internal *)rng->drbg,
-+                                   newSeed + SEED_BLOCK_SZ, SEED_SZ);
-+    #ifdef WOLFSSL_SMALL_STACK
-+        if (newSeed != NULL) {
-+            ForceZero(newSeed, SEED_SZ + SEED_BLOCK_SZ);
-+        }
-+        XFREE(newSeed, rng->heap, DYNAMIC_TYPE_SEED);
-+    #else
-+        ForceZero(newSeed, sizeof(newSeed));
-+    #endif
-+    }
-+    else {
-+        ret = DRBG_CONT_FAILURE;
-+    }
-+
-+    return ret;
-+}
-+#endif
- 
- /* place a generated block in output */
- WOLFSSL_ABI
-@@ -1908,60 +1968,22 @@ int wc_RNG_GenerateBlock(WC_RNG* rng, byte* output, word32 sz)
-     if (rng->status != DRBG_OK)
-         return RNG_FAILURE_E;
- 
-+#ifdef HAVE_GETPID
-+    if (rng->pid != getpid()) {
-+        rng->pid = getpid();
-+        ret = PollAndReSeed(rng);
-+        if (ret != DRBG_SUCCESS) {
-+            rng->status = DRBG_FAILED;
-+            return RNG_FAILURE_E;
-+        }
-+    }
-+#endif
-+
-     ret = Hash_DRBG_Generate((DRBG_internal *)rng->drbg, output, sz);
-     if (ret == DRBG_NEED_RESEED) {
--        int devId = INVALID_DEVID;
--    #if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)
--        devId = rng->devId;
--    #endif
--        if (wc_RNG_HealthTestLocal(1, rng->heap, devId) == 0) {
--        #ifndef WOLFSSL_SMALL_STACK
--            byte newSeed[SEED_SZ + SEED_BLOCK_SZ];
--            ret = DRBG_SUCCESS;
--        #else
--            byte* newSeed = (byte*)XMALLOC(SEED_SZ + SEED_BLOCK_SZ, rng->heap,
--                DYNAMIC_TYPE_SEED);
--            ret = (newSeed == NULL) ? MEMORY_E : DRBG_SUCCESS;
--        #endif
--            if (ret == DRBG_SUCCESS) {
--            #ifdef WC_RNG_SEED_CB
--                if (seedCb == NULL) {
--                    ret = DRBG_NO_SEED_CB;
--                }
--                else {
--                    ret = seedCb(&rng->seed, newSeed, SEED_SZ + SEED_BLOCK_SZ);
--                    if (ret != 0) {
--                        ret = DRBG_FAILURE;
--                    }
--                }
--            #else
--                ret = wc_GenerateSeed(&rng->seed, newSeed,
--                                  SEED_SZ + SEED_BLOCK_SZ);
--            #endif
--                if (ret != 0)
--                    ret = DRBG_FAILURE;
--            }
--            if (ret == DRBG_SUCCESS)
--                ret = wc_RNG_TestSeed(newSeed, SEED_SZ + SEED_BLOCK_SZ);
--
--            if (ret == DRBG_SUCCESS)
--                ret = Hash_DRBG_Reseed((DRBG_internal *)rng->drbg,
--                                       newSeed + SEED_BLOCK_SZ, SEED_SZ);
--            if (ret == DRBG_SUCCESS)
--                ret = Hash_DRBG_Generate((DRBG_internal *)rng->drbg, output, sz);
--
--        #ifdef WOLFSSL_SMALL_STACK
--            if (newSeed != NULL) {
--                ForceZero(newSeed, SEED_SZ + SEED_BLOCK_SZ);
--            }
--            XFREE(newSeed, rng->heap, DYNAMIC_TYPE_SEED);
--        #else
--            ForceZero(newSeed, sizeof(newSeed));
--        #endif
--        }
--        else {
--            ret = DRBG_CONT_FAILURE;
--        }
-+        ret = PollAndReSeed(rng);
-+        if (ret == DRBG_SUCCESS)
-+            ret = Hash_DRBG_Generate((DRBG_internal *)rng->drbg, output, sz);
-     }
- 
-     if (ret == DRBG_SUCCESS) {
-diff --git a/wolfssl/wolfcrypt/random.h b/wolfssl/wolfcrypt/random.h
-index 9dd616328..f472e1f40 100644
---- a/wolfssl/wolfcrypt/random.h
-+++ b/wolfssl/wolfcrypt/random.h
-@@ -183,6 +183,9 @@ struct WC_RNG {
- #endif
-     byte status;
- #endif
-+#ifdef HAVE_GETPID
-+    pid_t pid;
-+#endif
- #ifdef WOLFSSL_ASYNC_CRYPT
-     WC_ASYNC_DEV asyncDev;
- #endif
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patch
deleted file mode 100644
index e70a3fe..0000000
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 62a3a4f0b8b307bdacc34204db44627521de4bf9 Mon Sep 17 00:00:00 2001
-From: JacobBarthelmeh <jacob@wolfssl.com>
-Date: Tue, 10 Jun 2025 14:15:38 -0600
-Subject: [PATCH] add mutex locking and compat layer FIPS case
-
-CVE: CVE-2025-7394
-Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/fbbb6b7707f7f8ae1c38ab68daec0af02ee0208a]
-(cherry picked from commit fbbb6b7707f7f8ae1c38ab68daec0af02ee0208a)
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/ssl.c | 62 +++++++++++++++++++++++++++----------------------------
- 1 file changed, 31 insertions(+), 31 deletions(-)
-
-diff --git a/src/ssl.c b/src/ssl.c
-index 872aed594..f0186b253 100644
---- a/src/ssl.c
-+++ b/src/ssl.c
-@@ -23603,6 +23603,12 @@ static int wolfSSL_RAND_InitMutex(void)
- 
- #ifdef OPENSSL_EXTRA
- 
-+#if defined(HAVE_GETPID) && defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
-+/* In older FIPS bundles add check for reseed here since it does not exist in
-+ * the older random.c certified files. */
-+static pid_t currentRandPid = 0;
-+#endif
-+
- /* Checks if the global RNG has been created. If not then one is created.
-  *
-  * Returns WOLFSSL_SUCCESS when no error is encountered.
-@@ -23616,8 +23622,8 @@ int wolfSSL_RAND_Init(void)
-             ret = wc_InitRng(&globalRNG);
-             if (ret == 0) {
-             #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
--                FIPS_VERSION3_LT(6,0,0)))
--                currentPid = getpid();
-+                FIPS_VERSION3_LT(6,0,0)
-+                currentRandPid = getpid();
-             #endif
-                 initGlobalRNG = 1;
-                 ret = WOLFSSL_SUCCESS;
-@@ -24049,28 +24055,6 @@ int wolfSSL_RAND_pseudo_bytes(unsigned char* buf, int num)
-     return ret;
- }
- 
--#if defined(HAVE_GETPID) && defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)))
--/* In older FIPS bundles add check for reseed here since it does not exist in
-- * the older random.c certified files. */
--static pid_t currentPid = 0;
--
--/* returns WOLFSSL_SUCCESS on success and WOLFSSL_FAILURE on failure */
--static int RandCheckReSeed()
--{
--    int ret = WOLFSSL_SUCCESS;
--    pid_t p;
--
--    p = getpid();
--    if (p != currentPid) {
--        currentPid = p;
--        if (wolfSSL_RAND_poll() != WOLFSSL_SUCCESS) {
--            ret = WOLFSSL_FAILURE;
--        }
--    }
--    return ret;
--}
--#endif
--
- /* returns WOLFSSL_SUCCESS (1) if the bytes generated are valid otherwise 0
-  * on failure */
- int wolfSSL_RAND_bytes(unsigned char* buf, int num)
-@@ -24114,17 +24098,27 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int num)
-          * have the lock.
-          */
-         if (initGlobalRNG) {
--            rng = &globalRNG;
--
-         #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
--                FIPS_VERSION3_LT(6,0,0)))
--            if (RandCheckReSeed() != WOLFSSL_SUCCESS) {
-+                FIPS_VERSION3_LT(6,0,0)
-+            pid_t p;
-+
-+            p = getpid();
-+            if (p != currentRandPid) {
-                 wc_UnLockMutex(&globalRNGMutex);
--                WOLFSSL_MSG("Issue with check pid and reseed");
--                return ret;
-+                if (wolfSSL_RAND_poll() != WOLFSSL_SUCCESS) {
-+                    WOLFSSL_MSG("Issue with check pid and reseed");
-+                    ret = WOLFSSL_FAILURE;
-+                }
-+
-+                /* reclaim lock after wolfSSL_RAND_poll */
-+                if (wc_LockMutex(&globalRNGMutex) != 0) {
-+                    WOLFSSL_MSG("Bad Lock Mutex rng");
-+                    return ret;
-+                }
-+                currentRandPid = p;
-             }
-         #endif
--
-+            rng = &globalRNG;
-             used_global = 1;
-         }
-         else {
-@@ -24201,6 +24195,11 @@ int wolfSSL_RAND_poll(void)
-     }
-     else {
- #ifdef HAVE_HASHDRBG
-+        if (wc_LockMutex(&globalRNGMutex) != 0) {
-+            WOLFSSL_MSG("Bad Lock Mutex rng");
-+            return ret;
-+        }
-+
-         ret = wc_RNG_DRBG_Reseed(&globalRNG, entropy, entropy_sz);
-         if (ret != 0) {
-             WOLFSSL_MSG("Error reseeding DRBG");
-@@ -24209,6 +24208,7 @@ int wolfSSL_RAND_poll(void)
-         else {
-             ret = WOLFSSL_SUCCESS;
-         }
-+        wc_UnLockMutex(&globalRNGMutex);
- #else
-         WOLFSSL_MSG("RAND_poll called with HAVE_HASHDRBG not set");
-         ret = WOLFSSL_FAILURE;
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patch
deleted file mode 100644
index 7d6413f..0000000
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From d7a68e85ebe4705e7345b0e5012c806615cd86c7 Mon Sep 17 00:00:00 2001
-From: JacobBarthelmeh <jacob@wolfssl.com>
-Date: Tue, 10 Jun 2025 16:12:09 -0600
-Subject: [PATCH] add a way to restore previous pid behavior
-
-CVE: CVE-2025-7394
-Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/47cf634965a3aabe82fd97a8feed9efd6688e34a]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/ssl.c                  | 11 ++++++-----
- wolfcrypt/src/random.c     |  4 ++--
- wolfssl/wolfcrypt/random.h |  2 +-
- 3 files changed, 9 insertions(+), 8 deletions(-)
-
-diff --git a/src/ssl.c b/src/ssl.c
-index f0186b253..e214fa504 100644
---- a/src/ssl.c
-+++ b/src/ssl.c
-@@ -23603,7 +23603,8 @@ static int wolfSSL_RAND_InitMutex(void)
- 
- #ifdef OPENSSL_EXTRA
- 
--#if defined(HAVE_GETPID) && defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
-+#if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
-+    defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
- /* In older FIPS bundles add check for reseed here since it does not exist in
-  * the older random.c certified files. */
- static pid_t currentRandPid = 0;
-@@ -23621,8 +23622,8 @@ int wolfSSL_RAND_Init(void)
-         if (initGlobalRNG == 0) {
-             ret = wc_InitRng(&globalRNG);
-             if (ret == 0) {
--            #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
--                FIPS_VERSION3_LT(6,0,0)
-+            #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
-+                defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
-                 currentRandPid = getpid();
-             #endif
-                 initGlobalRNG = 1;
-@@ -24098,8 +24099,8 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int num)
-          * have the lock.
-          */
-         if (initGlobalRNG) {
--        #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
--                FIPS_VERSION3_LT(6,0,0)
-+        #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
-+                defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
-             pid_t p;
- 
-             p = getpid();
-diff --git a/wolfcrypt/src/random.c b/wolfcrypt/src/random.c
-index b440e274b..dc89db542 100644
---- a/wolfcrypt/src/random.c
-+++ b/wolfcrypt/src/random.c
-@@ -1599,7 +1599,7 @@ static int _InitRng(WC_RNG* rng, byte* nonce, word32 nonceSz,
- #else
-     rng->heap = heap;
- #endif
--#ifdef HAVE_GETPID
-+#if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID)
-     rng->pid = getpid();
- #endif
- #if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)
-@@ -1968,7 +1968,7 @@ int wc_RNG_GenerateBlock(WC_RNG* rng, byte* output, word32 sz)
-     if (rng->status != DRBG_OK)
-         return RNG_FAILURE_E;
- 
--#ifdef HAVE_GETPID
-+#if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID)
-     if (rng->pid != getpid()) {
-         rng->pid = getpid();
-         ret = PollAndReSeed(rng);
-diff --git a/wolfssl/wolfcrypt/random.h b/wolfssl/wolfcrypt/random.h
-index f472e1f40..320641548 100644
---- a/wolfssl/wolfcrypt/random.h
-+++ b/wolfssl/wolfcrypt/random.h
-@@ -183,7 +183,7 @@ struct WC_RNG {
- #endif
-     byte status;
- #endif
--#ifdef HAVE_GETPID
-+#if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID)
-     pid_t pid;
- #endif
- #ifdef WOLFSSL_ASYNC_CRYPT
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patch
deleted file mode 100644
index 6747f24..0000000
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 670437d91ae3025b4721eb4f450e5dc31fc3d6ee Mon Sep 17 00:00:00 2001
-From: Chris Conlon <chris@wolfssl.com>
-Date: Wed, 18 Jun 2025 16:08:34 -0600
-Subject: [PATCH] Add HAVE_GETPID to options.h if getpid detected, needed for
- apps to correctly detect size of WC_RNG struct
-
-CVE: CVE-2025-7394
-Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/9c35c0de65e135e621400958f22829c0d2555ed4]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- configure.ac | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 43ddd4767..636c45aef 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -156,6 +156,9 @@ fi
- #ifdef HAVE_STDLIB_H
-     #include <stdlib.h>
- #endif
-+#ifdef HAVE_UNISTD_H
-+    #include <unistd.h>
-+#endif
- ]])
- 
- AC_PROG_INSTALL
-@@ -9479,6 +9482,12 @@ then
-     AM_CFLAGS="$AM_CFLAGS -DHAVE___UINT128_T=1"
- fi
- 
-+# Add HAVE_GETPID to AM_CFLAGS for inclusion in options.h
-+if test "$ac_cv_func_getpid" = "yes"
-+then
-+    AM_CFLAGS="$AM_CFLAGS -DHAVE_GETPID=1"
-+fi
-+
- LIB_SOCKET_NSL
- AX_HARDEN_CC_COMPILER_FLAGS
- 
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patch
deleted file mode 100644
index e86bc8b..0000000
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From aaad0035e4e795b8b225bd481e3942de015a362d Mon Sep 17 00:00:00 2001
-From: Chris Conlon <chris@wolfssl.com>
-Date: Wed, 18 Jun 2025 16:57:02 -0600
-Subject: [PATCH] Add check for reseed in ssl.c for HAVE_SELFTEST, similar to
- old FIPS bundles that do not have older random.c files
-
-CVE: CVE-2025-7394
-Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/cdd02f9665ef43126503307972e4389070a00a73
-(cherry picked from commit cdd02f9665ef43126503307972e4389070a00a73)
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/ssl.c | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/src/ssl.c b/src/ssl.c
-index e214fa504..e538233fc 100644
---- a/src/ssl.c
-+++ b/src/ssl.c
-@@ -23604,7 +23604,7 @@ static int wolfSSL_RAND_InitMutex(void)
- #ifdef OPENSSL_EXTRA
- 
- #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
--    defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
-+    ((defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)) || defined(HAVE_SELFTEST))
- /* In older FIPS bundles add check for reseed here since it does not exist in
-  * the older random.c certified files. */
- static pid_t currentRandPid = 0;
-@@ -23623,7 +23623,9 @@ int wolfSSL_RAND_Init(void)
-             ret = wc_InitRng(&globalRNG);
-             if (ret == 0) {
-             #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
--                defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
-+                ((defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)) || \
-+                 defined(HAVE_SELFTEST))
-+
-                 currentRandPid = getpid();
-             #endif
-                 initGlobalRNG = 1;
-@@ -24100,7 +24102,8 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int num)
-          */
-         if (initGlobalRNG) {
-         #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
--                defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
-+                ((defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)) || \
-+                 defined(HAVE_SELFTEST))
-             pid_t p;
- 
-             p = getpid();
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
deleted file mode 100644
index 9c661d6..0000000
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From e6c0d1ac7b480c0b5e36f660dd3c0f2b45e4c3ab Mon Sep 17 00:00:00 2001
-From: Ruby Martin <ruby@wolfssl.com>
-Date: Mon, 2 Jun 2025 16:38:32 -0600
-Subject: [PATCH] create policy for WOLFSSL_APPLE_NATIVE_CERT_VALIDATION,
- domain name checking
-
-CVE: CVE-2025-7395
-Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/9864959e41bd9259f258c09171ae2ec1c43fbc7f]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/internal.c | 25 ++++++++++++++++++++-----
- 1 file changed, 20 insertions(+), 5 deletions(-)
-
-diff --git a/src/internal.c b/src/internal.c
-index 6bbd38fa8..2b090382f 100644
---- a/src/internal.c
-+++ b/src/internal.c
-@@ -221,7 +221,7 @@ WOLFSSL_CALLBACKS needs LARGE_STATIC_BUFFERS, please add LARGE_STATIC_BUFFERS
- #include <Security/SecCertificate.h>
- #include <Security/SecTrust.h>
- #include <Security/SecPolicy.h>
--static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
-+static int DoAppleNativeCertValidation(WOLFSSL* ssl, const WOLFSSL_BUFFER_INFO* certs,
-                                             int totalCerts);
- #endif /* #if defined(__APPLE__) && defined(WOLFSSL_SYS_CA_CERTS) */
- 
-@@ -15992,7 +15992,7 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input, word32* inOutIdx,
-              * into wolfSSL, try to validate against the system certificates
-              * using Apple's native trust APIs */
-             if ((ret != 0) && (ssl->ctx->doAppleNativeCertValidationFlag)) {
--                if (DoAppleNativeCertValidation(args->certs,
-+                if (DoAppleNativeCertValidation(ssl, args->certs,
-                                                      args->totalCerts)) {
-                     WOLFSSL_MSG("Apple native cert chain validation SUCCESS");
-                     ret = 0;
-@@ -41246,7 +41246,8 @@ cleanup:
-  * wolfSSL's built-in certificate validation mechanisms anymore. We instead
-  * must call into the Security Framework APIs to authenticate peer certificates
-  */
--static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
-+static int DoAppleNativeCertValidation(WOLFSSL* ssl,
-+                                            const WOLFSSL_BUFFER_INFO* certs,
-                                             int totalCerts)
- {
-     int i;
-@@ -41255,7 +41256,8 @@ static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
-     CFMutableArrayRef certArray = NULL;
-     SecCertificateRef secCert   = NULL;
-     SecTrustRef       trust     = NULL;
--    SecPolicyRef      policy    = NULL ;
-+    SecPolicyRef      policy    = NULL;
-+    CFStringRef       hostname  = NULL;
- 
-     WOLFSSL_ENTER("DoAppleNativeCertValidation");
- 
-@@ -41283,7 +41285,17 @@ static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
-     }
- 
-     /* Create trust object for SecCertifiate Ref */
--    policy = SecPolicyCreateSSL(true, NULL);
-+    if (ssl->buffers.domainName.buffer &&
-+            ssl->buffers.domainName.length > 0) {
-+        /* Create policy with specified value to require host name match */
-+        hostname = CFStringCreateWithCString(kCFAllocatorDefault,
-+        (const char*)ssl->buffers.domainName.buffer, kCFStringEncodingUTF8);
-+    }
-+    if (hostname != NULL) {
-+        policy = SecPolicyCreateSSL(true, hostname);
-+    } else {
-+        policy = SecPolicyCreateSSL(true, NULL);
-+    }
-     status = SecTrustCreateWithCertificates(certArray, policy, &trust);
-     if (status != errSecSuccess) {
-         WOLFSSL_MSG_EX("Error creating trust object, "
-@@ -41314,6 +41326,9 @@ cleanup:
-     if (policy) {
-         CFRelease(policy);
-     }
-+    if (hostname) {
-+        CFRelease(hostname);
-+    }
- 
-     WOLFSSL_LEAVE("DoAppleNativeCertValidation", ret);
- 
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch
deleted file mode 100644
index 857f6bb..0000000
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From aad4e7c38f3784942923f4871d61a7e41d3de842 Mon Sep 17 00:00:00 2001
-From: Brett <bigbrett@users.noreply.github.com>
-Date: Wed, 4 Jun 2025 15:48:15 -0600
-Subject: [PATCH] prevent apple native cert validation from overriding error
- codes other than ASN_NO_SIGNER_E
-
-CVE: CVE-2025-7395
-Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/bc8eeea703253bd65d472a9541b54fef326e8050]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/internal.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/internal.c b/src/internal.c
-index 2b090382f..79f584a0a 100644
---- a/src/internal.c
-+++ b/src/internal.c
-@@ -15991,7 +15991,8 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input, word32* inOutIdx,
-             /* If we can't validate the peer cert chain against the CAs loaded
-              * into wolfSSL, try to validate against the system certificates
-              * using Apple's native trust APIs */
--            if ((ret != 0) && (ssl->ctx->doAppleNativeCertValidationFlag)) {
-+            if ((ret == ASN_NO_SIGNER_E) &&
-+                (ssl->ctx->doAppleNativeCertValidationFlag)) {
-                 if (DoAppleNativeCertValidation(ssl, args->certs,
-                                                      args->totalCerts)) {
-                     WOLFSSL_MSG("Apple native cert chain validation SUCCESS");
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch
deleted file mode 100644
index a7e1c33..0000000
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f2a85e37e552d8dfafa2cbf32507b2fa545ee593 Mon Sep 17 00:00:00 2001
-From: Brett <bigbrett@users.noreply.github.com>
-Date: Wed, 4 Jun 2025 16:56:16 -0600
-Subject: [PATCH] add missing error trace macro
-
-CVE: CVE-2025-7395
-Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/0e2a3fd0b64bc6ba633aa9227e92ecacb42b5b1b]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/internal.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/internal.c b/src/internal.c
-index 79f584a0a..5557b5698 100644
---- a/src/internal.c
-+++ b/src/internal.c
-@@ -15991,7 +15991,7 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input, word32* inOutIdx,
-             /* If we can't validate the peer cert chain against the CAs loaded
-              * into wolfSSL, try to validate against the system certificates
-              * using Apple's native trust APIs */
--            if ((ret == ASN_NO_SIGNER_E) &&
-+            if ((ret == WC_NO_ERR_TRACE(ASN_NO_SIGNER_E)) &&
-                 (ssl->ctx->doAppleNativeCertValidationFlag)) {
-                 if (DoAppleNativeCertValidation(ssl, args->certs,
-                                                      args->totalCerts)) {
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
similarity index 78%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
index 0dc488d..2600e94 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
@@ -14,17 +14,8 @@ RPROVIDES:${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master \
            file://run-ptest \
-           file://CVE-2025-7395-1.patch \
-           file://CVE-2025-7395-2.patch \
-           file://CVE-2025-7395-3.patch \
-           file://CVE-2025-7394-1.patch \
-           file://CVE-2025-7394-2.patch \
-           file://CVE-2025-7394-3.patch \
-           file://CVE-2025-7394-4.patch \
-           file://CVE-2025-7394-5.patch \
-           file://CVE-2025-7394-6.patch \
            "
-SRCREV = "00e42151ca061463ba6a95adb2290f678cbca472"
+SRCREV = "ac01707f552c611fbd135cc723b2682b3e7f80f2"
 
 S = "${WORKDIR}/git"
 
-- 
2.55.0


