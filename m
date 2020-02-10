Return-Path: <twoerner@gmail.com>
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5E24060926
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 17:18:34 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id e10so1203226edv.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 09:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Kylc7aVfrGm65cXO8za4BPDxHqUZ5T8QHkWA8vCEo3s=;
	b=BNEOfkGZa9cZOd9Z+9W5cIxR/iaqbcBcjKhkph5K1qOZeCGdxfM0ApUc8XB3z8ROLQ
	Xgkhno1jn1E4bHdCLj1CPWBS7/HKBMyALy3EU3UoBH3zDmh+6KwZUx2zehReDHowA63U
	Pd3SyApKULKd5Bu1stXerSIRXuVzmZ9F68qVW3/4pNg6Xq5uDZriNqsHvzovfI1huS/R
	FzVRq39grd/ittxMso5p62xtE+Wx/cwSFofti/EAfoG1gYKpc4WfbDj4WzwUNEoO7xxH
	kM0raEKNk69qZbxFFFPK/nynAXGQXQfcFCqzlFKnb/6qHSw1LCTpRpTEazpWXKmFQoQQ
	pa8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Kylc7aVfrGm65cXO8za4BPDxHqUZ5T8QHkWA8vCEo3s=;
	b=eyWWo+aWnFqVym/X6KFOkyroBYCidiaEBYGKA7EQUPVh/GANvzelU1cvw+IoNsGKWC
	GQJ8XoF0OWqLj0ezDz677WmFYwodyZB2p4rhcaNuwGZfqOeMtqAn7RZ4f/v1/GlizTtj
	9T2DalI8H8/SSH8otloFrQ1A/89GNguxy7/2oLy+zvflB6FZJGJX461NBQyZdaVpDfEv
	Vb1zgH5FAQUd0wkbXEuZalFSKUxUsY3wn+5DINgaNHAIUWgHsHaBQhte+V+XuMOGfyxH
	SD5+zb3VPoB10za1tWyUSgibgAEVR9pd0r0GMAsas8NKjtTLt/GwM7ddqV6UKq+77nZ6
	t37A==
X-Gm-Message-State: APjAAAVJfTP4jRUZFjuaspBOsFAWMOBVWVImuUPpdXNcWVLCQCFmednq
	laG72cnZl9gfzzlaD4YWSOjsYDBuIZnbOFKvfuwNJlph
X-Google-Smtp-Source: APXvYqxefPazW/KZJwjFwuJBh/sM78OWL80yinVCf4apkWS7NI9Vb+NLxgumbOpTi8/YkKpJ758n9HnDaOtOnE2I+Tk=
X-Received: by 2002:a17:906:195a:: with SMTP id
	b26mr2248731eje.86.1581355114876; 
	Mon, 10 Feb 2020 09:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20200208192433.20869-1-twoerner@gmail.com>
	<CAMKF1spifhn9J3nijHUH+pNgXP79N1TL8S-qAJDo-QC50D6+Ww@mail.gmail.com>
In-Reply-To: <CAMKF1spifhn9J3nijHUH+pNgXP79N1TL8S-qAJDo-QC50D6+Ww@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 10 Feb 2020 12:18:20 -0500
Message-ID: <CAHUNapRQrLOVFkUMRU9C5X1ThhgcbdENJJgmyhSuDDrnPhbr+g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] mpv: 0.26.0 -> 0.32.0
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
X-List-Received-Date: Mon, 10 Feb 2020 17:18:34 -0000
Content-Type: text/plain; charset="UTF-8"

Okay, I'll take a look.
Thanks!

On Mon, Feb 10, 2020 at 10:40 AM Khem Raj <raj.khem@gmail.com> wrote:

> Trevor
>
> Its failing for one of builds with musl/arm
> http://errors.yoctoproject.org/Errors/Details/390554/
>
> On Sat, Feb 8, 2020 at 11:24 AM Trevor Woerner <twoerner@gmail.com> wrote:
> >
> > Remove mpv from the PNBLACKLIST by updating to the latest release and
> using a
> > newer, python3-aware waf for building (copied from glmark2).
> >
> > The name of the license file changed, but the licence of the software
> itself
> > did not.
> >
> > Added mime-xdg to inherit to handle mime artifacts.
> >
> > Added to the FILES command to scoop up additional files being generated
> by
> > the build.
> >
> > Re-added 'mpv' back to LICENSE_FLAGS_WHITELIST search list in
> > packagegroup-meta-oe.
> >
> > Extensively fixed and cleaned up the PACKAGECONFIG options to reflect the
> > current options available when configuring mpv. Also cleaned up any
> configure
> > options which are no longer available.
> >
> > Added the correct dependencies so mpv builds under wayland.
> >
> > Tested with core-image-x11 on a rock-pi-4 with
> >         PACKAGECONFIG = "libass x11 opengl egl drm gbm vaapi vdpau"
> >         # mpv --vo=help
> >         Available video outputs:
> >           libmpv           render API for libmpv
> >           gpu              Shader-based GPU Renderer
> >           vdpau            VDPAU with X11
> >           vaapi            VA API with X11
> >           x11              X11 (slow, old crap)
> >           null             Null video output
> >           image            Write video frames to image files
> >           tct              true-color terminals
> >           drm              Direct Rendering Manager
> >
> > Tested with core-image-weston on a rock-pi-4 with:
> >         PACKAGECONFIG = "libass wayland x11 opengl"
> >         # mpv -vo=help
> >         Available video outputs:
> >           libmpv           render API for libmpv
> >           gpu              Shader-based GPU Renderer
> >           wlshm            Wayland SHM video output
> >           x11              X11 (slow, old crap)
> >           null             Null video output
> >           image            Write video frames to image files
> >           tct              true-color terminals
> >
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >
> > changes in v2:
> >
> > - Martin Jansa pointed out that this patch should also re-add mpv to the
> >   LICENSE_FLAGS_WHITELIST list in packagegroup-meta-oe
> >
> https://git.openembedded.org/meta-openembedded/commit/?id=0c182e58775966699c303c1e2561c273197bf445
> >
> > - Khem Raj pointed out that this recipe fails to build with wayland
> >   https://errors.yoctoproject.org/Errors/Details/390294/
> > ---
> >  .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
> >  .../mplayer/mpv/python3.patch                 | 12 ++++
> >  .../mplayer/{mpv_0.26.0.bb => mpv_0.32.0.bb}  | 60 ++++++++++++++-----
> >  3 files changed, 58 insertions(+), 16 deletions(-)
> >  create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/python3.patch
> >  rename meta-oe/recipes-multimedia/mplayer/{mpv_0.26.0.bb =>
> mpv_0.32.0.bb} (46%)
> >
> > diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > index d5789a758..865cbb0bf 100644
> > --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > @@ -207,7 +207,7 @@ RDEPENDS_packagegroup-meta-oe-multimedia ="\
> >      sound-theme-freedesktop v4l-utils yavta wavpack libvpx \
> >      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xpext pavucontrol
> xsp", "", d)} \
> >      libmikmod \
> > -    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial",
> "libmad faad2", "", d)} \
> > +    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial",
> "libmad faad2 mpv", "", d)} \
> >      "
> >  RDEPENDS_packagegroup-meta-oe-multimedia_remove_libc-musl = "alsa-oss"
> >
> > diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/python3.patch
> b/meta-oe/recipes-multimedia/mplayer/mpv/python3.patch
> > new file mode 100644
> > index 000000000..df208cf87
> > --- /dev/null
> > +++ b/meta-oe/recipes-multimedia/mplayer/mpv/python3.patch
> > @@ -0,0 +1,12 @@
> > +Use Python 3 instead of Python 2.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Ross Burton <ross.burton@intel.com>
> > +
> > +diff --git a/waf b/waf
> > +index 6ce2a24..de3c898 100755
> > +--- a/waf
> > ++++ b/waf
> > +@@ -1 +1 @@
> > +-#!/usr/bin/env python
> > ++#!/usr/bin/env python3
> > diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
> b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
> > similarity index 46%
> > rename from meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
> > rename to meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
> > index c98aa7ab0..bd2e389fe 100644
> > --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
> > +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
> > @@ -9,22 +9,23 @@ DEPENDS = "zlib ffmpeg jpeg virtual/libx11 xsp libxv \
> >  REQUIRED_DISTRO_FEATURES = "x11"
> >
> >  LICENSE = "GPLv2+"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=91f1cb870c1cc2d31351a4d2595441cb"
> > +LIC_FILES_CHKSUM =
> "file://LICENSE.GPL;md5=91f1cb870c1cc2d31351a4d2595441cb"
> >
> >  # While this item does not require it, it depends on ffmpeg which does
> >  LICENSE_FLAGS = "commercial"
> >
> > -SRCREV_mpv = "4db82f04502cbcd20d9a975df9dfde91d8c389e3"
> > +SRCREV_mpv = "70b991749df389bcc0a4e145b5687233a03b4ed7"
> >  SRC_URI = " \
> >      git://github.com/mpv-player/mpv;name=mpv \
> > -
> http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=waf;downloadfilename=waf;subdir=git
> \
> > +
> https://www.freehackers.org/~tnagy/release/waf-2.0.19;name=waf;downloadfilename=waf;subdir=git
> \
> > +    file://python3.patch \
> >  "
> >  SRC_URI[waf.md5sum] = "cef4ee82206b1843db082d0b0506bf71"
> >  SRC_URI[waf.sha256sum] =
> "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b"
> >
> >  S = "${WORKDIR}/git"
> >
> > -inherit waf pkgconfig python3native features_check
> > +inherit waf pkgconfig features_check mime-xdg
> >
> >  LUA ?= "lua"
> >  LUA_mips64  = ""
> > @@ -38,18 +39,49 @@ PACKAGECONFIG ??= " \
> >      ${LUA} \
> >      libass \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
> > +    ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
> > +    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
> >  "
> >
> >  PACKAGECONFIG_remove_aarch64 = "lua"
> > +PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11"
> > +PACKAGECONFIG[xv] = "--enable-xv,--disable-xv,libxv"
> > +PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
> > +PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,"
> >  PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
> > -PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/mesa"
> > +PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/libgbm"
> >  PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua luajit"
> >  PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
> >  PACKAGECONFIG[libarchive] =
> "--enable-libarchive,--disable-libarchive,libarchive"
> >  PACKAGECONFIG[jack] = "--enable-jack, --disable-jack, jack"
> > -PACKAGECONFIG[vaapi] = "--enable-vaapi, --disable-vaapi,libva"
> > -PACKAGECONFIG[vdpau] = "--enable-vdpau, --disable-vdpau,libvdpau"
> > -PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland,wayland
> libxkbcommon"
> > +PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
> > +PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
> > +PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland
> wayland-native libxkbcommon"
> > +
> > +python __anonymous() {
> > +    packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
> > +    extras = []
> > +    if "x11" in packageconfig and "opengl" in packageconfig:
> > +        extras.append(" --enable-gl-x11")
> > +    if "x11" in packageconfig and "egl" in packageconfig:
> > +        extras.append(" --enable-egl-x11")
> > +    if "egl" in packageconfig and "drm" in packageconfig:
> > +        extras.append(" --enable-egl-drm")
> > +    if "vaapi" in packageconfig and "x11" in packageconfig:
> > +        extras.append(" --enable-vaapi-x11")
> > +    if "vaapi" in packageconfig and "drm" in packageconfig:
> > +        extras.append(" --enable-vaapi-drm")
> > +    if "vaapi" in packageconfig and "x11" in packageconfig and "egl" in
> packageconfig:
> > +        extras.append(" --enable-vaapi-x-egl")
> > +    if "vdpau" in packageconfig and "opengl" in packageconfig and "x11"
> in packageconfig:
> > +        extras.append(" --enable-vdpau-gl-x11")
> > +    if "wayland" in packageconfig and "opengl" in packageconfig:
> > +        extras.append(" --enable-gl-wayland")
> > +    if "wayland" in packageconfig and "vaapi" in packageconfig:
> > +        extras.append(" --enable-vaapi-wayland")
> > +    if extras:
> > +        d.appendVar("EXTRA_OECONF", "".join(extras))
> > +}
> >
> >  SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}',
> '')}"
> >
> > @@ -59,18 +91,14 @@ EXTRA_OECONF = " \
> >      --confdir=${sysconfdir} \
> >      --datadir=${datadir} \
> >      --disable-manpage-build \
> > -    --disable-gl \
> >      --disable-libsmbclient \
> > -    --disable-encoding \
> >      --disable-libbluray \
> > -    --disable-dvdread \
> >      --disable-dvdnav \
> >      --disable-cdda \
> >      --disable-uchardet \
> >      --disable-rubberband \
> >      --disable-lcms2 \
> >      --disable-vapoursynth \
> > -    --disable-vapoursynth-lazy \
> >      ${PACKAGECONFIG_CONFARGS} \
> >  "
> >
> > @@ -80,6 +108,8 @@ adjust_waf_perms() {
> >
> >  do_patch[postfuncs] += "adjust_waf_perms"
> >
> > -FILES_${PN} += "${datadir}/icons"
> > -
> > -PNBLACKLIST[mpv] = "Needs forward porting to use python3"
> > +FILES_${PN} += " \
> > +    ${datadir}/icons \
> > +    ${datadir}/zsh \
> > +    ${datadir}/bash-completion \
> > +    "
> > --
> > 2.25.0.114.g5b0ca878e0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

