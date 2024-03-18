Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA61C54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 17:11:46 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.50752.1710781897471070596
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 10:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout06.t-online.de (Postfix) with SMTP id AD3D06973
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 18:11:35 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.150]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmGWM-23Orre0; Mon, 18 Mar 2024 18:11:34 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] xdg-desktop-portal-gnome: update 45.1 -> 46.0
Date: Mon, 18 Mar 2024 18:11:59 +0100
Message-ID: <20240318171204.30153-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318171204.30153-1-f_l_k@t-online.de>
References: <20240318171204.30153-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710781894-337FD937-7614EA1B/0/0 CLEAN NORMAL
X-TOI-MSGID: e06083d2-57fc-4830-b90c-488d29151537
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 17:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109406

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...op-portal-gnome_45.1.bb =3D> xdg-desktop-portal-gnome_46.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal=
-gnome_45.1.bb =3D> xdg-desktop-portal-gnome_46.0.bb} (89%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_45.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_46.0.bb
similarity index 89%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-por=
tal-gnome_45.1.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-gnome_46.0.bb
index a5477301b..c5040571c 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_45.1.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_46.0.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-SRC_URI[archive.sha256sum] =3D "3e9ca821044005fb37bd68ebe4ad196fc3d07283=
5581467a22a4879dac7b5fdd"
+SRC_URI[archive.sha256sum] =3D "5d2d533597d280b7370b8f74faa40097b292b003=
6dbd59166e1312230500bb8b"
=20
 PACKAGECONFIG ?=3D "screenshot screencast ${@bb.utils.filter('DISTRO_FEA=
TURES', 'wayland', d)}"
 PACKAGECONFIG[wayland] =3D ",,wayland-native"
--=20
2.44.0


