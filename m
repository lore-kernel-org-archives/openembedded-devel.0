Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id E35656A4F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 08:46:45 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id m6so2238402wiv.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 01:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iqA+3E01QM2iMXlUB5b9NQek7POCbR4IJ59q2T2jdww=;
	b=E0oXLEXGzP85YeclRvqgW/3mzpFgpyMsUJ3WlXLFHjaVXbwqsB7yPyGB8x4rkllIqu
	H9iYsUzaRY0lH3QxOJ0KYMM+9qMJMDvfThI3CXgVa94OWjpqicJDNoc6oAhjwangrLbY
	KDV8QrfD0dEm1xhWKAo6L+iKiMH7uAhByOQCVjKFj3IAY3W4yaYI+cv8P9OT6Zz536JG
	A5MMWDrRtIsosd1Uqo6+Y71GHT7J2dZB9ZUj2bjxy+D6mj/7pW5+yJK4tiTZerb8GGXK
	DoKetzjsMi8+dmZsHtq22EIR0hCSMKcCtu2mkaob/zGVyGd7gKvrxi2CfXWu5fsi1bz0
	VsAg==
X-Received: by 10.181.13.131 with SMTP id ey3mr10889035wid.41.1369730805962;
	Tue, 28 May 2013 01:46:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	fp16sm22746250wic.6.2013.05.28.01.46.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 28 May 2013 01:46:45 -0700 (PDT)
Date: Tue, 28 May 2013 10:46:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130528084655.GB3192@jama>
References: <1369698233-4500-1-git-send-email-eric@eukrea.com>
	<1369698233-4500-8-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1369698233-4500-8-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5][PATCH 8/8] qtbase: add option to enable tslib support
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
X-List-Received-Date: Tue, 28 May 2013 08:46:46 -0000
X-Groupsio-MsgNum: 44887
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline

--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2013 at 01:43:53AM +0200, Eric B=E9nard wrote:
> - the tslib support is not enabled by default and configure doesn't have =
any option
> to active it, so add the option to the build system,
> - patch tslib support to get the device from the environment variable
> (patch taken from https://github.com/prabindh/qt-configs/blob/master/qt5_=
1.0_Feb13/tslib.patch
> - provide variable to enable tslib support in a bbappend (disabled by def=
ault)
> - tested on an i.MX5x target with qt 5.0.2
>=20
> TODO : test with 5.0, 5.0.1 and _git
>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  .../0001-configure-add-tslib-support.patch         |   78 ++++++++++++++=
++++++
>  ...tslib-device-to-be-read-from-env-variable.patch |   34 +++++++++
>  recipes-qt/qt5/qtbase.inc                          |    8 +-
>  recipes-qt/qt5/qtbase_5.0.2.bb                     |    2 +
>  4 files changed, 121 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-qt/qt5/qtbase-5.0.2/0001-configure-add-tslib-=
support.patch
>  create mode 100644 recipes-qt/qt5/qtbase-5.0.2/0001-enables-tslib-device=
-to-be-read-from-env-variable.patch
>=20
> diff --git a/recipes-qt/qt5/qtbase-5.0.2/0001-configure-add-tslib-support=
=2Epatch b/recipes-qt/qt5/qtbase-5.0.2/0001-configure-add-tslib-support.pat=
ch
> new file mode 100644
> index 0000000..3407f60
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase-5.0.2/0001-configure-add-tslib-support.patch
> @@ -0,0 +1,78 @@
> +From b4edefdc1fb5ba67b202fad7df5a8def554d16fd Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Eric=3D20B=3DC3=3DA9nard?=3D <eric@eukrea.com>
> +Date: Mon, 27 May 2013 18:45:03 +0200
> +Subject: [PATCH] configure: add tslib support
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> +---
> + configure                       | 24 ++++++++++++++++++++++++
> + src/plugins/generic/generic.pro |  4 ++++
> + 2 files changed, 28 insertions(+)
> +
> +diff --git a/configure b/configure
> +index 2ea1ea4..727fed9 100755
> +--- a/configure
> ++++ b/configure
> +@@ -810,6 +810,7 @@ CFG_KMS=3Dauto
> + CFG_LIBUDEV=3Dauto
> + CFG_OBSOLETE_WAYLAND=3Dno
> + CFG_EVDEV=3Dauto
> ++CFG_TSLIB=3Dauto
> + CFG_NIS=3Dauto
> + CFG_CUPS=3Dauto
> + CFG_ICONV=3Dauto
> +@@ -1782,6 +1783,13 @@ while [ "$#" -gt 0 ]; do
> +             UNKNOWN_OPT=3Dyes
> +         fi
> +         ;;
> ++    tslib)
> ++        if [ "$VAL" =3D "yes" ] || [ "$VAL" =3D "no" ]; then
> ++            CFG_TSLIB=3D"$VAL"
> ++        else
> ++            UNKNOWN_OPT=3Dyes
> ++        fi
> ++        ;;
> +     cups)
> +         if [ "$VAL" =3D "yes" ] || [ "$VAL" =3D "no" ]; then
> +             CFG_CUPS=3D"$VAL"
> +@@ -4775,6 +4783,22 @@ if [ "$CFG_EVDEV" =3D "no" ]; then
> +     QMakeVar add DEFINES QT_NO_EVDEV
> + fi
> +=20
> ++if [ "$CFG_TSLIB" !=3D "no" ]; then
> ++    if compileTest unix/tslib "tslib"; then
> ++        CFG_TSLIB=3Dyes
> ++        QT_CONFIG=3D"$QT_CONFIG tslib"
> ++    elif [ "$CFG_TSLIB" =3D "yes" ]; then
> ++        echo "The tslib functionality test failed!"
> ++        exit 1
> ++    else
> ++        CFG_TSLIB=3Dno
> ++    fi
> ++fi
> ++if [ "$CFG_TSLIB" =3D "no" ]; then
> ++    QMakeVar add DEFINES QT_NO_TSLIB
> ++fi
> ++
> ++
> + # Check we actually have X11 :-)
> + if compileTest x11/xlib "XLib"; then
> +     QT_CONFIG=3D"$QT_CONFIG xlib"
> +diff --git a/src/plugins/generic/generic.pro b/src/plugins/generic/gener=
ic.pro
> +index 078db2f..18a8295 100644
> +--- a/src/plugins/generic/generic.pro
> ++++ b/src/plugins/generic/generic.pro
> +@@ -5,3 +5,7 @@ TEMPLATE =3D subdirs
> + contains(QT_CONFIG, evdev) {
> +     SUBDIRS +=3D evdevmouse evdevtouch evdevkeyboard evdevtablet
> + }
> ++
> ++contains(QT_CONFIG, tslib) {
> ++    SUBDIRS +=3D tslib
> ++}
> +--=20
> +1.8.1.4
> +
> diff --git a/recipes-qt/qt5/qtbase-5.0.2/0001-enables-tslib-device-to-be-=
read-from-env-variable.patch b/recipes-qt/qt5/qtbase-5.0.2/0001-enables-tsl=
ib-device-to-be-read-from-env-variable.patch
> new file mode 100644
> index 0000000..77ddcba
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase-5.0.2/0001-enables-tslib-device-to-be-read-fr=
om-env-variable.patch
> @@ -0,0 +1,34 @@
> +From cb7d4b978d7b29e3f4ef5dba1ca1319ccd289a0d Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Eric=3D20B=3DC3=3DA9nard?=3D <eric@eukrea.com>
> +Date: Mon, 27 May 2013 18:32:37 +0200
> +Subject: [PATCH] enables tslib device to be read from env variable
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +from :
> +https://github.com/prabindh/qt-configs/blob/master/qt5_1.0_Feb13/tslib.p=
atch
> +
> +Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> +---
> + src/plugins/generic/tslib/qtslib.cpp | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/plugins/generic/tslib/qtslib.cpp b/src/plugins/generic/=
tslib/qtslib.cpp
> +index 6986fd5..2ed4a69 100644
> +--- a/src/plugins/generic/tslib/qtslib.cpp
> ++++ b/src/plugins/generic/tslib/qtslib.cpp
> +@@ -64,7 +64,9 @@ QTsLibMouseHandler::QTsLibMouseHandler(const QString &=
key,
> +     qDebug() << "QTsLibMouseHandler" << key << specification;
> +     setObjectName(QLatin1String("TSLib Mouse Handler"));
> +=20
> +-    QByteArray device =3D "/dev/input/event1";
> ++    QByteArray device =3D qgetenv("TSLIB_TSDEVICE");
> ++    if(device.isEmpty())
> ++       device =3D "/dev/input/event1";
> +     if (specification.startsWith("/dev/"))
> +         device =3D specification.toLocal8Bit();
> +=20
> +--=20
> +1.8.1.4
> +
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 4b4fb10..12d1a7f 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -15,7 +15,7 @@ SRC_URI +=3D " \
>      file://0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch=
 \
>  "
> =20
> -DEPENDS +=3D "qtbase-native freetype jpeg libpng zlib openssl glib-2.0 $=
{ICU} udev ${XCB_DEPENDS} ${GL_DEPENDS}"
> +DEPENDS +=3D "qtbase-native freetype jpeg libpng zlib openssl glib-2.0 $=
{ICU} udev ${XCB_DEPENDS} ${GL_DEPENDS} ${TSLIB_DEPENDS}"
> =20
>  # to provide xcb/xcb_icccm.h, xcb/xcb_image.h, xcb/xcb_keysyms.h and dbu=
s/dbus.h
>  # XCB_DEPENDS +=3D "xcb-util-wm xcb-util-image xcb-util-keysyms dbus"
> @@ -40,6 +40,11 @@ QT_SQL_DRIVER_FLAGS ?=3D "-no-sql-ibase -no-sql-mysql =
-no-sql-psql -no-sql-odbc -p
>  GL_DEPENDS ?=3D "virtual/libgl"
>  QT_GLFLAGS ?=3D "-opengl"
> =20
> +# if you want to enable tslib in your .bbappend, don't forget to add tsl=
ib dependencies
> +# TSLIB_DEPENDS =3D "tslib"
> +# QT_TSLIB =3D "-tslib"

I've added
TSLIB_DEPENDS ?=3D ""
here, otherwise it's uninitialized for DEPENDS.

> +QT_TSLIB ?=3D "-no-tslib"
> +
>  QT_XML ?=3D "-xmlpatterns"
>  QT_WEBKIT ?=3D "-webkit"
>  QT_PHONON ?=3D "-phonon"
> @@ -72,6 +77,7 @@ QT_CONFIG_FLAGS +=3D " \
>      ${QT_GLFLAGS} \
>      ${QT_TESTS} \
>      ${QT_EXAMPLES} \
> +    ${QT_TSLIB} \
>  "
> =20
>  INC_PR =3D "r1"
> diff --git a/recipes-qt/qt5/qtbase_5.0.2.bb b/recipes-qt/qt5/qtbase_5.0.2=
=2Ebb
> index 357c06e..2cd94dd 100644
> --- a/recipes-qt/qt5/qtbase_5.0.2.bb
> +++ b/recipes-qt/qt5/qtbase_5.0.2.bb
> @@ -5,6 +5,8 @@ PR =3D "${INC_PR}.0"
> =20
>  SRC_URI +=3D "file://0004-Disable-mkv8snapshot.patch \
>      file://0001-qtbase-allow-build-of-examples.patch \
> +    file://0001-enables-tslib-device-to-be-read-from-env-variable.patch \
> +    file://0001-configure-add-tslib-support.patch \
>      "
> =20
>  SRC_URI[md5sum] =3D "a4fec8ed03867c4ee4fe5a46001a11f0"
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGkbv8ACgkQN1Ujt2V2gBw7bQCeLVNh3EA78zRh0rF/zEtOYEK+
+5YAnikSjgbkmdM1qrZ50M/y8ni5OG+Z
=au8t
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
