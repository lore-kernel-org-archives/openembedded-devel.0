Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B75C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 10:53:47 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.9164.1639652026738029296
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 02:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hfi8k3l2;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id 8so23319285pfo.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 02:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=EPm7J0uLvbj+1JFxegob2IudO0IaEk2cw/93OXJaXjg=;
        b=hfi8k3l20FB2GmDrOS5RZCrNNxBWAeCW8Z2d+P3M5UaiKre4jMLIlyjxFAz666uLE5
         3Y3B4kNOPBeHezeWHbuwcq2jfiM+b1kWMXFa80dq2ig0hDjvABYyqJqqFRgady0I/bTZ
         G+U1Ybbiy39cSxZ6EGalDTNaT821VI7532AHdVuHw3SW9G4J+39b//OzJEM30tuurGDP
         4vwmCZwZPiA3UCNt7ONsvbQ7+kc23NHjcaX/zEQZTSRd+W4fPMbMJVlR1Tl6kqVWcqpX
         CHLMwXSANgsfZJ2OguarjqDVzdNiktAsNvPBH1O93qCdb75wAyyhMqfIo1UY3mSpGy6F
         HmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EPm7J0uLvbj+1JFxegob2IudO0IaEk2cw/93OXJaXjg=;
        b=SWxdPENzFCSbY5UuLm7PQu0OxZVmFbi9ZPJPZqI3DaoJnKLSl7ZRBc+qTkVofZmGZN
         wCvohh0op8f4g/fAese6386ZNX9xjRwmwhSz5YRD5AaoTGi+U5+3zwljhPk0BB+b1+ns
         3Srva1IfSeVyXtlKBjL3BTrqmCrCMv1key3Xq8cetx9pdcQU0grliPOs1EO4YHPC44wC
         8PKMrcd9D52RzgtO6YbDXw+0Bc6n0rhD2m/7IVghoJFIBVrj7QjO7K/iSxuzg8AfrS9T
         lxSi1/V+ZZIV0hqFykHWLpoAUAJoF2lrRLTWcMDIZ2XM/F+ww0IW9Y4J39pAuqZHL3Fn
         v8XA==
X-Gm-Message-State: AOAM530BIqwcoEqBEAidvfPqmOhAzPBLdtCDcbVFNFX8wE2/sZ0C6CkF
	TgF/OYeqAmqsYgIiXpb6XVbFgycD1LsvpA==
X-Google-Smtp-Source: 
 ABdhPJx2END8BTlf816G9WFafwCJvGeDSJpkOv7zPrtuQOgHUzS/L9RDMf4JO+QQmtsxU8xBqsur5Q==
X-Received: by 2002:a63:5624:: with SMTP id
 k36mr11661881pgb.503.1639652025814;
        Thu, 16 Dec 2021 02:53:45 -0800 (PST)
Received: from localhost.localdomain
 ([2401:4900:502b:4528:91e:3aef:bc51:b045])
        by smtp.gmail.com with ESMTPSA id
 i1sm5068335pgs.50.2021.12.16.02.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 02:53:45 -0800 (PST)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [oe][meta-oe][dunfell][PATCH] nss: Fix CVE-2021-43527
Date: Thu, 16 Dec 2021 16:23:03 +0530
Message-Id: <20211216105303.14467-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 10:53:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94384

Add patch to fix CVE-2021-43527 which causes heap overflow in nss.

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 .../nss/nss/CVE-2021-43527.patch              | 283 ++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |   1 +
 2 files changed, 284 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2021-43527.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2021-43527.patch b/meta-oe/recipes-support/nss/nss/CVE-2021-43527.patch
new file mode 100644
index 000000000..cf3ea63ca
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2021-43527.patch
@@ -0,0 +1,283 @@
+Description: fix heap overflow when verifying DSA/RSA-PSS DER-encoded signatures
+Origin: Provided by Mozilla
+
+CVE: CVE-2021-43527
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/n/nss/nss_3.35-2ubuntu2.13.debian.tar.xz]
+Comment: Refreshed hunk 1 and 6 due to fuzz
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+--- a/nss/lib/cryptohi/secvfy.c
++++ b/nss/lib/cryptohi/secvfy.c
+@@ -164,6 +164,37 @@
+         PR_FALSE /*XXX: unsafeAllowMissingParameters*/);
+ }
+ 
++static unsigned int
++checkedSignatureLen(const SECKEYPublicKey *pubk)
++{
++    unsigned int sigLen = SECKEY_SignatureLen(pubk);
++    if (sigLen == 0) {
++        /* Error set by SECKEY_SignatureLen */
++        return sigLen;
++    }
++    unsigned int maxSigLen;
++    switch (pubk->keyType) {
++        case rsaKey:
++        case rsaPssKey:
++            maxSigLen = (RSA_MAX_MODULUS_BITS + 7) / 8;
++            break;
++        case dsaKey:
++            maxSigLen = DSA_MAX_SIGNATURE_LEN;
++            break;
++        case ecKey:
++            maxSigLen = 2 * MAX_ECKEY_LEN;
++            break;
++        default:
++            PORT_SetError(SEC_ERROR_UNSUPPORTED_KEYALG);
++            return 0;
++    }
++    if (sigLen > maxSigLen) {
++        PORT_SetError(SEC_ERROR_INVALID_KEY);
++        return 0;
++    }
++    return sigLen;
++}
++
+ /*
+  * decode the ECDSA or DSA signature from it's DER wrapping.
+  * The unwrapped/raw signature is placed in the buffer pointed
+@@ -174,38 +205,38 @@ decodeECorDSASignature(SECOidTag algid,
+                        unsigned int len)
+ {
+     SECItem *dsasig = NULL; /* also used for ECDSA */
+-    SECStatus rv = SECSuccess;
+ 
+-    if ((algid != SEC_OID_ANSIX9_DSA_SIGNATURE) &&
+-        (algid != SEC_OID_ANSIX962_EC_PUBLIC_KEY)) {
+-        if (sig->len != len) {
+-            PORT_SetError(SEC_ERROR_BAD_DER);
+-            return SECFailure;
++    /* Safety: Ensure algId is as expected and that signature size is within maxmimums */
++    if (algid == SEC_OID_ANSIX9_DSA_SIGNATURE) {
++        if (len > DSA_MAX_SIGNATURE_LEN) {
++            goto loser;
+         }
+-
+-        PORT_Memcpy(dsig, sig->data, sig->len);
+-        return SECSuccess;
+-    }
+-
+-    if (algid == SEC_OID_ANSIX962_EC_PUBLIC_KEY) {
++    } else if (algid == SEC_OID_ANSIX962_EC_PUBLIC_KEY) {
+         if (len > MAX_ECKEY_LEN * 2) {
+-            PORT_SetError(SEC_ERROR_BAD_DER);
+-            return SECFailure;
++            goto loser;
+         }
+-    }
+-    dsasig = DSAU_DecodeDerSigToLen((SECItem *)sig, len);
+-
+-    if ((dsasig == NULL) || (dsasig->len != len)) {
+-        rv = SECFailure;
+     } else {
+-        PORT_Memcpy(dsig, dsasig->data, dsasig->len);
++        goto loser;
+     }
+ 
+-    if (dsasig != NULL)
++    /* Decode and pad to length */
++    dsasig = DSAU_DecodeDerSigToLen((SECItem *)sig, len);
++    if (dsasig == NULL) {
++        goto loser;
++    }
++    if (dsasig->len != len) {
+         SECITEM_FreeItem(dsasig, PR_TRUE);
+-    if (rv == SECFailure)
+-        PORT_SetError(SEC_ERROR_BAD_DER);
+-    return rv;
++        goto loser;
++    }
++
++    PORT_Memcpy(dsig, dsasig->data, len);
++    SECITEM_FreeItem(dsasig, PR_TRUE);
++
++    return SECSuccess;
++
++loser:
++    PORT_SetError(SEC_ERROR_BAD_DER);
++    return SECFailure;
+ }
+ 
+ const SEC_ASN1Template hashParameterTemplate[] =
+@@ -231,7 +262,7 @@ SECStatus
+ sec_DecodeSigAlg(const SECKEYPublicKey *key, SECOidTag sigAlg,
+                  const SECItem *param, SECOidTag *encalg, SECOidTag *hashalg)
+ {
+-    int len;
++    unsigned int len;
+     PLArenaPool *arena;
+     SECStatus rv;
+     SECItem oid;
+@@ -458,48 +489,52 @@ vfy_CreateContext(const SECKEYPublicKey
+     cx->pkcs1RSADigestInfo = NULL;
+     rv = SECSuccess;
+     if (sig) {
+-        switch (type) {
+-            case rsaKey:
+-                rv = recoverPKCS1DigestInfo(hashAlg, &cx->hashAlg,
+-                                            &cx->pkcs1RSADigestInfo,
+-                                            &cx->pkcs1RSADigestInfoLen,
+-                                            cx->key,
+-                                            sig, wincx);
+-                break;
+-            case rsaPssKey:
+-                sigLen = SECKEY_SignatureLen(key);
+-                if (sigLen == 0) {
+-                    /* error set by SECKEY_SignatureLen */
+-                    rv = SECFailure;
++        rv = SECFailure;
++        if (type == rsaKey) {
++            rv = recoverPKCS1DigestInfo(hashAlg, &cx->hashAlg,
++                                        &cx->pkcs1RSADigestInfo,
++                                        &cx->pkcs1RSADigestInfoLen,
++                                        cx->key,
++                                        sig, wincx);
++        } else {
++            sigLen = checkedSignatureLen(key);
++            /* Check signature length is within limits */
++            if (sigLen == 0) {
++                /* error set by checkedSignatureLen */
++                rv = SECFailure;
++                goto loser;
++            }
++            if (sigLen > sizeof(cx->u)) {
++                PORT_SetError(SEC_ERROR_BAD_SIGNATURE);
++                rv = SECFailure;
++                goto loser;
++            }
++            switch (type) {
++                case rsaPssKey:
++                    if (sig->len != sigLen) {
++                        PORT_SetError(SEC_ERROR_BAD_SIGNATURE);
++                        rv = SECFailure;
++                        goto loser;
++                    }
++                    PORT_Memcpy(cx->u.buffer, sig->data, sigLen);
++                    rv = SECSuccess;
+                     break;
+-                }
+-                if (sig->len != sigLen) {
+-                    PORT_SetError(SEC_ERROR_BAD_SIGNATURE);
+-                    rv = SECFailure;
++                case ecKey:
++                case dsaKey:
++                    /* decodeECorDSASignature will check sigLen == sig->len after padding */
++                    rv = decodeECorDSASignature(encAlg, sig, cx->u.buffer, sigLen);
+                     break;
+-                }
+-                PORT_Memcpy(cx->u.buffer, sig->data, sigLen);
+-                break;
+-            case dsaKey:
+-            case ecKey:
+-                sigLen = SECKEY_SignatureLen(key);
+-                if (sigLen == 0) {
+-                    /* error set by SECKEY_SignatureLen */
++                default:
++                    /* Unreachable */
+                     rv = SECFailure;
+-                    break;
+-                }
+-                rv = decodeECorDSASignature(encAlg, sig, cx->u.buffer, sigLen);
+-                break;
+-            default:
+-                rv = SECFailure;
+-                PORT_SetError(SEC_ERROR_UNSUPPORTED_KEYALG);
+-                break;
++                    goto loser;
++            }
++        }
++        if (rv != SECSuccess) {
++            goto loser;
+         }
+     }
+ 
+-    if (rv)
+-        goto loser;
+-
+     /* check hash alg again, RSA may have changed it.*/
+     if (HASH_GetHashTypeByOidTag(cx->hashAlg) == HASH_AlgNULL) {
+         /* error set by HASH_GetHashTypeByOidTag */
+@@ -634,11 +669,16 @@ VFY_EndWithSignature(VFYContext *cx, SEC
+     switch (cx->key->keyType) {
+         case ecKey:
+         case dsaKey:
+-            dsasig.data = cx->u.buffer;
+-            dsasig.len = SECKEY_SignatureLen(cx->key);
++            dsasig.len = checkedSignatureLen(cx->key);
+             if (dsasig.len == 0) {
+                 return SECFailure;
+             }
++            if (dsasig.len > sizeof(cx->u)) {
++                PORT_SetError(SEC_ERROR_BAD_SIGNATURE);
++                return SECFailure;
++            }
++            dsasig.data = cx->u.buffer;
++
+             if (sig) {
+                 rv = decodeECorDSASignature(cx->encAlg, sig, dsasig.data,
+                                             dsasig.len);
+@@ -667,8 +698,13 @@
+                 }
+ 
+                 rsasig.data = cx->u.buffer;
+-                rsasig.len = SECKEY_SignatureLen(cx->key);
++                rsasig.len = checkedSignatureLen(cx->key);		
+                 if (rsasig.len == 0) {
++                    /* Error set by checkedSignatureLen */
++                    return SECFailure;
++                }
++                if (rsasig.len > sizeof(cx->u)) {
++                    PORT_SetError(SEC_ERROR_BAD_SIGNATURE);			
+                     return SECFailure;
+                 }
+                 if (sig) {
+@@ -743,7 +788,6 @@ vfy_VerifyDigest(const SECItem *digest,
+     SECStatus rv;
+     VFYContext *cx;
+     SECItem dsasig; /* also used for ECDSA */
+-
+     rv = SECFailure;
+ 
+     cx = vfy_CreateContext(key, sig, encAlg, hashAlg, NULL, wincx);
+@@ -751,19 +795,25 @@ vfy_VerifyDigest(const SECItem *digest,
+         switch (key->keyType) {
+             case rsaKey:
+                 rv = verifyPKCS1DigestInfo(cx, digest);
++                /* Error (if any) set by verifyPKCS1DigestInfo */
+                 break;
+-            case dsaKey:
+             case ecKey:
++            case dsaKey:
+                 dsasig.data = cx->u.buffer;
+-                dsasig.len = SECKEY_SignatureLen(cx->key);
++                dsasig.len = checkedSignatureLen(cx->key);
+                 if (dsasig.len == 0) {
++                    /* Error set by checkedSignatureLen */
++                    rv = SECFailure;
+                     break;
+                 }
+-                if (PK11_Verify(cx->key, &dsasig, (SECItem *)digest, cx->wincx) !=
+-                    SECSuccess) {
++                if (dsasig.len > sizeof(cx->u)) {
++                    PORT_SetError(SEC_ERROR_BAD_SIGNATURE);
++                    rv = SECFailure;
++                    break;
++                }
++                rv = PK11_Verify(cx->key, &dsasig, (SECItem *)digest, cx->wincx);
++                if (rv != SECSuccess) {
+                     PORT_SetError(SEC_ERROR_BAD_SIGNATURE);
+-                } else {
+-                    rv = SECSuccess;
+                 }
+                 break;
+             default:
diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
index 14f670c32..f03473b1a 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -39,6 +39,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://CVE-2020-6829_12400.patch \
            file://CVE-2020-12403_1.patch \
            file://CVE-2020-12403_2.patch \
+           file://CVE-2021-43527.patch \
            "
 
 SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
-- 
2.17.1


