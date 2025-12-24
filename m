Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8278E75453
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 12:53:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.119971.1766580809495538135
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 04:53:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZSSnAf9L;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso58070965e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 04:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766580808; x=1767185608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=w3mG0LAeH9OWetdjWgk6Qv4JTxM+j5+eJUe6Fr4pvoY=;
        b=ZSSnAf9Levn/XCOeqt2WToqk+IC+4GP8YJgaNt2xCMkYaU6Na4q7L2PzUNTCGzF0NW
         0m0zIfnLaRPMCyFUamhhWFERwMuf46GtwmybfUky1PkKjK3SpR92ZZs1S9Xn7zdcXG67
         qMByjTD+b7iGmU1GtlCKyzLf7qNksfuGfLuqNU9bS/6b90UtRZobl2PHhJb4NOiIGA0t
         M97N5VvA4X60iJbtlTQC8i8bBIn8zFJLHTTOrniwB4a0P8hZEjL2f7sO2/PhwmV6AJ7Z
         9COyC/SO67ZX1/yeRyo6TMioPDgeU0zansa+LmczbgImsXGVtcqEyXAIZSSDHGL5XP0A
         dXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580808; x=1767185608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3mG0LAeH9OWetdjWgk6Qv4JTxM+j5+eJUe6Fr4pvoY=;
        b=eL1UPoeGh02/YdtO0MuFAXSBjUVVSSmq/V2vkuGdsD8pWJ0hzcxzO2Qt9Q1EvDKi8y
         aK9Xd4y0v0UccHJDho7le6xDNZZw+NzKlBL8jAMX0tYdLhvnIF73xDSKfyAmIn89+g/y
         Ol+nv2gAPsfcEEhUMNkPltQixH8xjCVKaC4+uhvvrxj9gM28kwHtD/GE8WDE1PKFophn
         MaQJ3mpJtx0rUWH86+RFlJKrL63jNR0p5unABjdZlfUGqqt65qAqkP0Qmc3GM//6TukI
         V8CqJuxHiye3NvzOuMhGTwQJFKuMVBDZRnxuPPXSUscF7w/OU562iomXdq9ENhayaCw8
         cxFg==
X-Gm-Message-State: AOJu0YzKXV7MZ+P1J4GX871N79FUz+uKCbmCnuQjdOOboBfgDFdJkLEF
	7DOVRc7D1a8oeVzkt1Yv5dxR0apeIySESfrvUQsFYWZAv/c02I2oXeIKh0WzWg==
X-Gm-Gg: AY/fxX7SflA49yJclIkfNu7M5ghTe2ActeNtvEZAjpt+UXqxrN31LJ0t6nNKGLdd4w0
	o1qWu1KMLYU1402dAHdFL2lCcJQgiD56HeFja4hBDEsveESEeNntnuVHzCZcqwyVEJrA3wL3sc5
	GN++ObDo+zNANY16GfkPyRo4wfsBAO9lrI7JSO1mUI/AC9Lv3y4bhy5o+j3DJS07Q+cVcKz/+La
	y58CvGx3wqwjC1QSe0efFOuePfai0lBxEFdDbalmJBe/L5e9mNGkCF6iOgDs3M/D83+d0hCf5wt
	NrGbQgG5ZghsEkfALG4pU84xvcFDZ3EtymasNAZUX5qlRGHGvWeD5t1DhS/NSfxN2fcN7lO8chv
	DlmDdWBCsPvlCekTvuylwyumN1QwQ3dmCjfZIV0OAQpMqr3L1jgahm734KVQ2vnlN0FS0hkoyjY
	PnX8S/3uxc6tgs+XHjFY0=
X-Google-Smtp-Source: AGHT+IFP9iK6nd47zJorvUrLS/GfpNrCzaGdypR2KaSLGQtoaCbpY0rxb4WjmzvnS0+Uyffe+cPccw==
X-Received: by 2002:a05:600c:4e42:b0:47b:de05:aa28 with SMTP id 5b1f17b1804b1-47d1956eb65mr140660155e9.2.1766580807558;
        Wed, 24 Dec 2025 04:53:27 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193cbc0bsm298569455e9.11.2025.12.24.04.53.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:53:27 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH] wolfssl: patch CVE-2025-7395
Date: Wed, 24 Dec 2025 13:53:26 +0100
Message-ID: <20251224125326.1951044-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 12:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122883

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-7395

Backport the patches from the PR[1] that is referenced by the project's
changelog[2] to fix this issue.

[1]: https://github.com/wolfSSL/wolfssl/pull/8833
[2]: https://github.com/wolfSSL/wolfssl/blob/master/ChangeLog.md

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../wolfssl/files/CVE-2025-7395-1.patch       | 84 +++++++++++++++++++
 .../wolfssl/files/CVE-2025-7395-2.patch       | 27 ++++++
 .../wolfssl/files/CVE-2025-7395-3.patch       | 25 ++++++
 .../wolfssl/wolfssl_5.7.2.bb                  | 10 ++-
 4 files changed, 142 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
new file mode 100644
index 0000000000..9c661d6b57
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
@@ -0,0 +1,84 @@
+From e6c0d1ac7b480c0b5e36f660dd3c0f2b45e4c3ab Mon Sep 17 00:00:00 2001
+From: Ruby Martin <ruby@wolfssl.com>
+Date: Mon, 2 Jun 2025 16:38:32 -0600
+Subject: [PATCH] create policy for WOLFSSL_APPLE_NATIVE_CERT_VALIDATION,
+ domain name checking
+
+CVE: CVE-2025-7395
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/9864959e41bd9259f258c09171ae2ec1c43fbc7f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/internal.c | 25 ++++++++++++++++++++-----
+ 1 file changed, 20 insertions(+), 5 deletions(-)
+
+diff --git a/src/internal.c b/src/internal.c
+index 6bbd38fa8..2b090382f 100644
+--- a/src/internal.c
++++ b/src/internal.c
+@@ -221,7 +221,7 @@ WOLFSSL_CALLBACKS needs LARGE_STATIC_BUFFERS, please add LARGE_STATIC_BUFFERS
+ #include <Security/SecCertificate.h>
+ #include <Security/SecTrust.h>
+ #include <Security/SecPolicy.h>
+-static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
++static int DoAppleNativeCertValidation(WOLFSSL* ssl, const WOLFSSL_BUFFER_INFO* certs,
+                                             int totalCerts);
+ #endif /* #if defined(__APPLE__) && defined(WOLFSSL_SYS_CA_CERTS) */
+ 
+@@ -15992,7 +15992,7 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input, word32* inOutIdx,
+              * into wolfSSL, try to validate against the system certificates
+              * using Apple's native trust APIs */
+             if ((ret != 0) && (ssl->ctx->doAppleNativeCertValidationFlag)) {
+-                if (DoAppleNativeCertValidation(args->certs,
++                if (DoAppleNativeCertValidation(ssl, args->certs,
+                                                      args->totalCerts)) {
+                     WOLFSSL_MSG("Apple native cert chain validation SUCCESS");
+                     ret = 0;
+@@ -41246,7 +41246,8 @@ cleanup:
+  * wolfSSL's built-in certificate validation mechanisms anymore. We instead
+  * must call into the Security Framework APIs to authenticate peer certificates
+  */
+-static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
++static int DoAppleNativeCertValidation(WOLFSSL* ssl,
++                                            const WOLFSSL_BUFFER_INFO* certs,
+                                             int totalCerts)
+ {
+     int i;
+@@ -41255,7 +41256,8 @@ static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
+     CFMutableArrayRef certArray = NULL;
+     SecCertificateRef secCert   = NULL;
+     SecTrustRef       trust     = NULL;
+-    SecPolicyRef      policy    = NULL ;
++    SecPolicyRef      policy    = NULL;
++    CFStringRef       hostname  = NULL;
+ 
+     WOLFSSL_ENTER("DoAppleNativeCertValidation");
+ 
+@@ -41283,7 +41285,17 @@ static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
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
+@@ -41314,6 +41326,9 @@ cleanup:
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
index 0000000000..857f6bb367
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch
@@ -0,0 +1,27 @@
+From aad4e7c38f3784942923f4871d61a7e41d3de842 Mon Sep 17 00:00:00 2001
+From: Brett <bigbrett@users.noreply.github.com>
+Date: Wed, 4 Jun 2025 15:48:15 -0600
+Subject: [PATCH] prevent apple native cert validation from overriding error
+ codes other than ASN_NO_SIGNER_E
+
+CVE: CVE-2025-7395
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/bc8eeea703253bd65d472a9541b54fef326e8050]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/internal.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/internal.c b/src/internal.c
+index 2b090382f..79f584a0a 100644
+--- a/src/internal.c
++++ b/src/internal.c
+@@ -15991,7 +15991,8 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input, word32* inOutIdx,
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
index 0000000000..a7e1c336f3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch
@@ -0,0 +1,25 @@
+From f2a85e37e552d8dfafa2cbf32507b2fa545ee593 Mon Sep 17 00:00:00 2001
+From: Brett <bigbrett@users.noreply.github.com>
+Date: Wed, 4 Jun 2025 16:56:16 -0600
+Subject: [PATCH] add missing error trace macro
+
+CVE: CVE-2025-7395
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/0e2a3fd0b64bc6ba633aa9227e92ecacb42b5b1b]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/internal.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/internal.c b/src/internal.c
+index 79f584a0a..5557b5698 100644
+--- a/src/internal.c
++++ b/src/internal.c
+@@ -15991,7 +15991,7 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input, word32* inOutIdx,
+             /* If we can't validate the peer cert chain against the CAs loaded
+              * into wolfSSL, try to validate against the system certificates
+              * using Apple's native trust APIs */
+-            if ((ret == ASN_NO_SIGNER_E) &&
++            if ((ret == WC_NO_ERR_TRACE(ASN_NO_SIGNER_E)) &&
+                 (ssl->ctx->doAppleNativeCertValidationFlag)) {
+                 if (DoAppleNativeCertValidation(ssl, args->certs,
+                                                      args->totalCerts)) {
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
index 8f484d6098..5e66c8b186 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
@@ -12,10 +12,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
-SRC_URI = " \
-    git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master \
-    file://run-ptest \
-"
+SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master \
+           file://run-ptest \
+           file://CVE-2025-7395-1.patch \
+           file://CVE-2025-7395-2.patch \
+           file://CVE-2025-7395-3.patch \
+           "
 SRCREV = "00e42151ca061463ba6a95adb2290f678cbca472"
 
 S = "${WORKDIR}/git"

