Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKRar-00081c-6P
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 10:50:01 +0200
Received: by fxm19 with SMTP id 19so1023340fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 01:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=WpyiwhBAGcym7ayssXjQHSb5WfD56yPtCkb+nML1tm4=;
	b=aGI4dVm3xzHDcOowllwkZ0dEmiF9/6QXXxur5N+sR6VJ9TSmD6it7OT/N6YQeThMYT
	18Tgxzv0/Txxjx5r64a+33cjuRv0+6QdOtrhyE9EgUOzKSym+3GZ8qSMNvSsQfNB7V2f
	iyLj7SRUVCdGdULn0SWt/q6bkWA6VARpYAUeg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=aw99TTVuC9+DsYzPTxzj7YgV9GHd/GdYYCOWuI39ZKqg+yinQ6eoa2O87/5pR2Sa5A
	QDHPxqv6tQUF7Q7/Tx9ZWi88dPR7iNcW1XlwmN5vP0DyRmR6uwwmTJBwrtVrxs7Yg3sA
	EOCE0qaRdHFT8z33V8yWMGc7VgyhSWoC7vJVU=
Received: by 10.223.75.133 with SMTP id y5mr1170996faj.136.1305190033825;
	Thu, 12 May 2011 01:47:13 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id s17sm372066fau.13.2011.05.12.01.47.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2011 01:47:12 -0700 (PDT)
Date: Thu, 12 May 2011 10:47:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110512084705.GA3423@jama.jama.net>
References: <1305145805-14609-1-git-send-email-eric@eukrea.com>
	<1305145805-14609-2-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1305145805-14609-2-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/6] qt4: introduce version 4.7.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 May 2011 08:50:01 -0000
X-Groupsio-MsgNum: 31931
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2011 at 10:30:00PM +0200, Eric B=E9nard wrote:
> only qt4-embedded and qt4-native recipe were tested

I've tested qt4-x11-free on om-gta02

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  recipes/qt4/qt-4.7.3.inc                           |   72 ++++++++++++++=
++++++
>  .../0001-Added-Openembedded-crossarch-option.patch |   44 ++++++++++++
>  .../0010-phonon-gstreamer-rgb-endianess.patch      |   23 ++++++
>  recipes/qt4/qt-4.7.3/g++.conf                      |   60 ++++++++++++++=
++
>  recipes/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch      |   19 +++++
>  recipes/qt4/qt-4.7.3/linux.conf                    |   66 ++++++++++++++=
++++
>  recipes/qt4/qt4-embedded-gles_4.7.3.bb             |   19 +++++
>  recipes/qt4/qt4-embedded_4.7.3.bb                  |   14 ++++
>  recipes/qt4/qt4-native_4.7.3.bb                    |   19 +++++
>  recipes/qt4/qt4-tools-sdk_4.7.3.bb                 |    8 ++
>  recipes/qt4/qt4-x11-free-gles_4.7.3.bb             |   19 +++++
>  recipes/qt4/qt4-x11-free_4.7.3.bb                  |   15 ++++
>  12 files changed, 378 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/qt4/qt-4.7.3.inc
>  create mode 100644 recipes/qt4/qt-4.7.3/0001-Added-Openembedded-crossarc=
h-option.patch
>  create mode 100644 recipes/qt4/qt-4.7.3/0010-phonon-gstreamer-rgb-endian=
ess.patch
>  create mode 100644 recipes/qt4/qt-4.7.3/g++.conf
>  create mode 100644 recipes/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch
>  create mode 100644 recipes/qt4/qt-4.7.3/linux.conf
>  create mode 100644 recipes/qt4/qt4-embedded-gles_4.7.3.bb
>  create mode 100644 recipes/qt4/qt4-embedded_4.7.3.bb
>  create mode 100644 recipes/qt4/qt4-native_4.7.3.bb
>  create mode 100644 recipes/qt4/qt4-tools-sdk_4.7.3.bb
>  create mode 100644 recipes/qt4/qt4-x11-free-gles_4.7.3.bb
>  create mode 100644 recipes/qt4/qt4-x11-free_4.7.3.bb
>=20
> diff --git a/recipes/qt4/qt-4.7.3.inc b/recipes/qt4/qt-4.7.3.inc
> new file mode 100644
> index 0000000..4e9c96a
> --- /dev/null
> +++ b/recipes/qt4/qt-4.7.3.inc
> @@ -0,0 +1,72 @@
> +DEFAULT_PREFERENCE =3D "-1"
> +LICENSE =3D "LGPLv2.1 GPLv3"
> +
> +FILESPATHPKG =3D. "qt-${PV}:"
> +
> +SRC_URI =3D "\
> +	ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.ta=
r.gz \
> +	file://0004-no-qmake.patch \
> +	file://hack-out-pg2-4.7.0.patch \
> +	file://0006-freetype-host-includes.patch \
> +	file://0001-Added-Openembedded-crossarch-option.patch \
> +	file://0010-phonon-gstreamer-rgb-endianess.patch \
> +	file://g++.conf \
> +	file://linux.conf \
> +           "
> +# Set necessary variables in the profile
> +SRC_URI +=3D "file://qte.sh"
> +
> +S =3D "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
> +
> +FILES_${QT_BASE_NAME}-tools                +=3D "${bindir}/qml"
> +
> +do_configure_prepend() {
> +    for pro in $(find ${S} -name "*.pro") ; do
> +        sed -i 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' $=
pro
> +    done
> +
> +    sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
> +    sed -i \
> +    -e /QMAKE_MOC\ /d \
> +    -e /QMAKE_UIC\ /d \
> +    -e /QMAKE_UIC3\ /d \
> +    -e /QMAKE_RCC\ /d \
> +    ${S}/configure
> +}
> +
> +do_configure_append() {
> +    sed -e '/QMAKE_TARGET /d' -e '/TARGET /d' -i ${S}/translations/Makef=
ile
> +}
> +
> +QT_GLFLAGS ?=3D ""
> +QT_CONFIG_FLAGS +=3D " -javascript-jit -script -scripttools -declarative=
 -xmlpatterns -no-rpath -qt3support -reduce-relocations -silent ${QT_GLFLAG=
S}"
> +
> +do_compile() {
> +    # Fixup missing wsegl header in some SGX SDKs
> +    if ! [ -e ${STAGING_INCDIR}/wsegl.h ] ; then
> +        cp src/3rdparty/powervr/wsegl.h src/plugins/gfxdrivers/powervr/Q=
WSWSEGL/
> +    fi
> +
> +    unset CFLAGS CXXFLAGS
> +    install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rcc
> +    install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/moc
> +    install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/uic
> +    install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/bin/lrelease
> +
> +    oe_runmake ${EXTRA_ENV}
> +}
> +
> +do_install_append() {
> +	install -d ${D}${bindir}
> +	for i in rcc uic moc ; do
> +		install -m 0755 ${S}/bin/$i ${D}${bindir}/
> +	done
> +
> +        #Append an E to the qtdemo file
> +        if [ -n "${QT_LIBINFIX}" ] ; then
> +                mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFI=
X}
> +        fi
> +}
> +
> +SRC_URI[md5sum] =3D "49b96eefb1224cc529af6fe5608654fe"
> +SRC_URI[sha256sum] =3D "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956=
e328c2991905937e"
> diff --git a/recipes/qt4/qt-4.7.3/0001-Added-Openembedded-crossarch-optio=
n.patch b/recipes/qt4/qt-4.7.3/0001-Added-Openembedded-crossarch-option.pat=
ch
> new file mode 100644
> index 0000000..71a04a5
> --- /dev/null
> +++ b/recipes/qt4/qt-4.7.3/0001-Added-Openembedded-crossarch-option.patch
> @@ -0,0 +1,44 @@
> +From b1ba119f6a824dc01bd42ee00dba4a1653867b72 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Matthias=3D20G=3DC3=3DBCnther?=3D <matgnt@gmail.com>
> +Date: Wed, 12 May 2010 16:52:45 +0200
> +Subject: [PATCH 1/9] Added Openembedded "-crossarch" option
> +
> +---
> + configure |    7 ++++++-
> + 1 files changed, 6 insertions(+), 1 deletions(-)
> +
> +diff --git a/configure b/configure
> +index facd192..9d15136 100755
> +--- a/configure
> ++++ b/configure
> +@@ -954,7 +954,7 @@ while [ "$#" -gt 0 ]; do
> +         shift
> +         VAL=3D$1
> +         ;;
> +-    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-=
bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-no=
make|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config)
> ++    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-=
bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-no=
make|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-cr=
ossarch)
> +         VAR=3D`echo $1 | sed "s,^-\(.*\),\1,"`
> +         shift
> +         VAL=3D"$1"
> +@@ -1443,6 +1443,9 @@ while [ "$#" -gt 0 ]; do
> +     xplatform)
> +         XPLATFORM=3D"$VAL"
> +         ;;
> ++	crossarch)
> ++		CROSSARCH=3D"$VAL"
> ++		;;
> +     debug-and-release)
> +         if [ "$VAL" =3D "yes" ] || [ "$VAL" =3D "no" ]; then
> +             CFG_DEBUG_RELEASE=3D"$VAL"
> +@@ -2918,6 +2921,8 @@ elif [ "$PLATFORM_MAC" =3D "yes" ] || [ -z "$CFG_A=
RCH" ]; then
> +     CFG_ARCH=3D$CFG_HOST_ARCH
> + fi
> +=20
> ++CFG_ARCH=3D"$CROSSARCH"
> ++
> + if [ -d "$relpath/src/corelib/arch/$CFG_ARCH" ]; then
> +     if [ "$OPT_VERBOSE" =3D "yes" ]; then
> +         echo "    '$CFG_ARCH' is supported"
> +--=20
> +1.7.0.4
> +
> diff --git a/recipes/qt4/qt-4.7.3/0010-phonon-gstreamer-rgb-endianess.pat=
ch b/recipes/qt4/qt-4.7.3/0010-phonon-gstreamer-rgb-endianess.patch
> new file mode 100644
> index 0000000..d43366c
> --- /dev/null
> +++ b/recipes/qt4/qt-4.7.3/0010-phonon-gstreamer-rgb-endianess.patch
> @@ -0,0 +1,23 @@
> +--- a/src/3rdparty/phonon/gstreamer/qwidgetvideosink.cpp
> ++++ b/src/3rdparty/phonon/gstreamer/qwidgetvideosink.cpp
> +@@ -18,6 +18,7 @@
> + #include <QApplication>
> + #include "videowidget.h"
> + #include "qwidgetvideosink.h"
> ++#include <gst/video/video.h>
> +=20
> + QT_BEGIN_NAMESPACE
> +=20
> +@@ -106,11 +107,7 @@ static GstStaticPadTemplate template_factory_rgb =3D
> +     GST_STATIC_PAD_TEMPLATE("sink",
> +                             GST_PAD_SINK,
> +                             GST_PAD_ALWAYS,
> +-                            GST_STATIC_CAPS("video/x-raw-rgb, "
> +-                                            "framerate =3D (fraction) [=
 0, MAX ], "
> +-                                            "width =3D (int) [ 1, MAX ]=
, "
> +-                                            "height =3D (int) [ 1, MAX =
],"
> +-                                            "bpp =3D (int) 32"));
> ++                            GST_STATIC_CAPS(GST_VIDEO_CAPS_xRGB_HOST_EN=
DIAN));
> +=20
> + template <VideoFormat FMT>
> + struct template_factory;=20
> diff --git a/recipes/qt4/qt-4.7.3/g++.conf b/recipes/qt4/qt-4.7.3/g++.conf
> new file mode 100644
> index 0000000..80f925c
> --- /dev/null
> +++ b/recipes/qt4/qt-4.7.3/g++.conf
> @@ -0,0 +1,60 @@
> +#
> +# qmake configuration for common gcc
> +#
> +
> +QMAKE_CC       =3D $(OE_QMAKE_CC)
> +QMAKE_CFLAGS       +=3D -pipe $(OE_QMAKE_CFLAGS)
> +QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO +=3D $(OE_QMAKE_CFLAGS)
> +QMAKE_CFLAGS_DEPS	+=3D -M
> +QMAKE_CFLAGS_WARN_ON	+=3D -Wall -W
> +QMAKE_CFLAGS_WARN_OFF	+=3D -w
> +QMAKE_CFLAGS_RELEASE	+=3D
> +QMAKE_CFLAGS_DEBUG	+=3D -g
> +QMAKE_CFLAGS_SHLIB	+=3D -fPIC
> +QMAKE_CFLAGS_STATIC_LIB	+=3D -fPIC
> +QMAKE_CFLAGS_YACC	+=3D -Wno-unused -Wno-parentheses
> +QMAKE_CFLAGS_HIDESYMS   +=3D -fvisibility=3Dhidden
> +QMAKE_CFLAGS_PRECOMPILE +=3D -x c-header -c ${QMAKE_PCH_INPUT} -o ${QMAK=
E_PCH_OUTPUT}
> +QMAKE_CFLAGS_USE_PRECOMPILE +=3D -include ${QMAKE_PCH_OUTPUT_BASE}
> +
> +QMAKE_CXX      =3D $(OE_QMAKE_CXX)
> +QMAKE_CXXFLAGS     +=3D $$QMAKE_CFLAGS $(OE_QMAKE_CXXFLAGS)
> +QMAKE_CXXFLAGS_DEPS	+=3D $$QMAKE_CFLAGS_DEPS
> +QMAKE_CXXFLAGS_WARN_ON	+=3D $$QMAKE_CFLAGS_WARN_ON
> +QMAKE_CXXFLAGS_WARN_OFF	+=3D $$QMAKE_CFLAGS_WARN_OFF
> +QMAKE_CXXFLAGS_RELEASE	+=3D $$QMAKE_CFLAGS_RELEASE
> +QMAKE_CXXFLAGS_RELEASE_WITH_DEBUGINFO +=3D $$QMAKE_CFLAGS_RELEASE_WITH_D=
EBUGINFO
> +QMAKE_CXXFLAGS_DEBUG	+=3D $$QMAKE_CFLAGS_DEBUG
> +QMAKE_CXXFLAGS_SHLIB	+=3D $$QMAKE_CFLAGS_SHLIB
> +QMAKE_CXXFLAGS_STATIC_LIB +=3D $$QMAKE_CFLAGS_STATIC_LIB
> +QMAKE_CXXFLAGS_YACC	+=3D $$QMAKE_CFLAGS_YACC
> +QMAKE_CXXFLAGS_HIDESYMS +=3D $$QMAKE_CFLAGS_HIDESYMS -fvisibility-inline=
s-hidden
> +QMAKE_CXXFLAGS_PRECOMPILE +=3D -x c++-header -c ${QMAKE_PCH_INPUT} -o ${=
QMAKE_PCH_OUTPUT}
> +QMAKE_CXXFLAGS_USE_PRECOMPILE =3D $$QMAKE_CFLAGS_USE_PRECOMPILE
> +
> +QMAKE_LINK     =3D $(OE_QMAKE_LINK)
> +QMAKE_LINK_SHLIB   =3D $(OE_QMAKE_LINK)
> +QMAKE_LINK_C		=3D $(OE_QMAKE_LINK)
> +QMAKE_LINK_C_SHLIB	=3D $(OE_QMAKE_LINK)
> +QMAKE_LFLAGS       +=3D $(OE_QMAKE_LDFLAGS)
> +QMAKE_LFLAGS_RELEASE	+=3D
> +QMAKE_LFLAGS_DEBUG	+=3D
> +QMAKE_LFLAGS_APP	+=3D
> +QMAKE_LFLAGS_SHLIB	+=3D -shared
> +QMAKE_LFLAGS_PLUGIN	+=3D $$QMAKE_LFLAGS_SHLIB
> +QMAKE_LFLAGS_SONAME	+=3D -Wl,-soname,
> +QMAKE_LFLAGS_THREAD	+=3D
> +QMAKE_LFLAGS_NOUNDEF	+=3D -Wl,--no-undefined
> +QMAKE_LFLAGS_RPATH        =3D -Wl,-rpath-link,
> +
> +QMAKE_PCH_OUTPUT_EXT    =3D .gch
> +
> +# -Bsymbolic-functions (ld) support
> +QMAKE_LFLAGS_BSYMBOLIC_FUNC =3D -Wl,-Bsymbolic-functions
> +QMAKE_LFLAGS_DYNAMIC_LIST =3D -Wl,--dynamic-list,
> +
> +# some linking helper...
> +CONFIG +=3D rpath_libdirs
> +
> +# for the SDK
> +isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG =3D $(OE_QMAKE_QT_CONFIG)
> diff --git a/recipes/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch b/recipes/qt4/=
qt-4.7.3/hack-out-pg2-4.7.0.patch
> new file mode 100644
> index 0000000..5c588ff
> --- /dev/null
> +++ b/recipes/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch
> @@ -0,0 +1,19 @@
> +Index: qt-everywhere-opensource-src-4.7.0/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qt-everywhere-opensource-src-4.7.0.orig/configure	2010-09-22 15:43:5=
1.191162141 -0400
> ++++ qt-everywhere-opensource-src-4.7.0/configure	2010-09-22 15:44:35.179=
981232 -0400
> +@@ -4921,10 +4921,10 @@
> +         psql)
> +             if [ "$CFG_SQL_psql" !=3D "no" ]; then
> +                 # Be careful not to use native pg_config when cross bui=
lding.
> +-                if [ "$XPLATFORM_MINGW" !=3D "yes" ] && "$WHICH" pg_con=
fig >/dev/null 2>&1; then
> +-                    QT_CFLAGS_PSQL=3D`pg_config --includedir 2>/dev/nul=
l`
> +-                    QT_LFLAGS_PSQL=3D`pg_config --libdir 2>/dev/null`
> +-                fi
> ++#                if [ "$XPLATFORM_MINGW" !=3D "yes" ] && "$WHICH" pg_co=
nfig >/dev/null 2>&1; then
> ++#                    QT_CFLAGS_PSQL=3D`pg_config --includedir 2>/dev/nu=
ll`
> ++#                    QT_LFLAGS_PSQL=3D`pg_config --libdir 2>/dev/null`
> ++#                fi
> +                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL=3D"-I$QT_CFL=
AGS_PSQL"
> +                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL=3D"-L$QT_LFL=
AGS_PSQL"
> +                 # But, respect PSQL_LIBS if set
> diff --git a/recipes/qt4/qt-4.7.3/linux.conf b/recipes/qt4/qt-4.7.3/linux=
=2Econf
> new file mode 100644
> index 0000000..a541355
> --- /dev/null
> +++ b/recipes/qt4/qt-4.7.3/linux.conf
> @@ -0,0 +1,66 @@
> +#
> +# qmake configuration for common linux
> +#
> +
> +QMAKE_CFLAGS_THREAD	+=3D -D_REENTRANT
> +QMAKE_CXXFLAGS_THREAD	+=3D $$QMAKE_CFLAGS_THREAD
> +
> +QMAKE_INCDIR          =3D
> +QMAKE_LIBDIR          =3D
> +QMAKE_INCDIR_X11      =3D
> +QMAKE_LIBDIR_X11      =3D
> +QMAKE_INCDIR_QT       =3D $(OE_QMAKE_INCDIR_QT)
> +QMAKE_LIBDIR_QT       =3D $(OE_QMAKE_LIBDIR_QT)
> +QMAKE_INCDIR_OPENGL   =3D
> +QMAKE_LIBDIR_OPENGL   =3D
> +QMAKE_INCDIR_OPENGL_ES1 =3D $$QMAKE_INCDIR_OPENGL
> +QMAKE_LIBDIR_OPENGL_ES1 =3D $$QMAKE_LIBDIR_OPENGL
> +QMAKE_INCDIR_OPENGL_ES2 =3D $$QMAKE_INCDIR_OPENGL
> +QMAKE_LIBDIR_OPENGL_ES2 =3D $$QMAKE_LIBDIR_OPENGL
> +QMAKE_INCDIR_EGL      =3D
> +QMAKE_LIBDIR_EGL      =3D
> +QMAKE_INCDIR_OPENVG   =3D
> +QMAKE_LIBDIR_OPENVG   =3D
> +
> +
> +QMAKE_LIBS            =3D
> +QMAKE_LIBS_DYNLOAD    =3D -ldl
> +QMAKE_LIBS_X11        =3D $(OE_QMAKE_LIBS_X11)
> +QMAKE_LIBS_X11SM      =3D $(OE_QMAKE_LIBS_X11SM)
> +QMAKE_LIBS_NIS        =3D -lnsl
> +QMAKE_LIBS_EGL        =3D -lEGL
> +QMAKE_LIBS_OPENGL     =3D -lGLU -lGL
> +QMAKE_LIBS_OPENGL_QT  =3D -lGL
> +QMAKE_LIBS_OPENGL_ES1 =3D -lGLES_CM
> +QMAKE_LIBS_OPENGL_ES2 =3D -lGLESv2
> +QMAKE_LIBS_OPENVG     =3D -lOpenVG
> +QMAKE_LIBS_THREAD     =3D -lpthread
> +
> +QMAKE_MOC             =3D $(OE_QMAKE_MOC)
> +QMAKE_UIC             =3D $(OE_QMAKE_UIC)
> +QMAKE_UIC3            =3D $(OE_QMAKE_UIC3)
> +QMAKE_RCC             =3D $(OE_QMAKE_RCC)
> +QMAKE_QDBUSCPP2XML    =3D $(OE_QMAKE_QDBUSCPP2XML)
> +QMAKE_QDBUSXML2CPP    =3D $(OE_QMAKE_QDBUSXML2CPP)
> +
> +QMAKE_AR              =3D $(OE_QMAKE_AR) cqs
> +QMAKE_OBJCOPY         =3D objcopy
> +QMAKE_RANLIB          =3D
> +
> +QMAKE_TAR             =3D tar -cf
> +QMAKE_GZIP            =3D gzip -9f
> +
> +QMAKE_COPY            =3D cp -f
> +QMAKE_COPY_FILE       =3D $(COPY)
> +QMAKE_COPY_DIR        =3D $(COPY) -r
> +QMAKE_MOVE            =3D mv -f
> +QMAKE_DEL_FILE        =3D rm -f
> +QMAKE_DEL_DIR         =3D rmdir
> +QMAKE_STRIP           =3D $(OE_QMAKE_STRIP)
> +QMAKE_STRIPFLAGS_LIB +=3D --strip-unneeded
> +QMAKE_CHK_DIR_EXISTS  =3D test -d
> +QMAKE_MKDIR           =3D mkdir -p
> +QMAKE_INSTALL_FILE    =3D install -m 644 -p
> +QMAKE_INSTALL_PROGRAM =3D install -m 755 -p
> +
> +include(unix.conf)
> diff --git a/recipes/qt4/qt4-embedded-gles_4.7.3.bb b/recipes/qt4/qt4-emb=
edded-gles_4.7.3.bb
> new file mode 100644
> index 0000000..8ab5a6c
> --- /dev/null
> +++ b/recipes/qt4/qt4-embedded-gles_4.7.3.bb
> @@ -0,0 +1,19 @@
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +require qt4-embedded.inc
> +
> +PR =3D "${INC_PR}.10"
> +
> +QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
> +
> +PROVIDES +=3D "qt4-embedded"
> +QT_GLFLAGS =3D "-opengl es2 -depths 16,24,32  -plugin-gfx-powervr"
> +=20
> +FILESPATHPKG .=3D ":qt4-embedded-${PV}:qt4-embedded"
> +
> +require qt-${PV}.inc
> +
> +QT_CONFIG_FLAGS +=3D " \
> + -exceptions \
> +"
> +
> diff --git a/recipes/qt4/qt4-embedded_4.7.3.bb b/recipes/qt4/qt4-embedded=
_4.7.3.bb
> new file mode 100644
> index 0000000..7e3d4b8
> --- /dev/null
> +++ b/recipes/qt4/qt4-embedded_4.7.3.bb
> @@ -0,0 +1,14 @@
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +require qt4-embedded.inc
> +
> +PR =3D "${INC_PR}.1"
> +
> +QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
> +
> +require qt-${PV}.inc
> +
> +QT_CONFIG_FLAGS +=3D " \
> + -exceptions \
> +"
> +
> diff --git a/recipes/qt4/qt4-native_4.7.3.bb b/recipes/qt4/qt4-native_4.7=
=2E3.bb
> new file mode 100644
> index 0000000..a6880a6
> --- /dev/null
> +++ b/recipes/qt4/qt4-native_4.7.3.bb
> @@ -0,0 +1,19 @@
> +require qt4-native.inc
> +LICENSE =3D "LGPLv2.1 GPLv3"
> +
> +PR =3D "${INC_PR}.0"
> +
> +# Find the g++.conf/linux.conf in the right directory.
> +FILESPATHPKG =3D. "qt-${PV}:"
> +SRC_URI =3D "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-=
src-${PV}.tar.gz \
> +           file://qt-config.patch \
> +           file://g++.conf \
> +           file://linux.conf"
> +S =3D "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
> +
> +EXTRA_OECONF +=3D " -no-fast -silent -no-rpath"
> +
> +TOBUILD :=3D "src/tools/bootstrap ${TOBUILD}"
> +
> +SRC_URI[md5sum] =3D "49b96eefb1224cc529af6fe5608654fe"
> +SRC_URI[sha256sum] =3D "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956=
e328c2991905937e"
> diff --git a/recipes/qt4/qt4-tools-sdk_4.7.3.bb b/recipes/qt4/qt4-tools-s=
dk_4.7.3.bb
> new file mode 100644
> index 0000000..832d389
> --- /dev/null
> +++ b/recipes/qt4/qt4-tools-sdk_4.7.3.bb
> @@ -0,0 +1,8 @@
> +require qt4-tools-sdk.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRC_URI[md5sum] =3D "49b96eefb1224cc529af6fe5608654fe"
> +SRC_URI[sha256sum] =3D "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956=
e328c2991905937e"
> diff --git a/recipes/qt4/qt4-x11-free-gles_4.7.3.bb b/recipes/qt4/qt4-x11=
-free-gles_4.7.3.bb
> new file mode 100644
> index 0000000..c5fd6f3
> --- /dev/null
> +++ b/recipes/qt4/qt4-x11-free-gles_4.7.3.bb
> @@ -0,0 +1,19 @@
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +require qt4-x11-free.inc
> +PR =3D "${INC_PR}.7"
> +
> +QT_GLFLAGS =3D "-opengl es2 -depths 16,24,32 "
> +
> +require qt-${PV}.inc
> +
> +QT_CONFIG_FLAGS +=3D " \
> + -no-embedded \
> + -xrandr \
> + -x11"
> +
> +FILESPATHPKG .=3D ":qt4-x11-free-${PV}:qt4-x11-free"
> +
> +DEPENDS +=3D "virtual/egl"
> +require recipes/egl/egl.inc
> +PROVIDES +=3D "qt4-x11-free"
> diff --git a/recipes/qt4/qt4-x11-free_4.7.3.bb b/recipes/qt4/qt4-x11-free=
_4.7.3.bb
> new file mode 100644
> index 0000000..79a765e
> --- /dev/null
> +++ b/recipes/qt4/qt4-x11-free_4.7.3.bb
> @@ -0,0 +1,15 @@
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +require qt4-x11-free.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
> +
> +require qt-${PV}.inc
> +
> +QT_CONFIG_FLAGS +=3D " \
> + -no-embedded \
> + -xrandr \
> + -x11"
> +
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3LnokACgkQN1Ujt2V2gBw62wCgtW5yPeWAriPFmhokCIWLBtGN
eh0AoIFm+rneyWv+xNEjZBdZ2lDZCIwx
=Xkbh
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
