Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79456C47258
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 09:11:57 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.8047.1704877916773596681
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jan 2024 01:11:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout11.t-online.de (Postfix) with SMTP id DF7FB1D1BF
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 10:11:53 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.230.233]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rNUcq-27uFYR0; Wed, 10 Jan 2024 10:11:52 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/5] gnome-control-center: update 45.1 -> 45.2
Date: Wed, 10 Jan 2024 10:11:44 +0100
Message-ID: <20240110091146.867242-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110091146.867242-1-f_l_k@t-online.de>
References: <20240110091146.867242-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1704877912-F8FF694C-190ABD09/0/0 CLEAN NORMAL
X-TOI-MSGID: 801c75a8-7815-4710-9a4c-63b9f6ee95d6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 09:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108213

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 45.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Apps
- Fix status page glitch on initialization
- Fix "File and Link Association" interface not reflecting changes

Background
- Improve background preview and chooser performance

Default Apps
- Fix undesired resetting of default apps during startup

Mouse
- Fix interference issue with scroll event in Mouse Test window

Network
- Close network editor when using non-native nm-connection-editor
- Show decoration buttons on empty-state (no network device found page)
- Share WPA3 (SAE) networks with QR Code
- Hide QR Code icon when connection is not successful
- Remove deprecated 'wpa-none'
- Fix route label alignments

Privacy
- Fix crash from free bug in the Camera page
- Fix potential crash on Bolt page visibility

Region
- Show preview measurement format in current locale

Sound
- Update mute state when setting mixer control for a stream

Users
- Show tooltip information for the Avatar widget
---
 ...nome-control-center_45.1.bb =3D> gnome-control-center_45.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_45.1.bb =3D> gnome-control-center_45.2.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_45.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_45.2.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_45.1.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_45.2.bb
index 8402fcea9..d146bc4bd 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
45.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
45.2.bb
@@ -38,7 +38,7 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings ge=
ttext upstream-version-is
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] =3D "d286c7627150e112aacbb4b7b91717fad8e89076=
061479dfc610b2dd744b577a"
+SRC_URI[archive.sha256sum] =3D "0cfa3c332d6edacb73d06c6b26ffca1078e86ff5=
9eac819b2931e0967753df70"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups"
--=20
2.43.0


