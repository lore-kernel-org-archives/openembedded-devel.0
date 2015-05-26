Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 10BD46AC12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 16:49:57 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so64933411igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 09:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=0JUHOw+IN1rsldB/z7UOhv2aP+bR/jaebpUBQy5aSKY=;
	b=PExu0LrrvplJb2Po1+XFm04XyT8gXldVZyLFJwMnUlERnhsC+pDhG3G19YU0FEVqZx
	vbG2ZdoFGq6LpKebvpvos3M1S6T9aa8tELUYvPS4D+fKphcDLYIPA/fYoXGUwnhlNDs9
	/j7/t12yBwUlZbCzdiX/mFI9OFVwsFwt+ry0YMbk3FxDSf75mLY6C5RYu2dLb/TVSxY7
	8gMmv82ekHsuGJDhkiM7pURCOC66ZtKU9Fvj9oMPLU43ZRxucS5CfYJ7sxkNNO4A4eXQ
	J4XmOsgT44a6EcePm3wpt35V19Rv7bCNLNrKd8rLnqndxM4pO1wHQyfQVHn3um4XQlVW
	1jww==
X-Received: by 10.50.8.68 with SMTP id p4mr31511979iga.4.1432658998625; Tue,
	26 May 2015 09:49:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Tue, 26 May 2015 09:49:28 -0700 (PDT)
In-Reply-To: <1432588449-31413-13-git-send-email-schnitzeltony@googlemail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
	<1432588449-31413-13-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 May 2015 09:49:28 -0700
Message-ID: <CAMKF1sq9oF9RbBXamXURZ7aJiVS_kgB6ys9Ef6GYt9m5uYENCw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 12/12] imagemagick: update to 6.9.1.3 / add packageconfig for openjpeg
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
X-List-Received-Date: Tue, 26 May 2015 16:49:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2015 at 2:14 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> * openjpeg is new and auto detected by configure

I wonder how many more recipes will auto detect it. Probably a world
build will tell us more.

> * choose tar.xz for download as the size is ~1/5 less
> * checked LICENSE: only one year was changed 2014->2015
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../{imagemagick_6.8.9.bb =3D> imagemagick_6.9.1.bb}            | 11 +++=
+++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-support/imagemagick/{imagemagick_6.8.9.bb =3D> im=
agemagick_6.9.1.bb} (83%)
>
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
> similarity index 83%
> rename from meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
> rename to meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
> index accbbed..e54135b 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
> @@ -1,15 +1,15 @@
>  SUMMARY =3D "ImageMagick is an image convertion tools"
>  SECTION =3D "console/utils"
>  LICENSE =3D "ImageMagick"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d84c6ddd4028aa53d028b4c50f93=
61e"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0887b670be7ef0c3cb37092b64d57=
514"
>  # FIXME: There are many more checked libraries. All should be added or e=
xplicitly disabled to get consistent results.
>  DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freet=
ype"
>
> -PATCHSET =3D "10"
> -SRC_URI =3D "http://www.imagemagick.org/download/releases/ImageMagick-${=
PV}-${PATCHSET}.tar.bz2 \
> +PATCHSET =3D "3"
> +SRC_URI =3D "http://www.imagemagick.org/download/releases/ImageMagick-${=
PV}-${PATCHSET}.tar.xz \
>  "
> -SRC_URI[md5sum] =3D "c4f70046420db9b22d9dfd1c3d179b55"
> -SRC_URI[sha256sum] =3D "4e702c1c3b4632fde2a93af33dcd3d013a9ebfa598060aca=
11f06d80676ecbf4"
> +SRC_URI[md5sum] =3D "1171a6837defe10be288ab44869cc3a0"
> +SRC_URI[sha256sum] =3D "5fd180603e60c624c05c644a8340f4f4e92c19dc3c41d374=
d38f76c69cd48ba3"
>
>  S =3D "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
>
> @@ -23,6 +23,7 @@ CACHED_CONFIGUREVARS =3D "ac_cv_sys_file_offset_bits=3D=
yes"
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[jp2] =3D "--with-jp2,,jasper"
>  PACKAGECONFIG[lzma] =3D "--with-lzma,--without-lzma,xz"
> +PACKAGECONFIG[openjpeg] =3D "--with-openjp2,--without-openjp2,openjpeg"
>  PACKAGECONFIG[pango] =3D "--with-pango,--without-pango,pango cairo"
>  PACKAGECONFIG[webp] =3D "--with-webp,--without-webp,libwebp"
>  PACKAGECONFIG[wmf] =3D "--with-wmf,--without-wmf,libwmf"
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

