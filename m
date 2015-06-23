Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id C9DF5756C7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jun 2015 11:39:39 +0000 (UTC)
Received: by wguu7 with SMTP id u7so7060963wgu.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jun 2015 04:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=O+fPXnytduWYsVR9EjycxZhAoQUS/3yqSDZ0S8bAWP4=;
	b=p1UFXuT03h0smeD+Dtl8TtsT5QHmbDvgmwsdRCLlWVchRUtQzTyY3e5zDCXceSeoef
	Xd6u3XS9Tc9a0rW7dtFQo61VvPOP7RuLeUzfEtJp6yrnEO7D539d9uv8MTW48FmWJWzw
	lRndzYMIwYU0RFmNtfWl6JWqujqIE1Z+dIiKsdupAD3lAOaEoul7bD/2a0XPDLaGE0ek
	2Bg5Ssgl0Ul6AO08eXuCyApQ3sg9zSKd8EXdeK/yhTUjVsXne9kc+iGet51jiPkcOmyT
	HbXsIxegLtsFHVwMDs4/MJCBxdltdY//nEbhfI68yT6JkbybVNWha5RmuODP7tpyDOB2
	yPHw==
X-Received: by 10.180.39.212 with SMTP id r20mr2644113wik.64.1435059580124;
	Tue, 23 Jun 2015 04:39:40 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	wi1sm35335169wjb.41.2015.06.23.04.39.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jun 2015 04:39:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 23 Jun 2015 13:39:44 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150623113944.GA18920@jama>
References: <1434608844-51731-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1434608844-51731-1-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-ruby][PATCH] imsettings: add new recipe
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
X-List-Received-Date: Tue, 23 Jun 2015 11:39:42 -0000
X-Groupsio-MsgNum: 55987
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2015 at 02:27:24PM +0800, Bian Naimeng wrote:
> imsettings is a delivery framework for general input-method configuration
>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  .../imsettings/gtk-is-required-by-notify.patch     | 18 ++++++++++++++
>  .../imsettings/imsettings_1.6.8.bb                 | 29 ++++++++++++++++=
++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta-ruby/recipes-extended/imsettings/imsettings/gtk-=
is-required-by-notify.patch
>  create mode 100644 meta-ruby/recipes-extended/imsettings/imsettings_1.6.=
8.bb
>=20
> diff --git a/meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-requ=
ired-by-notify.patch b/meta-ruby/recipes-extended/imsettings/imsettings/gtk=
-is-required-by-notify.patch
> new file mode 100644
> index 0000000..d42358d
> --- /dev/null
> +++ b/meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-required-by=
-notify.patch
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
> diff --git a/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb b/=
meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
> new file mode 100644
> index 0000000..91443d7
> --- /dev/null
> +++ b/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
> @@ -0,0 +1,29 @@
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
> +           file://gtk-is-required-by-notify.patch"
> +
> +SRC_URI[md5sum] =3D "c31429f1d60e36d7f811f871c75b6c41"
> +SRC_URI[sha256sum] =3D "2620ffbf9a6dc842dbf994b4773d4fe355eb77076ccf33f7=
26ba63f16c0d08ba"
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
> +RDEPENDS_${PN} +=3D "bash"
> +
> +FILES_${PN} +=3D "${datadir}/dbus-1/*"

Fails to build:
| NOTE: Executing intltoolize --copy --force --automake
| NOTE: Executing ACLOCAL=3D"aclocal --system-acdir=3D/home/jenkins/oe/worl=
d/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/imsettings/1.6.8-r0/buil=
d/aclocal-copy/" autoreconf --verbose --install --force --exclude=3Dautopoi=
nt -I /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnuea=
bi/imsettings/1.6.8-r0/imsettings-1.6.8/m4macros/
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=3D/home/jenkins/oe/world/shr-=
core/tmp-glibc/work/armv5te-oe-linux-gnueabi/imsettings/1.6.8-r0/build/aclo=
cal-copy/ -I /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linu=
x-gnueabi/imsettings/1.6.8-r0/imsettings-1.6.8/m4macros/ -I /home/jenkins/o=
e/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/imsettings/1.6.8-r=
0/imsettings-1.6.8/m4macros/ --force \
| aclocal: error: non-option arguments are not accepted: '\'.
| aclocal: Try '/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-l=
inux/usr/bin/aclocal --help' for more information.
| autoreconf: aclocal failed with exit status: 1
| ERROR: autoreconf execution failed.
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/imsettings/1.6.=
8-r0/temp/log.do_configure.6158)
NOTE: recipe imsettings-1.6.8-r0: task do_configure: Failed
ERROR: Task 11347 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-r=
uby/recipes-extended/imsettings/imsettings_1.6.8.bb, do_configure) failed w=
ith exit code '1'

> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWJRX8ACgkQN1Ujt2V2gBzEGgCfU4oIfoslUKi10jLU4RdquA6L
f5QAn3buR1dsrMRGIs7G61oQO9kaoYgk
=C+UT
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
