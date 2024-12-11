Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA34E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 19:04:05 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.2764.1733943839647291057
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 11:03:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id E53B511F8
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 20:03:57 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.33.231]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tLS02-0VntiL0; Wed, 11 Dec 2024 20:03:54 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gvfs: update 1.56.0 -> 1.56.1
Date: Wed, 11 Dec 2024 20:03:56 +0100
Message-ID: <20241211190356.43258-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1733943834-9BFFCB9C-5B57F13A/0/0 CLEAN NORMAL
X-TOI-MSGID: 9315c962-932b-45fd-9571-608728c6df11
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 19:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114284

Major changes in 1.56.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* udisks2: Increasing reference count when updating volume to fix crashes=
 (Ondrej Holy)
* onedrive: Use names instead of id for events to fix monitoring (Jan-Mic=
hael Brummer)
* onedrive: Add missing replace stream to fix crashes (Jan-Michael Brumme=
r)
* onedrive: Fix double free during cache rebuild to fix crashes (Jan-Mich=
ael Brummer)
* dav: Recognize the 409 status to fix creation of parent directories (Mi=
chael Terry)
* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gvfs/{gvfs_1.56.0.bb =3D> gvfs_1.56.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.56.0.bb =3D> gvfs_1.56.1.bb=
} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.56.0.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.56.1.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.56.0.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.56.1.bb
index a7a869eb58..9c1e77ac25 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.56.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.56.1.bb
@@ -19,7 +19,7 @@ RDEPENDS:${PN} +=3D "gsettings-desktop-schemas"
=20
 SRC_URI =3D "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("=
${PV}")}/${BPN}-${PV}.tar.xz;name=3Darchive"
=20
-SRC_URI[archive.sha256sum] =3D "441d2356c72616364cdb420af96199113a13ed9e=
146f2175fe373989adada39e"
+SRC_URI[archive.sha256sum] =3D "86731ccec679648f8734e237b1de190ebdee6e4c=
8c0f56f454c31588e509aa10"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
--=20
2.47.0


