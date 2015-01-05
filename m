Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id F1A0B60167
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 12:08:15 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id k14so27636710wgh.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jan 2015 04:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PthNWwxjNwjXPJ/wwaVfXoTJJcJhBQyxg2CwxHirLDI=;
	b=jUVoDR4BMgffhEEbqboQYaOz9JxEbuyNuhnfXgVeXqg3m9XtVz4WOWH8uleChMCk4M
	ppg2vUXIe/CKY52vQvHlJl7v6hpGOtgTXIYI/bRqPN+YGx5W3/5xAOtRBrIR6+CKoHQz
	V3o9UWFDCVT+UHfmIYgZ6rQEx+rhZIPUYuD9+CcrMBNnOsKl65FtDpipPaV2V4EjxE07
	1dXN7G3TDDuPaFCnIXb5ZZi8H4/ZkWex/gL5XYGrNxafnsdamApvw2GVx16Imu8T7Gw3
	5vz7BsY3akwiufbwMXOqxK3GH6Tr08DyCm5gsrP+1tq6GP3qFNBrFaFq4xg1CwHxmC9R
	Skfg==
X-Received: by 10.195.12.35 with SMTP id en3mr182439231wjd.129.1420459696035; 
	Mon, 05 Jan 2015 04:08:16 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j1sm75149804wjw.25.2015.01.05.04.08.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 04:08:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Jan 2015 13:08:16 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150105120816.GI2484@jama>
References: <1419911376-2464-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1419911376-2464-1-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] imsettings: add recipe
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
X-List-Received-Date: Mon, 05 Jan 2015 12:08:20 -0000
X-Groupsio-MsgNum: 53650
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tAmVnWIZ6lqEAvSf"
Content-Disposition: inline

--tAmVnWIZ6lqEAvSf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2014 at 11:49:36AM +0800, Bian Naimeng wrote:
> Delivery framework for general Input Method configuration
>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
>=20
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
> index 0000000..d5d9ffc
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
> +
> +FILES_${PN} +=3D "/usr/share/dbus-1/*"

Don't hardcode paths like this.

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

--tAmVnWIZ6lqEAvSf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSqfrAACgkQN1Ujt2V2gBwkqACggXIu0oLVVoIZ/AB2O+rItdkM
OLQAoLqZ+V19/06vVUOiNpO5eOHztouL
=PY4F
-----END PGP SIGNATURE-----

--tAmVnWIZ6lqEAvSf--
