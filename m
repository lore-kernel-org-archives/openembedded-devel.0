Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0BDF4BB77
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 18:55:15 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27893.1771959308237970657
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 10:55:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EdRkN0B+;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8249cb73792so5250030b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 10:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771959307; x=1772564107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iS7lrfQEaeYzPCavrDMIbJA7TfP854x/IR7LlMYlkA8=;
        b=EdRkN0B+0ph7UfMN8icBs0Uj3Qd7gZFBw5RELPXMxVw0Fv5AOZmtcz5FhF1jzLWm0a
         Vi6S5e20QXhMsuvnQRJkdIOFZbXRKv2nUlpYldkn0j9yL6RR32tUyh/njjSbKyOOu4W4
         QLImzpkjGU4xxCzkKGWIqAnjT3RrAYKN7leYh6PyPW5PKdjGJrPua0kzJJ2Ecvee2iOX
         UJzY4g9bMJ8jwn+Yg3G6UAMadhT1l0XirzimHbWTs4+U2Dyz2XrSD283Up18tjJrcSSZ
         EtHrg+aR2SqVqnzB/In3A9mxwsoV9GyuyEh0kV7RJ8njwndrEXmU34rPlekoOVo0i4UO
         V0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959307; x=1772564107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iS7lrfQEaeYzPCavrDMIbJA7TfP854x/IR7LlMYlkA8=;
        b=Idb4PS/QPotxKgxmis5vBgNU6IBvYDyKsx054uwBra+Yaw/wjKltiD7HH5yPuqevnR
         uZFxO3GudJNMt3RXWiVYog0Ojn2fY2S9BYJ49kslwi7jvwbLWY5kCike0Dt0S+3s2tF9
         AG17LgbhOHaXmiI4XjA6hlYZk3h8zu7zZsGpxxASQcrltgcSdBhAFAb0EZZy2cZsGlho
         2RyDN3xZAdP8jHyGoIDnLT0YmejRwoeWlbkH377DlGsv7lx6cWzzV8Upethv3cLpNQls
         h7ON2m4z9h+OKeKYdjTkMAxdhDJ1/0opMohcxrjWZryMGuyheKdF8XdY+AksDn4bp6Jr
         qG2Q==
X-Gm-Message-State: AOJu0YzozrVmKOMxKZ1arcUqmP50w6FagGpT3gYMyXlBJ9TEwQNHYuUt
	qsf5eE7y2ofXjuyoW6Fp9BOt290r3sE2e9zckQqnpHcDNcpgS5QkItD6SL41kQ==
X-Gm-Gg: ATEYQzzefzYXtN/a4RHQKE5Nz1HfpVxkSi3u378AfRyxMv/i5430gfYyhVNPXjptHf5
	zqs82cQUoF9CY9fRiR6pmB3TAyDQoQJ3WGl4zV8AM9a8x7RBvTnbI27g4VpXvgXOIjYfotSzH/V
	DXu0FwiQzDvtS7SAgMAihH95NWSBALoUTDAKk65rJK47ihJnrW7udgIR/ZpPS6vpPAZRzSyUkSv
	JQjl+9HUrnb1QYGcm+YiLP46ZyOmFm8vB3FF9E+qDy7o71s9MdLZ8JXtg7fplbIvWvOXkXySl4c
	OhHFAk1k9gXXgWM+8t0MH0+lMfX5aOXX3coKahhi20Ay8g8hK9I8VD0wrgU2zDH4JjYkj+cmZl2
	uzvdRijXh2EFa2a0QkMRG2i1FiogWnf/rHjXPXhBFftWmXH//RDBfehbZ5cW879TZeXo9blbvEk
	RTx3EknmzBzoHCJ0O9J+VJsgxenvZqfmcyTgc=
X-Received: by 2002:a05:6a00:2daa:b0:822:bd7:e94f with SMTP id d2e1a72fcca58-826daa626c2mr11857364b3a.53.1771959307135;
        Tue, 24 Feb 2026 10:55:07 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8ee179sm10945104b3a.61.2026.02.24.10.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:55:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 3/3] wolfssl: patch CVE-2025-7394
Date: Wed, 25 Feb 2026 07:54:12 +1300
Message-ID: <20260224185412.1835468-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224185412.1835468-2-ankur.tyagi85@gmail.com>
References: <20260224185412.1835468-2-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 18:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124588

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-7394

Backport patches from the PR[1][2][3] mentioned in the changelog[4].

[1] https://github.com/wolfSSL/wolfssl/pull/8849
[2] https://github.com/wolfSSL/wolfssl/pull/8867
[3] https://github.com/wolfSSL/wolfssl/pull/8898
[4] https://github.com/wolfSSL/wolfssl/blob/master/ChangeLog.md#wolfssl-release-582-july-17-2025

Dropped changes to github workflow and tests during backport.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2025-7394-1.patch       |  46 +++
 .../wolfssl/files/CVE-2025-7394-2.patch       | 276 ++++++++++++++++++
 .../wolfssl/files/CVE-2025-7394-3.patch       | 125 ++++++++
 .../wolfssl/files/CVE-2025-7394-4.patch       |  88 ++++++
 .../wolfssl/files/CVE-2025-7394-5.patch       |  42 +++
 .../wolfssl/files/CVE-2025-7394-6.patch       |  49 ++++
 .../wolfssl/wolfssl_5.8.0.bb                  |   6 +
 7 files changed, 632 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patch
new file mode 100644
index 0000000000..5c680cd7cd
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patch
@@ -0,0 +1,46 @@
+From 95f350e136ed89eadb1de68d82b7357b9078d167 Mon Sep 17 00:00:00 2001
+From: Josh Holtrop <josh@wolfssl.com>
+Date: Thu, 5 Jun 2025 19:48:34 -0400
+Subject: [PATCH] Reseed DRBG in RAND_poll()
+
+CVE: CVE-2025-7394
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/0c12337194ee6dd082f082f0ccaed27fc4ee44f5]
+(cherry picked from commit 0c12337194ee6dd082f082f0ccaed27fc4ee44f5)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ssl.c | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/src/ssl.c b/src/ssl.c
+index 0b74065fa..95739f098 100644
+--- a/src/ssl.c
++++ b/src/ssl.c
+@@ -26017,11 +26017,25 @@ int wolfSSL_RAND_poll(void)
+         return  WOLFSSL_FAILURE;
+     }
+     ret = wc_GenerateSeed(&globalRNG.seed, entropy, entropy_sz);
+-    if (ret != 0){
++    if (ret != 0) {
+         WOLFSSL_MSG("Bad wc_RNG_GenerateBlock");
+         ret = WOLFSSL_FAILURE;
+-    }else
+-        ret = WOLFSSL_SUCCESS;
++    }
++    else {
++#ifdef HAVE_HASHDRBG
++        ret = wc_RNG_DRBG_Reseed(&globalRNG, entropy, entropy_sz);
++        if (ret != 0) {
++            WOLFSSL_MSG("Error reseeding DRBG");
++            ret = WOLFSSL_FAILURE;
++        }
++        else {
++            ret = WOLFSSL_SUCCESS;
++        }
++#else
++        WOLFSSL_MSG("RAND_poll called with HAVE_HASHDRBG not set");
++        ret = WOLFSSL_FAILURE;
++#endif
++    }
+ 
+     return ret;
+ }
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patch
new file mode 100644
index 0000000000..a10839b7c4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patch
@@ -0,0 +1,276 @@
+From baa7c51d9c4b788213c8b7ae51ea351222f0d06a Mon Sep 17 00:00:00 2001
+From: JacobBarthelmeh <jacob@wolfssl.com>
+Date: Tue, 10 Jun 2025 12:49:08 -0600
+Subject: [PATCH] add sanity checks on pid with RNG
+
+CVE: CVE-2025-7394
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/31490ab813a5aac096f50800c26c690d8ae586d2]
+(cherry picked from commit 31490ab813a5aac096f50800c26c690d8ae586d2)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ CMakeLists.txt             |   1 +
+ configure.ac               |   4 +-
+ src/ssl.c                  |  40 +++++++++++-
+ wolfcrypt/src/random.c     | 126 ++++++++++++++++++++++---------------
+ wolfssl/wolfcrypt/random.h |   3 +
+ 5 files changed, 118 insertions(+), 56 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4abba9b8a..a2cd40b56 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -124,6 +124,7 @@ check_function_exists("memset" HAVE_MEMSET)
+ check_function_exists("socket" HAVE_SOCKET)
+ check_function_exists("strftime" HAVE_STRFTIME)
+ check_function_exists("__atomic_fetch_add" HAVE_C___ATOMIC)
++check_function_exists("getpid" HAVE_GETPID)
+ 
+ include(CheckSymbolExists)
+ check_symbol_exists(isascii "ctype.h" HAVE_ISASCII)
+diff --git a/configure.ac b/configure.ac
+index 5d1357058..2b0ab1716 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -129,8 +129,8 @@ AC_CHECK_HEADER(assert.h, [AM_CPPFLAGS="$AM_CPPFLAGS -DWOLFSSL_HAVE_ASSERT_H"],[
+ # check if functions of interest are linkable, but also check if
+ # they're declared by the expected headers, and if not, supersede the
+ # unusable positive from AC_CHECK_FUNCS().
+-AC_CHECK_FUNCS([gethostbyname getaddrinfo gettimeofday gmtime_r gmtime_s inet_ntoa memset socket strftime atexit isascii])
+-AC_CHECK_DECLS([gethostbyname, getaddrinfo, gettimeofday, gmtime_r, gmtime_s, inet_ntoa, memset, socket, strftime, atexit, isascii], [], [
++AC_CHECK_FUNCS([gethostbyname getaddrinfo gettimeofday gmtime_r gmtime_s inet_ntoa memset socket strftime atexit isascii getpid])
++AC_CHECK_DECLS([gethostbyname, getaddrinfo, gettimeofday, gmtime_r, gmtime_s, inet_ntoa, memset, socket, strftime, atexit, isascii, getpid], [], [
+ if test "$(eval echo \$"$(eval 'echo ac_cv_func_${as_decl_name}')")" = "yes"
+ then
+     AC_MSG_NOTICE([    note: earlier check for $(eval 'echo ${as_decl_name}') superseded.])
+diff --git a/src/ssl.c b/src/ssl.c
+index 95739f098..7e989685b 100644
+--- a/src/ssl.c
++++ b/src/ssl.c
+@@ -25470,6 +25470,10 @@ int wolfSSL_RAND_Init(void)
+         if (initGlobalRNG == 0) {
+             ret = wc_InitRng(&globalRNG);
+             if (ret == 0) {
++            #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
++                FIPS_VERSION3_LT(6,0,0)))
++                currentPid = getpid();
++            #endif
+                 initGlobalRNG = 1;
+                 ret = WOLFSSL_SUCCESS;
+             }
+@@ -25904,8 +25908,30 @@ int wolfSSL_RAND_pseudo_bytes(unsigned char* buf, int num)
+     return ret;
+ }
+ 
+-/* returns WOLFSSL_SUCCESS if the bytes generated are valid otherwise
+- * WOLFSSL_FAILURE */
++#if defined(HAVE_GETPID) && defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)))
++/* In older FIPS bundles add check for reseed here since it does not exist in
++ * the older random.c certified files. */
++static pid_t currentPid = 0;
++
++/* returns WOLFSSL_SUCCESS on success and WOLFSSL_FAILURE on failure */
++static int RandCheckReSeed()
++{
++    int ret = WOLFSSL_SUCCESS;
++    pid_t p;
++
++    p = getpid();
++    if (p != currentPid) {
++        currentPid = p;
++        if (wolfSSL_RAND_poll() != WOLFSSL_SUCCESS) {
++            ret = WOLFSSL_FAILURE;
++        }
++    }
++    return ret;
++}
++#endif
++
++/* returns WOLFSSL_SUCCESS (1) if the bytes generated are valid otherwise 0
++ * on failure */
+ int wolfSSL_RAND_bytes(unsigned char* buf, int num)
+ {
+     int     ret = 0;
+@@ -25948,6 +25974,16 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int num)
+          */
+         if (initGlobalRNG) {
+             rng = &globalRNG;
++
++        #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
++                FIPS_VERSION3_LT(6,0,0)))
++            if (RandCheckReSeed() != WOLFSSL_SUCCESS) {
++                wc_UnLockMutex(&globalRNGMutex);
++                WOLFSSL_MSG("Issue with check pid and reseed");
++                return ret;
++            }
++        #endif
++
+             used_global = 1;
+         }
+         else {
+diff --git a/wolfcrypt/src/random.c b/wolfcrypt/src/random.c
+index 746a06b90..4978db95e 100644
+--- a/wolfcrypt/src/random.c
++++ b/wolfcrypt/src/random.c
+@@ -1640,6 +1640,9 @@ static int _InitRng(WC_RNG* rng, byte* nonce, word32 nonceSz,
+ #else
+     rng->heap = heap;
+ #endif
++#ifdef HAVE_GETPID
++    rng->pid = getpid();
++#endif
+ #if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)
+     rng->devId = devId;
+     #if defined(WOLF_CRYPTO_CB)
+@@ -1895,6 +1898,63 @@ int wc_InitRngNonce_ex(WC_RNG* rng, byte* nonce, word32 nonceSz,
+     return _InitRng(rng, nonce, nonceSz, heap, devId);
+ }
+ 
++#ifdef HAVE_HASHDRBG
++static int PollAndReSeed(WC_RNG* rng)
++{
++    int ret   = DRBG_NEED_RESEED;
++    int devId = INVALID_DEVID;
++#if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)
++    devId = rng->devId;
++#endif
++    if (wc_RNG_HealthTestLocal(1, rng->heap, devId) == 0) {
++    #ifndef WOLFSSL_SMALL_STACK
++        byte newSeed[SEED_SZ + SEED_BLOCK_SZ];
++        ret = DRBG_SUCCESS;
++    #else
++        byte* newSeed = (byte*)XMALLOC(SEED_SZ + SEED_BLOCK_SZ, rng->heap,
++            DYNAMIC_TYPE_SEED);
++        ret = (newSeed == NULL) ? MEMORY_E : DRBG_SUCCESS;
++    #endif
++        if (ret == DRBG_SUCCESS) {
++        #ifdef WC_RNG_SEED_CB
++            if (seedCb == NULL) {
++                ret = DRBG_NO_SEED_CB;
++            }
++            else {
++                ret = seedCb(&rng->seed, newSeed, SEED_SZ + SEED_BLOCK_SZ);
++                if (ret != 0) {
++                    ret = DRBG_FAILURE;
++                }
++            }
++        #else
++            ret = wc_GenerateSeed(&rng->seed, newSeed,
++                              SEED_SZ + SEED_BLOCK_SZ);
++        #endif
++            if (ret != 0)
++                ret = DRBG_FAILURE;
++        }
++        if (ret == DRBG_SUCCESS)
++            ret = wc_RNG_TestSeed(newSeed, SEED_SZ + SEED_BLOCK_SZ);
++
++        if (ret == DRBG_SUCCESS)
++            ret = Hash_DRBG_Reseed((DRBG_internal *)rng->drbg,
++                                   newSeed + SEED_BLOCK_SZ, SEED_SZ);
++    #ifdef WOLFSSL_SMALL_STACK
++        if (newSeed != NULL) {
++            ForceZero(newSeed, SEED_SZ + SEED_BLOCK_SZ);
++        }
++        XFREE(newSeed, rng->heap, DYNAMIC_TYPE_SEED);
++    #else
++        ForceZero(newSeed, sizeof(newSeed));
++    #endif
++    }
++    else {
++        ret = DRBG_CONT_FAILURE;
++    }
++
++    return ret;
++}
++#endif
+ 
+ /* place a generated block in output */
+ WOLFSSL_ABI
+@@ -1954,60 +2014,22 @@ int wc_RNG_GenerateBlock(WC_RNG* rng, byte* output, word32 sz)
+     if (rng->status != DRBG_OK)
+         return RNG_FAILURE_E;
+ 
++#ifdef HAVE_GETPID
++    if (rng->pid != getpid()) {
++        rng->pid = getpid();
++        ret = PollAndReSeed(rng);
++        if (ret != DRBG_SUCCESS) {
++            rng->status = DRBG_FAILED;
++            return RNG_FAILURE_E;
++        }
++    }
++#endif
++
+     ret = Hash_DRBG_Generate((DRBG_internal *)rng->drbg, output, sz);
+     if (ret == DRBG_NEED_RESEED) {
+-        int devId = INVALID_DEVID;
+-    #if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)
+-        devId = rng->devId;
+-    #endif
+-        if (wc_RNG_HealthTestLocal(1, rng->heap, devId) == 0) {
+-        #ifndef WOLFSSL_SMALL_STACK
+-            byte newSeed[SEED_SZ + SEED_BLOCK_SZ];
+-            ret = DRBG_SUCCESS;
+-        #else
+-            byte* newSeed = (byte*)XMALLOC(SEED_SZ + SEED_BLOCK_SZ, rng->heap,
+-                DYNAMIC_TYPE_SEED);
+-            ret = (newSeed == NULL) ? MEMORY_E : DRBG_SUCCESS;
+-        #endif
+-            if (ret == DRBG_SUCCESS) {
+-            #ifdef WC_RNG_SEED_CB
+-                if (seedCb == NULL) {
+-                    ret = DRBG_NO_SEED_CB;
+-                }
+-                else {
+-                    ret = seedCb(&rng->seed, newSeed, SEED_SZ + SEED_BLOCK_SZ);
+-                    if (ret != 0) {
+-                        ret = DRBG_FAILURE;
+-                    }
+-                }
+-            #else
+-                ret = wc_GenerateSeed(&rng->seed, newSeed,
+-                                  SEED_SZ + SEED_BLOCK_SZ);
+-            #endif
+-                if (ret != 0)
+-                    ret = DRBG_FAILURE;
+-            }
+-            if (ret == DRBG_SUCCESS)
+-                ret = wc_RNG_TestSeed(newSeed, SEED_SZ + SEED_BLOCK_SZ);
+-
+-            if (ret == DRBG_SUCCESS)
+-                ret = Hash_DRBG_Reseed((DRBG_internal *)rng->drbg,
+-                                       newSeed + SEED_BLOCK_SZ, SEED_SZ);
+-            if (ret == DRBG_SUCCESS)
+-                ret = Hash_DRBG_Generate((DRBG_internal *)rng->drbg, output, sz);
+-
+-        #ifdef WOLFSSL_SMALL_STACK
+-            if (newSeed != NULL) {
+-                ForceZero(newSeed, SEED_SZ + SEED_BLOCK_SZ);
+-            }
+-            XFREE(newSeed, rng->heap, DYNAMIC_TYPE_SEED);
+-        #else
+-            ForceZero(newSeed, sizeof(newSeed));
+-        #endif
+-        }
+-        else {
+-            ret = DRBG_CONT_FAILURE;
+-        }
++        ret = PollAndReSeed(rng);
++        if (ret == DRBG_SUCCESS)
++            ret = Hash_DRBG_Generate((DRBG_internal *)rng->drbg, output, sz);
+     }
+ 
+     if (ret == DRBG_SUCCESS) {
+diff --git a/wolfssl/wolfcrypt/random.h b/wolfssl/wolfcrypt/random.h
+index 3b4533e0d..ff5f89c3f 100644
+--- a/wolfssl/wolfcrypt/random.h
++++ b/wolfssl/wolfcrypt/random.h
+@@ -183,6 +183,9 @@ struct WC_RNG {
+ #endif
+     byte status;
+ #endif
++#ifdef HAVE_GETPID
++    pid_t pid;
++#endif
+ #ifdef WOLFSSL_ASYNC_CRYPT
+     WC_ASYNC_DEV asyncDev;
+ #endif
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patch
new file mode 100644
index 0000000000..c1af745385
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patch
@@ -0,0 +1,125 @@
+From ec8edec282bfcc18e6b2681e240fae816d694161 Mon Sep 17 00:00:00 2001
+From: JacobBarthelmeh <jacob@wolfssl.com>
+Date: Tue, 10 Jun 2025 14:15:38 -0600
+Subject: [PATCH] add mutex locking and compat layer FIPS case
+
+CVE: CVE-2025-7394
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/fbbb6b7707f7f8ae1c38ab68daec0af02ee0208a]
+(cherry picked from commit fbbb6b7707f7f8ae1c38ab68daec0af02ee0208a)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ssl.c | 62 +++++++++++++++++++++++++++----------------------------
+ 1 file changed, 31 insertions(+), 31 deletions(-)
+
+diff --git a/src/ssl.c b/src/ssl.c
+index 7e989685b..ae432eb59 100644
+--- a/src/ssl.c
++++ b/src/ssl.c
+@@ -25458,6 +25458,12 @@ static int wolfSSL_RAND_InitMutex(void)
+ 
+ #ifdef OPENSSL_EXTRA
+ 
++#if defined(HAVE_GETPID) && defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
++/* In older FIPS bundles add check for reseed here since it does not exist in
++ * the older random.c certified files. */
++static pid_t currentRandPid = 0;
++#endif
++
+ /* Checks if the global RNG has been created. If not then one is created.
+  *
+  * Returns WOLFSSL_SUCCESS when no error is encountered.
+@@ -25471,8 +25477,8 @@ int wolfSSL_RAND_Init(void)
+             ret = wc_InitRng(&globalRNG);
+             if (ret == 0) {
+             #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
+-                FIPS_VERSION3_LT(6,0,0)))
+-                currentPid = getpid();
++                FIPS_VERSION3_LT(6,0,0)
++                currentRandPid = getpid();
+             #endif
+                 initGlobalRNG = 1;
+                 ret = WOLFSSL_SUCCESS;
+@@ -25908,28 +25914,6 @@ int wolfSSL_RAND_pseudo_bytes(unsigned char* buf, int num)
+     return ret;
+ }
+ 
+-#if defined(HAVE_GETPID) && defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)))
+-/* In older FIPS bundles add check for reseed here since it does not exist in
+- * the older random.c certified files. */
+-static pid_t currentPid = 0;
+-
+-/* returns WOLFSSL_SUCCESS on success and WOLFSSL_FAILURE on failure */
+-static int RandCheckReSeed()
+-{
+-    int ret = WOLFSSL_SUCCESS;
+-    pid_t p;
+-
+-    p = getpid();
+-    if (p != currentPid) {
+-        currentPid = p;
+-        if (wolfSSL_RAND_poll() != WOLFSSL_SUCCESS) {
+-            ret = WOLFSSL_FAILURE;
+-        }
+-    }
+-    return ret;
+-}
+-#endif
+-
+ /* returns WOLFSSL_SUCCESS (1) if the bytes generated are valid otherwise 0
+  * on failure */
+ int wolfSSL_RAND_bytes(unsigned char* buf, int num)
+@@ -25973,17 +25957,27 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int num)
+          * have the lock.
+          */
+         if (initGlobalRNG) {
+-            rng = &globalRNG;
+-
+         #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
+-                FIPS_VERSION3_LT(6,0,0)))
+-            if (RandCheckReSeed() != WOLFSSL_SUCCESS) {
++                FIPS_VERSION3_LT(6,0,0)
++            pid_t p;
++
++            p = getpid();
++            if (p != currentRandPid) {
+                 wc_UnLockMutex(&globalRNGMutex);
+-                WOLFSSL_MSG("Issue with check pid and reseed");
+-                return ret;
++                if (wolfSSL_RAND_poll() != WOLFSSL_SUCCESS) {
++                    WOLFSSL_MSG("Issue with check pid and reseed");
++                    ret = WOLFSSL_FAILURE;
++                }
++
++                /* reclaim lock after wolfSSL_RAND_poll */
++                if (wc_LockMutex(&globalRNGMutex) != 0) {
++                    WOLFSSL_MSG("Bad Lock Mutex rng");
++                    return ret;
++                }
++                currentRandPid = p;
+             }
+         #endif
+-
++            rng = &globalRNG;
+             used_global = 1;
+         }
+         else {
+@@ -26059,6 +26053,11 @@ int wolfSSL_RAND_poll(void)
+     }
+     else {
+ #ifdef HAVE_HASHDRBG
++        if (wc_LockMutex(&globalRNGMutex) != 0) {
++            WOLFSSL_MSG("Bad Lock Mutex rng");
++            return ret;
++        }
++
+         ret = wc_RNG_DRBG_Reseed(&globalRNG, entropy, entropy_sz);
+         if (ret != 0) {
+             WOLFSSL_MSG("Error reseeding DRBG");
+@@ -26067,6 +26066,7 @@ int wolfSSL_RAND_poll(void)
+         else {
+             ret = WOLFSSL_SUCCESS;
+         }
++        wc_UnLockMutex(&globalRNGMutex);
+ #else
+         WOLFSSL_MSG("RAND_poll called with HAVE_HASHDRBG not set");
+         ret = WOLFSSL_FAILURE;
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patch
new file mode 100644
index 0000000000..fb1215f898
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patch
@@ -0,0 +1,88 @@
+From 7f1ab20a83f953233cac113108ceefb1d5f4fe97 Mon Sep 17 00:00:00 2001
+From: JacobBarthelmeh <jacob@wolfssl.com>
+Date: Tue, 10 Jun 2025 16:12:09 -0600
+Subject: [PATCH] add a way to restore previous pid behavior
+
+CVE: CVE-2025-7394
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/47cf634965a3aabe82fd97a8feed9efd6688e34a]
+
+Dropped changes to github workflow and test from original commit.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ssl.c                  | 11 ++++++-----
+ wolfcrypt/src/random.c     |  4 ++--
+ wolfssl/wolfcrypt/random.h |  2 +-
+ 3 files changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/src/ssl.c b/src/ssl.c
+index ae432eb59..e69fa19ac 100644
+--- a/src/ssl.c
++++ b/src/ssl.c
+@@ -25458,7 +25458,8 @@ static int wolfSSL_RAND_InitMutex(void)
+ 
+ #ifdef OPENSSL_EXTRA
+ 
+-#if defined(HAVE_GETPID) && defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
++#if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
++    defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
+ /* In older FIPS bundles add check for reseed here since it does not exist in
+  * the older random.c certified files. */
+ static pid_t currentRandPid = 0;
+@@ -25476,8 +25477,8 @@ int wolfSSL_RAND_Init(void)
+         if (initGlobalRNG == 0) {
+             ret = wc_InitRng(&globalRNG);
+             if (ret == 0) {
+-            #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
+-                FIPS_VERSION3_LT(6,0,0)
++            #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
++                defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
+                 currentRandPid = getpid();
+             #endif
+                 initGlobalRNG = 1;
+@@ -25957,8 +25958,8 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int num)
+          * have the lock.
+          */
+         if (initGlobalRNG) {
+-        #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
+-                FIPS_VERSION3_LT(6,0,0)
++        #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
++                defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
+             pid_t p;
+ 
+             p = getpid();
+diff --git a/wolfcrypt/src/random.c b/wolfcrypt/src/random.c
+index 4978db95e..32ebb8bae 100644
+--- a/wolfcrypt/src/random.c
++++ b/wolfcrypt/src/random.c
+@@ -1640,7 +1640,7 @@ static int _InitRng(WC_RNG* rng, byte* nonce, word32 nonceSz,
+ #else
+     rng->heap = heap;
+ #endif
+-#ifdef HAVE_GETPID
++#if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID)
+     rng->pid = getpid();
+ #endif
+ #if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)
+@@ -2014,7 +2014,7 @@ int wc_RNG_GenerateBlock(WC_RNG* rng, byte* output, word32 sz)
+     if (rng->status != DRBG_OK)
+         return RNG_FAILURE_E;
+ 
+-#ifdef HAVE_GETPID
++#if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID)
+     if (rng->pid != getpid()) {
+         rng->pid = getpid();
+         ret = PollAndReSeed(rng);
+diff --git a/wolfssl/wolfcrypt/random.h b/wolfssl/wolfcrypt/random.h
+index ff5f89c3f..faa999473 100644
+--- a/wolfssl/wolfcrypt/random.h
++++ b/wolfssl/wolfcrypt/random.h
+@@ -183,7 +183,7 @@ struct WC_RNG {
+ #endif
+     byte status;
+ #endif
+-#ifdef HAVE_GETPID
++#if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID)
+     pid_t pid;
+ #endif
+ #ifdef WOLFSSL_ASYNC_CRYPT
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patch
new file mode 100644
index 0000000000..6ea6e3b972
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patch
@@ -0,0 +1,42 @@
+From ec46c4146d16c38abddb427efcb9ca177d74cd03 Mon Sep 17 00:00:00 2001
+From: Chris Conlon <chris@wolfssl.com>
+Date: Wed, 18 Jun 2025 16:08:34 -0600
+Subject: [PATCH] Add HAVE_GETPID to options.h if getpid detected, needed for
+ apps to correctly detect size of WC_RNG struct
+
+CVE: CVE-2025-7394
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/9c35c0de65e135e621400958f22829c0d2555ed4]
+
+(cherry picked from commit 9c35c0de65e135e621400958f22829c0d2555ed4)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ configure.ac | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 2b0ab1716..ecb2d694f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -160,6 +160,9 @@ fi
+ #ifdef HAVE_STDLIB_H
+     #include <stdlib.h>
+ #endif
++#ifdef HAVE_UNISTD_H
++    #include <unistd.h>
++#endif
+ #ifdef HAVE_CTYPE_H
+     #include <ctype.h>
+ #endif
+@@ -10361,6 +10364,12 @@ then
+     AM_CFLAGS="$AM_CFLAGS -DHAVE___UINT128_T=1"
+ fi
+ 
++# Add HAVE_GETPID to AM_CFLAGS for inclusion in options.h
++if test "$ac_cv_func_getpid" = "yes"
++then
++    AM_CFLAGS="$AM_CFLAGS -DHAVE_GETPID=1"
++fi
++
+ LIB_SOCKET_NSL
+ AX_HARDEN_CC_COMPILER_FLAGS
+ 
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patch
new file mode 100644
index 0000000000..999b0dd250
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patch
@@ -0,0 +1,49 @@
+From e282569d0437abd39604ded73d9078e994a54db2 Mon Sep 17 00:00:00 2001
+From: Chris Conlon <chris@wolfssl.com>
+Date: Wed, 18 Jun 2025 16:57:02 -0600
+Subject: [PATCH] Add check for reseed in ssl.c for HAVE_SELFTEST, similar to
+ old FIPS bundles that do not have older random.c files
+
+CVE: CVE-2025-7394
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/cdd02f9665ef43126503307972e4389070a00a73
+
+(cherry picked from commit cdd02f9665ef43126503307972e4389070a00a73)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ssl.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/ssl.c b/src/ssl.c
+index e69fa19ac..8f1c79890 100644
+--- a/src/ssl.c
++++ b/src/ssl.c
+@@ -25459,7 +25459,7 @@ static int wolfSSL_RAND_InitMutex(void)
+ #ifdef OPENSSL_EXTRA
+ 
+ #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
+-    defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
++    ((defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)) || defined(HAVE_SELFTEST))
+ /* In older FIPS bundles add check for reseed here since it does not exist in
+  * the older random.c certified files. */
+ static pid_t currentRandPid = 0;
+@@ -25478,7 +25478,9 @@ int wolfSSL_RAND_Init(void)
+             ret = wc_InitRng(&globalRNG);
+             if (ret == 0) {
+             #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
+-                defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
++                ((defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)) || \
++                 defined(HAVE_SELFTEST))
++
+                 currentRandPid = getpid();
+             #endif
+                 initGlobalRNG = 1;
+@@ -25959,7 +25961,8 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int num)
+          */
+         if (initGlobalRNG) {
+         #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
+-                defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
++                ((defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)) || \
++                 defined(HAVE_SELFTEST))
+             pid_t p;
+ 
+             p = getpid();
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index 4f323ec128..78d17630c7 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -21,6 +21,12 @@ SRC_URI = " \
     file://CVE-2025-7395-2.patch \
     file://CVE-2025-7395-3.patch \
     file://CVE-2025-7395-4.patch \
+    file://CVE-2025-7394-1.patch \
+    file://CVE-2025-7394-2.patch \
+    file://CVE-2025-7394-3.patch \
+    file://CVE-2025-7394-4.patch \
+    file://CVE-2025-7394-5.patch \
+    file://CVE-2025-7394-6.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

