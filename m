Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EC8C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 09:20:05 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.195940.1698311995253275865
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 02:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout11.t-online.de (Postfix) with SMTP id DC27CE68
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 11:19:52 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.112]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qvwWt-10e7of0; Thu, 26 Oct 2023 11:19:52 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-control-center: Update 45.0 -> 45.1
Date: Thu, 26 Oct 2023 11:20:06 +0200
Message-ID: <20231026092007.791879-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1698311992-C4BE0DAC-A662BD08/0/0 CLEAN NORMAL
X-TOI-MSGID: 4817a567-128b-46ef-a4fc-bff52a3a4285
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 09:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105737

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 45.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

About
- Add more types of processor support

Accessibility
- Make Cursor Size dialog close on Escape key

Keyboard
- Allow closing Shortcuts dialog with Escape key

Mouse
- Fix linked style of primary mouse button in RTL languages
- Avoid making videos blurry

Network
- Fix editing connections without a device
- Revert "Disable DNS entry if automatic DNS option is enabled"

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nome-control-center_45.0.bb =3D> gnome-control-center_45.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_45.0.bb =3D> gnome-control-center_45.1.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_45.0.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_45.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_45.0.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_45.1.bb
index 29c9f3c48..34e054f99 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
45.1.bb
@@ -39,7 +39,7 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings ge=
ttext upstream-version-is
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] =3D "83df6a90f98914f2c19a872ce06562acef409276=
37f679c383099265ccfa42cf"
+SRC_URI[archive.sha256sum] =3D "d286c7627150e112aacbb4b7b91717fad8e89076=
061479dfc610b2dd744b577a"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups"
--=20
2.42.0


