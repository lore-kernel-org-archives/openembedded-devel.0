Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D17AC48BF6
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 15:14:03 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.74797.1709478840815464770
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Mar 2024 07:14:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout04.t-online.de (Postfix) with SMTP id B397B16418
	for <openembedded-devel@lists.openembedded.org>; Sun,  3 Mar 2024 16:13:58 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.233.233]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rgnXH-1Q5yRl0; Sun, 3 Mar 2024 16:13:55 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] folks: update 0.15.6 -> 0.15.7
Date: Sun,  3 Mar 2024 16:14:14 +0100
Message-ID: <20240303151414.1113671-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1709478835-49A21820-AF792A38/0/0 CLEAN NORMAL
X-TOI-MSGID: d80c9f89-acf3-4bb3-b143-7bd1d7eb24e4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 15:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109087

Overview of changes from libfolks 0.15.6 to libfolks 0.15.7
=EF=BF=BC=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=EF=BF=BC
Major changes:
  * Add .editorconfig file
  * Lots of translation updates
=EF=BF=BC
Bugs fixed:
  * bluez: Fix invalid ownership of property accessors in Device interfac=
e
  * tests/telepathy: Use shared_library() to fix g-ir-scanner which expec=
ts proper library

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../folks/{folks_0.15.6.bb =3D> folks_0.15.7.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/folks/{folks_0.15.6.bb =3D> folks=
_0.15.7.bb} (92%)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb b/meta=
-gnome/recipes-connectivity/folks/folks_0.15.7.bb
similarity index 92%
rename from meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb
rename to meta-gnome/recipes-connectivity/folks/folks_0.15.7.bb
index 5b9717f46..a22907178 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.7.bb
@@ -25,4 +25,4 @@ PACKAGECONFIG ??=3D ""
=20
 inherit pkgconfig gnomebase gettext gobject-introspection vala features_=
check
=20
-SRC_URI[archive.sha256sum] =3D "c866630c553f29ce9be1c7a60267cb4080a6bccf=
4b8d551dc4c7e6234d840248"
+SRC_URI[archive.sha256sum] =3D "120f219ef63212caa95ae7f6aeb64e29928b0b1a=
8b9452054304a00d0f347871"
--=20
2.43.0


