Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OSQss-0002YM-Fo
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jun 2010 10:37:10 +0200
Received: by bwz14 with SMTP id 14so3349072bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jun 2010 01:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QwsAdnOMyoc5hFI1xLbsiB43Nb2aboLlVgM2PYeuB+0=;
	b=btkedsLBlU1JfF4Q3YvR1ejyhiBUmEuWdAMiCH7m4n+R9mcr2gIkjumTsHpmTQQzR7
	4TGd/wiJQf71h2yxUgzdYOkQYlNfbTghtQQZls9BTZoJ7KprYVWV4qc2mH8ZR0lO/a9w
	JznG4JyeECiVY7s95Easc1Fqru/lsykWNYUUc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sgQn1pvYaHoXLLaGJ04FoGvsST2Nkefhs3FhW/LyFwFb85g4gGgY3YWHtA1PEjUSsM
	oTAwIbhcWvBnc90UEV0v2AE4fmAPEZWCkz/CoAi8LOO+3rAy4zSUPfYFZ/vc0uVEExYh
	Mq2V35JpohFZjhT1bUm4w8e2ZZYGD8tXUDkT8=
MIME-Version: 1.0
Received: by 10.204.73.205 with SMTP id r13mr1271225bkj.35.1277541148934; Sat, 
	26 Jun 2010 01:32:28 -0700 (PDT)
Received: by 10.204.123.210 with HTTP; Sat, 26 Jun 2010 01:32:28 -0700 (PDT)
In-Reply-To: <1277468383-16679-2-git-send-email-Martin.Jansa@gmail.com>
References: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
	<1277468383-16679-2-git-send-email-Martin.Jansa@gmail.com>
Date: Sat, 26 Jun 2010 10:32:28 +0200
Message-ID: <AANLkTim4TeMObp0jvatbPTwJygvdjr1bcWpnAknUgcO8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/9] mesa: remove old 6.0 and 6.4 recipes which are not using any include file
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
X-List-Received-Date: Sat, 26 Jun 2010 08:37:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/25 Martin Jansa <martin.jansa@gmail.com>:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0recipes/mesa/mesa-6.0.1/Make-config.patch | =A0 26 ---------------
> =A0recipes/mesa/mesa-6.0.1/mklib.patch =A0 =A0 =A0 | =A0 22 -------------
> =A0recipes/mesa/mesa_6.0.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 29 ---=
--------------
> =A0recipes/mesa/mesa_6.4.1+cvs20060101.bb =A0 =A0| =A0 48 ---------------=
--------------
> =A04 files changed, 0 insertions(+), 125 deletions(-)
> =A0delete mode 100644 recipes/mesa/mesa-6.0.1/Make-config.patch
> =A0delete mode 100644 recipes/mesa/mesa-6.0.1/mklib.patch
> =A0delete mode 100644 recipes/mesa/mesa_6.0.1.bb
> =A0delete mode 100644 recipes/mesa/mesa_6.4.1+cvs20060101.bb
>
> diff --git a/recipes/mesa/mesa-6.0.1/Make-config.patch b/recipes/mesa/mes=
a-6.0.1/Make-config.patch
> deleted file mode 100644
> index cfe8890..0000000
> --- a/recipes/mesa/mesa-6.0.1/Make-config.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> ---- mesa/Make-config.orig =A0 =A0 =A02004-06-25 13:09:44.000000000 +0100
> -+++ mesa/Make-config =A0 2004-06-25 14:18:27.000000000 +0100
> -@@ -643,16 +643,16 @@
> - =A0 =A0 =A0 "GLUT_LIB =3D libglut.so" \
> - =A0 =A0 =A0 "GLW_LIB =3D libGLw.so" \
> - =A0 =A0 =A0 "OSMESA_LIB =3D libOSMesa.so" \
> -- =A0 =A0 =A0"CC =3D gcc" \
> -- =A0 =A0 =A0"CXX =3D g++" \
> -- =A0 =A0 =A0"CFLAGS =3D -O3 -ansi -pedantic -fPIC -ffast-math -D_POSIX_=
SOURCE -D_POSIX_C_SOURCE=3D199309L -D_SVID_SOURCE -D_BSD_SOURCE -DUSE_XSHM =
-DPTHREADS -I/usr/X11R6/include" \
> -- =A0 =A0 =A0"CXXFLAGS =3D -O3 -ansi -pedantic -fPIC -ffast-math -D_POSI=
X_SOURCE -D_POSIX_C_SOURCE=3D199309L -D_SVID_SOURCE -D_BSD_SOURCE" \
> -+ =A0 =A0 =A0"CC =3D $(CC)" \
> -+ =A0 =A0 =A0"CXX =3D $(CXX)" \
> -+ =A0 =A0 =A0"CFLAGS =3D -ansi -pedantic -fPIC -ffast-math -D_POSIX_SOUR=
CE -D_POSIX_C_SOURCE=3D199309L -D_SVID_SOURCE -D_BSD_SOURCE -DUSE_XSHM -DPT=
HREADS $(CFLAGS)" \
> -+ =A0 =A0 =A0"CXXFLAGS =3D -ansi -pedantic -fPIC -ffast-math -D_POSIX_SO=
URCE -D_POSIX_C_SOURCE=3D199309L -D_SVID_SOURCE -D_BSD_SOURCE $(CXXFLAGS)" =
\
> - =A0 =A0 =A0 "GLUT_CFLAGS =3D -fexceptions" \
> -- =A0 =A0 =A0"GL_LIB_DEPS =3D -L/usr/X11R6/lib -lX11 -lXext -lm -lpthrea=
d" \
> -+ =A0 =A0 =A0"GL_LIB_DEPS =3D $(LDFLAGS) -lX11 -lXext -lm -lpthread" \
> - =A0 =A0 =A0 "OSMESA_LIB_DEPS =3D -L$(TOP)/lib -lGL" \
> - =A0 =A0 =A0 "GLU_LIB_DEPS =3D -L$(TOP)/lib -lGL -lm" \
> -- =A0 =A0 =A0"GLUT_LIB_DEPS =3D -L$(TOP)/lib -lGLU -lGL -L/usr/X11R6/lib=
 -lX11 -lXmu -lXt -lXi -lm" \
> -- =A0 =A0 =A0"GLW_LIB_DEPS =3D -L$(TOP)/lib -lGL -L/usr/X11R6/lib -lXt -=
lX11" \
> -+ =A0 =A0 =A0"GLUT_LIB_DEPS =3D $(LDFLAGS) -L$(TOP)/lib -lGLU -lGL -lX11=
 -lXmu -lXt -lXi -lm" \
> -+ =A0 =A0 =A0"GLW_LIB_DEPS =3D $(LDFLAGS) -L$(TOP)/lib -lGL -lXt -lX11" =
\
> - =A0 =A0 =A0 "APP_LIB_DEPS =3D -lglut -lGLU -lGL -lm"
> -
> - linux-static:
> diff --git a/recipes/mesa/mesa-6.0.1/mklib.patch b/recipes/mesa/mesa-6.0.=
1/mklib.patch
> deleted file mode 100644
> index 7dc1ec7..0000000
> --- a/recipes/mesa/mesa-6.0.1/mklib.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> ---- mesa/bin/mklib.old 2004-06-25 14:08:41.000000000 +0100
> -+++ mesa/bin/mklib =A0 =A0 2004-06-25 14:23:09.000000000 +0100
> -@@ -64,6 +64,7 @@
> - =A0 =A0 =A0 '-install') =A0 shift 1; INSTALLDIR=3D$1;;
> - =A0 =A0 =A0 '-arch') =A0 =A0 =A0shift 1; ARCH=3D$1;;
> - =A0 =A0 =A0 '-archopt') =A0 shift 1; ARCHOPT=3D$1;;
> -+ =A0 =A0 =A0-Wl*) =A0 =A0 =A0 =A0 DEPS=3D"$DEPS $1";;
> - =A0 =A0 =A0 -*) =A0 =A0 =A0 =A0 =A0 echo "mklib: Unknown option: " $1 ;=
 exit 1;;
> - =A0 =A0 =A0 *) break
> - =A0 =A0 esac
> -@@ -137,9 +138,9 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 echo "mklib: Making" $ARCH "shared library: " $=
{LIBNAME}.so.${VERSION}
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 if [ $CPLUSPLUS =3D 1 ] ; then
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LINK=3D"g++"
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LINK=3D"$CXX"
> - =A0 =A0 =A0 =A0 =A0 =A0 else
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LINK=3D"gcc"
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LINK=3D"$CC"
> - =A0 =A0 =A0 =A0 =A0 =A0 fi
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 # rm any old libs
> diff --git a/recipes/mesa/mesa_6.0.1.bb b/recipes/mesa/mesa_6.0.1.bb
> deleted file mode 100644
> index 3b37b8f..0000000
> --- a/recipes/mesa/mesa_6.0.1.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -SECTION =3D "unknown"
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/mesa3d/MesaLib-${PV}.tar.bz2 \
> - =A0 =A0 =A0 file://Make-config.patch \
> - =A0 =A0 =A0 file://mklib.patch"
> -S =3D "${WORKDIR}/Mesa-${PV}"
> -PE =3D "2"
> -LICENSE =3D "LGPL"
> -# gcc-3.4 blows up in gtktext with -frename-registers on arm-linux
> -CXXFLAGS :=3D "${@'${CXXFLAGS}'.replace('-frename-registers', '')}"
> -DEPENDS =3D "makedepend-native"
> -
> -do_compile() {
> - =A0 =A0 =A0 oe_runmake linux CC=3D"${CC}" CXX=3D"${CXX}" CFLAGS=3D"${CF=
LAGS}" CXXFLAGS=3D"${CXXFLAGS}" LD=3D"${LD}" LDFLAGS=3D"${LDFLAGS}"
> -}
> -
> -do_install() {
> - =A0 =A0 =A0 install -d ${D}${libdir}
> - =A0 =A0 =A0 cp -pP lib/* ${D}${libdir}/
> - =A0 =A0 =A0 install -d ${D}${includedir}
> - =A0 =A0 =A0 cp -R include/GL ${D}${includedir}/
> -}
> -
> -do_stage() {
> - =A0 =A0 =A0 =A0cp -pP lib/* ${STAGING_LIBDIR}/
> - =A0 =A0 =A0 =A0cp -R include/GL ${STAGING_INCDIR}/
> -}
> -
> -SRC_URI[md5sum] =3D "b7f14088c5c2f14490d2739a91102112"
> -SRC_URI[sha256sum] =3D "2de039f7abe10569b681ea1d9e21fb65fd0081c8f4db40fb=
62b332acb11679fb"
> diff --git a/recipes/mesa/mesa_6.4.1+cvs20060101.bb b/recipes/mesa/mesa_6=
.4.1+cvs20060101.bb
> deleted file mode 100644
> index 9fceca1..0000000
> --- a/recipes/mesa/mesa_6.4.1+cvs20060101.bb
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -SECTION =3D "unknown"
> -
> -SRCDATE =3D "20060101"
> -PV =3D "6.4.1+cvs${SRCDATE}"
> -PE =3D "2"
> -PR =3D "r1"
> -
> -SRC_URI =3D "${FREEDESKTOP_CVS}/mesa;module=3DMesa;method=3Dpserver;date=
=3D${SRCDATE} \
> - =A0 =A0 =A0 file://mklib-rpath-link.patch"
> -S =3D "${WORKDIR}/Mesa"
> -
> -LICENSE =3D "LGPL"
> -
> -RDEPENDS_${PN} =3D "expat"
> -DEPENDS =3D "makedepend-native xf86vidmodeproto glproto virtual/libx11 l=
ibxext libxxf86vm libxi libxmu libice"
> -
> -# gcc-3.4 blows up in gtktext with -frename-registers on arm-linux
> -CXXFLAGS :=3D "${@'${CXXFLAGS}'.replace('-frename-registers', '')}"
> -
> -do_configure() {
> - =A0 =A0 =A0 cd configs
> -
> - =A0 =A0 =A0 ln -sf linux current
> - =A0 =A0 =A0 sed -e "s%CC *=3D *.*%CC =3D ${CC}%" -i current
> - =A0 =A0 =A0 sed -e "s%CXX *=3D *.*%CXX =3D ${CXX}%" -i current
> - =A0 =A0 =A0 sed -e "s%LD *=3D *.*%LD =3D ${LD}%" -i current
> - =A0 =A0 =A0 sed -e "s%OPT_FLAGS *=3D *.*%OPT_FLAGS =3D ${TARGET_CFLAGS}=
%" -i current
> - =A0 =A0 =A0 sed -e "s%X11_INCLUDES *=3D *.*%X11_INCLUDES =3D -I${STAGIN=
G_INCDIR}/X11%" -i current
> - =A0 =A0 =A0 sed -e "s%EXTRA_LIB_PATH *=3D *.*%EXTRA_LIB_PATH =3D ${LDFL=
AGS}%" -i current
> - =A0 =A0 =A0 sed -i s:\$\(CC\):gcc:g =A0../src/mesa/x86/Makefile
> - =A0 =A0 =A0 echo "SRC_DIRS =3D mesa glu glut/glx" >> current
> -}
> -
> -do_compile() {
> - =A0 =A0 =A0 oe_runmake default
> -}
> -
> -do_install() {
> - =A0 =A0 =A0 install -d ${D}${libdir}
> - =A0 =A0 =A0 cp -pP lib/* ${D}${libdir}/
> - =A0 =A0 =A0 install -d ${D}${includedir}
> - =A0 =A0 =A0 cp -R include/GL ${D}${includedir}/
> -}
> -
> -do_stage() {
> - =A0 =A0 =A0 =A0cp -pP lib/* ${STAGING_LIBDIR}/
> - =A0 =A0 =A0 =A0cp -R include/GL ${STAGING_INCDIR}/
> -}
> --
> 1.7.0.2
>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


