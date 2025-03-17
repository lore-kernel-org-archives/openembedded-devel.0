Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF55DC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 12:55:29 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.51657.1742216121910380851
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 05:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 832E8A81
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 13:55:19 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.174]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tu9zx-2EqK2r0; Mon, 17 Mar 2025 13:55:17 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl3: add fallback to console-build
Date: Mon, 17 Mar 2025 13:56:01 +0100
Message-ID: <20250317125601.1354282-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742216117-82FFB5E9-F0629585/10/3626336762 SUSPECT URL
X-TOI-MSGID: bb495c61-baaf-4de7-a0b4-480c5bafd626
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 12:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116025

This fixes a configure error if neither wayland nor x11 are available:

| CMake Error at cmake/macros.cmake:382 (message):
|   SDL could not find X11 or Wayland development libraries on your syste=
m.
|   This means SDL will not be able to create windows on a typical unix
|   operating system.  Most likely, this is not wanted.
|
|   On Linux, install the packages listed at
|   https://github.com/libsdl-org/SDL/blob/main/docs/README-linux.md#buil=
d-dependencies
|
|
|   If you really don't need desktop windows, the documentation tells you=
 how
|   to skip this check.
|   https://github.com/libsdl-org/SDL/blob/main/docs/README-cmake.md#cmak=
e-fails-to-build-without-x11-or-wayland-supp

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb b/meta-oe/=
recipes-graphics/libsdl3/libsdl3_3.2.8.bb
index 63a78907b0..86a0ae6b50 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb
@@ -55,9 +55,11 @@ PACKAGECONFIG ??=3D " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio pipewire x11 vul=
kan', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', '',=
 d)} \
 	${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
+	${@bb.utils.contains_any("DISTRO_FEATURES", "x11 wayland","","console-b=
uild",d)} \
 "
 PACKAGECONFIG[alsa]       =3D "-DSDL_ALSA=3DON,-DSDL_ALSA=3DOFF,alsa-lib=
,"
 PACKAGECONFIG[arm-neon]   =3D "-DSDL_ARMNEON=3DON,-DSDL_ARMNEON=3DOFF"
+PACKAGECONFIG[console-build] =3D "-DSDL_UNIX_CONSOLE_BUILD=3DON"
 PACKAGECONFIG[gles2]      =3D "-DSDL_OPENGLES=3DON,-DSDL_OPENGLES=3DOFF,=
virtual/libgles2"
 PACKAGECONFIG[jack]       =3D "-DSDL_JACK=3DON,-DSDL_JACK=3DOFF,jack"
 PACKAGECONFIG[kmsdrm]     =3D "-DSDL_KMSDRM=3DON,-DSDL_KMSDRM=3DOFF,libd=
rm virtual/libgbm"
--=20
2.48.1


