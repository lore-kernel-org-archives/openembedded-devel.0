Return-Path: <mbc@koumoul.net>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3FDC460125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 08:36:12 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so9891604igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 01:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=feU/JIfW+QPV3DKfdMXRQBrCjoHuxENDvI1m7ZPGoFw=;
	b=Jhq9vy/LktVDtW/48i6kB2jqvMhOsp+Df9drWiZlQ9jjB18h03eC58K+uuUbra4GnP
	hCmadKhSZd42UrTTxt0VcHlVwh0aI1cTkEjvs7Byv6wisNelEVwlC9Xs8+Ta+eFFK3IC
	lbnvZptW7ja3APZD1qkUhRgEA6aMW3JIHthBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=feU/JIfW+QPV3DKfdMXRQBrCjoHuxENDvI1m7ZPGoFw=;
	b=awt7i1Hqjywcf8vCnbNW42Nl5mAl7PLgZZbvEEkshp8hSuGQlHY9FT9vyoy6EEDSFs
	AUo+WF+3/hmV/XmW9Rgy6WSbsLUWH+tlRBRhPYsdHtN4RUXXLB9PmfrHV35pmmvlimNs
	x+GDPQBTfo+8XbpEMrw5omJ2Zib25GRYxCOdrQuto5WYEhTQScdNN4CF2hyYsnq27rT5
	6Ff2Pqo3U++v+ShRVAjMP6hpQtyE6FHhBRf3shWZGotzOisu1TaMV2GZ9VxdJiZ6S9JH
	KDSRqigfXam8ebIqLUWyIetV8t6iZZSTAWs5AgwdPPeNpFatmac6q/EnCw55KrbHIFhr
	HqrA==
X-Gm-Message-State: ALoCoQkA7d/e7WNLppRWa/fczN6stpFZH3ou/8RECJdBhvADLFsEGcNqrq/s9Fa4F5kyZ2tUXilO
MIME-Version: 1.0
X-Received: by 10.50.66.197 with SMTP id h5mr2151964igt.82.1444293372740; Thu,
	08 Oct 2015 01:36:12 -0700 (PDT)
Sender: mbc@koumoul.net
Received: by 10.79.111.6 with HTTP; Thu, 8 Oct 2015 01:36:12 -0700 (PDT)
X-Originating-IP: [2.13.130.70]
In-Reply-To: <1444293326-5535-1-git-send-email-manuel.bachmann@iot.bzh>
References: <1444293326-5535-1-git-send-email-manuel.bachmann@iot.bzh>
Date: Thu, 8 Oct 2015 10:36:12 +0200
X-Google-Sender-Auth: xQhqIuquXErCk4xE0387L48hAxo
Message-ID: <CANTDXNcKB+0a5f+tGn_MTvtU99sVVeDQLE9NE1VAj9-xFF7RDw@mail.gmail.com>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Manuel Bachmann <mbc@iot.bzh>
Subject: Re: [PATCH v2][meta-oe] freerdp: get out of PNBLACKLIST, fix build, improve
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
X-List-Received-Date: Thu, 08 Oct 2015 08:36:13 -0000
Content-Type: text/plain; charset=UTF-8

Sorry, forgot a file, sending v3.

Regards,

*Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *


2015-10-08 10:35 GMT+02:00 Manuel Bachmann <manuel.bachmann@iot.bzh>:

> From: Manuel Bachmann <mbc@iot.bzh>
>
> We make the "freerdp" recipe active again, fix the build
> by pulling a more recent version (the "stable" branches are
> buggy and useless), and fix ARM runtime with -fPIC.
>
> We can then :
> - make X11 non-mandatory ;
> - add support for Wayland ("wlfreerdp" client) ;
> - add support for DirectFB ("dfreerdp" client) ;
> - add support for GStreamer 1.0 ;
> - make "heavy" features such as pulseaudio, cups...
> non-mandatory.
>
> We really want to install the "winpr-makecert" tool to have
> TLS, but CMake does not position its RPATH cleanly, so let
> us have a custom patch for that until it gets sorted out.
>
> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> ---
>  meta-oe/recipes-support/freerdp/freerdp.inc    | 38
> ++++++++++++++++++++------
>  meta-oe/recipes-support/freerdp/freerdp_git.bb | 18 ++++++------
>  2 files changed, 39 insertions(+), 17 deletions(-)
>
> diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc
> b/meta-oe/recipes-support/freerdp/freerdp.inc
> index 34dac4b..af93e83 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp.inc
> +++ b/meta-oe/recipes-support/freerdp/freerdp.inc
> @@ -1,23 +1,38 @@
>  # Copyright (C) 2010-2012 O.S. Systems Software Ltda. All Rights Reserved
>  # Released under the MIT license
>
> -DESCRIPTION = "FreeRDP RDP client"
> +DESCRIPTION = "FreeRDP RDP client & server library"
>  HOMEPAGE = "http://www.freerdp.com"
> -DEPENDS = "virtual/libx11 openssl libxcursor libxv cups alsa-lib
> pulseaudio pcsc-lite libxkbfile libxinerama"
> -SECTION = "x11/network"
> +DEPENDS = "openssl alsa-lib pcsc-lite"
> +SECTION = "net"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
>  inherit pkgconfig cmake
>
> -EXTRA_OECMAKE += "-DWITH_PULSEAUDIO=ON \
> +EXTRA_OECMAKE += "-DWITH_ALSA=ON \
>                    -DWITH_PCSC=ON \
> -                  -DWITH_CUPS=ON \
>                    -DWITH_FFMPEG=OFF \
>                    -DWITH_CUNIT=OFF \
> -                  -DWITH_X11=ON \
> -                  -DWITH_XKBFILE=ON \
> -                  -DWITH_XINERAMA=ON"
> +                 "
> +
> +PACKAGECONFIG ??= "  \
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '',
> d)}\
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> 'wayland', '', d)}\
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb',
> 'directfb', '', d)}\
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '',
> d)}\
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio',
> 'pulseaudio', '', d)}\
> +                gstreamer cups \
> +                "
> +
> +X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi
> libxrender libxfixes libxdamage libxrandr libxkbfile"
> +PACKAGECONFIG[x11] = "-DWITH_X11=ON -DWITH_XINERAMA=ON -DWITH_XEXT=ON
> -DWITH_XCURSOR=ON -DWITH_XV=ON -DWITH_XI=ON -DWITH_XRENDER=ON
> -DWITH_XFIXES=ON -DWITH_XDAMAGE=ON -DWITH_XRANDR=ON
> -DWITH_XKBFILE=ON,-DWITH_X11=OFF,${X11_DEPS}"
> +PACKAGECONFIG[wayland] = "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland"
> +PACKAGECONFIG[directfb] =
> "-DWITH_DIRECTFB=ON,-DWITH_DIRECTFB=OFF,directfb"
> +PACKAGECONFIG[pam] = "-DWITH_PAM=ON,-DWITH_PAM=OFF,libpam"
> +PACKAGECONFIG[pulseaudio] =
> "-DWITH_PULSEAUDIO=ON,-DWITH_PULSEAUDIO=OFF,pulseaudio"
> +PACKAGECONFIG[gstreamer] =
> "-DWITH_GSTREAMER_1_0=ON,-DWITH_GSTREAMER_1_0=OFF,gstreamer1.0
> gstreamer1.0-plugins-base"
> +PACKAGECONFIG[cups] = "-DWITH_CUPS=ON,-DWITH_CUPS=OFF,cups"
>
>  PACKAGES =+ "libfreerdp"
>
> @@ -26,6 +41,13 @@ FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
>
>  PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
>
> +# we will need winpr-makecert to generate TLS certificates
> +do_install_append () {
> +    install -m755 winpr/tools/makecert/cli/winpr-makecert ${D}${bindir}
> +    rm -rf ${D}/${libdir}/cmake
> +    rm -rf ${D}/${libdir}/freerdp
> +}
> +
>  python populate_packages_prepend () {
>      freerdp_root = d.expand('${libdir}/freerdp')
>
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb
> b/meta-oe/recipes-support/freerdp/freerdp_git.bb
> index fd7f74c..f9cb9a6 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
> @@ -5,17 +5,17 @@ include freerdp.inc
>
>  inherit gitpkgv
>
> -PV = "1.0.2+gitr${SRCPV}"
> +PV = "1.2.5+gitr${SRCPV}"
>  PKGV = "${GITPKGVTAG}"
>
> -EXTRA_OECMAKE += "-DWITH_MANPAGES=OFF"
> +EXTRA_OECMAKE += "-DBUILD_STATIC_LIBS=OFF \
> +                  -DCMAKE_POSITION_INDEPENDANT_CODE=ON \
> +                  -DWITH_MANPAGES=OFF \
> +                 "
>
> -SRCREV = "f311acaffb9190567e2b478a98d7cbfaf2709f6b"
> -SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-1.0"
> +SRCREV = "62da9d28c674814c81c245c1c7882eb0da7be76b"
> +SRC_URI = "git://github.com/FreeRDP/FreeRDP.git \
> +           file://winpr-makecert-Build-with-install-RPATH.patch \
> +          "
>
>  S = "${WORKDIR}/git"
> -
> -PNBLACKLIST[freerdp] ?= "Installs into double prefix, causing all files
> installed in /usr/usr and empty packages"
> -# freerdp-1.0.2+gitrAUTOINC+f311acaffb: freerdp: Files/directories were
> installed but not shipped
> -#       /usr/usr
> -#       ....
> --
> 1.8.3.1
>
>

