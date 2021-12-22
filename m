Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6809EC433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 04:58:24 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.15707.1640149103492543678
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 20:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q+Cen9jE;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id j21so3625817edt.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 20:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=yLID8TCxRgfv/vtT1txgiu094mxoifgFscXT4CsOaDk=;
        b=Q+Cen9jEN6/tLFeKRdFfrHG0ya9yDzlmytMeeacqxQQe4k5/71lMqL4EyjveT7po0Y
         Di+Y768OpMEQ2KQmX+YaSioMOZ8N8iAh4o4P81Dk34JgL5rdjF9v9JsT/MwulQvgui1V
         Md3Hi9dB/6bYfD+e5upXnlHz9gdr8TMX5i7nJXS6fZst3LJUbOvYeTWgny/Ewy5Q7pdK
         qSzn/REw986ixGksvrRFiR4Wj+iQ3QZXHdGWTvHLFo2GQ5Eu5wRxKDQW4GTucjOWHUnG
         MiU0XCwqupmfEp8Sea7ozQ9+2JAoJ52dgz837ncL4r5sAb8nDIAhBayVBU6IzTgsRAAR
         WV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=yLID8TCxRgfv/vtT1txgiu094mxoifgFscXT4CsOaDk=;
        b=PW7Lkdb3Bf+JRS7zPqzq/BMIS/10eZU+aZZNhQcSVbnpYGwpG0/AWdZxviPCYatsZf
         Jx1mvCLb+BWpS0eu27BFX6koDBkKsxKcJVbBEjT1JJwYdDYiPEPtsMehhx5LuykcEKtG
         e9Sn45DAN8eakj6VtPnrFA1wzxhvEZaxpuzmGpo78hw2IYEzsk+xFqE5B2DAVRVGGhfo
         QaMnyHlLHP9EWBvSBBEuHxspeHyreosNbIkCeNgt215ayvh/mHS4mARMwI8i/76MX7vb
         ghbCS08Ze4yTx0WXQS2kezJKXC/VKt8mun1e8XB4wyCIAd5aP0kGIydXBRRBvVByQxxG
         GcBA==
X-Gm-Message-State: AOAM5332jbjTv0Os6gNxkaxKQNz9VGgPTe0uKNOCo8mVz1q29mUYBl6H
	czaSUsk/9k5vfmLktvonP5Eaort4xsdIMYsjkMlQ9CykMlEgVA==
X-Google-Smtp-Source: 
 ABdhPJy7ZH23fTA9iNhBqDjI2ZWtQt9z8vJRbPn5KxKEEHevXslxh+pMtLdbOLZzew/qo7aQjVS+OSQsWA+kCqFRbzc=
X-Received: by 2002:a50:d492:: with SMTP id s18mr1306542edi.145.1640149101460;
 Tue, 21 Dec 2021 20:58:21 -0800 (PST)
MIME-Version: 1.0
References: <20211216105303.14467-1-sanakazisk19@gmail.com>
In-Reply-To: <20211216105303.14467-1-sanakazisk19@gmail.com>
From: sana kazi <sanakazisk19@gmail.com>
Date: Wed, 22 Dec 2021 10:28:09 +0530
Message-ID: 
 <CAPxU0mtBs7jxmQZh=uiD-mreuSSf+xOEcEg50b4et0Rhksz8DQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][dunfell][PATCH] nss: Fix CVE-2021-43527
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000092434e05d3b4f8c9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Dec 2021 04:58:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94477

--00000000000092434e05d3b4f8c9
Content-Type: text/plain; charset="UTF-8"

Hi,

Could you please review the below patch?

Regards,
Sana Kazi

On Thu, 16 Dec 2021 at 16:23, Sana Kazi <sanakazisk19@gmail.com> wrote:

> Add patch to fix CVE-2021-43527 which causes heap overflow in nss.
>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> ---
>  .../nss/nss/CVE-2021-43527.patch              | 283 ++++++++++++++++++
>  meta-oe/recipes-support/nss/nss_3.51.1.bb     |   1 +
>  2 files changed, 284 insertions(+)
>  create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2021-43527.patch
>
> diff --git a/meta-oe/recipes-support/nss/nss/CVE-2021-43527.patch
> b/meta-oe/recipes-support/nss/nss/CVE-2021-43527.patch
> new file mode 100644
> index 000000000..cf3ea63ca
> --- /dev/null
> +++ b/meta-oe/recipes-support/nss/nss/CVE-2021-43527.patch
> @@ -0,0 +1,283 @@
> +Description: fix heap overflow when verifying DSA/RSA-PSS DER-encoded
> signatures
> +Origin: Provided by Mozilla
> +
> +CVE: CVE-2021-43527
> +Upstream-Status: Backport [
> http://archive.ubuntu.com/ubuntu/pool/main/n/nss/nss_3.35-2ubuntu2.13.debian.tar.xz
> ]
> +Comment: Refreshed hunk 1 and 6 due to fuzz
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +--- a/nss/lib/cryptohi/secvfy.c
> ++++ b/nss/lib/cryptohi/secvfy.c
> +@@ -164,6 +164,37 @@
> +         PR_FALSE /*XXX: unsafeAllowMissingParameters*/);
> + }
> +
> ++static unsigned int
> ++checkedSignatureLen(const SECKEYPublicKey *pubk)
> ++{
> ++    unsigned int sigLen = SECKEY_SignatureLen(pubk);
> ++    if (sigLen == 0) {
> ++        /* Error set by SECKEY_SignatureLen */
> ++        return sigLen;
> ++    }
> ++    unsigned int maxSigLen;
> ++    switch (pubk->keyType) {
> ++        case rsaKey:
> ++        case rsaPssKey:
> ++            maxSigLen = (RSA_MAX_MODULUS_BITS + 7) / 8;
> ++            break;
> ++        case dsaKey:
> ++            maxSigLen = DSA_MAX_SIGNATURE_LEN;
> ++            break;
> ++        case ecKey:
> ++            maxSigLen = 2 * MAX_ECKEY_LEN;
> ++            break;
> ++        default:
> ++            PORT_SetError(SEC_ERROR_UNSUPPORTED_KEYALG);
> ++            return 0;
> ++    }
> ++    if (sigLen > maxSigLen) {
> ++        PORT_SetError(SEC_ERROR_INVALID_KEY);
> ++        return 0;
> ++    }
> ++    return sigLen;
> ++}
> ++
> + /*
> +  * decode the ECDSA or DSA signature from it's DER wrapping.
> +  * The unwrapped/raw signature is placed in the buffer pointed
> +@@ -174,38 +205,38 @@ decodeECorDSASignature(SECOidTag algid,
> +                        unsigned int len)
> + {
> +     SECItem *dsasig = NULL; /* also used for ECDSA */
> +-    SECStatus rv = SECSuccess;
> +
> +-    if ((algid != SEC_OID_ANSIX9_DSA_SIGNATURE) &&
> +-        (algid != SEC_OID_ANSIX962_EC_PUBLIC_KEY)) {
> +-        if (sig->len != len) {
> +-            PORT_SetError(SEC_ERROR_BAD_DER);
> +-            return SECFailure;
> ++    /* Safety: Ensure algId is as expected and that signature size is
> within maxmimums */
> ++    if (algid == SEC_OID_ANSIX9_DSA_SIGNATURE) {
> ++        if (len > DSA_MAX_SIGNATURE_LEN) {
> ++            goto loser;
> +         }
> +-
> +-        PORT_Memcpy(dsig, sig->data, sig->len);
> +-        return SECSuccess;
> +-    }
> +-
> +-    if (algid == SEC_OID_ANSIX962_EC_PUBLIC_KEY) {
> ++    } else if (algid == SEC_OID_ANSIX962_EC_PUBLIC_KEY) {
> +         if (len > MAX_ECKEY_LEN * 2) {
> +-            PORT_SetError(SEC_ERROR_BAD_DER);
> +-            return SECFailure;
> ++            goto loser;
> +         }
> +-    }
> +-    dsasig = DSAU_DecodeDerSigToLen((SECItem *)sig, len);
> +-
> +-    if ((dsasig == NULL) || (dsasig->len != len)) {
> +-        rv = SECFailure;
> +     } else {
> +-        PORT_Memcpy(dsig, dsasig->data, dsasig->len);
> ++        goto loser;
> +     }
> +
> +-    if (dsasig != NULL)
> ++    /* Decode and pad to length */
> ++    dsasig = DSAU_DecodeDerSigToLen((SECItem *)sig, len);
> ++    if (dsasig == NULL) {
> ++        goto loser;
> ++    }
> ++    if (dsasig->len != len) {
> +         SECITEM_FreeItem(dsasig, PR_TRUE);
> +-    if (rv == SECFailure)
> +-        PORT_SetError(SEC_ERROR_BAD_DER);
> +-    return rv;
> ++        goto loser;
> ++    }
> ++
> ++    PORT_Memcpy(dsig, dsasig->data, len);
> ++    SECITEM_FreeItem(dsasig, PR_TRUE);
> ++
> ++    return SECSuccess;
> ++
> ++loser:
> ++    PORT_SetError(SEC_ERROR_BAD_DER);
> ++    return SECFailure;
> + }
> +
> + const SEC_ASN1Template hashParameterTemplate[] =
> +@@ -231,7 +262,7 @@ SECStatus
> + sec_DecodeSigAlg(const SECKEYPublicKey *key, SECOidTag sigAlg,
> +                  const SECItem *param, SECOidTag *encalg, SECOidTag
> *hashalg)
> + {
> +-    int len;
> ++    unsigned int len;
> +     PLArenaPool *arena;
> +     SECStatus rv;
> +     SECItem oid;
> +@@ -458,48 +489,52 @@ vfy_CreateContext(const SECKEYPublicKey
> +     cx->pkcs1RSADigestInfo = NULL;
> +     rv = SECSuccess;
> +     if (sig) {
> +-        switch (type) {
> +-            case rsaKey:
> +-                rv = recoverPKCS1DigestInfo(hashAlg, &cx->hashAlg,
> +-                                            &cx->pkcs1RSADigestInfo,
> +-                                            &cx->pkcs1RSADigestInfoLen,
> +-                                            cx->key,
> +-                                            sig, wincx);
> +-                break;
> +-            case rsaPssKey:
> +-                sigLen = SECKEY_SignatureLen(key);
> +-                if (sigLen == 0) {
> +-                    /* error set by SECKEY_SignatureLen */
> +-                    rv = SECFailure;
> ++        rv = SECFailure;
> ++        if (type == rsaKey) {
> ++            rv = recoverPKCS1DigestInfo(hashAlg, &cx->hashAlg,
> ++                                        &cx->pkcs1RSADigestInfo,
> ++                                        &cx->pkcs1RSADigestInfoLen,
> ++                                        cx->key,
> ++                                        sig, wincx);
> ++        } else {
> ++            sigLen = checkedSignatureLen(key);
> ++            /* Check signature length is within limits */
> ++            if (sigLen == 0) {
> ++                /* error set by checkedSignatureLen */
> ++                rv = SECFailure;
> ++                goto loser;
> ++            }
> ++            if (sigLen > sizeof(cx->u)) {
> ++                PORT_SetError(SEC_ERROR_BAD_SIGNATURE);
> ++                rv = SECFailure;
> ++                goto loser;
> ++            }
> ++            switch (type) {
> ++                case rsaPssKey:
> ++                    if (sig->len != sigLen) {
> ++                        PORT_SetError(SEC_ERROR_BAD_SIGNATURE);
> ++                        rv = SECFailure;
> ++                        goto loser;
> ++                    }
> ++                    PORT_Memcpy(cx->u.buffer, sig->data, sigLen);
> ++                    rv = SECSuccess;
> +                     break;
> +-                }
> +-                if (sig->len != sigLen) {
> +-                    PORT_SetError(SEC_ERROR_BAD_SIGNATURE);
> +-                    rv = SECFailure;
> ++                case ecKey:
> ++                case dsaKey:
> ++                    /* decodeECorDSASignature will check sigLen ==
> sig->len after padding */
> ++                    rv = decodeECorDSASignature(encAlg, sig,
> cx->u.buffer, sigLen);
> +                     break;
> +-                }
> +-                PORT_Memcpy(cx->u.buffer, sig->data, sigLen);
> +-                break;
> +-            case dsaKey:
> +-            case ecKey:
> +-                sigLen = SECKEY_SignatureLen(key);
> +-                if (sigLen == 0) {
> +-                    /* error set by SECKEY_SignatureLen */
> ++                default:
> ++                    /* Unreachable */
> +                     rv = SECFailure;
> +-                    break;
> +-                }
> +-                rv = decodeECorDSASignature(encAlg, sig, cx->u.buffer,
> sigLen);
> +-                break;
> +-            default:
> +-                rv = SECFailure;
> +-                PORT_SetError(SEC_ERROR_UNSUPPORTED_KEYALG);
> +-                break;
> ++                    goto loser;
> ++            }
> ++        }
> ++        if (rv != SECSuccess) {
> ++            goto loser;
> +         }
> +     }
> +
> +-    if (rv)
> +-        goto loser;
> +-
> +     /* check hash alg again, RSA may have changed it.*/
> +     if (HASH_GetHashTypeByOidTag(cx->hashAlg) == HASH_AlgNULL) {
> +         /* error set by HASH_GetHashTypeByOidTag */
> +@@ -634,11 +669,16 @@ VFY_EndWithSignature(VFYContext *cx, SEC
> +     switch (cx->key->keyType) {
> +         case ecKey:
> +         case dsaKey:
> +-            dsasig.data = cx->u.buffer;
> +-            dsasig.len = SECKEY_SignatureLen(cx->key);
> ++            dsasig.len = checkedSignatureLen(cx->key);
> +             if (dsasig.len == 0) {
> +                 return SECFailure;
> +             }
> ++            if (dsasig.len > sizeof(cx->u)) {
> ++                PORT_SetError(SEC_ERROR_BAD_SIGNATURE);
> ++                return SECFailure;
> ++            }
> ++            dsasig.data = cx->u.buffer;
> ++
> +             if (sig) {
> +                 rv = decodeECorDSASignature(cx->encAlg, sig, dsasig.data,
> +                                             dsasig.len);
> +@@ -667,8 +698,13 @@
> +                 }
> +
> +                 rsasig.data = cx->u.buffer;
> +-                rsasig.len = SECKEY_SignatureLen(cx->key);
> ++                rsasig.len = checkedSignatureLen(cx->key);
> +                 if (rsasig.len == 0) {
> ++                    /* Error set by checkedSignatureLen */
> ++                    return SECFailure;
> ++                }
> ++                if (rsasig.len > sizeof(cx->u)) {
> ++                    PORT_SetError(SEC_ERROR_BAD_SIGNATURE);
>
> +                     return SECFailure;
> +                 }
> +                 if (sig) {
> +@@ -743,7 +788,6 @@ vfy_VerifyDigest(const SECItem *digest,
> +     SECStatus rv;
> +     VFYContext *cx;
> +     SECItem dsasig; /* also used for ECDSA */
> +-
> +     rv = SECFailure;
> +
> +     cx = vfy_CreateContext(key, sig, encAlg, hashAlg, NULL, wincx);
> +@@ -751,19 +795,25 @@ vfy_VerifyDigest(const SECItem *digest,
> +         switch (key->keyType) {
> +             case rsaKey:
> +                 rv = verifyPKCS1DigestInfo(cx, digest);
> ++                /* Error (if any) set by verifyPKCS1DigestInfo */
> +                 break;
> +-            case dsaKey:
> +             case ecKey:
> ++            case dsaKey:
> +                 dsasig.data = cx->u.buffer;
> +-                dsasig.len = SECKEY_SignatureLen(cx->key);
> ++                dsasig.len = checkedSignatureLen(cx->key);
> +                 if (dsasig.len == 0) {
> ++                    /* Error set by checkedSignatureLen */
> ++                    rv = SECFailure;
> +                     break;
> +                 }
> +-                if (PK11_Verify(cx->key, &dsasig, (SECItem *)digest,
> cx->wincx) !=
> +-                    SECSuccess) {
> ++                if (dsasig.len > sizeof(cx->u)) {
> ++                    PORT_SetError(SEC_ERROR_BAD_SIGNATURE);
> ++                    rv = SECFailure;
> ++                    break;
> ++                }
> ++                rv = PK11_Verify(cx->key, &dsasig, (SECItem *)digest,
> cx->wincx);
> ++                if (rv != SECSuccess) {
> +                     PORT_SetError(SEC_ERROR_BAD_SIGNATURE);
> +-                } else {
> +-                    rv = SECSuccess;
> +                 }
> +                 break;
> +             default:
> diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb
> b/meta-oe/recipes-support/nss/nss_3.51.1.bb
> index 14f670c32..f03473b1a 100644
> --- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
> +++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
> @@ -39,6 +39,7 @@ SRC_URI = "
> http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
>             file://CVE-2020-6829_12400.patch \
>             file://CVE-2020-12403_1.patch \
>             file://CVE-2020-12403_2.patch \
> +           file://CVE-2021-43527.patch \
>             "
>
>  SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
> --
> 2.17.1
>
>

--00000000000092434e05d3b4f8c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGksPGRpdj48YnI+PC9kaXY+PGRpdj5Db3Vs
ZCB5b3UgcGxlYXNlIHJldmlldyB0aGUgYmVsb3cgcGF0Y2g/PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5SZWdhcmRzLDwvZGl2PjxkaXY+U2FuYSBLYXppPC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xh
c3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVGh1
LCAxNiBEZWMgMjAyMSBhdCAxNjoyMywgU2FuYSBLYXppICZsdDs8YSBocmVmPSJtYWlsdG86c2Fu
YWthemlzazE5QGdtYWlsLmNvbSI+c2FuYWthemlzazE5QGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3Rl
Ojxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46
MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7
cGFkZGluZy1sZWZ0OjFleCI+QWRkIHBhdGNoIHRvIGZpeCBDVkUtMjAyMS00MzUyNyB3aGljaCBj
YXVzZXMgaGVhcCBvdmVyZmxvdyBpbiBuc3MuPGJyPg0KPGJyPg0KU2lnbmVkLW9mZi1ieTogU2Fu
YSBLYXppICZsdDs8YSBocmVmPSJtYWlsdG86U2FuYS5LYXppQGtwaXQuY29tIiB0YXJnZXQ9Il9i
bGFuayI+U2FuYS5LYXppQGtwaXQuY29tPC9hPiZndDs8YnI+DQpTaWduZWQtb2ZmLWJ5OiBTYW5h
IEthemkgJmx0OzxhIGhyZWY9Im1haWx0bzpzYW5ha2F6aXNrMTlAZ21haWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+c2FuYWthemlzazE5QGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPg0KLS0tPGJyPg0KwqAu
Li4vbnNzL25zcy9DVkUtMjAyMS00MzUyNy5wYXRjaMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgMjgz
ICsrKysrKysrKysrKysrKysrKzxicj4NCsKgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbnNzLzxh
IGhyZWY9Imh0dHA6Ly9uc3NfMy41MS4xLmJiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5uc3NfMy41MS4xLmJiPC9hPsKgIMKgIMKgfMKgIMKgMSArPGJyPg0KwqAyIGZpbGVzIGNo
YW5nZWQsIDI4NCBpbnNlcnRpb25zKCspPGJyPg0KwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1v
ZS9yZWNpcGVzLXN1cHBvcnQvbnNzL25zcy9DVkUtMjAyMS00MzUyNy5wYXRjaDxicj4NCjxicj4N
CmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9uc3MvbnNzL0NWRS0yMDIxLTQz
NTI3LnBhdGNoIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbnNzL25zcy9DVkUtMjAyMS00MzUy
Ny5wYXRjaDxicj4NCm5ldyBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0KaW5kZXggMDAwMDAwMDAwLi5j
ZjNlYTYzY2E8YnI+DQotLS0gL2Rldi9udWxsPGJyPg0KKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1
cHBvcnQvbnNzL25zcy9DVkUtMjAyMS00MzUyNy5wYXRjaDxicj4NCkBAIC0wLDAgKzEsMjgzIEBA
PGJyPg0KK0Rlc2NyaXB0aW9uOiBmaXggaGVhcCBvdmVyZmxvdyB3aGVuIHZlcmlmeWluZyBEU0Ev
UlNBLVBTUyBERVItZW5jb2RlZCBzaWduYXR1cmVzPGJyPg0KK09yaWdpbjogUHJvdmlkZWQgYnkg
TW96aWxsYTxicj4NCis8YnI+DQorQ1ZFOiBDVkUtMjAyMS00MzUyNzxicj4NCitVcHN0cmVhbS1T
dGF0dXM6IEJhY2twb3J0IFs8YSBocmVmPSJodHRwOi8vYXJjaGl2ZS51YnVudHUuY29tL3VidW50
dS9wb29sL21haW4vbi9uc3MvbnNzXzMuMzUtMnVidW50dTIuMTMuZGViaWFuLnRhci54eiIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2FyY2hpdmUudWJ1bnR1LmNvbS91
YnVudHUvcG9vbC9tYWluL24vbnNzL25zc18zLjM1LTJ1YnVudHUyLjEzLmRlYmlhbi50YXIueHo8
L2E+XTxicj4NCitDb21tZW50OiBSZWZyZXNoZWQgaHVuayAxIGFuZCA2IGR1ZSB0byBmdXp6PGJy
Pg0KK1NpZ25lZC1vZmYtYnk6IFNhbmEgS2F6aSAmbHQ7PGEgaHJlZj0ibWFpbHRvOlNhbmEuS2F6
aUBrcGl0LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPlNhbmEuS2F6aUBrcGl0LmNvbTwvYT4mZ3Q7PGJy
Pg0KKzxicj4NCistLS0gYS9uc3MvbGliL2NyeXB0b2hpL3NlY3ZmeS5jPGJyPg0KKysrKyBiL25z
cy9saWIvY3J5cHRvaGkvc2VjdmZ5LmM8YnI+DQorQEAgLTE2NCw2ICsxNjQsMzcgQEA8YnI+DQor
wqAgwqAgwqAgwqAgwqBQUl9GQUxTRSAvKlhYWDogdW5zYWZlQWxsb3dNaXNzaW5nUGFyYW1ldGVy
cyovKTs8YnI+DQorIH08YnI+DQorIDxicj4NCisrc3RhdGljIHVuc2lnbmVkIGludDxicj4NCisr
Y2hlY2tlZFNpZ25hdHVyZUxlbihjb25zdCBTRUNLRVlQdWJsaWNLZXkgKnB1YmspPGJyPg0KKyt7
PGJyPg0KKyvCoCDCoCB1bnNpZ25lZCBpbnQgc2lnTGVuID0gU0VDS0VZX1NpZ25hdHVyZUxlbihw
dWJrKTs8YnI+DQorK8KgIMKgIGlmIChzaWdMZW4gPT0gMCkgezxicj4NCisrwqAgwqAgwqAgwqAg
LyogRXJyb3Igc2V0IGJ5IFNFQ0tFWV9TaWduYXR1cmVMZW4gKi88YnI+DQorK8KgIMKgIMKgIMKg
IHJldHVybiBzaWdMZW47PGJyPg0KKyvCoCDCoCB9PGJyPg0KKyvCoCDCoCB1bnNpZ25lZCBpbnQg
bWF4U2lnTGVuOzxicj4NCisrwqAgwqAgc3dpdGNoIChwdWJrLSZndDtrZXlUeXBlKSB7PGJyPg0K
KyvCoCDCoCDCoCDCoCBjYXNlIHJzYUtleTo8YnI+DQorK8KgIMKgIMKgIMKgIGNhc2UgcnNhUHNz
S2V5Ojxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgbWF4U2lnTGVuID0gKFJTQV9NQVhfTU9EVUxV
U19CSVRTICsgNykgLyA4Ozxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJyPg0KKyvC
oCDCoCDCoCDCoCBjYXNlIGRzYUtleTo8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIG1heFNpZ0xl
biA9IERTQV9NQVhfU0lHTkFUVVJFX0xFTjs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIGJyZWFr
Ozxicj4NCisrwqAgwqAgwqAgwqAgY2FzZSBlY0tleTo8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKg
IG1heFNpZ0xlbiA9IDIgKiBNQVhfRUNLRVlfTEVOOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAg
YnJlYWs7PGJyPg0KKyvCoCDCoCDCoCDCoCBkZWZhdWx0Ojxicj4NCisrwqAgwqAgwqAgwqAgwqAg
wqAgUE9SVF9TZXRFcnJvcihTRUNfRVJST1JfVU5TVVBQT1JURURfS0VZQUxHKTs8YnI+DQorK8Kg
IMKgIMKgIMKgIMKgIMKgIHJldHVybiAwOzxicj4NCisrwqAgwqAgfTxicj4NCisrwqAgwqAgaWYg
KHNpZ0xlbiAmZ3Q7IG1heFNpZ0xlbikgezxicj4NCisrwqAgwqAgwqAgwqAgUE9SVF9TZXRFcnJv
cihTRUNfRVJST1JfSU5WQUxJRF9LRVkpOzxicj4NCisrwqAgwqAgwqAgwqAgcmV0dXJuIDA7PGJy
Pg0KKyvCoCDCoCB9PGJyPg0KKyvCoCDCoCByZXR1cm4gc2lnTGVuOzxicj4NCisrfTxicj4NCisr
PGJyPg0KKyAvKjxicj4NCivCoCAqIGRlY29kZSB0aGUgRUNEU0Egb3IgRFNBIHNpZ25hdHVyZSBm
cm9tIGl0JiMzOTtzIERFUiB3cmFwcGluZy48YnI+DQorwqAgKiBUaGUgdW53cmFwcGVkL3JhdyBz
aWduYXR1cmUgaXMgcGxhY2VkIGluIHRoZSBidWZmZXIgcG9pbnRlZDxicj4NCitAQCAtMTc0LDM4
ICsyMDUsMzggQEAgZGVjb2RlRUNvckRTQVNpZ25hdHVyZShTRUNPaWRUYWcgYWxnaWQsPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHVuc2lnbmVkIGludCBsZW4pPGJy
Pg0KKyB7PGJyPg0KK8KgIMKgIMKgU0VDSXRlbSAqZHNhc2lnID0gTlVMTDsgLyogYWxzbyB1c2Vk
IGZvciBFQ0RTQSAqLzxicj4NCistwqAgwqAgU0VDU3RhdHVzIHJ2ID0gU0VDU3VjY2Vzczs8YnI+
DQorIDxicj4NCistwqAgwqAgaWYgKChhbGdpZCAhPSBTRUNfT0lEX0FOU0lYOV9EU0FfU0lHTkFU
VVJFKSAmYW1wOyZhbXA7PGJyPg0KKy3CoCDCoCDCoCDCoCAoYWxnaWQgIT0gU0VDX09JRF9BTlNJ
WDk2Ml9FQ19QVUJMSUNfS0VZKSkgezxicj4NCistwqAgwqAgwqAgwqAgaWYgKHNpZy0mZ3Q7bGVu
ICE9IGxlbikgezxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgUE9SVF9TZXRFcnJvcihTRUNfRVJS
T1JfQkFEX0RFUik7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gU0VDRmFpbHVyZTs8
YnI+DQorK8KgIMKgIC8qIFNhZmV0eTogRW5zdXJlIGFsZ0lkIGlzIGFzIGV4cGVjdGVkIGFuZCB0
aGF0IHNpZ25hdHVyZSBzaXplIGlzIHdpdGhpbiBtYXhtaW11bXMgKi88YnI+DQorK8KgIMKgIGlm
IChhbGdpZCA9PSBTRUNfT0lEX0FOU0lYOV9EU0FfU0lHTkFUVVJFKSB7PGJyPg0KKyvCoCDCoCDC
oCDCoCBpZiAobGVuICZndDsgRFNBX01BWF9TSUdOQVRVUkVfTEVOKSB7PGJyPg0KKyvCoCDCoCDC
oCDCoCDCoCDCoCBnb3RvIGxvc2VyOzxicj4NCivCoCDCoCDCoCDCoCDCoH08YnI+DQorLTxicj4N
CistwqAgwqAgwqAgwqAgUE9SVF9NZW1jcHkoZHNpZywgc2lnLSZndDtkYXRhLCBzaWctJmd0O2xl
bik7PGJyPg0KKy3CoCDCoCDCoCDCoCByZXR1cm4gU0VDU3VjY2Vzczs8YnI+DQorLcKgIMKgIH08
YnI+DQorLTxicj4NCistwqAgwqAgaWYgKGFsZ2lkID09IFNFQ19PSURfQU5TSVg5NjJfRUNfUFVC
TElDX0tFWSkgezxicj4NCisrwqAgwqAgfSBlbHNlIGlmIChhbGdpZCA9PSBTRUNfT0lEX0FOU0lY
OTYyX0VDX1BVQkxJQ19LRVkpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqBpZiAobGVuICZndDsgTUFY
X0VDS0VZX0xFTiAqIDIpIHs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIFBPUlRfU2V0RXJyb3Io
U0VDX0VSUk9SX0JBRF9ERVIpOzxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIFNFQ0Zh
aWx1cmU7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBnb3RvIGxvc2VyOzxicj4NCivCoCDCoCDC
oCDCoCDCoH08YnI+DQorLcKgIMKgIH08YnI+DQorLcKgIMKgIGRzYXNpZyA9IERTQVVfRGVjb2Rl
RGVyU2lnVG9MZW4oKFNFQ0l0ZW0gKilzaWcsIGxlbik7PGJyPg0KKy08YnI+DQorLcKgIMKgIGlm
ICgoZHNhc2lnID09IE5VTEwpIHx8IChkc2FzaWctJmd0O2xlbiAhPSBsZW4pKSB7PGJyPg0KKy3C
oCDCoCDCoCDCoCBydiA9IFNFQ0ZhaWx1cmU7PGJyPg0KK8KgIMKgIMKgfSBlbHNlIHs8YnI+DQor
LcKgIMKgIMKgIMKgIFBPUlRfTWVtY3B5KGRzaWcsIGRzYXNpZy0mZ3Q7ZGF0YSwgZHNhc2lnLSZn
dDtsZW4pOzxicj4NCisrwqAgwqAgwqAgwqAgZ290byBsb3Nlcjs8YnI+DQorwqAgwqAgwqB9PGJy
Pg0KKyA8YnI+DQorLcKgIMKgIGlmIChkc2FzaWcgIT0gTlVMTCk8YnI+DQorK8KgIMKgIC8qIERl
Y29kZSBhbmQgcGFkIHRvIGxlbmd0aCAqLzxicj4NCisrwqAgwqAgZHNhc2lnID0gRFNBVV9EZWNv
ZGVEZXJTaWdUb0xlbigoU0VDSXRlbSAqKXNpZywgbGVuKTs8YnI+DQorK8KgIMKgIGlmIChkc2Fz
aWcgPT0gTlVMTCkgezxicj4NCisrwqAgwqAgwqAgwqAgZ290byBsb3Nlcjs8YnI+DQorK8KgIMKg
IH08YnI+DQorK8KgIMKgIGlmIChkc2FzaWctJmd0O2xlbiAhPSBsZW4pIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqBTRUNJVEVNX0ZyZWVJdGVtKGRzYXNpZywgUFJfVFJVRSk7PGJyPg0KKy3CoCDCoCBp
ZiAocnYgPT0gU0VDRmFpbHVyZSk8YnI+DQorLcKgIMKgIMKgIMKgIFBPUlRfU2V0RXJyb3IoU0VD
X0VSUk9SX0JBRF9ERVIpOzxicj4NCistwqAgwqAgcmV0dXJuIHJ2Ozxicj4NCisrwqAgwqAgwqAg
wqAgZ290byBsb3Nlcjs8YnI+DQorK8KgIMKgIH08YnI+DQorKzxicj4NCisrwqAgwqAgUE9SVF9N
ZW1jcHkoZHNpZywgZHNhc2lnLSZndDtkYXRhLCBsZW4pOzxicj4NCisrwqAgwqAgU0VDSVRFTV9G
cmVlSXRlbShkc2FzaWcsIFBSX1RSVUUpOzxicj4NCisrPGJyPg0KKyvCoCDCoCByZXR1cm4gU0VD
U3VjY2Vzczs8YnI+DQorKzxicj4NCisrbG9zZXI6PGJyPg0KKyvCoCDCoCBQT1JUX1NldEVycm9y
KFNFQ19FUlJPUl9CQURfREVSKTs8YnI+DQorK8KgIMKgIHJldHVybiBTRUNGYWlsdXJlOzxicj4N
CisgfTxicj4NCisgPGJyPg0KKyBjb25zdCBTRUNfQVNOMVRlbXBsYXRlIGhhc2hQYXJhbWV0ZXJU
ZW1wbGF0ZVtdID08YnI+DQorQEAgLTIzMSw3ICsyNjIsNyBAQCBTRUNTdGF0dXM8YnI+DQorIHNl
Y19EZWNvZGVTaWdBbGcoY29uc3QgU0VDS0VZUHVibGljS2V5ICprZXksIFNFQ09pZFRhZyBzaWdB
bGcsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbnN0IFNFQ0l0ZW0gKnBhcmFt
LCBTRUNPaWRUYWcgKmVuY2FsZywgU0VDT2lkVGFnICpoYXNoYWxnKTxicj4NCisgezxicj4NCist
wqAgwqAgaW50IGxlbjs8YnI+DQorK8KgIMKgIHVuc2lnbmVkIGludCBsZW47PGJyPg0KK8KgIMKg
IMKgUExBcmVuYVBvb2wgKmFyZW5hOzxicj4NCivCoCDCoCDCoFNFQ1N0YXR1cyBydjs8YnI+DQor
wqAgwqAgwqBTRUNJdGVtIG9pZDs8YnI+DQorQEAgLTQ1OCw0OCArNDg5LDUyIEBAIHZmeV9DcmVh
dGVDb250ZXh0KGNvbnN0IFNFQ0tFWVB1YmxpY0tleTxicj4NCivCoCDCoCDCoGN4LSZndDtwa2Nz
MVJTQURpZ2VzdEluZm8gPSBOVUxMOzxicj4NCivCoCDCoCDCoHJ2ID0gU0VDU3VjY2Vzczs8YnI+
DQorwqAgwqAgwqBpZiAoc2lnKSB7PGJyPg0KKy3CoCDCoCDCoCDCoCBzd2l0Y2ggKHR5cGUpIHs8
YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIGNhc2UgcnNhS2V5Ojxicj4NCistwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgcnYgPSByZWNvdmVyUEtDUzFEaWdlc3RJbmZvKGhhc2hBbGcsICZhbXA7Y3gt
Jmd0O2hhc2hBbGcsPGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmYW1wO2N4LSZndDtwa2NzMVJTQURpZ2VzdElu
Zm8sPGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmYW1wO2N4LSZndDtwa2NzMVJTQURpZ2VzdEluZm9MZW4sPGJy
Pg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBjeC0mZ3Q7a2V5LDxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc2lnLCB3aW5jeCk7PGJy
Pg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQorLcKgIMKgIMKgIMKgIMKg
IMKgIGNhc2UgcnNhUHNzS2V5Ojxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc2lnTGVu
ID0gU0VDS0VZX1NpZ25hdHVyZUxlbihrZXkpOzxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgaWYgKHNpZ0xlbiA9PSAwKSB7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAvKiBlcnJvciBzZXQgYnkgU0VDS0VZX1NpZ25hdHVyZUxlbiAqLzxicj4NCistwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcnYgPSBTRUNGYWlsdXJlOzxicj4NCisrwqAgwqAgwqAgwqAg
cnYgPSBTRUNGYWlsdXJlOzxicj4NCisrwqAgwqAgwqAgwqAgaWYgKHR5cGUgPT0gcnNhS2V5KSB7
PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBydiA9IHJlY292ZXJQS0NTMURpZ2VzdEluZm8oaGFz
aEFsZywgJmFtcDtjeC0mZ3Q7aGFzaEFsZyw8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZhbXA7Y3gtJmd0O3BrY3MxUlNB
RGlnZXN0SW5mbyw8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgICZhbXA7Y3gtJmd0O3BrY3MxUlNBRGlnZXN0SW5mb0xlbiw8
YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGN4LSZndDtrZXksPGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzaWcsIHdpbmN4KTs8YnI+DQorK8KgIMKg
IMKgIMKgIH0gZWxzZSB7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBzaWdMZW4gPSBjaGVja2Vk
U2lnbmF0dXJlTGVuKGtleSk7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCAvKiBDaGVjayBzaWdu
YXR1cmUgbGVuZ3RoIGlzIHdpdGhpbiBsaW1pdHMgKi88YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKg
IGlmIChzaWdMZW4gPT0gMCkgezxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogZXJy
b3Igc2V0IGJ5IGNoZWNrZWRTaWduYXR1cmVMZW4gKi88YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHJ2ID0gU0VDRmFpbHVyZTs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdv
dG8gbG9zZXI7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KKyvCoCDCoCDCoCDCoCDC
oCDCoCBpZiAoc2lnTGVuICZndDsgc2l6ZW9mKGN4LSZndDt1KSkgezxicj4NCisrwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgUE9SVF9TZXRFcnJvcihTRUNfRVJST1JfQkFEX1NJR05BVFVSRSk7PGJy
Pg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBydiA9IFNFQ0ZhaWx1cmU7PGJyPg0KKyvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBnb3RvIGxvc2VyOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAg
fTxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgc3dpdGNoICh0eXBlKSB7PGJyPg0KKyvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBjYXNlIHJzYVBzc0tleTo8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGlmIChzaWctJmd0O2xlbiAhPSBzaWdMZW4pIHs8YnI+DQorK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFBPUlRfU2V0RXJyb3IoU0VDX0VSUk9SX0JBRF9T
SUdOQVRVUkUpOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcnYg
PSBTRUNGYWlsdXJlOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
Z290byBsb3Nlcjs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQor
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFBPUlRfTWVtY3B5KGN4LSZndDt1LmJ1ZmZl
ciwgc2lnLSZndDtkYXRhLCBzaWdMZW4pOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcnYgPSBTRUNTdWNjZXNzOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGJyZWFrOzxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCistwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgaWYgKHNpZy0mZ3Q7bGVuICE9IHNpZ0xlbikgezxicj4NCistwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgUE9SVF9TZXRFcnJvcihTRUNfRVJST1JfQkFEX1NJ
R05BVFVSRSk7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBydiA9IFNFQ0Zh
aWx1cmU7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjYXNlIGVjS2V5Ojxicj4NCisr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2FzZSBkc2FLZXk6PGJyPg0KKyvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAvKiBkZWNvZGVFQ29yRFNBU2lnbmF0dXJlIHdpbGwgY2hlY2sgc2ln
TGVuID09IHNpZy0mZ3Q7bGVuIGFmdGVyIHBhZGRpbmcgKi88YnI+DQorK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHJ2ID0gZGVjb2RlRUNvckRTQVNpZ25hdHVyZShlbmNBbGcsIHNpZywg
Y3gtJmd0O3UuYnVmZmVyLCBzaWdMZW4pOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGJyZWFrOzxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCistwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgUE9SVF9NZW1jcHkoY3gtJmd0O3UuYnVmZmVyLCBzaWctJmd0
O2RhdGEsIHNpZ0xlbik7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+
DQorLcKgIMKgIMKgIMKgIMKgIMKgIGNhc2UgZHNhS2V5Ojxicj4NCistwqAgwqAgwqAgwqAgwqAg
wqAgY2FzZSBlY0tleTo8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNpZ0xlbiA9IFNF
Q0tFWV9TaWduYXR1cmVMZW4oa2V5KTs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlm
IChzaWdMZW4gPT0gMCkgezxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyog
ZXJyb3Igc2V0IGJ5IFNFQ0tFWV9TaWduYXR1cmVMZW4gKi88YnI+DQorK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGRlZmF1bHQ6PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAv
KiBVbnJlYWNoYWJsZSAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJ2
ID0gU0VDRmFpbHVyZTs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJyZWFr
Ozxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCistwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgcnYgPSBkZWNvZGVFQ29yRFNBU2lnbmF0dXJlKGVuY0FsZywgc2lnLCBjeC0mZ3Q7
dS5idWZmZXIsIHNpZ0xlbik7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8
YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIGRlZmF1bHQ6PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBydiA9IFNFQ0ZhaWx1cmU7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBQ
T1JUX1NldEVycm9yKFNFQ19FUlJPUl9VTlNVUFBPUlRFRF9LRVlBTEcpOzxicj4NCistwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBnb3RvIGxvc2VyOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCisrwqAgwqAg
wqAgwqAgfTxicj4NCisrwqAgwqAgwqAgwqAgaWYgKHJ2ICE9IFNFQ1N1Y2Nlc3MpIHs8YnI+DQor
K8KgIMKgIMKgIMKgIMKgIMKgIGdvdG8gbG9zZXI7PGJyPg0KK8KgIMKgIMKgIMKgIMKgfTxicj4N
CivCoCDCoCDCoH08YnI+DQorIDxicj4NCistwqAgwqAgaWYgKHJ2KTxicj4NCistwqAgwqAgwqAg
wqAgZ290byBsb3Nlcjs8YnI+DQorLTxicj4NCivCoCDCoCDCoC8qIGNoZWNrIGhhc2ggYWxnIGFn
YWluLCBSU0EgbWF5IGhhdmUgY2hhbmdlZCBpdC4qLzxicj4NCivCoCDCoCDCoGlmIChIQVNIX0dl
dEhhc2hUeXBlQnlPaWRUYWcoY3gtJmd0O2hhc2hBbGcpID09IEhBU0hfQWxnTlVMTCkgezxicj4N
CivCoCDCoCDCoCDCoCDCoC8qIGVycm9yIHNldCBieSBIQVNIX0dldEhhc2hUeXBlQnlPaWRUYWcg
Ki88YnI+DQorQEAgLTYzNCwxMSArNjY5LDE2IEBAIFZGWV9FbmRXaXRoU2lnbmF0dXJlKFZGWUNv
bnRleHQgKmN4LCBTRUM8YnI+DQorwqAgwqAgwqBzd2l0Y2ggKGN4LSZndDtrZXktJmd0O2tleVR5
cGUpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqBjYXNlIGVjS2V5Ojxicj4NCivCoCDCoCDCoCDCoCDC
oGNhc2UgZHNhS2V5Ojxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgZHNhc2lnLmRhdGEgPSBjeC0m
Z3Q7dS5idWZmZXI7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCBkc2FzaWcubGVuID0gU0VDS0VZ
X1NpZ25hdHVyZUxlbihjeC0mZ3Q7a2V5KTs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIGRzYXNp
Zy5sZW4gPSBjaGVja2VkU2lnbmF0dXJlTGVuKGN4LSZndDtrZXkpOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoGlmIChkc2FzaWcubGVuID09IDApIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqByZXR1cm4gU0VDRmFpbHVyZTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJy
Pg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBpZiAoZHNhc2lnLmxlbiAmZ3Q7IHNpemVvZihjeC0mZ3Q7
dSkpIHs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFBPUlRfU2V0RXJyb3IoU0VDX0VS
Uk9SX0JBRF9TSUdOQVRVUkUpOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJu
IFNFQ0ZhaWx1cmU7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KKyvCoCDCoCDCoCDC
oCDCoCDCoCBkc2FzaWcuZGF0YSA9IGN4LSZndDt1LmJ1ZmZlcjs8YnI+DQorKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoGlmIChzaWcpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBydiA9IGRlY29kZUVDb3JEU0FTaWduYXR1cmUoY3gtJmd0O2VuY0FsZywgc2lnLCBkc2FzaWcu
ZGF0YSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkc2FzaWcubGVuKTs8YnI+DQorQEAgLTY2Nyw4ICs2OTgs
MTMgQEA8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KKyA8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByc2FzaWcuZGF0YSA9IGN4LSZndDt1LmJ1ZmZlcjs8YnI+
DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJzYXNpZy5sZW4gPSBTRUNLRVlfU2lnbmF0dXJl
TGVuKGN4LSZndDtrZXkpOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcnNhc2lnLmxl
biA9IGNoZWNrZWRTaWduYXR1cmVMZW4oY3gtJmd0O2tleSk7wqAgwqAgwqAgwqAgwqAgwqAgPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJzYXNpZy5sZW4gPT0gMCkgezxicj4N
CisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogRXJyb3Igc2V0IGJ5IGNoZWNrZWRT
aWduYXR1cmVMZW4gKi88YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVy
biBTRUNGYWlsdXJlOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCisrwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHJzYXNpZy5sZW4gJmd0OyBzaXplb2YoY3gtJmd0O3Up
KSB7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBQT1JUX1NldEVycm9yKFNF
Q19FUlJPUl9CQURfU0lHTkFUVVJFKTvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiBTRUNGYWlsdXJlOzxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpZiAoc2lnKSB7PGJyPg0KK0BAIC03NDMsNyArNzg4LDYgQEAgdmZ5X1ZlcmlmeURpZ2Vz
dChjb25zdCBTRUNJdGVtICpkaWdlc3QsPGJyPg0KK8KgIMKgIMKgU0VDU3RhdHVzIHJ2Ozxicj4N
CivCoCDCoCDCoFZGWUNvbnRleHQgKmN4Ozxicj4NCivCoCDCoCDCoFNFQ0l0ZW0gZHNhc2lnOyAv
KiBhbHNvIHVzZWQgZm9yIEVDRFNBICovPGJyPg0KKy08YnI+DQorwqAgwqAgwqBydiA9IFNFQ0Zh
aWx1cmU7PGJyPg0KKyA8YnI+DQorwqAgwqAgwqBjeCA9IHZmeV9DcmVhdGVDb250ZXh0KGtleSwg
c2lnLCBlbmNBbGcsIGhhc2hBbGcsIE5VTEwsIHdpbmN4KTs8YnI+DQorQEAgLTc1MSwxOSArNzk1
LDI1IEBAIHZmeV9WZXJpZnlEaWdlc3QoY29uc3QgU0VDSXRlbSAqZGlnZXN0LDxicj4NCivCoCDC
oCDCoCDCoCDCoHN3aXRjaCAoa2V5LSZndDtrZXlUeXBlKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgY2FzZSByc2FLZXk6PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcnYgPSB2
ZXJpZnlQS0NTMURpZ2VzdEluZm8oY3gsIGRpZ2VzdCk7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAvKiBFcnJvciAoaWYgYW55KSBzZXQgYnkgdmVyaWZ5UEtDUzFEaWdlc3RJbmZvICov
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KKy3CoCDCoCDCoCDC
oCDCoCDCoCBjYXNlIGRzYUtleTo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIGVjS2V5
Ojxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgY2FzZSBkc2FLZXk6PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZHNhc2lnLmRhdGEgPSBjeC0mZ3Q7dS5idWZmZXI7PGJyPg0KKy3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBkc2FzaWcubGVuID0gU0VDS0VZX1NpZ25hdHVyZUxlbihjeC0m
Z3Q7a2V5KTs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRzYXNpZy5sZW4gPSBjaGVj
a2VkU2lnbmF0dXJlTGVuKGN4LSZndDtrZXkpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGlmIChkc2FzaWcubGVuID09IDApIHs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIC8qIEVycm9yIHNldCBieSBjaGVja2VkU2lnbmF0dXJlTGVuICovPGJyPg0KKyvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBydiA9IFNFQ0ZhaWx1cmU7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfTxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKFBLMTFfVmVyaWZ5KGN4
LSZndDtrZXksICZhbXA7ZHNhc2lnLCAoU0VDSXRlbSAqKWRpZ2VzdCwgY3gtJmd0O3dpbmN4KSAh
PTxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgU0VDU3VjY2Vzcykgezxicj4N
CisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGRzYXNpZy5sZW4gJmd0OyBzaXplb2YoY3gt
Jmd0O3UpKSB7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBQT1JUX1NldEVy
cm9yKFNFQ19FUlJPUl9CQURfU0lHTkFUVVJFKTs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHJ2ID0gU0VDRmFpbHVyZTs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGJyZWFrOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCisrwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcnYgPSBQSzExX1ZlcmlmeShjeC0mZ3Q7a2V5LCAmYW1wO2Rz
YXNpZywgKFNFQ0l0ZW0gKilkaWdlc3QsIGN4LSZndDt3aW5jeCk7PGJyPg0KKyvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBpZiAocnYgIT0gU0VDU3VjY2Vzcykgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoFBPUlRfU2V0RXJyb3IoU0VDX0VSUk9SX0JBRF9TSUdOQVRVUkUp
Ozxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfSBlbHNlIHs8YnI+DQorLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJ2ID0gU0VDU3VjY2Vzczs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgZGVmYXVsdDo8YnI+DQpkaWZmIC0tZ2l0IGEvbWV0YS1v
ZS9yZWNpcGVzLXN1cHBvcnQvbnNzLzxhIGhyZWY9Imh0dHA6Ly9uc3NfMy41MS4xLmJiIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5uc3NfMy41MS4xLmJiPC9hPiBiL21ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L25zcy88YSBocmVmPSJodHRwOi8vbnNzXzMuNTEuMS5iYiIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bnNzXzMuNTEuMS5iYjwvYT48YnI+DQppbmRleCAx
NGY2NzBjMzIuLmYwMzQ3M2IxYSAxMDA2NDQ8YnI+DQotLS0gYS9tZXRhLW9lL3JlY2lwZXMtc3Vw
cG9ydC9uc3MvPGEgaHJlZj0iaHR0cDovL25zc18zLjUxLjEuYmIiIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPm5zc18zLjUxLjEuYmI8L2E+PGJyPg0KKysrIGIvbWV0YS1vZS9yZWNp
cGVzLXN1cHBvcnQvbnNzLzxhIGhyZWY9Imh0dHA6Ly9uc3NfMy41MS4xLmJiIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5uc3NfMy41MS4xLmJiPC9hPjxicj4NCkBAIC0zOSw2ICsz
OSw3IEBAIFNSQ19VUkkgPSAmcXVvdDs8YSBocmVmPSJodHRwOi8vZnRwLm1vemlsbGEub3JnL3B1
Yi9tb3ppbGxhLm9yZy9zZWN1cml0eS9uc3MvcmVsZWFzZXMvJCU3QlZFUlNJTyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2Z0cC5tb3ppbGxhLm9yZy9wdWIvbW96aWxs
YS5vcmcvc2VjdXJpdHkvbnNzL3JlbGVhc2VzLyR7VkVSU0lPPC9hPjxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIGZpbGU6Ly9DVkUtMjAyMC02ODI5XzEyNDAwLnBhdGNoIFw8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCBmaWxlOi8vQ1ZFLTIwMjAtMTI0MDNfMS5wYXRjaCBcPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgZmlsZTovL0NWRS0yMDIwLTEyNDAzXzIucGF0Y2ggXDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoGZpbGU6Ly9DVkUtMjAyMS00MzUyNy5wYXRjaCBcPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
JnF1b3Q7PGJyPg0KPGJyPg0KwqBTUkNfVVJJW21kNXN1bV0gPSAmcXVvdDs2YWNhZjFkZGZmNjkz
MDZhZTMwYTkwODg4MWM2ZjIzMyZxdW90Ozxicj4NCi0tIDxicj4NCjIuMTcuMTxicj4NCjxicj4N
CjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj4NCg==
--00000000000092434e05d3b4f8c9--

