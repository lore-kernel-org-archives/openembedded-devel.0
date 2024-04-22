Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D478EC04FF6
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 06:00:29 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.12008.1713765622113418162
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Apr 2024 23:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout02.t-online.de (Postfix) with SMTP id 1E64113D6E
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 08:00:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.11]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rymix-0eOXRr0; Mon, 22 Apr 2024 08:00:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/5] xdg-desktop-portal-gnome: update 46.0 -> 46.1
Date: Mon, 22 Apr 2024 08:00:39 +0200
Message-ID: <20240422060041.222739-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240422060041.222739-1-f_l_k@t-online.de>
References: <20240422060041.222739-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713765619-70F0ED2B-B043E1EF/0/0 CLEAN NORMAL
X-TOI-MSGID: a4c83e40-a826-4d33-8bb7-a654518feb15
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 06:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110078

Changes in 46.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Remove D-Bus call timeout from Access portal requests that are proxied =
to
  GNOME Shell. This prevents the Access portal from failing requests if t=
he
  user doesn't click on a dialog for more than 25 seconds.
- Various fixes to the ScreenCast portal dialog
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...op-portal-gnome_46.0.bb =3D> xdg-desktop-portal-gnome_46.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal=
-gnome_46.0.bb =3D> xdg-desktop-portal-gnome_46.1.bb} (89%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_46.0.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_46.1.bb
similarity index 89%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-por=
tal-gnome_46.0.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-gnome_46.1.bb
index c5040571c..847907a5b 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_46.0.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_46.1.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-SRC_URI[archive.sha256sum] =3D "5d2d533597d280b7370b8f74faa40097b292b003=
6dbd59166e1312230500bb8b"
+SRC_URI[archive.sha256sum] =3D "7e8d9623e9d96a89c0897616827cd441dcf28329=
27d38f135c722552b1172aa1"
=20
 PACKAGECONFIG ?=3D "screenshot screencast ${@bb.utils.filter('DISTRO_FEA=
TURES', 'wayland', d)}"
 PACKAGECONFIG[wayland] =3D ",,wayland-native"
--=20
2.44.0


