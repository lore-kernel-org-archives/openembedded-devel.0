Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59CBC4167B
	for <webhook@archiver.kernel.org>; Sun,  5 Nov 2023 20:05:34 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.37803.1699214731615133465
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Nov 2023 12:05:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id 6371274FD
	for <openembedded-devel@lists.openembedded.org>; Sun,  5 Nov 2023 21:05:28 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.36.196]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzjN9-4A7hMR0; Sun, 5 Nov 2023 21:05:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/4] dconf-editor: Upgrade 43 -> 45.0.1
Date: Sun,  5 Nov 2023 21:05:41 +0100
Message-ID: <20231105200542.13519-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231105200542.13519-1-f_l_k@t-online.de>
References: <20231105200542.13519-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699214727-EF7FDDD2-9582527B/0/0 CLEAN NORMAL
X-TOI-MSGID: 3c45be69-981e-4401-9253-a5c0dc0c6cea
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 20:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106387

dconf-editor 45.0.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Fix string freeze break

dconf-editor 45.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Fix UI not displaying with latest GTK
Misc fixes and translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../dconf/{dconf-editor_43.0.bb =3D> dconf-editor_45.0.1.bb}    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/dconf/{dconf-editor_43.0.bb =3D> dconf-e=
ditor_45.0.1.bb} (63%)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_43.0.bb b/meta-g=
nome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
similarity index 63%
rename from meta-gnome/recipes-gnome/dconf/dconf-editor_43.0.bb
rename to meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
index 5b3764560..31226ef44 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf-editor_43.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
@@ -6,6 +6,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
     dconf \
+    desktop-file-utils-native \
     gtk+3 \
     glib-2.0 \
     libhandy\
@@ -13,7 +14,8 @@ DEPENDS =3D " \
=20
 inherit gnomebase vala gsettings bash-completion pkgconfig gtk-icon-cach=
e
=20
-SRC_URI[archive.sha256sum] =3D "935a3c2dd76cc2a93cd5aee9a54d3947fb111eb3=
96f4b63dc5f0ba8f8d099136"
+SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/45/${GNOMEBN}-${PV}.tar.${GNOME_=
COMPRESS_TYPE};name=3Darchive"
+SRC_URI[archive.sha256sum] =3D "1180297678eedae6217cc514a2638c187d2f1d1e=
f2720cb9079b740c429941dd"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
--=20
2.42.0


