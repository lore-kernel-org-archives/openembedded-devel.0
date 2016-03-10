Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BFB586FF7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 14:22:08 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n186so4171212wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 06:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Qflb5rCE4vwicdHr+81JC/o+0nagLcxVQYfWj3inU4E=;
	b=PWZmRMEODk7KRC3cbjHjRhc0HxzaT0Ej4hbvHEqqVU6OSxhIyBLbl0L81sXy7unxyu
	E1q8PGp5Kh6RlHaxjtKOLyMJRQDRfMHxXIaVk7zW2S8YGPjbfnieEbYMIYCJ80u1O19w
	kc9ac6sJ5XPIhsuCVZeGQUObJDsBmLgDWLNU+LUa8r1AONnn7rh+8vnHg9z03OtNiKVd
	d2C4+AFA+A1H/zF7A+sw1KpdtRtx1gJf8sAtAfk8R9Ys7XgEGmaJBKbDePjZ+TiIPPDs
	84tINKkFFaJIXr3r2a+islODxI1XNybPSS5AN1jBTwD1/EzJOwYgheEPahSGjYjk8ewx
	Foug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Qflb5rCE4vwicdHr+81JC/o+0nagLcxVQYfWj3inU4E=;
	b=ZpODpXFdz8AFQLtE3BesdWDNjD6xzStkA06GqgbXT2xOjsxYG5HPGfnh3W7b7BjqLn
	i0SI1+5lAJJI+FEq1nzWVVQBi7amDXYJHRjthd8ARmNFkyOkGucqXoMHAQJw3oWS+eVE
	e0Qcq69jBwMRuookwIqGbuivyPg/mqvAx+YtKyLVnzNwt/K2LxXxgLxU2ysK+vYvouSW
	Be3S3ae35FwIcF91EnumRB3LPk70yN/D1O0NNsUuZsqpmcbVlAvQjIXIg/Ky5zxmpjD1
	ZJvbRuRkUqiBPmBUuWctM99fkMYXaQh+rs/z5ytlFBe5TYcBLsKuOtUB5p0I5I+hgxi6
	+1Rw==
X-Gm-Message-State: AD7BkJLN7m+utvNNx3W5CnPe+zPB+9p9ADIw8TBJ4eZ0mMihx+Ac8VEFwIijzhEnQ6V2jQ==
X-Received: by 10.28.145.8 with SMTP id t8mr4309878wmd.103.1457619728935;
	Thu, 10 Mar 2016 06:22:08 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id gt7sm3790605wjc.1.2016.03.10.06.22.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 06:22:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Mar 2016 15:25:07 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160310142507.GI2573@jama>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
	<41b4e4a82cb652470eebe853bd1b6076cee59301.1457535831.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <41b4e4a82cb652470eebe853bd1b6076cee59301.1457535831.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 14/38] python-gst: remove the 0.10 recipe
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
X-List-Received-Date: Thu, 10 Mar 2016 14:22:09 -0000
X-Groupsio-MsgNum: 60470
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YhFoJY/gx7awiIuK"
Content-Disposition: inline

--YhFoJY/gx7awiIuK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2016 at 05:05:30PM +0200, Alexander Kanavin wrote:
> It depends on pygobject 2.x which has been update to 3.x in oe-core

This wont make freesmartphone people happly (if there still are some)

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'python-gst' (but /home/jenkins/oe/world/shr-core/=
meta-smartphone/meta-shr/recipes-shr/packagegroups/packagegroup-shr-minimal=
=2Ebb, /home/jenkins/oe/world/shr-core/meta-smartphone/meta-fso/recipes-fre=
esmartphone/freesmartphone/frameworkd_0.10.1.bb RDEPENDS on or otherwise re=
quires it)
NOTE: Runtime target 'python-gst' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-gst']
NOTE: Runtime target 'packagegroup-shr-minimal' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-shr-minimal', '=
python-gst']
ERROR: Nothing RPROVIDES 'frameworkd' (but /home/jenkins/oe/world/shr-core/=
meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/fso-gpsd_git=
=2Ebb, /home/jenkins/oe/world/shr-core/meta-smartphone/meta-shr/recipes-shr=
/3rdparty/atd-over-fso_0.70.bb, /home/jenkins/oe/world/shr-core/meta-smartp=
hone/meta-shr/recipes-shr/shr/shr-settings_git.bb, /home/jenkins/oe/world/s=
hr-core/meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/fram=
eworkd_0.10.1.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'frameworkd'
NOTE: Runtime target 'frameworkd' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['frameworkd']
NOTE: Runtime target 'fso-gpsd' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['fso-gpsd', 'frameworkd']
NOTE: Runtime target 'shr-settings' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['shr-settings', 'frameworkd']
NOTE: Runtime target 'shr-wizard' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['shr-wizard', 'shr-settings',=
 'frameworkd']
ERROR: Nothing RPROVIDES 'fso-gpsd-dev' (but /home/jenkins/oe/world/shr-cor=
e/meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/fso-gpsd_g=
it.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'fso-gpsd-dev'
NOTE: Runtime target 'fso-gpsd-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['fso-gpsd-dev']
ERROR: Nothing RPROVIDES 'packagegroup-shr-minimal-cli' (but /home/jenkins/=
oe/world/shr-core/meta-smartphone/meta-shr/recipes-shr/packagegroups/packag=
egroup-shr.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'packagegroup-shr-minimal-cli'
NOTE: Runtime target 'packagegroup-shr-minimal-cli' is unbuildable, removin=
g...
Missing or unbuildable dependency chain was: ['packagegroup-shr-minimal-cli=
']
ERROR: Nothing RPROVIDES 'packagegroup-shr-minimal-apps' (but /home/jenkins=
/oe/world/shr-core/meta-smartphone/meta-shr/recipes-shr/packagegroups/packa=
gegroup-shr.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'packagegroup-shr-minimal-apps'
NOTE: Runtime target 'packagegroup-shr-minimal-apps' is unbuildable, removi=
ng...
Missing or unbuildable dependency chain was: ['packagegroup-shr-minimal-app=
s']
ERROR: Nothing RPROVIDES 'python-pygtk' (but /home/jenkins/oe/world/shr-cor=
e/meta-smartphone/meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb, /ho=
me/jenkins/oe/world/shr-core/meta-smartphone/meta-shr/recipes-shr/3rdparty/=
openmoko-gps_svn.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python-pygtk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-pygtk']
NOTE: Runtime target 'advancedcaching' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['advancedcaching', 'python-py=
gtk']
NOTE: Runtime target 'packagegroup-shr-feed' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-shr-feed', 'adv=
ancedcaching', 'python-pygtk']
NOTE: Runtime target 'advancedcaching-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['advancedcaching-dev', 'pytho=
n-pygtk']
ERROR: Nothing RPROVIDES 'openmoko-gps-dev' (but /home/jenkins/oe/world/shr=
-core/meta-smartphone/meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb RDE=
PENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'openmoko-gps-dev'
NOTE: Runtime target 'openmoko-gps-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['openmoko-gps-dev']
ERROR: Nothing RPROVIDES 'openmoko-gps' (but /home/jenkins/oe/world/shr-cor=
e/meta-smartphone/meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb RDEPEND=
S on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'openmoko-gps'
NOTE: Runtime target 'openmoko-gps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['openmoko-gps']
ERROR: Nothing RPROVIDES 'atd-over-fso-dev' (but /home/jenkins/oe/world/shr=
-core/meta-smartphone/meta-shr/recipes-shr/3rdparty/atd-over-fso_0.70.bb RD=
EPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'atd-over-fso-dev'
NOTE: Runtime target 'atd-over-fso-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['atd-over-fso-dev']
ERROR: Nothing RPROVIDES 'atd-over-fso' (but /home/jenkins/oe/world/shr-cor=
e/meta-smartphone/meta-shr/recipes-shr/3rdparty/atd-over-fso_0.70.bb RDEPEN=
DS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'atd-over-fso'
NOTE: Runtime target 'atd-over-fso' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['atd-over-fso']
ERROR: Nothing RPROVIDES 'shr-wizard-dev' (but /home/jenkins/oe/world/shr-c=
ore/meta-smartphone/meta-shr/recipes-shr/shr/shr-wizard_git.bb RDEPENDS on =
or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'shr-wizard-dev'
NOTE: Runtime target 'shr-wizard-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['shr-wizard-dev']
ERROR: Nothing RPROVIDES 'shr-settings-dev' (but /home/jenkins/oe/world/shr=
-core/meta-smartphone/meta-shr/recipes-shr/shr/shr-settings_git.bb RDEPENDS=
 on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'shr-settings-dev'
NOTE: Runtime target 'shr-settings-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['shr-settings-dev']
ERROR: Nothing RPROVIDES 'shr-settings-addons-illume' (but /home/jenkins/oe=
/world/shr-core/meta-smartphone/meta-shr/recipes-shr/shr/shr-settings_git.b=
b RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'shr-settings-addons-illume'
NOTE: Runtime target 'shr-settings-addons-illume' is unbuildable, removing.=
=2E.
Missing or unbuildable dependency chain was: ['shr-settings-addons-illume']
ERROR: Nothing RPROVIDES 'shr-settings-backup-configuration' (but /home/jen=
kins/oe/world/shr-core/meta-smartphone/meta-shr/recipes-shr/shr/shr-setting=
s_git.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'shr-settings-backup-configuration'
NOTE: Runtime target 'shr-settings-backup-configuration' is unbuildable, re=
moving...
Missing or unbuildable dependency chain was: ['shr-settings-backup-configur=
ation']
ERROR: Nothing RPROVIDES 'frameworkd-dev' (but /home/jenkins/oe/world/shr-c=
ore/meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/framewor=
kd_0.10.1.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'frameworkd-dev'
NOTE: Runtime target 'frameworkd-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['frameworkd-dev']

>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../gstreamer-0.10/python-gst/python-path.patch    | 28 ----------------=
-----
>  .../gstreamer-0.10/python-gst_0.10.22.bb           | 29 ----------------=
------
>  2 files changed, 57 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/pyt=
hon-gst/python-path.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/pyt=
hon-gst_0.10.22.bb
>=20
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst=
/python-path.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/pyth=
on-gst/python-path.patch
> deleted file mode 100644
> index 21b5bbf..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst/python=
-path.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Upstream-Status:Pending
> -
> -Index: gst-python-0.10.19/acinclude.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gst-python-0.10.19.orig/acinclude.m4	2010-04-21 15:23:44.000000000 -=
0700
> -+++ gst-python-0.10.19/acinclude.m4	2010-11-15 14:43:00.642994001 -0800
> -@@ -43,6 +43,13 @@
> - [AC_REQUIRE([AM_PATH_PYTHON])
> - AC_MSG_CHECKING(for headers required to compile python extensions)
> - dnl deduce PYTHON_INCLUDES
> -+
> -+AC_ARG_WITH(python-includes,
> -+	[  --with-python-includes=3DDIR  path to Python includes], py_exec_pre=
fix=3D$withval)
> -+if test x$py_exec_prefix !=3D x; then
> -+PYTHON_INCLUDES=3D"-I${py_exec_prefix}/include/python${PYTHON_VERSION}"
> -+py_prefix=3D"${py_exec_prefix}"
> -+else
> - py_prefix=3D`$PYTHON -c "import sys; print sys.prefix"`
> - py_exec_prefix=3D`$PYTHON -c "import sys; print sys.exec_prefix"`
> - if $PYTHON-config --help 2>/dev/null; then
> -@@ -53,6 +60,7 @@
> -     PYTHON_INCLUDES=3D"$PYTHON_INCLUDES -I${py_exec_prefix}/include/pyt=
hon${PYTHON_VERSION}"
> -   fi
> - fi
> -+fi
> - AC_SUBST(PYTHON_INCLUDES)
> - dnl check if the headers exist:
> - save_CPPFLAGS=3D"$CPPFLAGS"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst=
_0.10.22.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst_=
0.10.22.bb
> deleted file mode 100644
> index 2a5f2b3..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst_0.10.2=
2.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -SUMMARY =3D "Python bindings for the GStreamer multimedia framework"
> -SECTION =3D "devel/python"
> -LICENSE =3D "LGPLv2.1"
> -DEPENDS =3D "gstreamer gst-plugins-base python-pygobject"
> -RDEPENDS_${PN} +=3D "python-pygtk"
> -PR =3D "r2"
> -
> -SRC_URI =3D "http://gstreamer.freedesktop.org/src/gst-python/gst-python-=
${PV}.tar.bz2 \
> -           file://python-path.patch"
> -
> -SRC_URI[md5sum] =3D "937152fe896241f827689f4b53e79b22"
> -SRC_URI[sha256sum] =3D "8f26f519a5bccd770864317e098e5e307fc5ad1201eb9632=
9634b6508b253178"
> -S =3D "${WORKDIR}/gst-python-${PV}"
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D39ff67e932b7bdfa9b78bad671516=
90b"
> -
> -inherit autotools distutils-base pkgconfig
> -
> -EXTRA_OECONF +=3D "--with-python-includes=3D${STAGING_INCDIR}/../"
> -
> -FILES_${PN} +=3D "${datadir}/gst-python"
> -FILES_${PN}-dev +=3D "${datadir}/gst-python/0.10/defs"
> -FILES_${PN}-dbg +=3D "${libdir}/${PYTHON_DIR}/site-packages/gst-0.10/gst=
/.debug/ ${libdir}/gstreamer-0.10/.debug/"
> -
> -do_configure_prepend() {
> -	if [ `find ${STAGING_LIBDIR} -name libpython*.so` ]; then
> -		ln -sf ${STAGING_LIBDIR}/libpython*.so `find ${STAGING_LIBDIR} -name l=
ibpython*.a -exec dirname {} \;`
> -	fi
> -}
> --=20
> 2.7.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YhFoJY/gx7awiIuK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbhg8EACgkQN1Ujt2V2gBwX9ACgoXv2Yu5keNVHIE2uqtBMlyEH
ZhEAnjym6ucqBpyNxbuT/mpsFto9gsHb
=kevv
-----END PGP SIGNATURE-----

--YhFoJY/gx7awiIuK--
