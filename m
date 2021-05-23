Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.8456.1621762831592814331
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 May 2021 02:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vV3B1l+Q;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 29so6780533pgu.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 May 2021 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Fsb8Hc8Ebkb053kEMVkFagOFn8oY1FFWcS5Rasamj5k=;
        b=vV3B1l+QS85OVqn2i75RpQAKHkh4vE08IgFExL+8gxBHbNyAwFBjce0LB9HFvBh6+b
         X2TL0n075z0AjQo2Hg7gFHGZvBh3ApKON+V2HGNW/n0Jg6ix4ZoImqoyWIm/EMZRfKUv
         J6WRSTvqVfB1QN9gXrdlVZQQbV5ZnrKxmStSP3e26sbYJ6kJThqDFgUFgRBFKkOAcBiN
         gzYqXwzC04hde9zFAgB2yRPJ4geWp5xUXnfLZbLuX3/mksC6g6nAmQnqNtir/BwL88q6
         /78E78VKTD4YlT0ZgI4qLnbbPTrse5DFLkrNbMQdk1RoE3A+9lZ3H1JjGVHOR5Y0ylNY
         x4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Fsb8Hc8Ebkb053kEMVkFagOFn8oY1FFWcS5Rasamj5k=;
        b=trR4318eAu3gks+efBqVZwUtIJ2910CWJ1/PVoQ/7Bx6mlKs9TBbhmvx36zg3Tpx9O
         mqaKnhrd+Yp7KHSRHoUW9rjWHLANI+RK4tfo3IfhV1ypdQOzYLYHXpj2iv5Nc4uf8/LE
         /9EZd1dXtObpQtnHcvKSZIloww0uMh3gMBKiAXSftclE/RgciyBxWzu9MQEWUANRGgX4
         2CZzGOR8/2mKCl5mZmiEGU06wNUAxu9f7KaH4wY8RQi+Hu5sejzeKZR5TSBQb3V4zry7
         Cec/3fy3UolmYGN+S+EQvRRUKDXQZgbMVxbOSO5ooL3tcPEjUrjg/obJMqJMKA2tvaQg
         ejPg==
X-Gm-Message-State: AOAM531wT4ixajWj4gHrsMKO62XkxhcbMxzxW4WqxWdMsFRLKO9zdeLf
	RR/tge5XhtY2nBxp7Iy5mXqiyWgHKcm0I5o53XM=
X-Google-Smtp-Source: ABdhPJzFsiKAkHCFhjjgKyd9tldDI0VtsHN3NlBV0Ns33ZwcqoSKd4gFEpaHpRIYdMRjjy1iig6TxZ1IGDzCAqAjB0k=
X-Received: by 2002:a62:3344:0:b029:28c:6f0f:cb90 with SMTP id
 z65-20020a6233440000b029028c6f0fcb90mr18537855pfz.58.1621762831094; Sun, 23
 May 2021 02:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <1681A89D284BA877.10560@lists.openembedded.org>
In-Reply-To: <1681A89D284BA877.10560@lists.openembedded.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sun, 23 May 2021 11:40:20 +0200
Message-ID: <CALbNGRT+0oM0BThrAO+vd21z0aVHRbYAdqyEK+t3wpGO6fDHOQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] giflib: upgrade 5.1.4 -> 5.2.1
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Forgot to mention: This is V3
On Sun, May 23, 2021 at 11:39 AM Andreas M=C3=BCller via
lists.openembedded.org
<schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
>
> * Project removed autotools configuration files. It is now a pure Makefi=
le
>   build so autotools are not required any more
> * Checked sources: Back ported CVE-patch can go
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../giflib/files/CVE-2019-15133.patch         | 23 -------------------
>  .../{giflib_5.1.4.bb =3D> giflib_5.2.1.bb}      | 18 +++++++--------
>  2 files changed, 9 insertions(+), 32 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2019-15133=
.patch
>  rename meta-oe/recipes-devtools/giflib/{giflib_5.1.4.bb =3D> giflib_5.2=
.1.bb} (52%)
>
> diff --git a/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch =
b/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
> deleted file mode 100644
> index 9957be82f..000000000
> --- a/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -From 799eb6a3af8a3dd81e2429bf11a72a57e541f908 Mon Sep 17 00:00:00 2001
> -From: "Eric S. Raymond" <esr@thyrsus.com>
> -Date: Sun, 17 Mar 2019 12:37:21 -0400
> -Subject: [PATCH] Address SF bug #119: MemorySanitizer: FPE on unknown a=
ddress
> -
> ----
> - dgif_lib.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Upstream-status: Backport [https://sourceforge.net/p/giflib/code/ci/799=
eb6a3af8a3dd81e2429bf11a72a57e541f908/]
> -CVE: CVE-2019-15133
> -
> ---- a/lib/dgif_lib.c   2021-01-13 19:28:18.923493586 +0100
> -+++ b/lib/dgif_lib.c   2021-01-13 19:28:55.245863085 +0100
> -@@ -1099,7 +1099,7 @@ DGifSlurp(GifFileType *GifFile)
> -
> -               sp =3D &GifFile->SavedImages[GifFile->ImageCount - 1];
> -               /* Allocate memory for the image */
> --              if (sp->ImageDesc.Width < 0 && sp->ImageDesc.Height < 0 =
&&
> -+              if (sp->ImageDesc.Width <=3D 0 && sp->ImageDesc.Height <=
=
=3D 0 &&
> -                       sp->ImageDesc.Width > (INT_MAX / sp->ImageDesc.H=
eight)) {
> -                   return GIF_ERROR;
> -               }
> diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb b/meta-oe/r=
ecipes-devtools/giflib/giflib_5.2.1.bb
> similarity index 52%
> rename from meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> rename to meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
> index 1871bab46..105c53eab 100644
> --- a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> +++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
> @@ -3,14 +3,17 @@ SECTION =3D "libs"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dae11c61b04b2917be39b11f78d71=
519a"
>
> -SRC_URI =3D " \
> -    ${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2 \
> -    file://CVE-2019-15133.patch \
> -"
> -
>  CVE_PRODUCT =3D "giflib_project:giflib"
>
> -inherit autotools
> +DEPENDS =3D "xmlto-native"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz"
> +SRC_URI[sha256sum] =3D "31da5562f44c5f15d63340a09a4fd62b48c45620cd302f7=
7a6d9acf0077879bd"
> +
> +do_install() {
> +    # using autotools's default will end up in /usr/local
> +    oe_runmake DESTDIR=3D${D} PREFIX=3D${prefix} LIBDIR=3D${libdir} ins=
tall
> +}
>
>  PACKAGES +=3D "${PN}-utils"
>  FILES_${PN} =3D "${libdir}/libgif.so.*"
> @@ -19,6 +22,3 @@ FILES_${PN}-utils =3D "${bindir}"
>  BBCLASSEXTEND =3D "native"
>
>  RDEPENDS_${PN}-utils =3D "perl"
> -
> -SRC_URI[md5sum] =3D "2c171ced93c0e83bb09e6ccad8e3ba2b"
> -SRC_URI[sha256sum] =3D "df27ec3ff24671f80b29e6ab1c4971059c14ac3db954068=
84fc26574631ba8d5"
> --
> 2.31.1
>
>
>=20
>
