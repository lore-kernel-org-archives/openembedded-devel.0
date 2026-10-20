Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.395.1792525955773558398
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 12:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c3vIlI9d;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-706113e92f9so1388924eaf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:52:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792525955; cv=none;
        d=google.com; s=arc-20260327;
        b=f4rNxqge5SFmx3EyKHy0tk0Y2RZ6UFzIJ2e+fcFYw9DsXccCbm2auL1DzVA5s83+By
         mBZW5StvA0dYib53wA6bDSSRJksGrOb8Yy1JHSZ4ZHlChEHmSFbUW1qPIgaMen9DhU/M
         CCpMMK05TAMoo1bzL/dQAO9/8qN2hhwq6l10GxnnH//gW2S778uWvUbirQ8rVh8vqy2a
         jhHkb5kdFoLrCOEC4s/9ZJJAcE/ffD8C2v0VPG/sVe3FltxUMYTSF7w7jCRu3RkmK+kI
         np0s0u+r2ydDwCI65dbccasu2FxLpIOZgR2PNnigTI2T3JNxPYeY8/bFQd8Q97/VctDb
         tv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5nYl9nbe9Orv0Iy3ElPx+c2fHQAiImv1b79tAMO//o4=;
        fh=lc38uD/ABs1TT8wGNS0K6wk9apQbnJM74I/KZ7/mCC0=;
        b=ftsqk3i5AmtDQj5p8QeffroM2dBMje1YHDF/0BpKgGz4QT1ARWMs7S3TNCi8q9zgEy
         lonqz+zTOCWv5N3aKx6yKM+d1jOUJQ+qRyYrydff9SkQY2CpwyZWpP89u9vGJhlDjn9+
         jRboos1YVdv8njuFzvyytiVgiJLykaXuY0M2+l1gfjyZaAWPoeexbv4VnPQXOhPEzZ3H
         EyyJQEsEInG41zd/TKsnoltqlXLyLytihqr1ciL/etCYLpGftPb3N5Ye0wfxYmF6Msvi
         R+s4UJ7gpTC1Q4pZRBJTjHw/Iu8R5QJC5zvRw7kMBHDOZMcHCPDPpq5Z3bN6szRxDmwn
         aaiA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792525955; x=1793130755; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5nYl9nbe9Orv0Iy3ElPx+c2fHQAiImv1b79tAMO//o4=;
        b=c3vIlI9dxw0nvYj+SddX/BJd3FK3Iwzh1Y0Sh9WRaFixniW4zIYI/fUBGehxVYge2l
         gGJNKvlhxmPSNZGe20qZbPk/iUS+bXiW7+W1isSr+qXPxgaU2WQpM5MvKGKWMxdqug3X
         bo2UiU9T7y5u5ou/Az/UiWyGR1z/Awk4HGn/WjryVp26ZhclO3sQj+671J8+BTaDfqZ8
         wK2GIGfEYoNFQ3ERVhX/NjF6hyrtVjZxYtV9u46IuG5NpiL/YNmjNjKSKl63M1nOvVrZ
         weEwmQf29gF4MqD0GYVD9U0LBFQWjMXxKwzc1v+ChuSf7ARdGZVbG14GReRtz4sCpFm1
         lh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792525955; x=1793130755;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5nYl9nbe9Orv0Iy3ElPx+c2fHQAiImv1b79tAMO//o4=;
        b=URS+BFB82jpJ28cAJloPjWiiVby5H88C3YkqlwNrQUQ+lHrAFGaYcqp5DHArSmVfLV
         Hb3NDc08n3tIpU8nfQbgoXxWoCBvOCv5uImEJL/h2ffpMEkgNs4E5q0T+uDA6hsYOw5T
         x6Ne7ZptvNCz9oU9IAXwQ7bzfFuTFapWh1vp+qxBfwRjgbbgN9tvmBWQlC4nvqZJJqND
         v55ZV43QbkMi7Yblym1xG8O94Bm1/I0kL+Jr8zy2ZRSMesiDMmkZ5gUssYEaYetYzo+P
         kdvEMpW9dOKLNhdOSwM5TPRIIeDH0jyz1IpFTLiim4nEXrK+SQTk9ZZUBNiXZAE9JYse
         u2qQ==
X-Gm-Message-State: AFq9FYLpKa7dlDA0iShk1gE+/YkwM95UQmtC3/ePZNblA3Wb7+RRZ87p
	lkhkWOhmtdxYw6FA/LTjNPL2ClcDy7h/m/VWtMioi1FDobAkEesg8GWkSFqf1POI62P2i800W1O
	0m3mUvu7cf+LDoRn6inzDpWsq/pdVkNJjphTX
X-Gm-Gg: AYBFou2Cm7JPdfth1202mXPjd2LnklrXfz19hY4B2SrbplbisvBltoCw3PLKN922caX
	Sz6F9JmcA4zTBAfxQlN1Ztuq58WwZPhIWZh+2LvRutbC+9hxbxhyPL42Dr+5LrEOFXCr52ZHPAM
	7IEI84Vp4EpF/foUmbjkT7dMb4MinNhfyMmG/d4vhMdbXAaucMU7xcgy4q7wEmRra3xmRl0ctT3
	u0mcHbSZ1J0EHKpcmC5mfm7j09j5WYWKWm06uxTUACj+hRhlLZQ0a4weaNu8FEIXWiOgBPq9bAd
	Gn8zPT2IM4tB2hIPFNQ90La53r7fTvR1X+JX/V7j/10a9td6FuaXt5spgb1oF2zXJSGIag==
X-Received: by 2002:a05:6820:1c91:b0:708:b419:4889 with SMTP id
 006d021491bc7-708b419541amr1198368eaf.7.1792525954684; Tue, 20 Oct 2026
 12:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20261020134852.1679078-1-niko.mauno@vaisala.com>
In-Reply-To: <20261020134852.1679078-1-niko.mauno@vaisala.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 21 Oct 2026 08:52:23 +1300
X-Gm-Features: AclHuK9JjwJZFqb7bkupIjBGqIH-Q0vpNotf1PSTYHhML3SNsX9Eqk_MBRW_wTA
Message-ID: <CADySD0H_MkUebPR1yWPH3tdUTWZZFzfKGOabKEwJtx_o4TnJ_Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] pkcs11-provider: upgrade 1.2 -> 1.3
To: niko.mauno@vaisala.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 19:52:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131178

On Wed, Oct 21, 2026 at 2:49=E2=80=AFAM Niko Mauno via lists.openembedded.o=
rg
<niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:
>
> Changelog: https://github.com/openssl-projects/pkcs11-provider/releases/t=
ag/v1.3.0
>
> Here we also drop patch which is now incorporated in the new version,
> and align the SRC_URI and HOMEPAGE to match the updated GitHub
> organization for the component.
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  ...-Fix-i686-build-failures-in-cipher.c.patch | 62 -------------------
>  ...provider_1.2.bb =3D> pkcs11-provider_1.3.bb} |  8 +--
>  2 files changed, 3 insertions(+), 67 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/pkcs11-provider/files/0001-Fi=
x-i686-build-failures-in-cipher.c.patch
>  rename meta-oe/recipes-support/pkcs11-provider/{pkcs11-provider_1.2.bb =
=3D> pkcs11-provider_1.3.bb} (73%)
>
> diff --git a/meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-i686-=
build-failures-in-cipher.c.patch b/meta-oe/recipes-support/pkcs11-provider/=
files/0001-Fix-i686-build-failures-in-cipher.c.patch
> deleted file mode 100644
> index 479608b8f3..0000000000
> --- a/meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-i686-build-f=
ailures-in-cipher.c.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From aec4fe7e3c4d18cd5d0f98168df5884a141c6b69 Mon Sep 17 00:00:00 2001
> -From: Simo Sorce <simo@redhat.com>
> -Date: Thu, 19 Feb 2026 16:08:56 -0500
> -Subject: [PATCH] Fix i686 build failures in cipher.c
> -
> -Update AEAD functions to use CK_ULONG pointers for lengths and
> -introduce a temporary size_t variable for OSSL_PARAM calls. This
> -corrects pointer type mismatches that caused build failures in
> -Fedora Rawhide i686 scratch builds.
> -
> -Upstream-Status: Backport [aec4fe7e3c4d18cd5d0f98168df5884a141c6b69]
> -
> -Signed-off-by: Simo Sorce <simo@redhat.com>
> ----
> - src/cipher.c | 11 ++++++-----
> - 1 file changed, 6 insertions(+), 5 deletions(-)
> -
> -diff --git a/src/cipher.c b/src/cipher.c
> -index faaa51b..4ccd3ad 100644
> ---- a/src/cipher.c
> -+++ b/src/cipher.c
> -@@ -867,7 +867,7 @@ static CK_RV tls_aead_get_data(CK_MECHANISM_PTR mech=
, data_buffer *explicitiv,
> -
> - static CK_RV tls_pre_aead(struct p11prov_cipher_ctx *cctx,
> -                           const unsigned char **in, size_t *inl,
> --                          unsigned char **out, size_t *outl)
> -+                          unsigned char **out, CK_ULONG *outl)
> - {
> -     data_buffer iv =3D { 0 };
> -     data_buffer tag =3D { 0 };
> -@@ -906,7 +906,7 @@ static CK_RV tls_pre_aead(struct p11prov_cipher_ctx =
*cctx,
> - }
> -
> - static CK_RV tls_post_aead(struct p11prov_cipher_ctx *cctx, unsigned ch=
ar *out,
> --                           size_t *outl)
> -+                           CK_ULONG *outl)
> - {
> -     data_buffer explicitiv =3D { 0 };
> -     data_buffer tag =3D { 0 };
> -@@ -1475,15 +1475,16 @@ static int p11prov_common_set_ctx_params(void *v=
ctx, const OSSL_PARAM params[])
> -                 return RET_OSSL_ERR;
> -             }
> -
> --            int ret =3D OSSL_PARAM_get_octet_string(
> --                p, (void **)&gcm->pIv, gcm->ulIvLen, &gcm->ulIvFixedBit=
s);
> -+            size_t iv_size;
> -+            int ret =3D OSSL_PARAM_get_octet_string(p, (void **)&gcm->p=
Iv,
> -+                                                  gcm->ulIvLen, &iv_siz=
e);
> -             if (ret !=3D RET_OSSL_OK || gcm->pIv =3D=3D NULL) {
> -                 P11PROV_raise(ctx->provctx, CKR_HOST_MEMORY,
> -                               "Memory allocation failed");
> -                 return RET_OSSL_ERR;
> -             }
> -
> --            gcm->ulIvFixedBits =3D BYTES_TO_BITS(gcm->ulIvFixedBits);
> -+            gcm->ulIvFixedBits =3D BYTES_TO_BITS(iv_size);
> -             gcm->ivGenerator =3D CKG_GENERATE_COUNTER;
> -         } else {
> -             P11PROV_raise(ctx->provctx, CKR_MECHANISM_PARAM_INVALID,
> ---
> -2.47.3
> -
> diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.=
bb b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.bb
> similarity index 73%
> rename from meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.b=
b
> rename to meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.bb
> index d95706d9e3..f7936d3756 100644
> --- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb
> +++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.bb

Upstream is now using major.minor.patch scheme, I think we should
rename it as "pkcs11-provider_1.3.0.bb"
> @@ -6,7 +6,7 @@ the PKCS#11 Cryptographic Token Interface\
>  This code targets version 3.1 of the interface but should be backwards \
>  compatible to previous versions as well.\
>  "
> -HOMEPAGE =3D "https://github.com/latchset/pkcs11-provider"
> +HOMEPAGE =3D "https://github.com/openssl-projects/pkcs11-provider"
>  SECTION =3D "libs"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db53b787444a60266932bd270d1cf2=
d45"
> @@ -15,11 +15,9 @@ DEPENDS =3D "\
>      p11-kit \
>  "
>
> -SRCREV =3D "c7a5c8b62a0ff012b16574f01651254ef7e664ee"
> +SRCREV =3D "b55b94344af87a058fd84d6e15390760a5585b1d"
>
> -SRC_URI =3D "git://github.com/latchset/${BPN}.git;branch=3Dmain;protocol=
=3Dhttps"
> -
> -SRC_URI +=3D "file://0001-Fix-i686-build-failures-in-cipher.c.patch"
> +SRC_URI =3D "git://github.com/openssl-projects/${BPN}.git;branch=3Dmain;=
protocol=3Dhttps"

And if agree to rename, then can please also include tag=3Dv${PV} in the SR=
C_URI
>
>  inherit meson pkgconfig
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131174): https://lists.openembedded.org/g/openembedde=
d-devel/message/131174
> Mute This Topic: https://lists.openembedded.org/mt/121849116/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
