Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKReS-0008Q2-EI
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 10:53:45 +0200
Received: by fxm19 with SMTP id 19so1025312fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 01:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=SQaM/BZRJfMS1eoUZhqXih5ThjaGXqy+m9iNSaidQ2M=;
	b=BNQMm9vmcBYCrQZXd1CwxDSyqZUSZ78b1LLRUg7TW2SnogKQlEMsL6vKsgN/u7fOSu
	287sHy/FSJn5XqZF7M9LDVwbOvsZXhLhxJyCkt1WK+xmZlsAm4zDi/wVkutyEvW9Iz6o
	u9Q9Kr8RXi7JgYZaW5Dj1kVNwUfcvvzx03R00=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=otTBXNFS8XfcYSmNEgtsaDWeWMR5tZH7DSMvtNygQZD8it5chL3dlNNBvtZRcpVloe
	lqhEiYlv1yJlN2Nt3FQ8Q/5owAUQGK11IT29qQVcD2BVKgGXSz1LAqriiKVvzdrxKiHN
	Lgv/foQWR4NdlcxSUguqrw5J8fXTsBLIgHXEU=
Received: by 10.223.20.210 with SMTP id g18mr3686fab.30.1305190089577;
	Thu, 12 May 2011 01:48:09 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c22sm372131fat.14.2011.05.12.01.48.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2011 01:48:08 -0700 (PDT)
Date: Thu, 12 May 2011 10:48:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110512084802.GC3423@jama.jama.net>
References: <1305145805-14609-1-git-send-email-eric@eukrea.com>
	<1305145805-14609-7-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1305145805-14609-7-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 6/6] qt4: remove 4.7.2
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
X-List-Received-Date: Thu, 12 May 2011 08:53:45 -0000
X-Groupsio-MsgNum: 31935
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Content-Disposition: inline

--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2011 at 10:30:05PM +0200, Eric B=E9nard wrote:
> now that 4.7.3 is prefered for all distributions

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  recipes/qt4/qt-4.7.2.inc                           |   73 --------------=
------
>  .../0001-Added-Openembedded-crossarch-option.patch |   44 ------------
>  .../0010-phonon-gstreamer-rgb-endianess.patch      |   23 ------
>  recipes/qt4/qt-4.7.2/g++.conf                      |   60 --------------=
--
>  recipes/qt4/qt-4.7.2/hack-out-pg2-4.7.0.patch      |   19 -----
>  recipes/qt4/qt-4.7.2/linux.conf                    |   66 --------------=
----
>  recipes/qt4/qt4-embedded-gles_4.7.2.bb             |   19 -----
>  recipes/qt4/qt4-embedded_4.7.2.bb                  |   14 ----
>  recipes/qt4/qt4-native_4.7.2.bb                    |   19 -----
>  recipes/qt4/qt4-tools-sdk_4.7.2.bb                 |    8 --
>  recipes/qt4/qt4-x11-free-gles_4.7.2.bb             |   19 -----
>  recipes/qt4/qt4-x11-free_4.7.2.bb                  |   15 ----
>  12 files changed, 0 insertions(+), 379 deletions(-)
>  delete mode 100644 recipes/qt4/qt-4.7.2.inc
>  delete mode 100644 recipes/qt4/qt-4.7.2/0001-Added-Openembedded-crossarc=
h-option.patch
>  delete mode 100644 recipes/qt4/qt-4.7.2/0010-phonon-gstreamer-rgb-endian=
ess.patch
>  delete mode 100644 recipes/qt4/qt-4.7.2/g++.conf
>  delete mode 100644 recipes/qt4/qt-4.7.2/hack-out-pg2-4.7.0.patch
>  delete mode 100644 recipes/qt4/qt-4.7.2/linux.conf
>  delete mode 100644 recipes/qt4/qt4-embedded-gles_4.7.2.bb
>  delete mode 100644 recipes/qt4/qt4-embedded_4.7.2.bb
>  delete mode 100644 recipes/qt4/qt4-native_4.7.2.bb
>  delete mode 100644 recipes/qt4/qt4-tools-sdk_4.7.2.bb
>  delete mode 100644 recipes/qt4/qt4-x11-free-gles_4.7.2.bb
>  delete mode 100644 recipes/qt4/qt4-x11-free_4.7.2.bb
>=20
> diff --git a/recipes/qt4/qt-4.7.2.inc b/recipes/qt4/qt-4.7.2.inc
> deleted file mode 100644
> index e6a7b90..0000000
> --- a/recipes/qt4/qt-4.7.2.inc
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -DEFAULT_PREFERENCE =3D "-1"
> -LICENSE =3D "LGPLv2.1 GPLv3"
> -
> -FILESPATHPKG =3D. "qt-${PV}:"
> -
> -SRC_URI =3D "\
> -	ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.ta=
r.gz \
> -	file://blacklist-fraudulent-comodo-certificates-patch.diff \
> -	file://0004-no-qmake.patch \
> -	file://hack-out-pg2-4.7.0.patch \
> -	file://0006-freetype-host-includes.patch \
> -	file://0001-Added-Openembedded-crossarch-option.patch \
> -	file://0010-phonon-gstreamer-rgb-endianess.patch \
> -	file://g++.conf \
> -	file://linux.conf \
> -           "
> -# Set necessary variables in the profile
> -SRC_URI +=3D "file://qte.sh"
> -
> -S =3D "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
> -
> -FILES_${QT_BASE_NAME}-tools                +=3D "${bindir}/qml"
> -
> -do_configure_prepend() {
> -    for pro in $(find ${S} -name "*.pro") ; do
> -        sed -i 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' $=
pro
> -    done
> -
> -    sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
> -    sed -i \
> -    -e /QMAKE_MOC\ /d \
> -    -e /QMAKE_UIC\ /d \
> -    -e /QMAKE_UIC3\ /d \
> -    -e /QMAKE_RCC\ /d \
> -    ${S}/configure
> -}
> -
> -do_configure_append() {
> -    sed -e '/QMAKE_TARGET /d' -e '/TARGET /d' -i ${S}/translations/Makef=
ile
> -}
> -
> -QT_GLFLAGS ?=3D ""
> -QT_CONFIG_FLAGS +=3D " -javascript-jit -script -scripttools -declarative=
 -xmlpatterns -no-rpath -qt3support -reduce-relocations -silent ${QT_GLFLAG=
S}"
> -
> -do_compile() {
> -    # Fixup missing wsegl header in some SGX SDKs
> -    if ! [ -e ${STAGING_INCDIR}/wsegl.h ] ; then
> -        cp src/3rdparty/powervr/wsegl.h src/plugins/gfxdrivers/powervr/Q=
WSWSEGL/
> -    fi
> -
> -    unset CFLAGS CXXFLAGS
> -    install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rcc
> -    install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/moc
> -    install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/uic
> -    install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/bin/lrelease
> -
> -    oe_runmake ${EXTRA_ENV}
> -}
> -
> -do_install_append() {
> -	install -d ${D}${bindir}
> -	for i in rcc uic moc ; do
> -		install -m 0755 ${S}/bin/$i ${D}${bindir}/
> -	done
> -
> -        #Append an E to the qtdemo file
> -        if [ -n "${QT_LIBINFIX}" ] ; then
> -                mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFI=
X}
> -        fi
> -}
> -
> -SRC_URI[md5sum] =3D "66b992f5c21145df08c99d21847f4fdb"
> -SRC_URI[sha256sum] =3D "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49eb=
c2d553cd3eb49336"
> diff --git a/recipes/qt4/qt-4.7.2/0001-Added-Openembedded-crossarch-optio=
n.patch b/recipes/qt4/qt-4.7.2/0001-Added-Openembedded-crossarch-option.pat=
ch
> deleted file mode 100644
> index 71a04a5..0000000
> --- a/recipes/qt4/qt-4.7.2/0001-Added-Openembedded-crossarch-option.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From b1ba119f6a824dc01bd42ee00dba4a1653867b72 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Matthias=3D20G=3DC3=3DBCnther?=3D <matgnt@gmail.com>
> -Date: Wed, 12 May 2010 16:52:45 +0200
> -Subject: [PATCH 1/9] Added Openembedded "-crossarch" option
> -
> ----
> - configure |    7 ++++++-
> - 1 files changed, 6 insertions(+), 1 deletions(-)
> -
> -diff --git a/configure b/configure
> -index facd192..9d15136 100755
> ---- a/configure
> -+++ b/configure
> -@@ -954,7 +954,7 @@ while [ "$#" -gt 0 ]; do
> -         shift
> -         VAL=3D$1
> -         ;;
> --    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-=
bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-no=
make|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config)
> -+    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-=
bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-no=
make|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-cr=
ossarch)
> -         VAR=3D`echo $1 | sed "s,^-\(.*\),\1,"`
> -         shift
> -         VAL=3D"$1"
> -@@ -1443,6 +1443,9 @@ while [ "$#" -gt 0 ]; do
> -     xplatform)
> -         XPLATFORM=3D"$VAL"
> -         ;;
> -+	crossarch)
> -+		CROSSARCH=3D"$VAL"
> -+		;;
> -     debug-and-release)
> -         if [ "$VAL" =3D "yes" ] || [ "$VAL" =3D "no" ]; then
> -             CFG_DEBUG_RELEASE=3D"$VAL"
> -@@ -2918,6 +2921,8 @@ elif [ "$PLATFORM_MAC" =3D "yes" ] || [ -z "$CFG_A=
RCH" ]; then
> -     CFG_ARCH=3D$CFG_HOST_ARCH
> - fi
> -=20
> -+CFG_ARCH=3D"$CROSSARCH"
> -+
> - if [ -d "$relpath/src/corelib/arch/$CFG_ARCH" ]; then
> -     if [ "$OPT_VERBOSE" =3D "yes" ]; then
> -         echo "    '$CFG_ARCH' is supported"
> ---=20
> -1.7.0.4
> -
> diff --git a/recipes/qt4/qt-4.7.2/0010-phonon-gstreamer-rgb-endianess.pat=
ch b/recipes/qt4/qt-4.7.2/0010-phonon-gstreamer-rgb-endianess.patch
> deleted file mode 100644
> index d43366c..0000000
> --- a/recipes/qt4/qt-4.7.2/0010-phonon-gstreamer-rgb-endianess.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> ---- a/src/3rdparty/phonon/gstreamer/qwidgetvideosink.cpp
> -+++ b/src/3rdparty/phonon/gstreamer/qwidgetvideosink.cpp
> -@@ -18,6 +18,7 @@
> - #include <QApplication>
> - #include "videowidget.h"
> - #include "qwidgetvideosink.h"
> -+#include <gst/video/video.h>
> -=20
> - QT_BEGIN_NAMESPACE
> -=20
> -@@ -106,11 +107,7 @@ static GstStaticPadTemplate template_factory_rgb =3D
> -     GST_STATIC_PAD_TEMPLATE("sink",
> -                             GST_PAD_SINK,
> -                             GST_PAD_ALWAYS,
> --                            GST_STATIC_CAPS("video/x-raw-rgb, "
> --                                            "framerate =3D (fraction) [=
 0, MAX ], "
> --                                            "width =3D (int) [ 1, MAX ]=
, "
> --                                            "height =3D (int) [ 1, MAX =
],"
> --                                            "bpp =3D (int) 32"));
> -+                            GST_STATIC_CAPS(GST_VIDEO_CAPS_xRGB_HOST_EN=
DIAN));
> -=20
> - template <VideoFormat FMT>
> - struct template_factory;=20
> diff --git a/recipes/qt4/qt-4.7.2/g++.conf b/recipes/qt4/qt-4.7.2/g++.conf
> deleted file mode 100644
> index 80f925c..0000000
> --- a/recipes/qt4/qt-4.7.2/g++.conf
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -#
> -# qmake configuration for common gcc
> -#
> -
> -QMAKE_CC       =3D $(OE_QMAKE_CC)
> -QMAKE_CFLAGS       +=3D -pipe $(OE_QMAKE_CFLAGS)
> -QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO +=3D $(OE_QMAKE_CFLAGS)
> -QMAKE_CFLAGS_DEPS	+=3D -M
> -QMAKE_CFLAGS_WARN_ON	+=3D -Wall -W
> -QMAKE_CFLAGS_WARN_OFF	+=3D -w
> -QMAKE_CFLAGS_RELEASE	+=3D
> -QMAKE_CFLAGS_DEBUG	+=3D -g
> -QMAKE_CFLAGS_SHLIB	+=3D -fPIC
> -QMAKE_CFLAGS_STATIC_LIB	+=3D -fPIC
> -QMAKE_CFLAGS_YACC	+=3D -Wno-unused -Wno-parentheses
> -QMAKE_CFLAGS_HIDESYMS   +=3D -fvisibility=3Dhidden
> -QMAKE_CFLAGS_PRECOMPILE +=3D -x c-header -c ${QMAKE_PCH_INPUT} -o ${QMAK=
E_PCH_OUTPUT}
> -QMAKE_CFLAGS_USE_PRECOMPILE +=3D -include ${QMAKE_PCH_OUTPUT_BASE}
> -
> -QMAKE_CXX      =3D $(OE_QMAKE_CXX)
> -QMAKE_CXXFLAGS     +=3D $$QMAKE_CFLAGS $(OE_QMAKE_CXXFLAGS)
> -QMAKE_CXXFLAGS_DEPS	+=3D $$QMAKE_CFLAGS_DEPS
> -QMAKE_CXXFLAGS_WARN_ON	+=3D $$QMAKE_CFLAGS_WARN_ON
> -QMAKE_CXXFLAGS_WARN_OFF	+=3D $$QMAKE_CFLAGS_WARN_OFF
> -QMAKE_CXXFLAGS_RELEASE	+=3D $$QMAKE_CFLAGS_RELEASE
> -QMAKE_CXXFLAGS_RELEASE_WITH_DEBUGINFO +=3D $$QMAKE_CFLAGS_RELEASE_WITH_D=
EBUGINFO
> -QMAKE_CXXFLAGS_DEBUG	+=3D $$QMAKE_CFLAGS_DEBUG
> -QMAKE_CXXFLAGS_SHLIB	+=3D $$QMAKE_CFLAGS_SHLIB
> -QMAKE_CXXFLAGS_STATIC_LIB +=3D $$QMAKE_CFLAGS_STATIC_LIB
> -QMAKE_CXXFLAGS_YACC	+=3D $$QMAKE_CFLAGS_YACC
> -QMAKE_CXXFLAGS_HIDESYMS +=3D $$QMAKE_CFLAGS_HIDESYMS -fvisibility-inline=
s-hidden
> -QMAKE_CXXFLAGS_PRECOMPILE +=3D -x c++-header -c ${QMAKE_PCH_INPUT} -o ${=
QMAKE_PCH_OUTPUT}
> -QMAKE_CXXFLAGS_USE_PRECOMPILE =3D $$QMAKE_CFLAGS_USE_PRECOMPILE
> -
> -QMAKE_LINK     =3D $(OE_QMAKE_LINK)
> -QMAKE_LINK_SHLIB   =3D $(OE_QMAKE_LINK)
> -QMAKE_LINK_C		=3D $(OE_QMAKE_LINK)
> -QMAKE_LINK_C_SHLIB	=3D $(OE_QMAKE_LINK)
> -QMAKE_LFLAGS       +=3D $(OE_QMAKE_LDFLAGS)
> -QMAKE_LFLAGS_RELEASE	+=3D
> -QMAKE_LFLAGS_DEBUG	+=3D
> -QMAKE_LFLAGS_APP	+=3D
> -QMAKE_LFLAGS_SHLIB	+=3D -shared
> -QMAKE_LFLAGS_PLUGIN	+=3D $$QMAKE_LFLAGS_SHLIB
> -QMAKE_LFLAGS_SONAME	+=3D -Wl,-soname,
> -QMAKE_LFLAGS_THREAD	+=3D
> -QMAKE_LFLAGS_NOUNDEF	+=3D -Wl,--no-undefined
> -QMAKE_LFLAGS_RPATH        =3D -Wl,-rpath-link,
> -
> -QMAKE_PCH_OUTPUT_EXT    =3D .gch
> -
> -# -Bsymbolic-functions (ld) support
> -QMAKE_LFLAGS_BSYMBOLIC_FUNC =3D -Wl,-Bsymbolic-functions
> -QMAKE_LFLAGS_DYNAMIC_LIST =3D -Wl,--dynamic-list,
> -
> -# some linking helper...
> -CONFIG +=3D rpath_libdirs
> -
> -# for the SDK
> -isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG =3D $(OE_QMAKE_QT_CONFIG)
> diff --git a/recipes/qt4/qt-4.7.2/hack-out-pg2-4.7.0.patch b/recipes/qt4/=
qt-4.7.2/hack-out-pg2-4.7.0.patch
> deleted file mode 100644
> index 5c588ff..0000000
> --- a/recipes/qt4/qt-4.7.2/hack-out-pg2-4.7.0.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Index: qt-everywhere-opensource-src-4.7.0/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- qt-everywhere-opensource-src-4.7.0.orig/configure	2010-09-22 15:43:5=
1.191162141 -0400
> -+++ qt-everywhere-opensource-src-4.7.0/configure	2010-09-22 15:44:35.179=
981232 -0400
> -@@ -4921,10 +4921,10 @@
> -         psql)
> -             if [ "$CFG_SQL_psql" !=3D "no" ]; then
> -                 # Be careful not to use native pg_config when cross bui=
lding.
> --                if [ "$XPLATFORM_MINGW" !=3D "yes" ] && "$WHICH" pg_con=
fig >/dev/null 2>&1; then
> --                    QT_CFLAGS_PSQL=3D`pg_config --includedir 2>/dev/nul=
l`
> --                    QT_LFLAGS_PSQL=3D`pg_config --libdir 2>/dev/null`
> --                fi
> -+#                if [ "$XPLATFORM_MINGW" !=3D "yes" ] && "$WHICH" pg_co=
nfig >/dev/null 2>&1; then
> -+#                    QT_CFLAGS_PSQL=3D`pg_config --includedir 2>/dev/nu=
ll`
> -+#                    QT_LFLAGS_PSQL=3D`pg_config --libdir 2>/dev/null`
> -+#                fi
> -                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL=3D"-I$QT_CFL=
AGS_PSQL"
> -                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL=3D"-L$QT_LFL=
AGS_PSQL"
> -                 # But, respect PSQL_LIBS if set
> diff --git a/recipes/qt4/qt-4.7.2/linux.conf b/recipes/qt4/qt-4.7.2/linux=
=2Econf
> deleted file mode 100644
> index a541355..0000000
> --- a/recipes/qt4/qt-4.7.2/linux.conf
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -#
> -# qmake configuration for common linux
> -#
> -
> -QMAKE_CFLAGS_THREAD	+=3D -D_REENTRANT
> -QMAKE_CXXFLAGS_THREAD	+=3D $$QMAKE_CFLAGS_THREAD
> -
> -QMAKE_INCDIR          =3D
> -QMAKE_LIBDIR          =3D
> -QMAKE_INCDIR_X11      =3D
> -QMAKE_LIBDIR_X11      =3D
> -QMAKE_INCDIR_QT       =3D $(OE_QMAKE_INCDIR_QT)
> -QMAKE_LIBDIR_QT       =3D $(OE_QMAKE_LIBDIR_QT)
> -QMAKE_INCDIR_OPENGL   =3D
> -QMAKE_LIBDIR_OPENGL   =3D
> -QMAKE_INCDIR_OPENGL_ES1 =3D $$QMAKE_INCDIR_OPENGL
> -QMAKE_LIBDIR_OPENGL_ES1 =3D $$QMAKE_LIBDIR_OPENGL
> -QMAKE_INCDIR_OPENGL_ES2 =3D $$QMAKE_INCDIR_OPENGL
> -QMAKE_LIBDIR_OPENGL_ES2 =3D $$QMAKE_LIBDIR_OPENGL
> -QMAKE_INCDIR_EGL      =3D
> -QMAKE_LIBDIR_EGL      =3D
> -QMAKE_INCDIR_OPENVG   =3D
> -QMAKE_LIBDIR_OPENVG   =3D
> -
> -
> -QMAKE_LIBS            =3D
> -QMAKE_LIBS_DYNLOAD    =3D -ldl
> -QMAKE_LIBS_X11        =3D $(OE_QMAKE_LIBS_X11)
> -QMAKE_LIBS_X11SM      =3D $(OE_QMAKE_LIBS_X11SM)
> -QMAKE_LIBS_NIS        =3D -lnsl
> -QMAKE_LIBS_EGL        =3D -lEGL
> -QMAKE_LIBS_OPENGL     =3D -lGLU -lGL
> -QMAKE_LIBS_OPENGL_QT  =3D -lGL
> -QMAKE_LIBS_OPENGL_ES1 =3D -lGLES_CM
> -QMAKE_LIBS_OPENGL_ES2 =3D -lGLESv2
> -QMAKE_LIBS_OPENVG     =3D -lOpenVG
> -QMAKE_LIBS_THREAD     =3D -lpthread
> -
> -QMAKE_MOC             =3D $(OE_QMAKE_MOC)
> -QMAKE_UIC             =3D $(OE_QMAKE_UIC)
> -QMAKE_UIC3            =3D $(OE_QMAKE_UIC3)
> -QMAKE_RCC             =3D $(OE_QMAKE_RCC)
> -QMAKE_QDBUSCPP2XML    =3D $(OE_QMAKE_QDBUSCPP2XML)
> -QMAKE_QDBUSXML2CPP    =3D $(OE_QMAKE_QDBUSXML2CPP)
> -
> -QMAKE_AR              =3D $(OE_QMAKE_AR) cqs
> -QMAKE_OBJCOPY         =3D objcopy
> -QMAKE_RANLIB          =3D
> -
> -QMAKE_TAR             =3D tar -cf
> -QMAKE_GZIP            =3D gzip -9f
> -
> -QMAKE_COPY            =3D cp -f
> -QMAKE_COPY_FILE       =3D $(COPY)
> -QMAKE_COPY_DIR        =3D $(COPY) -r
> -QMAKE_MOVE            =3D mv -f
> -QMAKE_DEL_FILE        =3D rm -f
> -QMAKE_DEL_DIR         =3D rmdir
> -QMAKE_STRIP           =3D $(OE_QMAKE_STRIP)
> -QMAKE_STRIPFLAGS_LIB +=3D --strip-unneeded
> -QMAKE_CHK_DIR_EXISTS  =3D test -d
> -QMAKE_MKDIR           =3D mkdir -p
> -QMAKE_INSTALL_FILE    =3D install -m 644 -p
> -QMAKE_INSTALL_PROGRAM =3D install -m 755 -p
> -
> -include(unix.conf)
> diff --git a/recipes/qt4/qt4-embedded-gles_4.7.2.bb b/recipes/qt4/qt4-emb=
edded-gles_4.7.2.bb
> deleted file mode 100644
> index 8ab5a6c..0000000
> --- a/recipes/qt4/qt4-embedded-gles_4.7.2.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -require qt4-embedded.inc
> -
> -PR =3D "${INC_PR}.10"
> -
> -QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
> -
> -PROVIDES +=3D "qt4-embedded"
> -QT_GLFLAGS =3D "-opengl es2 -depths 16,24,32  -plugin-gfx-powervr"
> -=20
> -FILESPATHPKG .=3D ":qt4-embedded-${PV}:qt4-embedded"
> -
> -require qt-${PV}.inc
> -
> -QT_CONFIG_FLAGS +=3D " \
> - -exceptions \
> -"
> -
> diff --git a/recipes/qt4/qt4-embedded_4.7.2.bb b/recipes/qt4/qt4-embedded=
_4.7.2.bb
> deleted file mode 100644
> index 7e3d4b8..0000000
> --- a/recipes/qt4/qt4-embedded_4.7.2.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -require qt4-embedded.inc
> -
> -PR =3D "${INC_PR}.1"
> -
> -QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
> -
> -require qt-${PV}.inc
> -
> -QT_CONFIG_FLAGS +=3D " \
> - -exceptions \
> -"
> -
> diff --git a/recipes/qt4/qt4-native_4.7.2.bb b/recipes/qt4/qt4-native_4.7=
=2E2.bb
> deleted file mode 100644
> index 7e98035..0000000
> --- a/recipes/qt4/qt4-native_4.7.2.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -require qt4-native.inc
> -LICENSE =3D "LGPLv2.1 GPLv3"
> -
> -PR =3D "${INC_PR}.0"
> -
> -# Find the g++.conf/linux.conf in the right directory.
> -FILESPATHPKG =3D. "qt-${PV}:"
> -SRC_URI =3D "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-=
src-${PV}.tar.gz \
> -           file://qt-config.patch \
> -           file://g++.conf \
> -           file://linux.conf"
> -S =3D "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
> -
> -EXTRA_OECONF +=3D " -no-fast -silent -no-rpath"
> -
> -TOBUILD :=3D "src/tools/bootstrap ${TOBUILD}"
> -
> -SRC_URI[md5sum] =3D "66b992f5c21145df08c99d21847f4fdb"
> -SRC_URI[sha256sum] =3D "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49eb=
c2d553cd3eb49336"
> diff --git a/recipes/qt4/qt4-tools-sdk_4.7.2.bb b/recipes/qt4/qt4-tools-s=
dk_4.7.2.bb
> deleted file mode 100644
> index c86ac2a..0000000
> --- a/recipes/qt4/qt4-tools-sdk_4.7.2.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require qt4-tools-sdk.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -SRC_URI[md5sum] =3D "66b992f5c21145df08c99d21847f4fdb"
> -SRC_URI[sha256sum] =3D "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49eb=
c2d553cd3eb49336"
> diff --git a/recipes/qt4/qt4-x11-free-gles_4.7.2.bb b/recipes/qt4/qt4-x11=
-free-gles_4.7.2.bb
> deleted file mode 100644
> index c5fd6f3..0000000
> --- a/recipes/qt4/qt4-x11-free-gles_4.7.2.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -require qt4-x11-free.inc
> -PR =3D "${INC_PR}.7"
> -
> -QT_GLFLAGS =3D "-opengl es2 -depths 16,24,32 "
> -
> -require qt-${PV}.inc
> -
> -QT_CONFIG_FLAGS +=3D " \
> - -no-embedded \
> - -xrandr \
> - -x11"
> -
> -FILESPATHPKG .=3D ":qt4-x11-free-${PV}:qt4-x11-free"
> -
> -DEPENDS +=3D "virtual/egl"
> -require recipes/egl/egl.inc
> -PROVIDES +=3D "qt4-x11-free"
> diff --git a/recipes/qt4/qt4-x11-free_4.7.2.bb b/recipes/qt4/qt4-x11-free=
_4.7.2.bb
> deleted file mode 100644
> index 79a765e..0000000
> --- a/recipes/qt4/qt4-x11-free_4.7.2.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -require qt4-x11-free.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
> -
> -require qt-${PV}.inc
> -
> -QT_CONFIG_FLAGS +=3D " \
> - -no-embedded \
> - -xrandr \
> - -x11"
> -
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

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3LnsIACgkQN1Ujt2V2gBz/OgCfTociuAe55oYAjhCBIBcvr552
pkEAoKCycqloGX6Enzeynt+zyv/Q2wl5
=TReh
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--
