Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF40C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 13:28:06 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.16437.1713965277853441881
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 06:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout10.t-online.de (Postfix) with SMTP id 40D0512D63
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 15:27:56 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.39.163]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rzcfA-2ItekL0; Wed, 24 Apr 2024 15:27:52 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-control-center: update 46.0.1 -> 46.1
Date: Wed, 24 Apr 2024 15:28:16 +0200
Message-ID: <20240424132816.3185-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713965272-7DFF93DD-CBB105B6/0/0 CLEAN NORMAL
X-TOI-MSGID: 6c507646-ebe6-435d-b745-5a092efb869b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 13:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110127

- add PACKAGECONFIGS for file-share and media-share

46.1
* Accessibility
 - Improve accessibility of "Typing" settings sliders

* Display
 - Fix crash when pressing Escape in the display settings

* Network
 - Add stable-ssid support for cloned-mac

* Privacy
 - Add build option to enable Location services
 - Fix opening of Help pages while viewing Privacy settings

* Sharing
 - Auto hide Sharing panel when Rygel AND gnome-user-share are not availa=
ble

* System
 - Don't show auto-timezone setting when Location services unavailable
 - Avoid unnecessary time-change requests
 - Fix issue with sensitivity of "Add" and "Enroll" Enterprise Login butt=
ons
 - Improve generated passwords capacity in Remote Desktop settings

* Wacom
 - Check for the right output connector name

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-control-center/gnome-control-center_46.1.bb         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_46.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_46.1.bb
index 838d041e0..87daec0c2 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.1.bb
@@ -44,6 +44,8 @@ PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FE=
ATURES', 'wayland', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups"
 PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayland=
"
+PACKAGECONFIG[file-share] =3D ",,,gnome-user-share"
+PACKAGECONFIG[media-share] =3D ",,,rygel-meta tumbler"
=20
 EXTRA_OEMESON +=3D "-Doe_sysroot=3D${STAGING_DIR_HOST}"
=20
@@ -69,4 +71,4 @@ FILES:${PN} +=3D " \
=20
 FILES:${PN}-dev +=3D "${datadir}/gettext"
=20
-RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla system-config-print=
er cups-pk-helper ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'gno=
me-user-share', '' , d)}"
+RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla system-config-print=
er cups-pk-helper"
--=20
2.44.0


