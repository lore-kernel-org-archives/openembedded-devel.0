Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EFAC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 12:57:19 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.51703.1742216238895704685
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 05:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout07.t-online.de (Postfix) with SMTP id 95D04389;
	Mon, 17 Mar 2025 13:57:16 +0100 (CET)
Received: from [192.168.178.20] ([84.154.161.174]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuA1s-1LnF0S0; Mon, 17 Mar 2025 13:57:16 +0100
Date: Mon, 17 Mar 2025 13:58:00 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] libsdl3: add recipe
To: martin.jansa@gmail.com
Cc: "Martin Jansa via lists.openembedded.org"
	<martin.jansa=gmail.com@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org
Message-Id: <OOQ9TS.1SN68XT65W4D2@t-online.de>
In-Reply-To: <CA+chaQcVqO2qSReiy5tgc4EKhsZxJKd823wdZj=BgoHYPDYLHw@mail.gmail.com>
References: <182C5B28D7D9F838.16826@lists.openembedded.org>
	<AK92TS.Q739GCR1HSTF2@t-online.de>
	<CA+chaQcVqO2qSReiy5tgc4EKhsZxJKd823wdZj=BgoHYPDYLHw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-rruWITwmTzLghJKpQW1S"
X-TOI-EXPURGATEID: 150726::1742216236-F27FA586-8760953E/10/3626336762 SUSPECT URL
X-TOI-MSGID: 1ece4aee-a302-440e-9880-ad4a42cc4853
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 12:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116026

--=-rruWITwmTzLghJKpQW1S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

I have sent a patch to fix it.

On Mon, Mar 17 2025 at 12:18:56 +01:00:00, Martin Jansa via=20
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>=20
wrote:
> Hi,
>=20
> in my world build without x11 in DISTRO_FEATURES this and
> libsdl2-compat failed to build with:
>=20
> -- SDL3 was configured with the following options:
> --
> -- Platform: Linux
> -- 64-bit:   TRUE
> -- Compiler:=20
> libsdl3/3.2.8/recipe-sysroot-native/usr/bin/aarch64-webos-linux/aarch64-w=
ebos-linux-gcc
> -- Revision: release-3.2.8-0-gf6864924f
> -- Vendor:
> --
> -- Subsystems:
> --   Audio:    ON
> --   Video:    ON
> --   GPU:      ON
> --   Render:   ON
> --   Camera:   ON
> --   Joystick: ON
> --   Haptic:   ON
> --   Hidapi:   ON
> --   Power:    ON
> --   Sensor:   ON
> --   Dialog:   ON
> --
> -- Options:
> --   SDL_ALSA                    (Wanted: OFF): OFF
> --   SDL_ALSA_SHARED             (Wanted: OFF): OFF
> --   SDL_ALTIVEC                 (Wanted: OFF): OFF
> --   SDL_ARMNEON                 (Wanted: OFF): OFF
> --   SDL_ASAN                    (Wanted: OFF): OFF
> --   SDL_ASSEMBLY                (Wanted: ON): ON
> --   SDL_ASSERTIONS              (Wanted: auto): auto
> --   SDL_AVX                     (Wanted: OFF): OFF
> --   SDL_AVX2                    (Wanted: OFF): OFF
> --   SDL_AVX512F                 (Wanted: OFF): OFF
> --   SDL_BACKGROUNDING_SIGNAL    (Wanted: OFF): OFF
> --   SDL_CCACHE                  (Wanted: OFF): OFF
> --   SDL_CLANG_TIDY              (Wanted: OFF): OFF
> --   SDL_CLOCK_GETTIME           (Wanted: ON): ON
> --   SDL_COCOA                   (Wanted: OFF): OFF
> --   SDL_DBUS                    (Wanted: ON): OFF
> --   SDL_DEPS_SHARED             (Wanted: ON): OFF
> --   SDL_DIRECTX                 (Wanted: OFF): OFF
> --   SDL_DISKAUDIO               (Wanted: OFF): OFF
> --   SDL_DUMMYAUDIO              (Wanted: ON): ON
> --   SDL_DUMMYCAMERA             (Wanted: ON): ON
> --   SDL_DUMMYVIDEO              (Wanted: OFF): OFF
> --   SDL_EXAMPLES                (Wanted: OFF): OFF
> --   SDL_EXAMPLES_LINK_SHARED    (Wanted: ON): OFF
> --   SDL_FOREGROUNDING_SIGNAL    (Wanted: OFF): OFF
> --   SDL_GCC_ATOMICS             (Wanted: ON): ON
> --   SDL_GPU_DXVK                (Wanted: OFF): OFF
> --   SDL_HIDAPI                  (Wanted: ON): ON
> --   SDL_HIDAPI_JOYSTICK         (Wanted: ON): ON
> --   SDL_HIDAPI_LIBUSB           (Wanted: OFF): OFF
> --   SDL_HIDAPI_LIBUSB_SHARED    (Wanted: OFF): OFF
> --   SDL_IBUS                    (Wanted: ON): OFF
> --   SDL_INSTALL                 (Wanted: ON): OFF
> --   SDL_INSTALL_TESTS           (Wanted: OFF): OFF
> --   SDL_JACK                    (Wanted: OFF): OFF
> --   SDL_JACK_SHARED             (Wanted: OFF): OFF
> --   SDL_KMSDRM                  (Wanted: OFF): OFF
> --   SDL_KMSDRM_SHARED           (Wanted: OFF): OFF
> --   SDL_LASX                    (Wanted: OFF): OFF
> --   SDL_LIBC                    (Wanted: ON): ON
> --   SDL_LIBICONV                (Wanted: OFF): OFF
> --   SDL_LIBUDEV                 (Wanted: ON): ON
> --   SDL_LIBURING                (Wanted: ON): OFF
> --   SDL_LSX                     (Wanted: OFF): OFF
> --   SDL_METAL                   (Wanted: OFF): OFF
> --   SDL_MMX                     (Wanted: OFF): OFF
> --   SDL_OFFSCREEN               (Wanted: ON): ON
> --   SDL_OPENGL                  (Wanted: OFF): OFF
> --   SDL_OPENGLES                (Wanted: OFF): OFF
> --   SDL_OPENVR                  (Wanted: OFF): OFF
> --   SDL_OSS                     (Wanted: OFF): OFF
> --   SDL_PIPEWIRE                (Wanted: ON): OFF
> --   SDL_PIPEWIRE_SHARED         (Wanted: OFF): OFF
> --   SDL_PTHREADS                (Wanted: ON): ON
> --   SDL_PTHREADS_SEM            (Wanted: ON): ON
> --   SDL_PULSEAUDIO              (Wanted: ON): ON
> --   SDL_PULSEAUDIO_SHARED       (Wanted: ON): ON
> --   SDL_RENDER_D3D              (Wanted: OFF): OFF
> --   SDL_RENDER_D3D11            (Wanted: OFF): OFF
> --   SDL_RENDER_D3D12            (Wanted: OFF): OFF
> --   SDL_RENDER_GPU              (Wanted: ON): ON
> --   SDL_RENDER_METAL            (Wanted: ON): OFF
> --   SDL_RENDER_VULKAN           (Wanted: OFF): OFF
> --   SDL_ROCKCHIP                (Wanted: ON): OFF
> --   SDL_RPATH                   (Wanted: OFF): OFF
> --   SDL_RPI                     (Wanted: OFF): OFF
> --   SDL_SNDIO                   (Wanted: OFF): OFF
> --   SDL_SNDIO_SHARED            (Wanted: OFF): OFF
> --   SDL_SSE                     (Wanted: OFF): OFF
> --   SDL_SSE2                    (Wanted: OFF): OFF
> --   SDL_SSE3                    (Wanted: OFF): OFF
> --   SDL_SSE4_1                  (Wanted: OFF): OFF
> --   SDL_SSE4_2                  (Wanted: OFF): OFF
> --   SDL_SYSTEM_ICONV            (Wanted: ON): ON
> --   SDL_TESTS                   (Wanted: OFF): OFF
> --   SDL_TESTS_LINK_SHARED       (Wanted: ON): OFF
> --   SDL_UNINSTALL               (Wanted: ON): OFF
> --   SDL_VIRTUAL_JOYSTICK        (Wanted: ON): ON
> --   SDL_VIVANTE                 (Wanted: OFF): OFF
> --   SDL_VULKAN                  (Wanted: OFF): OFF
> --   SDL_WASAPI                  (Wanted: OFF): OFF
> --   SDL_WAYLAND                 (Wanted: OFF): OFF
> --   SDL_WAYLAND_LIBDECOR        (Wanted: OFF): OFF
> --   SDL_WAYLAND_LIBDECOR_SHARED (Wanted: OFF): OFF
> --   SDL_WAYLAND_SHARED          (Wanted: OFF): OFF
> --   SDL_X11                     (Wanted: OFF): OFF
> --   SDL_X11_SHARED              (Wanted: OFF): OFF
> --   SDL_X11_XCURSOR             (Wanted: OFF): OFF
> --   SDL_X11_XDBE                (Wanted: OFF): OFF
> --   SDL_X11_XFIXES              (Wanted: OFF): OFF
> --   SDL_X11_XINPUT              (Wanted: OFF): OFF
> --   SDL_X11_XRANDR              (Wanted: OFF): OFF
> --   SDL_X11_XSCRNSAVER          (Wanted: OFF): OFF
> --   SDL_X11_XSHAPE              (Wanted: OFF): OFF
> --   SDL_X11_XSYNC               (Wanted: OFF): OFF
> --   SDL_XINPUT                  (Wanted: OFF): OFF
> --
> --  Build Shared Library: ON
> --  Build Static Library: OFF
> --
> -- If something was not detected, although the libraries
> -- were installed, then make sure you have set the
> -- CMAKE_C_FLAGS and CMAKE_PREFIX_PATH CMake variables correctly.
> --
> CMake Error at cmake/macros.cmake:382 (message):
>   SDL could not find X11 or Wayland development libraries on your=20
> system.
>   This means SDL will not be able to create windows on a typical unix
>   operating system.  Most likely, this is not wanted.
>=20
>   On Linux, install the packages listed at
>  =20
> <https://github.com/libsdl-org/SDL/blob/main/docs/README-linux.md#build-d=
ependencies>
>=20
>=20
>   If you really don't need desktop windows, the documentation tells=20
> you how
>   to skip this check.
>  =20
> <https://github.com/libsdl-org/SDL/blob/main/docs/README-cmake.md#cmake-f=
ails-to-build-without-x11-or-wayland-support>
>=20
>=20
> Call Stack (most recent call first):
>   CMakeLists.txt:3799 (SDL_PrintSummary)
>=20
> which might be caused by _both_ x11 and wayland missing in
> DISTRO_FEATURES and we should probably add features_check inherit to
> make sure at least one of them is available.
>=20
> libsdl2-compat (in build where libsdl3 didn't fail) failed with:
>=20
> -- Could NOT find OpenGL (missing: OPENGL_opengl_LIBRARY OpenGL)
> CMake Error at=20
> TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/libsdl2-compat/2.32.52/reci=
pe-sysroot-native/usr/share/cmake-3.31/Modules/FindPackageHandleStandardArg=
s.cmake:233
> (message):
>   Could NOT find X11 (missing: X11_X11_INCLUDE_PATH X11_X11_LIB)
> Call Stack (most recent call first):
>  =20
> TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/libsdl2-compat/2.32.52/reci=
pe-sysroot-native/usr/share/cmake-3.31/Modules/FindPackageHandleStandardArg=
s.cmake:603
> (_FPHSA_FAILURE_MESSAGE)
>  =20
> TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/libsdl2-compat/2.32.52/reci=
pe-sysroot-native/usr/share/cmake-3.31/Modules/FindX11.cmake:676
> (find_package_handle_standard_args)
>   test/CMakeLists.txt:118 (find_package)
>=20
> I'll check what went wrong and send patches, this is just FYI.
>=20
> Cheers,
>=20
> On Thu, Mar 13, 2025 at 1:41=E2=80=AFPM Markus Volk via=20
> lists.openembedded.org
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>=20
>>  v2: remove directfb from PACKAGECONFIG
>>=20
>>  On Thu, Mar 13 2025 at 13:03:40 +01:00:00, Markus Volk=20
>> <f_l_k@t-online.de <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>> ---=20
>> .../recipes-graphics/libsdl3/libsdl3_3.2.8.bb | 83=20
>> +++++++++++++++++++ 1 file changed, 83 insertions(+) create mode=20
>> 100644 meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb diff --git=20
>> a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb=20
>> b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb new file mode=20
>> 100644 index 0000000000..9c4fa317a2 --- /dev/null +++=20
>> b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb @@ -0,0 +1,83 @@=20
>> +SUMMARY =3D "Simple DirectMedia Layer" +DESCRIPTION =3D "Simple=20
>> DirectMedia Layer is a cross-platform multimedia \ +library designed=20
>> to provide low level access to audio, keyboard, mouse, \ +joystick,=20
>> 3D hardware via OpenGL, and 2D video framebuffer." +HOMEPAGE =3D=20
>> "http://www.libsdl.org" +BUGTRACKER =3D "http://bugzilla.libsdl.org/"=20
>> + +SECTION =3D "libs" + +LICENSE =3D "Zlib & BSD-2-Clause"=20
>> +LIC_FILES_CHKSUM =3D "\ +=20
>> file://LICENSE.txt;md5=3Dcbf0e3161523f9a9315b6b915c5c4457 \ +=20
>> file://src/hidapi/LICENSE.txt;md5=3D7c3949a631240cb6c31c50f3eb696077 \=20
>> +=20
>> file://src/hidapi/LICENSE-bsd.txt;md5=3Db5fa085ce0926bb50d0621620a82361f=
=20
>> \ +=20
>> file://src/video/yuv2rgb/LICENSE;md5=3D79f8f3418d91531e05f0fc94ca67e071=20
>> \ +" + +# arm-neon adds MIT license +LICENSE:append =3D "=20
>> ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', '& MIT', '', d)}"=20
>> +LIC_FILES_CHKSUM:append =3D " ${@bb.utils.contains('PACKAGECONFIG',=20
>> 'arm-neon',=20
>> 'file://src/video/arm/pixman-arm-neon-asm.h;md5=3D9a9cc1e51abbf1da58f4d9=
528ec9d49b;beginline=3D1;endline=3D24',=20
>> '', d)}" + +PROVIDES =3D "virtual/libsdl3" + +SRC_URI =3D=20
>> "http://www.libsdl.org/release/SDL3-${PV}.tar.gz" + +S =3D=20
>> "${WORKDIR}/SDL3-${PV}" + +SRC_URI[sha256sum] =3D=20
>> "13388fabb361de768ecdf2b65e52bb27d1054cae6ccb6942ba926e378e00db03" +=20
>> +inherit cmake lib_package binconfig-disabled pkgconfig=20
>> upstream-version-is-even + +CVE_PRODUCT =3D "simple_directmedia_layer=20
>> sdl" + +EXTRA_OECMAKE =3D " \ + -DSDL_OSS_DEFAULT=3DOFF \ +=20
>> -DSDL_DISKAUDIO=3DOFF \ + -DSDL_DUMMYVIDEO=3DOFF \ + -DSDL_RPI=3DOFF \ +=
=20
>> -DSDL_PTHREADS=3DON \ + -DSDL_RPATH=3DOFF \ + -DSDL_SNDIO=3DOFF \ +=20
>> -DSDL_X11_XCURSOR=3DOFF \ + -DSDL_X11_XDBE=3DOFF \ +=20
>> -DSDL_X11_XFIXES=3DOFF \ + -DSDL_X11_XINPUT=3DOFF \ +=20
>> -DSDL_X11_XRANDR=3DOFF \ + -DSDL_X11_XSCRNSAVER=3DOFF \ +=20
>> -DSDL_X11_XSHAPE=3DOFF \ +" + +# opengl packageconfig factored out to=20
>> make it easy for distros +# and BSP layers to pick either (desktop)=20
>> opengl, gles2, or no GL +PACKAGECONFIG_GL ?=3D=20
>> "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}" +=20
>> +PACKAGECONFIG:class-native =3D "x11 ${PACKAGECONFIG_GL}"=20
>> +PACKAGECONFIG:class-nativesdk =3D=20
>> "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}=20
>> ${PACKAGECONFIG_GL}" +PACKAGECONFIG ??=3D " \ + ${PACKAGECONFIG_GL} \=20
>> + ${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio pipewire=20
>> x11 vulkan', d)} \ + ${@bb.utils.contains('DISTRO_FEATURES',=20
>> 'wayland', 'wayland gles2', '', d)} \ +=20
>> ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \ +"=20
>> +PACKAGECONFIG[alsa] =3D "-DSDL_ALSA=3DON,-DSDL_ALSA=3DOFF,alsa-lib,"=20
>> +PACKAGECONFIG[arm-neon] =3D "-DSDL_ARMNEON=3DON,-DSDL_ARMNEON=3DOFF"=20
>> +PACKAGECONFIG[gles2] =3D=20
>> "-DSDL_OPENGLES=3DON,-DSDL_OPENGLES=3DOFF,virtual/libgles2"=20
>> +PACKAGECONFIG[jack] =3D "-DSDL_JACK=3DON,-DSDL_JACK=3DOFF,jack"=20
>> +PACKAGECONFIG[kmsdrm] =3D "-DSDL_KMSDRM=3DON,-DSDL_KMSDRM=3DOFF,libdrm=20
>> virtual/libgbm" +# The hidraw support doesn't catch Xbox, PS4 and=20
>> Nintendo controllers, +# so we'll just use libusb when it's=20
>> available. +PACKAGECONFIG[libusb] =3D=20
>> "-DSDL_HIDAPI_LIBUSB=3DON,-DSDL_HIDAPI_LIBUSB=3DOFF,libusb1"=20
>> +PACKAGECONFIG[libdecor] =3D=20
>> "-DSDL_WAYLAND_LIBDECOR=3DON,-DSDL_WAYLAND_LIBDECOR=3DOFF,libdecor,libde=
cor"=20
>> +PACKAGECONFIG[opengl] =3D=20
>> "-DSDL_OPENGL=3DON,-DSDL_OPENGL=3DOFF,virtual/egl"=20
>> +PACKAGECONFIG[pipewire] =3D=20
>> "-DSDL_PIPEWIRE_SHARED=3DON,-DSDL_PIPEWIRE_SHARED=3DOFF,pipewire"=20
>> +PACKAGECONFIG[pulseaudio] =3D=20
>> "-DSDL_PULSEAUDIO=3DON,-DSDL_PULSEAUDIO=3DOFF,pulseaudio"=20
>> +PACKAGECONFIG[vulkan] =3D "-DSDL_VULKAN=3DON=20
>> -DSDL_RENDER_VULKAN=3DON,-DSDL_VULKAN=3DOFF -DSDL_RENDER_VULKAN=3DOFF"=20
>> +PACKAGECONFIG[wayland] =3D=20
>> "-DSDL_WAYLAND=3DON,-DSDL_WAYLAND=3DOFF,wayland-native wayland=20
>> wayland-protocols libxkbcommon" +PACKAGECONFIG[x11] =3D=20
>> "-DSDL_X11=3DON,-DSDL_X11=3DOFF,virtual/libx11 libxext libxrandr=20
>> libxrender" + +CFLAGS:append:class-native =3D " -DNO_SHARED_MEMORY" +=20
>> +FILES:${PN} +=3D "${datadir}/licenses/SDL3/LICENSE.txt" +=20
>> +BBCLASSEXTEND =3D "native nativesdk"
>>  --
>>  2.48.1
>>=20
>>=20
>>=20
>>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116024):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/116024>
> Mute This Topic: <https://lists.openembedded.org/mt/111678038/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-rruWITwmTzLghJKpQW1S
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Hi,</div><div><br></div><div>I hav=
e sent a patch to fix it.</div></div><div id=3D"geary-quote" dir=3D"auto"><=
br>On Mon, Mar 17 2025 at 12:18:56 +01:00:00, Martin Jansa via lists.openem=
bedded.org &lt;martin.jansa=3Dgmail.com@lists.openembedded.org&gt; wrote:<b=
r><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: =
break-spaces;">Hi,

in my world build without x11 in DISTRO_FEATURES this and
libsdl2-compat failed to build with:

-- SDL3 was configured with the following options:
<div>--=20
</div>-- Platform: Linux
-- 64-bit:   TRUE
-- Compiler: libsdl3/3.2.8/recipe-sysroot-native/usr/bin/aarch64-webos-linu=
x/aarch64-webos-linux-gcc
-- Revision: release-3.2.8-0-gf6864924f
-- Vendor:
<div>--=20
</div>-- Subsystems:
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
<div>--=20
</div>-- Options:
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
<div>--=20
</div>--  Build Shared Library: ON
--  Build Static Library: OFF
<div>--=20
</div>-- If something was not detected, although the libraries
-- were installed, then make sure you have set the
-- CMAKE_C_FLAGS and CMAKE_PREFIX_PATH CMake variables correctly.
<div>--=20
</div>CMake Error at cmake/macros.cmake:382 (message):
  SDL could not find X11 or Wayland development libraries on your system.
  This means SDL will not be able to create windows on a typical unix
  operating system.  Most likely, this is not wanted.

  On Linux, install the packages listed at
  <a href=3D"https://github.com/libsdl-org/SDL/blob/main/docs/README-linux.=
md#build-dependencies">https://github.com/libsdl-org/SDL/blob/main/docs/REA=
DME-linux.md#build-dependencies</a>


  If you really don't need desktop windows, the documentation tells you how
  to skip this check.
  <a href=3D"https://github.com/libsdl-org/SDL/blob/main/docs/README-cmake.=
md#cmake-fails-to-build-without-x11-or-wayland-support">https://github.com/=
libsdl-org/SDL/blob/main/docs/README-cmake.md#cmake-fails-to-build-without-=
x11-or-wayland-support</a>


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
&lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.org">f_l_k=3Dt=
-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote>
 v2: remove directfb from PACKAGECONFIG

 On Thu, Mar 13 2025 at 13:03:40 +01:00:00, Markus Volk &lt;<a href=3D"mail=
to:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt; --- .../recipes-graphics/libsdl3/libsdl3_3.2.8.bb | 83 =
+++++++++++++++++++ 1 file changed, 83 insertions(+) create mode 100644 met=
a-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb diff --git a/meta-oe/recipes=
-graphics/libsdl3/libsdl3_3.2.8.bb b/meta-oe/recipes-graphics/libsdl3/libsd=
l3_3.2.8.bb new file mode 100644 index 0000000000..9c4fa317a2 --- /dev/null=
 +++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb @@ -0,0 +1,83 @@ +=
SUMMARY =3D "Simple DirectMedia Layer" +DESCRIPTION =3D "Simple DirectMedia=
 Layer is a cross-platform multimedia \ +library designed to provide low le=
vel access to audio, keyboard, mouse, \ +joystick, 3D hardware via OpenGL, =
and 2D video framebuffer." +HOMEPAGE =3D "http://www.libsdl.org" +BUGTRACKE=
R =3D "http://bugzilla.libsdl.org/" + +SECTION =3D "libs" + +LICENSE =3D "Z=
lib &amp; BSD-2-Clause" +LIC_FILES_CHKSUM =3D "\ + file://LICENSE.txt;md5=
=3Dcbf0e3161523f9a9315b6b915c5c4457 \ + file://src/hidapi/LICENSE.txt;md5=
=3D7c3949a631240cb6c31c50f3eb696077 \ + file://src/hidapi/LICENSE-bsd.txt;m=
d5=3Db5fa085ce0926bb50d0621620a82361f \ + file://src/video/yuv2rgb/LICENSE;=
md5=3D79f8f3418d91531e05f0fc94ca67e071 \ +" + +# arm-neon adds MIT license =
+LICENSE:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', '&a=
mp; MIT', '', d)}" +LIC_FILES_CHKSUM:append =3D " ${@bb.utils.contains('PAC=
KAGECONFIG', 'arm-neon', 'file://src/video/arm/pixman-arm-neon-asm.h;md5=3D=
9a9cc1e51abbf1da58f4d9528ec9d49b;beginline=3D1;endline=3D24', '', d)}" + +P=
ROVIDES =3D "virtual/libsdl3" + +SRC_URI =3D "http://www.libsdl.org/release=
/SDL3-${PV}.tar.gz" + +S =3D "${WORKDIR}/SDL3-${PV}" + +SRC_URI[sha256sum] =
=3D "13388fabb361de768ecdf2b65e52bb27d1054cae6ccb6942ba926e378e00db03" + +i=
nherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-e=
ven + +CVE_PRODUCT =3D "simple_directmedia_layer sdl" + +EXTRA_OECMAKE =3D =
" \ + -DSDL_OSS_DEFAULT=3DOFF \ + -DSDL_DISKAUDIO=3DOFF \ + -DSDL_DUMMYVIDE=
O=3DOFF \ + -DSDL_RPI=3DOFF \ + -DSDL_PTHREADS=3DON \ + -DSDL_RPATH=3DOFF \=
 + -DSDL_SNDIO=3DOFF \ + -DSDL_X11_XCURSOR=3DOFF \ + -DSDL_X11_XDBE=3DOFF \=
 + -DSDL_X11_XFIXES=3DOFF \ + -DSDL_X11_XINPUT=3DOFF \ + -DSDL_X11_XRANDR=
=3DOFF \ + -DSDL_X11_XSCRNSAVER=3DOFF \ + -DSDL_X11_XSHAPE=3DOFF \ +" + +# =
opengl packageconfig factored out to make it easy for distros +# and BSP la=
yers to pick either (desktop) opengl, gles2, or no GL +PACKAGECONFIG_GL ?=
=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}" + +PACKAGECONFIG:=
class-native =3D "x11 ${PACKAGECONFIG_GL}" +PACKAGECONFIG:class-nativesdk =
=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} ${PACKAGECONFIG_GL}" =
+PACKAGECONFIG ??=3D " \ + ${PACKAGECONFIG_GL} \ + ${@bb.utils.filter('DIST=
RO_FEATURES', 'alsa pulseaudio pipewire x11 vulkan', d)} \ + ${@bb.utils.co=
ntains('DISTRO_FEATURES', 'wayland', 'wayland gles2', '', d)} \ + ${@bb.uti=
ls.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \ +" +PACKAGECONFIG[a=
lsa] =3D "-DSDL_ALSA=3DON,-DSDL_ALSA=3DOFF,alsa-lib," +PACKAGECONFIG[arm-ne=
on] =3D "-DSDL_ARMNEON=3DON,-DSDL_ARMNEON=3DOFF" +PACKAGECONFIG[gles2] =3D =
"-DSDL_OPENGLES=3DON,-DSDL_OPENGLES=3DOFF,virtual/libgles2" +PACKAGECONFIG[=
jack] =3D "-DSDL_JACK=3DON,-DSDL_JACK=3DOFF,jack" +PACKAGECONFIG[kmsdrm] =
=3D "-DSDL_KMSDRM=3DON,-DSDL_KMSDRM=3DOFF,libdrm virtual/libgbm" +# The hid=
raw support doesn't catch Xbox, PS4 and Nintendo controllers, +# so we'll j=
ust use libusb when it's available. +PACKAGECONFIG[libusb] =3D "-DSDL_HIDAP=
I_LIBUSB=3DON,-DSDL_HIDAPI_LIBUSB=3DOFF,libusb1" +PACKAGECONFIG[libdecor] =
=3D "-DSDL_WAYLAND_LIBDECOR=3DON,-DSDL_WAYLAND_LIBDECOR=3DOFF,libdecor,libd=
ecor" +PACKAGECONFIG[opengl] =3D "-DSDL_OPENGL=3DON,-DSDL_OPENGL=3DOFF,virt=
ual/egl" +PACKAGECONFIG[pipewire] =3D "-DSDL_PIPEWIRE_SHARED=3DON,-DSDL_PIP=
EWIRE_SHARED=3DOFF,pipewire" +PACKAGECONFIG[pulseaudio] =3D "-DSDL_PULSEAUD=
IO=3DON,-DSDL_PULSEAUDIO=3DOFF,pulseaudio" +PACKAGECONFIG[vulkan] =3D "-DSD=
L_VULKAN=3DON -DSDL_RENDER_VULKAN=3DON,-DSDL_VULKAN=3DOFF -DSDL_RENDER_VULK=
AN=3DOFF" +PACKAGECONFIG[wayland] =3D "-DSDL_WAYLAND=3DON,-DSDL_WAYLAND=3DO=
FF,wayland-native wayland wayland-protocols libxkbcommon" +PACKAGECONFIG[x1=
1] =3D "-DSDL_X11=3DON,-DSDL_X11=3DOFF,virtual/libx11 libxext libxrandr lib=
xrender" + +CFLAGS:append:class-native =3D " -DNO_SHARED_MEMORY" + +FILES:$=
{PN} +=3D "${datadir}/licenses/SDL3/LICENSE.txt" + +BBCLASSEXTEND =3D "nati=
ve nativesdk"
 --
 2.48.1


=20

</blockquote></div><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#116024): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/116024">https://lists.openembedded.org/g/openembed=
ded-devel/message/116024</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111678038/361=
8223">https://lists.openembedded.org/mt/111678038/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-rruWITwmTzLghJKpQW1S--


