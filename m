Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8E2C4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 09:28:19 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.50604.1699262897358712390
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 01:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id 3DDE12A71C
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Nov 2023 10:28:14 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.229.73]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzvtz-20k9ZJ0; Mon, 6 Nov 2023 10:28:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] rest: Upgrade 0.9.0 -> 0.9.1
Date: Mon,  6 Nov 2023 10:28:33 +0100
Message-ID: <20231106092833.1085995-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699262891-C0FF6E88-83BA6E92/0/0 CLEAN NORMAL
X-TOI-MSGID: 9cdcba0d-d759-4b29-b47a-c04f6c1a97a1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 09:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106405

- add missing dependencies
- drop soup2 support

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../rest/{rest_0.9.0.bb =3D> rest_0.9.1.bb}             | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta-gnome/recipes-gnome/rest/{rest_0.9.0.bb =3D> rest_0.9.1.bb} =
(61%)

diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.0.bb b/meta-gnome/rec=
ipes-gnome/rest/rest_0.9.1.bb
similarity index 61%
rename from meta-gnome/recipes-gnome/rest/rest_0.9.0.bb
rename to meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
index 2256a1899..375417d5f 100644
--- a/meta-gnome/recipes-gnome/rest/rest_0.9.0.bb
+++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
@@ -10,16 +10,13 @@ DEPENDS =3D " \
     gi-docgen-native \
     glib-2.0 \
     glib-2.0-native \
+    gtksourceview5 \
     json-glib \
+    libadwaita \
+    libsoup-3.0 \
     libxml2-native \
 "
=20
 inherit gnomebase gobject-introspection vala pkgconfig
=20
-PACKAGECONFIG_SOUP ?=3D "soup3"
-PACKAGECONFIG ??=3D "${PACKAGECONFIG_SOUP}"
-
-PACKAGECONFIG[soup2] =3D "-Dsoup2=3Dtrue,,libsoup-2.4"
-PACKAGECONFIG[soup3] =3D "-Dsoup2=3Dfalse,,libsoup-3.0"
-
-SRC_URI[archive.sha256sum] =3D "85b2bc9341128139539b53ee53f0533310bc9639=
2fd645863a040410b81ebe66"
+SRC_URI[archive.sha256sum] =3D "9266a5c10ece383e193dfb7ffb07b509cc1f5152=
1ab8dad76af96ed14212c2e3"
--=20
2.42.0


