Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F34C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 23:13:48 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.1729.1639696427873529185
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 15:13:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 192.103.53.11,
 mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BGNDkwt017504
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 15:13:46 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Dec 2021 15:13:45 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 16 Dec 2021 15:13:45 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][hardknott][PATCH] nss: fix CVE-2021-43527
Date: Thu, 16 Dec 2021 18:13:45 -0500
Message-ID: <20211216231345.12542-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 23:13:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94411

Backport patch to fix CVE-2021-43527.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...re-DER-encoded-signatures-are-within.patch | 297 ++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.64.bb       |   1 +
 2 files changed, 298 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/0001-Bug-1737470-Ensure-DER-encoded-signatures-are-within.patch

diff --git a/meta-oe/recipes-support/nss/nss/0001-Bug-1737470-Ensure-DER-encoded-signatures-are-within.patch b/meta-oe/recipes-support/nss/nss/0001-Bug-1737470-Ensure-DER-encoded-signatures-are-within.patch
new file mode 100644
index 000000000..dff07de92
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/0001-Bug-1737470-Ensure-DER-encoded-signatures-are-within.patch
@@ -0,0 +1,297 @@
+From 7c6fb56c3bcafa96c0bc87350f0f9e85f002a254 Mon Sep 17 00:00:00 2001
+From: Dennis Jackson <djackson@mozilla.com>
+Date: Mon, 22 Nov 2021 10:40:42 +0000
+Subject: [PATCH] Bug 1737470 - Ensure DER encoded signatures are within size
+ limits. r=jschanck,mt,bbeurdouche,rrelyea
+
+Differential Revision: https://phabricator.services.mozilla.com/D129514
+
+--HG--
+branch : NSS_3_68_1_BRANCH
+
+Upstream-Status: Backport [7c6fb56c3bcafa96c0bc87350f0f9e85f002a254]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ lib/cryptohi/secvfy.c | 192 ++++++++++++++++++++++++++----------------
+ 1 file changed, 121 insertions(+), 71 deletions(-)
+
+diff --git a/nss/lib/cryptohi/secvfy.c b/nss/lib/cryptohi/secvfy.c
+index 2540a544c..17545848c 100644
+--- a/nss/lib/cryptohi/secvfy.c
++++ b/nss/lib/cryptohi/secvfy.c
+@@ -164,6 +164,37 @@ verifyPKCS1DigestInfo(const VFYContext *cx, const SECItem *digest)
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
+@@ -174,38 +205,38 @@ decodeECorDSASignature(SECOidTag algid, const SECItem *sig, unsigned char *dsig,
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
+@@ -281,7 +312,7 @@ SECStatus
+ sec_DecodeSigAlg(const SECKEYPublicKey *key, SECOidTag sigAlg,
+                  const SECItem *param, SECOidTag *encalgp, SECOidTag *hashalg)
+ {
+-    int len;
++    unsigned int len;
+     PLArenaPool *arena;
+     SECStatus rv;
+     SECItem oid;
+@@ -466,48 +497,52 @@ vfy_CreateContext(const SECKEYPublicKey *key, const SECItem *sig,
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
+@@ -650,11 +685,16 @@ VFY_EndWithSignature(VFYContext *cx, SECItem *sig)
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
+@@ -686,8 +726,13 @@ VFY_EndWithSignature(VFYContext *cx, SECItem *sig)
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
+@@ -749,7 +794,6 @@ vfy_VerifyDigest(const SECItem *digest, const SECKEYPublicKey *key,
+     SECStatus rv;
+     VFYContext *cx;
+     SECItem dsasig; /* also used for ECDSA */
+-
+     rv = SECFailure;
+ 
+     cx = vfy_CreateContext(key, sig, encAlg, hashAlg, NULL, wincx);
+@@ -757,19 +801,25 @@ vfy_VerifyDigest(const SECItem *digest, const SECKEYPublicKey *key,
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
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nss/nss_3.64.bb b/meta-oe/recipes-support/nss/nss_3.64.bb
index 97193aff5..ccb5201d4 100644
--- a/meta-oe/recipes-support/nss/nss_3.64.bb
+++ b/meta-oe/recipes-support/nss/nss_3.64.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://system-pkcs11.txt \
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
+           file://0001-Bug-1737470-Ensure-DER-encoded-signatures-are-within.patch \
            "
 SRC_URI[sha256sum] = "d3175427172e9c3a6f1ebc74452cb791590f28191c6a1a443dbc0d87c9df1126"
 
-- 
2.33.0


