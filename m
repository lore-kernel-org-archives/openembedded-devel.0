Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.708.1631556589704136307
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Sep 2021 11:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ZbajzsA4;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1631556590;
  x=1663092590;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=F/6ILLXTxfj7pOUsaI42s2NJU3u/wHGJm4vVHtWJ3Gs=;
  b=ZbajzsA4QiOE/5wb4pfvPXhfBYp2UbuJ/ftrszGjMkZLuL8johGR7Xx7
   VE9p/G1VlwG3GyecWiG4xhTnuRn1fEgPxzyQuAmcwQvAk/YcOvKsdHbEj
   AkNflrHROpdc7vj1Z3bp5J7mJ6fhGQDBRTd3kVmWm+HmSnYi3K4ymKYz7
   N826ZkzNKDECobhjz0dmGkmeR1+1k0FaekRiKog9kKl19+u2IHNRMUS+v
   u7ELY7oIBp51s035dbMLEE0GU/4DS86GcluDbjdOko1PIPkkYeAVjMzn0
   PRUI5zjjFIScTd5wi+YaWxQjcaPYpxq5rmYLYRj4oP4TBqUNRJbnnZXv0
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: zhengruoqin <zhengrq.fnst@fujitsu.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe] [PATCH] libeigen: upgrade 3.3.9 -> 3.4.0
Thread-Topic: [oe] [meta-oe] [PATCH] libeigen: upgrade 3.3.9 -> 3.4.0
Thread-Index: AQHXpWEeh4Bzu6kwa0Wwg1KBT3ueLKuiSPzQ
Date: Mon, 13 Sep 2021 18:09:46 +0000
Message-ID: <7b01841ee67d4ba7a31ed593003c7f22@axis.com>
References: <1631084878-101207-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1631084878-101207-1-git-send-email-zhengrq.fnst@fujitsu.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Just a heads up: if you build code that uses this version of libeigen=20
for aarch64 (and maybe arm?) and have -Werror and -Wall enabled, there=20
is a good chance your build will fail. I have reported it upstream here:=20
https://gitlab.com/libeigen/eigen/-/issues/2326
Using version 3.3.9 is fine.

//Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of zhengruoqin
> Sent: den 8 september 2021 09:08
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe] [PATCH] libeigen: upgrade 3.3.9 -> 3.4.0
>=20
> -License-Update: Delete empty lines.
>=20
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  .../libeigen/{libeigen_3.3.9.bb =3D> libeigen_3.4.0.bb}       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/libeigen/{libeigen_3.3.9.bb =3D>
> libeigen_3.4.0.bb} (80%)
>=20
> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb b/meta-
> oe/recipes-support/libeigen/libeigen_3.4.0.bb
> similarity index 80%
> rename from meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb
> rename to meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
> index 8ce26ff632..54b6f74d8c 100644
> --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb
> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
> @@ -3,15 +3,15 @@ AUTHOR =3D "Beno=C3=AEt Jacob and Ga=C3=ABl Guennebaud =
and others"
>  HOMEPAGE =3D "http://eigen.tuxfamily.org/"
>  LICENSE =3D "MPL-2.0 & Apache-2.0 & BSD-3-Clause & GPLv3 & LGPLv2.1 &
> MINPACK"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING.MPL2;md5=3D815ca599c9df247a0c7f619bab123dad \
> -
> file://COPYING.BSD;md5=3D543367b8e11f07d353ef894f71b574a0 \
> +
> file://COPYING.BSD;md5=3D2dd0510ee95e59ca28834b875bc96596 \
>=20
> file://COPYING.GPL;md5=3Dd32239bcb673463ab874e80d47fae504 \
>=20
> file://COPYING.LGPL;md5=3D4fbd65380cdd255951079008b364516c \
> -
> file://COPYING.MINPACK;md5=3D5fe4603e80ef7390306f51ef74449bbd \
> +
> file://COPYING.MINPACK;md5=3D71d91b0f75ce79a75d3108a72bef8116 \
>  "
>=20
>  SRC_URI =3D "git://gitlab.com/libeigen/eigen.git;protocol=3Dhttp;nobranc=
h=3D1"
>=20
> -SRCREV =3D "0fd6b4f71dd85b2009ee4d1aeb296e2c11fc9d68"
> +SRCREV =3D "3147391d946bb4b6c68edd901f2add6ac1f31f8c"
>=20
>  S =3D "${WORKDIR}/git"
>=20
> --
> 2.25.1

