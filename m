Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BD9CF58E8
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:10 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.20384.1726844889987694787
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id BAAD2DE45
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfET-3JaG0P0; Fri, 20 Sep 2024 17:07:41 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 09/23] gnome-settings-daemon_46.0 -> 47.1
Date: Fri, 20 Sep 2024 17:08:08 +0200
Message-ID: <20240920150822.1131707-9-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726844861-85FF9467-696B5F98/0/0 CLEAN NORMAL
X-TOI-MSGID: d1481744-4b62-44b1-809f-6c328aa861de
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112413

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 47.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- meson: Fix project version
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 47.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
Power:
- Only update mutter backlight properties when the mutter
  backend is in use
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 47.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Port X11 tests to using Xwayland
- Translation updates
Power:
- Set backlight through Mutter APIs, drop gnome-rr
  dependency
Wwan:
- Fix memory access errors
Xsettings:
- Get UI scaling factor from a dedicated Mutter D-Bus API
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 47.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
Housekeeping:
- Improve string in OOM notifications
Sharing:
- Stop assigned services only when there is no
  network connection
- Fix building without systemd
Printing:
- Clear members of GsdPrintNotificationsManager

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...me-settings-daemon_46.0.bb =3D> gnome-settings-daemon_47.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-da=
emon_46.0.bb =3D> gnome-settings-daemon_47.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_46.0.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_47.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings=
-daemon_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-d=
aemon_47.1.bb
index d409e77ea..bc279dff4 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_47.1.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit pulseaudio systemd gobject-intr=
ospection-data"
 GIR_MESON_OPTION =3D ""
=20
-SRC_URI[archive.sha256sum] =3D "0b9a0f64fa18a8e7e09b4c95a3f754fa033c2cdb=
d2dc35701f0618572c1cb3d7"
+SRC_URI[archive.sha256sum] =3D "f2aacbe55fa38e8708583eec0a6651049e537eb5=
05a3ed2ce0baa4e9b64246d1"
=20
 PACKAGECONFIG ??=3D " \
     cups nm \
--=20
2.46.0


