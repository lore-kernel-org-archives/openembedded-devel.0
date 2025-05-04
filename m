Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DB8C369DC
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 20:42:11 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.36184.1746391309410684483
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 May 2025 13:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout11.t-online.de (Postfix) with SMTP id 1EC6299C
	for <openembedded-devel@lists.openembedded.org>; Sun,  4 May 2025 22:41:47 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.230.78]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uBg9i-0jvAO10; Sun, 4 May 2025 22:41:46 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl3: update 3.2.10 -> 3.2.12
Date: Sun,  4 May 2025 22:41:39 +0200
Message-ID: <20250504204139.215914-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1746391306-D2FFAA54-76C40F65/0/0 CLEAN NORMAL
X-TOI-MSGID: 7c872ebe-585e-4a7d-b332-093078ef99d9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 May 2025 20:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117289

- do not disable xrandr to avoid:

| /home/flk/poky/build/tmp/work/corei7-64-poky-linux/libsdl3/3.2.12/SDL3-=
3.2.12/src/video/x11/SDL_x11messagebox.c:506:13: error: unknown type name=
 'XRRScreenResources'
|   506 |             XRRScreenResources *screen =3D X11_XRRGetScreenReso=
urcesCurrent(display, DefaultRootWindow(display));
|       |             ^~~~~~~~~~~~~~~~~~
| /home/flk/poky/build/tmp/work/corei7-64-poky-linux/libsdl3/3.2.12/SDL3-=
3.2.12/src/video/x11/SDL_x11messagebox.c:506:42: error: implicit declarat=
ion of function 'X11_XRRGetScreenResourcesCurrent' [-Wimplicit-function-d=
eclaration]
|   506 |             XRRScreenResources *screen =3D X11_XRRGetScreenReso=
urcesCurrent(display, DefaultRootWindow(display));
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
| /home/flk/poky/build/tmp/work/corei7-64-poky-linux/libsdl3/3.2.12/SDL3-=
3.2.12/src/video/x11/SDL_x11messagebox.c:506:42: error: initialization of=
 'int *' from 'int' makes pointer from integer without a cast [-Wint-conv=
ersion]
| /home/flk/poky/build/tmp/work/corei7-64-poky-linux/libsdl3/3.2.12/SDL3-=
3.2.12/src/video/x11/SDL_x11messagebox.c:507:13: error: unknown type name=
 'XRRCrtcInfo'
|   507 |             XRRCrtcInfo *crtc_info =3D X11_XRRGetCrtcInfo(displ=
ay, screen, screen->crtcs[0]);
|       |             ^~~~~~~~~~~
| /home/flk/poky/build/tmp/work/corei7-64-poky-linux/libsdl3/3.2.12/SDL3-=
3.2.12/src/video/x11/SDL_x11messagebox.c:507:38: error: implicit declarat=
ion of function 'X11_XRRGetCrtcInfo' [-Wimplicit-function-declaration]
|   507 |             XRRCrtcInfo *crtc_info =3D X11_XRRGetCrtcInfo(displ=
ay, screen, screen->crtcs[0]);
|       |                                      ^~~~~~~~~~~~~~~~~~
| /home/flk/poky/build/tmp/work/corei7-64-poky-linux/libsdl3/3.2.12/SDL3-=
3.2.12/src/video/x11/SDL_x11messagebox.c:507:80: error: request for membe=
r 'crtcs' in something not a structure or union
|   507 |             XRRCrtcInfo *crtc_info =3D X11_XRRGetCrtcInfo(displ=
ay, screen, screen->crtcs[0]);
|       |                                                                =
                ^~
| /home/flk/poky/build/tmp/work/corei7-64-poky-linux/libsdl3/3.2.12/SDL3-=
3.2.12/src/video/x11/SDL_x11messagebox.c:508:27: error: request for membe=
r 'width' in something not a structure or union
|   508 |             x =3D (crtc_info->width - data->dialog_width) / 2;
|       |                           ^~
| /home/flk/poky/build/tmp/work/corei7-64-poky-linux/libsdl3/3.2.12/SDL3-=
3.2.12/src/video/x11/SDL_x11messagebox.c:509:27: error: request for membe=
r 'height' in something not a structure or union
|   509 |             y =3D (crtc_info->height - data->dialog_height) / 3=
;
|       |

This is a stable bugfix release, with the following changes:

    Fixed crash if SDL_BlitSurfaceScaled() is used with a surface that ha=
s no pixels
    Removed timeout in SDL_RunOnMainThread()
    Allow rendering a zero sized source rectangle in the SDL render API
    Fixed texture colorspace when creating a texture from a surface with =
the SDL render API
    Renamed SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_UINT8 to SDL_=
PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER
    Allow a NULL shader entry point for SDL_GPUShaderCreateInfo, defaulti=
ng to the one used by SDL_shadercross
    Fixed failing to create a GPU device if the D3D12 debug layers aren't=
 available on Windows
    Added support for the share button on the GameSir-K1 FLUX controller
    Added support for the PowerA Battle Dragon Advanced Wireless Controll=
er
    Added support for the HORI Taiko No Tatsujin Drum Controller
    Fixed the Keychron K1 Pro System Control keyboard being detected as a=
 joystick
    Fixed right mouse button emulation when using a Wacom tablet in Windo=
ws Ink mode
    Fixed missing simulated mouse events using a Wacom tablet when Window=
s Ink mode is disabled
    Fixed process I/O redirection to NUL on Windows
    Key events are now sent for dead keys on X11
    Improved handling of window management edge conditions on X11
    Fixed message box location on multi-monitor configurations on X11
    Fixed XInput2 mouse tracking outside the window on X11
    Fixed window focus after showing a file dialog on macOS
    Ignore mouse clicks and motion on tooltip windows on macOS
    Fixed message boxes shown on a background thread on iOS
    Fixed Android audio crackling introduced in 3.2.10
    Fixed handling of SDL_HINT_ANDROID_ALLOW_RECREATE_ACTIVITY
    Fixed A/B/X/Y buttons on Nintendo 3DS
    Fixed building for Xbox One

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libsdl3/{libsdl3_3.2.10.bb =3D> libsdl3_3.2.12.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.10.bb =3D> libsdl3_=
3.2.12.bb} (96%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.10.bb b/meta-oe=
/recipes-graphics/libsdl3/libsdl3_3.2.12.bb
similarity index 96%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.10.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.12.bb
index b8844ca10d..38c1b12807 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.10.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.12.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "http://www.libsdl.org/release/SDL3-${PV}.t=
ar.gz"
=20
 S =3D "${WORKDIR}/SDL3-${PV}"
=20
-SRC_URI[sha256sum] =3D "f87be7b4dec66db4098e9c167b2aa34e2ca10aeb5443bdde=
95ae03185ed513e0"
+SRC_URI[sha256sum] =3D "9734f308e130c64a2b4df6bca5884c5aca577ee6c7c77ab3=
379474ea85e51f96"
=20
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-=
is-even
=20
@@ -37,7 +37,6 @@ EXTRA_OECMAKE =3D " \
 	-DSDL_X11_XDBE=3DOFF \
 	-DSDL_X11_XFIXES=3DOFF \
 	-DSDL_X11_XINPUT=3DOFF \
-	-DSDL_X11_XRANDR=3DOFF \
 	-DSDL_X11_XSCRNSAVER=3DOFF \
 	-DSDL_X11_XSHAPE=3DOFF \
 "
--=20
2.49.0


