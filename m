Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD5BD1680B
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 11:25:17 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8107.1767957909204295689
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 03:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout07.t-online.de (Postfix) with SMTP id 68F28E868
	for <openembedded-devel@lists.openembedded.org>; Fri,  9 Jan 2026 12:25:06 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.239.35]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1veAbx-2Bu0cT0; Fri, 9 Jan 2026 12:24:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH] xfce4-settings: rename libcanberra rrecommends
Date: Fri,  9 Jan 2026 12:24:52 +0100
Message-ID: <20260109112452.89120-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1767957897-C3FFC925-2F653D2D/0/0 CLEAN NORMAL
X-TOI-MSGID: 8a29d4c7-7fbc-4df0-ad8f-b9bbc6079448
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 11:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123293

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.=
bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
index 353ea9ed81..eab9687c81 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
 "
 PACKAGECONFIG[notify] =3D "--enable-libnotify,--disable-libnotify,libnot=
ify"
-PACKAGECONFIG[sound-setter] =3D "--enable-sound-settings, --disable-soun=
d-settings, libcanberra, libcanberra-gtk2 sound-theme-freedesktop"
+PACKAGECONFIG[sound-setter] =3D "--enable-sound-settings, --disable-soun=
d-settings, libcanberra, libcanberra sound-theme-freedesktop"
 PACKAGECONFIG[wayland] =3D "--enable-wayland, --disable-wayland, wayland=
-native"
=20
 FILES:${PN} +=3D " \
@@ -31,6 +31,5 @@ FILES:${PN} +=3D " \
 "
=20
 RRECOMMENDS:${PN} +=3D "adwaita-icon-theme"
-RRECOMMENDS:${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES','alsa','l=
ibcanberra-alsa','',d)}"
-RRECOMMENDS:${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES','pulseaud=
io','libcanberra-pulse','',d)}"
+RRECOMMENDS:${PN} +=3D "${@bb.utils.contains_any('DISTRO_FEATURES','alsa=
 pulseaudio','libcanberra','',d)}"
 RRECOMMENDS:${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES','systemd'=
,'xfce4-datetime-setter','',d)}"
--=20
2.52.0


