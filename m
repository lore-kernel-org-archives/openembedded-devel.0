Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1B4C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:51:02 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.5707.1742280657791621658
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 23:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout10.t-online.de (Postfix) with SMTP id D7A0912BE
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 07:50:55 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.234.59]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuQmt-1mJ5NJ0; Tue, 18 Mar 2025 07:50:55 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] babl: update 0.1.110 -> 0.1.112
Date: Tue, 18 Mar 2025 07:51:36 +0100
Message-ID: <20250318065137.46684-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742280655-AEFFB466-A0921D86/0/0 CLEAN NORMAL
X-TOI-MSGID: 517ab222-7ea2-4435-936f-e6ffb5c5e899
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 06:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116039

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gimp/babl/{babl_0.1.110.bb =3D> babl_0.1.112.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.110.bb =3D> babl_0.1.112.b=
b} (84%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.110.bb b/meta-gnome/re=
cipes-gimp/babl/babl_0.1.112.bb
similarity index 84%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.110.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.112.bb
index a15419c4a7..15d734f9eb 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.110.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.112.bb
@@ -10,7 +10,7 @@ inherit setuptools3 gnomebase gobject-introspection val=
a
 DEPENDS +=3D "lcms"
=20
 SRC_URI =3D "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] =3D "bf47be7540d6275389f66431ef03064df5376315e243d0ba=
b448c6aa713f5743"
+SRC_URI[sha256sum] =3D "fb696682421787c8fecc83e8aab48121dec8ee38d119b652=
91cfcbe315028a79"
=20
 FILES:${PN} +=3D "${libdir}/${BPN}-${@gnome_verdir("${PV}")}"
=20
--=20
2.48.1


