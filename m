Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 944C170331
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 16:47:05 +0000 (UTC)
Received: by iepj10 with SMTP id j10so96527571iep.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 09:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=xyQF5/L1vky4oacRVfH0Otn8hjMrl7sKUjcvmrkcCqU=;
	b=G1vuMVRKvIgR0+C9hMJ3YGMCjk+d2xE5iUqKeNnF0l8LSSB3TJGI9x0kf1OfxhH1gH
	/DB0tLUUthO/WVlKeugBodZTqbodCNYY5BpWIS4ukgWFDk15jwxR04uvWGCMmtOkaYKt
	e2xCV53L+9M10cqmnZhSkaeHlHkrjjgUuMEyV8Rk/nV0Wd0gLyjG/FXClPqvI5dVbv7w
	nwNvl9FWVbIN3nCQJKaSSYdVNZIU2ua0rzWFW+3+XLX7iIvd1gKj09uF6n59mFpl00Se
	azRSrINaI7LyZEVeYRUSdrsoPjgT5e5HGHn4ehgJc20J9Ksh93phC7tEt0h02Kb7xi4E
	A9WA==
X-Received: by 10.50.93.69 with SMTP id cs5mr31484726igb.4.1432658826256; Tue,
	26 May 2015 09:47:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Tue, 26 May 2015 09:46:35 -0700 (PDT)
In-Reply-To: <1432588449-31413-3-git-send-email-schnitzeltony@googlemail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
	<1432588449-31413-3-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 May 2015 09:46:35 -0700
Message-ID: <CAMKF1so3YuLs49Ng1e08+WK4kOp4Ocpb60gGPVn3LZUOMGQaDw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 02/12] openjpeg: initial add 2.1.0
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
X-List-Received-Date: Tue, 26 May 2015 16:47:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

there is a recipe available here
http://layers.openembedded.org/layerindex/recipe/25686/
may be you want to coordinate with that layer to migrate it into meta-oe ?

On Mon, May 25, 2015 at 2:13 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb | 18 +++++++++++++++=
+++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
>
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb b/meta-o=
e/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
> new file mode 100644
> index 0000000..9f6dd57
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "OpenJPEG library is an open-source JPEG 2000 codec"
> +HOMEPAGE =3D "http://www.openjpeg.org/index.php?menu=3Dmain"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc648878b4840d7babaade1303e7f1=
08c"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}.mirror/${PV}/${BPN}-${=
PV}.tar.gz"
> +SRC_URI[md5sum] =3D "f6419fcc233df84f9a81eb36633c6db6"
> +SRC_URI[sha256sum] =3D "1232bb814fd88d8ed314c94f0bfebb03de8559583a33abbe=
8c64ef3fc0a8ff03"
> +
> +inherit cmake
> +
> +DEPENDS =3D "libpng tiff lcms"
> +
> +# standard path for *.cmake
> +EXTRA_OECMAKE +=3D "-DOPENJPEG_INSTALL_PACKAGE_DIR=3D${baselib}/cmake"
> +
> +FILES_${PN}-dev +=3D "${libdir}/cmake/*.cmake"
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

