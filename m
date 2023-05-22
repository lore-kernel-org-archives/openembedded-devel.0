Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FAD1C7EE2F
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 10:19:58 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.18669.1684750792397768233
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 03:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id 03B2C17D05
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 12:19:50 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.34.41]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q12dp-1SYrdh0; Mon, 22 May 2023 12:19:49 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 1/3] gnome-control-center: update 43.2 -> 44.1
Date: Mon, 22 May 2023 12:19:39 +0200
Message-Id: <20230522101941.766602-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684750789-FF7FEE62-23093CE4/0/0 CLEAN NORMAL
X-TOI-MSGID: 005d541d-165b-414a-82a7-ba43adc00a97
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 10:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102702

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ome-control-center_43.2.bb =3D> gnome-control-center_44.1.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_43.2.bb =3D> gnome-control-center_44.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_43.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_44.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_43.2.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_44.1.bb
index 830f3ec684..a64c2410a5 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
43.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
44.1.bb
@@ -37,9 +37,10 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings g=
ettext upstream-version-is
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] =3D "d7f256aba80a92c727b329fd01c8602da4b78f0f=
ddaec93fcd91096964700563"
+SRC_URI[archive.sha256sum] =3D "7abd365018e28679def60a5ecd3049db0fb85de6=
da49a96dadd21fba8db002e7"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
+PACKAGECONFIG[cups] =3D ",,cups,cups"
 PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayland=
"
=20
--=20
2.34.1


