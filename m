Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 99AEE759D5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Oct 2015 14:48:10 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so73798126wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Oct 2015 07:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=T/3ed0Bsm3o6ktV10TBpurEXFKWT2eyN9m/dc5K1t6I=;
	b=P2WRcC1LEX6/L8rv63Ss5N1mHTpo2WmWjoetJphOsYSodiolrngAPtYy+fkzvp2Gpb
	jKWhUZ+ZJhnIIT7vNF2z07E5GE/rLLufTdeUQw0GESrgJuq2R5SBb4BWa5P2eS+elqff
	Uwpl3r8+05hqlwoosXY70sV5ZLKI05TDs6CRoVUVngk6NEAJmp2ulE1V3tV9dq82KfaL
	/mPnz9MUYL/H3umb7aGI6cdlCijVKLKxE8ecW048LVDFNPu87fLEWk2elItSTUF36lAb
	1CONHlPM1z5pxxyoGJuSFrSZ1L944/hvBBImaIXjOrI4sd0uKlNNQLycJhVwGSrcMYPz
	K9Aw==
X-Received: by 10.180.149.167 with SMTP id ub7mr11340934wib.43.1444402089877; 
	Fri, 09 Oct 2015 07:48:09 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	wj4sm2550501wjb.10.2015.10.09.07.48.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Oct 2015 07:48:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Oct 2015 16:48:26 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151009144826.GB2384@jama>
References: <1444293713-5683-1-git-send-email-manuel.bachmann@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1444293713-5683-1-git-send-email-manuel.bachmann@iot.bzh>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH v3][meta-oe] freerdp: get out of PNBLACKLIST, fix build, improve
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
X-List-Received-Date: Fri, 09 Oct 2015 14:48:11 -0000
X-Groupsio-MsgNum: 57756
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline

--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2015 at 10:41:53AM +0200, Manuel Bachmann wrote:
> We make the "freerdp" recipe active again, fix the build
> by pulling a more recent version (the "stable" branches are
> buggy and useless), and fix ARM runtime with -fPIC.
>=20
> We can then :
> - make X11 non-mandatory ;
> - add support for Wayland ("wlfreerdp" client) ;
> - add support for DirectFB ("dfreerdp" client) ;
> - add support for GStreamer 1.0 ;
> - make "heavy" features such as pulseaudio, cups...
> non-mandatory.
>=20
> We really want to install the "winpr-makecert" tool to have
> TLS, but CMake does not position its RPATH cleanly, so let
> us have a custom patch for that until it gets sorted out.

One more issue, it fails to build for qemuarm:

In file included from
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/fre=
erdp/1.2.5+gitrAUTOINC+62da9d28c6-r0/git/libfreerdp/primitives/prim_YCoCg_o=
pt.c:32:0:
/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib/arm=
-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/5.2.0/include/arm_neon.h:31:2:
error: #error You must enable NEON instructions (e.g. -mfloat-abi=3Dsoftfp
-mfpu=3Dneon) to use arm_neon.h
 #error You must enable NEON instructions (e.g. -mfloat-abi=3Dsoftfp
-mfpu=3Dneon) to use arm_neon.h
  ^

http://errors.yoctoproject.org/Errors/Details/20373/
>=20
> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> ---
>  meta-oe/recipes-support/freerdp/freerdp.inc        | 38 ++++++++++++++++=
+-----
>  .../winpr-makecert-Build-with-install-RPATH.patch  | 31 ++++++++++++++++=
++
>  meta-oe/recipes-support/freerdp/freerdp_git.bb     | 18 +++++-----
>  3 files changed, 70 insertions(+), 17 deletions(-)
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp/winpr-makecer=
t-Build-with-install-RPATH.patch
>=20
> diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipe=
s-support/freerdp/freerdp.inc
> index 34dac4b..af93e83 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp.inc
> +++ b/meta-oe/recipes-support/freerdp/freerdp.inc
> @@ -1,23 +1,38 @@
>  # Copyright (C) 2010-2012 O.S. Systems Software Ltda. All Rights Reserved
>  # Released under the MIT license
> =20
> -DESCRIPTION =3D "FreeRDP RDP client"
> +DESCRIPTION =3D "FreeRDP RDP client & server library"
>  HOMEPAGE =3D "http://www.freerdp.com"
> -DEPENDS =3D "virtual/libx11 openssl libxcursor libxv cups alsa-lib pulse=
audio pcsc-lite libxkbfile libxinerama"
> -SECTION =3D "x11/network"
> +DEPENDS =3D "openssl alsa-lib pcsc-lite"
> +SECTION =3D "net"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
> =20
>  inherit pkgconfig cmake
> =20
> -EXTRA_OECMAKE +=3D "-DWITH_PULSEAUDIO=3DON \
> +EXTRA_OECMAKE +=3D "-DWITH_ALSA=3DON \
>                    -DWITH_PCSC=3DON \
> -                  -DWITH_CUPS=3DON \
>                    -DWITH_FFMPEG=3DOFF \
>                    -DWITH_CUNIT=3DOFF \
> -                  -DWITH_X11=3DON \
> -                  -DWITH_XKBFILE=3DON \
> -                  -DWITH_XINERAMA=3DON"
> +                 "
> +
> +PACKAGECONFIG ??=3D "  \
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', ''=
, d)}\
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayl=
and', '', d)}\
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'dir=
ectfb', '', d)}\
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', ''=
, d)}\
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'p=
ulseaudio', '', d)}\
> +                gstreamer cups \
> +                "
> +
> +X11_DEPS =3D "virtual/libx11 libxinerama libxext libxcursor libxv libxi =
libxrender libxfixes libxdamage libxrandr libxkbfile"
> +PACKAGECONFIG[x11] =3D "-DWITH_X11=3DON -DWITH_XINERAMA=3DON -DWITH_XEXT=
=3DON -DWITH_XCURSOR=3DON -DWITH_XV=3DON -DWITH_XI=3DON -DWITH_XRENDER=3DON=
 -DWITH_XFIXES=3DON -DWITH_XDAMAGE=3DON -DWITH_XRANDR=3DON -DWITH_XKBFILE=
=3DON,-DWITH_X11=3DOFF,${X11_DEPS}"
> +PACKAGECONFIG[wayland] =3D "-DWITH_WAYLAND=3DON,-DWITH_WAYLAND=3DOFF,way=
land"
> +PACKAGECONFIG[directfb] =3D "-DWITH_DIRECTFB=3DON,-DWITH_DIRECTFB=3DOFF,=
directfb"
> +PACKAGECONFIG[pam] =3D "-DWITH_PAM=3DON,-DWITH_PAM=3DOFF,libpam"
> +PACKAGECONFIG[pulseaudio] =3D "-DWITH_PULSEAUDIO=3DON,-DWITH_PULSEAUDIO=
=3DOFF,pulseaudio"
> +PACKAGECONFIG[gstreamer] =3D "-DWITH_GSTREAMER_1_0=3DON,-DWITH_GSTREAMER=
_1_0=3DOFF,gstreamer1.0 gstreamer1.0-plugins-base"
> +PACKAGECONFIG[cups] =3D "-DWITH_CUPS=3DON,-DWITH_CUPS=3DOFF,cups"
> =20
>  PACKAGES =3D+ "libfreerdp"
> =20
> @@ -26,6 +41,13 @@ FILES_libfreerdp =3D "${libdir}/lib*${SOLIBS}"
> =20
>  PACKAGES_DYNAMIC +=3D "^libfreerdp-plugin-.*"
> =20
> +# we will need winpr-makecert to generate TLS certificates
> +do_install_append () {
> +    install -m755 winpr/tools/makecert/cli/winpr-makecert ${D}${bindir}
> +    rm -rf ${D}/${libdir}/cmake
> +    rm -rf ${D}/${libdir}/freerdp
> +}
> +
>  python populate_packages_prepend () {
>      freerdp_root =3D d.expand('${libdir}/freerdp')
> =20
> diff --git a/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build=
-with-install-RPATH.patch b/meta-oe/recipes-support/freerdp/freerdp/winpr-m=
akecert-Build-with-install-RPATH.patch
> new file mode 100644
> index 0000000..d279d6d
> --- /dev/null
> +++ b/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-i=
nstall-RPATH.patch
> @@ -0,0 +1,31 @@
> +From 253eafc8c8da83fc2b1a99a9e43824efc6105c7a Mon Sep 17 00:00:00 2001
> +From: Manuel Bachmann <manuel.bachmann@iot.bzh>
> +Date: Sun, 4 Oct 2015 10:44:49 +0200
> +Subject: [PATCH] winpr-makecert: Build with install RPATH
> +
> +As we are installing "winpr-makecert" manually, we do want
> +to refer to the library in DESTDIR, not the one resting in
> +the build tree.
> +
> +Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> +---
> + winpr/tools/makecert/cli/CMakeLists.txt | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/winpr/tools/makecert/cli/CMakeLists.txt b/winpr/tools/makec=
ert/cli/CMakeLists.txt
> +index 17954c4..90c446b 100644
> +--- a/winpr/tools/makecert/cli/CMakeLists.txt
> ++++ b/winpr/tools/makecert/cli/CMakeLists.txt
> +@@ -45,5 +45,9 @@ set(${MODULE_PREFIX}_LIBS winpr-makecert-tool)
> +=20
> + target_link_libraries(${MODULE_NAME} ${${MODULE_PREFIX}_LIBS})
> +=20
> ++set_target_properties(${MODULE_NAME} PROPERTIES=20
> ++	BUILD_WITH_INSTALL_RPATH 1)
> ++
> + set_property(TARGET ${MODULE_NAME} PROPERTY FOLDER "WinPR/Tools")
> +=20
> ++
> +--=20
> +1.8.3.1
> +
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/rec=
ipes-support/freerdp/freerdp_git.bb
> index fd7f74c..f9cb9a6 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
> @@ -5,17 +5,17 @@ include freerdp.inc
> =20
>  inherit gitpkgv
> =20
> -PV =3D "1.0.2+gitr${SRCPV}"
> +PV =3D "1.2.5+gitr${SRCPV}"
>  PKGV =3D "${GITPKGVTAG}"
> =20
> -EXTRA_OECMAKE +=3D "-DWITH_MANPAGES=3DOFF"
> +EXTRA_OECMAKE +=3D "-DBUILD_STATIC_LIBS=3DOFF \
> +                  -DCMAKE_POSITION_INDEPENDANT_CODE=3DON \
> +                  -DWITH_MANPAGES=3DOFF \
> +                 "
> =20
> -SRCREV =3D "f311acaffb9190567e2b478a98d7cbfaf2709f6b"
> -SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dstable-1.0"
> +SRCREV =3D "62da9d28c674814c81c245c1c7882eb0da7be76b"
> +SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git \
> +           file://winpr-makecert-Build-with-install-RPATH.patch \
> +          "
> =20
>  S =3D "${WORKDIR}/git"
> -
> -PNBLACKLIST[freerdp] ?=3D "Installs into double prefix, causing all file=
s installed in /usr/usr and empty packages"
> -# freerdp-1.0.2+gitrAUTOINC+f311acaffb: freerdp: Files/directories were =
installed but not shipped
> -#       /usr/usr
> -#       ....
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

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYX07kACgkQN1Ujt2V2gBzH3gCghmgTRon0oAm5nQWAaYpRiXpM
XDsAoKwJY+0JimUCtH42pWBdmU0WTiEv
=D9iO
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
