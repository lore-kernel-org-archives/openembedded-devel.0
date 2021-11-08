Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04252C433EF
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 10:49:18 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.43269.1636368556870386414
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Nov 2021 02:49:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=AND434RF;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636368557;
  x=1667904557;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=VctF37JnTlepS+1TSkJ0/borFmb/NsuzlxwBn6LDppc=;
  b=AND434RFZGNMjJ3luo7cpdG+NOs1KJXfrNv+LQ+63QElUW6AjYSdVdx3
   WeTMDf3z+WxyrYRt2AGlT/K1wWYJHKAAYKRAoGLfWDvuJWGiuN+XgyESL
   sVD33CV0Napf9z+bZ06gRfGnXTcmcZcw0iZVQDeKhrfdi3gBPYEZs2d2S
   KmrRE8r/ARJzyBD3uPoeLNS49EdpNTZIu+CjfExtJUPo0Y3NDw9iAJK+n
   KfDMZoI5U91MosNM8qu53GzZL0aaZVb4vd+CuL4KyAJ/vk4DUcrxFlxXM
   TPaKzG307FtinB6EK5Vpg7zPDEPgXpXaT2Ceyc2mdPzOEXSTbmKQ+f3g0
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][v2][honister][PATCH] recipes: remove tabs and
 spaces in SRC_URI
Thread-Topic: [oe] [meta-oe][v2][honister][PATCH] recipes: remove tabs and
 spaces in SRC_URI
Thread-Index: AQHX1AbVOLQRbnjViEWM4AAPvXNmsKv5c1og
Date: Mon, 8 Nov 2021 10:49:02 +0000
Message-ID: <ec5893d5ab494da1a019ca1662ad055e@axis.com>
References: <20211107183938.882549-1-akuster808@gmail.com>
In-Reply-To: <20211107183938.882549-1-akuster808@gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Nov 2021 10:49:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93876

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Armin Kuster
> Sent: den 7 november 2021 19:40
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][v2][honister][PATCH] recipes: remove tabs and spa=
ces in SRC_URI
>=20
> Missed tabs and spaces in the SRC_URI during
> 'Update SRC_URI branch and protocols' translation.
>=20
> [V2]
> Fix typo in imagemagick, change "gitk" to "git"

This does not match the change (see below).

>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb         | 2 +-
>  meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
>  meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb                 | 2 +-
>  meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta=
-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> index 6ba58829e3..37d5d81238 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Ddf52c6edb7adc22e533b2bacc3bd3915"
>  PV =3D "20210324.2+git${SRCPV}"
>  SRCREV =3D "278e0a071885a22dcd2fd1b5576cc44757299343"
>  BRANCH =3D "lts_2021_03_24"
> -SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D${BRANCH} ;prot=
ocol=3Dhttps \
> +SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D${BRANCH};proto=
col=3Dhttps \
>             file://0001-absl-always-use-asm-sgidefs.h.patch             \
>             file://0002-Remove-maes-option-from-cross-compilation.patch \
>             file://abseil-ppc-fixes.patch \
> diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.b=
b b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
> index cbc7a9a5eb..2c9e45fce7 100644
> --- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
> +++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
> @@ -3,7 +3,7 @@ LICENSE =3D "GPLv2"
>=20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>=20
> -SRC_URI =3D "git://github.com/ubinux/dnf-plugin-tui.git;branch=3Dmaster =
;protocol=3Dhttps"
> +SRC_URI =3D "git://github.com/ubinux/dnf-plugin-tui.git;branch=3Dmaster;=
protocol=3Dhttps"
>  SRCREV =3D "b0d80b7129f1d84cc563a4098d869e7420bcf4bc"
>  PV =3D "1.3"
>=20
> diff --git a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb b/meta-oe/reci=
pes-devtools/pcimem/pcimem_2.0.bb
> index 688c63d14a..84f6c3ce24 100644
> --- a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
> +++ b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>  COMPATIBLE_HOST =3D "(x86_64|aarch64|arm)"
>=20
>  SRCREV =3D "09724edb1783a98da2b7ae53c5aaa87493aabc9b"
> -SRC_URI =3D "git://github.com/billfarrow/pcimem.git ;branch=3Dmaster;pro=
tocol=3Dhttps"
> +SRC_URI =3D "git://github.com/billfarrow/pcimem.git;branch=3Dmaster;prot=
ocol=3Dhttps"
>=20
>  S =3D "${WORKDIR}/git"
>=20
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/=
meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> index 1b41732ecd..3f2472ba7e 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> @@ -11,7 +11,7 @@ DEPENDS =3D "lcms bzip2 jpeg libpng tiff zlib fftw
> freetype libtool"
>=20
>  BASE_PV :=3D "${PV}"
>  PV .=3D "_25"
> -SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git ;branch=3Dmast=
er;protocol=3Dhttps"
> +SRC_URI =3D "git://github.com/ImageMagick/ImageMagic.git;branch=3Dmaster=
;protocol=3Dhttps"

The correct URL is "git://github.com/ImageMagick/ImageMagick.git" (as=20
it was).

>  SRCREV =3D "8b4e00829eb84d4e7b4da11acf1f98f1e8166e5b"
>=20
>  S =3D "${WORKDIR}/git"
> --
> 2.25.1

//Peter

