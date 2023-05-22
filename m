Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996ADC7EE2D
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 10:19:58 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.18470.1684750794610194491
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 03:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id 0FAF0859A
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 12:19:53 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.34.41]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q12ds-1SYrdi0; Mon, 22 May 2023 12:19:52 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 2/3] mutter: update 43.1 -> 44.1
Date: Mon, 22 May 2023 12:19:40 +0200
Message-Id: <20230522101941.766602-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522101941.766602-1-f_l_k@t-online.de>
References: <20230522101941.766602-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684750792-FF7FEE62-1DD4780A/0/0 CLEAN NORMAL
X-TOI-MSGID: 7cc74eb2-94bd-4c52-87b4-b7d97fd05fe9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 10:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102703

- remove buildpath from enum-types

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mutter/{mutter_43.1.bb =3D> mutter_44.1.bb}          | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_43.1.bb =3D> mutter_44.1.=
bb} (89%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_43.1.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_44.1.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/mutter/mutter_43.1.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_44.1.bb
index 9b764c666b..1060e916a3 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_43.1.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_44.1.bb
@@ -25,7 +25,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "f2f08b252783948a5ecc82f00e9e935a61ebbf85=
64844bdd92788ab44aa78264"
+SRC_URI[archive.sha256sum] =3D "973aeafab42f06f934a0994fc84878958cdb4d27=
66a4c867a5ccdc547dd57056"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
@@ -60,7 +60,13 @@ PACKAGECONFIG[sm] =3D "-Dsm=3Dtrue, -Dsm=3Dfalse, libs=
m"
 PACKAGECONFIG[profiler] =3D "-Dprofiler=3Dtrue,-Dprofiler=3Dfalse,syspro=
f"
 PACKAGECONFIG[startup-notification] =3D "-Dstartup_notification=3Dtrue, =
-Dstartup_notification=3Dfalse, startup-notification, startup-notificatio=
n"
=20
-MUTTER_API_NAME =3D "mutter-11"
+MUTTER_API_NAME =3D "mutter-12"
+
+do_install:prepend() {
+    sed -i -e 's|${B}/||g' ${B}/clutter/clutter/clutter-enum-types.c
+    sed -i -e 's|${B}/||g' ${B}/src/meta-private-enum-types.c
+    sed -i -e 's|${B}/||g' ${B}/src/meta/meta-enum-types.c
+}
=20
 do_install:append() {
     # Add gir links in standard paths. That makes dependents life much e=
asier
--=20
2.34.1


