Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BC7CD13DA
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 21:52:17 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.4028.1695073930360940697
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 14:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id E755654F0
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:52:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiMA0-3qxV270; Mon, 18 Sep 2023 23:52:04 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 07/18] xdg-desktop-portal-gnome: upgrade 44.1 -> 45.0
Date: Mon, 18 Sep 2023 23:51:42 +0200
Message-ID: <20230918215156.1920452-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918215156.1920452-1-f_l_k@t-online.de>
References: <20230918215156.1920452-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695073924-47FFE5E3-C6A2813A/0/0 CLEAN NORMAL
X-TOI-MSGID: c84874f1-0cc0-4637-847b-aa9b7f314960
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 21:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104931

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...al-gnome_44.1.bb =3D> xdg-desktop-portal-gnome_45.0.bb} | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal=
-gnome_44.1.bb =3D> xdg-desktop-portal-gnome_45.0.bb} (78%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_44.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_45.0.bb
similarity index 78%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-por=
tal-gnome_44.1.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-gnome_45.0.bb
index a8e8c83de..91469934d 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_44.1.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_45.0.bb
@@ -17,17 +17,14 @@ DEPENDS =3D " \
=20
 RDEPENDS:${PN} =3D "xdg-desktop-portal xdg-desktop-portal-gtk"
=20
-inherit meson pkgconfig gsettings features_check
+GNOMEBASEBUILDCLASS =3D "meson"
+inherit gnomebase pkgconfig gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome.git;p=
rotocol=3Dhttps;branch=3Dmain"
-
-S =3D "${WORKDIR}/git"
-SRCREV =3D "89203bf3522556965fc225782d1a635afdac611e"
+SRC_URI[archive.sha256sum] =3D "949598861c80000febf18cc12b3721c95c1bb1d1=
9371fc2156dc4f33def5aff0"
=20
 PACKAGECONFIG ?=3D "screenshot screencast ${@bb.utils.filter('DISTRO_FEA=
TURES', 'wayland', d)}"
-
 PACKAGECONFIG[wayland] =3D ",,wayland-native"
 PACKAGECONFIG[screenshot] =3D ",,,gnome-shell"
 PACKAGECONFIG[screencast] =3D ",,,mutter"
--=20
2.41.0


