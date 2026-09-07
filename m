Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EE1C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:29 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31925.1788776667248683172
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rws8gEzq;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9e7391839cso3528052a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776667; x=1789381467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ZpoZYRb+PI+XuevsLNMuvxoN3s9INh+91e/35w6yKE=;
        b=rws8gEzqgsfHXA4RJc92v8MyOj4AYcRCi9vDcGQ2/zwejVRJEHfsBB/r6TPjMdmlpE
         HYVraXkh87msZcG0YraHJez0FEr4bkbDNhr6DOpm+a8NTfsA6EfHsELhZf2sH9qW+cdh
         7B/Uxj7PogXDrvZyZGGizZp6ahBponPhQhGaAVUhN1nC224UEDWjw6sJQYit+7SctY+k
         jN6qvbO8uK/oN2eg2t6TleP+LnV3uFPRs1JhgmVKVf6KtDmBX9OcFaGgUmM3OkZV8bRh
         hTlIqimAWf1kTbAorRMditbDopa7THr1/HD6wVpr39NQ+Qcfdys171Micyl6T3Mx0cm8
         wP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776667; x=1789381467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ZpoZYRb+PI+XuevsLNMuvxoN3s9INh+91e/35w6yKE=;
        b=ARJaSmiMXPjksgOXRvT+fY99w94zanVypm9hKuRFA3IbOseEtkujca+VcEWnQbGvUX
         0xMezZy99kuyDgvNl4N91PgCevVeCbLup6yIO0iK3nbt1Y5TVcRARwGXXXHIgAXjBj7w
         s+QXU2SqNU4A0w1xg2O1RHIZgCaBnHkSAOD0QOYIlI+xj4vRatTiFeuW9YujAzTFrdgK
         ytjd9TGMnb/hI8d6VTK5rmD9uijvOhUdnEVybyfoeO7OgxgL+mcVOmmu+odZVEdo+zx2
         xm9U+QXNNy+7KhVvhMx63ZddDaPsE8s71fKcs46Q9WPuuxoREahpXSD39CcKpeMPuqSK
         DiWw==
X-Gm-Message-State: AFuF++n5H5OdTcTX9DflGCqMIEwXsKgLtNMbu1/3bKVE2RwLRZVOh1tP
	+7VOJxtaQXZPgp23ER3MSDKf6KH1wx+UtMetQzkr8vwGhyyXyMVQF2/7eQtYBw==
X-Gm-Gg: AYBFou37fvzloTCDNvwKMDjvcGQA38WiKxT6VSSqhKxttGTYiUCtgFK6v2EMV+HVSCl
	uv/rm5hb3F/yUFIYzaPn3DObqnQQfOcjhPNXaridxvxYRr2f5v6o0tgJO78sgIrFt8uXEGV/BM8
	e/k4cZtFx0bR9xNOKosQqTYlAseVZXa3VjLLoJk/2XdlAtMF5nJQf/V5E694Hj0Y5iDFgQn90G1
	MGY1yk5blgGKdOH6c16WjUGsNavTgUSYvOY9t4GQNGMHvxayqfYGb63P4qXPcmcL0FoAKrHOic5
	XUz+rnCeZjQEM6NhIY+tZ6onCC9OFLydrkdAmFJLlqm575FqZ7+GXeaHCpNiOxQgC6XgkbjJTh5
	cBb6CJ1CxG+f4ixhaeK9WAD07Mu9Ekusm1Ph2orVOKkI78jVhiONhsbpB7xWx2dy4iYelbWSVWm
	9e1BMszT0yOllNLBY7i9399yqZiWJ1FtTZEkXKugDGEhuAsOgudvcOotj8bQkFBdTHCx6hbwXi
X-Received: by 2002:a17:90b:3943:b0:398:d8eb:cb2a with SMTP id 98e67ed59e1d1-39b26273e31mr36401170a91.23.1788776666367;
        Mon, 07 Sep 2026 03:24:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 21/33] wolfssl: patch CVE-2026-10098
Date: Mon,  7 Sep 2026 22:23:05 +1200
Message-ID: <20260907102318.2459883-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129833

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

CVE-2026-10098-1.patch is needed to cherry-pick the commit mentioned in the
PR[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-10098

[1]https://github.com/wolfSSL/wolfssl/pull/10554/commits

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-10098-1.patch      | 368 ++++++++++++++++++
 .../wolfssl/files/CVE-2026-10098-2.patch      | 126 ++++++
 .../wolfssl/wolfssl_5.9.1.bb                  |   2 +
 3 files changed, 496 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10098-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10098-2.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10098-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10098-1.patch
new file mode 100644
index 0000000000..86f1c8a9a0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10098-1.patch
@@ -0,0 +1,368 @@
+From d2dca1bdcb6dc5f6fb02c44a042130cd11d27cd0 Mon Sep 17 00:00:00 2001
+From: Colton Willey <colton@wolfssl.com>
+Date: Mon, 13 Apr 2026 20:29:50 -0700
+Subject: [PATCH] Fix NULL derefs, buffer overflow, and i2d contract in
+ EVP/OCSP/X509
+
+Harden OpenSSL compatibility layer against NULL pointers, negative lengths,
+and buffer overflows across EVP, OCSP, and X509 APIs. Fix DSA SignFinal
+write-before-check overflow, add missing i2d_OCSP_RESPONSE allocation path,
+and fix unaligned keyUsage access.
+
+(cherry picked from commit 58a27848a800aadca91f606dc4fe5234b9971011)
+
+CVE: CVE-2026-10098
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/58a27848a800aadca91f606dc4fe5234b9971011]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ocsp.c               | 39 +++++++++++++++++++++++++------
+ src/ssl.c                |  8 ++++++-
+ src/x509.c               | 12 ++++++++--
+ tests/api.c              |  2 +-
+ wolfcrypt/src/evp.c      | 50 ++++++++++++++++++++++++++++++++--------
+ wolfcrypt/src/pwdbased.c |  3 +++
+ 6 files changed, 94 insertions(+), 20 deletions(-)
+
+diff --git a/src/ocsp.c b/src/ocsp.c
+index 2fff7ced5..9de23cb9e 100644
+--- a/src/ocsp.c
++++ b/src/ocsp.c
+@@ -749,7 +749,9 @@ int wolfSSL_OCSP_resp_find_status(WOLFSSL_OCSP_BASICRESP *bs,
+ 
+     single = bs->single;
+     while (single != NULL) {
+-        if ((XMEMCMP(single->status->serial, id->status->serial, (size_t)single->status->serialSz) == 0)
++        if (single->status != NULL && id->status != NULL &&
++            (XMEMCMP(single->status->serial, id->status->serial,
++                     (size_t)single->status->serialSz) == 0)
+          && (XMEMCMP(single->issuerHash, id->issuerHash, OCSP_DIGEST_SIZE) == 0)
+          && (XMEMCMP(single->issuerKeyHash, id->issuerKeyHash, OCSP_DIGEST_SIZE) == 0)) {
+             break;
+@@ -757,7 +759,7 @@ int wolfSSL_OCSP_resp_find_status(WOLFSSL_OCSP_BASICRESP *bs,
+         single = single->next;
+     }
+ 
+-    if (single == NULL)
++    if (single == NULL || single->status == NULL)
+         return WOLFSSL_FAILURE;
+ 
+     if (status != NULL)
+@@ -1108,6 +1110,9 @@ int wolfSSL_OCSP_basic_verify(WOLFSSL_OCSP_BASICRESP* bs,
+     int embedded;
+     DecodedCert *cert = NULL;
+ 
++    if (bs == NULL)
++        return WOLFSSL_FAILURE;
++
+     ret = OcspFindSigner(bs, certs, &cert, &embedded, flags);
+     if (ret != 0) {
+         WOLFSSL_MSG("OCSP no signer found");
+@@ -1300,15 +1305,31 @@ int wolfSSL_i2d_OCSP_RESPONSE(OcspResponse* response,
+     if (response == NULL)
+         return BAD_FUNC_ARG;
+ 
++    if (response->source == NULL)
++        return BAD_FUNC_ARG;
++
+     if (data == NULL)
+         return (int)response->maxIdx;
+ 
+-    XMEMCPY(*data, response->source, response->maxIdx);
++    if (*data == NULL) {
++        *data = (unsigned char*)XMALLOC(response->maxIdx, NULL,
++                                        DYNAMIC_TYPE_OPENSSL);
++        if (*data == NULL)
++            return -1;
++        XMEMCPY(*data, response->source, response->maxIdx);
++    }
++    else {
++        XMEMCPY(*data, response->source, response->maxIdx);
++        *data += response->maxIdx;
++    }
++
+     return (int)response->maxIdx;
+ }
+ 
+ int wolfSSL_OCSP_response_status(OcspResponse *response)
+ {
++    if (response == NULL)
++        return -1;
+     return response->responseStatus;
+ }
+ 
+@@ -1335,8 +1356,12 @@ const char *wolfSSL_OCSP_response_status_str(long s)
+ WOLFSSL_OCSP_BASICRESP* wolfSSL_OCSP_response_get1_basic(OcspResponse* response)
+ {
+     WOLFSSL_OCSP_BASICRESP* bs;
+-    const unsigned char *ptr = response->source;
++    const unsigned char *ptr;
+ 
++    if (response == NULL || response->source == NULL)
++        return NULL;
++
++    ptr = response->source;
+     bs = wolfSSL_d2i_OCSP_RESPONSE(NULL, &ptr, response->maxIdx);
+     return bs;
+ }
+@@ -1637,8 +1662,8 @@ int wolfSSL_OCSP_single_get0_status(WOLFSSL_OCSP_SINGLERESP *single,
+                                     WOLFSSL_ASN1_TIME **thisupd,
+                                     WOLFSSL_ASN1_TIME **nextupd)
+ {
+-    if (single == NULL)
+-        return WOLFSSL_FAILURE;
++    if (single == NULL || single->status == NULL)
++        return -1;
+ 
+ #ifdef WOLFSSL_OCSP_PARSE_STATUS
+     if (thisupd != NULL)
+@@ -1784,7 +1809,7 @@ int wolfSSL_OCSP_REQ_CTX_add1_header(WOLFSSL_OCSP_REQ_CTX *ctx,
+ {
+     WOLFSSL_ENTER("wolfSSL_OCSP_REQ_CTX_add1_header");
+ 
+-    if (name == NULL) {
++    if (ctx == NULL || name == NULL) {
+         WOLFSSL_MSG("Bad parameter");
+         return WOLFSSL_FAILURE;
+     }
+diff --git a/src/ssl.c b/src/ssl.c
+index 58cd6701c..7d6ca462b 100644
+--- a/src/ssl.c
++++ b/src/ssl.c
+@@ -11699,13 +11699,19 @@ char* wolfSSL_CIPHER_description(const WOLFSSL_CIPHER* cipher, char* in,
+ int wolfSSL_OCSP_parse_url(const char* url, char** host, char** port,
+         char** path, int* ssl)
+ {
+-    const char* u = url;
++    const char* u;
+     const char* upath; /* path in u */
+     const char* uport; /* port in u */
+     const char* hostEnd;
+ 
+     WOLFSSL_ENTER("OCSP_parse_url");
+ 
++    if (url == NULL || host == NULL || port == NULL || path == NULL ||
++            ssl == NULL) {
++        return WOLFSSL_FAILURE;
++    }
++
++    u = url;
+     *host = NULL;
+     *port = NULL;
+     *path = NULL;
+diff --git a/src/x509.c b/src/x509.c
+index 46dfd38ed..b92f7d735 100644
+--- a/src/x509.c
++++ b/src/x509.c
+@@ -1317,7 +1317,9 @@ int wolfSSL_X509_add_ext(WOLFSSL_X509 *x509, WOLFSSL_X509_EXTENSION *ext,
+         if (ext && ext->value.data) {
+             if (ext->value.length == sizeof(word16)) {
+                 /* if ext->value is already word16, set directly */
+-                x509->keyUsage = *(word16*)ext->value.data;
++                word16 ku;
++                XMEMCPY(&ku, ext->value.data, sizeof(word16));
++                x509->keyUsage = ku;
+ #ifdef BIG_ENDIAN_ORDER
+                 x509->keyUsage = rotlFixed16(x509->keyUsage, 8U);
+ #endif
+@@ -10998,6 +11000,11 @@ WOLFSSL_ASN1_INTEGER* wolfSSL_X509_get_serialNumber(WOLFSSL_X509* x509)
+     if (x509->serialNumber != NULL)
+        return x509->serialNumber;
+ 
++    if (x509->serialSz < 0) {
++        WOLFSSL_MSG("Invalid serial number size");
++        return NULL;
++    }
++
+     a = wolfSSL_ASN1_INTEGER_new();
+     if (a == NULL)
+         return NULL;
+@@ -16120,7 +16127,8 @@ int wolfSSL_X509_set1_notBefore(WOLFSSL_X509* x509, const WOLFSSL_ASN1_TIME *t)
+ int wolfSSL_X509_set_serialNumber(WOLFSSL_X509* x509, WOLFSSL_ASN1_INTEGER* s)
+ {
+     WOLFSSL_ENTER("wolfSSL_X509_set_serialNumber");
+-    if (x509 == NULL || s == NULL || s->length >= EXTERNAL_SERIAL_SIZE)
++    if (x509 == NULL || s == NULL || s->data == NULL ||
++            s->length >= EXTERNAL_SERIAL_SIZE)
+         return WOLFSSL_FAILURE;
+ 
+     /* WOLFSSL_ASN1_INTEGER has type | size | data
+diff --git a/tests/api.c b/tests/api.c
+index 5eca4071a..919b951b3 100644
+--- a/tests/api.c
++++ b/tests/api.c
+@@ -20274,7 +20274,7 @@ static int test_wolfSSL_OCSP_single_get0_status(void)
+     ExpectPtrEq(nextDate, &certStatus.nextDateParsed);
+ 
+     ExpectIntEQ(wolfSSL_OCSP_single_get0_status(NULL, NULL, NULL, NULL, NULL),
+-        CERT_GOOD);
++        -1);
+     ExpectIntEQ(wolfSSL_OCSP_single_get0_status(&single, NULL, NULL, NULL,
+         NULL), CERT_GOOD);
+ #endif
+diff --git a/wolfcrypt/src/evp.c b/wolfcrypt/src/evp.c
+index 05e406883..996f31f86 100644
+--- a/wolfcrypt/src/evp.c
++++ b/wolfcrypt/src/evp.c
+@@ -1314,7 +1314,11 @@ int wolfSSL_EVP_CipherFinal(WOLFSSL_EVP_CIPHER_CTX *ctx, unsigned char *out,
+ #ifndef WOLFSSL_AESGCM_STREAM
+             if ((ctx->authBuffer && ctx->authBufferLen > 0)
+              || (ctx->authBufferLen == 0)) {
+-                if (ctx->enc)
++                if (ctx->authBufferLen > 0 && out == NULL) {
++                    ret = WOLFSSL_FAILURE;
++                    *outl = 0;
++                }
++                else if (ctx->enc)
+                     ret = wc_AesGcmEncrypt(&ctx->cipher.aes, out,
+                             ctx->authBuffer, ctx->authBufferLen,
+                             ctx->iv, ctx->ivSz, ctx->authTag, ctx->authTagSz,
+@@ -1397,7 +1401,11 @@ int wolfSSL_EVP_CipherFinal(WOLFSSL_EVP_CIPHER_CTX *ctx, unsigned char *out,
+         case WC_AES_256_CCM_TYPE:
+             if ((ctx->authBuffer && ctx->authBufferLen > 0)
+              || (ctx->authBufferLen == 0)) {
+-                if (ctx->enc) {
++                if (ctx->authBufferLen > 0 && out == NULL) {
++                    ret = WOLFSSL_FAILURE;
++                    *outl = 0;
++                }
++                else if (ctx->enc) {
+                     ret = wc_AesCcmEncrypt(&ctx->cipher.aes, out,
+                         ctx->authBuffer, (word32)ctx->authBufferLen,
+                         ctx->iv, (word32)ctx->ivSz, ctx->authTag,
+@@ -4309,16 +4317,19 @@ int wolfSSL_EVP_SignFinal(WOLFSSL_EVP_MD_CTX *ctx, unsigned char *sigret,
+ #ifndef NO_DSA
+     case WC_EVP_PKEY_DSA: {
+         int bytes;
+-        ret = wolfSSL_DSA_do_sign(md, sigret, pkey->dsa);
++        unsigned char tmpSig[DSA_MAX_SIG_SIZE];
++        ret = wolfSSL_DSA_do_sign(md, tmpSig, pkey->dsa);
+         /* wolfSSL_DSA_do_sign() can return WOLFSSL_FATAL_ERROR */
+         if (ret != WOLFSSL_SUCCESS)
+             return ret;
+         bytes = wolfSSL_BN_num_bytes(pkey->dsa->q);
+         if (bytes == WC_NO_ERR_TRACE(WOLFSSL_FAILURE) ||
+-            (int)*siglen < bytes * 2)
++            bytes > DSA_MAX_HALF_SIZE ||
++            bytes * 2 > (int)*siglen)
+         {
+             return WOLFSSL_FAILURE;
+         }
++        XMEMCPY(sigret, tmpSig, bytes * 2);
+         *siglen = (unsigned int)(bytes * 2);
+         return WOLFSSL_SUCCESS;
+     }
+@@ -4398,7 +4409,8 @@ int wolfSSL_EVP_VerifyFinal(WOLFSSL_EVP_MD_CTX *ctx,
+     unsigned char md[WC_MAX_DIGEST_SIZE];
+     unsigned int mdsize;
+ 
+-    if (ctx == NULL) return WOLFSSL_FAILURE;
++    if (ctx == NULL || pkey == NULL || sig == NULL)
++        return WOLFSSL_FAILURE;
+     WOLFSSL_ENTER("EVP_VerifyFinal");
+     ret = wolfSSL_EVP_DigestFinal(ctx, md, &mdsize);
+     if (ret <= 0)
+@@ -4459,6 +4471,9 @@ WOLFSSL_EVP_PKEY* wolfSSL_EVP_PKEY_new_mac_key(int type, WOLFSSL_ENGINE* e,
+     if (type != WC_EVP_PKEY_HMAC || (key == NULL && keylen != 0))
+         return NULL;
+ 
++    if (keylen < 0)
++        return NULL;
++
+     pkey = wolfSSL_EVP_PKEY_new();
+     if (pkey != NULL) {
+         pkey->pkey.ptr = (char*)XMALLOC((size_t)keylen, NULL,
+@@ -4870,6 +4885,9 @@ int wolfSSL_EVP_DigestSignFinal(WOLFSSL_EVP_MD_CTX *ctx, unsigned char *sig,
+             return WOLFSSL_SUCCESS;
+         }
+     }
++    else if (ctx->pctx == NULL || ctx->pctx->pkey == NULL) {
++        return WOLFSSL_FAILURE;
++    }
+ #ifndef NO_RSA
+     else if (ctx->pctx->pkey->type == WC_EVP_PKEY_RSA) {
+         if (sig == NULL) {
+@@ -5007,6 +5025,8 @@ int wolfSSL_EVP_DigestVerifyFinal(WOLFSSL_EVP_MD_CTX *ctx,
+         return WOLFSSL_FAILURE;
+     }
+     else {
++        if (ctx->pctx == NULL || ctx->pctx->pkey == NULL)
++            return WOLFSSL_FAILURE;
+         /* Verify the signature with the digest. */
+         switch (ctx->pctx->pkey->type) {
+     #if !defined(NO_RSA)
+@@ -10232,6 +10252,9 @@ int wolfSSL_EVP_Digest(const unsigned char* in, int inSz, unsigned char* out,
+         return WOLFSSL_FAILURE;
+     }
+ 
++    if (inSz < 0)
++        return WOLFSSL_FAILURE;
++
+     err = wolfSSL_EVP_get_hashinfo(evp, &hashType, &hashSz);
+     if (err != WOLFSSL_SUCCESS)
+         return err;
+@@ -11279,6 +11302,7 @@ int wolfSSL_EVP_MD_type(const WOLFSSL_EVP_MD* type)
+         enum wc_HashType macType;
+ 
+         WOLFSSL_ENTER("wolfSSL_EVP_DigestFinal");
++
+         macType = EvpMd2MacType(wolfSSL_EVP_MD_CTX_md(ctx));
+         switch (macType) {
+             case WC_HASH_TYPE_MD4:
+@@ -11304,16 +11328,18 @@ int wolfSSL_EVP_MD_type(const WOLFSSL_EVP_MD* type)
+ 
+             case WC_HASH_TYPE_SHAKE128:
+         #if defined(WOLFSSL_SHA3) && defined(WOLFSSL_SHAKE128)
+-                *s = 16; /* if mixing up XOF with plain digest 128 bit is
+-                          * default for SHAKE128 */
++                if (s != NULL)
++                    *s = 16; /* if mixing up XOF with plain digest 128 bit is
++                              * default for SHAKE128 */
+         #else
+                 return WOLFSSL_FAILURE;
+         #endif
+                 break;
+             case WC_HASH_TYPE_SHAKE256:
+         #if defined(WOLFSSL_SHA3) && defined(WOLFSSL_SHAKE256)
+-                *s = 32; /* if mixing up XOF with plain digest 256 bit is
+-                          * default for SHAKE256 */
++                if (s != NULL)
++                    *s = 32; /* if mixing up XOF with plain digest 256 bit is
++                              * default for SHAKE256 */
+         #else
+                 return WOLFSSL_FAILURE;
+         #endif
+@@ -12881,6 +12907,9 @@ int wolfSSL_EVP_EncodeBlock(unsigned char *out, const unsigned char *in,
+     if (out == NULL || in == NULL)
+         return WOLFSSL_FATAL_ERROR;
+ 
++    if (inLen < 0)
++        return WOLFSSL_FATAL_ERROR;
++
+     if (Base64_Encode_NoNl(in, (word32)inLen, out, &ret) == 0)
+         return (int)ret;
+     else
+@@ -12897,6 +12926,9 @@ int wolfSSL_EVP_DecodeBlock(unsigned char *out, const unsigned char *in,
+     if (out == NULL || in == NULL)
+         return WOLFSSL_FATAL_ERROR;
+ 
++    if (inLen < 0)
++        return WOLFSSL_FATAL_ERROR;
++
+     if (Base64_Decode(in, (word32)inLen, out, &ret) == 0)
+         return (int)ret;
+     else
+diff --git a/wolfcrypt/src/pwdbased.c b/wolfcrypt/src/pwdbased.c
+index c2ed5c042..4b9502a8c 100644
+--- a/wolfcrypt/src/pwdbased.c
++++ b/wolfcrypt/src/pwdbased.c
+@@ -76,6 +76,9 @@ int wc_PBKDF1_ex(byte* key, int keyLen, byte* iv, int ivLen,
+         return BAD_FUNC_ARG;
+     }
+ 
++    if (keyLen > INT_MAX - ivLen)
++        return BAD_FUNC_ARG;
++
+     if (iterations <= 0)
+         iterations = 1;
+ 
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10098-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10098-2.patch
new file mode 100644
index 0000000000..0c28dbbba0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10098-2.patch
@@ -0,0 +1,126 @@
+From 1260ee5fe45c6e4c0aeb62c26a04db5faec6ff08 Mon Sep 17 00:00:00 2001
+From: Reda Chouk <reda@wolfssl.com>
+Date: Fri, 29 May 2026 05:10:21 -0700
+Subject: [PATCH] Require equal serial lengths before comparing serial bytes so
+ a response serial that is only a prefix of the requested serial is not
+ treated as a match
+
+(cherry picked from commit 53e1db478b62f40ad6ce9b1a1d65d593a9d3d9fb)
+
+CVE: CVE-2026-10098
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/53e1db478b62f40ad6ce9b1a1d65d593a9d3d9fb]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ocsp.c            |  3 ++-
+ tests/api.c           |  1 +
+ tests/api/test_ocsp.c | 57 +++++++++++++++++++++++++++++++++++++++++++
+ tests/api/test_ocsp.h |  1 +
+ 4 files changed, 61 insertions(+), 1 deletion(-)
+
+diff --git a/src/ocsp.c b/src/ocsp.c
+index 9de23cb9e..b8352ee72 100644
+--- a/src/ocsp.c
++++ b/src/ocsp.c
+@@ -750,7 +750,8 @@ int wolfSSL_OCSP_resp_find_status(WOLFSSL_OCSP_BASICRESP *bs,
+     single = bs->single;
+     while (single != NULL) {
+         if (single->status != NULL && id->status != NULL &&
+-            (XMEMCMP(single->status->serial, id->status->serial,
++            (single->status->serialSz == id->status->serialSz)
++         && (XMEMCMP(single->status->serial, id->status->serial,
+                      (size_t)single->status->serialSz) == 0)
+          && (XMEMCMP(single->issuerHash, id->issuerHash, OCSP_DIGEST_SIZE) == 0)
+          && (XMEMCMP(single->issuerKeyHash, id->issuerKeyHash, OCSP_DIGEST_SIZE) == 0)) {
+diff --git a/tests/api.c b/tests/api.c
+index 919b951b3..ad5f84573 100644
+--- a/tests/api.c
++++ b/tests/api.c
+@@ -35924,6 +35924,7 @@ TEST_CASE testCases[] = {
+     TEST_DECL(test_ocsp_response_parsing),
+     TEST_DECL(test_ocsp_certid_enc_dec),
+     TEST_DECL(test_ocsp_certid_dup),
++    TEST_DECL(test_ocsp_resp_find_status_serial_prefix),
+     TEST_DECL(test_ocsp_tls_cert_cb),
+     TEST_DECL(test_ocsp_cert_unknown_crl_fallback),
+     TEST_DECL(test_ocsp_cert_unknown_crl_fallback_nonleaf),
+diff --git a/tests/api/test_ocsp.c b/tests/api/test_ocsp.c
+index 02938adfd..1f1055fc6 100644
+--- a/tests/api/test_ocsp.c
++++ b/tests/api/test_ocsp.c
+@@ -723,6 +723,63 @@ int test_ocsp_certid_dup(void)
+ }
+ #endif
+ 
++int test_ocsp_resp_find_status_serial_prefix(void)
++{
++    EXPECT_DECLS;
++#if defined(HAVE_OCSP) && defined(OPENSSL_EXTRA) && !defined(NO_SHA)
++    OcspResponse response;
++    OcspEntry    single;
++    CertStatus   responseStatus;
++    OcspEntry    requestedId;
++    CertStatus   requestedStatus;
++    int          status;
++
++    XMEMSET(&response, 0, sizeof(response));
++    XMEMSET(&single, 0, sizeof(single));
++    XMEMSET(&responseStatus, 0, sizeof(responseStatus));
++    XMEMSET(&requestedId, 0, sizeof(requestedId));
++    XMEMSET(&requestedStatus, 0, sizeof(requestedStatus));
++
++    single.status   = &responseStatus;
++    requestedId.status = &requestedStatus;
++    response.single  = &single;
++
++    /* Matching issuer name and key hashes on both sides. */
++    XMEMSET(single.issuerHash, 0x41, OCSP_DIGEST_SIZE);
++    XMEMSET(single.issuerKeyHash, 0x42, OCSP_DIGEST_SIZE);
++    XMEMCPY(requestedId.issuerHash, single.issuerHash, OCSP_DIGEST_SIZE);
++    XMEMCPY(requestedId.issuerKeyHash, single.issuerKeyHash, OCSP_DIGEST_SIZE);
++
++    /* Response carries a CERT_GOOD status for serial 01:02 (2 bytes). */
++    responseStatus.serial[0] = 0x01;
++    responseStatus.serial[1] = 0x02;
++    responseStatus.serialSz  = 2;
++    responseStatus.status    = CERT_GOOD;
++
++    /* Sanity check: an exact serial match must be found and report CERT_GOOD. */
++    requestedStatus.serial[0] = 0x01;
++    requestedStatus.serial[1] = 0x02;
++    requestedStatus.serialSz  = 2;
++    status = -1;
++    ExpectIntEQ(wolfSSL_OCSP_resp_find_status(&response, &requestedId, &status,
++                    NULL, NULL, NULL, NULL), WOLFSSL_SUCCESS);
++    ExpectIntEQ(status, CERT_GOOD);
++
++    /* Request serial 01:02:03 (3 bytes) shares the 01:02 prefix of the
++     * response serial.
++     * The lookup must not bind the good response to this longer and
++     * differing serial. */
++    requestedStatus.serial[0] = 0x01;
++    requestedStatus.serial[1] = 0x02;
++    requestedStatus.serial[2] = 0x03;
++    requestedStatus.serialSz  = 3;
++    status = -1;
++    ExpectIntEQ(wolfSSL_OCSP_resp_find_status(&response, &requestedId, &status,
++                    NULL, NULL, NULL, NULL), WOLFSSL_FAILURE);
++#endif
++    return EXPECT_RESULT();
++}
++
+ #if defined(HAVE_OCSP) && defined(WOLFSSL_CERT_SETUP_CB) && \
+     defined(HAVE_SSL_MEMIO_TESTS_DEPENDENCIES) && !defined(NO_RSA) && \
+     (defined(HAVE_CERTIFICATE_STATUS_REQUEST) || \
+diff --git a/tests/api/test_ocsp.h b/tests/api/test_ocsp.h
+index 6df114b87..2ad56ce55 100644
+--- a/tests/api/test_ocsp.h
++++ b/tests/api/test_ocsp.h
+@@ -24,6 +24,7 @@
+ 
+ int test_ocsp_certid_enc_dec(void);
+ int test_ocsp_certid_dup(void);
++int test_ocsp_resp_find_status_serial_prefix(void);
+ int test_ocsp_status_callback(void);
+ int test_ocsp_basic_verify(void);
+ int test_ocsp_response_parsing(void);
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
index 295029246c..094bf8d78b 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
@@ -15,6 +15,8 @@ RPROVIDES:${PN} = "cyassl"
 SRC_URI = " \
     git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master;tag=v${PV}-stable \
     file://run-ptest \
+    file://CVE-2026-10098-1.patch \
+    file://CVE-2026-10098-2.patch \
 "
 
 SRCREV = "1d363f3adceba9d1478230ede476a37b0dcdef24"

