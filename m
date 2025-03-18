Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE124C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 09:17:53 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.7342.1742289471282085350
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 02:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id DD7E6FD7
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 10:17:48 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.234.59]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuT52-2eYOYr0; Tue, 18 Mar 2025 10:17:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/4] msgraph: update 0.2.3 -> 0.3.3
Date: Tue, 18 Mar 2025 10:18:24 +0100
Message-ID: <20250318091827.831270-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742289468-237F45D8-E78167F1/0/0 CLEAN NORMAL
X-TOI-MSGID: af8a2934-0f32-4d11-8cfd-2d09ba3294ff
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 09:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116052

0.3.3 - Jan 27, 2025
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
- CI release service fix

0.3.2 - Jan 27, 2025
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
- Extended user service (photo, contacts, folders, find)
- Improved mail service
- Add rate limiting support

0.3.1 - Oct 02, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
 * Fix pkgconfig file using wrong api version

0.3.0 - Sep 30, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
NOTE: This needs a recent version of gvfs

 * Set select scopes during requests
 * Add support for business "Add to OneDrive" sharepoints

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../msgraph/{msgraph_0.2.3.bb =3D> msgraph_0.3.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/msgraph/{msgraph_0.2.3.bb =3D> msgraph_0=
.3.3.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.3.bb b/meta-gno=
me/recipes-gnome/msgraph/msgraph_0.3.3.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/msgraph/msgraph_0.2.3.bb
rename to meta-gnome/recipes-gnome/msgraph/msgraph_0.3.3.bb
index f3f66c3dcf..fe4faff356 100644
--- a/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.3.bb
+++ b/meta-gnome/recipes-gnome/msgraph/msgraph_0.3.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3000208d539ec0=
61b899bce1d9ce9404"
 inherit gnomebase gobject-introspection gi-docgen features_check
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "ed42e800cb7f0a07477cd9e3e744cdc1a240a6ad=
7ab96b8a875806267a9fddb0"
+SRC_URI[archive.sha256sum] =3D "37d7e12f2a990490aea21184f0b27e0b915ebb4e=
5096f4d6632c62051c054012"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.48.1


