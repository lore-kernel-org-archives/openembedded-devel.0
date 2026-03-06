Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F7BF5141A
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:18:08 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64629.1772781486954401937
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:18:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LwP55IrJ;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-662f91bba0fso7403850eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 23:18:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772781486; cv=none;
        d=google.com; s=arc-20240605;
        b=Cxft36NaxfttLp9xCyp/KOK4NJ62N7ivacr13fi8PmiyZwe4XuMiyLMMjWwDixsn7r
         G5fSl8ecBIwER62JF0LjlrfUAoixtJiVNGBtcualZpMHEPDPzjMNF+xJy/Hd3UXbgT5D
         5HtHd+our1M5hacW2W8ALXSbeFUydV4Swrgzj0OEvlLB8y0yvNoxwogyVGfOMYnnPBfB
         MmLSQNn9HEu14tW0h8QZ8EBoXqXKSe/c41tr7p/LKI5X9lDbfwYnBf9zkw56yn5AB3IR
         fCC+7skBkt3OnsdddvkCIvunTREpmySAal2bwZD0anAqdEdRcW1sSGFovqQMohr6BHkj
         B++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e4Bwuu6nNyg0nvnurOnlM0FNXYqBsQrElwodgRGZm1Y=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=gq72x7IQ3VFf1B6JGlGmwx7mQ9dYHa8yqWW2qbqgySUn71YAy6XRvA8r6eE6QCY6+i
         fONt+9OHVKKTyEeXqGFFUI1aJyk1qBC4HR2u+O0MKkP2lrSwBJCujvFnlZrOuvFrY8vG
         lnAZBP2MIrZjD17mozpk9fhFIiWRnNjmWF5FNbLm9YHV6pkvU5mFWmgmBRo89v8/0+XU
         fOpNjbZN6AXVV44KajHIcXtqFX/Sbw61b6DWNfHqlFuCMW6DvXlP4FuhII4tK56f/u+7
         B0gSedBV99Rfu8bRIat19k0+/7/I1LfLpQL46a2RSkxx2hYh47NvHdCQJs1V0j332LV6
         Ms5Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772781486; x=1773386286; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4Bwuu6nNyg0nvnurOnlM0FNXYqBsQrElwodgRGZm1Y=;
        b=LwP55IrJiCMLk16G+ozUYE/HczBNASqrBNcv5hX7WRko93ocmPj0ivIyQXgW5j3L1y
         C8pn7mxATBG1N8CzRCSAn920mEfpP2/HNy1B9V8/kfb9Bkxr6avIKCYuUoVXh2ZoxLSY
         Ec/C5YuAUuf1HsgIyUtNglLHBItsqa8PIeVxmH80AwTzRjGWXjj9iaXCG5PR8t5GNHR5
         DGklbsaLc1voF19tWJpffYQXcVr+BTrwbM0oXXboUi+d/KQFH6G+KgCQVWP8ollwpayf
         4DIxlSNVCBgnDUgZVdeC3WlcNlO0F5u6ATj2W+y8JJTog23XgfSkuXCQQzuh0jO5PnMs
         L1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781486; x=1773386286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e4Bwuu6nNyg0nvnurOnlM0FNXYqBsQrElwodgRGZm1Y=;
        b=lgGbZlnBbjFgZIjR6PszB4V36mHHCiysHo6WPlSCwZ+LX5lXvSAPpIG3G/JILsiu05
         rBl2swPkfCKgdBcgMjwYgievRZ3S5cvNupaDv/jqTGK80yehpU+UOlIgq28GpTNzxOWW
         uRfl0D3nGhOZedqIdrYoZHv+UbHApM4SnTxUASqRxBvCqrIN4tahHWWmikkplwNVTVeE
         oQUokZ8tT0UkhOwJrzuQb/5mgO1DFr/zq8NWFxzdWkr6esL423iqLuvZeu787/nYri5N
         H6lF2VLNQASACFTrmmOlZt7Kz4ZcxgrFmLaAGQ1g4L1tqlvMKQD9Pa0sMchhY0xZw+k9
         /Tqw==
X-Gm-Message-State: AOJu0YyVZeL4jymytR7NZHxp9uRuijhcqpI1vphypi4MTw9QbUdBqH6N
	7lBaCNaVdfaTdB/sn+KUbjGoAXAumzuu0QN37D0qofXyaiUKKtLpmjy4AlRYln3nwGpJOE4tm+j
	VsS8C1kr4tig3V7wYhcDo2mB2T8NQuUIK7laQ
X-Gm-Gg: ATEYQzyIv/DEM6nM2QGowYU2ZEvauhlwnFUAyP3TX4LdJHO/2osFdEC4Ef0WQCT7DN2
	0vQOdT1HQNeMcaCNZlbkMzeo3LIDmVrB3CxIUVZsGssZo3z7NPBNjrGYeWTEwaZDylf7XrFipEv
	Akl+F2eDJrc0BP19eDMFwItnvLHgJZiWhz39mGlcQ1klMK1khf/Y1QKXRYIRKhyZPhMNyIWdISB
	S1/pWnr5/OPAJswuQ2N/wn5rZcOx2aassau+ajAkhXGBbw3qh8VshlW4btbdFiqc3fAZ3YILwbV
	LwVeK38=
X-Received: by 2002:a05:6820:2d4a:b0:676:d1bc:b012 with SMTP id
 006d021491bc7-67b9c375a5dmr711376eaf.10.1772781485907; Thu, 05 Mar 2026
 23:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20260224185412.1835468-2-ankur.tyagi85@gmail.com> <CA+s=J=ypghOCPnCkntAeafipwAp814QkYny7DNct2qKwMRNz4Q@mail.gmail.com>
In-Reply-To: <CA+s=J=ypghOCPnCkntAeafipwAp814QkYny7DNct2qKwMRNz4Q@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 6 Mar 2026 20:17:54 +1300
X-Gm-Features: AaiRm53lwo65wdh51HEd8RU9iq0KMR-NSIvhWafLBlyt_hdB5T-6vsFfz9LXmaQ
Message-ID: <CADySD0FFCLLaE-S-jwo1mn4Orf15NDghzApRoO5dYAg6QnxAUA@mail.gmail.com>
Subject: Re: [oe][meta-networking][whinlatter][PATCH 1/3] wolfssl: patch CVE-2025-13912
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 07:18:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124900

On Fri, Mar 6, 2026 at 6:32=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualcom=
m.com> wrote:
>
> On Wed, Feb 25, 2026 at 2:54=E2=80=AFAM Ankur Tyagi via lists.openembedde=
d.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Backport changes from PR[1] mentioned in nvd[2]
> >
> > [1] https://github.com/wolfSSL/wolfssl/pull/9148
> > [2] https://nvd.nist.gov/vuln/detail/CVE-2025-13912
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../wolfssl/files/CVE-2025-13912.patch        | 439 ++++++++++++++++++
> >  .../wolfssl/wolfssl_5.8.0.bb                  |   1 +
> >  2 files changed, 440 insertions(+)
> >  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/=
CVE-2025-13912.patch
> >
> > diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-202=
5-13912.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025=
-13912.patch
> > new file mode 100644
> > index 0000000000..32252058f7
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-13912=
.patch
> > @@ -0,0 +1,439 @@
> > +From 797e0e7abf5830d515ca838201c03a47f83356b0 Mon Sep 17 00:00:00 2001
> > +From: Daniel Pouzzner <douzzer@wolfssl.com>
> > +Date: Tue, 30 Sep 2025 20:35:52 -0500
> > +Subject: [PATCH] Merge pull request #9148 from SparkiDev/ct_volatile
> > +
> > +Mark variables as volatile
> > +
> > +CVE: CVE-2025-13912
> > +Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/2=
34ba7780ad3b7c8c1509973accdc43ed6c328b3]
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +---
> > + src/internal.c         | 25 ++++++++++++---------
> > + src/tls.c              |  8 +++++--
> > + wolfcrypt/src/aes.c    |  4 ++--
> > + wolfcrypt/src/ecc.c    |  8 +++----
> > + wolfcrypt/src/misc.c   |  4 ++--
> > + wolfcrypt/src/rsa.c    | 18 +++++++++------
> > + wolfcrypt/src/sp_int.c | 51 ++++++++++++++++++++++-------------------=
-
>
> This seems to be missing a few more volatile related changes when
> compared to the patch mentioned above. Did you skip those on purpose?

Yes, those changes were not applicable for v5.8.0

> > + 7 files changed, 67 insertions(+), 51 deletions(-)
> > +
> > +diff --git a/src/internal.c b/src/internal.c
> > +index eb2f16d63..6b3a227bc 100644
> > +--- a/src/internal.c
> > ++++ b/src/internal.c
> > +@@ -20887,7 +20887,7 @@ static byte MaskPadding(const byte* data, int =
sz, int macSz)
> > +         checkSz =3D TLS_MAX_PAD_SZ;
> > +
> > +     for (i =3D 0; i < checkSz; i++) {
> > +-        byte mask =3D ctMaskLTE(i, paddingSz);
> > ++        volatile byte mask =3D ctMaskLTE(i, paddingSz);
> > +         good |=3D mask & (data[sz - 1 - i] ^ paddingSz);
> > +     }
> > +
> > +@@ -20907,16 +20907,21 @@ static byte MaskPadding(const byte* data, in=
t sz, int macSz)
> > + static byte MaskMac(const byte* data, int sz, int macSz, byte* expMac=
)
> > + {
> > +     int i, j;
> > +-    unsigned char mac[WC_MAX_DIGEST_SIZE];
> > +-    int scanStart =3D sz - 1 - TLS_MAX_PAD_SZ - macSz;
> > +-    int macEnd =3D sz - 1 - data[sz - 1];
> > +-    int macStart =3D macEnd - macSz;
> > +     int r =3D 0;
> > +-    unsigned char started, notEnded;
> > ++    unsigned char mac[WC_MAX_DIGEST_SIZE];
> > ++    volatile int scanStart =3D sz - 1 - TLS_MAX_PAD_SZ - macSz;
> > ++    volatile int macEnd =3D sz - 1 - data[sz - 1];
> > ++    volatile int macStart =3D macEnd - macSz;
> > ++    volatile int maskScanStart;
> > ++    volatile int maskMacStart;
> > ++    volatile unsigned char started;
> > ++    volatile unsigned char notEnded;
> > +     unsigned char good =3D 0;
> > +
> > +-    scanStart &=3D ctMaskIntGTE(scanStart, 0);
> > +-    macStart &=3D ctMaskIntGTE(macStart, 0);
> > ++    maskScanStart =3D ctMaskIntGTE(scanStart, 0);
> > ++    maskMacStart =3D ctMaskIntGTE(macStart, 0);
> > ++    scanStart &=3D maskScanStart;
> > ++    macStart &=3D maskMacStart;
> > +
> > +     /* Div on Intel has different speeds depending on value.
> > +      * Use a bitwise AND or mod a specific value (converted to mul). =
*/
> > +@@ -41636,7 +41641,7 @@ static int DefTicketEncCb(WOLFSSL* ssl, byte k=
ey_name[WOLFSSL_TICKET_NAME_SZ],
> > +                     case rsa_kea:
> > +                     {
> > +                         RsaKey* key =3D (RsaKey*)ssl->hsKey;
> > +-                        int lenErrMask;
> > ++                        volatile int lenErrMask;
> > +
> > +                         ret =3D RsaDec(ssl,
> > +                             input + args->idx,
> > +@@ -41850,7 +41855,7 @@ static int DefTicketEncCb(WOLFSSL* ssl, byte k=
ey_name[WOLFSSL_TICKET_NAME_SZ],
> > +                     case rsa_kea:
> > +                     {
> > +                         byte *tmpRsa;
> > +-                        byte mask;
> > ++                        volatile byte mask;
> > +
> > +                         /* Add the signature length to idx */
> > +                         args->idx +=3D args->length;
> > +diff --git a/src/tls.c b/src/tls.c
> > +index 6ad21c924..4f57ea938 100644
> > +--- a/src/tls.c
> > ++++ b/src/tls.c
> > +@@ -944,7 +944,10 @@ static int Hmac_UpdateFinal_CT(Hmac* hmac, byte* =
digest, const byte* in,
> > +     unsigned int k;
> > +     int          blockBits, blockMask;
> > +     int          lastBlockLen, extraLen, eocIndex;
> > +-    int          blocks, safeBlocks, lenBlock, eocBlock;
> > ++    int          blocks;
> > ++    int          safeBlocks;
> > ++    int          lenBlock;
> > ++    int          eocBlock;
> > +     word32       maxLen;
> > +     int          blockSz, padSz;
> > +     int          ret;
> > +@@ -1054,7 +1057,8 @@ static int Hmac_UpdateFinal_CT(Hmac* hmac, byte*=
 digest, const byte* in,
> > +
> > +         for (j =3D 0; j < blockSz; j++) {
> > +             unsigned char atEoc =3D ctMaskEq(j, eocIndex) & isEocBloc=
k;
> > +-            unsigned char pastEoc =3D ctMaskGT(j, eocIndex) & isEocBl=
ock;
> > ++            volatile unsigned char maskPastEoc =3D ctMaskGT(j, eocInd=
ex);
> > ++            volatile unsigned char pastEoc =3D maskPastEoc & isEocBlo=
ck;
> > +             unsigned char b =3D 0;
> > +
> > +             if (k < headerSz)
> > +diff --git a/wolfcrypt/src/aes.c b/wolfcrypt/src/aes.c
> > +index 6e7f104dd..2cf7c695e 100644
> > +--- a/wolfcrypt/src/aes.c
> > ++++ b/wolfcrypt/src/aes.c
> > +@@ -6577,7 +6577,7 @@ static WC_INLINE void RIGHTSHIFTX(byte* x)
> > + {
> > +     int i;
> > +     int carryIn =3D 0;
> > +-    byte borrow =3D (byte)((0x00U - (x[15] & 0x01U)) & 0xE1U);
> > ++    volatile byte borrow =3D (byte)((0x00U - (x[15] & 0x01U)) & 0xE1U=
);
> > +
> > +     for (i =3D 0; i < WC_AES_BLOCK_SIZE; i++) {
> > +         int carryOut =3D (x[i] & 0x01) << 7;
> > +@@ -9113,7 +9113,7 @@ int WARN_UNUSED_RESULT AES_GCM_decrypt_C(
> > +     ALIGN16 byte scratch[WC_AES_BLOCK_SIZE];
> > +     ALIGN16 byte Tprime[WC_AES_BLOCK_SIZE];
> > +     ALIGN16 byte EKY0[WC_AES_BLOCK_SIZE];
> > +-    sword32 res;
> > ++    volatile sword32 res;
> > +
> > +     if (ivSz =3D=3D GCM_NONCE_MID_SZ) {
> > +         /* Counter is IV with bottom 4 bytes set to: 0x00,0x00,0x00,0=
x01. */
> > +diff --git a/wolfcrypt/src/ecc.c b/wolfcrypt/src/ecc.c
> > +index 6d4cd4de7..1fd30cfd9 100644
> > +--- a/wolfcrypt/src/ecc.c
> > ++++ b/wolfcrypt/src/ecc.c
> > +@@ -3166,7 +3166,7 @@ static int ecc_mulmod(const mp_int* k, ecc_point=
* P, ecc_point* Q,
> > +     ecc_point** R, mp_int* a, mp_int* modulus, mp_digit mp, WC_RNG* r=
ng)
> > + {
> > +     int      err =3D MP_OKAY;
> > +-    int      bytes =3D (mp_count_bits(modulus) + 7) / 8;
> > ++    int      bytes =3D (mp_count_bits(modulus) + 7) >> 3;
> > +     int      i;
> > +     int      j =3D 1;
> > +     int      cnt =3D DIGIT_BIT;
> > +@@ -3406,7 +3406,7 @@ static int ecc_mulmod(const mp_int* k, ecc_point=
* P, ecc_point* Q,
> > +     ecc_point** R, mp_int* a, mp_int* modulus, mp_digit mp, WC_RNG* r=
ng)
> > + {
> > +     int          err =3D MP_OKAY;
> > +-    int          bytes =3D (mp_count_bits(modulus) + 7) / 8;
> > ++    int          bytes =3D (mp_count_bits(modulus) + 7) >> 3;
> > +     int          i;
> > +     int          j =3D 1;
> > +     int          cnt;
> > +@@ -4450,7 +4450,7 @@ int wc_ecc_get_curve_id_from_params(int fieldSiz=
e,
> > +         Gx =3D=3D NULL || Gy =3D=3D NULL)
> > +         return BAD_FUNC_ARG;
> > +
> > +-    curveSz =3D (fieldSize + 1) / 8;    /* round up */
> > ++    curveSz =3D (fieldSize + 1) >> 3;    /* round up */
> > +
> > +     for (idx =3D 0; ecc_sets[idx].size !=3D 0; idx++) {
> > +         if (curveSz =3D=3D ecc_sets[idx].size) {
> > +@@ -11922,7 +11922,7 @@ int wc_ecc_sig_size(const ecc_key* key)
> > +     keySz =3D key->dp->size;
> > +     orderBits =3D wc_ecc_get_curve_order_bit_count(key->dp);
> > +     if (orderBits > keySz * 8) {
> > +-        keySz =3D (orderBits + 7) / 8;
> > ++        keySz =3D (orderBits + 7) >> 3;
> > +     }
> > +     /* maximum possible signature header size is 7 bytes */
> > +     maxSigSz =3D (keySz * 2) + SIG_HEADER_SZ;
> > +diff --git a/wolfcrypt/src/misc.c b/wolfcrypt/src/misc.c
> > +index 98b83c7ae..496b0dbcc 100644
> > +--- a/wolfcrypt/src/misc.c
> > ++++ b/wolfcrypt/src/misc.c
> > +@@ -762,7 +762,7 @@ WC_MISC_STATIC WC_INLINE void ctMaskCopy(byte mask=
, byte* dst, byte* src,
> > +     WC_MISC_STATIC WC_INLINE word32 min(word32 a, word32 b)
> > +     {
> > + #if !defined(WOLFSSL_NO_CT_OPS) && defined(WORD64_AVAILABLE)
> > +-        word32 gte_mask =3D (word32)ctMaskWord32GTE(a, b);
> > ++        volatile word32 gte_mask =3D (word32)ctMaskWord32GTE(a, b);
> > +         return (a & ~gte_mask) | (b & gte_mask);
> > + #else /* WOLFSSL_NO_CT_OPS */
> > +         return a > b ? b : a;
> > +@@ -778,7 +778,7 @@ WC_MISC_STATIC WC_INLINE void ctMaskCopy(byte mask=
, byte* dst, byte* src,
> > +     WC_MISC_STATIC WC_INLINE word32 max(word32 a, word32 b)
> > +     {
> > + #if !defined(WOLFSSL_NO_CT_OPS) && defined(WORD64_AVAILABLE)
> > +-        word32 gte_mask =3D (word32)ctMaskWord32GTE(a, b);
> > ++        volatile word32 gte_mask =3D (word32)ctMaskWord32GTE(a, b);
> > +         return (a & gte_mask) | (b & ~gte_mask);
> > + #else /* WOLFSSL_NO_CT_OPS */
> > +         return a > b ? a : b;
> > +diff --git a/wolfcrypt/src/rsa.c b/wolfcrypt/src/rsa.c
> > +index 94d57bd8b..acd0c04c5 100644
> > +--- a/wolfcrypt/src/rsa.c
> > ++++ b/wolfcrypt/src/rsa.c
> > +@@ -1561,11 +1561,11 @@ static int RsaUnPad_OAEP(byte *pkcsBlock, unsi=
gned int pkcsBlockLen,
> > +                             byte* optLabel, word32 labelLen, void* he=
ap)
> > + {
> > +     word32 hLen;
> > +-    int ret;
> > ++    volatile int ret;
> > +     byte h[WC_MAX_DIGEST_SIZE]; /* max digest size */
> > +     word32 idx;
> > +     word32 i;
> > +-    word32 inc;
> > ++    volatile word32 inc;
> > +
> > + #if defined(WOLFSSL_SMALL_STACK) && !defined(WOLFSSL_NO_MALLOC)
> > +     byte* tmp  =3D NULL;
> > +@@ -1850,9 +1850,11 @@ static int RsaUnPad(const byte *pkcsBlock, unsi=
gned int pkcsBlockLen,
> > +     }
> > + #ifndef WOLFSSL_RSA_VERIFY_ONLY
> > +     else {
> > +-        unsigned int j;
> > +-        word16 pastSep =3D 0;
> > +-        byte   invalid =3D 0;
> > ++        unsigned int    j;
> > ++        volatile word16 pastSep =3D 0;
> > ++        volatile byte   invalid =3D 0;
> > ++        volatile byte   minPad;
> > ++        volatile int    invalidMask;
> > +
> > +         i =3D 0;
> > +         /* Decrypted with private key - unpad must be constant time. =
*/
> > +@@ -1864,7 +1866,8 @@ static int RsaUnPad(const byte *pkcsBlock, unsig=
ned int pkcsBlockLen,
> > +         }
> > +
> > +         /* Minimum of 11 bytes of pre-message data - including leadin=
g 0x00. */
> > +-        invalid |=3D ctMaskLT(i, RSA_MIN_PAD_SZ);
> > ++        minPad =3D ctMaskLT(i, RSA_MIN_PAD_SZ);
> > ++        invalid |=3D minPad;
> > +         /* Must have seen separator. */
> > +         invalid |=3D (byte)~pastSep;
> > +         /* First byte must be 0x00. */
> > +@@ -1873,7 +1876,8 @@ static int RsaUnPad(const byte *pkcsBlock, unsig=
ned int pkcsBlockLen,
> > +         invalid |=3D ctMaskNotEq(pkcsBlock[1], padValue);
> > +
> > +         *output =3D (byte *)(pkcsBlock + i);
> > +-        ret =3D ((int)-1 + (int)(invalid >> 7)) & ((int)pkcsBlockLen =
- i);
> > ++        invalidMask =3D (int)-1 + (int)(invalid >> 7);
> > ++        ret =3D invalidMask & ((int)pkcsBlockLen - i);
> > +     }
> > + #endif
> > +
> > +diff --git a/wolfcrypt/src/sp_int.c b/wolfcrypt/src/sp_int.c
> > +index 1769840e7..0ee8aa252 100644
> > +--- a/wolfcrypt/src/sp_int.c
> > ++++ b/wolfcrypt/src/sp_int.c
> > +@@ -5502,7 +5502,7 @@ int sp_exch(sp_int* a, sp_int* b)
> > + int sp_cond_swap_ct_ex(sp_int* a, sp_int* b, int cnt, int swap, sp_in=
t* t)
> > + {
> > +     unsigned int i;
> > +-    sp_int_digit mask =3D (sp_int_digit)0 - (sp_int_digit)swap;
> > ++    volatile sp_int_digit mask =3D (sp_int_digit)0 - (sp_int_digit)sw=
ap;
> > +
> > +     /* XOR other fields in sp_int into temp - mask set when swapping.=
 */
> > +     t->used =3D (a->used ^ b->used) & (sp_size_t)mask;
> > +@@ -5772,7 +5772,7 @@ static int _sp_cmp_ct(const sp_int* a, const sp_=
int* b, unsigned int n)
> > + {
> > +     int ret =3D MP_EQ;
> > +     int i;
> > +-    int mask =3D -1;
> > ++    volatile int mask =3D -1;
> > +
> > +     for (i =3D n - 1; i >=3D 0; i--) {
> > +         sp_int_digit ad =3D a->dp[i] & ((sp_int_digit)0 - (i < (int)a=
->used));
> > +@@ -7305,7 +7305,8 @@ static void _sp_div_2(const sp_int* a, sp_int* r=
)
> > +
> > +     /* Shift down each word by 1 and include bottom bit of next at to=
p. */
> > +     for (i =3D 0; i < (int)a->used - 1; i++) {
> > +-        r->dp[i] =3D (a->dp[i] >> 1) | (a->dp[i+1] << (SP_WORD_SIZE -=
 1));
> > ++        r->dp[i]  =3D a->dp[i] >> 1;
> > ++        r->dp[i] |=3D a->dp[i+1] << (SP_WORD_SIZE - 1);
> > +     }
> > +     /* Last word only needs to be shifted down. */
> > +     r->dp[i] =3D a->dp[i] >> 1;
> > +@@ -7385,7 +7386,7 @@ int sp_div_2_mod_ct(const sp_int* a, const sp_in=
t* m, sp_int* r)
> > +         sp_int_digit t;
> > +     #endif
> > +         /* Mask to apply to modulus. */
> > +-        sp_int_digit mask =3D (sp_int_digit)0 - (a->dp[0] & 1);
> > ++        volatile sp_int_digit mask =3D (sp_int_digit)0 - (a->dp[0] & =
1);
> > +         sp_size_t i;
> > +
> > +     #if 0
> > +@@ -7396,7 +7397,7 @@ int sp_div_2_mod_ct(const sp_int* a, const sp_in=
t* m, sp_int* r)
> > +         /* Add a to m, if a is odd, into r in constant time. */
> > +         for (i =3D 0; i < m->used; i++) {
> > +             /* Mask to apply to a - set when used value at index. */
> > +-            sp_int_digit mask_a =3D (sp_int_digit)0 - (i < a->used);
> > ++            volatile sp_int_digit mask_a =3D (sp_int_digit)0 - (i < a=
->used);
> > +
> > +         #ifndef SQR_MUL_ASM
> > +             /* Conditionally add modulus. */
> > +@@ -8017,7 +8018,7 @@ static void sp_clamp_ct(sp_int* a)
> > + {
> > +     int i;
> > +     sp_size_t used =3D a->used;
> > +-    sp_size_t mask =3D (sp_size_t)-1;
> > ++    volatile sp_size_t mask =3D (sp_size_t)-1;
> > +
> > +     for (i =3D (int)a->used - 1; i >=3D 0; i--) {
> > + #if ((SP_WORD_SIZE =3D=3D 64) && \
> > +@@ -8066,9 +8067,9 @@ int sp_addmod_ct(const sp_int* a, const sp_int* =
b, const sp_int* m, sp_int* r)
> > +     sp_int_digit sh;
> > +     sp_int_digit t;
> > + #endif
> > +-    sp_int_digit mask;
> > +-    sp_int_digit mask_a =3D (sp_int_digit)-1;
> > +-    sp_int_digit mask_b =3D (sp_int_digit)-1;
> > ++    volatile sp_int_digit mask;
> > ++    volatile sp_int_digit mask_a =3D (sp_int_digit)-1;
> > ++    volatile sp_int_digit mask_b =3D (sp_int_digit)-1;
> > +     sp_size_t i;
> > +
> > +     /* Check result is as big as modulus. */
> > +@@ -8230,9 +8231,9 @@ static void _sp_submod_ct(const sp_int* a, const=
 sp_int* b, const sp_int* m,
> > +     sp_int_digit h;
> > +     sp_int_digit t;
> > + #endif
> > +-    sp_int_digit mask;
> > +-    sp_int_digit mask_a =3D (sp_int_digit)-1;
> > +-    sp_int_digit mask_b =3D (sp_int_digit)-1;
> > ++    volatile sp_int_digit mask;
> > ++    volatile sp_int_digit mask_a =3D (sp_int_digit)-1;
> > ++    volatile sp_int_digit mask_b =3D (sp_int_digit)-1;
> > +     unsigned int i;
> > +
> > +     /* In constant time, subtract b from a putting result in r. */
> > +@@ -17458,7 +17459,7 @@ static int _sp_mont_red(sp_int* a, const sp_in=
t* m, sp_int_digit mp, int ct)
> > +         /* 1. mask =3D (1 << (NumBits(m) % WORD_SIZE)) - 1
> > +          *    Mask when last digit of modulus doesn't have highest bi=
t set.
> > +          */
> > +-        sp_int_digit mask =3D (sp_int_digit)
> > ++        volatile sp_int_digit mask =3D (sp_int_digit)
> > +             (((sp_int_digit)1 << (bits & (SP_WORD_SIZE - 1))) - 1);
> > +         /* Overflow. */
> > +         sp_int_word o =3D 0;
> > +@@ -17539,7 +17540,7 @@ static int _sp_mont_red(sp_int* a, const sp_in=
t* m, sp_int_digit mp, int ct)
> > +     int bits;
> > +     sp_int_digit mu;
> > +     sp_int_digit o;
> > +-    sp_int_digit mask;
> > ++    volatile sp_int_digit mask;
> > +
> > + #if 0
> > +     sp_print(a, "a");
> > +@@ -18041,7 +18042,7 @@ int sp_unsigned_bin_size(const sp_int* a)
> > +     int cnt =3D 0;
> > +
> > +     if (a !=3D NULL) {
> > +-        cnt =3D (sp_count_bits(a) + 7) / 8;
> > ++        cnt =3D (sp_count_bits(a) + 7) >> 3;
> > +     }
> > +
> > +     return cnt;
> > +@@ -18265,20 +18266,22 @@ int sp_to_unsigned_bin_len_ct(const sp_int* =
a, byte* out, int outSz)
> > +         /* Start at the end of the buffer - least significant byte. *=
/
> > +         int j;
> > +         unsigned int i;
> > +-        sp_int_digit mask =3D (sp_int_digit)-1;
> > ++        volatile sp_int_digit mask =3D (sp_int_digit)-1;
> > +         sp_int_digit d;
> > +
> > +         /* Put each digit in. */
> > +         i =3D 0;
> > +         for (j =3D outSz - 1; j >=3D 0; ) {
> > +             unsigned int b;
> > ++            volatile unsigned int notFull =3D (i < (unsigned int)a->u=
sed - 1);
> > ++
> > +             d =3D a->dp[i];
> > +             /* Place each byte of a digit into the buffer. */
> > +             for (b =3D 0; (j >=3D 0) && (b < SP_WORD_SIZEOF); b++) {
> > +                 out[j--] =3D (byte)(d & mask);
> > +                 d >>=3D 8;
> > +             }
> > +-            mask &=3D (sp_int_digit)0 - (i < (unsigned int)a->used - =
1);
> > ++            mask &=3D (sp_int_digit)0 - notFull;
> > +             i +=3D (unsigned int)(1 & mask);
> > +         }
> > +     }
> > +@@ -18289,7 +18292,7 @@ int sp_to_unsigned_bin_len_ct(const sp_int* a,=
 byte* out, int outSz)
> > +     if (err =3D=3D MP_OKAY) {
> > +         unsigned int i;
> > +         int j;
> > +-        sp_int_digit mask =3D (sp_int_digit)-1;
> > ++        volatile sp_int_digit mask =3D (sp_int_digit)-1;
> > +
> > +         i =3D 0;
> > +         for (j =3D outSz - 1; j >=3D 0; j--) {
> > +@@ -18360,11 +18363,12 @@ static int _sp_read_radix_16(sp_int* a, cons=
t char* in)
> > +     /* Step through string a character at a time starting at end - le=
ast
> > +      * significant byte. */
> > +     for (i =3D (int)(XSTRLEN(in) - 1); i >=3D 0; i--) {
> > ++        volatile char c =3D in[i];
> > +         /* Convert character from hex. */
> > +-        int ch =3D (int)HexCharToByte(in[i]);
> > ++        int ch =3D (int)HexCharToByte(c);
> > +         /* Check for invalid character. */
> > +         if (ch < 0) {
> > +-            if (!eol_done && CharIsWhiteSpace(in[i]))
> > ++            if (!eol_done && CharIsWhiteSpace(c))
> > +                 continue;
> > +             err =3D MP_VAL;
> > +             break;
> > +@@ -18424,7 +18428,6 @@ static int _sp_read_radix_10(sp_int* a, const =
char* in)
> > + {
> > +     int  err =3D MP_OKAY;
> > +     int  i;
> > +-    char ch;
> > +
> > +     /* Start with a being zero. */
> > +     _sp_zero(a);
> > +@@ -18432,7 +18435,7 @@ static int _sp_read_radix_10(sp_int* a, const =
char* in)
> > +     /* Process all characters. */
> > +     for (i =3D 0; in[i] !=3D '\0'; i++) {
> > +         /* Get character. */
> > +-        ch =3D in[i];
> > ++        volatile char ch =3D in[i];
> > +         /* Check character is valid. */
> > +         if ((ch >=3D '0') && (ch <=3D '9')) {
> > +             /* Assume '0'..'9' are continuous values as characters. *=
/
> > +@@ -18794,7 +18797,7 @@ int sp_radix_size(const sp_int* a, int radix, =
int* size)
> > +         }
> > +         else {
> > +             /* Count of nibbles. */
> > +-            int cnt =3D (sp_count_bits(a) + 3) / 4;
> > ++            int cnt =3D (sp_count_bits(a) + 3) >> 2;
> > +         #ifndef WC_DISABLE_RADIX_ZERO_PAD
> > +             /* Must have even number of nibbles to have complete byte=
s. */
> > +             if (cnt & 1) {
> > +@@ -19404,7 +19407,7 @@ static int _sp_prime_random_trials(const sp_in=
t* a, int trials, int* result,
> > + {
> > +     int err =3D MP_OKAY;
> > +     int bits =3D sp_count_bits(a);
> > +-    word32 baseSz =3D ((word32)bits + 7) / 8;
> > ++    word32 baseSz =3D ((word32)bits + 7) >> 3;
> > +     DECL_SP_INT_ARRAY(ds, a->used + 1, 2);
> > +     DECL_SP_INT_ARRAY(d, a->used * 2 + 1, 2);
> > +
> > diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0=
.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
> > index af591cfd7a..9cd7c07ad2 100644
> > --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
> > +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
> > @@ -16,6 +16,7 @@ SRC_URI =3D " \
> >      git://github.com/wolfSSL/wolfssl.git;protocol=3Dhttps;branch=3Dmas=
ter \
> >      file://0001-wolfssl-wolfcrypt-logging.h-and-wolfcrypt-src-loggin.p=
atch \
> >      file://run-ptest \
> > +    file://CVE-2025-13912.patch \
> >  "
> >
> >  SRCREV =3D "b077c81eb635392e694ccedbab8b644297ec0285"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#124586): https://lists.openembedded.org/g/openembed=
ded-devel/message/124586
> > Mute This Topic: https://lists.openembedded.org/mt/117981422/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

