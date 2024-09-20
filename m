Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC91C7885A
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:07:50 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.20363.1726844862606401528
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout05.t-online.de (Postfix) with SMTP id 7749724197
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfEQ-3JaG0H0; Fri, 20 Sep 2024 17:07:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 01/23] xdg-desktop-portal-gnome: update 46.2 -> 47.1
Date: Fri, 20 Sep 2024 17:08:00 +0200
Message-ID: <20240920150822.1131707-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726844858-74FF7467-F5606FA4/0/0 CLEAN NORMAL
X-TOI-MSGID: de413118-7011-42b6-9dd0-80364d193260
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112404

Changes in 47.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Fix the capabilities for the print dialog

Changes in 47.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Translation updates

Changes in 47.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Fix restoring last used folder in the File Chooser portal
- Fix selecting multiple window on single selection
- Do not block xdg-desktop-portal-gnome when connecting to Nautilus
- Fix incorrectly set mimetype in the File Chooser portal
- Translation updates

Changes in 47.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Use GNOME Shell's private API for the Notification portal
- Use Nautilus for the File Chooser portal
- Translation updates

Changes in 47.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Expose the new accent colors setting
- Various cleanups to the screencast widget
- Add support for the "supported_output_file_formats" option in the Print
  portal
- Fix default layout mode of the ScreenCast/Remote Desktop portal
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...op-portal-gnome_46.2.bb =3D> xdg-desktop-portal-gnome_47.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal=
-gnome_46.2.bb =3D> xdg-desktop-portal-gnome_47.1.bb} (89%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_46.2.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_47.1.bb
similarity index 89%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-por=
tal-gnome_46.2.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-gnome_47.1.bb
index e1dd8afae..3e1213d7c 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_46.2.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_47.1.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-SRC_URI[archive.sha256sum] =3D "b5c65ea25e8483502d033a613be6dc6b71883ac0=
7f1a3e474ad18049c47d16d6"
+SRC_URI[archive.sha256sum] =3D "d420ff72173b04dc9491d3d7dd8cc96204f7f3f2=
7c4cbea6024361ea9839f769"
=20
 PACKAGECONFIG ?=3D "screenshot screencast ${@bb.utils.filter('DISTRO_FEA=
TURES', 'wayland', d)}"
 PACKAGECONFIG[wayland] =3D ",,wayland-native"
--=20
2.46.0


