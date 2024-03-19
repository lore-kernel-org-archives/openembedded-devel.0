Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA9BC54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 09:09:58 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.10544.1710839392916872870
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Mar 2024 02:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id CE3C96FAC
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 10:09:49 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.227.144]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmVTb-0zhHLl0; Tue, 19 Mar 2024 10:09:43 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] tracker: update 3.6.0 -> 3.7.0
Date: Tue, 19 Mar 2024 10:10:08 +0100
Message-ID: <20240319091009.334076-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710839383-CA7FBDC7-E1A34DB0/0/0 CLEAN NORMAL
X-TOI-MSGID: 49c50032-b19f-4805-8d4e-d5a52b3f4479
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 09:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109475

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../tracker/{tracker_3.6.0.bb =3D> tracker_3.7.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.6.0.bb =3D> tracker_3=
.7.0.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb b/meta-gno=
me/recipes-gnome/tracker/tracker_3.7.0.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.7.0.bb
index 603efbb32..a41da6d46 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.7.0.bb
@@ -22,7 +22,7 @@ DEPENDS =3D " \
 inherit gettext gnomebase gobject-introspection vala gtk-doc bash-comple=
tion python3native
=20
 SRC_URI +=3D "file://0001-fix-reproducibility.patch"
-SRC_URI[archive.sha256sum] =3D "52592cfe19baffd16dbe47475be7da750dbd0b63=
33fd7acb60faa9da5bc40df2"
+SRC_URI[archive.sha256sum] =3D "46b8c16ff289d9507baa112c717845a200fe3d1f=
fcc2324562e02c40db9a151d"
=20
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
--=20
2.44.0


