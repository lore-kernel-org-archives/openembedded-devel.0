Return-Path: <mbc@koumoul.net>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0011577377
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 17:41:07 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id e63so152203760ywc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 09:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=o4yTqqlO4w6+zwFrM271XmCseXqbw12NeFpOTdWnG28=;
	b=KMZnSSTyOi+vWLvFZgoRf4oEIfMAsiwcQxhFRmj9Kh8a9mz3e5MWwARr8S35n29UpC
	3pDyQId9J/Zupm4YKfnEUJ+yXg574nfq/OEal/+rP6MXeYpOQm2+TpwS7C9CjxHlRrDi
	iVx9HN0lh6gws3NT/ukbi58wLreoLv3s6hAxg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=o4yTqqlO4w6+zwFrM271XmCseXqbw12NeFpOTdWnG28=;
	b=AI+q1lzDcp2SA8wZCV3gsP9BAAukAsJs/dGhjvR8AgGI8cRDzvlbAlcfSlb0gf6UrW
	IxyzruiTuRWnfzdCYGbgEW7RM49bkiljqQn98cb5htCUhBHv2E09OrkWmeAUu4H/EVmB
	q1TAN20eDXHAYZ9ORid4B83lyMOh7sPknXOl/Bq9BRNLNLpTOmcbSmNZnSyGHetXmeuH
	aXpGb+gMkl+gKQZvFwXkRTsGccNZGvV09IK+qWzv60Nvj1GF4Kt5WMfNOfkWcM/qIjxv
	N770PK2iUDQ3g7MdolJbG126Kth5bEeqlDPHLvrgzlOs4qqlvxt6Z6p0AmTkXxPqg3TC
	4Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=o4yTqqlO4w6+zwFrM271XmCseXqbw12NeFpOTdWnG28=;
	b=Di7LO+fT+nhanY5Bmzdu5YGT2NiB/XELJrvIDtFh9rFCrvJd+/BAFyagy722Du/P72
	m12Bd0TB5TKwVcNRNXBU7pX0zAkKETWKZNM0d8MiQZpXx6y23jLLYIivtcfMHG8axBV2
	l5Up9MbVzVd3FWpUuWarmsbq1utGd5hCA8JD39HZ8cr225iSiZarGSQoBvzAK07mn9Sz
	vaxnSzKfcbGguhvhwL/w1+qi6alhHi+FE0+ZYiVTupmGOVp0VRJtovpazhQ5O+V8h+80
	V7b6vDaOvRFTNj8l2djCG4waE3eCaXQDRgMcuvtTdpFfKrM/kTFmv+/Rmc9NPeiegmgK
	oENw==
X-Gm-Message-State: AG10YOSnL3hlCcKXEuLAxT99IOHFlL8WbDLDy5kxlUIDiPdWuOIXpjkKaN+n/BoswRCf2eBtEb9Egor2CldELg==
MIME-Version: 1.0
X-Received: by 10.13.198.199 with SMTP id i190mr16704853ywd.255.1456249268434; 
	Tue, 23 Feb 2016 09:41:08 -0800 (PST)
Reply-To: manuel.bachmann@iot.bzh
Sender: mbc@koumoul.net
Received: by 10.129.123.4 with HTTP; Tue, 23 Feb 2016 09:41:08 -0800 (PST)
X-Originating-IP: [46.18.96.42]
In-Reply-To: <1456244935-5288-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456244935-5288-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 23 Feb 2016 18:41:08 +0100
X-Google-Sender-Auth: FSmF3q4f5yu0BYgvFMNWOSZkzgw
Message-ID: <CANTDXNfUWt7py3t4_BToqpdj52+JoCZLjLrGz5-gttUJa3--Kg@mail.gmail.com>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-oe] freerdp: fold .inc into .bb
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
X-List-Received-Date: Tue, 23 Feb 2016 17:41:09 -0000
Content-Type: text/plain; charset=UTF-8

Oops. I'll take a look at this.

Regards,

*Manuel Bachmann, Graphics & Multimedia Engineer www.iot.bzh
<http://iot.bzh> *


2016-02-23 17:28 GMT+01:00 Martin Jansa <martin.jansa@gmail.com>:

> * currently it's broken again
>   ERROR: freerdp-1.2.5+gitrAUTOINC+62da9d28c6-r0 do_package: QA Issue:
> freerdp: Files/directories were installed but not shipped in any package:
>     /usr/bin
>   Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within do_install.
>   freerdp: 1 installed and not shipped files. [installed-vs-shipped]
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/freerdp/freerdp.inc    | 74
> -----------------------
>  meta-oe/recipes-support/freerdp/freerdp_git.bb | 83
> +++++++++++++++++++++++---
>  2 files changed, 75 insertions(+), 82 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/freerdp/freerdp.inc
>
> diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc
> b/meta-oe/recipes-support/freerdp/freerdp.inc
> deleted file mode 100644
> index 2937bc5..0000000
> --- a/meta-oe/recipes-support/freerdp/freerdp.inc
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -# Copyright (C) 2010-2012 O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license
> -
> -DESCRIPTION = "FreeRDP RDP client & server library"
> -HOMEPAGE = "http://www.freerdp.com"
> -DEPENDS = "openssl alsa-lib pcsc-lite"
> -SECTION = "net"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -
> -inherit pkgconfig cmake
> -
> -EXTRA_OECMAKE += "-DWITH_ALSA=ON \
> -                  -DWITH_PCSC=ON \
> -                  -DWITH_FFMPEG=OFF \
> -                  -DWITH_CUNIT=OFF \
> -                  -DWITH_NEON=OFF \
> -                 "
> -
> -PACKAGECONFIG ??= "  \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '',
> d)}\
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> 'wayland', '', d)}\
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb',
> 'directfb', '', d)}\
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '',
> d)}\
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio',
> 'pulseaudio', '', d)}\
> -                gstreamer cups \
> -                "
> -
> -X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi
> libxrender libxfixes libxdamage libxrandr libxkbfile"
> -PACKAGECONFIG[x11] = "-DWITH_X11=ON -DWITH_XINERAMA=ON -DWITH_XEXT=ON
> -DWITH_XCURSOR=ON -DWITH_XV=ON -DWITH_XI=ON -DWITH_XRENDER=ON
> -DWITH_XFIXES=ON -DWITH_XDAMAGE=ON -DWITH_XRANDR=ON
> -DWITH_XKBFILE=ON,-DWITH_X11=OFF,${X11_DEPS}"
> -PACKAGECONFIG[wayland] = "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland"
> -PACKAGECONFIG[directfb] =
> "-DWITH_DIRECTFB=ON,-DWITH_DIRECTFB=OFF,directfb"
> -PACKAGECONFIG[pam] = "-DWITH_PAM=ON,-DWITH_PAM=OFF,libpam"
> -PACKAGECONFIG[pulseaudio] =
> "-DWITH_PULSEAUDIO=ON,-DWITH_PULSEAUDIO=OFF,pulseaudio"
> -PACKAGECONFIG[gstreamer] =
> "-DWITH_GSTREAMER_1_0=ON,-DWITH_GSTREAMER_1_0=OFF,gstreamer1.0
> gstreamer1.0-plugins-base"
> -PACKAGECONFIG[cups] = "-DWITH_CUPS=ON,-DWITH_CUPS=OFF,cups"
> -
> -PACKAGES =+ "libfreerdp"
> -
> -LEAD_SONAME = "libfreerdp.so"
> -FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
> -
> -PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
> -
> -# we will need winpr-makecert to generate TLS certificates
> -do_install_append () {
> -    install -m755 winpr/tools/makecert/cli/winpr-makecert ${D}${bindir}
> -    rm -rf ${D}/${libdir}/cmake
> -    rm -rf ${D}/${libdir}/freerdp
> -}
> -
> -python populate_packages_prepend () {
> -    freerdp_root = d.expand('${libdir}/freerdp')
> -
> -    do_split_packages(d, freerdp_root, '^(audin_.*)\.so$',
> -        output_pattern='libfreerdp-plugin-%s',
> -        description='FreeRDP plugin %s',
> -        prepend=True, extra_depends='libfreerdp-plugin-audin')
> -
> -    do_split_packages(d, freerdp_root, '^(rdpsnd_.*)\.so$',
> -        output_pattern='libfreerdp-plugin-%s',
> -        description='FreeRDP plugin %s',
> -        prepend=True, extra_depends='libfreerdp-plugin-rdpsnd')
> -
> -    do_split_packages(d, freerdp_root, '^(tsmf_.*)\.so$',
> -        output_pattern='libfreerdp-plugin-%s',
> -        description='FreeRDP plugin %s',
> -        prepend=True, extra_depends='libfreerdp-plugin-tsmf')
> -
> -    do_split_packages(d, freerdp_root, '^([^-]*)\.so$',
> -        output_pattern='libfreerdp-plugin-%s',
> -        description='FreeRDP plugin %s',
> -        prepend=True, extra_depends='')
> -}
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb
> b/meta-oe/recipes-support/freerdp/freerdp_git.bb
> index 13dff6e..c749b0c 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
> @@ -1,18 +1,18 @@
> -# Copyright (C) 2010-2012, O.S. Systems Software Ltda.
> +# Copyright (C) 2010-2012 O.S. Systems Software Ltda. All Rights Reserved
>  # Released under the MIT license
>
> -include freerdp.inc
> +DESCRIPTION = "FreeRDP RDP client & server library"
> +HOMEPAGE = "http://www.freerdp.com"
> +DEPENDS = "openssl alsa-lib pcsc-lite"
> +SECTION = "net"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -inherit gitpkgv
> +inherit pkgconfig cmake gitpkgv
>
>  PV = "1.2.5+gitr${SRCPV}"
>  PKGV = "${GITPKGVTAG}"
>
> -EXTRA_OECMAKE += "-DBUILD_STATIC_LIBS=OFF \
> -                  -DCMAKE_POSITION_INDEPENDANT_CODE=ON \
> -                  -DWITH_MANPAGES=OFF \
> -                 "
> -
>  SRCREV = "62da9d28c674814c81c245c1c7882eb0da7be76b"
>  SRC_URI = "git://github.com/FreeRDP/FreeRDP.git \
>      file://winpr-makecert-Build-with-install-RPATH.patch \
> @@ -20,3 +20,70 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git \
>  "
>
>  S = "${WORKDIR}/git"
> +
> +EXTRA_OECMAKE += " \
> +    -DWITH_ALSA=ON \
> +    -DWITH_PCSC=ON \
> +    -DWITH_FFMPEG=OFF \
> +    -DWITH_CUNIT=OFF \
> +    -DWITH_NEON=OFF \
> +    -DBUILD_STATIC_LIBS=OFF \
> +    -DCMAKE_POSITION_INDEPENDANT_CODE=ON \
> +    -DWITH_MANPAGES=OFF \
> +"
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
> +
> +PACKAGES =+ "libfreerdp"
> +
> +LEAD_SONAME = "libfreerdp.so"
> +FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
> +
> +PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
> +
> +# we will need winpr-makecert to generate TLS certificates
> +do_install_append () {
> +    install -m755 winpr/tools/makecert/cli/winpr-makecert ${D}${bindir}
> +    rm -rf ${D}/${libdir}/cmake
> +    rm -rf ${D}/${libdir}/freerdp
> +}
> +
> +python populate_packages_prepend () {
> +    freerdp_root = d.expand('${libdir}/freerdp')
> +
> +    do_split_packages(d, freerdp_root, '^(audin_.*)\.so$',
> +        output_pattern='libfreerdp-plugin-%s',
> +        description='FreeRDP plugin %s',
> +        prepend=True, extra_depends='libfreerdp-plugin-audin')
> +
> +    do_split_packages(d, freerdp_root, '^(rdpsnd_.*)\.so$',
> +        output_pattern='libfreerdp-plugin-%s',
> +        description='FreeRDP plugin %s',
> +        prepend=True, extra_depends='libfreerdp-plugin-rdpsnd')
> +
> +    do_split_packages(d, freerdp_root, '^(tsmf_.*)\.so$',
> +        output_pattern='libfreerdp-plugin-%s',
> +        description='FreeRDP plugin %s',
> +        prepend=True, extra_depends='libfreerdp-plugin-tsmf')
> +
> +    do_split_packages(d, freerdp_root, '^([^-]*)\.so$',
> +        output_pattern='libfreerdp-plugin-%s',
> +        description='FreeRDP plugin %s',
> +        prepend=True, extra_depends='')
> +}
> --
> 2.7.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

