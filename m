Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 61AAC609AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 16:03:00 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id n3so8069550wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2014 09:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3TPt/15y+LDGm39WTBpIVYT6W/4ziaQ8+HVryrgUhL8=;
	b=wlL820uBd1t0CfRSrWxy8kxm8FDXi6ByqCeq4QLHKhIov0LBA3ZFtIeeNi6DjR9Y/6
	l94l0Iwz3d+Te/t7w7bwFsuTGPeQ1rNSEYAfm188Xze7PF89V4Gryskwe2wZhZ8NMQmZ
	mwhHaLu05y/YlhNyk44GMZqg+syTCfvSeaDRWI9j94RrSllIRGKLjBH7bG1a1/p9nzqR
	hJ9CklarLbu9EAoPzQYfwNA4Evu1BK3xR6+npetvDX/Bd8WP3fwIO30TDBnIO59XJIHJ
	oQAdK2JJjW00q/nCO2K7U8oyj09IEYwiG/16hfDsJ32nQH/uTBqOZ90DW4UV9uxiessS
	Enrw==
X-Received: by 10.180.207.48 with SMTP id lt16mr37933002wic.32.1404230581680; 
	Tue, 01 Jul 2014 09:03:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	20sm47165811wjt.42.2014.07.01.09.03.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jul 2014 09:03:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Jul 2014 18:03:10 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140701160310.GH2437@jama>
References: <1404224853-22809-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1404224853-22809-1-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] postgresql : Fix build using pkg-config for libxml-2.0.
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
X-List-Received-Date: Tue, 01 Jul 2014 16:03:11 -0000
X-Groupsio-MsgNum: 50643
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYOwxzDtEZWltKxP"
Content-Disposition: inline

--mYOwxzDtEZWltKxP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 01, 2014 at 10:27:33AM -0400, Philip Balister wrote:
> Use package-config instead of binconfig for libxml-2.0.
>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  ...0001-Use-pkg-config-for-libxml2-detection.patch | 43 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/postgresql/postgresql.inc  |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta-oe/recipes-support/postgresql/files/0001-Use-pkg=
-config-for-libxml2-detection.patch
>=20
> diff --git a/meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config=
-for-libxml2-detection.patch b/meta-oe/recipes-support/postgresql/files/000=
1-Use-pkg-config-for-libxml2-detection.patch
> new file mode 100644
> index 0000000..d08ec6a
> --- /dev/null
> +++ b/meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for-li=
bxml2-detection.patch
> @@ -0,0 +1,43 @@
> +From d52e330be895bb8c5f0fb3e2884766acbd942a85 Mon Sep 17 00:00:00 2001
> +From: Philip Balister <philip@balister.org>
> +Date: Tue, 1 Jul 2014 09:40:44 -0400
> +Subject: [PATCH] Use pkg-config for libxml2 detection.
> +
> +Upstream-Status: Inappropriate [configuration]

What's relation to this change?
http://patchwork.openembedded.org/patch/74159/

Upstream-Status value doesn't seem right and your change is also
dropping pgac_* as Koen commented before.

> +
> +xml2-config does not work. Use pkgconfig to set CPPFLAGS and LIBS.
> +
> +Signed-off-by: Philip Balister <philip@balister.org>
> +---
> + configure.in | 15 ++-------------
> + 1 file changed, 2 insertions(+), 13 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index f8bf466..1f4fabf 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -734,19 +734,8 @@ PGAC_ARG_BOOL(with, libxml, no, [build with XML sup=
port],
> +               [AC_DEFINE([USE_LIBXML], 1, [Define to 1 to build with XM=
L support. (--with-libxml)])])
> +=20
> + if test "$with_libxml" =3D yes ; then
> +-  AC_CHECK_PROGS(XML2_CONFIG, xml2-config)
> +-  if test -n "$XML2_CONFIG"; then
> +-    for pgac_option in `$XML2_CONFIG --cflags`; do
> +-      case $pgac_option in
> +-        -I*|-D*) CPPFLAGS=3D"$CPPFLAGS $pgac_option";;
> +-      esac
> +-    done
> +-    for pgac_option in `$XML2_CONFIG --libs`; do
> +-      case $pgac_option in
> +-        -L*) LDFLAGS=3D"$LDFLAGS $pgac_option";;
> +-      esac
> +-    done
> +-  fi
> ++  CPPFLAGS=3D"$CPPFLAGS `pkg-config --short-errors --print-errors --cfl=
ags "libxml-2.0" 2>&1`"
> ++  LIBS=3D"`pkg-config --short-errors --print-errors --libs "libxml-2.0"=
 2>&1` $LIBS"
> + fi
> +=20
> + AC_SUBST(with_libxml)
> +--=20
> +1.8.3.1
> +
> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/=
recipes-support/postgresql/postgresql.inc
> index 4e5ec02..79d1281 100644
> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
> @@ -28,6 +28,7 @@ SRC_URI =3D "http://ftp.postgresql.org/pub/source/v${PV=
}/${BP}.tar.bz2 \
>             file://postgresql.init \
>             file://postgresql-bashprofile \
>             file://postgresql.pam \
> +           file://0001-Use-pkg-config-for-libxml2-detection.patch \
>  "
> =20
>  LEAD_SONAME =3D "libpq.so"
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mYOwxzDtEZWltKxP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOy274ACgkQN1Ujt2V2gBxm1gCfeNdCv3W+mTHSfBv2gSduvO0C
BEcAn25LG8oCbp25gJ3kNhqs04GdJfZJ
=91ea
-----END PGP SIGNATURE-----

--mYOwxzDtEZWltKxP--
