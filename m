Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC7CC021BF
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 13:49:21 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.8244.1740491360037761096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 05:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout05.t-online.de (Postfix) with SMTP id 2CCF212F8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 14:49:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.232]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tmvJC-3sgT3b0; Tue, 25 Feb 2025 14:49:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][meta-gnome][PATCH 3/7] gnome-settings-daemon: update 47.3 -> 48.beta
Date: Tue, 25 Feb 2025 14:49:33 +0100
Message-ID: <20250225134937.2085793-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225134937.2085793-1-f_l_k@t-online.de>
References: <20250225134937.2085793-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1740491354-827FB97F-C1D8B9A6/0/0 CLEAN NORMAL
X-TOI-MSGID: fb5fad0f-74be-4392-be66-755e03126750
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 13:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115574

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

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...settings-daemon_47.1.bb =3D> gnome-settings-daemon_48.beta.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-da=
emon_47.1.bb =3D> gnome-settings-daemon_48.beta.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_47.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_48.beta.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings=
-daemon_47.1.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-d=
aemon_48.beta.bb
index bc279dff40..9804d7c112 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_47.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_48.beta.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit pulseaudio systemd gobject-intr=
ospection-data"
 GIR_MESON_OPTION =3D ""
=20
-SRC_URI[archive.sha256sum] =3D "f2aacbe55fa38e8708583eec0a6651049e537eb5=
05a3ed2ce0baa4e9b64246d1"
+SRC_URI[archive.sha256sum] =3D "786062f15f858feb97faa99ac58c5ccf80c92369=
62fc0f7a89ed71f946963822"
=20
 PACKAGECONFIG ??=3D " \
     cups nm \
--=20
2.48.1


