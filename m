Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EFDC4332F
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 09:30:41 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.11543.1670664636016653391
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Dec 2022 01:30:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 174A7FAEC
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 10:30:34 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.165]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3wBg-0uItsX0; Sat, 10 Dec 2022 10:30:28 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gnome-calculator: update 42.2 -> 43.0.1
Date: Sat, 10 Dec 2022 10:30:21 +0100
Message-Id: <20221210093021.132725-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670664628-C9C89B6F-86AA9B6C/0/0 CLEAN NORMAL
X-TOI-MSGID: 710cc5ad-1095-4b32-91e1-22434696613d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 09:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100026

build with libsoup3

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calculator_42.2.bb =3D> gnome-calculator_43.0.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_42.2.=
bb =3D> gnome-calculator_43.0.1.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_4=
2.2.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_43.0.=
1.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42=
.2.bb
rename to meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_43.0=
.1.bb
index 66a29a094..3459b6d5f 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_43.0.1.b=
b
@@ -7,8 +7,9 @@ SECTION =3D "x11/gnome"
 DEPENDS =3D " \
     yelp-tools-native \
     gtk4 \
-    libsoup-2.4 \
+    libsoup-3.0 \
     libgee \
+    libxml2 \
     libmpc \
     gtksourceview5 \
     libadwaita \
@@ -28,7 +29,7 @@ def gnome_verdir(v):
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "33dab1bca43658d66520958b0f674cb0ad3185cf=
d30c12e459e7f69481c5c6a0"
+SRC_URI[archive.sha256sum] =3D "02c12ded3cf5053d17537d95ec69587f4b919899=
d7726eceecdb4b47ffb1c90f"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
--=20
2.34.1


