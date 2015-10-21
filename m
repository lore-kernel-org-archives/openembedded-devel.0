Return-Path: <mbc@koumoul.net>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF9076104
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 05:03:44 +0000 (UTC)
Received: by igdg1 with SMTP id g1so78625221igd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 22:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=0O0UbSN6gTpfg0BEMuo4FfLrD/EMioLaMk3RMSl1pfE=;
	b=MvDii3BtU470J3M1D/tXm1anepM9m5XsDR87AYRTlWK+xTQ9xC8Du9LcuWPiYUPYPr
	Nx0NIwQ9IrJvsIUBCcVNQmBjJW9hyiODxVsm9uNGsc4CCzuZOTqD0G3H+3mCzumKUBCV
	P/SeWAAKBLZEnYupLdsJo1Pyfle/LGFh+0qZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0O0UbSN6gTpfg0BEMuo4FfLrD/EMioLaMk3RMSl1pfE=;
	b=Uwtksyv23xuIp0VHOj+fS9U/Bt4qSGbnpJUpHlmPn5NsjoTx4Xdix0XZsQlktMrozS
	BIvUp2gm4nElv3RHfiv9pb1AT9tnXEQpWMW6Qu7RZZFMErR31RrQqOv/VEghrkTGcgRg
	ti5sMjphzmu89jiAohgJIupFrkqy62Agx5MxeTuVwNDLvAwxnsSI5/gtMEDi6B2UwG2P
	i6TdE1odvN9/2TCzkFbb1E1gF9+7xbSXEfhbcBAswG4hCeJlmCSL2kyIfcPwu19ZbWY6
	7KEQ/5ujej7MU/kipippmvrEIwBGzIwmS4YJpfXBxkXPhGDShw0CSZL6t7yps0rlXoX3
	28ug==
X-Gm-Message-State: ALoCoQkoo3uaHVo1rnP3XbdNWlKHySZAp/HpoFqqRowTPhryjjS6JCaw4bG9/YE8ASZ3z79t3nuY
MIME-Version: 1.0
X-Received: by 10.50.25.195 with SMTP id e3mr30297131igg.0.1445403824359; Tue,
	20 Oct 2015 22:03:44 -0700 (PDT)
Sender: mbc@koumoul.net
Received: by 10.79.38.193 with HTTP; Tue, 20 Oct 2015 22:03:44 -0700 (PDT)
X-Originating-IP: [81.53.38.49]
In-Reply-To: <20151020155935.GC2557@jama>
References: <1444658941-16418-1-git-send-email-manuel.bachmann@iot.bzh>
	<20151020155935.GC2557@jama>
Date: Wed, 21 Oct 2015 07:03:44 +0200
X-Google-Sender-Auth: Kgugg8UIE0vVHsMZlnqD8mkJELw
Message-ID: <CANTDXNfGuh-m1dGKar_Ygrsp6thcN0UC6tDz3vxWXyxFLGsWKg@mail.gmail.com>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH v4][meta-oe] freerdp: get out of PNBLACKLIST, fix build, improve
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
X-List-Received-Date: Wed, 21 Oct 2015 05:03:46 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

Ouch, sure ! Will look at this quickly and let you know.

Regards,

*Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *


2015-10-20 17:59 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:

> On Mon, Oct 12, 2015 at 04:09:01PM +0200, Manuel Bachmann wrote:
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
> There is one more issue, vlc is autodetecting this and failing to build:
> http://errors.yoctoproject.org/Errors/Details/20600/
> http://errors.yoctoproject.org/Errors/Details/20603/
>
> Can you update vlc to explicitly enable/disable freerdp support with
> PACKAGECONFIG and if enabled by default then to work with this version of
> freerdp?
>
> Thanks
>
> >
> > Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> > ---
> >  meta-oe/recipes-support/freerdp/freerdp.inc        | 39
> +++++++++++++++++-----
> >  .../winpr-makecert-Build-with-install-RPATH.patch  | 31
> +++++++++++++++++
> >  meta-oe/recipes-support/freerdp/freerdp_git.bb     | 18 +++++-----
> >  3 files changed, 71 insertions(+), 17 deletions(-)
> >  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
> >
> > diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc
> b/meta-oe/recipes-support/freerdp/freerdp.inc
> > index 34dac4b..2937bc5 100644
> > --- a/meta-oe/recipes-support/freerdp/freerdp.inc
> > +++ b/meta-oe/recipes-support/freerdp/freerdp.inc
> > @@ -1,23 +1,39 @@
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
> > +                  -DWITH_NEON=OFF \
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
> > @@ -26,6 +42,13 @@ FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
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

