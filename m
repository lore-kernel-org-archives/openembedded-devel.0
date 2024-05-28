Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7155C27C44
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 10:25:21 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.19006.1716891911662698582
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 03:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout02.t-online.de (Postfix) with SMTP id 32168F1F0
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 12:25:10 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.40.240]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBu0v-1bCWuY0; Tue, 28 May 2024 12:25:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] xdg-desktop-portal-gnome: update 46.1 -> 46.2
Date: Tue, 28 May 2024 12:25:43 +0200
Message-ID: <20240528102543.2444748-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240528102543.2444748-1-f_l_k@t-online.de>
References: <20240528102543.2444748-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716891905-473ED322-69EEB5B8/0/0 CLEAN NORMAL
X-TOI-MSGID: ce19fea3-e447-4cd6-934d-d3726dcb7762
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110585

Changes in 46.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Various behavioral and accessibility fixes to the ScreenCast portal dia=
log
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...op-portal-gnome_46.1.bb =3D> xdg-desktop-portal-gnome_46.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal=
-gnome_46.1.bb =3D> xdg-desktop-portal-gnome_46.2.bb} (89%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_46.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_46.2.bb
similarity index 89%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-por=
tal-gnome_46.1.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-gnome_46.2.bb
index 847907a5b..e1dd8afae 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_46.1.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_46.2.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-SRC_URI[archive.sha256sum] =3D "7e8d9623e9d96a89c0897616827cd441dcf28329=
27d38f135c722552b1172aa1"
+SRC_URI[archive.sha256sum] =3D "b5c65ea25e8483502d033a613be6dc6b71883ac0=
7f1a3e474ad18049c47d16d6"
=20
 PACKAGECONFIG ?=3D "screenshot screencast ${@bb.utils.filter('DISTRO_FEA=
TURES', 'wayland', d)}"
 PACKAGECONFIG[wayland] =3D ",,wayland-native"
--=20
2.45.1


