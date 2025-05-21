Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C7FC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 15:09:42 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.1506.1747840176071341742
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 08:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout03.t-online.de (Postfix) with SMTP id 43DC745D
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:09:33 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.59]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uHl4W-4TRWOv0; Wed, 21 May 2025 17:09:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl2-compat: update 2.32.52 -> 2.32.56
Date: Wed, 21 May 2025 17:09:24 +0200
Message-ID: <20250521150924.3819838-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747840172-427FA5E8-2B7397B9/0/0 CLEAN NORMAL
X-TOI-MSGID: 43d4ed0f-f292-4b52-abec-55295630d0ed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 15:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117572

2.32.56
This is a stable bugfix release, with the following changes:

    Fixed rendering in Mesen2
    Fixed brightness in ioquake3
    Fixed a hang at launch in the xemu emulator
    Fixed crackling and sped up audio in OpenRCT2
    Fixed fullscreen window positioning on Wayland with multiple displays
    Key events are now sent for dead keys on X11
    Fixed mouse wheel integer scrolling values
    Fixed a double-free when working with RLE surfaces
    Fixed a memory leak in SDL_LockTextureToSurface()
    Fixed sending SDL3 controller events to SDL2 applications

2.32.54
This is a stable bugfix release, with the following changes:

    sdl2_compat.pc was renamed to sdl2-compat.pc
    Fixed creating fullscreen exclusive windows
    Fixed relative mouse motion for Half-Life and mods on Windows
    Fixed crash during controller hotplug in RetroArch
    Fixed display scale under Wayland in ioquake3
    Default to using X11 for the UE5 editor, fixing mouse input
    Fixed SDL_SetWindowInputFocus() return value
    Improved accuracy of SDL_GetRenderDriverInfo()
    Improved handling of very slight mouse movements

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{libsdl2-compat_2.32.52.bb =3D> libsdl2-compat_2.32.56.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl2-compat_2.32.52.bb =3D> =
libsdl2-compat_2.32.56.bb} (85%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb b=
/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
similarity index 85%
rename from meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
index 4553ac14e1..7e3a06f34f 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
@@ -11,7 +11,7 @@ LICENSE =3D "Zlib"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D98241180d857fe975e4b60d44=
d6c01a5"
=20
 SRC_URI =3D "http://www.libsdl.org/release/sdl2-compat-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "eb02c4c47d90e7a2585a65c712cf4a08ff4c37c0a1efc17a=
f49d8ebde3292c23"
+SRC_URI[sha256sum] =3D "27e845b1b7dc0a91a85f1a1f18892ed205adb38caf767741=
eb258008d8264de0"
 S =3D "${WORKDIR}/sdl2-compat-${PV}"
=20
 DEPENDS +=3D "libsdl3"
@@ -23,7 +23,7 @@ inherit cmake pkgconfig upstream-version-is-even featur=
es_check
 REQUIRED_DISTRO_FEATURES =3D "opengl x11"
=20
 do_install:append() {
-	mv ${D}${libdir}/pkgconfig/sdl2_compat.pc ${D}${libdir}/pkgconfig/sdl2.=
pc
+	mv ${D}${libdir}/pkgconfig/sdl2-compat.pc ${D}${libdir}/pkgconfig/sdl2.=
pc
 }
=20
 FILES:${PN} +=3D "${datadir}/licenses"
--=20
2.49.0


