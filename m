Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0807C47DD3
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 19:31:52 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.1703.1705951909201186286
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 11:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout10.t-online.de (Postfix) with SMTP id 906141EA7A
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 20:31:17 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.62]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rS00q-0XEiVm0; Mon, 22 Jan 2024 20:31:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] mpv: make buildable with lua-5.2
Date: Mon, 22 Jan 2024 20:31:08 +0100
Message-ID: <20240122193109.3041355-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122193109.3041355-1-f_l_k@t-online.de>
References: <20240122193109.3041355-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1705951876-0CA7E850-DFC7519B/0/0 CLEAN NORMAL
X-TOI-MSGID: 3e59a659-d9c5-49d8-abdb-6f146ba1fa8e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 19:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108375

mpv only supports lua-5.2, so it seems to primarily support luajit.
luajit is amazing and its performance compared to lua is outstanding
but since it uses specific asm code, there are some platforms that
are unsupported.

Add luajit for the buildable platforms and fallback to lua-5.2 to
unblock gui build for platforms that can't use luajit.

Add PACKAGECONFIG for luajit

Add LUA_DISABLE_FLAG to avoid having lua constantly disabled

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/mplayer/mpv_0.35.1.bb  | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.35.1.bb
index 0f50a6e8f..7ba6279aa 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
@@ -26,29 +26,29 @@ inherit waf pkgconfig mime-xdg
=20
 LDFLAGS:append:riscv64 =3D " -latomic"
=20
-LUA ?=3D "lua"
-LUA:mips64  =3D ""
-LUA:powerpc64  =3D ""
-LUA:powerpc64le  =3D ""
-LUA:riscv64  =3D ""
-LUA:riscv32  =3D ""
-LUA:powerpc  =3D ""
+LUA ?=3D "luajit"
+LUA:powerpc64  =3D "lua"
+LUA:powerpc64le  =3D "lua"
+LUA:riscv64  =3D "lua"
+LUA:riscv32  =3D "lua"
=20
 # Note: lua is required to get on-screen-display (controls)
 PACKAGECONFIG ??=3D " \
     ${LUA} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl', ''=
, d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl x11', d)} \
 "
=20
+LUA_DISABLE_FLAG =3D "${@bb.utils.contains_any('LUA', 'lua luajit', '', =
'--disable-lua', d)}"
+
 PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,virtual/libx11 xsp li=
bxv libxscrnsaver libxinerama libxpresent libxext"
 PACKAGECONFIG[xv] =3D "--enable-xv,--disable-xv,libxv"
 PACKAGECONFIG[opengl] =3D "--enable-gl,--disable-gl,virtual/libgl"
 PACKAGECONFIG[egl] =3D "--enable-egl,--disable-egl,virtual/egl"
 PACKAGECONFIG[drm] =3D "--enable-drm,--disable-drm,libdrm"
 PACKAGECONFIG[gbm] =3D "--enable-gbm,--disable-gbm,virtual/libgbm"
-PACKAGECONFIG[lua] =3D "--enable-lua,--disable-lua,lua luajit"
+PACKAGECONFIG[lua] =3D "--enable-lua,${LUA_DISABLE_FLAG},lua-5.2"
+PACKAGECONFIG[luajit] =3D "--enable-lua,${LUA_DISABLE_FLAG},luajit"
 PACKAGECONFIG[libarchive] =3D "--enable-libarchive,--disable-libarchive,=
libarchive"
 PACKAGECONFIG[jack] =3D "--enable-jack, --disable-jack, jack"
 PACKAGECONFIG[vaapi] =3D "--enable-vaapi,--disable-vaapi,libva"
--=20
2.43.0


