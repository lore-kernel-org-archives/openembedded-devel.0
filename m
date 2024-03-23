Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB21ACD11DB
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 09:28:07 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.5712.1711186086495365476
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 02:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout10.t-online.de (Postfix) with SMTP id 19F9C40A2C
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 10:28:03 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnxfU-1TEO1Z0; Sat, 23 Mar 2024 10:28:00 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] libgweather4: update 4.4.0 -> 4.4.2
Date: Sat, 23 Mar 2024 10:28:22 +0100
Message-ID: <20240323092823.27010-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711186080-2EFFAC95-630EAFCD/0/0 CLEAN NORMAL
X-TOI-MSGID: 9b951ee8-5015-48ac-bed8-36bae5f43016
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 09:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109548

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{libgweather4_4.4.0.bb =3D> libgweather4_4.4.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libgweather/{libgweather4_4.4.0.bb =3D> =
libgweather4_4.4.2.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb b=
/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.2.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
rename to meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.2.bb
index c30edd15c..acf288528 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.2.bb
@@ -11,7 +11,7 @@ inherit gnomebase gsettings gobject-introspection gette=
xt gi-docgen vala feature
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 SRC_URI +=3D "file://0001-Allow-building-gir-in-cross-environments.patch=
"
-SRC_URI[archive.sha256sum] =3D "366e866ff2a708b894cfea9475b8e8ff54cb3e2b=
477ea72a8ade0dabee5f48a4"
+SRC_URI[archive.sha256sum] =3D "a6e427b4770ada48945f3aa906af710fc833cff0=
d42df91f1828302740d794ec"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
 VALA_MESON_OPTION =3D "enable_vala"
--=20
2.44.0


