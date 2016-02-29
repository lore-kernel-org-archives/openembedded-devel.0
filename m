Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id AFD3177026
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 10:25:57 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id l68so30003325wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 02:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=K9KLg4s1nhaL/gv1LQPhUGOycDG/ZONdARiSGL9pqps=;
	b=bNd8TSoUQKnB7lAj4SSeXSGLui6lAWYjGiI7AAjGM0YM7xpZKq6h4UvxNB0e6QOJ/B
	fTdZeMKR22amOci0xDEPPw46hSMIsdzOmkEzf+9c7+dfvt8//ewSci17Wmkgu0nPI6UW
	UKUMfXtWLXMRkICkAd86/SDtm0HQemrVeGT1CBkn/5HiIhHDa7DQAH6fvJMSqi7WFzaT
	JZId8untTMpLgyIfDLSJ1Z2AOf0bZAHDNE35k0fTilMtMULz0oVxlldcukfRZDgXff3U
	EhtioN1T+0hWi8KL9QlqRaTk3F+AVSwYotDYSmrF3hbT5Z8PVn3Ex6kEyLHHwuy3z48g
	IYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=K9KLg4s1nhaL/gv1LQPhUGOycDG/ZONdARiSGL9pqps=;
	b=gNBp/6/1s3mej8nJYPRtctKHvBLsz91MbMBWdDqrNGG7v7qSMvfyuET5nBtbcWzRXm
	KmHaBBqPin923J54hqpOEZxoxzY4NiZvfxw30umlptGNoVpNnHZBPxTkGkfQLWF8Ycze
	dmBIyBfRa6gFEKsgZjq0T73BAkiJvqD+3Bp1UKBHdOkU/XjzYxXv97vwxiKWQYkcd6/q
	iEcnqrCb//J9HX3HA9CMHHov+eQvdFgV1nKrSnWNDTfk7VVtQA412fFHt2EmNEwvMo/v
	N5MI8p98n1fnzMyBqDgvhb96lTo5PhvOq5QpM6E37hh6XLcAlz5HwtpO9qzGDQKpMBA9
	vA0A==
X-Gm-Message-State: AD7BkJJvFQX5zLPF4cdp4AKMUj2dO9qxxOb60FGhGimJEWjPjBP6S69c6soIKDJ/MkZHwQ==
X-Received: by 10.28.95.86 with SMTP id t83mr6537120wmb.86.1456741557575;
	Mon, 29 Feb 2016 02:25:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i5sm25163356wjx.15.2016.02.29.02.25.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Feb 2016 02:25:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 29 Feb 2016 11:27:41 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160229102741.GA2563@jama>
References: <1456733307-8500-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1456733307-8500-2-git-send-email-rebecca.swee.fun.chang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1456733307-8500-2-git-send-email-rebecca.swee.fun.chang@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Rebecca Chang <rebecca.swee.fun.chang@intel.com>
Subject: Re: [meta-oe] [PATCH] libvpx: upgrade to version 1.5.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Feb 2016 10:25:57 -0000
X-Groupsio-MsgNum: 60264
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 29, 2016 at 04:08:27PM +0800, Rebecca Chang wrote:
> From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
>=20
> This version had improved VP9 encoder and speeds up the encoding and
> decoding process.

Please resend with -M parameter, so it's easier to review.

>=20
> Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> ---
>  meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb | 51 -------------------=
------
>  meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb | 50 +++++++++++++++++++=
+++++
>  2 files changed, 50 insertions(+), 51 deletions(-)
>  delete mode 100644 meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
>  create mode 100644 meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb b/meta-oe/re=
cipes-multimedia/webm/libvpx_1.4.0.bb
> deleted file mode 100644
> index c963a9c..0000000
> --- a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -SUMMARY =3D "VPX multi-format codec"
> -DESCRIPTION =3D "The BSD-licensed libvpx reference implementation provid=
es en- and decoders for VP8 and VP9 bitstreams."
> -HOMEPAGE =3D "http://www.webmproject.org/code/"
> -BUGTRACKER =3D "http://code.google.com/p/webm/issues/list"
> -SECTION =3D "libs/multimedia"
> -LICENSE =3D "BSD"
> -
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd5b04755015be901744a78cc30d39=
0d4"
> -
> -SRC_URI +=3D "http://storage.googleapis.com/downloads.webmproject.org/re=
leases/webm/${BP}.tar.bz2 \
> -            file://libvpx-configure-support-blank-prefix.patch \
> -           "
> -SRC_URI[md5sum] =3D "63b1d7f59636a42eeeee9225cc14e7de"
> -SRC_URI[sha256sum] =3D "f582d9b2d60a592a4a3d8c32965ca2d2167e9ade38c6c30b=
ac8801ff66a118e4"
> -
> -# ffmpeg links with this and fails=20
> -# sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.te=
xt+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GL=
IBC_2.4'
> -ARM_INSTRUCTION_SET =3D "arm"
> -
> -CFLAGS +=3D "-fPIC"
> -
> -export CC
> -export LD =3D "${CC}"
> -
> -VPXTARGET_armv5te =3D "armv5te-linux-gcc"
> -VPXTARGET_armv6 =3D "armv6-linux-gcc"
> -VPXTARGET_armv7a =3D "armv7-linux-gcc"
> -VPXTARGET ?=3D "generic-gnu"
> -
> -CONFIGUREOPTS =3D " \
> -    --target=3D${VPXTARGET} \
> -    --enable-vp8 \
> -    --enable-vp9 \
> -    --enable-libs \
> -    --disable-install-docs \
> -    --disable-static \
> -    --enable-shared \
> -    --prefix=3D${prefix} \
> -    --libdir=3D${libdir} \
> -    --size-limit=3D16384x16384 \
> -"
> -
> -do_configure() {
> -    ${S}/configure ${CONFIGUREOPTS}
> -}
> -
> -do_install() {
> -    oe_runmake install DESTDIR=3D${D}
> -    chown -R root:root ${D}
> -}
> -
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb b/meta-oe/re=
cipes-multimedia/webm/libvpx_1.5.0.bb
> new file mode 100644
> index 0000000..8ac178d
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
> @@ -0,0 +1,50 @@
> +SUMMARY =3D "VPX multi-format codec"
> +DESCRIPTION =3D "The BSD-licensed libvpx reference implementation provid=
es en- and decoders for VP8 and VP9 bitstreams."
> +HOMEPAGE =3D "http://www.webmproject.org/code/"
> +BUGTRACKER =3D "http://code.google.com/p/webm/issues/list"
> +SECTION =3D "libs/multimedia"
> +LICENSE =3D "BSD"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd5b04755015be901744a78cc30d39=
0d4"
> +
> +SRC_URI +=3D "http://storage.googleapis.com/downloads.webmproject.org/re=
leases/webm/${BP}.tar.bz2 \
> +            file://libvpx-configure-support-blank-prefix.patch \
> +           "
> +SRC_URI[md5sum] =3D "49e59dd184caa255886683facea56fca"
> +SRC_URI[sha256sum] =3D "306d67908625675f8e188d37a81fbfafdf5068b09d9aa527=
02b6fbe601c76797"
> +
> +# ffmpeg links with this and fails
> +# sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.te=
xt+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GL=
IBC_2.4'
> +ARM_INSTRUCTION_SET =3D "arm"
> +
> +CFLAGS +=3D "-fPIC"
> +
> +export CC
> +export LD =3D "${CC}"
> +
> +VPXTARGET_armv5te =3D "armv5te-linux-gcc"
> +VPXTARGET_armv6 =3D "armv6-linux-gcc"
> +VPXTARGET_armv7a =3D "armv7-linux-gcc"
> +VPXTARGET ?=3D "generic-gnu"
> +
> +CONFIGUREOPTS =3D " \
> +    --target=3D${VPXTARGET} \
> +    --enable-vp8 \
> +    --enable-vp9 \
> +    --enable-libs \
> +    --disable-install-docs \
> +    --disable-static \
> +    --enable-shared \
> +    --prefix=3D${prefix} \
> +    --libdir=3D${libdir} \
> +    --size-limit=3D16384x16384 \
> +"
> +
> +do_configure() {
> +    ${S}/configure ${CONFIGUREOPTS}
> +}
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D}
> +    chown -R root:root ${D}
> +}
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbUHRwACgkQN1Ujt2V2gByDBACdHvTnqN/7EpFu/fnHjfletbAj
CfEAnjx5unISam3a1Moyvlot8zkhpe3Y
=/GsB
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
