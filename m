Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E6AC54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:01:26 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.1153.1710349286004656149
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vs83OWeN;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5a17a739935so3999237eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 10:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710349285; x=1710954085; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6NYUcj+0QP1qjMyTDLM43COM/UK4iJ+U9ivV3laZZc=;
        b=Vs83OWeNHU9gpbgLNk08u3+YXcYdexKXUj8yTGCLjRnP8mpNK3WDHjC3si2vxAwhew
         DInsoQgHO2mJE9lnpwgEdmciii19kM4bWBPK4tScqJjrC0cPrr1VaD3hDbMe6Vp+jU0Y
         Gu5rpRzaKkh7KT271hBJsteU6xAndAnNHEkIsfNaB/VP5UEqduql2YoTw6W7AE/Kn0FT
         hqbgtEILEYT8DyW1EX7zy8OkcV9W8mc8sjnH59tmGd1hhFl+3dzIQld8u9nMI632FIV+
         b8tVpimfIYMHUXQNlVWX1SBLHt5ix5cWf5MbBQ/teLb6r7SlScQPjI1XSnbZDLesXkCt
         SV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710349285; x=1710954085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6NYUcj+0QP1qjMyTDLM43COM/UK4iJ+U9ivV3laZZc=;
        b=AMxVZcPzNoTyKmhjX+GHzOE6F/YMG36YAqVZqypbO2U/ryv5L6Sy/oZmv2oA39KAEa
         xgfpVvAzAUBHSD2xH8eJhK12nwGfaD6K7UDYJa/pxxtNsgyvZJ/FTcSZ+85wrKyomhL/
         9U8lVVo1NNx+bFVFzVxV24AJqbKz2XETOGvrvky6dmWR9GyP032Az51guzCiRsEFU8Yt
         QDsxtEr2fP1gbv5EmiQ9YOxrVFV2OM7xXGXMDmos9e1vJ2f8GtNmIKGcuMPJt2EKhsLw
         H8UCcpknLK5hLzRZJGX5S688nLdnRzbCJdP3jP9O1L1G0E9h1kjhvoM2kZKx3bKLffCS
         z/ng==
X-Gm-Message-State: AOJu0YxcejDojvt+dNVr8AILS+6ZGhqsHp8ZT0/l8Zh/53QKPWqmgcU0
	N8LcZvOA3HanyYe/uPXa4YwtF40k/x8l2t8EdjSikri62GntmGoqBr18EzCA/o3X3sGSfQRH55d
	s4q0JpfJvgua+WhFjs64q4NwtlLM=
X-Google-Smtp-Source: AGHT+IHF5ZVMGBzAGKNgXI2+zFYu8ZxJxGDaMMAYM+zsbNKHhOFxYO3g+vu5cP8iHvPeaTUi0iI6RRtTHYEWdO0n3qk=
X-Received: by 2002:a05:6871:8797:b0:21e:6d41:3a86 with SMTP id
 td23-20020a056871879700b0021e6d413a86mr5666726oab.59.1710349284922; Wed, 13
 Mar 2024 10:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240313045038.90500-1-marex@denx.de> <20240313045038.90500-3-marex@denx.de>
In-Reply-To: <20240313045038.90500-3-marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Mar 2024 10:00:58 -0700
Message-ID: <CAMKF1soot4YOaXGQeQJ5xnbwN-TApuALfFyDBLGQ6C=axZAfPA@mail.gmail.com>
Subject: Re: [PATCH 2/8] lvgl: Upgrade to LVGL 9 series
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel@lists.openembedded.org, 
	Fabio Estevam <festevam@denx.de>, Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 17:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109293

Thanks, seeing this QA issue

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3707/step=
s/14/logs/errors

On Tue, Mar 12, 2024 at 9:51=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> Upgrade LVGL and matching recipes to LVGL 9 series. Use latest git HEAD
> instead of 9.0.0 release to pull in fixes which landed after the 9.0.0
> release and which are of interest to Linux deployments.
>
> There are significant breaking changes, which are listed below.
>
> The lv-drivers and lv-lib-png PNG library seem to be part of the main LVG=
L
> repository, drop the now unnecessary recipes.
>
> Configuration is now done in lv_conf.h only, there is no more lv_drv_conf=
.h,
> rework lv-drivers.inc accordingly. USE_SDL_GPU support has been renamed t=
o
> LV_USE_DRAW_SDL and newly depends on libsdl2-image, SDL_DOUBLE_BUFFERED t=
o
> LV_SDL_BUF_COUNT=3D2 .
>
> All configuration options from lvgl_%.bb, LV_COLOR_DEPTH, LV_MEM_CUSTOM a=
s
> well as LV_TICK_CUSTOM, LV_TICK_CUSTOM_INCLUDE, LV_TICK_CUSTOM_SYS_TIME_E=
X
> are all moved into lv-drivers.inc , so the configuration is done in one
> place, using the same set of configuration options.
>
> Wayland support is gone, drop it from lv-drivers.inc. Evdev input device
> selection via EVDEV_NAME is also gone, the selection is now done using
> API call lv_evdev_create(). DRM card selection via DRM_CARD is also gone,
> the selection is now done using API call lv_linux_drm_set_file(). Move
> LVGL_CONFIG_DRM_CARD into lvgl-demo-fb, which calls lv_linux_drm_set_file=
().
>
> The lvgl-demo-fb recipe is adjusted to be compatible with LVGL 9 again,
> this makes some of the sed adjustments really awful, so this part will
> be replaced by upstream patches in a separate commit to avoid growing
> this commit even more.
>
> The lvgl-demo-fb recipe is also no longer using git submodules, but
> instead fetches both its source and LVGL using git fetcher separately.
> This is needed to build the SDL backend successfully, which requires
> newer LVGL than what the repository points to via its submodule.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Fabio Estevam <festevam@denx.de>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta-oe/recipes-graphics/lvgl/lv-drivers.inc  | 40 +++++++--------
>  .../recipes-graphics/lvgl/lv-drivers_8.3.0.bb | 28 -----------
>  .../recipes-graphics/lvgl/lv-lib-png_8.0.2.bb | 31 ------------
>  .../lvgl/lvgl-demo-fb_8.3.0.bb                | 46 -----------------
>  .../lvgl/lvgl-demo-fb_9.0.0.bb                | 49 +++++++++++++++++++
>  meta-oe/recipes-graphics/lvgl/lvgl_8.3.11.bb  | 44 -----------------
>  meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb   | 28 +++++++++++
>  7 files changed, 95 insertions(+), 171 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb
>  delete mode 100644 meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
>  delete mode 100644 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
>  create mode 100644 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
>  delete mode 100644 meta-oe/recipes-graphics/lvgl/lvgl_8.3.11.bb
>  create mode 100644 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
>
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers.inc b/meta-oe/recip=
es-graphics/lvgl/lv-drivers.inc
> index 6cfb7fa07..97063adbc 100644
> --- a/meta-oe/recipes-graphics/lvgl/lv-drivers.inc
> +++ b/meta-oe/recipes-graphics/lvgl/lv-drivers.inc
> @@ -1,21 +1,17 @@
>  PACKAGECONFIG[drm] =3D ",,libdrm"
>  PACKAGECONFIG[fbdev] =3D ",,"
> -PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2"
> -PACKAGECONFIG[wayland] =3D ",,libxkbcommon wayland"
> +PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2 libsdl2-image"
>
>  LVGL_CONFIG_USE_DRM =3D "${@bb.utils.contains('PACKAGECONFIG', 'drm', '1=
', '0', d)}"
> -LVGL_CONFIG_DRM_CARD ?=3D "/dev/dri/card0"
>
>  LVGL_CONFIG_USE_EVDEV =3D "${@bb.utils.contains_any('PACKAGECONFIG', 'dr=
m fbdev', '1', '0', d)}"
> -LVGL_CONFIG_EVDEV_INPUT ?=3D "/dev/input/touchscreen"
>
>  LVGL_CONFIG_USE_FBDEV =3D "${@bb.utils.contains('PACKAGECONFIG', 'fbdev'=
, '1', '0', d)}"
>
>  LVGL_CONFIG_USE_SDL =3D "${@bb.utils.contains('PACKAGECONFIG', 'sdl', '1=
', '0', d)}"
>
> -LVGL_CONFIG_USE_WAYLAND =3D "${@bb.utils.contains('PACKAGECONFIG', 'wayl=
and', '1', '0', d)}"
> -LVGL_CONFIG_WAYLAND_HOR_RES ?=3D "480"
> -LVGL_CONFIG_WAYLAND_VER_RES ?=3D "320"
> +LVGL_CONFIG_LV_MEM_CUSTOM ?=3D "0"
> +LVGL_CONFIG_LV_COLOR_DEPTH ?=3D "32"
>
>  ALLOW_EMPTY:${PN} =3D "1"
>
> @@ -23,26 +19,26 @@ EXTRA_OECMAKE +=3D "-Dinstall:BOOL=3DON -DLIB_INSTALL=
_DIR=3D${baselib}"
>
>  do_configure:append() {
>      # If there is a configuration template, start from that
> -    [ -r "${S}/lv_drv_conf_template.h" ] && cp -Lv "${S}/lv_drv_conf_tem=
plate.h" "${S}/lv_drv_conf.h"
> +    [ -r "${S}/lv_conf_template.h" ] && cp -Lv "${S}/lv_conf_template.h"=
 "${S}/lv_conf.h"
>
> -    # Configure the software using sed
>      sed -e "s|#if 0 .*Set it to \"1\" to enable the content.*|#if 1 // E=
nabled by ${PN}|g" \
>          \
> -        -e "s|\(^#  define USE_DRM \).*|#  define USE_DRM ${LVGL_CONFIG_=
USE_DRM}|g" \
> -        -e "s|\(^#  define DRM_CARD \).*|#  define DRM_CARD \"${LVGL_CON=
FIG_DRM_CARD}\"|g" \
> -       \
> -        -e "s|\(^#  define USE_EVDEV \).*|#  define USE_EVDEV ${LVGL_CON=
FIG_USE_EVDEV}|g" \
> -        -e "s|\(^#  define EVDEV_NAME \).*|#  define EVDEV_NAME \"${LVGL=
_CONFIG_EVDEV_INPUT}\"|g" \
> +        -e "s|\(^#define LV_USE_LINUX_DRM \).*|#define LV_USE_LINUX_DRM =
${LVGL_CONFIG_USE_DRM}|g" \
>          \
> -        -e "s|\(^#  define USE_FBDEV \).*|#  define USE_FBDEV ${LVGL_CON=
FIG_USE_FBDEV}|g" \
> +        -e "s|\(^#define LV_USE_LINUX_FBDEV \).*|#define LV_USE_LINUX_FB=
DEV ${LVGL_CONFIG_USE_FBDEV}|g" \
>          \
> -        -e "s|\(^# define USE_SDL \).*|#  define USE_SDL ${LVGL_CONFIG_U=
SE_SDL}|g" \
> -        -e "s|\(^#  define USE_SDL_GPU \).*|#  define USE_SDL_GPU 1|g" \
> -        -e "s|\(^#  define SDL_DOUBLE_BUFFERED \).*|#  define SDL_DOUBLE=
_BUFFERED 1|g" \
> +        -e "s|\(^#define LV_USE_SDL \).*|#define LV_USE_SDL ${LVGL_CONFI=
G_USE_SDL}|g" \
> +        -e "s|\(^#define LV_USE_DRAW_SDL \).*|#define LV_USE_DRAW_SDL ${=
LVGL_CONFIG_USE_SDL}|g" \
> +        -e "s|\(^    #define LV_SDL_BUF_COUNT \).*|    #define LV_SDL_BU=
F_COUNT 2|g" \
>          \
> -        -e "s|\(^#  define USE_WAYLAND \).*|#  define USE_WAYLAND ${LVGL=
_CONFIG_USE_WAYLAND}|g" \
> -        -e "s|\(^ *# *define *WAYLAND_HOR_RES *\).*|\1${LVGL_CONFIG_WAYL=
AND_HOR_RES}|g" \
> -        -e "s|\(^ *# *define *WAYLAND_VER_RES *\).*|\1${LVGL_CONFIG_WAYL=
AND_VER_RES}|g" \
> +        -e "s|\(^#define LV_COLOR_DEPTH \).*|#define LV_COLOR_DEPTH ${LV=
GL_CONFIG_LV_COLOR_DEPTH}|g" \
> +        -e "s|\(#define LV_MEM_CUSTOM .*\)0|\1${LVGL_CONFIG_LV_MEM_CUSTO=
M}|g" \
>          \
> -        -i "${S}/lv_drv_conf.h"
> +        -e "s|\(#define LV_TICK_CUSTOM \).*|\1 1|g" \
> +        -e "s|\(#define LV_TICK_CUSTOM_INCLUDE \).*|\1 <stdint.h>|g" \
> +        -e "s|\(#define LV_TICK_CUSTOM_SYS_TIME_EXPR \).*|extern uint32_=
t custom_tick_get(void);\n\1 (custom_tick_get())|g" \
> +        \
> +        -e "s|\(^#define LV_USE_EVDEV \).*|#define LV_USE_EVDEV ${LVGL_C=
ONFIG_USE_EVDEV}|g" \
> +        \
> +        -i "${S}/lv_conf.h"
>  }
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb b/meta-oe/=
recipes-graphics/lvgl/lv-drivers_8.3.0.bb
> deleted file mode 100644
> index e2c5a342a..000000000
> --- a/meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -# SPDX-FileCopyrightText: Huawei Inc.
> -#
> -# SPDX-License-Identifier: MIT
> -
> -HOMEPAGE =3D "https://docs.lvgl.io/latest/en/html/porting/index.html"
> -SUMMARY =3D "LVGL's Display and Touch pad drivers"
> -DESCRIPTION =3D "Collection of drivers: SDL, framebuffer, wayland and mo=
re..."
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd6fc0df890c5270ef045981b516bb=
8f2"
> -
> -SRC_URI =3D "git://github.com/lvgl/lv_drivers;protocol=3Dhttps;branch=3D=
release/v8.3"
> -SRCREV =3D "71830257710f430b6d8d1c324f89f2eab52488f1"
> -
> -DEPENDS =3D "lvgl"
> -
> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland fbde=
v', d)}"
> -require lv-drivers.inc
> -
> -inherit cmake
> -
> -S =3D "${WORKDIR}/git"
> -
> -TARGET_CFLAGS +=3D "-DLV_CONF_INCLUDE_SIMPLE=3D1"
> -TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/lvgl"
> -
> -FILES:${PN}-dev +=3D "\
> -    ${includedir}/lvgl/lv_drivers/ \
> -    "
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb b/meta-oe/=
recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
> deleted file mode 100644
> index 0049bbe23..000000000
> --- a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -# SPDX-FileCopyrightText: Huawei Inc.
> -#
> -# SPDX-License-Identifier: MIT
> -
> -HOMEPAGE =3D "https://docs.lvgl.io"
> -SUMMARY =3D "PNG decoder for LVGL"
> -DESCRIPTION =3D "Allow the use of PNG images in LVGL. This implementatio=
n uses lodepng"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd6fc0df890c5270ef045981b516bb=
8f2"
> -
> -SRC_URI =3D "git://github.com/lvgl/lv_lib_png;;protocol=3Dhttps;branch=
=3Dmaster"
> -SRCREV =3D "bf1531afe07c9f861107559e29ab8a2d83e4715a"
> -
> -S =3D "${WORKDIR}/git"
> -
> -# because of lvgl dependency
> -REQUIRED_DISTRO_FEATURES =3D "wayland"
> -
> -DEPENDS +=3D "lvgl"
> -
> -EXTRA_OECMAKE +=3D "-DLIB_INSTALL_DIR=3D${baselib}"
> -
> -inherit cmake
> -inherit features_check
> -
> -TARGET_CFLAGS +=3D "-DLV_CONF_INCLUDE_SIMPLE=3D1"
> -TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/lvgl"
> -
> -FILES:${PN}-dev =3D "\
> -    ${includedir}/lvgl/lv_lib_png/ \
> -    "
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
> deleted file mode 100644
> index 32f833a02..000000000
> --- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -SUMMARY =3D "LVGL Demo Application for Framebuffer"
> -HOMEPAGE =3D "https://github.com/lvgl/lv_port_linux_frame_buffer"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D802d3d83ae80ef5f343050bf96cce=
3a4 \
> -                    file://lv_drivers/LICENSE;md5=3Dd6fc0df890c5270ef045=
981b516bb8f2 \
> -                    file://lvgl/LICENCE.txt;md5=3Dbf1198c89ae87f043108ce=
a62460b03a"
> -
> -SRC_URI =3D "gitsm://github.com/lvgl/lv_port_linux_frame_buffer.git;bran=
ch=3Dmaster;protocol=3Dhttps"
> -SRCREV =3D "adf2c4490e17a1b9ec1902cc412a24b3b8235c8e"
> -
> -EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
> -
> -PACKAGECONFIG ??=3D "drm"
> -require lv-drivers.inc
> -
> -inherit cmake
> -
> -S =3D "${WORKDIR}/git"
> -
> -TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/libdrm"
> -
> -do_configure:prepend() {
> -       if [ "${LVGL_CONFIG_USE_DRM}" -eq 1 ] ; then
> -               # Add libdrm build dependency
> -               sed -i '/^target_link_libraries/ s@lvgl::drivers@& drm@' =
"${S}/CMakeLists.txt"
> -               # Switch from fbdev to drm usage
> -               sed -i 's@fbdev@drm@g' "${S}/main.c"
> -               # Pull resolution from DRM instead of hardcoding it
> -               sed -i '/disp_drv.hor_res/ d' "${S}/main.c"
> -               sed -i '/disp_drv.ver_res/ s@disp_drv.ver_res.*@drm_get_s=
izes(\&disp_drv.hor_res, \&disp_drv.ver_res, NULL);@' "${S}/main.c"
> -       fi
> -
> -       if [ "${LVGL_CONFIG_USE_SDL}" -eq 1 ] ; then
> -               # Add libsdl build dependency
> -               sed -i '/^target_link_libraries/ s@lvgl::drivers@& SDL2@'=
 "${S}/CMakeLists.txt"
> -               # Switch from fbdev to sdl usage
> -               sed -i 's@fbdev_flush@sdl_display_flush@g' "${S}/main.c"
> -               sed -i 's@lv_drivers/display/fbdev.h@lv_drivers/sdl/sdl.h=
@g' "${S}/main.c"
> -               sed -i 's@fbdev@sdl@g' "${S}/main.c"
> -       fi
> -}
> -
> -do_install:append() {
> -       install -d ${D}${bindir}
> -       install -m 0755 ${B}/lvgl_fb ${D}${bindir}/
> -}
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
> new file mode 100644
> index 000000000..fc675a518
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
> @@ -0,0 +1,49 @@
> +SUMMARY =3D "LVGL Demo Application for Framebuffer"
> +HOMEPAGE =3D "https://github.com/lvgl/lv_port_linux_frame_buffer"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D802d3d83ae80ef5f343050bf96cce=
3a4 \
> +                    file://lvgl/LICENCE.txt;md5=3Dbf1198c89ae87f043108ce=
a62460b03a"
> +
> +SRC_URI =3D "\
> +       git://github.com/lvgl/lv_port_linux_frame_buffer.git;protocol=3Dh=
ttps;branch=3Dmaster;name=3Ddemo \
> +       git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Dmaster;name=
=3Dlvgl;subdir=3Dgit/lvgl \
> +       "
> +SRCREV_demo =3D "dccc6a1ca48372aa993dbea7a8e17dec6f42df6a"
> +SRCREV_lvgl =3D "e29d35b43c509b6d7189f5dac87139441669ae66"
> +SRCREV_FORMAT =3D "demo_lvgl"
> +PV .=3D "+git${SRCPV}"
> +
> +EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
> +
> +PACKAGECONFIG ??=3D "drm"
> +LVGL_CONFIG_DRM_CARD ?=3D "/dev/dri/card0"
> +require lv-drivers.inc
> +
> +inherit cmake
> +
> +S =3D "${WORKDIR}/git"
> +
> +TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/libdrm"
> +
> +do_configure:prepend() {
> +       if [ "${LVGL_CONFIG_USE_DRM}" -eq 1 ] ; then
> +               # Add libdrm build dependency
> +               sed -i '/^target_link_libraries/ s@pthread@& drm@' "${S}/=
CMakeLists.txt"
> +               # Switch from fbdev to drm usage
> +               sed -i "s@lv_linux_fbdev_set_file.*@lv_linux_drm_set_file=
(disp, \"${LVGL_CONFIG_DRM_CARD}\", -1);@g" "${S}/main.c"
> +               sed -i 's@fbdev@drm@g' "${S}/main.c"
> +       fi
> +
> +       if [ "${LVGL_CONFIG_USE_SDL}" -eq 1 ] ; then
> +               # Add libsdl build dependency
> +               sed -i '/^target_link_libraries/ s@pthread@& SDL2 SDL2_im=
age@' "${S}/CMakeLists.txt"
> +               # Switch from fbdev to sdl usage
> +               sed -i 's@lv_linux_fbdev_create()@lv_sdl_window_create(at=
oi(getenv("LV_VIDEO_WIDTH") ? : "800"), atoi(getenv("LV_VIDEO_HEIGHT") ? : =
"480"))@g' "${S}/main.c"
> +               sed -i '/lv_linux_fbdev_set_file/ d' "${S}/main.c"
> +       fi
> +}
> +
> +do_install:append() {
> +       install -d ${D}${bindir}
> +       install -m 0755 ${S}/bin/main ${D}${bindir}/lvgl
> +}
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.11.bb b/meta-oe/recip=
es-graphics/lvgl/lvgl_8.3.11.bb
> deleted file mode 100644
> index 252368061..000000000
> --- a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.11.bb
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -# SPDX-FileCopyrightText: Huawei Inc.
> -#
> -# SPDX-License-Identifier: MIT
> -
> -HOMEPAGE =3D "https://lvgl.io/"
> -DESCRIPTION =3D "LVGL is an OSS graphics library to create embedded GUI"
> -SUMMARY =3D "Light and Versatile Graphics Library"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3Dbf1198c89ae87f043108cea62=
460b03a"
> -
> -SRC_URI =3D "git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Dreleas=
e/v8.3"
> -SRCREV =3D "74d0a816a440eea53e030c4f1af842a94f7ce3d3"
> -
> -inherit cmake
> -
> -EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib}"
> -S =3D "${WORKDIR}/git"
> -
> -ALLOW_EMPTY:${PN} =3D "1"
> -
> -LVGL_CONFIG_LV_MEM_CUSTOM ?=3D "0"
> -LVGL_CONFIG_LV_COLOR_DEPTH ?=3D "32"
> -
> -# Upstream does not support a default configuration
> -# but propose a default "disabled" template, which is used as reference
> -# More configuration can be done using external configuration variables
> -do_configure:prepend() {
> -    [ -r "${S}/lv_conf.h" ] \
> -        || sed -e 's|#if 0 .*Set it to "1" to enable .*|#if 1 // Enabled=
|g' \
> -           -e "s|\(#define LV_COLOR_DEPTH \).*|\1 ${LVGL_CONFIG_LV_COLOR=
_DEPTH}|g" \
> -           \
> -           -e "s|\(#define LV_MEM_CUSTOM .*\)0|\1${LVGL_CONFIG_LV_MEM_CU=
STOM}|g" \
> -           \
> -           -e "s|\(#define LV_TICK_CUSTOM \).*|\1 1|g" \
> -           -e "s|\(#define LV_TICK_CUSTOM_INCLUDE \).*|\1 <stdint.h>|g" =
\
> -           -e "s|\(#define LV_TICK_CUSTOM_SYS_TIME_EXPR \).*|extern uint=
32_t custom_tick_get(void);\n\1 (custom_tick_get())|g" \
> -           \
> -            < "${S}/lv_conf_template.h" > "${S}/lv_conf.h"
> -}
> -
> -FILES:${PN}-dev +=3D "\
> -    ${includedir}/${PN}/ \
> -    ${includedir}/${PN}/lvgl/ \
> -    "
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_9.0.0.bb
> new file mode 100644
> index 000000000..d8ed4ec81
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> @@ -0,0 +1,28 @@
> +# SPDX-FileCopyrightText: Huawei Inc.
> +#
> +# SPDX-License-Identifier: MIT
> +
> +HOMEPAGE =3D "https://lvgl.io/"
> +DESCRIPTION =3D "LVGL is an OSS graphics library to create embedded GUI"
> +SUMMARY =3D "Light and Versatile Graphics Library"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3Dbf1198c89ae87f043108cea62=
460b03a"
> +
> +SRC_URI =3D "git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Dmaster=
"
> +SRCREV =3D "e29d35b43c509b6d7189f5dac87139441669ae66"
> +PV .=3D "+git${SRCPV}"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib}"
> +S =3D "${WORKDIR}/git"
> +
> +ALLOW_EMPTY:${PN} =3D "1"
> +
> +PACKAGECONFIG ??=3D "drm"
> +require lv-drivers.inc
> +
> +FILES:${PN}-dev +=3D "\
> +    ${includedir}/${PN}/ \
> +    ${includedir}/${PN}/lvgl/ \
> +    "
> --
> 2.43.0
>

