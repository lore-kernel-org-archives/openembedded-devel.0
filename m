Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 73F7D71D80
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Dec 2016 21:40:52 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u144so5897406wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2016 13:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=q2FcrGTAojnqMdvRaAuyXQzRFN04mzo2uAjWkBgp4sI=;
	b=OWLjiCc3XnmdZgt6RJ8KYw82u/p+2VCEI2tbcWdO7o0zvuKnXzCJAPkxFTsFlG2FzE
	pSzTpSJOQKxeqdLEtk+/dijTYAGhYh6OQEwCrOwyzMdxcLZPDVtYV4ou9c5XJPNlT/m9
	IqZlIYl7jm8k7dohbR4agsvvOMDn8SRWKC1ISE2vWwJKC+g9suC0InsCiGA5h+9CiqJ+
	8mEft9erPMegS/yU+n/zryfdv1ukOphhbIX0YghnIiCoi5uKbwF1LjNV12gD7HNTTofo
	HHXGiJepx3159WjP50qooOGynHiN1K0melE+QPI85l52M+9Us0Q7pWJDQWs46Ii6yn6K
	+GuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=q2FcrGTAojnqMdvRaAuyXQzRFN04mzo2uAjWkBgp4sI=;
	b=YKSvLMdbxyAa0vbeq7b6oeW7XA4kqC2R+bbNMuB4Ua/tgJNWCB3Z/mz3KkG3OvyU1C
	h/LaVyLnnd7BLwlQ8HK3EqhRV65xyiVNTSIZ16OLC1iERlZRSdrIU9cDYTigD7WgQI3V
	LoaEy0zm2EwwgXOKTh7T7fZCwe+MgFRgCXt4JvRGeq6wN6FCPVgHqhhjlj3kjGtqiSdn
	H7bzzybDbpClZmOTfqNzbEgqyU2U562eNTZrnwk+e3qtZ118fXM0/Muev+WZh6VIMwZ/
	vZoZQZCk92T4j6H8s8mBg/YbF1z12apTGqEmBGTPeuKa20iNuGLcfAyD56AFS1/yJ10T
	Ux+g==
X-Gm-Message-State: AKaTC00kv1RABblMI24/+t9Vz9wjKHD0wDUl1YzTMxDLcv2t27HjcLBKqdaElwiEsGPhAQ==
X-Received: by 10.28.148.81 with SMTP id w78mr258323wmd.42.1481319653424;
	Fri, 09 Dec 2016 13:40:53 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id q7sm44294152wjh.9.2016.12.09.13.40.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Dec 2016 13:40:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Dec 2016 22:40:53 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161209214053.GE3327@jama>
References: <20161203030422.17285-1-raj.khem@gmail.com>
	<20161203030422.17285-5-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161203030422.17285-5-raj.khem@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe][PATCH 5/8] zbar: Add recipe
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
X-List-Received-Date: Fri, 09 Dec 2016 21:40:54 -0000
X-Groupsio-MsgNum: 64276
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tMbDGjvJuJijemkf"
Content-Disposition: inline

--tMbDGjvJuJijemkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2016 at 07:04:19PM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../zbar/0001-make-relies-GNU-extentions.patch     | 32 ++++++++++++++
>  .../zbar/zbar/0001-undefine-__va_arg_pack.patch    | 51 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/zbar/zbar_0.10.bb          | 25 +++++++++++
>  3 files changed, 108 insertions(+)
>  create mode 100644 meta-oe/recipes-support/zbar/zbar/0001-make-relies-GN=
U-extentions.patch
>  create mode 100644 meta-oe/recipes-support/zbar/zbar/0001-undefine-__va_=
arg_pack.patch
>  create mode 100644 meta-oe/recipes-support/zbar/zbar_0.10.bb

zbar-0.10: zbar rdepends on libxcb, but it isn't a build dependency,
missing libxcb in DEPENDS or PACKAGECONFIG? [build-deps]
zbar-0.10: zbar rdepends on libx11, but it isn't a build dependency,
missing libx11 in DEPENDS or PACKAGECONFIG? [build-deps]
zbar-0.10: zbar rdepends on libsm, but it isn't a build dependency,
missing libsm in DEPENDS or PACKAGECONFIG? [build-deps]
zbar-0.10: zbar rdepends on libxau, but it isn't a build dependency,
missing libxau in DEPENDS or PACKAGECONFIG? [build-deps]
zbar-0.10: zbar rdepends on libxext, but it isn't a build dependency,
missing libxext in DEPENDS or PACKAGECONFIG? [build-deps]
zbar-0.10: zbar rdepends on libxv, but it isn't a build dependency,
missing libxv in DEPENDS or PACKAGECONFIG? [build-deps]
zbar-0.10: zbar rdepends on libice, but it isn't a build dependency,
missing libice in DEPENDS or PACKAGECONFIG? [build-deps]
zbar-0.10: zbar rdepends on libxdmcp, but it isn't a build dependency,
missing libxdmcp in DEPENDS or PACKAGECONFIG? [build-deps]

>=20
> diff --git a/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-exten=
tions.patch b/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extent=
ions.patch
> new file mode 100644
> index 0000000..04239ba
> --- /dev/null
> +++ b/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.p=
atch
> @@ -0,0 +1,32 @@
> +From 224507bc4b6e58f7a6e445bfebfb59d6b8d78bd6 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 2 Dec 2016 17:38:51 -0800
> +Subject: [PATCH] make relies GNU extentions
> +
> +We get errors like
> +`%'-style pattern rules are a GNU make extension
> +
> +Disable this warning, since we use gmake with OE
> +anyway
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 56d3dd0..9f85fd7 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -3,7 +3,7 @@ AC_PREREQ([2.61])
> + AC_INIT([zbar], [0.10], [spadix@users.sourceforge.net])
> + AC_CONFIG_AUX_DIR(config)
> + AC_CONFIG_MACRO_DIR(config)
> +-AM_INIT_AUTOMAKE([1.10 -Wall -Werror foreign subdir-objects std-options=
 dist-bzip2])
> ++AM_INIT_AUTOMAKE([1.10 -Wall -Werror -Wno-portability foreign subdir-ob=
jects std-options dist-bzip2])
> + AC_CONFIG_HEADERS([include/config.h])
> + AC_CONFIG_SRCDIR(zbar/scanner.c)
> + LT_PREREQ([2.2])
> +--=20
> +2.10.2
> +
> diff --git a/meta-oe/recipes-support/zbar/zbar/0001-undefine-__va_arg_pac=
k.patch b/meta-oe/recipes-support/zbar/zbar/0001-undefine-__va_arg_pack.pat=
ch
> new file mode 100644
> index 0000000..f7d8ba1
> --- /dev/null
> +++ b/meta-oe/recipes-support/zbar/zbar/0001-undefine-__va_arg_pack.patch
> @@ -0,0 +1,51 @@
> +From f842872244219d9881fbec77054702412b1e16f8 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 2 Dec 2016 16:41:27 -0800
> +Subject: [PATCH] undefine __va_arg_pack
> +
> +dprintf() is also a libc function. This fixes
> +the compile errors
> +
> +/usr/include/bits/stdio2.h:140:1: error: expected identifier or '(' befo=
re '{' token
> +|  {
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + zbar/debug.h | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/zbar/debug.h b/zbar/debug.h
> +index 482ca8d..68948f6 100644
> +--- a/zbar/debug.h
> ++++ b/zbar/debug.h
> +@@ -23,6 +23,7 @@
> +=20
> + /* varargs variations on compile time debug spew */
> +=20
> ++#undef __va_arg_pack
> + #ifndef DEBUG_LEVEL
> +=20
> + # ifdef __GNUC__
> +@@ -36,15 +37,14 @@
> + #else
> +=20
> + # include <stdio.h>
> +-
> + # ifdef __GNUC__
> +-#  define dprintf(level, args...) \
> ++#  define dprintf(level, format, args...) \
> +     if((level) <=3D DEBUG_LEVEL)    \
> +-        fprintf(stderr, args)
> ++        fprintf(stderr, format, args)
> + # else
> +-#  define dprintf(level, ...)     \
> ++#  define dprintf(level, format, ...)     \
> +     if((level) <=3D DEBUG_LEVEL)    \
> +-        fprintf(stderr, __VA_ARGS__)
> ++        fprintf(stderr, format, __VA_ARGS__)
> + # endif
> +=20
> + #endif /* DEBUG_LEVEL */
> +--=20
> +2.10.2
> +
> diff --git a/meta-oe/recipes-support/zbar/zbar_0.10.bb b/meta-oe/recipes-=
support/zbar/zbar_0.10.bb
> new file mode 100644
> index 0000000..adaa8dd
> --- /dev/null
> +++ b/meta-oe/recipes-support/zbar/zbar_0.10.bb
> @@ -0,0 +1,25 @@
> +DESRIPTION =3D "2D barcode scanner toolkit."
> +SECTION =3D "graphics"
> +LICENSE =3D "LGPL-2.1"
> +
> +DEPENDS =3D "pkgconfig intltool-native libpng jpeg"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D42bafded1b380c6fefbeb6c5cd544=
8d9"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2 \
> +           file://0001-undefine-__va_arg_pack.patch \
> +           file://0001-make-relies-GNU-extentions.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "0fd61eb590ac1bab62a77913c8b086a5"
> +SRC_URI[sha256sum] =3D "234efb39dbbe5cef4189cc76f37afbe3cfcfb45ae52493bf=
e8e191318bdbadc6"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D " --without-imagemagick --without-qt --without-python -=
-disable-video --without-gtk"
> +
> +
> +do_install_append() {
> +    #remove usr/bin if empty
> +    rmdir ${D}${bindir}
> +}
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tMbDGjvJuJijemkf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWEsk5AAKCRA3VSO3ZXaA
HHdVAJ98PHnF+CbKvCfCKNHjk6p0pMuWNACgtzDBGMzTSGtFrvvg4PUpWU92U2M=
=Fx/m
-----END PGP SIGNATURE-----

--tMbDGjvJuJijemkf--
