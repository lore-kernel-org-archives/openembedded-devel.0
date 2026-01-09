Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FBCD167E2
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:29:26 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6764.1767950958846960762
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 01:29:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cJR16rDn;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c47ee987401so1252971a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 01:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767950958; x=1768555758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXEZ/Xif13+HCHrFDuRxt5e3NwrYcSviKupvNI/gezA=;
        b=cJR16rDnusmDuHquDp11nPD28Cd8zyF0zg+1qSP0+CczB2GAPcIC9rAN+4FsBNH1G7
         Z6xteXRgQx9RyAl7evlIvUq8qDJO3yNBSjGZnr7cuyigv8iRFJIH6p/Q0nsxbIEYQJ0K
         5cWJNF1YE9/0UWEchuguAmItBEi8yYhBnOISrq/06cPOdT0mOI15lk1CacfP5Lia1zSr
         GPD1EXeKNm+rWZfiz4EmPhJc4YK549aUpi/+xWbhKCo+d2OLmRb3pf594t6fhqGftIOF
         DHQYuGxoknYyq8FFuXzpqzET/1+HUuRdtSmqKNHxjhMdawidTyA7MX+vIkwgB9GYe8nQ
         656A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950958; x=1768555758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KXEZ/Xif13+HCHrFDuRxt5e3NwrYcSviKupvNI/gezA=;
        b=RP+xQ6TvjxxF6TSfSpUJ4CcDtw1Pjd4tAR4Z5XnxXtc3mBKaTh71oiW7TvyktNrftX
         MZ/DU694XbwLgHa+26GrsPV+zJXbJ1zYHUgICcmvf33iNWjkq0M7FkNRtWW/1x3QMMmV
         i8sYY0Unk2rsOr016Kpm9JbaAp/8HUZI4Q25N/WC95iKdWrqu3u4khr/csehkFdxH5sj
         SmpTxC6R4QW+r3YCUdsMD/2lszt0VYRwrG+YFDpdEWz11oFP4jcOaA3wEtn85WJm3rjO
         owA58oVvKK4isbeP4DHusF3Sc8JFWVERlXKNjZTayrlnip0XDf8gBTW6nAt+b64iI7TP
         /vAA==
X-Gm-Message-State: AOJu0Ywvn7Glv44i7A7VjZWbhOjet9ab7jfM0QRqUEPuPY8f8ngnF3Y8
	5Sf5QbCKO2pRJd3xjPaCaOPWbZklSW17gRVPrWyM81OOtAzl2Xrc5R/v3BWskw==
X-Gm-Gg: AY/fxX4TV7blcOULNByAOXyFNIXT3Cpx5SYj7XrizulFyLaEX08wYyUmgRHfUF4BsCT
	OBH8FCq0Q5I1FdcF0GPU2K5SmT+uL3lsk5rCKk4BszRZJ4KqANI4qmCVKJ1HQzIyfGHJ6HiBLHX
	GXzpbZN+1YQ4rcfWuAIWE9bHTCmWB7nrg0S1DCBv2FhIwH/MUiEgXu6rU3kY7833eD4LFuqTLB0
	iZmu8jSOjFckPrpjcmdbysIQlsOrpus9SZYxQ8Y+i7msL5gx96q5mfAPuDi1V3x82LXJV1jKU05
	Fa/Z48Ux1RJLFhxBwJqzFQyHKIO0N3fNbxM+YtvxxIZjtGinUkwVSylnEmto+FWvrhLAqmgZ95h
	fSccrOJLZl8VSkXcLFg3mCOmm3pDOgdNAegMHax6kMhHTtbxGCb3LcuxT2KweOmQdaJQ2gBaIMx
	36xU9yXAg9ULqqO/vMyqHl5eY=
X-Google-Smtp-Source: AGHT+IF4drDpYL8F0RBIJJd2UGg9nP86+Nwk1vZ5+DVMf4uNiCiSffoKvznt5uQEBIfoehzh5zFOVw==
X-Received: by 2002:a05:6a20:6a04:b0:342:a261:e2c9 with SMTP id adf61e73a8af0-3898e9c6f99mr9490074637.8.1767950957722;
        Fri, 09 Jan 2026 01:29:17 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm99529295ad.75.2026.01.09.01.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:29:17 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 11/12] wolfssl: patch CVE-2025-7394
Date: Fri,  9 Jan 2026 22:28:41 +1300
Message-ID: <20260109092843.1924568-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
References: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 09:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123289

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-7394

Backport patches from the PR[1][2][3] mentioned in the changelog[4].

[1] https://github.com/wolfSSL/wolfssl/pull/8849
[2] https://github.com/wolfSSL/wolfssl/pull/8867
[3] https://github.com/wolfSSL/wolfssl/pull/8898
[4] https://github.com/wolfSSL/wolfssl/blob/master/ChangeLog.md#wolfssl-release-582-july-17-2025

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2025-7394-1.patch       |  46 +++
 .../wolfssl/files/CVE-2025-7394-2.patch       | 275 ++++++++++++++++++
 .../wolfssl/files/CVE-2025-7394-3.patch       | 125 ++++++++
 .../wolfssl/files/CVE-2025-7394-4.patch       |  85 ++++++
 .../wolfssl/files/CVE-2025-7394-5.patch       |  40 +++
 .../wolfssl/files/CVE-2025-7394-6.patch       |  48 +++
 .../wolfssl/wolfssl_5.7.2.bb                  |   6 +
 7 files changed, 625 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patch
new file mode 100644
index 0000000000..e561b266f0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patch
@@ -0,0 +1,46 @@
+From 6d0ee56813d69eee72108e1dc859743e02f70077 Mon Sep 17 00:00:00 2001
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
+index 9ba891d62..a1421d523 100644
+--- a/src/ssl.c
++++ b/src/ssl.c
+@@ -24159,11 +24159,25 @@ int wolfSSL_RAND_poll(void)
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
index 0000000000..883a5a1137
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patch
@@ -0,0 +1,275 @@
+From b506ed4aeb2c86788422427624a03eb9bda52efc Mon Sep 17 00:00:00 2001
+From: JacobBarthelmeh <jacob@wolfssl.com>
+Date: Tue, 10 Jun 2025 12:49:08 -0600
+Subject: [PATCH] add sanity checks on pid with RNG
+
+CVE: CVE-2025-7394
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/31490ab813a5aac096f50800c26c690d8ae586d2]
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
+index 4e6f05fc6..910a36648 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -124,6 +124,7 @@ check_function_exists("memset" HAVE_MEMSET)
+ check_function_exists("socket" HAVE_SOCKET)
+ check_function_exists("strftime" HAVE_STRFTIME)
+ check_function_exists("__atomic_fetch_add" HAVE_C___ATOMIC)
++check_function_exists("getpid" HAVE_GETPID)
+ 
+ include(CheckTypeSize)
+ 
+diff --git a/configure.ac b/configure.ac
+index c973b7e39..43ddd4767 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -125,8 +125,8 @@ AC_CHECK_HEADER(stdatomic.h, [AM_CPPFLAGS="$AM_CPPFLAGS -DWOLFSSL_HAVE_ATOMIC_H"
+ # check if functions of interest are linkable, but also check if
+ # they're declared by the expected headers, and if not, supersede the
+ # unusable positive from AC_CHECK_FUNCS().
+-AC_CHECK_FUNCS([gethostbyname getaddrinfo gettimeofday gmtime_r gmtime_s inet_ntoa memset socket strftime atexit])
+-AC_CHECK_DECLS([gethostbyname, getaddrinfo, gettimeofday, gmtime_r, gmtime_s, inet_ntoa, memset, socket, strftime, atexit], [], [
++AC_CHECK_FUNCS([gethostbyname getaddrinfo gettimeofday gmtime_r gmtime_s inet_ntoa memset socket strftime atexit getpid])
++AC_CHECK_DECLS([gethostbyname, getaddrinfo, gettimeofday, gmtime_r, gmtime_s, inet_ntoa, memset, socket, strftime, atexit, getpid], [], [
+ if test "$(eval echo \$"$(eval 'echo ac_cv_func_${as_decl_name}')")" = "yes"
+ then
+     AC_MSG_NOTICE([    note: earlier check for $(eval 'echo ${as_decl_name}') superseded.])
+diff --git a/src/ssl.c b/src/ssl.c
+index a1421d523..872aed594 100644
+--- a/src/ssl.c
++++ b/src/ssl.c
+@@ -23615,6 +23615,10 @@ int wolfSSL_RAND_Init(void)
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
+@@ -24045,8 +24049,30 @@ int wolfSSL_RAND_pseudo_bytes(unsigned char* buf, int num)
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
+@@ -24089,6 +24115,16 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int num)
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
+index 89c7411c9..b440e274b 100644
+--- a/wolfcrypt/src/random.c
++++ b/wolfcrypt/src/random.c
+@@ -1599,6 +1599,9 @@ static int _InitRng(WC_RNG* rng, byte* nonce, word32 nonceSz,
+ #else
+     rng->heap = heap;
+ #endif
++#ifdef HAVE_GETPID
++    rng->pid = getpid();
++#endif
+ #if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)
+     rng->devId = devId;
+     #if defined(WOLF_CRYPTO_CB)
+@@ -1849,6 +1852,63 @@ int wc_InitRngNonce_ex(WC_RNG* rng, byte* nonce, word32 nonceSz,
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
+@@ -1908,60 +1968,22 @@ int wc_RNG_GenerateBlock(WC_RNG* rng, byte* output, word32 sz)
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
+index 9dd616328..f472e1f40 100644
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
index 0000000000..e70a3fec80
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patch
@@ -0,0 +1,125 @@
+From 62a3a4f0b8b307bdacc34204db44627521de4bf9 Mon Sep 17 00:00:00 2001
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
+index 872aed594..f0186b253 100644
+--- a/src/ssl.c
++++ b/src/ssl.c
+@@ -23603,6 +23603,12 @@ static int wolfSSL_RAND_InitMutex(void)
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
+@@ -23616,8 +23622,8 @@ int wolfSSL_RAND_Init(void)
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
+@@ -24049,28 +24055,6 @@ int wolfSSL_RAND_pseudo_bytes(unsigned char* buf, int num)
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
+@@ -24114,17 +24098,27 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int num)
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
+@@ -24201,6 +24195,11 @@ int wolfSSL_RAND_poll(void)
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
+@@ -24209,6 +24208,7 @@ int wolfSSL_RAND_poll(void)
+         else {
+             ret = WOLFSSL_SUCCESS;
+         }
++        wc_UnLockMutex(&globalRNGMutex);
+ #else
+         WOLFSSL_MSG("RAND_poll called with HAVE_HASHDRBG not set");
+         ret = WOLFSSL_FAILURE;
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patch
new file mode 100644
index 0000000000..7d6413f7ca
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patch
@@ -0,0 +1,85 @@
+From d7a68e85ebe4705e7345b0e5012c806615cd86c7 Mon Sep 17 00:00:00 2001
+From: JacobBarthelmeh <jacob@wolfssl.com>
+Date: Tue, 10 Jun 2025 16:12:09 -0600
+Subject: [PATCH] add a way to restore previous pid behavior
+
+CVE: CVE-2025-7394
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/47cf634965a3aabe82fd97a8feed9efd6688e34a]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ssl.c                  | 11 ++++++-----
+ wolfcrypt/src/random.c     |  4 ++--
+ wolfssl/wolfcrypt/random.h |  2 +-
+ 3 files changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/src/ssl.c b/src/ssl.c
+index f0186b253..e214fa504 100644
+--- a/src/ssl.c
++++ b/src/ssl.c
+@@ -23603,7 +23603,8 @@ static int wolfSSL_RAND_InitMutex(void)
+ 
+ #ifdef OPENSSL_EXTRA
+ 
+-#if defined(HAVE_GETPID) && defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
++#if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
++    defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
+ /* In older FIPS bundles add check for reseed here since it does not exist in
+  * the older random.c certified files. */
+ static pid_t currentRandPid = 0;
+@@ -23621,8 +23622,8 @@ int wolfSSL_RAND_Init(void)
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
+@@ -24098,8 +24099,8 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int num)
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
+index b440e274b..dc89db542 100644
+--- a/wolfcrypt/src/random.c
++++ b/wolfcrypt/src/random.c
+@@ -1599,7 +1599,7 @@ static int _InitRng(WC_RNG* rng, byte* nonce, word32 nonceSz,
+ #else
+     rng->heap = heap;
+ #endif
+-#ifdef HAVE_GETPID
++#if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID)
+     rng->pid = getpid();
+ #endif
+ #if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)
+@@ -1968,7 +1968,7 @@ int wc_RNG_GenerateBlock(WC_RNG* rng, byte* output, word32 sz)
+     if (rng->status != DRBG_OK)
+         return RNG_FAILURE_E;
+ 
+-#ifdef HAVE_GETPID
++#if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID)
+     if (rng->pid != getpid()) {
+         rng->pid = getpid();
+         ret = PollAndReSeed(rng);
+diff --git a/wolfssl/wolfcrypt/random.h b/wolfssl/wolfcrypt/random.h
+index f472e1f40..320641548 100644
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
index 0000000000..6747f24352
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patch
@@ -0,0 +1,40 @@
+From 670437d91ae3025b4721eb4f450e5dc31fc3d6ee Mon Sep 17 00:00:00 2001
+From: Chris Conlon <chris@wolfssl.com>
+Date: Wed, 18 Jun 2025 16:08:34 -0600
+Subject: [PATCH] Add HAVE_GETPID to options.h if getpid detected, needed for
+ apps to correctly detect size of WC_RNG struct
+
+CVE: CVE-2025-7394
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/9c35c0de65e135e621400958f22829c0d2555ed4]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ configure.ac | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 43ddd4767..636c45aef 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -156,6 +156,9 @@ fi
+ #ifdef HAVE_STDLIB_H
+     #include <stdlib.h>
+ #endif
++#ifdef HAVE_UNISTD_H
++    #include <unistd.h>
++#endif
+ ]])
+ 
+ AC_PROG_INSTALL
+@@ -9479,6 +9482,12 @@ then
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
index 0000000000..e86bc8bc56
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patch
@@ -0,0 +1,48 @@
+From aaad0035e4e795b8b225bd481e3942de015a362d Mon Sep 17 00:00:00 2001
+From: Chris Conlon <chris@wolfssl.com>
+Date: Wed, 18 Jun 2025 16:57:02 -0600
+Subject: [PATCH] Add check for reseed in ssl.c for HAVE_SELFTEST, similar to
+ old FIPS bundles that do not have older random.c files
+
+CVE: CVE-2025-7394
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/cdd02f9665ef43126503307972e4389070a00a73
+(cherry picked from commit cdd02f9665ef43126503307972e4389070a00a73)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ssl.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/ssl.c b/src/ssl.c
+index e214fa504..e538233fc 100644
+--- a/src/ssl.c
++++ b/src/ssl.c
+@@ -23604,7 +23604,7 @@ static int wolfSSL_RAND_InitMutex(void)
+ #ifdef OPENSSL_EXTRA
+ 
+ #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
+-    defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
++    ((defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)) || defined(HAVE_SELFTEST))
+ /* In older FIPS bundles add check for reseed here since it does not exist in
+  * the older random.c certified files. */
+ static pid_t currentRandPid = 0;
+@@ -23623,7 +23623,9 @@ int wolfSSL_RAND_Init(void)
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
+@@ -24100,7 +24102,8 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int num)
+          */
+         if (initGlobalRNG) {
+         #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
+-                defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
++                ((defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)) || \
++                 defined(HAVE_SELFTEST))
+             pid_t p;
+ 
+             p = getpid();
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
index 5e66c8b186..0dc488dc24 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
@@ -17,6 +17,12 @@ SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master \
            file://CVE-2025-7395-1.patch \
            file://CVE-2025-7395-2.patch \
            file://CVE-2025-7395-3.patch \
+           file://CVE-2025-7394-1.patch \
+           file://CVE-2025-7394-2.patch \
+           file://CVE-2025-7394-3.patch \
+           file://CVE-2025-7394-4.patch \
+           file://CVE-2025-7394-5.patch \
+           file://CVE-2025-7394-6.patch \
            "
 SRCREV = "00e42151ca061463ba6a95adb2290f678cbca472"
 

