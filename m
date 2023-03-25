Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E09C77B7E
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.17454.1679731392506598193
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id BD0EE18972
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:09 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrl-0RoPhL0; Sat, 25 Mar 2023 09:03:09 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 03/32] evince: update 43.1 -> 44.0
Date: Sat, 25 Mar 2023 09:02:27 +0100
Message-Id: <20230325080256.923752-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731389-8556AC08-88C6130D/0/0 CLEAN NORMAL
X-TOI-MSGID: 7cd8ad7b-ba06-4311-8e4a-ed0305958565
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101716

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/evince/{evince_43.1.bb =3D> evince_44.0.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_43.1.bb =3D> evince_44.0.=
bb} (91%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_43.1.bb b/meta-gnome/=
recipes-gnome/evince/evince_44.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/evince/evince_43.1.bb
rename to meta-gnome/recipes-gnome/evince/evince_44.0.bb
index b83c41192..1c7103c90 100644
--- a/meta-gnome/recipes-gnome/evince/evince_43.1.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_44.0.bb
@@ -6,6 +6,7 @@ DEPENDS =3D " \
     adwaita-icon-theme \
     appstream-glib \
     cairo \
+    desktop-file-utils-native \
     dbus \
     gdk-pixbuf \
     glib-2.0 \
@@ -33,7 +34,7 @@ REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DIS=
TRO_FEATURES', 'x11', 'open
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI[archive.sha256sum] =3D "6d75ca62b73bfbb600f718a098103dc6b813f905=
0b9594be929e29b4589d2335"
+SRC_URI[archive.sha256sum] =3D "339ee9e005dd7823a13fe21c71c2ec6d2c4cb745=
48026e4741eee7b2703e09da"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.34.1


