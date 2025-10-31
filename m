Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97428CCF9FE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 03:43:24 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.7087.1761882194469282882
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 20:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout07.t-online.de (Postfix) with SMTP id E9547F16E
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 04:43:02 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.215]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vEg2U-0aV6VV0; Fri, 31 Oct 2025 04:42:58 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] libsdl3: updat 3.2.24 -> 3.2.26
Date: Fri, 31 Oct 2025 04:42:42 +0100
Message-ID: <20251031034243.70918-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1761882178-CAFFAA4B-C2E23D68/0/0 CLEAN NORMAL
X-TOI-MSGID: 54f9a3d2-8a25-46e0-a39d-eb8d3fa2b18c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 03:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121220

This is a stable bugfix release, with the following changes:

    Improved validation and fixed memory leaks in the GPU subsystem
    Fixed a delay at shutdown when the mouse is grabbed under X11
    Do full rectangle intersection for empty rectangles
    Fixed destination coordinates when using scale with the software rend=
erer
    Clipboard callbacks are only called with the mime types they expect
    Fixed the Moonlander MK1 Keyboard being detected as a controller
    Fixed the 8BitDo Ultimate 2C Wireless Controller showing up twice on =
some systems
    Added a Linux mapping for the 8BitDo Pro 3 controller
    Fixed getting keyboard events from gamepads on iOS 26
    Added support for the Zenaim Arcade Controller
    Fixed emulated touch on Android
    Added a workaround for the Android 14 OS bug "java.lang.NullPointerEx=
ception android.view.View.onResolvePointerIcon"
    Fixed page alignment for the Android release archive
    Corrected texture colors on PS2

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libsdl3/{libsdl3_3.2.24.bb =3D> libsdl3_3.2.26.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.24.bb =3D> libsdl3_=
3.2.26.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.24.bb b/meta-oe=
/recipes-graphics/libsdl3/libsdl3_3.2.26.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.24.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.26.bb
index f556f332f8..47751ed57b 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.24.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.26.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "http://www.libsdl.org/release/SDL3-${PV}.t=
ar.gz"
=20
 S =3D "${UNPACKDIR}/SDL3-${PV}"
=20
-SRC_URI[sha256sum] =3D "81cc0fc17e5bf2c1754eeca9af9c47a76789ac5efdd165b3=
b91cbbe4b90bfb76"
+SRC_URI[sha256sum] =3D "dad488474a51a0b01d547cd2834893d6299328d2e30f479a=
3564088b5476bae2"
=20
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-=
is-even
=20
--=20
2.51.0


