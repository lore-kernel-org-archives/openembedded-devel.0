Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EA6CD13D2
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 21:52:17 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.4025.1695073930041677102
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 14:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id 50AAD54F5
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:52:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiM9z-3qxV210; Mon, 18 Sep 2023 23:52:03 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 01/18] gvfs: upgrade 1.51.90 -> 1.52.0
Date: Mon, 18 Sep 2023 23:51:36 +0200
Message-ID: <20230918215156.1920452-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695073923-477FF5E3-6C511D33/0/0 CLEAN NORMAL
X-TOI-MSGID: 269a20ba-4e85-4c87-b85c-ceb6d60ce4f2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 21:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104927

---
 .../recipes-gnome/gvfs/{gvfs_1.51.90.bb =3D> gvfs_1.52.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.51.90.bb =3D> gvfs_1.52.0.b=
b} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.51.90.bb b/meta-gnome/r=
ecipes-gnome/gvfs/gvfs_1.52.0.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.51.90.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb
index 2d1048e12..d5103d865 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.51.90.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} +=3D "gsettings-desktop-schemas"
=20
 SRC_URI =3D "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("=
${PV}")}/${BPN}-${PV}.tar.xz;name=3Darchive"
=20
-SRC_URI[archive.sha256sum] =3D "c05aaa7cf463540fb8c9097cf9b77d92f2c8e0de=
1dcd643afb14c1284f823bdd"
+SRC_URI[archive.sha256sum] =3D "e40e2035a40bc51ce9e88eed05b025596e40bb4a=
af9bc632d12ce74fdb30b1f6"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
--=20
2.41.0


