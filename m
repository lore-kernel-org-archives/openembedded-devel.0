Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC11C79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:25:10 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31717.1788776702547521077
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UBs273F7;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so4084566a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776702; x=1789381502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQjpUvwoLo31rSfTHVzR82OMLwW3S00z/DMi9Hi7osw=;
        b=UBs273F7wZzCpGn4lkKXiLwkpkLINdXaRjtIoFGGqfN5NirL4PtnPkIDbaRdsEzUUa
         A91iASddR+NU6qBiV2ekh/EGySzp3p1CDsv8pLTmLXwoXhSUfsJbCxLmOyNsrp4Y9OHe
         vL5sEJvCBPZzoamWk64Tf3kDLlJButEqIg3+3s8WLIKgYC3I/HfJsy+gCMGYSLLRn0ix
         WRwXV/xroCzsdXpJJsR7MmdxxeZhxGJiTW3weqt3HWa41NEU9xu963V5ckd5aQEYgWe2
         R9xehMwYbk4u6HKDaxCETcw5vgETjxkFdIt8IU+kfyoQ44prje+XuZ9FEW7KjfkhoBK2
         ua7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776702; x=1789381502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PQjpUvwoLo31rSfTHVzR82OMLwW3S00z/DMi9Hi7osw=;
        b=Wlzjh6DrFTJ5WQqUe/s06owwQy5bGHpkPRvUhzb8dw/92Sa31qMrelujfRzJ342c9U
         bieJ+Gc1jCRt436Kb2o6+U2QhdG2/Ah9TxBXqF6sGolNS1VaefNaCnix+xWbeOV1C7h7
         TBVFzZaHwb9aN1Xt43UkFFj1dvMOUM/2AyCbyR+uDvJHLaDZYbN+g0d6CHUhlWoz7zNL
         OpC/MM9ppH8Zsa8TWH/yRXAbySNFSJt3WU95Wvr64tcuE1s+n7PIbNe4EiUapZGyPzBJ
         7tMoU6a5OiSL4lUpFVH4zbXjNYPjAQpEJMeQ/CQEHmUQbSzFpmt3FFOeTx5I4EqVlUDs
         Y8sQ==
X-Gm-Message-State: AFuF++mHZSilo/B14Azjyl0c7JG7MQ78tNAIj/frb6rAKARE23w5i+rS
	b8F1MwutneunrWxamGxhyx/NH6qJVRiW9fmXUGKJNBrikUqvv0i4T1RLtvuoJz0g
X-Gm-Gg: AYBFou0MzjI9Em8sfp0l5FHrEu+Qr5eqnq2XcHXNecY4qxl7nBzhPTr7svVmvCDmSNX
	5/7t6C+B4oXZRgu0/taSZ+hWN0d8pDd8ibyJlYfzGPkm/xPMQK5G9v0dJF7PnfhFnK0xirI3/gj
	Ux9ehFrW1lI6Iuiw1CYY0Spbzdh0dvG5a0flRqH6YmCO+wznJ7wXuuHibpwz997qhWYVF0ccAYD
	wXp7wZRaiOtjY7fJyAUK8+biq/JSO4HFhgK8hqW+il8ZFjQ7K/62rsszF+gz88fBMA3TrswFYP2
	0hs2mWTuRLIIn+u4FqsrLglvv9XpcMsxdPLkbztROeTtZn4pTfLadG7S8OH/eeEX036PPH/MF0C
	lg7rcumXEoOcAHIDawBIH1aESFrhzGi7ApUXI5RclZF2Rt4c/3qSECiMGwYewX4pZhOgIZkTROj
	q75FZFjH4AsOBB51ieTVasTLGSBJIbW7P6g8DJP795S9vYOANiICbSuHSM5bWdhQa1mj4fhJMt
X-Received: by 2002:a17:90b:2687:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39b2609f768mr37509491a91.5.1788776701877;
        Mon, 07 Sep 2026 03:25:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:25:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 33/33] wolfssl: patch CVE-2026-7531
Date: Mon,  7 Sep 2026 22:23:17 +1200
Message-ID: <20260907102318.2459883-33-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129845

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-7531

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-7531.patch         | 180 ++++++++++++++++++
 .../wolfssl/wolfssl_5.9.1.bb                  |   1 +
 2 files changed, 181 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-7531.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-7531.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-7531.patch
new file mode 100644
index 0000000000..1d4e7605b3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-7531.patch
@@ -0,0 +1,180 @@
+From 5ab994ddce690cc904554ff03af263ef0624d29d Mon Sep 17 00:00:00 2001
+From: David Garske <david@wolfssl.com>
+Date: Tue, 5 May 2026 11:41:43 -0700
+Subject: [PATCH] Merge pull request #10327 from embhorn/zd21704
+
+Hardening in TLSX_KeyShare_ProcessPqcHybridClient
+
+CVE: CVE-2026-7531
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/3b7ac9fd256b26c33b66f9315c319465ba3bcfeb]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/tls.c              | 19 +++++---
+ tests/api/test_tls13.c | 98 ++++++++++++++++++++++++++++++++++++++++++
+ tests/api/test_tls13.h |  2 +
+ 3 files changed, 114 insertions(+), 5 deletions(-)
+
+diff --git a/src/tls.c b/src/tls.c
+index 18aad71d3..e5b989482 100644
+--- a/src/tls.c
++++ b/src/tls.c
+@@ -10187,15 +10187,24 @@ static int TLSX_KeyShare_ProcessPqcHybridClient(WOLFSSL* ssl,
+             ecc_kse->key = NULL;
+             pqc_kse->privKey = NULL;
+         }
++        else
+     #endif
++        {
++            /* Re-sync keyShareEntry->key with ecc_kse->key. ecc_kse->key was
++             * aliased to keyShareEntry->key above. The inner Process*_ex
++             * either ran its end-of-function cleanup and set ecc_kse->key
++             * to NULL (so the outer pointer must also become NULL to avoid
++             * UAF/double-free in TLSX_KeyShare_FreeAll), or returned early
++             * before cleanup with ecc_kse->key still pointing at the live
++             * key (so the outer pointer must keep that pointer for later
++             * freeing). Mirroring whatever the inner left in ecc_kse->key
++             * handles both cases correctly. */
++            keyShareEntry->key = ecc_kse->key;
++        }
+     }
+ 
+     if (ret == 0) {
+-        keyShareEntry->key = ecc_kse->key;
+-        ecc_kse->key = NULL;
+-
+-        if ((ret == 0) &&
+-            ((ssl->arrays->preMasterSz + ssSzPqc) > ENCRYPT_LEN)) {
++        if ((ssl->arrays->preMasterSz + ssSzPqc) > ENCRYPT_LEN) {
+             WOLFSSL_MSG("shared secret is too long.");
+             ret = LENGTH_ERROR;
+         }
+diff --git a/tests/api/test_tls13.c b/tests/api/test_tls13.c
+index 63ddffb7a..af050a234 100644
+--- a/tests/api/test_tls13.c
++++ b/tests/api/test_tls13.c
+@@ -3581,6 +3581,104 @@ int test_tls13_pqc_hybrid_truncated_keyshare(void)
+     return EXPECT_RESULT();
+ }
+ 
++/* Test that a malformed ECDH portion in a correctly-sized PQC hybrid
++ * KeyShare does not leave a dangling pointer in keyShareEntry->key.
++ *
++ * The earlier truncated-keyshare test is rejected by the keLen <= ctSz
++ * check before TLSX_KeyShare_ProcessPqcHybridClient sets up the
++ * ecc_kse->key = keyShareEntry->key alias, so it does not exercise the
++ * dangling-pointer path. This test sends a SECP256R1MLKEM768 key_share
++ * whose total length is correct (65-byte ECDH point + 1088-byte ML-KEM
++ * ciphertext = 1153 bytes) but whose ECDH leading byte (0x05) is not a
++ * valid X9.63 marker. ProcessEcc_ex then fails at wc_ecc_import_x963
++ * AFTER its unconditional cleanup at the end of the function frees the
++ * aliased key. Without the fix, the outer keyShareEntry->key still
++ * holds the freed pointer; wolfSSL_free -> TLSX_KeyShare_FreeAll calls
++ * wc_ecc_free + XFREE on it, producing a use-after-free and a double
++ * free that ASAN flags. */
++int test_tls13_pqc_hybrid_malformed_ecdh(void)
++{
++    EXPECT_DECLS;
++#if defined(WOLFSSL_TLS13) && !defined(NO_WOLFSSL_CLIENT) && \
++    defined(WOLFSSL_HAVE_MLKEM) && defined(WOLFSSL_PQC_HYBRIDS) && \
++    !defined(WOLFSSL_NO_ML_KEM_768) && defined(HAVE_ECC) && \
++    !defined(WOLFSSL_MLKEM_NO_DECAPSULATE) && \
++    !defined(WOLFSSL_MLKEM_NO_MAKE_KEY) && \
++    (!defined(NO_ECC256) || defined(HAVE_ALL_CURVES)) && \
++    !defined(NO_ECC_SECP)
++    WOLFSSL_CTX *ctx = NULL;
++    WOLFSSL *ssl = NULL;
++    /* 5 (record) + 4 (HS) + 1207 (ServerHello body) = 1216 bytes. */
++    static byte serverHello[1216];
++    word32 i = 0;
++    WOLFSSL_BUFFER_INFO msg;
++
++    XMEMSET(serverHello, 0, sizeof(serverHello));
++
++    /* Record: handshake, TLS 1.2 compat, length 1211 (0x04bb). */
++    serverHello[i++] = 0x16; serverHello[i++] = 0x03; serverHello[i++] = 0x03;
++    serverHello[i++] = 0x04; serverHello[i++] = 0xbb;
++    /* Handshake: ServerHello (0x02), length 1207 (0x0004b7). */
++    serverHello[i++] = 0x02;
++    serverHello[i++] = 0x00; serverHello[i++] = 0x04; serverHello[i++] = 0xb7;
++    /* legacy_version */
++    serverHello[i++] = 0x03; serverHello[i++] = 0x03;
++    /* random (32 bytes) */
++    XMEMSET(&serverHello[i], 0x42, 32); i += 32;
++    /* legacy_session_id_echo length: 0 */
++    serverHello[i++] = 0x00;
++    /* cipher_suite: TLS_AES_128_GCM_SHA256 */
++    serverHello[i++] = 0x13; serverHello[i++] = 0x01;
++    /* legacy_compression_method: null */
++    serverHello[i++] = 0x00;
++    /* extensions length: 1167 (0x048f) */
++    serverHello[i++] = 0x04; serverHello[i++] = 0x8f;
++    /* extension: supported_versions -> TLS 1.3 */
++    serverHello[i++] = 0x00; serverHello[i++] = 0x2b;
++    serverHello[i++] = 0x00; serverHello[i++] = 0x02;
++    serverHello[i++] = 0x03; serverHello[i++] = 0x04;
++    /* extension: key_share, extension_data length 1157 (0x0485) */
++    serverHello[i++] = 0x00; serverHello[i++] = 0x33;
++    serverHello[i++] = 0x04; serverHello[i++] = 0x85;
++    /* server_share.group: SECP256R1MLKEM768 (0x11eb) */
++    serverHello[i++] = 0x11; serverHello[i++] = 0xeb;
++    /* key_exchange length: 1153 (0x0481) */
++    serverHello[i++] = 0x04; serverHello[i++] = 0x81;
++    /* ECDH portion (65 bytes): leading 0x05 is not a valid X9.63 marker
++     * (valid markers: 0x04, 0x06, 0x07). The remaining 64 bytes stay zero
++     * from the initial XMEMSET. */
++    serverHello[i++] = 0x05;
++    i += 64;
++    /* PQC portion (1088 bytes): all zero from the initial XMEMSET. */
++    i += 1088;
++    AssertIntEQ((int)i, (int)sizeof(serverHello));
++
++    ExpectNotNull(ctx = wolfSSL_CTX_new(wolfTLSv1_3_client_method()));
++    wolfSSL_SetIORecv(ctx, PqcHybridUafRecv);
++    wolfSSL_SetIOSend(ctx, PqcHybridUafSend);
++
++    ExpectNotNull(ssl = wolfSSL_new(ctx));
++
++    /* Match the server's offered group so this key_share is processed. */
++    ExpectIntEQ(wolfSSL_UseKeyShare(ssl, WOLFSSL_SECP256R1MLKEM768),
++        WOLFSSL_SUCCESS);
++
++    msg.buffer = serverHello;
++    msg.length = (unsigned int)sizeof(serverHello);
++    wolfSSL_SetIOReadCtx(ssl, &msg);
++
++    /* Connect should fail gracefully on the malformed ECDH point. */
++    ExpectIntEQ(wolfSSL_connect_TLSv13(ssl),
++        WC_NO_ERR_TRACE(WOLFSSL_FATAL_ERROR));
++
++    /* Without the fix, this triggers UAF + double-free in
++     * TLSX_KeyShare_FreeAll. */
++    wolfSSL_free(ssl);
++    wolfSSL_CTX_free(ctx);
++#endif
++    return EXPECT_RESULT();
++}
++
+ /* Test that a TLS 1.3 NewSessionTicket with a ticket shorter than ID_LEN
+  * (32 bytes) does not cause an unsigned integer underflow / OOB read in
+  * SetTicket. Uses a full memio handshake, then injects a crafted
+diff --git a/tests/api/test_tls13.h b/tests/api/test_tls13.h
+index c8eaa3b7f..94232f18e 100644
+--- a/tests/api/test_tls13.h
++++ b/tests/api/test_tls13.h
+@@ -43,6 +43,7 @@ int test_tls13_warning_alert_is_fatal(void);
+ int test_tls13_cert_req_sigalgs(void);
+ int test_tls13_derive_keys_no_key(void);
+ int test_tls13_pqc_hybrid_truncated_keyshare(void);
++int test_tls13_pqc_hybrid_malformed_ecdh(void);
+ int test_tls13_short_session_ticket(void);
+ 
+ #define TEST_TLS13_DECLS                                        \
+@@ -65,6 +66,7 @@ int test_tls13_short_session_ticket(void);
+     TEST_DECL_GROUP("tls13", test_tls13_cert_req_sigalgs),       \
+     TEST_DECL_GROUP("tls13", test_tls13_derive_keys_no_key),    \
+     TEST_DECL_GROUP("tls13", test_tls13_pqc_hybrid_truncated_keyshare), \
++    TEST_DECL_GROUP("tls13", test_tls13_pqc_hybrid_malformed_ecdh), \
+     TEST_DECL_GROUP("tls13", test_tls13_short_session_ticket)
+ 
+ #endif /* WOLFCRYPT_TEST_TLS13_H */
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
index ef03d0c9ff..644c5379f5 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
@@ -36,6 +36,7 @@ SRC_URI = " \
     file://CVE-2026-6450-2.patch \
     file://CVE-2026-6731-1.patch \
     file://CVE-2026-6731-2.patch \
+    file://CVE-2026-7531.patch \
 "
 
 SRCREV = "1d363f3adceba9d1478230ede476a37b0dcdef24"

