Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id F2B5E60D04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 09:34:16 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id ik5so4895026vcb.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 01:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=JBwQbpr5pGucS6862rp9W/FUCKyeuHM7aSfIxXdHuAE=;
	b=V6CwBSJpoUVIIRsBk9WBriIkVCpFONrqQh5lGn0Sk9DHvgHVV005tVi3Xd8dPAkd7p
	XZWnkUVtu0ubc9j22Oe2Cb8VkEEfY3b4zT5tnMf82AXue6ThbHy09g+ASQ8xLHlHchjU
	wTgJk4z9nlgeBCka/iIMCz871Rpc47XZcLhfdPeM6q1R0CTVirdHNkXtq3v6wG4o0XHy
	8FCHvzAVR4RBHWgpUzzcb1cjxaECHGuY/h1UQciq1uV+MAiwqyXP0wfEAFyiZBawlqwZ
	Hq5pikLd2Oc0YXm8rWQDEsra1O38KEaNoGNHLXH/4BTYZoaOY+OLmsknbccwxysDEGx4
	sBKA==
MIME-Version: 1.0
X-Received: by 10.52.120.11 with SMTP id ky11mr6920706vdb.28.1387359257527;
	Wed, 18 Dec 2013 01:34:17 -0800 (PST)
Received: by 10.52.106.202 with HTTP; Wed, 18 Dec 2013 01:34:17 -0800 (PST)
In-Reply-To: <1386407698-24915-1-git-send-email-raj.khem@gmail.com>
References: <1386407698-24915-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 18 Dec 2013 10:34:17 +0100
Message-ID: <CALbNGRT5zpjoRHW3RuUpeMpoCj2AgJpYjrwj4Pp+pwi+imvRUQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gimp: Upgrade 2.8.2 -> 2.8.10
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
X-List-Received-Date: Wed, 18 Dec 2013 09:34:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 7, 2013 at 10:14 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Also fix build with freetype 2.5.1
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-graphics/gimp/gimp/freetype.patch  |   30 ++++++++++++++=
++++++
>  .../gimp/{gimp_2.8.2.bb =3D> gimp_2.8.10.bb}         |    9 ++++--
>  2 files changed, 36 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/gimp/gimp/freetype.patch
>  rename meta-oe/recipes-graphics/gimp/{gimp_2.8.2.bb =3D> gimp_2.8.10.bb}=
 (68%)
>
> diff --git a/meta-oe/recipes-graphics/gimp/gimp/freetype.patch b/meta-oe/=
recipes-graphics/gimp/gimp/freetype.patch
> new file mode 100644
> index 0000000..ed6c097
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/gimp/gimp/freetype.patch
> @@ -0,0 +1,30 @@
> +Include the freetype headers via macros ( recommended way)
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Backport
> +
> +From 6c73f28b6d87a2afd11974552a075bffec52347f Mon Sep 17 00:00:00 2001
> +From: Michael Natterer <mitch@gimp.org>
> +Date: Fri, 29 Nov 2013 20:57:46 +0000
> +Subject: Bug 719560 - Build failure with freetype 2.5.1
> +
> +Apply patch from su-v that fixes the freetype include to
> +the madness devised and recommended by freetype.
> +---
> +diff --git a/app/text/gimpfont.c b/app/text/gimpfont.c
> +index 4045ca9..66c6e52 100644
> +--- a/app/text/gimpfont.c
> ++++ b/app/text/gimpfont.c
> +@@ -28,7 +28,9 @@
> +
> + #define PANGO_ENABLE_ENGINE  1   /* Argh */
> + #include <pango/pango-ot.h>
> +-#include <freetype/tttables.h>
> ++
> ++#include <ft2build.h>
> ++#include FT_TRUETYPE_TABLES_H
> +
> + #include "text-types.h"
> +
> +--
> +cgit v0.9.2
> diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb b/meta-oe/recipe=
s-graphics/gimp/gimp_2.8.10.bb
> similarity index 68%
> rename from meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb
> rename to meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
> index e9bbdcf..c747168 100644
> --- a/meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb
> +++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
> @@ -8,9 +8,11 @@ DEPENDS =3D "babl gdk-pixbuf-native libart-lgpl gtk+ jpe=
g libpng libexif tiff webk
>
>  inherit gnome
>
> -SRC_URI =3D "ftp://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2"
> -SRC_URI[md5sum] =3D "b542138820ca3a41cbd63fc331907955"
> -SRC_URI[sha256sum] =3D "0cd1a7e67e132ead810e16e31ff929394c83fcf841e4a295=
c45d6f3829601ad9"
> +SRC_URI =3D "ftp://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2 \
> +           file://freetype.patch \
> +          "
> +SRC_URI[md5sum] =3D "84c964aab7044489af69f7319bb59b47"
> +SRC_URI[sha256sum] =3D "e7fd8b19f989138d826003c75f56bd5b6f136eef597e86e3=
978ede0bba470ae6"
>
>  EXTRA_OECONF =3D "--disable-python \
>                  --without-wmf"
> @@ -21,3 +23,4 @@ do_configure_append() {
>  }
>
>  FILES_${PN}-dbg +=3D "${libdir}/gimp/2.0/*/.debug"
> +FILES_${PN}  +=3D "${datadir}/appdata"
> --
> 1.7.10.4
>
 Acked-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

