Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 52737706D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 10:16:46 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id k14so879041wgh.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2015 02:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zErdgDZLUZm9yfD7z5oRPZ8AXbM6gwrg/k49qP5DRcQ=;
	b=iw9SppItKZOGYP0+8nhQUcPTtj8Fde25D5udqPCIHv9ymiBNS7ZndtGRyqTg0oGplr
	wog/DhNroWFpb4FVkH+PwfH26FxEUe1A2bJOu3+ycfapYfskQIEAtgqRNtgGOJKW3tAO
	1CCMKgLxzP6gjE+6EhPImLe6UEDV29KVjtioZOBDoXricdX/UQrIAnrG+brGtt0L6n/I
	CYJ4O2QZ967R1B8hG0C3DC178iC6Iv5O9W4UWTB3OV/MA5ecBsBeeB0wLxDrD5w2JYHb
	VWfeQgVJoqedwB6Co4AKxCg1rRk8gpgqPZQhQ35yvErvCf87Z0dzauuPjgXYsLdmsu/9
	sOEg==
X-Received: by 10.180.97.106 with SMTP id dz10mr6098893wib.6.1420625806598;
	Wed, 07 Jan 2015 02:16:46 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	je12sm1941541wic.22.2015.01.07.02.16.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 02:16:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 Jan 2015 11:16:48 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150107101648.GJ29986@jama>
References: <1420523626-4961-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1420523626-4961-1-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] imsettings: add recipe
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
X-List-Received-Date: Wed, 07 Jan 2015 10:16:47 -0000
X-Groupsio-MsgNum: 53723
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/qIPZgKzMPM+y5U5"
Content-Disposition: inline

--/qIPZgKzMPM+y5U5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 01:53:46PM +0800, Bian Naimeng wrote:
> IMSettings is a framework that delivers Input Method settings and=20
> applies the changes so they take effect immediately without=20
> any need to restart applications or the desktop.
>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  .../imsettings/gtk-is-required-by-notify.patch     | 18 ++++++++++++++
>  ...CAL_AMFLAGS-isnot-supported-by-autoreconf.patch | 20 ++++++++++++++++
>  .../imsettings/imsettings_1.6.7.bb                 | 28 ++++++++++++++++=
++++++
>  3 files changed, 66 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/imsettings/imsettings/gtk-is=
-required-by-notify.patch
>  create mode 100644 meta-oe/recipes-extended/imsettings/imsettings/multi-=
line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
>  create mode 100644 meta-oe/recipes-extended/imsettings/imsettings_1.6.7.=
bb
>=20
> diff --git a/meta-oe/recipes-extended/imsettings/imsettings/gtk-is-requir=
ed-by-notify.patch b/meta-oe/recipes-extended/imsettings/imsettings/gtk-is-=
required-by-notify.patch
> new file mode 100644
> index 0000000..d42358d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/imsettings/imsettings/gtk-is-required-by-n=
otify.patch
> @@ -0,0 +1,18 @@
> +gtk+ is required by linnotify. So make sure gtk be linked before libnoti=
fy
> +
> +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> +
> +diff -Nurp imsettings-1.6.7.orig/configure.ac imsettings-1.6.7/configure=
=2Eac
> +--- imsettings-1.6.7.orig/configure.ac	2013-11-26 16:09:09.000000000 +08=
00
> ++++ imsettings-1.6.7/configure.ac	2014-12-30 11:27:44.370003209 +0800
> +@@ -93,8 +93,8 @@ PKG_CHECK_MODULES(LIBNOTIFY, libnotify,
> + 		has_old_libnotify=3Dyes
> + 		PKG_CHECK_MODULES(GTK, gtk+-2.0 >=3D $GTK_REQUIRED)
> + 		AC_DEFINE(HAS_OLD_LIBNOTIFY,, [Using older libnotify])
> +-		IMDAEMON_CFLAGS=3D"$GTK_CFLAGS $LIBNOTIFY_OLD_CFLAGS"
> +-		IMDAEMON_LIBS=3D"$GTK_LIBS $LIBNOTIFY_OLD_LIBS"],[
> ++		IMDAEMON_CFLAGS=3D"$LIBNOTIFY_OLD_CFLAGS $GTK_CFLAGS"
> ++		IMDAEMON_LIBS=3D"$LIBNOTIFY_OLD_LIBS $GTK_LIBS"],[
> + 		has_old_libnotify=3Dno
> + 		IMDAEMON_CFLAGS=3D"$LIBNOTIFY_CFLAGS"
> + 		IMDAEMON_LIBS=3D"$LIBNOTIFY_LIBS"])
> diff --git a/meta-oe/recipes-extended/imsettings/imsettings/multi-line-AC=
LOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch b/meta-oe/recipes-extende=
d/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autor=
econf.patch
> new file mode 100644
> index 0000000..1327c85
> --- /dev/null
> +++ b/meta-oe/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_A=
MFLAGS-isnot-supported-by-autoreconf.patch
> @@ -0,0 +1,20 @@
> +multi-line ACLOCAL_AMFLAGS isn't supported by autoreconf.
> +It will cause configure error as follow.
> +
> +  aclocal: error: non-option arguments are not accepted: '\'.
> +
> +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> +
> +--- imsettings-1.6.7.orig/Makefile.am	2013-02-08 10:33:59.000000000 +0800
> ++++ imsettings-1.6.7/Makefile.am	2014-12-25 11:48:27.078022744 +0800
> +@@ -1,9 +1,7 @@
> + NULL =3D
> + SUBDIRS =3D data imsettings imsettings-daemon backends utils po tests d=
ocs
> +=20
> +-ACLOCAL_AMFLAGS =3D			\
> +-	-I m4macros			\
> +-	$(NULL)
> ++ACLOCAL_AMFLAGS =3D -I m4macros $(NULL)
> +=20
> + CONFIGURE_DEPENDENCIES =3D		\
> + 	requires			\
> diff --git a/meta-oe/recipes-extended/imsettings/imsettings_1.6.7.bb b/me=
ta-oe/recipes-extended/imsettings/imsettings_1.6.7.bb
> new file mode 100644
> index 0000000..056bfdb
> --- /dev/null
> +++ b/meta-oe/recipes-extended/imsettings/imsettings_1.6.7.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "Delivery framework for general Input Method configuration"
> +DESCRIPTION =3D "IMSettings is a framework that delivers Input Method \
> +settings and applies the changes so they take effect \
> +immediately without any need to restart applications \
> +or the desktop. \
> +This package contains the core DBus services and some utilities."
> +HOMEPAGE =3D "http://code.google.com/p/imsettings/"
> +SECTION =3D "Applications/System"
> +
> +inherit autotools gtk-doc
> +
> +SRC_URI =3D "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${P=
V}.tar.bz2 \
> +           file://multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreco=
nf.patch \
> +           file://gtk-is-required-by-notify.patch"
> +
> +SRC_URI[md5sum] =3D "81ceddbbb443c101d7993a60c5ce6223"
> +SRC_URI[sha256sum] =3D "0d40099e93eb82bd35c29322df374297ae3286b5879b21f5=
056c8d4b5b7577dd"
> +
> +LICENSE =3D "LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
> +
> +EXTRA_OECONF =3D "--with-xinputsh=3D50-xinput.sh \
> +                --disable-static \
> +               "
> +
> +DEPENDS =3D "gtk+ gconf libnotify dbus-glib libgxim"

new QA warnings:
imsettings-1.6.7: imsettings requires /bin/bash, but no providers in its RD=
EPENDS [file-rdeps]
imsettings-1.6.7: imsettings rdepends on xfconf, but it isn't a build depen=
dency? [build-deps]

and there is issue with libgxim->ruby dependency discussed in separate
thread, that needs to be resolved before this is merged.

> +
> +FILES_${PN} +=3D "${datadir}/dbus-1/*"
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

--/qIPZgKzMPM+y5U5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlStB5AACgkQN1Ujt2V2gBz4PQCfV/QqCt2cM6zT8b3wr6yRV4NN
sUgAoJw9N6qbNDhtO37twAtGutZPpPPx
=j9pT
-----END PGP SIGNATURE-----

--/qIPZgKzMPM+y5U5--
