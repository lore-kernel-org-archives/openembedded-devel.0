Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 28A1465C78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 09:02:25 +0000 (UTC)
Received: by wichy4 with SMTP id hy4so73138562wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=0xsLxfdB4s2xm/b17oKiXEzUS6F6ZvJwt5n3SjXiSJg=;
	b=zWY4gHjg0mfsM4T7jG4L8EiXpeukz7b4/sBe3rxoBtN9AC2R0qfr81Kd0PV6iDVCsX
	1z9OfTpoRw+19DkAeo/YiPCMGPu3jfRC7rpMhFrr2+fL/W+cfsp6TLT4cEYw0scMzhPC
	FCRXPVhW8c3GxYkX9SVh+rkjQD80lTwTH2kDzVLT0MRSfsiUQjk170zfsfm/5fDPl2pi
	3LTGgVdXvc10FhiRvq6wfyDYk/iRwWM5qs9FfJ42dDEyVZeLVcUpjosJFC01n4GY82n4
	Da/EdpYhRI4JGfVNIzKxLUmAEkpLg02gvZdYbI5KZ5/jwc6fQYOygg8jkoftdn04WpYe
	Wptg==
MIME-Version: 1.0
X-Received: by 10.180.102.227 with SMTP id fr3mr6638795wib.19.1432630946629;
	Tue, 26 May 2015 02:02:26 -0700 (PDT)
Received: by 10.27.128.68 with HTTP; Tue, 26 May 2015 02:02:26 -0700 (PDT)
In-Reply-To: <1432588449-31413-4-git-send-email-schnitzeltony@googlemail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
	<1432588449-31413-4-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 26 May 2015 11:02:26 +0200
Message-ID: <CAHvQdo2+r3yjapSU2f=dCaOipuaLViCZ5EXNmDt=xVrLfGdZcw@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 03/12] poppler: update 0.33.0 to and enhance packageconfigs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 May 2015 09:02:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

I tried your patch but wasn't able to build poppler-qt5.
The do_configure gives me following log(only part of the log):
...
checking for CAIRO... yes
checking for PDFTOCAIRO... yes
checking for fcntl.h... (cached) yes
checking for sys/mman.h... (cached) yes
checking for sys/stat.h... (cached) yes
checking for POPPLER_GLIB... yes
checking for gobject-introspection... no
checking for glib-mkenums...
/mnt/workspace/yocto_env/poky_fido/poky_ppt30/build/tmp/sysroots/x86_64-lin=
ux/usr/bin/glib-mkenums
checking for gtkdoc-check... no
checking for gtkdoc-rebase... no
checking for gtkdoc-mkpdf... no
checking whether to build gtk-doc documentation... no
checking for POPPLER_QT4... no
checking for POPPLER_QT5... yes
checking for POPPLER_QT5_TEST... yes
checking for arm-poky-linux-gnueabi-moc... no
checking for moc... moc
checking for Qt5 moc... no
checking for arm-poky-linux-gnueabi-moc-qt5... no
checking for moc-qt5... no
checking for Qt5 moc-qt5... checking for arm-poky-linux-gnueabi-qtchooser..=
. no
checking for qtchooser... qtchooser
checking for qtchooser... qtchooser: could not find a Qt installation of 'q=
t5'
not found
...

Have I missed something?
Other qt5 applications build without a problem.

Thx,
Hannes

2015-05-25 23:14 GMT+02:00 Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>:
> qt5 packageconfig fixes:
>
> | WARNING: QA Issue: poppler rdepends on qtbase, but it isn't a build dep=
endency? [build-deps]
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../poppler/{poppler_0.26.5.bb =3D> poppler_0.33.0.bb}             | 9 +=
+++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/poppler/{poppler_0.26.5.bb =3D> poppler_0=
.33.0.bb} (69%)
>
> diff --git a/meta-oe/recipes-support/poppler/poppler_0.26.5.bb b/meta-oe/=
recipes-support/poppler/poppler_0.33.0.bb
> similarity index 69%
> rename from meta-oe/recipes-support/poppler/poppler_0.26.5.bb
> rename to meta-oe/recipes-support/poppler/poppler_0.33.0.bb
> index d119639..6e8446b 100644
> --- a/meta-oe/recipes-support/poppler/poppler_0.26.5.bb
> +++ b/meta-oe/recipes-support/poppler/poppler_0.33.0.bb
> @@ -5,17 +5,20 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa9=
54499f7abaabaa882bbe"
>  SRC_URI =3D " \
>      http://poppler.freedesktop.org/${BP}.tar.xz \
>  "
> -SRC_URI[md5sum] =3D "786c943eee550e3a977c181e7778b1c8"
> -SRC_URI[sha256sum] =3D "de7de5fa337431e5d1f372e8577b3707322f1dbc1dc28a70=
f2927476f134d1ee"
> +SRC_URI[md5sum] =3D "69927d1614d6704021c0b0dd0ee6a852"
> +SRC_URI[sha256sum] =3D "a5fa6d7f7dc5382b48caca82b147c54bdffda02698611af7=
6db5326ba64995a6"
>
>  DEPENDS =3D "fontconfig zlib cairo lcms"
>
>  inherit autotools pkgconfig gtk-doc
>
> -PACKAGECONFIG ??=3D "jpeg png tiff"
> +PACKAGECONFIG ??=3D "jpeg openjpeg png tiff ${@bb.utils.contains('BBFILE=
_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
>  PACKAGECONFIG[jpeg] =3D "--enable-libjpeg,--disable-libjpeg,jpeg"
>  PACKAGECONFIG[png] =3D "--enable-libpng,--disable-libpng,libpng"
>  PACKAGECONFIG[tiff] =3D "--enable-libtiff,--disable-libtiff,tiff"
> +PACKAGECONFIG[curl] =3D "--enable-libcurl,--disable-libcurl,curl"
> +PACKAGECONFIG[openjpeg] =3D "--enable-libopenjpeg=3Dopenjpeg2,--disable-=
libopenjpeg,openjpeg"
> +PACKAGECONFIG[qt5] =3D "--enable-poppler-qt5,--disable-poppler-qt5,qtbas=
e"
>
>  EXTRA_OECONF =3D "\
>      --enable-xpdf-headers \
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

