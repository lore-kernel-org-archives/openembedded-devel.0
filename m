Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AEBE88D7B
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 12:49:47 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34415.1775393377721767112
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 05:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a4+KpiNn;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b2494440f3so10938535ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775393377; x=1775998177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8/LkhxR17hDe3Bx1O0XJO6XIl9zVEMQh0M7MOcM6os=;
        b=a4+KpiNnbYhNcBLnxbrAMaQQTt/9rnROb+366mJLClh1U6mrfREuMM2FaT5FrdnBgQ
         FydWQNisP3J3wzmDwaNBq/16ntU4Pshz/+dKR1FXbp8uJELxQEjAKBpJH4z1zr7fw067
         tfFcYVeCyDiVFoMk910CarimNgT4811xJAgpBh+bhy7HgUZjWd1AvOXbEMwXvnaeVfp8
         qU5AN6izkgqCAdbGKgrJ7bYfuphZA63VUdXGKt7C/krNbxZCh33HWTRM50s70QvuHke9
         YrBAmo83wmR830OgTnfw+RdesDyxsYSQrdVhHOGVvsxugGBi46vvfOFzadYHUwW04tgt
         Ys9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775393377; x=1775998177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u8/LkhxR17hDe3Bx1O0XJO6XIl9zVEMQh0M7MOcM6os=;
        b=AQYLgH28fLEeef7I0OrzpxtVPLNdjByJWjqgVsp7DrCJxq4YPDsdX8AVIdmQrhm/KK
         5XABRPQcJ4jCYTQV59BRBhTxOrUBH7VmVA3qVyPqXfBmxpX1SAaMSxtvCIXcNttLfF7Z
         a/Q2nGrYL303h9RMzKiwEc4IDJqUR6gQGOD3Xf90KWOQW5uYWUtc0b+yhamAQEdCb2Rl
         2tGofI4eHiTRgd7pbN8RoQ9hNMZ3kkBbVrWAJki8M6fvQsGNQVMmiT+ZMpVi+JtOJa0S
         OqeD/fN5lUW++evKtw7LPmxQNSFk8KfFzEpHN6gIakTbK2MKDLy72TTlHljgJX09gD+T
         rvEQ==
X-Gm-Message-State: AOJu0YxULOwmqsEymT4Ekeltfrzuu3ziwdh7wCSTMW2ef6JryUnsxYAu
	5R84Eg+J4xNjf7pTT0xleXbZwv86cYi+ihRA8ZgHHrLHnfwIxAFOy9u6v1+V/R/xmlU=
X-Gm-Gg: AeBDiesCWID7vZAQz4mNik9G3SkjCY1R+1mi0ew5Zyk+LS2j1FATBMrSNqRWAa9vpH6
	MDyKXEt4wWSnNB29qgxMIhRvTlaaiR0xnINjDCnTK7iljHHz3DW2J74BNMX9T3q6wxISmH2gWFm
	o3tG3q9RGfY37ETX6TAiFpMSTI6Zo4p1GqzNh0/1b3bbarLFJgmpa2OTmSDWi9s9SyK/Ph6zJru
	5x/n325vM+hUvgcuZDUTj56kxcNviv26FXsz7YwJkc6NtyKX1F30fQQv54R+LqfWvqicOV/JxDK
	Q23fNcKHk6j9q95+mzZ1tOgSF9cmdr32obj+jOgEEL1PD15/mXjUNYhcKMw2nUt+3GO3FI1zwFR
	y4JSmEYjjX+WFePNi6JhbsqY4yOCx3bGqa/Xb9DgglppEwmH2lxneHggSPa2MDmGuMJT93YFa8u
	rsrv5xXhnIPm1mSqnnUMQQT+5JXdDWTLDnkmA=
X-Received: by 2002:a17:903:f86:b0:2b0:64c4:34a0 with SMTP id d9443c01a7336-2b28163bb0dmr98362705ad.10.1775393376821;
        Sun, 05 Apr 2026 05:49:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm106828025ad.24.2026.04.05.05.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 05:49:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 4/14] wolfssl: ptach CVE-2026-3229
Date: Mon,  6 Apr 2026 00:49:06 +1200
Message-ID: <20260405124916.2881008-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
References: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 12:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126003

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-3229

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-3229-1.patch       | 104 ++++++++++++++++++
 .../wolfssl/files/CVE-2026-3229-2.patch       |  42 +++++++
 .../wolfssl/files/CVE-2026-3229-3.patch       |  28 +++++
 .../wolfssl/wolfssl_5.8.0.bb                  |   3 +
 4 files changed, 177 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3229-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3229-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3229-3.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3229-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3229-1.patch
new file mode 100644
index 0000000000..e442028146
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3229-1.patch
@@ -0,0 +1,104 @@
+From 136f9cd0250a6f5d24cdda95118ae4e8eed23dd7 Mon Sep 17 00:00:00 2001
+From: Eric Blankenhorn <eric@wolfssl.com>
+Date: Tue, 24 Feb 2026 09:27:42 -0600
+Subject: [PATCH] Fix cert chain size issue
+
+(cherry picked from commit 2ae3164c6f2db5fdd9f7a6be344e068cd3264bde)
+
+CVE: CVE-2026-3229
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/2ae3164c6f2db5fdd9f7a6be344e068cd3264bde]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ssl_load.c |  8 +++++++-
+ tests/api.c    | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 59 insertions(+), 1 deletion(-)
+
+diff --git a/src/ssl_load.c b/src/ssl_load.c
+index d803b4093..54e1a3095 100644
+--- a/src/ssl_load.c
++++ b/src/ssl_load.c
+@@ -4773,7 +4773,13 @@ static int wolfssl_add_to_chain(DerBuffer** chain, int weOwn, const byte* cert,
+         /* Get length of previous chain. */
+         len = oldChain->length;
+     }
+-    /* Allocate DER buffer bug enough to hold old and new certificates. */
++    /* Check for integer overflow in size calculation. */
++    if ((len > WOLFSSL_MAX_32BIT - CERT_HEADER_SZ) ||
++            (certSz > WOLFSSL_MAX_32BIT - CERT_HEADER_SZ - len)) {
++        WOLFSSL_MSG("wolfssl_add_to_chain overflow");
++        return 0;
++    }
++    /* Allocate DER buffer big enough to hold old and new certificates. */
+     ret = AllocDer(&newChain, len + CERT_HEADER_SZ + certSz, CERT_TYPE, heap);
+     if (ret != 0) {
+         WOLFSSL_MSG("AllocDer error");
+diff --git a/tests/api.c b/tests/api.c
+index a8449cc71..02da904f2 100644
+--- a/tests/api.c
++++ b/tests/api.c
+@@ -5262,6 +5262,57 @@ static int test_wolfSSL_CTX_add1_chain_cert(void)
+     return EXPECT_RESULT();
+ }
+ 
++/* Test that wolfssl_add_to_chain rejects sizes that would overflow word32.
++ * ZD #21241 */
++static int test_wolfSSL_add_to_chain_overflow(void)
++{
++    EXPECT_DECLS;
++#if !defined(NO_CERTS) && defined(OPENSSL_EXTRA) && \
++    defined(KEEP_OUR_CERT) && !defined(NO_RSA) && !defined(NO_TLS) && \
++    !defined(NO_WOLFSSL_CLIENT) && !defined(NO_FILESYSTEM)
++    WOLFSSL_CTX* ctx = NULL;
++    WOLFSSL_X509* x509 = NULL;
++    DerBuffer* fakeChain = NULL;
++
++    ExpectNotNull(ctx = wolfSSL_CTX_new(wolfSSLv23_client_method()));
++
++    /* Load a real cert so ctx->certificate is set (first add goes there). */
++    ExpectNotNull(x509 = wolfSSL_X509_load_certificate_file(
++        "./certs/intermediate/client-int-cert.pem", WOLFSSL_FILETYPE_PEM));
++    ExpectIntEQ(SSL_CTX_add1_chain_cert(ctx, x509), 1);
++    wolfSSL_X509_free(x509);
++    x509 = NULL;
++
++    /* Now ctx->certificate is set, next add goes to certChain via
++     * wolfssl_add_to_chain.  Fake a chain whose length is near UINT32_MAX
++     * so the size calculation (len + CERT_HEADER_SZ + certSz) overflows. */
++    fakeChain = (DerBuffer*)XMALLOC(sizeof(DerBuffer) + 16, ctx->heap,
++        DYNAMIC_TYPE_CERT);
++    ExpectNotNull(fakeChain);
++    if (EXPECT_SUCCESS()) {
++        XMEMSET(fakeChain, 0, sizeof(DerBuffer) + 16);
++        fakeChain->buffer = (byte*)(fakeChain + 1);
++        fakeChain->length = WOLFSSL_MAX_32BIT - 2; /* will overflow with any cert */
++        fakeChain->type = CERT_TYPE;
++        fakeChain->dynType = DYNAMIC_TYPE_CERT;
++        /* Replace the real chain with our fake one. */
++        if (ctx->certChain != NULL) {
++            XFREE(ctx->certChain, ctx->heap, DYNAMIC_TYPE_CERT);
++        }
++        ctx->certChain = fakeChain;
++    }
++
++    /* Try to add another cert - this MUST fail due to overflow guard. */
++    ExpectNotNull(x509 = wolfSSL_X509_load_certificate_file(
++        "./certs/intermediate/ca-int2-cert.pem", WOLFSSL_FILETYPE_PEM));
++    ExpectIntEQ(SSL_CTX_add1_chain_cert(ctx, x509), 0);
++    wolfSSL_X509_free(x509);
++
++    wolfSSL_CTX_free(ctx);
++#endif
++    return EXPECT_RESULT();
++}
++
+ static int test_wolfSSL_CTX_use_certificate_chain_buffer_format(void)
+ {
+     EXPECT_DECLS;
+@@ -67594,6 +67645,7 @@ TEST_CASE testCases[] = {
+     TEST_DECL(test_wolfSSL_CTX_load_verify_buffer_ex),
+     TEST_DECL(test_wolfSSL_CTX_load_verify_chain_buffer_format),
+     TEST_DECL(test_wolfSSL_CTX_add1_chain_cert),
++    TEST_DECL(test_wolfSSL_add_to_chain_overflow),
+     TEST_DECL(test_wolfSSL_CTX_use_certificate_chain_buffer_format),
+     TEST_DECL(test_wolfSSL_CTX_use_certificate_chain_file_format),
+     TEST_DECL(test_wolfSSL_use_certificate_chain_file),
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3229-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3229-2.patch
new file mode 100644
index 0000000000..e382dd5542
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3229-2.patch
@@ -0,0 +1,42 @@
+From 62ab2c90ac6ad82a7586224096a73f84beac64c3 Mon Sep 17 00:00:00 2001
+From: Eric Blankenhorn <eric@wolfssl.com>
+Date: Tue, 24 Feb 2026 11:17:42 -0600
+Subject: [PATCH] Fix from review
+
+(cherry picked from commit 8f787909da890e5830a9a6f73d3c4ff0d9bd7da9)
+
+CVE: CVE-2026-3229
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/8f787909da890e5830a9a6f73d3c4ff0d9bd7da9]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ssl_load.c | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/src/ssl_load.c b/src/ssl_load.c
+index 54e1a3095..8533d9a12 100644
+--- a/src/ssl_load.c
++++ b/src/ssl_load.c
+@@ -4777,14 +4777,17 @@ static int wolfssl_add_to_chain(DerBuffer** chain, int weOwn, const byte* cert,
+     if ((len > WOLFSSL_MAX_32BIT - CERT_HEADER_SZ) ||
+             (certSz > WOLFSSL_MAX_32BIT - CERT_HEADER_SZ - len)) {
+         WOLFSSL_MSG("wolfssl_add_to_chain overflow");
+-        return 0;
+-    }
+-    /* Allocate DER buffer big enough to hold old and new certificates. */
+-    ret = AllocDer(&newChain, len + CERT_HEADER_SZ + certSz, CERT_TYPE, heap);
+-    if (ret != 0) {
+-        WOLFSSL_MSG("AllocDer error");
+         res = 0;
+     }
++    if (res == 1) {
++        /* Allocate DER buffer big enough to hold old and new certificates. */
++        ret = AllocDer(&newChain, len + CERT_HEADER_SZ + certSz, CERT_TYPE,
++            heap);
++        if (ret != 0) {
++            WOLFSSL_MSG("AllocDer error");
++            res = 0;
++        }
++    }
+ 
+     if (res == 1) {
+         if (oldChain != NULL) {
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3229-3.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3229-3.patch
new file mode 100644
index 0000000000..44c7960d35
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3229-3.patch
@@ -0,0 +1,28 @@
+From a64133c8e0ec3463d9fffc9a2f95c48f3e7be24a Mon Sep 17 00:00:00 2001
+From: Eric Blankenhorn <eric@wolfssl.com>
+Date: Tue, 24 Feb 2026 12:43:46 -0600
+Subject: [PATCH] Fix issue from review
+
+(cherry picked from commit 5536ecf026151f1cdc80f6908fe8820e798dcd58)
+
+CVE: CVE-2026-3229
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/5536ecf026151f1cdc80f6908fe8820e798dcd58]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tests/api.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tests/api.c b/tests/api.c
+index 02da904f2..9dc92e84a 100644
+--- a/tests/api.c
++++ b/tests/api.c
+@@ -5301,6 +5301,9 @@ static int test_wolfSSL_add_to_chain_overflow(void)
+         }
+         ctx->certChain = fakeChain;
+     }
++    else {
++        XFREE(fakeChain, ctx ? ctx->heap : NULL, DYNAMIC_TYPE_CERT);
++    }
+ 
+     /* Try to add another cert - this MUST fail due to overflow guard. */
+     ExpectNotNull(x509 = wolfSSL_X509_load_certificate_file(
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index 5db019c9cb..7c46c01ff0 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -30,6 +30,9 @@ SRC_URI = " \
     file://CVE-2026-0819.patch \
     file://CVE-2026-2646-1.patch \
     file://CVE-2026-2646-2.patch \
+    file://CVE-2026-3229-1.patch \
+    file://CVE-2026-3229-2.patch \
+    file://CVE-2026-3229-3.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

