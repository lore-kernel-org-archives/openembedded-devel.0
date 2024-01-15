Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462F9C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 18:24:13 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.90160.1705343049192770457
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 10:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout04.t-online.de (Postfix) with SMTP id 8A8FF139A5
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 19:24:06 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.169.126]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rPRcy-2E8KDj0; Mon, 15 Jan 2024 19:24:04 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/4] gvfs: update 1.52.1 -> 1.52.2
Date: Mon, 15 Jan 2024 19:24:00 +0100
Message-ID: <20240115182402.126946-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115182402.126946-1-f_l_k@t-online.de>
References: <20240115182402.126946-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1705343044-DF21A917-50760E78/0/0 CLEAN NORMAL
X-TOI-MSGID: f5456559-8422-4615-9977-9648d0c24278
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 18:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108292

Major changes in 1.52.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* smb: Fix livelock when mounting share without enough permissions (Ondre=
j Holy)
* smb: Fix moving files across filesystem boundaries (Ondrej Holy)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gvfs/{gvfs_1.52.1.bb =3D> gvfs_1.52.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.52.1.bb =3D> gvfs_1.52.2.bb=
} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.52.2.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.52.2.bb
index 627b499fe..b941f4f30 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.2.bb
@@ -19,7 +19,7 @@ RDEPENDS:${PN} +=3D "gsettings-desktop-schemas"
=20
 SRC_URI =3D "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("=
${PV}")}/${BPN}-${PV}.tar.xz;name=3Darchive"
=20
-SRC_URI[archive.sha256sum] =3D "cdbd4440f6d08792a6e7521244c17386e20bd537=
d375117099fc8fb68fe91741"
+SRC_URI[archive.sha256sum] =3D "a643aceaa053caac0d8eff9a015f636e4bd1bb09=
cfe27864e347db67460e7b91"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
--=20
2.43.0


