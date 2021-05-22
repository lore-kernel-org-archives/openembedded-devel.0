Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.6209.1621687702208437897
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 05:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t5MWJOUz;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id e8so8624360qvp.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 05:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vlBTB3TUfEGgM3j6PQKEPPcxDgi4ggd2NpytOT/wbPA=;
        b=t5MWJOUzlIrmg585wuFKa81vbUP/lfYHXNAkT/ILSeUXqP/7ilbeGick7FuzA7IYJ1
         T5758Meir1OeDIvY1He5jTsq7XQgfQBxLQ0ahQx/3VrzAvFG3MAqtmtzliXamc5oKKOY
         gVkxeXwgJT4VaB5LLmC7h0Vk9yrxB2KQTan8YmZD0wYD6jMdRBFyi/t+2F7a4UqB8q8d
         40nu/y/l/IKgYcIiaEeS1MgJw9WOyoscxQn1m6MimmqMiuQhC4BYS0XGdYz9d3PEUzOC
         xpGMn4xmYtu5E0elCFLYoHwVhzPe2C2v2zqNVmbcUfWHgcMBBMNnKby85e8MLhSUZpY2
         AO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vlBTB3TUfEGgM3j6PQKEPPcxDgi4ggd2NpytOT/wbPA=;
        b=NUJd9ZSUfEBibpbKywRAEQxpqtBARLT3Ot4jPuYm9g4BZr6zD5Oi4AjWA8kzpySmaZ
         frpXzNqGhYzUEweFNFgClmeZuTABY2pqRyvzzZh+TDGxd/WgbAIDo0VodjRYEVkaS5lv
         667Kv3h9uTWEXtTdJ5R9hpTXwqAVLOBXiIXWopEra6V08A1Y9bshNseOC2R0K5WIlEQs
         Ro7N0tzLYw+pIylDqFfDzgBEIjhdc7L9Y9tvd9C4MOoyq2Asqlgdf2/pf4Fhz0UauIJc
         jK4E3yBUV/KNsTFk05ehTQZy1EnHswcYF9xwqCsguOY9UkElnrgjOYcnVtFQ+55i4Yd6
         ITGA==
X-Gm-Message-State: AOAM530vNeAB/MbSm03AwMtejSvYgwPp8y2lTIgwzXHxQK7ti4QX18JR
	D5FDFtdTSkA9DLuvbBVWUP8Tsh58J+xde/C2SZs=
X-Google-Smtp-Source: ABdhPJzcqsmqf1TCMIC0TbX6g5SS52HrFgsC8TxiSuTPkuX+Uq2WvifKWiud+FBxruXBe9Hy+/8M1SvVGE+EE6uowzs=
X-Received: by 2002:a05:6214:258d:: with SMTP id fq13mr19226817qvb.50.1621687701302;
 Sat, 22 May 2021 05:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210522082605.16975-1-schnitzeltony@gmail.com>
In-Reply-To: <20210522082605.16975-1-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 22 May 2021 05:47:54 -0700
Message-ID: <CAMKF1spxUhja3kvLhyW_hSLFTXwXoFApC558-un3Sc2xAsdP=g@mail.gmail.com>
Subject: Re: [oe] [PATCH][v2] giflib: upgrade 5.1.4 -> 5.2.1
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 22, 2021 at 1:26 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> * Project removed autotools configuration files. So it is now a pure Mak=
efile
>   build which requires autotools-brokensep

if autotools support is removed then I wonder if using any of
autotools classes is the right thing to do

> * Checked sources: Back ported CVE-patch can go
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
> V2:
> * explain autotool -> -brokensep in commit message
> * add comment in do_install explaining why we tailored it
>  .../giflib/files/CVE-2019-15133.patch         | 23 -------------------
>  .../{giflib_5.1.4.bb =3D> giflib_5.2.1.bb}      | 20 ++++++++--------
>  2 files changed, 11 insertions(+), 32 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2019-15133=
.patch
>  rename meta-oe/recipes-devtools/giflib/{giflib_5.1.4.bb =3D> giflib_5.2=
.1.bb} (50%)
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
> similarity index 50%
> rename from meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> rename to meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
> index 1871bab46..d8757ef58 100644
> --- a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> +++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
> @@ -3,14 +3,19 @@ SECTION =3D "libs"
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
> +inherit autotools-brokensep
> +
> +do_install() {
> +    # using autotools's default will end up in /usr/local
> +    oe_runmake DESTDIR=3D${D} PREFIX=3D${prefix} LIBDIR=3D${libdir} ins=
tall
> +}
>
>  PACKAGES +=3D "${PN}-utils"
>  FILES_${PN} =3D "${libdir}/libgif.so.*"
> @@ -19,6 +24,3 @@ FILES_${PN}-utils =3D "${bindir}"
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
