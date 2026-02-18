Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A92E9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 11:35:01 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10178.1771414498577904770
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 03:34:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id 885ACF91
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 12:34:56 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.86]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vsfpX-3zBrnt0; Wed, 18 Feb 2026 12:34:55 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] libsdl3: update 3.2.30 -> 3.4.0
Date: Wed, 18 Feb 2026 12:34:48 +0100
Message-ID: <20260218113450.32876-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1771414495-A8FD25A5-CC461BA2/0/0 CLEAN NORMAL
X-TOI-MSGID: f85c3a5d-50e9-4c68-80b4-dc86c9f2f772
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 11:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124473

- dont explicitly disable xinput support to fix compilation if x11
  support is enabled (error: unknown type name 'XIRawEvent')

In addition to lots of bug fixes and general system improvements, this re=
lease has some major themes of improved interoperability between the 3D G=
PU API and the 2D rendering API, improved Emscripten support, improved pe=
n handling, and native support for PNG images.

Here is a full list of the API changes since the last release:
General:

    Added SDL_CreateAnimatedCursor() to create animated color cursors
    Added SDL_HINT_MOUSE_DPI_SCALE_CURSORS to automatically scale cursors=
 based on the display scale
    Added SDL_SetWindowProgressState(), SDL_SetWindowProgressValue(), SDL=
_GetWindowProgressState(), and SDL_GetWindowProgressValue() to show progr=
ess in the window's taskbar icon on Windows and Linux
    Added GPU device creation properties to enable the GPU API on older h=
ardware if you're not using these features:
        SDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN
        SDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN
        SDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_B=
OOLEAN
        SDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN
        SDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLE=
AN
    Added SDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER to enable con=
figuring Vulkan features when creating a GPU device
    Added SDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION=
_BOOLEAN to allow requiring Vulkan hardware acceleration when creating a =
GPU device
    Added SDL_GetGPUDeviceProperties() to query information from a GPU de=
vice:
        SDL_PROP_GPU_DEVICE_NAME_STRING
        SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING
        SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING
        SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING
    Added SDL_GetPixelFormatFromGPUTextureFormat() and SDL_GetGPUTextureF=
ormatFromPixelFormat()
    Added SDL_CreateGPURenderer() and SDL_GetGPURendererDevice() to creat=
e a 2D renderer for use with GPU rendering.
    Added SDL_CreateGPURenderState(), SDL_SetGPURenderStateFragmentUnifor=
ms(), SDL_SetGPURenderState(), and SDL_DestroyGPURenderState() to use fra=
gment shaders with a GPU 2D renderer
    Added SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_POINTER to create a 2D text=
ure from an existing GPU texture
    Added SDL_PROP_TEXTURE_GPU_TEXTURE_POINTER to get the GPU texture fro=
m a 2D texture when using the GPU 2D renderer
    Added support for YUV textures and HDR colorspaces to the GPU 2D rend=
erer
    Added support for textures with palettes, and SDL_GetTexturePalette()=
 and SDL_SetTexturePalette() to interact with them
    Added SDL_RenderTexture9GridTiled() to do tiled instead of stretched =
9-grid texture rendering
    Added SDL_GetDefaultTextureScaleMode() and SDL_SetDefaultTextureScale=
Mode() to set the texture scale mode for new textures
    Added SDL_GetRenderTextureAddressMode() and SDL_SetRenderTextureAddre=
ssMode() to change the texture addressing mode
    Added SDL_TEXTURE_ADDRESS_WRAP to allow wrapping of textures if the r=
enderer has SDL_PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN set
    The default YUV colorspace is BT.601 limited range, for compatibility=
 with SDL2
    Added SDL_SCALEMODE_PIXELART as an improved scaling algorithm for pix=
el art without introducing blurring
    Added SDL_FLIP_HORIZONTAL_AND_VERTICAL to flip a surface both horizon=
tally and vertically
    Added SDL_LoadPNG(), SDL_LoadPNG_IO(), SDL_SavePNG(), and SDL_SavePNG=
_IO() to load and save PNG images
    Added SDL_LoadSurface() and SDL_LoadSurface_IO() to detect BMP and PN=
G formats and load them as surfaces
    Added SDL_PROP_SURFACE_ROTATION_FLOAT to indicate the rotation needed=
 to display camera images upright
    Added SDL_RotateSurface() to create a rotated copy of a surface
    SDL_EVENT_WINDOW_EXPOSED now sets data1 to true if it is sent during =
live resizing
    Added SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED, which is sent when the=
 usable desktop bounds change
    Added SDL_EVENT_SCREEN_KEYBOARD_SHOWN, which is sent when the on-scre=
en keyboard has been shown
    Added SDL_EVENT_SCREEN_KEYBOARD_HIDDEN, which is sent when the on-scr=
een keyboard has been hidden
    Added pinch gesture events: SDL_EVENT_PINCH_BEGIN, SDL_EVENT_PINCH_UP=
DATE, SDL_EVENT_PINCH_END
    SDL_EVENT_AUDIO_DEVICE_ADDED will be sent during initialization for e=
ach audio device
    SDL_GetCameraPermissionState() returns SDL_CameraPermissionState inst=
ead of int
    Added SDL_PutAudioStreamDataNoCopy() to do more efficient audio strea=
m processing in some cases
    Added SDL_PutAudioStreamPlanarData() to add planar audio data instead=
 of interleaved data to an audio stream
    Added SDL_HINT_AUDIO_DEVICE_RAW_STREAM to signal that the OS shouldn'=
t do further audio processing, useful for applications that handle noise =
canceling, etc.
    Added SDL_PROP_AUDIOSTREAM_AUTO_CLEANUP_BOOLEAN to allow streams that=
 persist beyond the audio subsystem lifetime.
    Added enhanced support for 8BitDo controllers
    Added enhanced support for FlyDigi controllers
    Added enhanced support for Hand Held Legend SInput controllers
    Added support for wired Nintendo Switch 2 controllers when built with=
 libusb
    Added SDL_hid_get_properties() to associate SDL properties with HID d=
evices
    Added SDL_PROP_HIDAPI_LIBUSB_DEVICE_HANDLE_POINTER to query the libus=
b handle from an SDL_hid_device, if it's been opened with libusb
    Added SDL_SetRelativeMouseTransform() to add custom mouse input trans=
formation
    Added SDL_GetPenDeviceType() to determine whether a pen is on the scr=
een or on a separate touchpad
    SDL_HINT_MAIN_CALLBACK_RATE may be set to a floating point callback r=
ate
    Added SDL_GetEventDescription() to get an English description of an e=
vent, suitable for logging
    Added SDL_PROP_IOSTREAM_MEMORY_FREE_FUNC_POINTER to allow custom free=
ing of the memory used by SDL_IOFromMem() and SDL_IOFromConstMem()
    Added SDL_PROP_PROCESS_CREATE_WORKING_DIRECTORY_STRING to set the wor=
king directory for new processes
    Added verbose log output when the DEBUG_INVOCATION environment variab=
le is set to "1"
    Added SDL_AddAtomicU32()
    Added SDL_GetSystemPageSize() to get the system page size
    Added SDL_ALIGNED() to signal that data should have a specific alignm=
ent

Windows:

    Added SDL_HINT_RENDER_DIRECT3D11_WARP to enable D3D11 software raster=
ization
    Using SDL_InsertGPUDebugLabel(), SDL_PushGPUDebugGroup(), and SDL_Pop=
GPUDebugGroup() requires WinPixEventRuntime.dll to be in your PATH or in =
the same directory as your executable
    Added SDL_PROP_DISPLAY_WINDOWS_HMONITOR_POINTER so you can query the =
HMONITOR associated with a display
    SDL_HINT_AUDIO_DEVICE_STREAM_ROLE is used by the WASAPI audio driver =
to set the audio stream category
    Added SDL_HINT_AUDIO_DEVICE_RAW_STREAM to signal whether the OS audio=
 driver should do additional signal processing
    Added SDL_HINT_WINDOWS_RAW_KEYBOARD_EXCLUDE_HOTKEYS to allow disablin=
g some system hotkeys when in raw input mode
    SDL_HINT_WINDOWS_GAMEINPUT is disabled by default

macOS:

    Added SDL_HINT_MAC_PRESS_AND_HOLD to control whether holding down a k=
ey will repeat the pressed key or open the accents menu

Linux:

    Added atomic support for KMSDRM
    Added SDL_HINT_KMSDRM_ATOMIC to control whether KMSDRM will use atomi=
c functionality
    Added SDL_PROP_DISPLAY_WAYLAND_WL_OUTPUT_POINTER so you can query the=
 wl_output associated with a display

Emscripten:

    Added SDL_WINDOW_FILL_DOCUMENT to indicate that windows expand to fil=
l the whole browser window
    Added SDL_SetWindowFillDocument() to change whether windows expand to=
 fill the whole browser window
    Added SDL_PROP_WINDOW_CREATE_EMSCRIPTEN_CANVAS_ID_STRING to allow set=
ting the SDL canvas ID, and SDL_PROP_WINDOW_EMSCRIPTEN_CANVAS_ID_STRING t=
o query it on existing windows
    Added SDL_PROP_WINDOW_CREATE_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING to sp=
ecify where keyboard input is bound, and SDL_PROP_WINDOW_EMSCRIPTEN_KEYBO=
ARD_ELEMENT_STRING to query it on existing windows

iOS:

    SDL now supports window scenes, fixing the warning "CLIENT OF UIKIT R=
EQUIRES UPDATE"
    Added SDL_PROP_WINDOW_CREATE_WINDOWSCENE_POINTER to specify the windo=
w scene for a window

visionOS:

    The default refresh rate has been increased to 90Hz
    SDL_SetWindowSize() changes the size of the window on Vision Pro head=
sets

PlayStation 2:

    Added the following hints to control the display parameters: SDL_HINT=
_PS2_GS_WIDTH, SDL_HINT_PS2_GS_HEIGHT, SDL_HINT_PS2_GS_PROGRESSIVE, SDL_H=
INT_PS2_GS_MODE

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libsdl3/{libsdl3_3.2.30.bb =3D> libsdl3_3.4.0.bb}           | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.30.bb =3D> libsdl3_=
3.4.0.bb} (96%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.30.bb b/meta-oe=
/recipes-graphics/libsdl3/libsdl3_3.4.0.bb
similarity index 96%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.30.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.0.bb
index bb111050e1..8978fc4f2e 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.30.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.0.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "http://www.libsdl.org/release/SDL3-${PV}.t=
ar.gz"
=20
 S =3D "${UNPACKDIR}/SDL3-${PV}"
=20
-SRC_URI[sha256sum] =3D "4c3b09330d866dc52eb65b66259a6684ad387252ca8c5790=
1b3a2b534eb42e3d"
+SRC_URI[sha256sum] =3D "082cbf5f429e0d80820f68dc2b507a94d4cc1b4e70817b11=
9bbb8ec6a69584b8"
=20
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-=
is-even
=20
@@ -33,10 +33,8 @@ EXTRA_OECMAKE =3D " \
 	-DSDL_PTHREADS=3DON \
 	-DSDL_RPATH=3DOFF \
 	-DSDL_SNDIO=3DOFF \
-	-DSDL_X11_XCURSOR=3DOFF \
 	-DSDL_X11_XDBE=3DOFF \
 	-DSDL_X11_XFIXES=3DOFF \
-	-DSDL_X11_XINPUT=3DOFF \
 	-DSDL_X11_XSCRNSAVER=3DOFF \
 	-DSDL_X11_XSHAPE=3DOFF \
 "
--=20
2.52.0


