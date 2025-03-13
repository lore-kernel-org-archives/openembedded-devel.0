Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C427EC35FF3
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 07:43:48 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.9091.1741851821848852413
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 00:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id 0A3EA1036
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 08:43:38 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.231.110]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tsdE9-4WdEZE0; Thu, 13 Mar 2025 08:43:37 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][gnome48][meta-gnome][PATCH 8/8] gnome-settings-daemon: update 47.1 -> 48.rc
Date: Thu, 13 Mar 2025 08:44:11 +0100
Message-ID: <20250313074411.5600-8-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313074411.5600-1-f_l_k@t-online.de>
References: <20250313074411.5600-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741851817-DDFF9466-84D6909D/0/0 CLEAN NORMAL
X-TOI-MSGID: 47f58ac8-3bb3-4936-8511-58c70f31599e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 07:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115959

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 48.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
- Add schemas for global shortcuts
- Allow usage as subproject

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 48.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
- Fix deprecation warnings during build

Media-keys:
- Allow running custom commands in lock screen

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 48.alpha.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Brown paper bag release

Media keys:
- Fix crash on startup

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 48.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
- Icon hint improvements to notifications

Media keys:
- Improve HIG compliance of notification messages
- Add shortcuts for reboot and shutdown actions

Power:
- Improve HIG compliance of notification messages
- Resolve device paths outside of the backlight helper

Usb protection:
- Improve strings

Xsettings:
- Do not notify icon-theme property on high-contrast changes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 47.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates

Power:
- Fix possible invalid reads if backlight fails to initialize
- Handle broken upower more elegantly
- Test warning fixes

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...e-settings-daemon_47.1.bb =3D> gnome-settings-daemon_48.rc.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-da=
emon_47.1.bb =3D> gnome-settings-daemon_48.rc.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_47.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_48.rc.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings=
-daemon_47.1.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-d=
aemon_48.rc.bb
index bc279dff40..3c41b8d759 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_47.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_48.rc.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit pulseaudio systemd gobject-intr=
ospection-data"
 GIR_MESON_OPTION =3D ""
=20
-SRC_URI[archive.sha256sum] =3D "f2aacbe55fa38e8708583eec0a6651049e537eb5=
05a3ed2ce0baa4e9b64246d1"
+SRC_URI[archive.sha256sum] =3D "da7f0ce3688ac9f1b893e39ba0a43a2248e708ee=
210f843e30bf0a9d8439a5dd"
=20
 PACKAGECONFIG ??=3D " \
     cups nm \
--=20
2.48.1


