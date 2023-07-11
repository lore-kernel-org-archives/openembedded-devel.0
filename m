Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F0DEB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 17:48:38 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.2645.1689097717099595240
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 10:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout01.t-online.de (Postfix) with SMTP id C5B9F2CB99
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 19:48:34 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.45.62]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qJHTW-20A8A50; Tue, 11 Jul 2023 19:48:34 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/3] gnome-control-center: upgrade 44.2 -> 44.3
Date: Tue, 11 Jul 2023 19:48:25 +0200
Message-Id: <20230711174827.53666-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1689097714-1301F931-DC90FC6F/0/0 CLEAN NORMAL
X-TOI-MSGID: b2a6c821-8d04-47ac-aa47-3b0fad3f0fa7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 17:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103729

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nome-control-center_44.2.bb =3D> gnome-control-center_44.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_44.2.bb =3D> gnome-control-center_44.3.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_44.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_44.3.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_44.2.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_44.3.bb
index b2c04c2f68..0066f5885f 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
44.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
44.3.bb
@@ -37,7 +37,7 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings ge=
ttext upstream-version-is
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] =3D "0623d7d21cfe970d2ef34420623545a5945b9892=
e641f9a011cecec21afda10c"
+SRC_URI[archive.sha256sum] =3D "066a65052fc3ecfae860025e85f797e6ab2b87a5=
8c4f8ab9c66ec20718a80c7a"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups"
--=20
2.34.1


