Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCB5C79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:49 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31709.1788776681128070407
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BJF/c4+f;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso2417198a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776680; x=1789381480; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/uaoDC/Eotzbq81q9Prg8lzbDhgg4CMNuyUCblR5jPQ=;
        b=BJF/c4+fcIR05aQqCokE4Q4IsG+czoZxIzMuqIgkrLfvpfL33NLS04JBNuA4I8gz1W
         nZownjnxxpzR+flKoSO6EfwbQEj2zaOm4xCOwG7ExylNAOqTMqfuFNI55VOAG3lRCV5I
         QdlzYQskl0zP9uivX3IxKCXHr5J6U2izvQcOvB9bVP3EobpLRbCVfV80G9eqWcF1uXvY
         hX+3OxLetzOO0H4+EyvqV61k9aLhq1OwhF/K9uOrmOmZb7IDjHTUwyaJ9wfsCW2zcIOq
         o0jWOu0mNPFkpLOtZJ5OJf/DZ9Qk35mMFaCnBdc+6GHfRFg2JSBgeh+8pMqRJThueIk3
         OiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776680; x=1789381480;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uaoDC/Eotzbq81q9Prg8lzbDhgg4CMNuyUCblR5jPQ=;
        b=Fnczkla8s98Je2mUU8yWT9rjeT7qRJABbB0GY+NOBGyUrbWmZQcab0kiFImPxm3Kf7
         k/YIzYT4e8re3mPWmV7oVBSobgYwgIqoudN5Uv2b2qpKz2Pvs3oJgmdzi8fW05LfGFLC
         jfBy/kwok00ACuGo+S1Kqj11uPvP2Apv9Gsbt3CchkDcjGvgnoB5yQnZ1cHYx0RI7G4t
         l6x6CXEQSvkDipLv461wsnRzWbXyQx6TTufmdvPciruoPtPr2tsbml+FN3TpLMrHocbJ
         tMRCrf1tnUvYh449XwQoNxxImkdX5XpIX47mO4by18lfApDD5tuWq+dO6k92XAKaX772
         tGRA==
X-Gm-Message-State: AFuF++n9oZ2BnW32fcVdTMd4rYhE0R3iVlIvfZ1keA2aPbKzxKcfafoJ
	wrTEdlhhgWuUBGkD1amKz6qzBI2Do741I9f2kv//D/oPWzoI9ALgRZNanunH0JIB
X-Gm-Gg: AYBFou03EvR5T4erPQMaC2UJNX0AapxNDz7Ua3yIWmwWLU4u5vLPWNmztHiwPlqWfn+
	/5U/SYEeWcGg6iptcMARGGyZ74iomukKdEXiOu9ENd/sk3QmHgOOljTcML3FNXT796uy4YIlTNB
	pX7+4A+ht37ugk7mlBagk1y3O5PGHOcbiixIii5FKxpkkXkTuycEPqXFcjuzOP65ycbwUHLr9oA
	PJcApWi5GPYNW4g9fOY1359bwc+CcRTno/qcnN3m5AwP5lNeifQFDvY6b8OyjzpaAUeZbXDcZQI
	rSaxUwta/mKe6qipYceAS++cKUGM0sBb6zuJ0mWRTbdP519BuYQ5qFgnD2wX2g+eugKC0TW12JS
	whxoL0SV9jCdAwI+3hhG4WrWTxIiDkIR3CGCTQ7TdTlDjYDwJebTl+/eppUaG+JbB6cMjhUTxik
	t4MpUiC25hQpc5ssghMDRM1RBhRhk8sB/IWv44O5o2hKoEbJ2wFUcmXZVLaW0s8xLOtB8EMAqK
X-Received: by 2002:a05:6a21:510:b0:3d3:adbf:777e with SMTP id adf61e73a8af0-3da3a167fb9mr35253516637.19.1788776680378;
        Mon, 07 Sep 2026 03:24:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 26/33] wolfssl: patch CVE-2026-6092
Date: Mon,  7 Sep 2026 22:23:10 +1200
Message-ID: <20260907102318.2459883-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129838

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-6092

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-6092.patch         | 163 ++++++++++++++++++
 .../wolfssl/wolfssl_5.9.1.bb                  |   1 +
 2 files changed, 164 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6092.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6092.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6092.patch
new file mode 100644
index 0000000000..80868d255e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6092.patch
@@ -0,0 +1,163 @@
+From 5e2fa43aed59a2524c33a443c93445882519677b Mon Sep 17 00:00:00 2001
+From: Eric Blankenhorn <eric@wolfssl.com>
+Date: Wed, 8 Apr 2026 15:06:11 -0500
+Subject: [PATCH] Fix ETM on resumption
+
+(cherry picked from commit af5369636a938faf4a79d1f550d3b206c51fafec)
+
+CVE: CVE-2026-6092
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/af5369636a938faf4a79d1f550d3b206c51fafec]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/internal.c       | 20 +++++++----
+ tests/api/test_tls.c | 83 ++++++++++++++++++++++++++++++++++++++++++++
+ tests/api/test_tls.h |  2 ++
+ 3 files changed, 99 insertions(+), 6 deletions(-)
+
+diff --git a/src/internal.c b/src/internal.c
+index ad1587e0f..267c75a5d 100644
+--- a/src/internal.c
++++ b/src/internal.c
+@@ -38436,13 +38436,21 @@ static int AddPSKtoPreMasterSecret(WOLFSSL* ssl)
+ 
+ #if defined(HAVE_TLS_EXTENSIONS) && defined(HAVE_ENCRYPT_THEN_MAC) && \
+     !defined(WOLFSSL_AEAD_ONLY)
+-            if (ssl->options.encThenMac && ssl->specs.cipher_type == block) {
+-                ret = TLSX_EncryptThenMac_Respond(ssl);
+-                if (ret != 0)
+-                    goto out;
++            /* Only respond to ETM here when resumption actually succeeded;
++             * HandleTlsResumption populates ssl->specs via SetCipherSpecs only
++             * on the success path. If resumption failed, resuming has been
++             * cleared and ssl->specs.cipher_type is still zero-initialized,
++             * so we must defer the ETM decision until after MatchSuite. */
++            if (ssl->options.resuming) {
++                if (ssl->options.encThenMac &&
++                                          ssl->specs.cipher_type == block) {
++                    ret = TLSX_EncryptThenMac_Respond(ssl);
++                    if (ret != 0)
++                        goto out;
++                }
++                else
++                    ssl->options.encThenMac = 0;
+             }
+-            else
+-                ssl->options.encThenMac = 0;
+ #endif
+             if (ssl->options.clientState == CLIENT_KEYEXCHANGE_COMPLETE) {
+                 WOLFSSL_LEAVE("DoClientHello", ret);
+diff --git a/tests/api/test_tls.c b/tests/api/test_tls.c
+index 565006171..f6cbb6d38 100644
+--- a/tests/api/test_tls.c
++++ b/tests/api/test_tls.c
+@@ -730,6 +730,89 @@ int test_tls12_no_null_compression(void)
+  * uppercase names like "SECP384R1" do not match the lowercase "secp384r1"
+  * entry; they fall through to the wolfCrypt ECC look-up which uses
+  * XSTRCASECMP. */
++/* Regression test for the encrypt-then-MAC silent-disable bug.
++ *
++ * Before the fix, when a client sent a 32-byte session ID in its ClientHello
++ * (so the server set ssl->options.resuming = 1) but the server's session
++ * cache did not contain that session, DoClientHello would run an
++ * encrypt_then_mac decision *before* MatchSuite/SetCipherSpecs had populated
++ * ssl->specs.cipher_type.  Because cipher_type was zero-initialized
++ * (== stream, not block), the ETM block cleared encThenMac to 0, and the
++ * post-MatchSuite block could not re-enable it.  The connection then
++ * silently negotiated MAC-then-encrypt instead of encrypt-then-MAC.
++ *
++ * This test forces a stale-resumption ClientHello against a server with an
++ * empty session cache, using a CBC-mode cipher suite, and asserts that the
++ * server still negotiates encrypt-then-MAC. */
++int test_tls12_etm_failed_resumption(void)
++{
++    EXPECT_DECLS;
++#if defined(HAVE_MANUAL_MEMIO_TESTS_DEPENDENCIES) && \
++    !defined(WOLFSSL_NO_TLS12) && defined(HAVE_ENCRYPT_THEN_MAC) && \
++    !defined(WOLFSSL_AEAD_ONLY) && !defined(NO_RSA) && !defined(NO_AES) && \
++    defined(HAVE_AES_CBC) && !defined(NO_SHA256) && \
++    defined(HAVE_SESSION_TICKET) && defined(HAVE_ECC)
++    /* TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 — a CBC suite, where ETM applies. */
++    const char* cbcSuite = "ECDHE-RSA-AES128-SHA256";
++    WOLFSSL_CTX *ctx_c = NULL, *ctx_s = NULL;
++    WOLFSSL *ssl_c = NULL, *ssl_s = NULL;
++    WOLFSSL_SESSION *sess = NULL;
++    struct test_memio_ctx test_ctx;
++
++    /* First handshake: establish a session-ID-based session on the client.
++     * Disable TLS 1.2 session tickets on both sides so resumption uses the
++     * session ID path (not tickets), which is the path the bug lives on. */
++    XMEMSET(&test_ctx, 0, sizeof(test_ctx));
++    ExpectIntEQ(test_memio_setup(&test_ctx, &ctx_c, &ctx_s, &ssl_c, &ssl_s,
++                    wolfTLSv1_2_client_method, wolfTLSv1_2_server_method), 0);
++    ExpectIntEQ(wolfSSL_NoTicketTLSv12(ssl_c), WOLFSSL_SUCCESS);
++    ExpectIntEQ(wolfSSL_NoTicketTLSv12(ssl_s), WOLFSSL_SUCCESS);
++    ExpectIntEQ(wolfSSL_set_cipher_list(ssl_c, cbcSuite), WOLFSSL_SUCCESS);
++    ExpectIntEQ(wolfSSL_set_cipher_list(ssl_s, cbcSuite), WOLFSSL_SUCCESS);
++    ExpectIntEQ(test_memio_do_handshake(ssl_c, ssl_s, 10, NULL), 0);
++    /* Sanity: the first handshake itself must use ETM. */
++    ExpectIntEQ(ssl_s->options.encThenMac, 1);
++    ExpectNotNull(sess = wolfSSL_get1_session(ssl_c));
++
++    wolfSSL_free(ssl_c); ssl_c = NULL;
++    wolfSSL_free(ssl_s); ssl_s = NULL;
++    wolfSSL_CTX_free(ctx_c); ctx_c = NULL;
++    wolfSSL_CTX_free(ctx_s); ctx_s = NULL;
++
++    /* Second handshake against a *fresh* server context (empty cache).  The
++     * client offers the saved session, so the server's ClientHello parser
++     * sets options.resuming = 1, but HandleTlsResumption then fails to find
++     * the session and clears resuming.  Pre-fix, ETM was silently dropped
++     * here. */
++    XMEMSET(&test_ctx, 0, sizeof(test_ctx));
++    ExpectIntEQ(test_memio_setup(&test_ctx, &ctx_c, &ctx_s, &ssl_c, &ssl_s,
++                    wolfTLSv1_2_client_method, wolfTLSv1_2_server_method), 0);
++    /* The internal session cache is process-global, so the saved session is
++     * still findable via the cache.  Disable lookups on this server SSL
++     * directly so that HandleTlsResumption hits its "session lookup failed"
++     * path — exactly the scenario the bug fix targets. */
++    ssl_s->options.sessionCacheOff = 1;
++    ExpectIntEQ(wolfSSL_NoTicketTLSv12(ssl_c), WOLFSSL_SUCCESS);
++    ExpectIntEQ(wolfSSL_NoTicketTLSv12(ssl_s), WOLFSSL_SUCCESS);
++    ExpectIntEQ(wolfSSL_set_cipher_list(ssl_c, cbcSuite), WOLFSSL_SUCCESS);
++    ExpectIntEQ(wolfSSL_set_cipher_list(ssl_s, cbcSuite), WOLFSSL_SUCCESS);
++    ExpectIntEQ(wolfSSL_set_session(ssl_c, sess), WOLFSSL_SUCCESS);
++    ExpectIntEQ(test_memio_do_handshake(ssl_c, ssl_s, 10, NULL), 0);
++    /* The server should NOT have actually resumed (fresh ctx, empty cache). */
++    ExpectIntEQ(ssl_s->options.resuming, 0);
++    /* And — the regression check — encrypt-then-MAC must still be active. */
++    ExpectIntEQ(ssl_s->options.encThenMac, 1);
++    ExpectIntEQ(ssl_c->options.encThenMac, 1);
++
++    wolfSSL_SESSION_free(sess);
++    wolfSSL_free(ssl_c);
++    wolfSSL_free(ssl_s);
++    wolfSSL_CTX_free(ctx_c);
++    wolfSSL_CTX_free(ctx_s);
++#endif
++    return EXPECT_RESULT();
++}
++
+ int test_tls_set_curves_list_ecc_fallback(void)
+ {
+     EXPECT_DECLS;
+diff --git a/tests/api/test_tls.h b/tests/api/test_tls.h
+index 46d540434..9d28a599a 100644
+--- a/tests/api/test_tls.h
++++ b/tests/api/test_tls.h
+@@ -30,6 +30,7 @@ int test_tls13_curve_intersection(void);
+ int test_tls_certreq_order(void);
+ int test_tls12_bad_cv_sig_alg(void);
+ int test_tls12_no_null_compression(void);
++int test_tls12_etm_failed_resumption(void);
+ int test_tls_set_curves_list_ecc_fallback(void);
+ 
+ #define TEST_TLS_DECLS                                                         \
+@@ -41,6 +42,7 @@ int test_tls_set_curves_list_ecc_fallback(void);
+         TEST_DECL_GROUP("tls", test_tls_certreq_order),                        \
+         TEST_DECL_GROUP("tls", test_tls12_bad_cv_sig_alg),                     \
+         TEST_DECL_GROUP("tls", test_tls12_no_null_compression),                \
++        TEST_DECL_GROUP("tls", test_tls12_etm_failed_resumption),              \
+         TEST_DECL_GROUP("tls", test_tls_set_curves_list_ecc_fallback)
+ 
+ #endif /* TESTS_API_TEST_TLS_H */
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
index 139d73c572..ce3839e9a2 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://CVE-2026-6091-1.patch \
     file://CVE-2026-6091-2.patch \
     file://CVE-2026-6091-3.patch \
+    file://CVE-2026-6092.patch \
 "
 
 SRCREV = "1d363f3adceba9d1478230ede476a37b0dcdef24"

