Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4616CA1001
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 15:14:29 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.18912.1725030862639930928
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Aug 2024 08:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sPMUkjwM;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47UFEKeF044117;
	Fri, 30 Aug 2024 10:14:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725030860;
	bh=lTAJ5+eiyDxBFR8kj0/uM2nXXF6h5Apz7ujXC6/Fepk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=sPMUkjwMJsw9JYz/Py/Mr2o0zz/AVwOSFRBGI4UgQpu3FvAUDa1srBU64XROn3QoG
	 vBtH1BpIO0gRtPqNsbqhxV07UWOFzW6gV6CyZhNw7D5try0CqXtlyw2ioV7zaDHzHC
	 4u1JsIyC0ZY9GwTKm/DJP1JRky52lGlWYgN/pod4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47UFEKQB115501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Aug 2024 10:14:20 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 30
 Aug 2024 10:14:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 30 Aug 2024 10:14:20 -0500
Received: from [10.249.36.103] ([10.249.36.103])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47UFEKnl029923;
	Fri, 30 Aug 2024 10:14:20 -0500
Message-ID: <16aa8f4c-6c08-4ad8-80a2-f56be565509d@ti.com>
Date: Fri, 30 Aug 2024 10:14:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 5/8] mpv: Upgrade to 0.38.0 release
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20240830035827.406391-1-raj.khem@gmail.com>
 <20240830035827.406391-5-raj.khem@gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240830035827.406391-5-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 15:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112056



On 8/29/2024 10:58 PM, Khem Raj wrote:
> https://github.com/mpv-player/mpv/releases
> 
> migrate to using meson build system
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   ...d-emitting-absolute-filepaths-into-g.patch | 33 ++++++++
>   .../mplayer/{mpv_0.35.1.bb => mpv_0.38.0.bb}  | 79 ++++++++-----------
>   2 files changed, 68 insertions(+), 44 deletions(-)
>   create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-file2string-Avoid-emitting-absolute-filepaths-into-g.patch
>   rename meta-oe/recipes-multimedia/mplayer/{mpv_0.35.1.bb => mpv_0.38.0.bb} (51%)
> 
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0001-file2string-Avoid-emitting-absolute-filepaths-into-g.patch b/meta-oe/recipes-multimedia/mplayer/mpv/0001-file2string-Avoid-emitting-absolute-filepaths-into-g.patch
> new file mode 100644
> index 0000000000..b96ec5d4c4
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv/0001-file2string-Avoid-emitting-absolute-filepaths-into-g.patch
> @@ -0,0 +1,33 @@
> +From 9878681df9919d28da3e4c6cc706e264abd9df92 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 29 Aug 2024 17:54:15 -0700
> +Subject: [PATCH] file2string: Avoid emitting absolute filepaths into generated
> + sources
> +
> +These sources are bundled into src packages to be distributed and leaking
> +buildpaths results in violating reproducibility norms.
> +
> +Upstream-Status: Submitted [https://github.com/mpv-player/mpv/pull/14763]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + TOOLS/file2string.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/TOOLS/file2string.py b/TOOLS/file2string.py
> +index 5b1c4a95d1..39c1122a35 100755
> +--- a/TOOLS/file2string.py
> ++++ b/TOOLS/file2string.py
> +@@ -22,10 +22,10 @@
> + # License along with mpv.  If not, see <http://www.gnu.org/licenses/>.
> + #
> +
> +-import sys
> ++import os, sys
> +
> + def file2string(infilename, infile, outfile):
> +-    outfile.write("// Generated from %s\n\n" % infilename)
> ++    outfile.write("// Generated from %s\n\n" % os.path.basename(infilename))
> +
> +     conv = ["\\%03o" % c for c in range(256)]
> +     safe_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" \
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.38.0.bb
> similarity index 51%
> rename from meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
> rename to meta-oe/recipes-multimedia/mplayer/mpv_0.38.0.bb
> index 0f50a6e8fe..e9384e88d3 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.38.0.bb
> @@ -9,20 +9,20 @@ DEPENDS = " \
>       jpeg \
>       libv4l \
>       libass \
> +    libplacebo \
>   "
>   
>   LICENSE = "GPL-2.0-or-later"
>   LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   
> -SRCREV_mpv = "140ec21c89d671d392877a7f3b91d67e7d7b9239"
> -SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/0.35;protocol=https \
> -           https://waf.io/waf-2.0.25;name=waf;subdir=git \
> +SRCREV_mpv = "02254b92dd237f03aa0a151c2a68778c4ea848f9"
> +SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/0.38;protocol=https \
> +           file://0001-file2string-Avoid-emitting-absolute-filepaths-into-g.patch \
>              "
> -SRC_URI[waf.sha256sum] = "21199cd220ccf60434133e1fd2ab8c8e5217c3799199c82722543970dc8e38d5"
>   
>   S = "${WORKDIR}/git"
>   
> -inherit waf pkgconfig mime-xdg
> +inherit meson pkgconfig mime-xdg
>   
>   LDFLAGS:append:riscv64 = " -latomic"
>   
> @@ -42,59 +42,55 @@ PACKAGECONFIG ??= " \
>       ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
>   "
>   
> -PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 xsp libxv libxscrnsaver libxinerama libxpresent libxext"
> -PACKAGECONFIG[xv] = "--enable-xv,--disable-xv,libxv"
> -PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
> -PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
> -PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
> -PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/libgbm"
> -PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua luajit"
> -PACKAGECONFIG[libarchive] = "--enable-libarchive,--disable-libarchive,libarchive"
> -PACKAGECONFIG[jack] = "--enable-jack, --disable-jack, jack"
> -PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
> -PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
> -PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland wayland-native libxkbcommon"

> +PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=diabled,virtual/libx11 xsp libxv libxscrnsaver libxinerama libxpresent libxext"

Mispelling on "diabled", should be "disabled".

> +PACKAGECONFIG[xv] = "-Dxv=enabled,-Dxv=disabled,libxv"
> +PACKAGECONFIG[opengl] = "-Dgl=enabled,-Dgl=disabled,virtual/libgl"
> +PACKAGECONFIG[egl] = "-Degl=enabled,-Degl-disabled,virtual/egl"
> +PACKAGECONFIG[drm] = "-Ddrm=enabled,-Ddrm=disabled,libdrm"
> +PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled,virtual/libgbm"
> +PACKAGECONFIG[lua] = "-Dlua=luajit,-Dlua=disabled,lua luajit"
> +PACKAGECONFIG[libarchive] = "-Dlibarchive=enabled,-Dlibarchive=disabled,libarchive"
> +PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack"
> +PACKAGECONFIG[vaapi] = "-Dvaapi=enabled,-Dvaapi=disabled,libva"
> +PACKAGECONFIG[vdpau] = "-Dvdpau=enabled,-Dvdpau=disabled,libvdpau"
> +PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,wayland wayland-native libxkbcommon"
>   
>   python __anonymous() {
>       packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
>       extras = []
>       if "x11" in packageconfig and "opengl" in packageconfig:
> -        extras.append(" --enable-gl-x11")
> +        extras.append(" -Dgl-x11=enabled")
>       if "x11" in packageconfig and "egl" in packageconfig:
> -        extras.append(" --enable-egl-x11")
> +        extras.append(" -Degl-x11=enabled")
>       if "egl" in packageconfig and "drm" in packageconfig:
> -        extras.append(" --enable-egl-drm")
> +        extras.append(" -Degl-drm=enabled")
>       if "vaapi" in packageconfig and "x11" in packageconfig:
> -        extras.append(" --enable-vaapi-x11")
> +        extras.append(" -Dvaapi-x11=enabled")
>       if "vaapi" in packageconfig and "drm" in packageconfig:
> -        extras.append(" --enable-vaapi-drm")
> +        extras.append(" -Dvaapi-drm=enabled")
>       if "vaapi" in packageconfig and "x11" in packageconfig and "egl" in packageconfig:
> -        extras.append(" --enable-vaapi-x-egl")
> +        extras.append(" -Dvaapi-x-egl=enabled")
>       if "vdpau" in packageconfig and "opengl" in packageconfig and "x11" in packageconfig:
> -        extras.append(" --enable-vdpau-gl-x11")
> +        extras.append(" -Dvdpau-gl-x11=enabled")
>       if "wayland" in packageconfig and "opengl" in packageconfig:
> -        extras.append(" --enable-gl-wayland")
> +        extras.append(" -Dgl-wayland=enabled")
>       if "wayland" in packageconfig and "vaapi" in packageconfig:
> -        extras.append(" --enable-vaapi-wayland")
> +        extras.append(" -Dvaapi-wayland=enabled")
>       if extras:
>           d.appendVar("EXTRA_OECONF", "".join(extras))
>   }
>   
> -SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', '')}"
> +#SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', '')}"
>   
>   EXTRA_OECONF = " \
> -    --prefix=${prefix} \
> -    --target=${SIMPLE_TARGET_SYS} \
> -    --confdir=${sysconfdir} \
> -    --datadir=${datadir} \
> -    --disable-manpage-build \
> -    --disable-libbluray \
> -    --disable-dvdnav \
> -    --disable-cdda \
> -    --disable-uchardet \
> -    --disable-rubberband \
> -    --disable-lcms2 \
> -    --disable-vapoursynth \
> +    -Dmanpage-build=disabled \
> +    -Dlibbluray=disabled \
> +    -Ddvdnav=disabled \
> +    -Dcdda=disabled \
> +    -Duchardet=disabled \
> +    -Drubberband=disabled \
> +    -Dlcms2=disabled \
> +    -Dvapoursynth=disabled \
>       ${PACKAGECONFIG_CONFARGS} \
>   "
>   
> @@ -102,11 +98,6 @@ do_configure:append() {
>       sed -i -e 's#${WORKDIR}#<WORKDIR>#g' ${B}/config.h
>   }
>   
> -link_waf() {
> -    ln -s waf-2.0.25 ${S}/waf
> -}
> -do_unpack[postfuncs] += "link_waf"
> -
>   FILES:${PN} += " \
>       ${datadir}/icons \
>       ${datadir}/zsh \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112044): https://lists.openembedded.org/g/openembedded-devel/message/112044
> Mute This Topic: https://lists.openembedded.org/mt/108174009/6551054
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

