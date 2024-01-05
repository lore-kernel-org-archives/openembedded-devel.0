Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FDCC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 19:22:17 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.32305.1704482533415995446
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jan 2024 11:22:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout02.t-online.de (Postfix) with SMTP id EEF2B1103
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Jan 2024 20:22:11 +0100 (CET)
Received: from [192.168.178.67] ([84.154.175.203]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rLplj-4cNKts0; Fri, 5 Jan 2024 20:22:11 +0100
Date: Fri, 05 Jan 2024 20:22:05 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] mpv: upgrade 0.35.1 -> 0.37.0
To: openembedded-devel@lists.openembedded.org
Message-Id: <T4ZS6S.AQ4T73WX9NW13@t-online.de>
In-Reply-To: <17A789C777649E56.25044@lists.openembedded.org>
References: <17A789C777649E56.25044@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Ml8Omm2K9l4PHKyWFRK4"
X-TOI-EXPURGATEID: 150726::1704482531-E7FFC990-5BC845CC/0/0 CLEAN NORMAL
X-TOI-MSGID: 42109cec-5cf1-42a4-b78e-7412894ac278
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 19:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108055

--=-Ml8Omm2K9l4PHKyWFRK4
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 fixes branch

On Fri, Jan 5 2024 at 08:21:05 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - switch buildsystem from waf to meson
> - add libplacebo dependency
> - add vulkan support
> - build libmpv (needed eg. for mpvpaper)
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-multimedia/mplayer/mpv_0.35.1.bb  | 116 
> ------------------
>  .../recipes-multimedia/mplayer/mpv_0.37.0.bb  |  97 +++++++++++++++
>  2 files changed, 97 insertions(+), 116 deletions(-)
>  delete mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
>  create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.37.0.bb
> 
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb 
> b/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
> deleted file mode 100644
> index 0f50a6e8f..000000000
> --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
> +++ /dev/null
> @@ -1,116 +0,0 @@
> -SUMMARY = "Open Source multimedia player"
> -DESCRIPTION = "mpv is a fork of mplayer2 and MPlayer. It shares some 
> features with the former projects while introducing many more."
> -SECTION = "multimedia"
> -HOMEPAGE = "<http://www.mpv.io/>"
> -
> -DEPENDS = " \
> -    zlib \
> -    ffmpeg \
> -    jpeg \
> -    libv4l \
> -    libass \
> -"
> -
> -LICENSE = "GPL-2.0-or-later"
> -LIC_FILES_CHKSUM = 
> "file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263" 
> <file://license.gpl;md5=b234ee4d69f5fce4486a80fdaf4a4263/>
> -
> -SRCREV_mpv = "140ec21c89d671d392877a7f3b91d67e7d7b9239"
> -SRC_URI = 
> "git://github.com/mpv-player/mpv;name=mpv;branch=release/0.35;protocol=https 
> \
> -           <https://waf.io/waf-2.0.25;name=waf;subdir=git> \
> -           "
> -SRC_URI[waf.sha256sum] = 
> "21199cd220ccf60434133e1fd2ab8c8e5217c3799199c82722543970dc8e38d5"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit waf pkgconfig mime-xdg
> -
> -LDFLAGS:append:riscv64 = " -latomic"
> -
> -LUA ?= "lua"
> -LUA:mips64  = ""
> -LUA:powerpc64  = ""
> -LUA:powerpc64le  = ""
> -LUA:riscv64  = ""
> -LUA:riscv32  = ""
> -LUA:powerpc  = ""
> -
> -# Note: lua is required to get on-screen-display (controls)
> -PACKAGECONFIG ??= " \
> -    ${LUA} \
> -    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'wayland', 'wayland 
> egl', '', d)} \
> -    ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'x11', d)} \
> -    ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'opengl', d)} \
> -"
> -
> -PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 xsp 
> libxv libxscrnsaver libxinerama libxpresent libxext"
> -PACKAGECONFIG[xv] = "--enable-xv,--disable-xv,libxv"
> -PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
> -PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
> -PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
> -PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/libgbm"
> -PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua luajit"
> -PACKAGECONFIG[libarchive] = 
> "--enable-libarchive,--disable-libarchive,libarchive"
> -PACKAGECONFIG[jack] = "--enable-jack, --disable-jack, jack"
> -PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
> -PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
> -PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland 
> wayland-native libxkbcommon"
> -
> -python __anonymous() {
> -    packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
> -    extras = []
> -    if "x11" in packageconfig and "opengl" in packageconfig:
> -        extras.append(" --enable-gl-x11")
> -    if "x11" in packageconfig and "egl" in packageconfig:
> -        extras.append(" --enable-egl-x11")
> -    if "egl" in packageconfig and "drm" in packageconfig:
> -        extras.append(" --enable-egl-drm")
> -    if "vaapi" in packageconfig and "x11" in packageconfig:
> -        extras.append(" --enable-vaapi-x11")
> -    if "vaapi" in packageconfig and "drm" in packageconfig:
> -        extras.append(" --enable-vaapi-drm")
> -    if "vaapi" in packageconfig and "x11" in packageconfig and "egl" 
> in packageconfig:
> -        extras.append(" --enable-vaapi-x-egl")
> -    if "vdpau" in packageconfig and "opengl" in packageconfig and 
> "x11" in packageconfig:
> -        extras.append(" --enable-vdpau-gl-x11")
> -    if "wayland" in packageconfig and "opengl" in packageconfig:
> -        extras.append(" --enable-gl-wayland")
> -    if "wayland" in packageconfig and "vaapi" in packageconfig:
> -        extras.append(" --enable-vaapi-wayland")
> -    if extras:
> -        d.appendVar("EXTRA_OECONF", "".join(extras))
> -}
> -
> -SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', 
> '')}"
> -
> -EXTRA_OECONF = " \
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
> -    ${PACKAGECONFIG_CONFARGS} \
> -"
> -
> -do_configure:append() {
> -    sed -i -e 's#${WORKDIR}#<WORKDIR>#g' ${B}/config.h
> -}
> -
> -link_waf() {
> -    ln -s waf-2.0.25 ${S}/waf
> -}
> -do_unpack[postfuncs] += "link_waf"
> -
> -FILES:${PN} += " \
> -    ${datadir}/icons \
> -    ${datadir}/zsh \
> -    ${datadir}/bash-completion \
> -    ${datadir}/metainfo \
> -    "
> -EXCLUDE_FROM_WORLD = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>("LICENSE_FLAGS_ACCEPTED", "commercial", 
> "0", "1", d)}"
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.37.0.bb 
> b/meta-oe/recipes-multimedia/mplayer/mpv_0.37.0.bb
> new file mode 100644
> index 000000000..e7026bd4e
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.37.0.bb
> @@ -0,0 +1,97 @@
> +SUMMARY = "Open Source multimedia player"
> +DESCRIPTION = "mpv is a fork of mplayer2 and MPlayer. It shares some 
> features with the former projects while introducing many more."
> +SECTION = "multimedia"
> +HOMEPAGE = "<http://www.mpv.io/>"
> +
> +DEPENDS = " \
> +    alsa-lib \
> +    ffmpeg \
> +    libdrm \
> +    libass \
> +    libplacebo \
> +"
> +
> +LICENSE = "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM = 
> "file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263" 
> <file://license.gpl;md5=b234ee4d69f5fce4486a80fdaf4a4263/>
> +
> +SRCREV = "818ce7c51a6b9179307950e919983e0909942098"
> +SRC_URI = 
> "git://github.com/mpv-player/mpv;name=mpv;branch=release/0.37;protocol=https"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit meson pkgconfig mime-xdg
> +
> +LDFLAGS:append:riscv64 = " -latomic"
> +
> +LUA ?= "lua"
> +LUA:mips64  = ""
> +LUA:powerpc64  = ""
> +LUA:powerpc64le  = ""
> +LUA:riscv64  = ""
> +LUA:riscv32  = ""
> +LUA:powerpc  = ""
> +
> +# Note: lua is required to get on-screen-display (controls)
> +PACKAGECONFIG ??= " \
> +    ${LUA} \
> +    drm \
> +    vaapi \
> +    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'opengl', 'egl', '', 
> d)} \
> +    ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'x11 wayland opengl 
> pipewire pulseaudio vulkan', d)} \
> +    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'wayland x11', 
> 'gbm', '', d)} \
> +"
> +
> +PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 
> xsp libxv libxscrnsaver libxinerama libxpresent libxext"
> +PACKAGECONFIG[xv] = "-Dxv=enabled,-Dxv=disabled,libxv"
> +PACKAGECONFIG[opengl] = "-Dgl=enabled,-Dgl=disabled,virtual/libgl"
> +PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
> +PACKAGECONFIG[drm] = "-Ddrm=enabled,-Ddrm=disabled,libdrm"
> +PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled,virtual/libgbm"
> +PACKAGECONFIG[lua] = "-Dlua=enabled,-Dlua=disabled,luajit"
> +PACKAGECONFIG[libarchive] = 
> "-Dlibarchive=enabled,-Dlibarchive=disabled,libarchive"
> +PACKAGECONFIG[jack] = "-Djack=enabled, -Djack=disabled, jack"
> +PACKAGECONFIG[vaapi] = "-Dvaapi=enabled,-Dvaapi=disabled,libva"
> +PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,shaderc "
> +PACKAGECONFIG[vdpau] = "-Dvdpau=enabled,-Dvdpau=disabled,libvdpau"
> +PACKAGECONFIG[wayland] = 
> "-Dwayland=enabled,-Dwayland=disabled,wayland wayland-native 
> libxkbcommon"
> +PACKAGECONFIG[pipewire] = 
> "-Dpipewire=enabled,-Dpipewire=disabled,pipewire"
> +PACKAGECONFIG[pulseaudio] = 
> "-Dpulse=enabled,-Dpulse=disabled,pulseaudio"
> +
> +python __anonymous() {
> +    packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
> +    extras = []
> +    if "x11" in packageconfig and "opengl" in packageconfig:
> +        extras.append(" -Dgl-x11=enabled")
> +    if "x11" in packageconfig and "egl" in packageconfig:
> +        extras.append(" -Degl-x11=enabled")
> +    if "egl" in packageconfig and "drm" in packageconfig:
> +        extras.append(" -Degl-drm=enabled")
> +    if "vaapi" in packageconfig and "x11" in packageconfig:
> +        extras.append(" -Dvaapi-x11=enabled")
> +    if "vaapi" in packageconfig and "drm" in packageconfig:
> +        extras.append(" -Dvaapi-drm=enabled")
> +    if "vdpau" in packageconfig and "opengl" in packageconfig and 
> "x11" in packageconfig:
> +        extras.append(" -Dvdpau-gl-x11=enabled")
> +    if "wayland" in packageconfig and "opengl" in packageconfig:
> +        extras.append(" -Dgl-wayland=enabled")
> +    if "wayland" in packageconfig and "vaapi" in packageconfig:
> +        extras.append(" -Dvaapi-wayland=enabled")
> +}
> +
> +SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', 
> '')}"
> +
> +EXTRA_OEMESON = " \
> +    -Dmanpage-build=disabled \
> +    -Dlibbluray=disabled \
> +    -Dlibmpv=true \
> +    -Ddvdnav=disabled \
> +    -Dcdda=disabled \
> +    -Duchardet=disabled \
> +    -Drubberband=disabled \
> +    -Dlcms2=disabled \
> +    -Dvapoursynth=disabled \
> +    ${PACKAGECONFIG_CONFARGS} \
> +"
> +
> +FILES:${PN} += "${datadir}"
> +EXCLUDE_FROM_WORLD = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>("LICENSE_FLAGS_ACCEPTED", "commercial", 
> "0", "1", d)}"
> --
> 2.43.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108054): 
> <https://lists.openembedded.org/g/openembedded-devel/message/108054>
> Mute This Topic: <https://lists.openembedded.org/mt/103549240/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-Ml8Omm2K9l4PHKyWFRK4
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 fixes branch</div></div><div id="geary-quote" dir="auto"><br>On Fri, Jan 5 2024 at 08:21:05 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- switch buildsystem from waf to meson
- add libplacebo dependency
- add vulkan support
- build libmpv (needed eg. for mpvpaper)

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-multimedia/mplayer/mpv_0.35.1.bb  | 116 ------------------
 .../recipes-multimedia/mplayer/mpv_0.37.0.bb  |  97 +++++++++++++++
 2 files changed, 97 insertions(+), 116 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.37.0.bb

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
deleted file mode 100644
index 0f50a6e8f..000000000
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
+++ /dev/null
@@ -1,116 +0,0 @@
-SUMMARY = "Open Source multimedia player"
-DESCRIPTION = "mpv is a fork of mplayer2 and MPlayer. It shares some features with the former projects while introducing many more."
-SECTION = "multimedia"
-HOMEPAGE = "<a href="http://www.mpv.io/">http://www.mpv.io/</a>"
-
-DEPENDS = " \
-    zlib \
-    ffmpeg \
-    jpeg \
-    libv4l \
-    libass \
-"
-
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "<a href="file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263" "="">file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"</a>
-
-SRCREV_mpv = "140ec21c89d671d392877a7f3b91d67e7d7b9239"
-SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/0.35;protocol=https \
-           <a href="https://waf.io/waf-2.0.25;name=waf;subdir=git">https://waf.io/waf-2.0.25;name=waf;subdir=git</a> \
-           "
-SRC_URI[waf.sha256sum] = "21199cd220ccf60434133e1fd2ab8c8e5217c3799199c82722543970dc8e38d5"
-
-S = "${WORKDIR}/git"
-
-inherit waf pkgconfig mime-xdg
-
-LDFLAGS:append:riscv64 = " -latomic"
-
-LUA ?= "lua"
-LUA:mips64  = ""
-LUA:powerpc64  = ""
-LUA:powerpc64le  = ""
-LUA:riscv64  = ""
-LUA:riscv32  = ""
-LUA:powerpc  = ""
-
-# Note: lua is required to get on-screen-display (controls)
-PACKAGECONFIG ??= " \
-    ${LUA} \
-    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'wayland', 'wayland egl', '', d)} \
-    <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'x11', d)} \
-    <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'opengl', d)} \
-"
-
-PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 xsp libxv libxscrnsaver libxinerama libxpresent libxext"
-PACKAGECONFIG[xv] = "--enable-xv,--disable-xv,libxv"
-PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
-PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
-PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
-PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/libgbm"
-PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua luajit"
-PACKAGECONFIG[libarchive] = "--enable-libarchive,--disable-libarchive,libarchive"
-PACKAGECONFIG[jack] = "--enable-jack, --disable-jack, jack"
-PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
-PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
-PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland wayland-native libxkbcommon"
-
-python __anonymous() {
-    packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
-    extras = []
-    if "x11" in packageconfig and "opengl" in packageconfig:
-        extras.append(" --enable-gl-x11")
-    if "x11" in packageconfig and "egl" in packageconfig:
-        extras.append(" --enable-egl-x11")
-    if "egl" in packageconfig and "drm" in packageconfig:
-        extras.append(" --enable-egl-drm")
-    if "vaapi" in packageconfig and "x11" in packageconfig:
-        extras.append(" --enable-vaapi-x11")
-    if "vaapi" in packageconfig and "drm" in packageconfig:
-        extras.append(" --enable-vaapi-drm")
-    if "vaapi" in packageconfig and "x11" in packageconfig and "egl" in packageconfig:
-        extras.append(" --enable-vaapi-x-egl")
-    if "vdpau" in packageconfig and "opengl" in packageconfig and "x11" in packageconfig:
-        extras.append(" --enable-vdpau-gl-x11")
-    if "wayland" in packageconfig and "opengl" in packageconfig:
-        extras.append(" --enable-gl-wayland")
-    if "wayland" in packageconfig and "vaapi" in packageconfig:
-        extras.append(" --enable-vaapi-wayland")
-    if extras:
-        d.appendVar("EXTRA_OECONF", "".join(extras))
-}
-
-SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', '')}"
-
-EXTRA_OECONF = " \
-    --prefix=${prefix} \
-    --target=${SIMPLE_TARGET_SYS} \
-    --confdir=${sysconfdir} \
-    --datadir=${datadir} \
-    --disable-manpage-build \
-    --disable-libbluray \
-    --disable-dvdnav \
-    --disable-cdda \
-    --disable-uchardet \
-    --disable-rubberband \
-    --disable-lcms2 \
-    --disable-vapoursynth \
-    ${PACKAGECONFIG_CONFARGS} \
-"
-
-do_configure:append() {
-    sed -i -e 's#${WORKDIR}#&lt;WORKDIR&gt;#g' ${B}/config.h
-}
-
-link_waf() {
-    ln -s waf-2.0.25 ${S}/waf
-}
-do_unpack[postfuncs] += "link_waf"
-
-FILES:${PN} += " \
-    ${datadir}/icons \
-    ${datadir}/zsh \
-    ${datadir}/bash-completion \
-    ${datadir}/metainfo \
-    "
-EXCLUDE_FROM_WORLD = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.37.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.37.0.bb
new file mode 100644
index 000000000..e7026bd4e
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.37.0.bb
@@ -0,0 +1,97 @@
+SUMMARY = "Open Source multimedia player"
+DESCRIPTION = "mpv is a fork of mplayer2 and MPlayer. It shares some features with the former projects while introducing many more."
+SECTION = "multimedia"
+HOMEPAGE = "<a href="http://www.mpv.io/">http://www.mpv.io/</a>"
+
+DEPENDS = " \
+    alsa-lib \
+    ffmpeg \
+    libdrm \
+    libass \
+    libplacebo \
+"
+
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "<a href="file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263" "="">file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"</a>
+
+SRCREV = "818ce7c51a6b9179307950e919983e0909942098"
+SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/0.37;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig mime-xdg
+
+LDFLAGS:append:riscv64 = " -latomic"
+
+LUA ?= "lua"
+LUA:mips64  = ""
+LUA:powerpc64  = ""
+LUA:powerpc64le  = ""
+LUA:riscv64  = ""
+LUA:riscv32  = ""
+LUA:powerpc  = ""
+
+# Note: lua is required to get on-screen-display (controls)
+PACKAGECONFIG ??= " \
+    ${LUA} \
+    drm \
+    vaapi \
+    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'opengl', 'egl', '', d)} \
+    <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'x11 wayland opengl pipewire pulseaudio vulkan', d)} \
+    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'wayland x11', 'gbm', '', d)} \
+"
+
+PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 xsp libxv libxscrnsaver libxinerama libxpresent libxext"
+PACKAGECONFIG[xv] = "-Dxv=enabled,-Dxv=disabled,libxv"
+PACKAGECONFIG[opengl] = "-Dgl=enabled,-Dgl=disabled,virtual/libgl"
+PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
+PACKAGECONFIG[drm] = "-Ddrm=enabled,-Ddrm=disabled,libdrm"
+PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled,virtual/libgbm"
+PACKAGECONFIG[lua] = "-Dlua=enabled,-Dlua=disabled,luajit"
+PACKAGECONFIG[libarchive] = "-Dlibarchive=enabled,-Dlibarchive=disabled,libarchive"
+PACKAGECONFIG[jack] = "-Djack=enabled, -Djack=disabled, jack"
+PACKAGECONFIG[vaapi] = "-Dvaapi=enabled,-Dvaapi=disabled,libva"
+PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,shaderc "
+PACKAGECONFIG[vdpau] = "-Dvdpau=enabled,-Dvdpau=disabled,libvdpau"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,wayland wayland-native libxkbcommon"
+PACKAGECONFIG[pipewire] = "-Dpipewire=enabled,-Dpipewire=disabled,pipewire"
+PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-Dpulse=disabled,pulseaudio"
+
+python __anonymous() {
+    packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
+    extras = []
+    if "x11" in packageconfig and "opengl" in packageconfig:
+        extras.append(" -Dgl-x11=enabled")
+    if "x11" in packageconfig and "egl" in packageconfig:
+        extras.append(" -Degl-x11=enabled")
+    if "egl" in packageconfig and "drm" in packageconfig:
+        extras.append(" -Degl-drm=enabled")
+    if "vaapi" in packageconfig and "x11" in packageconfig:
+        extras.append(" -Dvaapi-x11=enabled")
+    if "vaapi" in packageconfig and "drm" in packageconfig:
+        extras.append(" -Dvaapi-drm=enabled")
+    if "vdpau" in packageconfig and "opengl" in packageconfig and "x11" in packageconfig:
+        extras.append(" -Dvdpau-gl-x11=enabled")
+    if "wayland" in packageconfig and "opengl" in packageconfig:
+        extras.append(" -Dgl-wayland=enabled")
+    if "wayland" in packageconfig and "vaapi" in packageconfig:
+        extras.append(" -Dvaapi-wayland=enabled")
+}
+
+SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', '')}"
+
+EXTRA_OEMESON = " \
+    -Dmanpage-build=disabled \
+    -Dlibbluray=disabled \
+    -Dlibmpv=true \
+    -Ddvdnav=disabled \
+    -Dcdda=disabled \
+    -Duchardet=disabled \
+    -Drubberband=disabled \
+    -Dlcms2=disabled \
+    -Dvapoursynth=disabled \
+    ${PACKAGECONFIG_CONFARGS} \
+"
+
+FILES:${PN} += "${datadir}"
+EXCLUDE_FROM_WORLD = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"
<div>-- 
</div>2.43.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#108054): <a href="https://lists.openembedded.org/g/openembedded-devel/message/108054">https://lists.openembedded.org/g/openembedded-devel/message/108054</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/103549240/3618223">https://lists.openembedded.org/mt/103549240/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-Ml8Omm2K9l4PHKyWFRK4--


