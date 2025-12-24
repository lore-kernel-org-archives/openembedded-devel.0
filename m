Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09F1E75454
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 13:01:41 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.119671.1766581293015371992
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 05:01:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gk/a7WX5;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so34352535e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 05:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766581291; x=1767186091; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s7IAR6TGLO2nx2kkY7iTVTlfyeJWh3uDnBBH7Q0xS3U=;
        b=Gk/a7WX5JLB6DhFZ+DqeqWXrHNE+L5KLRZ2h50A9EnjDdv65yyxrnH3ofbqTFgHMiE
         wplXIKyveKEJrHfJo0830bePf7jTdwchBkYr+IXkH91RNUITvLlbKKyBMjGX71NsI6vM
         jUB0qlV/AEfKO1ge7amqa+VbGxV1DJ3XxlMqAS43KkKQ8vjE8a4WhLeECg6flYUgW3MN
         hCT+5qULV0XrVOGwAFXgAOSaBA9I9cBjAQSSSBm+ceyuTdo1vEZVlNBYYe4/dSwAbTky
         6PkIjNt3CSnYq18ERka7YglH9OP6ifo/JLhpcZLteW8mke1p6c9TxRukYuzmQW24/1mf
         pJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766581291; x=1767186091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7IAR6TGLO2nx2kkY7iTVTlfyeJWh3uDnBBH7Q0xS3U=;
        b=XBuN1vAFYXVp4zfmXpNKLTl+nalkb8JY2ONBmvUJ8CuFu6EOtJp5QTzH5MktZaSnZt
         n2W3mUyI+Fc1AWErBQy9Cn0HB88Azu0FCjoOfSxXxPB44RIOJTdnQYPPVw0MDfxwgRd6
         /r2oR9iGA+zBtTGxb5YXbWetyvY+ZvpeQ8hKeKNNG7n5IVJRfInDUMWM90RFo5P64W0O
         RVM9Oq/h+wXovQSLmDU1eVn/ZKtD4mdu53XFB8Bnsz7XrYbAAth+WfNFsIxk6Fq+XzBF
         7XYYuI0a+dxmRtKnJP4Ewdx7s13WTo+XYP5V8SDwTX3pPAOUIcmIw3P6T0IMjOa5Qo64
         +kLQ==
X-Gm-Message-State: AOJu0Yw3SniIyybKbuIrDhKOgYuhyLLCqz5j/SThDkCQTA4LoCUontz6
	DpqR0cXIzcaJ2rSMS0NSF53NZR3N6m/g8uSOic2psDxDUyee+jCVmOLJQ/rQgg==
X-Gm-Gg: AY/fxX6ChBhSya7FE9xFgrZ47ma+15bm9HTa18+ujAekqMeEToJHD2WzLnC14eGpAEt
	XJXLUU3sgqDA4V/sl/FEjBbHU7ZcanvNmXuZ124vwlpoZ5W8qmMJ0Zi/2eLYMPj7pQXbgHC8Ns0
	xfc4zF2wckkXA0jcew4/7aW/VcUQEnUZEmXS1n1rLXFrisg25WAWUh8cvrXGmPAWM4H5+iDu6G5
	xUghWoOGaaXiZHqnXmNwngKnqKFn+tE/3EL3mxMnAKG0n9jj48UZTp3x3UJM2B77sMZrKlzDo0S
	QnIn0RNV1XlMDzKyHa9UkBVDWkw2Abv+7IZSrC5Xwc5N5X7f+RFQwIl/aMs80BeFLJvkTuUTZuh
	uK3nxbqUDd2m+qcSti17yHWQfl2XDhPyT3J+dOtQS65VzfrZfdfc/GLfkvMlXVxyPr2ErUw7CsM
	121C7S8ZyT+SmCMJzsWQQ=
X-Google-Smtp-Source: AGHT+IHTAoPfqMPGOIrG+fHmoFBpOrveg8lf8/7PPmCgLFAH0Md7mf93X5xL8igJTVUBhcBB0frndg==
X-Received: by 2002:a05:600c:46cb:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-47d1953b78cmr198008075e9.1.1766581291188;
        Wed, 24 Dec 2025 05:01:31 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ac5409sm133079975e9.15.2025.12.24.05.01.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 05:01:30 -0800 (PST)
Message-ID: <6f0fa420-b3af-4405-87dc-059bd7af34a9@gmail.com>
Date: Wed, 24 Dec 2025 14:01:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][scarthgap][PATCH] wolfssl: patch
 CVE-2025-7395
To: openembedded-devel@lists.openembedded.org
References: <188427E30A49A476.1342979@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <188427E30A49A476.1342979@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 13:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122884

While testing this patch, I noticed that a ptest failed
(test_wolfSSL_CTX_load_verify_locations) - but it's not a regression
from this change, because upon looking a bit more, it fails without this
patch also. (I suspect this *may* be fixed by the patch from [1], but
it's long and it seems to come with some build flag changes, so... that
test fails for now)

[1]:
https://git.openembedded.org/meta-openembedded/commit/meta-networking/recipes-connectivity/wolfssl?id=5cf87bcb8704b7ed1fe4aa5953870a2e627dd50a

On 12/24/25 13:53, Gyorgy Sarvari via lists.openembedded.org wrote:
> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-7395
>
> Backport the patches from the PR[1] that is referenced by the project's
> changelog[2] to fix this issue.
>
> [1]: https://github.com/wolfSSL/wolfssl/pull/8833
> [2]: https://github.com/wolfSSL/wolfssl/blob/master/ChangeLog.md
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../wolfssl/files/CVE-2025-7395-1.patch       | 84 +++++++++++++++++++
>  .../wolfssl/files/CVE-2025-7395-2.patch       | 27 ++++++
>  .../wolfssl/files/CVE-2025-7395-3.patch       | 25 ++++++
>  .../wolfssl/wolfssl_5.7.2.bb                  | 10 ++-
>  4 files changed, 142 insertions(+), 4 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch
>
> diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
> new file mode 100644
> index 0000000000..9c661d6b57
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
> @@ -0,0 +1,84 @@
> +From e6c0d1ac7b480c0b5e36f660dd3c0f2b45e4c3ab Mon Sep 17 00:00:00 2001
> +From: Ruby Martin <ruby@wolfssl.com>
> +Date: Mon, 2 Jun 2025 16:38:32 -0600
> +Subject: [PATCH] create policy for WOLFSSL_APPLE_NATIVE_CERT_VALIDATION,
> + domain name checking
> +
> +CVE: CVE-2025-7395
> +Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/9864959e41bd9259f258c09171ae2ec1c43fbc7f]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + src/internal.c | 25 ++++++++++++++++++++-----
> + 1 file changed, 20 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/internal.c b/src/internal.c
> +index 6bbd38fa8..2b090382f 100644
> +--- a/src/internal.c
> ++++ b/src/internal.c
> +@@ -221,7 +221,7 @@ WOLFSSL_CALLBACKS needs LARGE_STATIC_BUFFERS, please add LARGE_STATIC_BUFFERS
> + #include <Security/SecCertificate.h>
> + #include <Security/SecTrust.h>
> + #include <Security/SecPolicy.h>
> +-static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
> ++static int DoAppleNativeCertValidation(WOLFSSL* ssl, const WOLFSSL_BUFFER_INFO* certs,
> +                                             int totalCerts);
> + #endif /* #if defined(__APPLE__) && defined(WOLFSSL_SYS_CA_CERTS) */
> + 
> +@@ -15992,7 +15992,7 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input, word32* inOutIdx,
> +              * into wolfSSL, try to validate against the system certificates
> +              * using Apple's native trust APIs */
> +             if ((ret != 0) && (ssl->ctx->doAppleNativeCertValidationFlag)) {
> +-                if (DoAppleNativeCertValidation(args->certs,
> ++                if (DoAppleNativeCertValidation(ssl, args->certs,
> +                                                      args->totalCerts)) {
> +                     WOLFSSL_MSG("Apple native cert chain validation SUCCESS");
> +                     ret = 0;
> +@@ -41246,7 +41246,8 @@ cleanup:
> +  * wolfSSL's built-in certificate validation mechanisms anymore. We instead
> +  * must call into the Security Framework APIs to authenticate peer certificates
> +  */
> +-static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
> ++static int DoAppleNativeCertValidation(WOLFSSL* ssl,
> ++                                            const WOLFSSL_BUFFER_INFO* certs,
> +                                             int totalCerts)
> + {
> +     int i;
> +@@ -41255,7 +41256,8 @@ static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
> +     CFMutableArrayRef certArray = NULL;
> +     SecCertificateRef secCert   = NULL;
> +     SecTrustRef       trust     = NULL;
> +-    SecPolicyRef      policy    = NULL ;
> ++    SecPolicyRef      policy    = NULL;
> ++    CFStringRef       hostname  = NULL;
> + 
> +     WOLFSSL_ENTER("DoAppleNativeCertValidation");
> + 
> +@@ -41283,7 +41285,17 @@ static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,
> +     }
> + 
> +     /* Create trust object for SecCertifiate Ref */
> +-    policy = SecPolicyCreateSSL(true, NULL);
> ++    if (ssl->buffers.domainName.buffer &&
> ++            ssl->buffers.domainName.length > 0) {
> ++        /* Create policy with specified value to require host name match */
> ++        hostname = CFStringCreateWithCString(kCFAllocatorDefault,
> ++        (const char*)ssl->buffers.domainName.buffer, kCFStringEncodingUTF8);
> ++    }
> ++    if (hostname != NULL) {
> ++        policy = SecPolicyCreateSSL(true, hostname);
> ++    } else {
> ++        policy = SecPolicyCreateSSL(true, NULL);
> ++    }
> +     status = SecTrustCreateWithCertificates(certArray, policy, &trust);
> +     if (status != errSecSuccess) {
> +         WOLFSSL_MSG_EX("Error creating trust object, "
> +@@ -41314,6 +41326,9 @@ cleanup:
> +     if (policy) {
> +         CFRelease(policy);
> +     }
> ++    if (hostname) {
> ++        CFRelease(hostname);
> ++    }
> + 
> +     WOLFSSL_LEAVE("DoAppleNativeCertValidation", ret);
> + 
> diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch
> new file mode 100644
> index 0000000000..857f6bb367
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch
> @@ -0,0 +1,27 @@
> +From aad4e7c38f3784942923f4871d61a7e41d3de842 Mon Sep 17 00:00:00 2001
> +From: Brett <bigbrett@users.noreply.github.com>
> +Date: Wed, 4 Jun 2025 15:48:15 -0600
> +Subject: [PATCH] prevent apple native cert validation from overriding error
> + codes other than ASN_NO_SIGNER_E
> +
> +CVE: CVE-2025-7395
> +Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/bc8eeea703253bd65d472a9541b54fef326e8050]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + src/internal.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/internal.c b/src/internal.c
> +index 2b090382f..79f584a0a 100644
> +--- a/src/internal.c
> ++++ b/src/internal.c
> +@@ -15991,7 +15991,8 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input, word32* inOutIdx,
> +             /* If we can't validate the peer cert chain against the CAs loaded
> +              * into wolfSSL, try to validate against the system certificates
> +              * using Apple's native trust APIs */
> +-            if ((ret != 0) && (ssl->ctx->doAppleNativeCertValidationFlag)) {
> ++            if ((ret == ASN_NO_SIGNER_E) &&
> ++                (ssl->ctx->doAppleNativeCertValidationFlag)) {
> +                 if (DoAppleNativeCertValidation(ssl, args->certs,
> +                                                      args->totalCerts)) {
> +                     WOLFSSL_MSG("Apple native cert chain validation SUCCESS");
> diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch
> new file mode 100644
> index 0000000000..a7e1c336f3
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch
> @@ -0,0 +1,25 @@
> +From f2a85e37e552d8dfafa2cbf32507b2fa545ee593 Mon Sep 17 00:00:00 2001
> +From: Brett <bigbrett@users.noreply.github.com>
> +Date: Wed, 4 Jun 2025 16:56:16 -0600
> +Subject: [PATCH] add missing error trace macro
> +
> +CVE: CVE-2025-7395
> +Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/0e2a3fd0b64bc6ba633aa9227e92ecacb42b5b1b]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + src/internal.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/internal.c b/src/internal.c
> +index 79f584a0a..5557b5698 100644
> +--- a/src/internal.c
> ++++ b/src/internal.c
> +@@ -15991,7 +15991,7 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input, word32* inOutIdx,
> +             /* If we can't validate the peer cert chain against the CAs loaded
> +              * into wolfSSL, try to validate against the system certificates
> +              * using Apple's native trust APIs */
> +-            if ((ret == ASN_NO_SIGNER_E) &&
> ++            if ((ret == WC_NO_ERR_TRACE(ASN_NO_SIGNER_E)) &&
> +                 (ssl->ctx->doAppleNativeCertValidationFlag)) {
> +                 if (DoAppleNativeCertValidation(ssl, args->certs,
> +                                                      args->totalCerts)) {
> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
> index 8f484d6098..5e66c8b186 100644
> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
> @@ -12,10 +12,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  PROVIDES += "cyassl"
>  RPROVIDES:${PN} = "cyassl"
>  
> -SRC_URI = " \
> -    git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master \
> -    file://run-ptest \
> -"
> +SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master \
> +           file://run-ptest \
> +           file://CVE-2025-7395-1.patch \
> +           file://CVE-2025-7395-2.patch \
> +           file://CVE-2025-7395-3.patch \
> +           "
>  SRCREV = "00e42151ca061463ba6a95adb2290f678cbca472"
>  
>  S = "${WORKDIR}/git"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122883): https://lists.openembedded.org/g/openembedded-devel/message/122883
> Mute This Topic: https://lists.openembedded.org/mt/116928357/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


