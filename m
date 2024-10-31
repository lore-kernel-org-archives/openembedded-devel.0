Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A9AD767EF
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 17:05:29 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.17815.1730394322103122036
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 10:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout10.t-online.de (Postfix) with SMTP id 434C910AD
	for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 18:05:20 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.203]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t6Ybm-1YlI0n0; Thu, 31 Oct 2024 18:05:18 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] mpv: cleanup and improvements
Date: Thu, 31 Oct 2024 18:07:26 +0100
Message-ID: <20241031170726.486250-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1730394318-F27FA445-57AE5B72/0/0 CLEAN NORMAL
X-TOI-MSGID: 5c0361f6-f0dd-4a79-8bbf-6739ec79df88
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 17:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113372

- add PACKAGECONFIG for lcms2
- fix dependencies for vulkan and vdpau
- replace leftover from autotools EXTRA_OECONF -> EXTRA_OEMESON
- vaapi-x-egl option has been removed
- gl-wayland option has been renamed to egl-wayland
- explicitly disable shaderc which is only required for windows builds

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.39.0.bb | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.39.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.39.0.bb
index c97252bd3..c699e73ef 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.39.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.39.0.bb
@@ -50,13 +50,14 @@ PACKAGECONFIG[drm] =3D "-Ddrm=3Denabled,-Ddrm=3Ddisab=
led,libdrm"
 PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled,virtual/libgbm"
 PACKAGECONFIG[lua] =3D "-Dlua=3Dluajit,-Dlua=3Ddisabled,luajit"
 PACKAGECONFIG[libarchive] =3D "-Dlibarchive=3Denabled,-Dlibarchive=3Ddis=
abled,libarchive"
+PACKAGECONFIG[lcms2] =3D "-Dlcms2=3Denabled,-Dlcms2=3Ddisabled,lcms"
 PACKAGECONFIG[libmpv] =3D "-Dlibmpv=3Dtrue,-Dlibmpv=3Dfalse"
 PACKAGECONFIG[jack] =3D "-Djack=3Denabled,-Djack=3Ddisabled,jack"
 PACKAGECONFIG[pipewire] =3D "-Dpipewire=3Denabled,-Dpipewire=3Ddisabled,=
pipewire"
 PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddisabled,puls=
eaudio"
 PACKAGECONFIG[vaapi] =3D "-Dvaapi=3Denabled,-Dvaapi=3Ddisabled,libva"
-PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,shader=
c"
-PACKAGECONFIG[vdpau] =3D "-Dvdpau=3Denabled,-Dvdpau=3Ddisabled,libvdpau"
+PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan=
-headers"
+PACKAGECONFIG[vdpau] =3D "-Dvdpau=3Denabled,-Dvdpau=3Ddisabled,libvdpau =
nv-codec-headers"
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled,way=
land wayland-native libxkbcommon"
=20
 python __anonymous() {
@@ -72,16 +73,14 @@ python __anonymous() {
         extras.append(" -Dvaapi-x11=3Denabled")
     if "vaapi" in packageconfig and "drm" in packageconfig:
         extras.append(" -Dvaapi-drm=3Denabled")
-    if "vaapi" in packageconfig and "x11" in packageconfig and "egl" in =
packageconfig:
-        extras.append(" -Dvaapi-x-egl=3Denabled")
     if "vdpau" in packageconfig and "opengl" in packageconfig and "x11" =
in packageconfig:
         extras.append(" -Dvdpau-gl-x11=3Denabled")
     if "wayland" in packageconfig and "opengl" in packageconfig:
-        extras.append(" -Dgl-wayland=3Denabled")
+        extras.append(" -Degl-wayland=3Denabled")
     if "wayland" in packageconfig and "vaapi" in packageconfig:
         extras.append(" -Dvaapi-wayland=3Denabled")
     if extras:
-        d.appendVar("EXTRA_OECONF", "".join(extras))
+        d.appendVar("EXTRA_OEMESON", "".join(extras))
 }
=20
 #SIMPLE_TARGET_SYS =3D "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', '=
')}"
@@ -93,8 +92,8 @@ EXTRA_OEMESON =3D " \
     -Dcdda=3Ddisabled \
     -Duchardet=3Ddisabled \
     -Drubberband=3Ddisabled \
-    -Dlcms2=3Ddisabled \
     -Dvapoursynth=3Ddisabled \
+    -Dshaderc=3Ddisabled \
 "
=20
 do_configure:append() {
--=20
2.47.0


