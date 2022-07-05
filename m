Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0002FC43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 19:34:50 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.88350.1657049689291414459
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jul 2022 12:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OQW+H8Aw;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1657049689;
  x=1688585689;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7Cr3HWYjx2KI1pc16U9pgCWYQ3gdJv4uvv1hN5zlTZY=;
  b=OQW+H8Awu1hT7JC8jMqTpQungmCVinTuTVcadLRyZZL7+Lg/mNOd+eOb
   f/5k/pPrlE79Rd1YroLWYxnq+oKFZzaYZRdNRompYi79/E+0vpAYZzNPc
   w9W0vE1WR5eekWyTiY5nD9fNxGEsYeci0PGeNvz/hr6Cb7F2IlWY4oBTG
   9nZSEGmpXt2DqqKoEl2uZjvB3KoygFbbZZ+Eod5I6j/YhSt5CCsf3i0TE
   H3t7zDyhSEkQJTedito12NBdwJQ5ATlOlZqBkx5wp6/+YtpY/mfCPelN8
   sJ+qIc8rsQq2/25umXYrK8qN+l/1AUVtuTPj8zpRVPOvuISub7oTz/Mjk
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] cryptsetup: Add support for building
 without SSH tokens
Thread-Topic: [oe] [meta-oe][PATCH] cryptsetup: Add support for building
 without SSH tokens
Thread-Index: AQHYe2Vaqa//iELw9ke2BLd7SUzIva1wVSHg
Date: Tue, 5 Jul 2022 19:34:46 +0000
Message-ID: <c4a80ced5ef343ed85b315389f5d9650@axis.com>
References: <16F6B88B2671EBED.5223@lists.openembedded.org>
In-Reply-To: <16F6B88B2671EBED.5223@lists.openembedded.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 19:34:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97718

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 8 juni 2022 20:27
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] cryptsetup: Add support for building witho=
ut SSH tokens

This is now on master. Please backport it to Kirkstone.

//Peter

>=20
> Cryptsetup SSH tokens is the only feature that has a dependency on
> libssh. Add a packageconfig to control this dependency.
>=20
> Change-Id: Iac4f91e099ad2e3a79aab183734108f8bfbff57f
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  .../recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb    | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb b/meta=
-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
> index 435b55477..652fd6661 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
> @@ -14,7 +14,6 @@ DEPENDS =3D " \
>      libdevmapper \
>      popt \
>      util-linux-libuuid \
> -    libssh \
>  "
>=20
>  DEPENDS:append:libc-musl =3D " argp-standalone"
> @@ -39,6 +38,7 @@ PACKAGECONFIG ??=3D " \
>      blkid \
>      luks-adjust-xts-keysize \
>      openssl \
> +    ssh-token \
>  "
>  PACKAGECONFIG:append:class-target =3D " \
>      udev \
> @@ -69,7 +69,7 @@ PACKAGECONFIG[nss] =3D "--with-crypto_backend=3Dnss,,ns=
s"
>  PACKAGECONFIG[kernel] =3D "--with-crypto_backend=3Dkernel"
>  PACKAGECONFIG[nettle] =3D "--with-crypto_backend=3Dnettle,,nettle"
>  PACKAGECONFIG[luks2] =3D "--with-default-luks-format=3DLUKS2,--with-defa=
ult-luks-format=3DLUKS1"
> -
> +PACKAGECONFIG[ssh-token] =3D "--enable-ssh-token,--disable-ssh-token,lib=
ssh"
>=20
>  EXTRA_OECONF =3D "--enable-static"
>  # Building without largefile is not supported by upstream
> @@ -90,6 +90,14 @@ EXTRA_OECONF +=3D "--with-luks2-pbkdf=3D${LUKS2_PBKDF}=
 \
>      --with-luks2-parallel-threads=3D${LUKS2_PARALLEL_THREADS} \
>      --with-luks2-iter-time=3D${LUKS2_ITERTIME}"
>=20
> +do_install:append() {
> +    # The /usr/lib/cryptsetup directory is always created, even when ssh=
-token
> +    # is disabled. In that case it is empty and causes a packaging error=
. Since
> +    # there is no reason to distribute the empty directory, the easiest =
solution
> +    # is to remove it if it is empty.
> +    rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/${BPN}
> +}
> +
>  FILES:${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES','systemd','${ex=
ec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
>=20
>  RDEPENDS:${PN} =3D " \

