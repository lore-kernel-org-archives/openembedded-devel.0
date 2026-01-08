Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6BED185EF
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 13:00:41 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5775.1767877232323599237
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 05:00:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout06.t-online.de (Postfix) with SMTP id B0A8D11BD
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Jan 2026 14:00:07 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.236.196]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vdpcU-4BWrrd0; Thu, 8 Jan 2026 14:00:06 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH] xfce4-pulseaudio-plugin: unbreak build with pavucontrol6
Date: Thu,  8 Jan 2026 13:59:59 +0100
Message-ID: <20260108130000.4025163-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1767877206-497F98C9-F40B40AA/0/0 CLEAN NORMAL
X-TOI-MSGID: 23457297-7a82-422a-97f2-c8df8522bb9a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 13:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123271

'pavucontrol-6' requires gtk4 and thus also needs gpu acceleration
Only recommend to install pavucontrol if it would run

- remove x11 from DISTRO_FEATURES. There's no direct dependency on it
- add PACKAFECONFIG for libcanberra

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pulseaudio/xfce4-pulseaudio-plugin_0.5.1.bb           | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-=
plugin_0.5.1.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulsea=
udio-plugin_0.5.1.bb
index 8773cbcbb9..2fa76351a4 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_=
0.5.1.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_=
0.5.1.bb
@@ -7,7 +7,7 @@ XFCE_COMPRESS_TYPE =3D "xz"
=20
 inherit xfce-panel-plugin features_check
=20
-REQUIRED_DISTRO_FEATURES =3D "pulseaudio x11"
+REQUIRED_DISTRO_FEATURES =3D "pulseaudio"
=20
 DEPENDS +=3D "dbus-glib pulseaudio"
=20
@@ -15,8 +15,8 @@ SRC_URI[sha256sum] =3D "8e1f3a505f37aa3bc2816a58bec5f95=
55366f1c476f10eab59fd0e6581
=20
 PACKAGECONFIG ??=3D "libnotify"
 PACKAGECONFIG[libnotify] =3D "--enable-libnotify,--disable-libnotify,lib=
notify"
+PACKAGECONFIG[libcanberra] =3D "--enable-libcanberra,--disable-libcanber=
ra,libcanberra"
=20
-EXTRA_OECONF =3D "GLIB_COMPILE_RESOURCES=3D${STAGING_BINDIR_NATIVE}/glib=
-compile-resources \
-                "
+EXTRA_OECONF =3D "GLIB_COMPILE_RESOURCES=3D${STAGING_BINDIR_NATIVE}/glib=
-compile-resources"
=20
-RRECOMMENDS:${PN} =3D "pavucontrol"
+RRECOMMENDS:${PN} =3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'open=
gl vulkan', 'pavucontrol', '', d)}"
--=20
2.52.0


