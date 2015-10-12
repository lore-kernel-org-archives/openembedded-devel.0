Return-Path: <mbc@koumoul.net>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4F77F77022
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 14:09:00 +0000 (UTC)
Received: by iow1 with SMTP id 1so152866066iow.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 07:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=clR1460WuQnIE+y31bHAHOeURIEp5xmE5IlPthBGYmQ=;
	b=e9WIr/HCvJCRH9m6XXelxJQILIHs8Ls+CO1xN/vPXNab57+N6hBrBUm19aKX+B7qtu
	nIlOHux0kOtmAle9L32/I1mlaRWiVnAqV/oE3TiA/9ewp5/IWI2f24WwdmH7xZY4pKy4
	UgBtGmKkQkVqBHgaXefvevS88IhuJ/Mct3mL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=clR1460WuQnIE+y31bHAHOeURIEp5xmE5IlPthBGYmQ=;
	b=Fw+CH7lHKHpGxQpFXd1+2zAtRrtKRDkkVA8FOVmkw9mwzwOYsiVzQHkuPN2RL/+Qjd
	aLS1r/Mq//n2lUgDFZFhWEl9bBTTymzp7iVzFui0OiIbhXsEvEMpgKGBP1elw5JOyvNH
	hP/W11+sH3tGdF9N38HM/h6YKIKeHIW8fYQRXj2QVsuITMDrTSEZfhHF0p5J1QbRgUo5
	fFieI0IxAH+5xJP04gz9vgS2wfR/ZFY6Z6yt79fWsOI9U+lfsICeyJLmvjgDt9QkR139
	W0oXZXU/WYJRMMM1NSdcwqPfHgvW/woDjpFLGjl2yYNIS+JU005Z6UhU/CCPspgxSAuT
	fzVQ==
X-Gm-Message-State: ALoCoQksX66xd+ER93fGNkPRY/fSDdtgAxXAs4eVzS8s41oCy+4HL0w45I8FyzEuPtTUx9rVTkxO
MIME-Version: 1.0
X-Received: by 10.107.167.199 with SMTP id q190mr8926621ioe.87.1444658940283; 
	Mon, 12 Oct 2015 07:09:00 -0700 (PDT)
Sender: mbc@koumoul.net
Received: by 10.79.38.193 with HTTP; Mon, 12 Oct 2015 07:09:00 -0700 (PDT)
X-Originating-IP: [46.18.96.42]
In-Reply-To: <20151009144826.GB2384@jama>
References: <1444293713-5683-1-git-send-email-manuel.bachmann@iot.bzh>
	<20151009144826.GB2384@jama>
Date: Mon, 12 Oct 2015 16:09:00 +0200
X-Google-Sender-Auth: VH28LQHkU5UVTlcHmBR_Rbegoso
Message-ID: <CANTDXNewmeDEUKJ7DJryK4z5RqXpy3v9e-F51zacEq_B+r0bDw@mail.gmail.com>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Mon, 12 Oct 2015 14:09:02 -0000
Content-Type: text/plain; charset=UTF-8

Correct ; sending a v4 fixing this right now.

Regards,

*Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *


2015-10-09 16:48 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:

> On Thu, Oct 08, 2015 at 10:41:53AM +0200, Manuel Bachmann wrote:
> > We make the "freerdp" recipe active again, fix the build
> > by pulling a more recent version (the "stable" branches are
> > buggy and useless), and fix ARM runtime with -fPIC.
> >
> > We can then :
> > - make X11 non-mandatory ;
> > - add support for Wayland ("wlfreerdp" client) ;
> > - add support for DirectFB ("dfreerdp" client) ;
> > - add support for GStreamer 1.0 ;
> > - make "heavy" features such as pulseaudio, cups...
> > non-mandatory.
> >
> > We really want to install the "winpr-makecert" tool to have
> > TLS, but CMake does not position its RPATH cleanly, so let
> > us have a custom patch for that until it gets sorted out.
>
> One more issue, it fails to build for qemuarm:
>
> In file included from
>
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/freerdp/1.2.5+gitrAUTOINC+62da9d28c6-r0/git/libfreerdp/primitives/prim_YCoCg_opt.c:32:0:
>
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/5.2.0/include/arm_neon.h:31:2:
> error: #error You must enable NEON instructions (e.g. -mfloat-abi=softfp
> -mfpu=neon) to use arm_neon.h
>  #error You must enable NEON instructions (e.g. -mfloat-abi=softfp
> -mfpu=neon) to use arm_neon.h
>   ^
>
> http://errors.yoctoproject.org/Errors/Details/20373/
> >
> > Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> > ---
> >  meta-oe/recipes-support/freerdp/freerdp.inc        | 38
> +++++++++++++++++-----
> >  .../winpr-makecert-Build-with-install-RPATH.patch  | 31
> ++++++++++++++++++
> >  meta-oe/recipes-support/freerdp/freerdp_git.bb     | 18 +++++-----
> >  3 files changed, 70 insertions(+), 17 deletions(-)
> >  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
> >
> > diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc
> b/meta-oe/recipes-support/freerdp/freerdp.inc
> > index 34dac4b..af93e83 100644
> > --- a/meta-oe/recipes-support/freerdp/freerdp.inc
> > +++ b/meta-oe/recipes-support/freerdp/freerdp.inc
> > @@ -1,23 +1,38 @@
> >  # Copyright (C) 2010-2012 O.S. Systems Software Ltda. All Rights
> Reserved
> >  # Released under the MIT license
> >
> > -DESCRIPTION = "FreeRDP RDP client"
> > +DESCRIPTION = "FreeRDP RDP client & server library"
> >  HOMEPAGE = "http://www.freerdp.com"
> > -DEPENDS = "virtual/libx11 openssl libxcursor libxv cups alsa-lib
> pulseaudio pcsc-lite libxkbfile libxinerama"
> > -SECTION = "x11/network"
> > +DEPENDS = "openssl alsa-lib pcsc-lite"
> > +SECTION = "net"
> >  LICENSE = "Apache-2.0"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> >
> >  inherit pkgconfig cmake
> >
> > -EXTRA_OECMAKE += "-DWITH_PULSEAUDIO=ON \
> > +EXTRA_OECMAKE += "-DWITH_ALSA=ON \
> >                    -DWITH_PCSC=ON \
> > -                  -DWITH_CUPS=ON \
> >                    -DWITH_FFMPEG=OFF \
> >                    -DWITH_CUNIT=OFF \
> > -                  -DWITH_X11=ON \
> > -                  -DWITH_XKBFILE=ON \
> > -                  -DWITH_XINERAMA=ON"
> > +                 "
> > +
> > +PACKAGECONFIG ??= "  \
> > +                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',
> '', d)}\
> > +                ${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> 'wayland', '', d)}\
> > +                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb',
> 'directfb', '', d)}\
> > +                ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam',
> '', d)}\
> > +                ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio',
> 'pulseaudio', '', d)}\
> > +                gstreamer cups \
> > +                "
> > +
> > +X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi
> libxrender libxfixes libxdamage libxrandr libxkbfile"
> > +PACKAGECONFIG[x11] = "-DWITH_X11=ON -DWITH_XINERAMA=ON -DWITH_XEXT=ON
> -DWITH_XCURSOR=ON -DWITH_XV=ON -DWITH_XI=ON -DWITH_XRENDER=ON
> -DWITH_XFIXES=ON -DWITH_XDAMAGE=ON -DWITH_XRANDR=ON
> -DWITH_XKBFILE=ON,-DWITH_X11=OFF,${X11_DEPS}"
> > +PACKAGECONFIG[wayland] = "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland"
> > +PACKAGECONFIG[directfb] =
> "-DWITH_DIRECTFB=ON,-DWITH_DIRECTFB=OFF,directfb"
> > +PACKAGECONFIG[pam] = "-DWITH_PAM=ON,-DWITH_PAM=OFF,libpam"
> > +PACKAGECONFIG[pulseaudio] =
> "-DWITH_PULSEAUDIO=ON,-DWITH_PULSEAUDIO=OFF,pulseaudio"
> > +PACKAGECONFIG[gstreamer] =
> "-DWITH_GSTREAMER_1_0=ON,-DWITH_GSTREAMER_1_0=OFF,gstreamer1.0
> gstreamer1.0-plugins-base"
> > +PACKAGECONFIG[cups] = "-DWITH_CUPS=ON,-DWITH_CUPS=OFF,cups"
> >
> >  PACKAGES =+ "libfreerdp"
> >
> > @@ -26,6 +41,13 @@ FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
> >
> >  PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
> >
> > +# we will need winpr-makecert to generate TLS certificates
> > +do_install_append () {
> > +    install -m755 winpr/tools/makecert/cli/winpr-makecert ${D}${bindir}
> > +    rm -rf ${D}/${libdir}/cmake
> > +    rm -rf ${D}/${libdir}/freerdp
> > +}
> > +
> >  python populate_packages_prepend () {
> >      freerdp_root = d.expand('${libdir}/freerdp')
> >
> > diff --git
> a/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
> b/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
> > new file mode 100644
> > index 0000000..d279d6d
> > --- /dev/null
> > +++
> b/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
> > @@ -0,0 +1,31 @@
> > +From 253eafc8c8da83fc2b1a99a9e43824efc6105c7a Mon Sep 17 00:00:00 2001
> > +From: Manuel Bachmann <manuel.bachmann@iot.bzh>
> > +Date: Sun, 4 Oct 2015 10:44:49 +0200
> > +Subject: [PATCH] winpr-makecert: Build with install RPATH
> > +
> > +As we are installing "winpr-makecert" manually, we do want
> > +to refer to the library in DESTDIR, not the one resting in
> > +the build tree.
> > +
> > +Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> > +---
> > + winpr/tools/makecert/cli/CMakeLists.txt | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/winpr/tools/makecert/cli/CMakeLists.txt
> b/winpr/tools/makecert/cli/CMakeLists.txt
> > +index 17954c4..90c446b 100644
> > +--- a/winpr/tools/makecert/cli/CMakeLists.txt
> > ++++ b/winpr/tools/makecert/cli/CMakeLists.txt
> > +@@ -45,5 +45,9 @@ set(${MODULE_PREFIX}_LIBS winpr-makecert-tool)
> > +
> > + target_link_libraries(${MODULE_NAME} ${${MODULE_PREFIX}_LIBS})
> > +
> > ++set_target_properties(${MODULE_NAME} PROPERTIES
> > ++    BUILD_WITH_INSTALL_RPATH 1)
> > ++
> > + set_property(TARGET ${MODULE_NAME} PROPERTY FOLDER "WinPR/Tools")
> > +
> > ++
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb
> b/meta-oe/recipes-support/freerdp/freerdp_git.bb
> > index fd7f74c..f9cb9a6 100644
> > --- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
> > +++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
> > @@ -5,17 +5,17 @@ include freerdp.inc
> >
> >  inherit gitpkgv
> >
> > -PV = "1.0.2+gitr${SRCPV}"
> > +PV = "1.2.5+gitr${SRCPV}"
> >  PKGV = "${GITPKGVTAG}"
> >
> > -EXTRA_OECMAKE += "-DWITH_MANPAGES=OFF"
> > +EXTRA_OECMAKE += "-DBUILD_STATIC_LIBS=OFF \
> > +                  -DCMAKE_POSITION_INDEPENDANT_CODE=ON \
> > +                  -DWITH_MANPAGES=OFF \
> > +                 "
> >
> > -SRCREV = "f311acaffb9190567e2b478a98d7cbfaf2709f6b"
> > -SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-1.0"
> > +SRCREV = "62da9d28c674814c81c245c1c7882eb0da7be76b"
> > +SRC_URI = "git://github.com/FreeRDP/FreeRDP.git \
> > +           file://winpr-makecert-Build-with-install-RPATH.patch \
> > +          "
> >
> >  S = "${WORKDIR}/git"
> > -
> > -PNBLACKLIST[freerdp] ?= "Installs into double prefix, causing all files
> installed in /usr/usr and empty packages"
> > -# freerdp-1.0.2+gitrAUTOINC+f311acaffb: freerdp: Files/directories were
> installed but not shipped
> > -#       /usr/usr
> > -#       ....
> > --
> > 1.8.3.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

