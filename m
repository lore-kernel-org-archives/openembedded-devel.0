Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCF1C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 11:19:19 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.49934.1742210350153859539
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 04:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sujv0lpj;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30761be8fcfso47431841fa.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742210348; x=1742815148; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNl9S2fnLXu5C2+lAaAoNYzauu1ZSVUmrhnItAQZxuk=;
        b=Sujv0lpjJpBJ+Jk8bPaqYNdS3jbHD8vb+wWMHUzirzzVUAGrE5KQJyWw6C9d/69H5S
         +vwpI5dYSBT9kEez6LjUU7xD96JkoLKul40wt/oPxTey12w7fq6Bg+6ZHVTgDsbsqY0j
         0JTC9Jzmby5K7ihWIyzXDSzwVV4dGd1k1GVWVN/tfMemoWPTYtMPR/bNOkMqITYPgQrC
         5y+wn8JO6llw6LJGsi81SAGDJk+zTluQWJBqroZ6zODtiqfc48P/wJuSIFxcaNbi054n
         mm3nlPP9T5+gXkjKEzJ2L6tnUBxmoC9mBEBX8UDQl9P6Jfq5tZ1x22fquysAZUJy4KgT
         6R8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742210348; x=1742815148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNl9S2fnLXu5C2+lAaAoNYzauu1ZSVUmrhnItAQZxuk=;
        b=BJAubqwmGikME7jDUgCGkBtjH29UR2B/+hwDEILMnBmqQMJsm6H4xNvQV3cd38Yemg
         YCcn+2yHhH1UergszcRji1EKSyF2zJm7VjI8yv+4TWUIio0FrVPsWsEsQ5jgw/Iy11+Q
         zK7iMcSH/AeVFd0BVdI8CWRJVUz5Wef1UsPvki5n4FXRb92RtXcnG9UrA19MLqA7QIrs
         ZeKO1bvBkcp0WLmISEKPhWB9mQcqFCyouwdV8y1k6NG2xfMvq9MwL4UyeRYNM9EaNDnO
         1egO36iU7DQGPKco9DG5hnVz+TxSAN0sdKwHjnYA3pCLosdg8dYD5DwyGruqHgWZ49RH
         Fg1g==
X-Gm-Message-State: AOJu0Yz1mZTPd48dv4w2X8CgkUsYopAaqpGpHCrKOJzGVrmdMT1XR+bc
	3YnsMlOtdocI494rVkRCKcJvU99GIio7nkTtEe60/PUvYZt+dcVJ92qScKGgLusHUBl55KgxeTP
	az/EOK8tkP197gNE78/0014AS/fI=
X-Gm-Gg: ASbGnctsL66hChKgUar4y3/03rXTY9Mt0uBnwcu3Oc2Uuuu88vqpDA3I+jxdYo6uhWb
	bbgUi25vByjM0Tiq7cBgxH1/jFsMux1OxohDGaTTI2GhDd4m3CAcG3IGt930yRpjL9TuMa6hDZG
	+uaS9Bi/ekx16PQwo8DW0dlU4nowVOZpesXRN9Huo=
X-Google-Smtp-Source: AGHT+IG5GBW/I/2ttmtOLkIIM/9l/YQujW3UBZ3GBDxfBilCuL6RCgpQmVKrCb4G2AXn40cYqh1xosDPdbArcjbRx9g=
X-Received: by 2002:a05:6512:6cc:b0:545:746:f36a with SMTP id
 2adb3069b0e04-549c396ee10mr6271167e87.34.1742210347764; Mon, 17 Mar 2025
 04:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <182C5B28D7D9F838.16826@lists.openembedded.org> <AK92TS.Q739GCR1HSTF2@t-online.de>
In-Reply-To: <AK92TS.Q739GCR1HSTF2@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 17 Mar 2025 12:18:56 +0100
X-Gm-Features: AQ5f1JqvWgu8TarGEs25dTPOZgKIuH1zKjHBMAkxY1eity7-VlZo0KcfyRMYNd0
Message-ID: <CA+chaQcVqO2qSReiy5tgc4EKhsZxJKd823wdZj=BgoHYPDYLHw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] libsdl3: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 11:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116024

Hi,

in my world build without x11 in DISTRO_FEATURES this and
libsdl2-compat failed to build with:

-- SDL3 was configured with the following options:
--=20
-- Platform: Linux
-- 64-bit:   TRUE
-- Compiler: libsdl3/3.2.8/recipe-sysroot-native/usr/bin/aarch64-webos-linu=
x/aarch64-webos-linux-gcc
-- Revision: release-3.2.8-0-gf6864924f
-- Vendor:
--=20
-- Subsystems:
--   Audio:    ON
--   Video:    ON
--   GPU:      ON
--   Render:   ON
--   Camera:   ON
--   Joystick: ON
--   Haptic:   ON
--   Hidapi:   ON
--   Power:    ON
--   Sensor:   ON
--   Dialog:   ON
--=20
-- Options:
--   SDL_ALSA                    (Wanted: OFF): OFF
--   SDL_ALSA_SHARED             (Wanted: OFF): OFF
--   SDL_ALTIVEC                 (Wanted: OFF): OFF
--   SDL_ARMNEON                 (Wanted: OFF): OFF
--   SDL_ASAN                    (Wanted: OFF): OFF
--   SDL_ASSEMBLY                (Wanted: ON): ON
--   SDL_ASSERTIONS              (Wanted: auto): auto
--   SDL_AVX                     (Wanted: OFF): OFF
--   SDL_AVX2                    (Wanted: OFF): OFF
--   SDL_AVX512F                 (Wanted: OFF): OFF
--   SDL_BACKGROUNDING_SIGNAL    (Wanted: OFF): OFF
--   SDL_CCACHE                  (Wanted: OFF): OFF
--   SDL_CLANG_TIDY              (Wanted: OFF): OFF
--   SDL_CLOCK_GETTIME           (Wanted: ON): ON
--   SDL_COCOA                   (Wanted: OFF): OFF
--   SDL_DBUS                    (Wanted: ON): OFF
--   SDL_DEPS_SHARED             (Wanted: ON): OFF
--   SDL_DIRECTX                 (Wanted: OFF): OFF
--   SDL_DISKAUDIO               (Wanted: OFF): OFF
--   SDL_DUMMYAUDIO              (Wanted: ON): ON
--   SDL_DUMMYCAMERA             (Wanted: ON): ON
--   SDL_DUMMYVIDEO              (Wanted: OFF): OFF
--   SDL_EXAMPLES                (Wanted: OFF): OFF
--   SDL_EXAMPLES_LINK_SHARED    (Wanted: ON): OFF
--   SDL_FOREGROUNDING_SIGNAL    (Wanted: OFF): OFF
--   SDL_GCC_ATOMICS             (Wanted: ON): ON
--   SDL_GPU_DXVK                (Wanted: OFF): OFF
--   SDL_HIDAPI                  (Wanted: ON): ON
--   SDL_HIDAPI_JOYSTICK         (Wanted: ON): ON
--   SDL_HIDAPI_LIBUSB           (Wanted: OFF): OFF
--   SDL_HIDAPI_LIBUSB_SHARED    (Wanted: OFF): OFF
--   SDL_IBUS                    (Wanted: ON): OFF
--   SDL_INSTALL                 (Wanted: ON): OFF
--   SDL_INSTALL_TESTS           (Wanted: OFF): OFF
--   SDL_JACK                    (Wanted: OFF): OFF
--   SDL_JACK_SHARED             (Wanted: OFF): OFF
--   SDL_KMSDRM                  (Wanted: OFF): OFF
--   SDL_KMSDRM_SHARED           (Wanted: OFF): OFF
--   SDL_LASX                    (Wanted: OFF): OFF
--   SDL_LIBC                    (Wanted: ON): ON
--   SDL_LIBICONV                (Wanted: OFF): OFF
--   SDL_LIBUDEV                 (Wanted: ON): ON
--   SDL_LIBURING                (Wanted: ON): OFF
--   SDL_LSX                     (Wanted: OFF): OFF
--   SDL_METAL                   (Wanted: OFF): OFF
--   SDL_MMX                     (Wanted: OFF): OFF
--   SDL_OFFSCREEN               (Wanted: ON): ON
--   SDL_OPENGL                  (Wanted: OFF): OFF
--   SDL_OPENGLES                (Wanted: OFF): OFF
--   SDL_OPENVR                  (Wanted: OFF): OFF
--   SDL_OSS                     (Wanted: OFF): OFF
--   SDL_PIPEWIRE                (Wanted: ON): OFF
--   SDL_PIPEWIRE_SHARED         (Wanted: OFF): OFF
--   SDL_PTHREADS                (Wanted: ON): ON
--   SDL_PTHREADS_SEM            (Wanted: ON): ON
--   SDL_PULSEAUDIO              (Wanted: ON): ON
--   SDL_PULSEAUDIO_SHARED       (Wanted: ON): ON
--   SDL_RENDER_D3D              (Wanted: OFF): OFF
--   SDL_RENDER_D3D11            (Wanted: OFF): OFF
--   SDL_RENDER_D3D12            (Wanted: OFF): OFF
--   SDL_RENDER_GPU              (Wanted: ON): ON
--   SDL_RENDER_METAL            (Wanted: ON): OFF
--   SDL_RENDER_VULKAN           (Wanted: OFF): OFF
--   SDL_ROCKCHIP                (Wanted: ON): OFF
--   SDL_RPATH                   (Wanted: OFF): OFF
--   SDL_RPI                     (Wanted: OFF): OFF
--   SDL_SNDIO                   (Wanted: OFF): OFF
--   SDL_SNDIO_SHARED            (Wanted: OFF): OFF
--   SDL_SSE                     (Wanted: OFF): OFF
--   SDL_SSE2                    (Wanted: OFF): OFF
--   SDL_SSE3                    (Wanted: OFF): OFF
--   SDL_SSE4_1                  (Wanted: OFF): OFF
--   SDL_SSE4_2                  (Wanted: OFF): OFF
--   SDL_SYSTEM_ICONV            (Wanted: ON): ON
--   SDL_TESTS                   (Wanted: OFF): OFF
--   SDL_TESTS_LINK_SHARED       (Wanted: ON): OFF
--   SDL_UNINSTALL               (Wanted: ON): OFF
--   SDL_VIRTUAL_JOYSTICK        (Wanted: ON): ON
--   SDL_VIVANTE                 (Wanted: OFF): OFF
--   SDL_VULKAN                  (Wanted: OFF): OFF
--   SDL_WASAPI                  (Wanted: OFF): OFF
--   SDL_WAYLAND                 (Wanted: OFF): OFF
--   SDL_WAYLAND_LIBDECOR        (Wanted: OFF): OFF
--   SDL_WAYLAND_LIBDECOR_SHARED (Wanted: OFF): OFF
--   SDL_WAYLAND_SHARED          (Wanted: OFF): OFF
--   SDL_X11                     (Wanted: OFF): OFF
--   SDL_X11_SHARED              (Wanted: OFF): OFF
--   SDL_X11_XCURSOR             (Wanted: OFF): OFF
--   SDL_X11_XDBE                (Wanted: OFF): OFF
--   SDL_X11_XFIXES              (Wanted: OFF): OFF
--   SDL_X11_XINPUT              (Wanted: OFF): OFF
--   SDL_X11_XRANDR              (Wanted: OFF): OFF
--   SDL_X11_XSCRNSAVER          (Wanted: OFF): OFF
--   SDL_X11_XSHAPE              (Wanted: OFF): OFF
--   SDL_X11_XSYNC               (Wanted: OFF): OFF
--   SDL_XINPUT                  (Wanted: OFF): OFF
--=20
--  Build Shared Library: ON
--  Build Static Library: OFF
--=20
-- If something was not detected, although the libraries
-- were installed, then make sure you have set the
-- CMAKE_C_FLAGS and CMAKE_PREFIX_PATH CMake variables correctly.
--=20
CMake Error at cmake/macros.cmake:382 (message):
  SDL could not find X11 or Wayland development libraries on your system.
  This means SDL will not be able to create windows on a typical unix
  operating system.  Most likely, this is not wanted.

  On Linux, install the packages listed at
  https://github.com/libsdl-org/SDL/blob/main/docs/README-linux.md#build-de=
pendencies


  If you really don't need desktop windows, the documentation tells you how
  to skip this check.
  https://github.com/libsdl-org/SDL/blob/main/docs/README-cmake.md#cmake-fa=
ils-to-build-without-x11-or-wayland-support


Call Stack (most recent call first):
  CMakeLists.txt:3799 (SDL_PrintSummary)

which might be caused by _both_ x11 and wayland missing in
DISTRO_FEATURES and we should probably add features_check inherit to
make sure at least one of them is available.

libsdl2-compat (in build where libsdl3 didn't fail) failed with:

-- Could NOT find OpenGL (missing: OPENGL_opengl_LIBRARY OpenGL)
CMake Error at TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/libsdl2-compat=
/2.32.52/recipe-sysroot-native/usr/share/cmake-3.31/Modules/FindPackageHand=
leStandardArgs.cmake:233
(message):
  Could NOT find X11 (missing: X11_X11_INCLUDE_PATH X11_X11_LIB)
Call Stack (most recent call first):
  TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/libsdl2-compat/2.32.52/reci=
pe-sysroot-native/usr/share/cmake-3.31/Modules/FindPackageHandleStandardArg=
s.cmake:603
(_FPHSA_FAILURE_MESSAGE)
  TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/libsdl2-compat/2.32.52/reci=
pe-sysroot-native/usr/share/cmake-3.31/Modules/FindX11.cmake:676
(find_package_handle_standard_args)
  test/CMakeLists.txt:118 (find_package)

I'll check what went wrong and send patches, this is just FYI.

Cheers,

On Thu, Mar 13, 2025 at 1:41=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> v2: remove directfb from PACKAGECONFIG
>
> On Thu, Mar 13 2025 at 13:03:40 +01:00:00, Markus Volk <f_l_k@t-online.de=
> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de> --- .../recipes-graphics/l=
ibsdl3/libsdl3_3.2.8.bb | 83 +++++++++++++++++++ 1 file changed, 83 inserti=
ons(+) create mode 100644 meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb=
 diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb b/meta-oe/r=
ecipes-graphics/libsdl3/libsdl3_3.2.8.bb new file mode 100644 index 0000000=
000..9c4fa317a2 --- /dev/null +++ b/meta-oe/recipes-graphics/libsdl3/libsdl=
3_3.2.8.bb @@ -0,0 +1,83 @@ +SUMMARY =3D "Simple DirectMedia Layer" +DESCRI=
PTION =3D "Simple DirectMedia Layer is a cross-platform multimedia \ +libra=
ry designed to provide low level access to audio, keyboard, mouse, \ +joyst=
ick, 3D hardware via OpenGL, and 2D video framebuffer." +HOMEPAGE =3D "http=
://www.libsdl.org" +BUGTRACKER =3D "http://bugzilla.libsdl.org/" + +SECTION=
 =3D "libs" + +LICENSE =3D "Zlib & BSD-2-Clause" +LIC_FILES_CHKSUM =3D "\ +=
 file://LICENSE.txt;md5=3Dcbf0e3161523f9a9315b6b915c5c4457 \ + file://src/h=
idapi/LICENSE.txt;md5=3D7c3949a631240cb6c31c50f3eb696077 \ + file://src/hid=
api/LICENSE-bsd.txt;md5=3Db5fa085ce0926bb50d0621620a82361f \ + file://src/v=
ideo/yuv2rgb/LICENSE;md5=3D79f8f3418d91531e05f0fc94ca67e071 \ +" + +# arm-n=
eon adds MIT license +LICENSE:append =3D " ${@bb.utils.contains('PACKAGECON=
FIG', 'arm-neon', '& MIT', '', d)}" +LIC_FILES_CHKSUM:append =3D " ${@bb.ut=
ils.contains('PACKAGECONFIG', 'arm-neon', 'file://src/video/arm/pixman-arm-=
neon-asm.h;md5=3D9a9cc1e51abbf1da58f4d9528ec9d49b;beginline=3D1;endline=3D2=
4', '', d)}" + +PROVIDES =3D "virtual/libsdl3" + +SRC_URI =3D "http://www.l=
ibsdl.org/release/SDL3-${PV}.tar.gz" + +S =3D "${WORKDIR}/SDL3-${PV}" + +SR=
C_URI[sha256sum] =3D "13388fabb361de768ecdf2b65e52bb27d1054cae6ccb6942ba926=
e378e00db03" + +inherit cmake lib_package binconfig-disabled pkgconfig upst=
ream-version-is-even + +CVE_PRODUCT =3D "simple_directmedia_layer sdl" + +E=
XTRA_OECMAKE =3D " \ + -DSDL_OSS_DEFAULT=3DOFF \ + -DSDL_DISKAUDIO=3DOFF \ =
+ -DSDL_DUMMYVIDEO=3DOFF \ + -DSDL_RPI=3DOFF \ + -DSDL_PTHREADS=3DON \ + -D=
SDL_RPATH=3DOFF \ + -DSDL_SNDIO=3DOFF \ + -DSDL_X11_XCURSOR=3DOFF \ + -DSDL=
_X11_XDBE=3DOFF \ + -DSDL_X11_XFIXES=3DOFF \ + -DSDL_X11_XINPUT=3DOFF \ + -=
DSDL_X11_XRANDR=3DOFF \ + -DSDL_X11_XSCRNSAVER=3DOFF \ + -DSDL_X11_XSHAPE=
=3DOFF \ +" + +# opengl packageconfig factored out to make it easy for dist=
ros +# and BSP layers to pick either (desktop) opengl, gles2, or no GL +PAC=
KAGECONFIG_GL ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}" + =
+PACKAGECONFIG:class-native =3D "x11 ${PACKAGECONFIG_GL}" +PACKAGECONFIG:cl=
ass-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} ${PACKA=
GECONFIG_GL}" +PACKAGECONFIG ??=3D " \ + ${PACKAGECONFIG_GL} \ + ${@bb.util=
s.filter('DISTRO_FEATURES', 'alsa pulseaudio pipewire x11 vulkan', d)} \ + =
${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', '', d)}=
 \ + ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \ +" +P=
ACKAGECONFIG[alsa] =3D "-DSDL_ALSA=3DON,-DSDL_ALSA=3DOFF,alsa-lib," +PACKAG=
ECONFIG[arm-neon] =3D "-DSDL_ARMNEON=3DON,-DSDL_ARMNEON=3DOFF" +PACKAGECONF=
IG[gles2] =3D "-DSDL_OPENGLES=3DON,-DSDL_OPENGLES=3DOFF,virtual/libgles2" +=
PACKAGECONFIG[jack] =3D "-DSDL_JACK=3DON,-DSDL_JACK=3DOFF,jack" +PACKAGECON=
FIG[kmsdrm] =3D "-DSDL_KMSDRM=3DON,-DSDL_KMSDRM=3DOFF,libdrm virtual/libgbm=
" +# The hidraw support doesn't catch Xbox, PS4 and Nintendo controllers, +=
# so we'll just use libusb when it's available. +PACKAGECONFIG[libusb] =3D =
"-DSDL_HIDAPI_LIBUSB=3DON,-DSDL_HIDAPI_LIBUSB=3DOFF,libusb1" +PACKAGECONFIG=
[libdecor] =3D "-DSDL_WAYLAND_LIBDECOR=3DON,-DSDL_WAYLAND_LIBDECOR=3DOFF,li=
bdecor,libdecor" +PACKAGECONFIG[opengl] =3D "-DSDL_OPENGL=3DON,-DSDL_OPENGL=
=3DOFF,virtual/egl" +PACKAGECONFIG[pipewire] =3D "-DSDL_PIPEWIRE_SHARED=3DO=
N,-DSDL_PIPEWIRE_SHARED=3DOFF,pipewire" +PACKAGECONFIG[pulseaudio] =3D "-DS=
DL_PULSEAUDIO=3DON,-DSDL_PULSEAUDIO=3DOFF,pulseaudio" +PACKAGECONFIG[vulkan=
] =3D "-DSDL_VULKAN=3DON -DSDL_RENDER_VULKAN=3DON,-DSDL_VULKAN=3DOFF -DSDL_=
RENDER_VULKAN=3DOFF" +PACKAGECONFIG[wayland] =3D "-DSDL_WAYLAND=3DON,-DSDL_=
WAYLAND=3DOFF,wayland-native wayland wayland-protocols libxkbcommon" +PACKA=
GECONFIG[x11] =3D "-DSDL_X11=3DON,-DSDL_X11=3DOFF,virtual/libx11 libxext li=
bxrandr libxrender" + +CFLAGS:append:class-native =3D " -DNO_SHARED_MEMORY"=
 + +FILES:${PN} +=3D "${datadir}/licenses/SDL3/LICENSE.txt" + +BBCLASSEXTEN=
D =3D "native nativesdk"
> --
> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115969): https://lists.openembedded.org/g/openembedde=
d-devel/message/115969
> Mute This Topic: https://lists.openembedded.org/mt/111678038/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

