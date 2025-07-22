Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14D0C83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 16:54:14 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.18838.1753203244574619186
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 09:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 7395E1C2C9
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 18:54:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.113]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ueGFW-0UEHLu0; Tue, 22 Jul 2025 18:53:54 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/3] gnome-control-center: update 48.0 -> 48.3
Date: Tue, 22 Jul 2025 18:53:43 +0200
Message-ID: <20250722165344.105075-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722165344.105075-1-f_l_k@t-online.de>
References: <20250722165344.105075-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1753203234-957E06D2-425E5472/0/0 CLEAN NORMAL
X-TOI-MSGID: 727ccf78-18cb-4671-b96e-4c4e22c9e26d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 16:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118696

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 48.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Various translation updates
- Various accessibility fixes

About
- Properly close System Details dialog supressing dispose warning

Common
- Fix use-after-free in CcPermissionInfobar

Colors
- Remote extra line below the device name

Global Shortcuts
- Discard request from invalid app ID

Wacom
- Plug stylus motion backlog array leak

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 48.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Various translation updates
- Wrap settings panel names in small window sizes
- Call g_type_ensure for a custom class
- Add rounded borders to illustrations

About
- Fix multiple GPU name display with NVIDIA GPU on Desktop PC

Apps
- Set bold style to the app name
- Hide preference group if no permissions are shown

Notifications
- Fix crash when modifying app settings multiple times

Power
- Change power saver icon to leaf (matching GNOME Shell)

System
- Improve password generation logic
- Use EFF's Wordlists for Random Passphrases for password generator

Users
- Don't crash when failing to crop avatar images

Wacom
- Get motion history from tablets in test drawing area

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 48.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Various translation updates

Keyboard
- Fix duplicated "Search" entries in the Custom Shortcuts

Network
- Fix bad memory access in wsec_size_group_clear()

Power
- Set suspend notice message visible by default

Printers
- Run printer details response callback when closing dialog

Wellbeing
- Don't make screen time row activatable
- Fix NAN handling for chart labels
- Fix chart height calculation for partially filled week

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nome-control-center_48.0.bb =3D> gnome-control-center_48.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_48.0.bb =3D> gnome-control-center_48.3.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_48.0.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_48.3.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_48.0.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_48.3.bb
index 340273aa33..d8d5849534 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
48.3.bb
@@ -39,7 +39,7 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings ge=
ttext gi-docgen upstream-
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] =3D "1652202db36a2be7441019b9daff3574e8042859=
8e82395a87418015a8c06624"
+SRC_URI[archive.sha256sum] =3D "c0698245a6420badd077c16ffb218860e457cd73=
00612718eabf9aba47222bae"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups system-config-printer cups-pk-helpe=
r"
--=20
2.50.1


