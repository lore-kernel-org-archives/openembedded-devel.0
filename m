Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B070F4BB76
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 18:55:05 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27890.1771959303213724243
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 10:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eeDVqgob;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8230d228372so2849381b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 10:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771959302; x=1772564102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGETLH0j2jkvxlQVUnfgKAPEp0NdEx9Wxvefaat5VQA=;
        b=eeDVqgobE6J0lcVnAjvvPbKgcXQjxq6rSw/C+i5/5qv5zTkqoa5CS0b7r6BgiO1J/z
         8WoiObXhk7/nsVhwiqbBO5NgvEXDY+BZKPmtn7GO9IEV9gTx25Ol5WwtTCfW+MOEepur
         khmZbFk+JMJYsQea6vVTgHJT15a5w70BKGdtQVR3cOcRic/yn5Opao7k0lmBK3dnEu7e
         T6GwrFi+2DJ5XPbzcnq0vl9P4wZGspar4wiXh3ZqkS4jqy0fQXeZcWJZfoiHHs/TgNnm
         w54DdXfSAJqwfKGn4fBVWrkBoH1dvScrdDipMyoB43eYS+eDw27y5M5ReF3xvoC79SNP
         97Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959302; x=1772564102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGETLH0j2jkvxlQVUnfgKAPEp0NdEx9Wxvefaat5VQA=;
        b=uZ2khwjA8kO/O9jCQYxQixaF//qk4vDbBYVdeh5hciOJG+7oPyAyhXbD9c8w9ZV1hc
         VZg9uq2hjtXNUTE1Mdmmi3wZIG1+vFUKZ1S3nariQJfS6j9yWP+WQHxBbcLWe9H6e0Gp
         1Q7uRYk4WJPxipGbNZ6iL7Md14yMHs/Ye5CXbc+T6lUiSjIiBPxB/MROp+djKmREfAu2
         YQ3SL1H4KwjKxDEAbAcDIjhS1KSN2A0jZ2sxYP/r5h4lnSjI//+lT4fA91sSK8T5GK2K
         snb8fmYcgUkVANWcef0cYO1ZNTxrjdwfBpjgmz56I0rTYc99yrK6C74a5vGgD8LcnIPk
         /Rew==
X-Gm-Message-State: AOJu0YwZevY0mAM1ETayiMa0kSrA/B2L1mT6CF3j1xfZYL0XczMZ0zd9
	1XxAG6TX/AiRthjIlAVJiWuA59oOhkEqijQEjrYqqZCpeVzlc5I80ZdCATlsWg==
X-Gm-Gg: ATEYQzzvWlbFHhgzIf2wR/s3yckWGiF44M7dziyE3eraGcKao4vTh5YHV5cWnemwma5
	9s8VIpQtjExDeH27YEWeXBXLixdCuP5P5Vck195b+xHqv5mwsgXMSiY0swAIcDxsJiG+k1mw/W3
	39d7oFWPDwvehu0quwnytn7F5eErP3ofH40TJYoIKU1O0umuAJIFlqMBmpaum3ee9CHMhQMV5we
	v9hsLdosdUJ60Po4ZwuUCz/HgMaQgZL6s6SKGMgROSyOyLD38QC5wYZhtSD+OSG7jCsbR+Ae5/w
	KFgUFM/urqb/RtpAIuhbdN9Ci+aEFEogQvkVI1OiQockdKoJIJKWzJIHFXNS/vC1RShqPef4WWa
	sL0Ct/5+QXn6xLWP+wC3J3sXejr5hctPWeyHbvesAXfwlRAGZsmrzZYKqYgMM36cZBlvMSCgtb6
	L0YHkcQLsb9t070R2z0VSymv/SmR5hJnFy/cQ=
X-Received: by 2002:a05:6a00:4f84:b0:81f:3d32:fe53 with SMTP id d2e1a72fcca58-826daa0cdd2mr11948700b3a.32.1771959302229;
        Tue, 24 Feb 2026 10:55:02 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8ee179sm10945104b3a.61.2026.02.24.10.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:55:01 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 2/3] wolfssl: patch CVE-2025-7395
Date: Wed, 25 Feb 2026 07:54:11 +1300
Message-ID: <20260224185412.1835468-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224185412.1835468-2-ankur.tyagi85@gmail.com>
References: <20260224185412.1835468-2-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 18:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124587

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-7395

Backport patches from the PR[1] mentioned in the changelog[2]
[1] github.com/wolfSSL/wolfssl/pull/8833
[2] https://github.com/wolfSSL/wolfssl/blob/master/ChangeLog.md#wolfssl-release-582-july-17-2025

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2025-7395-1.patch       | 85 +++++++++++++++++++
 .../wolfssl/files/CVE-2025-7395-2.patch       | 28 ++++++
 .../wolfssl/files/CVE-2025-7395-3.patch       | 26 ++++++
 .../wolfssl/files/CVE-2025-7395-4.patch       | 27 ++++++
 .../wolfssl/wolfssl_5.8.0.bb                  |  4 +
 5 files changed, 170 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-4.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
new file mode 100644
index 0000000000..576d261dc3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
@@ -0,0 +1,85 @@
+From 420f3390c4922febaf54d02a81da1fdab0ad5f04 Mon Sep 17 00:00:00 2001
+From: Ruby Martin <ruby@wolfssl.com>
+Date: Mon, 2 Jun 2025 16:38:32 -0600
+Subject: [PATCH] create policy for WOLFSSL_APPLE_NATIVE_CERT_VALIDATION,
+ domain name checking
+
+CVE: CVE-2025-7395
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/9864959e41bd9259f258c09171ae2ec1c43fbc7f]
+(cherry picked from commit 9864959e41bd9259f258c09171ae2ec1c43fbc7f)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/internal.c | 25 ++++++++++++++++++++-----
+ 1 file changed, 20 insertions(+), 5 deletions(-)
+
+diff --git a/src/internal.c b/src/internal.c
+index 6b3a227bc..1b9a469ee 100644
+--- a/src/internal.c
++++ b/src/internal.c
+@@ -211,7 +211,7 @@ int writeAeadAuthData(WOLFSSL* ssl, word16 sz, byte type, byte* additional,
+ #include <Security/SecCertificate.h>
+ #include <Security/SecTrust.h>
+ #include <Security/SecPolicy.h>
+-static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
++static int DoAppleNativeCertValidation(WOLFSSL* ssl, const WOLFSSL_BUFFER_INFO* certs,
+                                             int totalCerts);
+ #endif /* #if defined(__APPLE__) && defined(WOLFSSL_SYS_CA_CERTS) */
+ 
+@@ -16775,7 +16775,7 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input, word32* inOutIdx,
+              * into wolfSSL, try to validate against the system certificates
+              * using Apple's native trust APIs */
+             if ((ret != 0) && (ssl->ctx->doAppleNativeCertValidationFlag)) {
+-                if (DoAppleNativeCertValidation(args->certs,
++                if (DoAppleNativeCertValidation(ssl, args->certs,
+                                                      args->totalCerts)) {
+                     WOLFSSL_MSG("Apple native cert chain validation SUCCESS");
+                     ret = 0;
+@@ -42665,7 +42665,8 @@ cleanup:
+  * wolfSSL's built-in certificate validation mechanisms anymore. We instead
+  * must call into the Security Framework APIs to authenticate peer certificates
+  */
+-static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
++static int DoAppleNativeCertValidation(WOLFSSL* ssl,
++                                            const WOLFSSL_BUFFER_INFO* certs,
+                                             int totalCerts)
+ {
+     int i;
+@@ -42674,7 +42675,8 @@ static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
+     CFMutableArrayRef certArray = NULL;
+     SecCertificateRef secCert   = NULL;
+     SecTrustRef       trust     = NULL;
+-    SecPolicyRef      policy    = NULL ;
++    SecPolicyRef      policy    = NULL;
++    CFStringRef       hostname  = NULL;
+ 
+     WOLFSSL_ENTER("DoAppleNativeCertValidation");
+ 
+@@ -42703,7 +42705,17 @@ static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
+     }
+ 
+     /* Create trust object for SecCertifiate Ref */
+-    policy = SecPolicyCreateSSL(true, NULL);
++    if (ssl->buffers.domainName.buffer &&
++            ssl->buffers.domainName.length > 0) {
++        /* Create policy with specified value to require host name match */
++        hostname = CFStringCreateWithCString(kCFAllocatorDefault,
++        (const char*)ssl->buffers.domainName.buffer, kCFStringEncodingUTF8);
++    }
++    if (hostname != NULL) {
++        policy = SecPolicyCreateSSL(true, hostname);
++    } else {
++        policy = SecPolicyCreateSSL(true, NULL);
++    }
+     status = SecTrustCreateWithCertificates(certArray, policy, &trust);
+     if (status != errSecSuccess) {
+         WOLFSSL_MSG_EX("Error creating trust object, "
+@@ -42734,6 +42746,9 @@ cleanup:
+     if (policy) {
+         CFRelease(policy);
+     }
++    if (hostname) {
++        CFRelease(hostname);
++    }
+ 
+     WOLFSSL_LEAVE("DoAppleNativeCertValidation", ret);
+ 
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch
new file mode 100644
index 0000000000..223b6d52a0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch
@@ -0,0 +1,28 @@
+From 7867076975aa84ebaed4001fae1ebffd013322d5 Mon Sep 17 00:00:00 2001
+From: Brett <bigbrett@users.noreply.github.com>
+Date: Wed, 4 Jun 2025 15:48:15 -0600
+Subject: [PATCH] prevent apple native cert validation from overriding error
+ codes other than ASN_NO_SIGNER_E
+
+CVE: CVE-2025-7395
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/bc8eeea703253bd65d472a9541b54fef326e8050]
+(cherry picked from commit bc8eeea703253bd65d472a9541b54fef326e8050)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/internal.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/internal.c b/src/internal.c
+index 1b9a469ee..6a76eb130 100644
+--- a/src/internal.c
++++ b/src/internal.c
+@@ -16774,7 +16774,8 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input, word32* inOutIdx,
+             /* If we can't validate the peer cert chain against the CAs loaded
+              * into wolfSSL, try to validate against the system certificates
+              * using Apple's native trust APIs */
+-            if ((ret != 0) && (ssl->ctx->doAppleNativeCertValidationFlag)) {
++            if ((ret == ASN_NO_SIGNER_E) &&
++                (ssl->ctx->doAppleNativeCertValidationFlag)) {
+                 if (DoAppleNativeCertValidation(ssl, args->certs,
+                                                      args->totalCerts)) {
+                     WOLFSSL_MSG("Apple native cert chain validation SUCCESS");
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch
new file mode 100644
index 0000000000..f786656765
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch
@@ -0,0 +1,26 @@
+From 70302af2c21a121845e1e721ed27b3b106f186f6 Mon Sep 17 00:00:00 2001
+From: Brett <bigbrett@users.noreply.github.com>
+Date: Wed, 4 Jun 2025 16:56:16 -0600
+Subject: [PATCH] add missing error trace macro
+
+CVE: CVE-2025-7395
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/0e2a3fd0b64bc6ba633aa9227e92ecacb42b5b1b]
+(cherry picked from commit 0e2a3fd0b64bc6ba633aa9227e92ecacb42b5b1b)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/internal.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/internal.c b/src/internal.c
+index 6a76eb130..1d01ee095 100644
+--- a/src/internal.c
++++ b/src/internal.c
+@@ -16774,7 +16774,7 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input, word32* inOutIdx,
+             /* If we can't validate the peer cert chain against the CAs loaded
+              * into wolfSSL, try to validate against the system certificates
+              * using Apple's native trust APIs */
+-            if ((ret == ASN_NO_SIGNER_E) &&
++            if ((ret == WC_NO_ERR_TRACE(ASN_NO_SIGNER_E)) &&
+                 (ssl->ctx->doAppleNativeCertValidationFlag)) {
+                 if (DoAppleNativeCertValidation(ssl, args->certs,
+                                                      args->totalCerts)) {
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-4.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-4.patch
new file mode 100644
index 0000000000..8af431f938
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-4.patch
@@ -0,0 +1,27 @@
+From 71d4cb57ceada7830457938787583c2aa6ba3555 Mon Sep 17 00:00:00 2001
+From: Brett <bigbrett@users.noreply.github.com>
+Date: Wed, 4 Jun 2025 18:29:05 -0600
+Subject: [PATCH] formatting
+
+CVE: CVE-2025-7395
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/89be92f1a8b255d85c0d8bfb8849571d259c199c]
+(cherry picked from commit 89be92f1a8b255d85c0d8bfb8849571d259c199c)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/internal.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/internal.c b/src/internal.c
+index 1d01ee095..992c10d2c 100644
+--- a/src/internal.c
++++ b/src/internal.c
+@@ -42710,7 +42710,8 @@ static int DoAppleNativeCertValidation(WOLFSSL* ssl,
+             ssl->buffers.domainName.length > 0) {
+         /* Create policy with specified value to require host name match */
+         hostname = CFStringCreateWithCString(kCFAllocatorDefault,
+-        (const char*)ssl->buffers.domainName.buffer, kCFStringEncodingUTF8);
++                                (const char*)ssl->buffers.domainName.buffer,
++                                 kCFStringEncodingUTF8);
+     }
+     if (hostname != NULL) {
+         policy = SecPolicyCreateSSL(true, hostname);
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index 9cd7c07ad2..4f323ec128 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -17,6 +17,10 @@ SRC_URI = " \
     file://0001-wolfssl-wolfcrypt-logging.h-and-wolfcrypt-src-loggin.patch \
     file://run-ptest \
     file://CVE-2025-13912.patch \
+    file://CVE-2025-7395-1.patch \
+    file://CVE-2025-7395-2.patch \
+    file://CVE-2025-7395-3.patch \
+    file://CVE-2025-7395-4.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

