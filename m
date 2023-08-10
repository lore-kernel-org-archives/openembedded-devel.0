Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E272C001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 01:33:03 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.8168.1691631181165241011
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Aug 2023 18:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout03.t-online.de (Postfix) with SMTP id 02FD558A63
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 03:32:59 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.9]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qTuXq-03KVjF0; Thu, 10 Aug 2023 03:32:58 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gvfs: update 1.51.1 -> 1.51.90
Date: Thu, 10 Aug 2023 03:32:20 +0200
Message-ID: <20230810013220.415091-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1691631178-2B827649-E8EA0FF5/0/0 CLEAN NORMAL
X-TOI-MSGID: 85d41681-a5dd-4b88-9aa9-87d11c717622
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 01:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104313

Major changes in 1.51.90
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Fix various memory leaks (wang xiaomeng)
* udisks2: Disconnect signal handlers to fix crashes when unmounting (Ond=
rej Holy)
* fuse: Include missing locale.h header (Ondrej Holy)
* Some other fixes and improvements (Ondrej Holy)
* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gvfs/{gvfs_1.51.1.bb =3D> gvfs_1.51.90.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.51.1.bb =3D> gvfs_1.51.90.b=
b} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.51.1.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.51.90.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.51.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.51.90.bb
index 32d47efd16..2d1048e12f 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.51.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.51.90.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} +=3D "gsettings-desktop-schemas"
=20
 SRC_URI =3D "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("=
${PV}")}/${BPN}-${PV}.tar.xz;name=3Darchive"
=20
-SRC_URI[archive.sha256sum] =3D "5baaf0cc81e2c690a726f7d5eb59eed48a33ea22=
0fd5378df93c556173a3c143"
+SRC_URI[archive.sha256sum] =3D "c05aaa7cf463540fb8c9097cf9b77d92f2c8e0de=
1dcd643afb14c1284f823bdd"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
--=20
2.41.0


