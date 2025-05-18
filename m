Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A50C3ABC9
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 06:33:13 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.25505.1747549990423768736
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 May 2025 23:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id CCEBAEB5
	for <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 08:33:07 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.160.15]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uGXa7-0kxVpZ0; Sun, 18 May 2025 08:33:07 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/3] babl: update 0.1.112 -> 0.1.114
Date: Sun, 18 May 2025 08:32:58 +0200
Message-ID: <20250518063300.58623-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747549987-58FF755F-19DF83CC/0/0 CLEAN NORMAL
X-TOI-MSGID: 44852e0f-b303-4877-ab4b-166a7860357e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 06:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117449

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gimp/babl/{babl_0.1.112.bb =3D> babl_0.1.114.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.112.bb =3D> babl_0.1.114.b=
b} (84%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.112.bb b/meta-gnome/re=
cipes-gimp/babl/babl_0.1.114.bb
similarity index 84%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.112.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.114.bb
index 15d734f9eb..172517517e 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.112.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.114.bb
@@ -10,7 +10,7 @@ inherit setuptools3 gnomebase gobject-introspection val=
a
 DEPENDS +=3D "lcms"
=20
 SRC_URI =3D "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] =3D "fb696682421787c8fecc83e8aab48121dec8ee38d119b652=
91cfcbe315028a79"
+SRC_URI[sha256sum] =3D "bcbb7786c1e447703db3bc7fa34d62d0d2d117b22f04d883=
4c7b2d5ded456487"
=20
 FILES:${PN} +=3D "${libdir}/${BPN}-${@gnome_verdir("${PV}")}"
=20
--=20
2.49.0


