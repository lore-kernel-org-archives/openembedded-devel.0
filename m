Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A47CC021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 12:07:11 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.6568.1740485222358789931
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 04:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout02.t-online.de (Postfix) with SMTP id 80CBD933
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 13:07:00 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.232]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tmtiG-1rVdk90; Tue, 25 Feb 2025 13:07:00 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] xdg-desktop-portal-gnome: update 47.1 -> 47.3
Date: Tue, 25 Feb 2025 13:07:40 +0100
Message-ID: <20250225120740.1496523-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1740485220-47FFC92C-890AB757/0/0 CLEAN NORMAL
X-TOI-MSGID: 85cf0f74-fc6c-4e2a-a004-a15e84024954
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 12:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115569

this fixes a build error after xdg-desktop-portal update:
| ../xdg-desktop-portal-gnome-47.1/src/notification.c:72:3: error: too fe=
w arguments to function 'xdp_impl_notification_complete_add_notification'
|    72 |   xdp_impl_notification_complete_add_notification (object, invo=
cation);

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...op-portal-gnome_47.1.bb =3D> xdg-desktop-portal-gnome_47.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal=
-gnome_47.1.bb =3D> xdg-desktop-portal-gnome_47.3.bb} (89%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_47.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_47.3.bb
similarity index 89%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-por=
tal-gnome_47.1.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-gnome_47.3.bb
index 3e1213d7c8..215560ed4d 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_47.1.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_47.3.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-SRC_URI[archive.sha256sum] =3D "d420ff72173b04dc9491d3d7dd8cc96204f7f3f2=
7c4cbea6024361ea9839f769"
+SRC_URI[archive.sha256sum] =3D "9f6e4b14b583367c915e9494764f27cb84927faa=
3f9e6e018b93bbbcf3361e44"
=20
 PACKAGECONFIG ?=3D "screenshot screencast ${@bb.utils.filter('DISTRO_FEA=
TURES', 'wayland', d)}"
 PACKAGECONFIG[wayland] =3D ",,wayland-native"
--=20
2.48.1


