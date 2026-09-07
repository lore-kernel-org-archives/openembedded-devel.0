Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9638DC79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:39 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31708.1788776678320320513
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R1+iEX4n;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3898486a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776678; x=1789381478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cr9wcImjSA5SstHSdqZ391WKyH+6CGibg+RQ8cwlIb8=;
        b=R1+iEX4nGl556MWHky9gQF8anBV4nFb68fPBFhiUQg7z2gYTubfZaxrRiJBNi33sI7
         rmJGmA0nkgxdQvBBQw9QdhrZA7fbg/3o36V1C3065lnKIwsZ6/dxRfMLvmsh1ZfoGKUj
         pP35ldxOY9jrxf4Qmlb0v2YRwlNRz3kS4WqQIFlDaiTBnzmKXo3FNV83ebuelg/qv/Ca
         GXre3f0OtMlPCYs7/ypkGe0JEb0zB7yGl9TJaB72r3Tcg8C8Vq5kjkSyrSLA2cRrvYWO
         mbcGfga8qXuKIkgd/5Y9LYhOJsug4jUVPO0/F8FozW7nhGe4KrXnI/qmkOgeBKRHmpL2
         2Lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776678; x=1789381478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cr9wcImjSA5SstHSdqZ391WKyH+6CGibg+RQ8cwlIb8=;
        b=Ou5wZHgH1ssSdR3/S9y+y+1dDWNCoOn7SGIbfCg0lKU7neNImmsyJBC2EyCp2Tm7n1
         nVuU1IXhqs4/NSu5LlOyaS+4jadTwc2wgarleh6gTIc4mRAVIC7vnDFKVvdx/92KJ/9X
         9rKDxcjuti0WiFdANzuyeYW4EfeZJcIf+arAWr9/R6Dfl4gZXGykytyKCgQC4buuMiYW
         aSZtdeK94SlX5jH/gp6ti3J6RlxSAIKW80UORzye7O9Cbrw9ely4hYFde1DywH2Wy/Qd
         OjbCbr83uA8dptVfqXaE61NJVyjF8iO//f+rfnYLymKwMLXlC3bYGSLu17/QLUS+iuYz
         yNvw==
X-Gm-Message-State: AFuF++mh+QbPHWQ6xoJtLaKI+b3cEEh0L00oDQP9teFkRv2xhwcwaeB9
	h3iavQnexlMknTHPMTbXKtlXpeSIfUK4NydjMcxgS7aGtCD42ck34Ae8wU5xOBMB
X-Gm-Gg: AYBFou0RfpCkhB+3K9evjOnw5k+j0+rcPZX6Z7nN0sVhknJ/8UZ6FtizHoL8i/Qo3ac
	kvQu7XQPJeFhFyqpYB+hR8qwHDVHB4VEkIYMSdJFCd1yUWLlQTYmXm9SJcb+mvuo67ytdASL4dq
	GoD/ER/qjAmcOE/TjNqw5lLJE9ncPqs6CunWqqgvh0IBjZkNmLetWpPXN/BEu7T5fqaugNgVCAg
	n8T8h428ZC3sLvNED9ERmROf+NS4wbFLFXJJ/vHIwQVCrl0ohvAgoBUOqObEha/kleZ3Krf6OQa
	CQZJiAKx0cQ2iZdcAgFgwrMOXLjtdIgZrcwAe94YdxQKrwcQVToL0vUqma7Ee2Z1SMNaowuzo4n
	OjUUuUfzZMWHiMOItpSVLIouwLu+1f6vmEVBt+FwIeoK5tVmCJYDweNPZFmTx+tSHt/Y7fhEZ0m
	ByEQURaXzHTQip9Pev3eVAokaXoGoKyAKHVOn4KhydGLbn9m/XQzZiORtX1/dac9GOlrBKE/zj
X-Received: by 2002:a17:90b:28ce:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-39b26100cbfmr35688511a91.10.1788776677434;
        Mon, 07 Sep 2026 03:24:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 25/33] wolfssl: patch CVE-2026-6091
Date: Mon,  7 Sep 2026 22:23:09 +1200
Message-ID: <20260907102318.2459883-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129837

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-6091

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-6091-1.patch       | 295 ++++++++++++++++++
 .../wolfssl/files/CVE-2026-6091-2.patch       |  30 ++
 .../wolfssl/files/CVE-2026-6091-3.patch       |  36 +++
 .../wolfssl/wolfssl_5.9.1.bb                  |   3 +
 4 files changed, 364 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-3.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-1.patch
new file mode 100644
index 0000000000..644797266e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-1.patch
@@ -0,0 +1,295 @@
+From 54bce5dd1dce8839ea64e0bddebe4c6f8fd2cc6c Mon Sep 17 00:00:00 2001
+From: Eric Blankenhorn <eric@wolfssl.com>
+Date: Wed, 8 Apr 2026 16:27:07 -0500
+Subject: [PATCH] Fix partial chain verification
+
+(cherry picked from commit a6fd25b94e0c03c1be265a4454390d7225e81129)
+
+CVE: CVE-2026-6091
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/a6fd25b94e0c03c1be265a4454390d7225e81129]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/x509_str.c                 |  90 ++++++++++++++++++++++-
+ tests/api/test_ossl_x509_str.c | 127 +++++++++++++++++++++++++++++++++
+ 2 files changed, 216 insertions(+), 1 deletion(-)
+
+diff --git a/src/x509_str.c b/src/x509_str.c
+index 90113caed..01e975198 100644
+--- a/src/x509_str.c
++++ b/src/x509_str.c
+@@ -552,6 +552,53 @@ static int X509VerifyCertSetupRetry(WOLFSSL_X509_STORE_CTX* ctx,
+     return ret;
+ }
+ 
++/* Returns 1 if cur and x509 have identical DER encodings, 0 otherwise. */
++static int X509DerEquals(WOLFSSL_X509* cur, WOLFSSL_X509* x509)
++{
++    if (cur == NULL || cur->derCert == NULL ||
++        x509 == NULL || x509->derCert == NULL) {
++        return 0;
++    }
++    if (cur->derCert->length != x509->derCert->length)
++        return 0;
++    return XMEMCMP(cur->derCert->buffer, x509->derCert->buffer,
++                   x509->derCert->length) == 0;
++}
++
++/* Returns 1 if x509's DER matches an entry in either origTrustedSk (an
++ * immutable snapshot of the caller's trusted set captured before any
++ * intermediates were injected for this verification call) or in
++ * store->trusted.  Returns 0 otherwise.  Used by the
++ * X509_V_FLAG_PARTIAL_CHAIN fallback to confirm that a chain actually
++ * terminates at a caller-trusted certificate. */
++static int X509StoreCertIsTrusted(WOLFSSL_X509_STORE* store,
++        WOLFSSL_X509* x509, WOLF_STACK_OF(WOLFSSL_X509)* origTrustedSk)
++{
++    int i;
++    int n;
++
++    if (x509 == NULL || x509->derCert == NULL)
++        return 0;
++
++    if (origTrustedSk != NULL) {
++        n = wolfSSL_sk_X509_num(origTrustedSk);
++        for (i = 0; i < n; i++) {
++            if (X509DerEquals(wolfSSL_sk_X509_value(origTrustedSk, i), x509))
++                return 1;
++        }
++    }
++
++    if (store != NULL && store->trusted != NULL) {
++        n = wolfSSL_sk_X509_num(store->trusted);
++        for (i = 0; i < n; i++) {
++            if (X509DerEquals(wolfSSL_sk_X509_value(store->trusted, i), x509))
++                return 1;
++        }
++    }
++
++    return 0;
++}
++
+ /* Verifies certificate chain using WOLFSSL_X509_STORE_CTX
+  * returns 1 on success or <= 0 on failure.
+  */
+@@ -570,6 +617,7 @@ int wolfSSL_X509_verify_cert(WOLFSSL_X509_STORE_CTX* ctx)
+     WOLF_STACK_OF(WOLFSSL_X509)* certs = NULL;
+     WOLF_STACK_OF(WOLFSSL_X509)* certsToUse = NULL;
+     WOLF_STACK_OF(WOLFSSL_X509)* failedCerts = NULL;
++    WOLF_STACK_OF(WOLFSSL_X509)* origTrustedSk = NULL;
+     WOLFSSL_ENTER("wolfSSL_X509_verify_cert");
+ 
+     if (ctx == NULL || ctx->store == NULL || ctx->store->cm == NULL
+@@ -586,9 +634,37 @@ int wolfSSL_X509_verify_cert(WOLFSSL_X509_STORE_CTX* ctx)
+     if (certs == NULL &&
+         wolfSSL_sk_X509_num(ctx->ctxIntermediates) > 0) {
+         certsToUse = wolfSSL_sk_X509_new_null();
++        if (certsToUse == NULL) {
++            ret = WOLFSSL_FAILURE;
++            goto exit;
++        }
+         ret = addAllButSelfSigned(certsToUse, ctx->ctxIntermediates, NULL);
++        /* certsToUse holds only injected intermediates, none are trusted, so
++         * leave origTrustedSk NULL (empty snapshot). */
++        certs = certsToUse;
+     }
+     else {
++        /* Snapshot the caller-trusted entries before injecting the
++         * caller-supplied untrusted intermediates.  Only the entries already
++         * present count as trusted for the partial-chain check below, and
++         * we need a stable reference because X509VerifyCertSetupRetry may
++         * remove nodes from `certs` during chain building. */
++        if (certs != NULL && wolfSSL_sk_X509_num(certs) > 0) {
++            int j;
++            int n = wolfSSL_sk_X509_num(certs);
++            origTrustedSk = wolfSSL_sk_X509_new_null();
++            if (origTrustedSk == NULL) {
++                ret = WOLFSSL_FAILURE;
++                goto exit;
++            }
++            for (j = 0; j < n; j++) {
++                if (wolfSSL_sk_X509_push(origTrustedSk,
++                        wolfSSL_sk_X509_value(certs, j)) <= 0) {
++                    ret = WOLFSSL_FAILURE;
++                    goto exit;
++                }
++            }
++        }
+         /* Add the intermediates provided on init to the list of untrusted
+          * intermediates to be used */
+         ret = addAllButSelfSigned(certs, ctx->ctxIntermediates, &numInterAdd);
+@@ -677,9 +753,17 @@ int wolfSSL_X509_verify_cert(WOLFSSL_X509_STORE_CTX* ctx)
+              * a trusted CA in the CM */
+             ret = X509StoreVerifyCert(ctx);
+             if (ret != WOLFSSL_SUCCESS) {
++                /* WOLFSSL_PARTIAL_CHAIN may only terminate the chain at a
++                 * certificate the caller actually trusts.  The previous
++                 * "added == 1" guard merely confirmed that some untrusted
++                 * intermediate had been temporarily loaded into the
++                 * CertManager during chain building, which would accept
++                 * chains that never reach a trust anchor.  Verify that
++                 * ctx->current_cert is itself in the original trust set. */
+                 if (((ctx->flags & WOLFSSL_PARTIAL_CHAIN) ||
+                      (ctx->store->param->flags & WOLFSSL_PARTIAL_CHAIN)) &&
+-                    (added == 1)) {
++                    X509StoreCertIsTrusted(ctx->store, ctx->current_cert,
++                        origTrustedSk)) {
+                     wolfSSL_sk_X509_push(ctx->chain, ctx->current_cert);
+                     ret = WOLFSSL_SUCCESS;
+                 } else {
+@@ -749,6 +833,10 @@ exit:
+     if (certsToUse != NULL) {
+         wolfSSL_sk_X509_free(certsToUse);
+     }
++    if (origTrustedSk != NULL) {
++        /* Shallow free: only the snapshot's stack nodes, not the X509s. */
++        wolfSSL_sk_X509_free(origTrustedSk);
++    }
+ 
+     /* Enforce hostname / IP verification from X509_VERIFY_PARAM if set.
+      * Always check against the leaf (end-entity) certificate, captured in
+diff --git a/tests/api/test_ossl_x509_str.c b/tests/api/test_ossl_x509_str.c
+index 99b82877c..01ed9edfb 100644
+--- a/tests/api/test_ossl_x509_str.c
++++ b/tests/api/test_ossl_x509_str.c
+@@ -785,6 +785,127 @@ static int test_wolfSSL_X509_STORE_CTX_ex11(X509_STORE_test_data *testData)
+     return EXPECT_RESULT();
+ }
+ 
++static int test_wolfSSL_X509_STORE_CTX_ex_partial_chain_neg(
++    X509_STORE_test_data *testData)
++{
++    EXPECT_DECLS;
++    X509_STORE* store = NULL;
++    X509_STORE_CTX* ctx = NULL;
++    STACK_OF(X509)* untrusted = NULL;
++
++    /* Negative partial-chain test: with X509_V_FLAG_PARTIAL_CHAIN set, the
++     * intermediates are supplied ONLY as untrusted (passed through the
++     * X509_STORE_CTX_init "chain" argument and never added to the store).
++     * No certificate in the chain is in the store, so verification must
++     * fail.  Pre-fix, wolfSSL_X509_verify_cert would incorrectly accept
++     * this chain because its partial-chain fallback only checked that some
++     * intermediate had been temporarily loaded into the CertManager, not
++     * that any chain certificate was actually trusted. */
++    ExpectNotNull(store = X509_STORE_new());
++    /* Intentionally do NOT add x509CaInt, x509CaInt2, or x509Ca. */
++    ExpectIntEQ(X509_STORE_set_flags(store, X509_V_FLAG_PARTIAL_CHAIN), 1);
++
++    ExpectNotNull(untrusted = sk_X509_new_null());
++    ExpectIntGT(sk_X509_push(untrusted, testData->x509CaInt2), 0);
++    ExpectIntGT(sk_X509_push(untrusted, testData->x509CaInt), 0);
++
++    ExpectNotNull(ctx = X509_STORE_CTX_new());
++    ExpectIntEQ(X509_STORE_CTX_init(ctx, store, testData->x509Leaf, untrusted),
++        1);
++    /* Must NOT verify: partial-chain does not relax the trust requirement. */
++    ExpectIntNE(X509_verify_cert(ctx), 1);
++    /* Verify the failure is specifically due to missing trust anchor, not
++     * some unrelated error. */
++    ExpectIntEQ(X509_STORE_CTX_get_error(ctx),
++        X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY);
++
++    X509_STORE_CTX_free(ctx);
++    X509_STORE_free(store);
++    sk_X509_free(untrusted);
++    return EXPECT_RESULT();
++}
++
++static int test_wolfSSL_X509_STORE_CTX_ex_partial_chain_mixed(
++    X509_STORE_test_data *testData)
++{
++    EXPECT_DECLS;
++    X509_STORE* store = NULL;
++    X509_STORE_CTX* ctx = NULL;
++    STACK_OF(X509)* untrusted = NULL;
++
++    /* Mixed trusted-store + untrusted-chain partial-chain test: the store
++     * trusts an intermediate (x509CaInt2, the leaf's direct issuer), while
++     * an additional intermediate (x509CaInt) is supplied only as untrusted
++     * via the chain argument.  With X509_V_FLAG_PARTIAL_CHAIN, verification
++     * must succeed by terminating at the trusted intermediate.  This test
++     * exercises the snapshot-based trust check in X509StoreCertIsTrusted:
++     * the untrusted intermediate injected during verification must not be
++     * treated as a trust anchor, but the intermediate already in the store
++     * must be. */
++    ExpectNotNull(store = X509_STORE_new());
++    ExpectIntEQ(X509_STORE_add_cert(store, testData->x509CaInt2), 1);
++    ExpectIntEQ(X509_STORE_set_flags(store, X509_V_FLAG_PARTIAL_CHAIN), 1);
++
++    ExpectNotNull(untrusted = sk_X509_new_null());
++    ExpectIntGT(sk_X509_push(untrusted, testData->x509CaInt), 0);
++
++    ExpectNotNull(ctx = X509_STORE_CTX_new());
++    ExpectIntEQ(X509_STORE_CTX_init(ctx, store, testData->x509Leaf, untrusted),
++        1);
++    /* Must verify: chain terminates at trusted intermediate in the store. */
++    ExpectIntEQ(X509_verify_cert(ctx), 1);
++
++    X509_STORE_CTX_free(ctx);
++    X509_STORE_free(store);
++    sk_X509_free(untrusted);
++    return EXPECT_RESULT();
++}
++
++static int test_wolfSSL_X509_STORE_CTX_ex_partial_chain_untrusted_terminal(
++    X509_STORE_test_data *testData)
++{
++    EXPECT_DECLS;
++    X509_STORE* store = NULL;
++    X509_STORE_CTX* ctx = NULL;
++    STACK_OF(X509)* untrusted = NULL;
++
++    /* Partial-chain boundary test: the store trusts a CA (x509Ca) that is
++     * NOT reachable from the leaf given the supplied untrusted intermediates,
++     * and an untrusted intermediate (x509CaInt2) IS the terminal of the
++     * (truncated) chain.  With X509_V_FLAG_PARTIAL_CHAIN set, verification
++     * must FAIL because the chain terminates at an untrusted certificate.
++     *
++     * This test specifically targets the snapshot-based trust check in
++     * X509StoreCertIsTrusted.  Before addAllButSelfSigned injects
++     * x509CaInt2, origTrustedSk is snapshotted from the caller-trusted set
++     * and contains only x509Ca.  When the chain terminates at x509CaInt2,
++     * the trust check consults origTrustedSk (not the mutated working
++     * stack) and correctly finds no match.  A regression that consulted
++     * the post-injection working stack instead of the snapshot would
++     * incorrectly mark x509CaInt2 as trusted and cause verification to
++     * succeed. */
++    ExpectNotNull(store = X509_STORE_new());
++    ExpectIntEQ(X509_STORE_add_cert(store, testData->x509Ca), 1);
++    ExpectIntEQ(X509_STORE_set_flags(store, X509_V_FLAG_PARTIAL_CHAIN), 1);
++
++    /* Only x509CaInt2 supplied as untrusted; x509CaInt is intentionally
++     * withheld so the chain cannot actually reach the trusted x509Ca. */
++    ExpectNotNull(untrusted = sk_X509_new_null());
++    ExpectIntGT(sk_X509_push(untrusted, testData->x509CaInt2), 0);
++
++    ExpectNotNull(ctx = X509_STORE_CTX_new());
++    ExpectIntEQ(X509_STORE_CTX_init(ctx, store, testData->x509Leaf, untrusted),
++        1);
++    /* Must NOT verify: the chain terminal (x509CaInt2) is not in the
++     * original trust set, even though the store is non-empty. */
++    ExpectIntNE(X509_verify_cert(ctx), 1);
++
++    X509_STORE_CTX_free(ctx);
++    X509_STORE_free(store);
++    sk_X509_free(untrusted);
++    return EXPECT_RESULT();
++}
++
+ #ifdef HAVE_ECC
+ static int test_wolfSSL_X509_STORE_CTX_ex12(void)
+ {
+@@ -870,6 +991,12 @@ int test_wolfSSL_X509_STORE_CTX_ex(void)
+     ExpectIntEQ(test_wolfSSL_X509_STORE_CTX_ex9(&testData), 1);
+     ExpectIntEQ(test_wolfSSL_X509_STORE_CTX_ex10(&testData), 1);
+     ExpectIntEQ(test_wolfSSL_X509_STORE_CTX_ex11(&testData), 1);
++    ExpectIntEQ(test_wolfSSL_X509_STORE_CTX_ex_partial_chain_neg(&testData), 1);
++    ExpectIntEQ(test_wolfSSL_X509_STORE_CTX_ex_partial_chain_mixed(&testData),
++        1);
++    ExpectIntEQ(
++        test_wolfSSL_X509_STORE_CTX_ex_partial_chain_untrusted_terminal(
++            &testData), 1);
+ #ifdef HAVE_ECC
+     ExpectIntEQ(test_wolfSSL_X509_STORE_CTX_ex12(), 1);
+ #endif
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-2.patch
new file mode 100644
index 0000000000..373f942496
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-2.patch
@@ -0,0 +1,30 @@
+From 62e57461f512849af4f466f77594085c90ffad73 Mon Sep 17 00:00:00 2001
+From: Eric Blankenhorn <eric@wolfssl.com>
+Date: Tue, 14 Apr 2026 07:58:43 -0500
+Subject: [PATCH] Fix from review
+
+(cherry picked from commit c873f3f77da8273e160612468f08892b2ba0ed99)
+
+CVE: CVE-2026-6091
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/c873f3f77da8273e160612468f08892b2ba0ed99]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/x509_str.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/x509_str.c b/src/x509_str.c
+index 01e975198..67e3fcae6 100644
+--- a/src/x509_str.c
++++ b/src/x509_str.c
+@@ -765,6 +765,10 @@ int wolfSSL_X509_verify_cert(WOLFSSL_X509_STORE_CTX* ctx)
+                     X509StoreCertIsTrusted(ctx->store, ctx->current_cert,
+                         origTrustedSk)) {
+                     wolfSSL_sk_X509_push(ctx->chain, ctx->current_cert);
++                    /* Clear error set by the failed X509StoreVerifyCert
++                     * attempt; the partial-chain fallback accepted the
++                     * chain at a caller-trusted certificate. */
++                    ctx->error = 0;
+                     ret = WOLFSSL_SUCCESS;
+                 } else {
+                     X509VerifyCertSetupRetry(ctx, certs, failedCerts,
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-3.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-3.patch
new file mode 100644
index 0000000000..418e45fc13
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-3.patch
@@ -0,0 +1,36 @@
+From 13c4a12c9904a2e50d1729d8a6899f111f3bcd2a Mon Sep 17 00:00:00 2001
+From: Eric Blankenhorn <eric@wolfssl.com>
+Date: Tue, 14 Apr 2026 07:41:30 -0500
+Subject: [PATCH] Fix from review
+
+(cherry picked from commit 2b503dae543d09c63a08b1e24238e0e9ce1ac6c5)
+
+CVE: CVE-2026-6091
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/2b503dae543d09c63a08b1e24238e0e9ce1ac6c5]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tests/api/test_ossl_x509_str.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tests/api/test_ossl_x509_str.c b/tests/api/test_ossl_x509_str.c
+index 01ed9edfb..14f3538a4 100644
+--- a/tests/api/test_ossl_x509_str.c
++++ b/tests/api/test_ossl_x509_str.c
+@@ -854,6 +854,7 @@ static int test_wolfSSL_X509_STORE_CTX_ex_partial_chain_mixed(
+         1);
+     /* Must verify: chain terminates at trusted intermediate in the store. */
+     ExpectIntEQ(X509_verify_cert(ctx), 1);
++    ExpectIntEQ(X509_STORE_CTX_get_error(ctx), X509_V_OK);
+ 
+     X509_STORE_CTX_free(ctx);
+     X509_STORE_free(store);
+@@ -899,6 +900,8 @@ static int test_wolfSSL_X509_STORE_CTX_ex_partial_chain_untrusted_terminal(
+     /* Must NOT verify: the chain terminal (x509CaInt2) is not in the
+      * original trust set, even though the store is non-empty. */
+     ExpectIntNE(X509_verify_cert(ctx), 1);
++    ExpectIntEQ(X509_STORE_CTX_get_error(ctx),
++        X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY);
+ 
+     X509_STORE_CTX_free(ctx);
+     X509_STORE_free(store);
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
index e2bb53a646..139d73c572 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
@@ -19,6 +19,9 @@ SRC_URI = " \
     file://CVE-2026-10098-2.patch \
     file://CVE-2026-10512.patch \
     file://CVE-2026-55958.patch \
+    file://CVE-2026-6091-1.patch \
+    file://CVE-2026-6091-2.patch \
+    file://CVE-2026-6091-3.patch \
 "
 
 SRCREV = "1d363f3adceba9d1478230ede476a37b0dcdef24"

