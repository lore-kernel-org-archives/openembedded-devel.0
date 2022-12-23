Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D70C4167B
	for <webhook@archiver.kernel.org>; Fri, 23 Dec 2022 03:11:35 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.64323.1671765088493878317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Dec 2022 19:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout06.t-online.de (Postfix) with SMTP id 54EF941BC
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Dec 2022 04:11:26 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.43.10]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p8YSq-4MWH3Z0; Fri, 23 Dec 2022 04:11:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv2 1/3] xdg-desktop-portal-gnome: add recipe
Date: Fri, 23 Dec 2022 04:11:02 +0100
Message-Id: <20221223031104.13517-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671765076-FAC5D742-8A742E38/0/0 CLEAN NORMAL
X-TOI-MSGID: 936c871f-1cdd-44a1-b6b5-d892bd0a9649
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Dec 2022 03:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100196

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../xdg-desktop-portal-gnome_43.1.bb          | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-gnome/recipes-support/xdg-desktop-portal/xdg-des=
ktop-portal-gnome_43.1.bb

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_43.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_43.1.bb
new file mode 100644
index 000000000..52e0e1f1d
--- /dev/null
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_43.1.bb
@@ -0,0 +1,29 @@
+SUMMARY =3D "A xdg-desktop-portal backend for gnome."
+HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+DEPENDS =3D " \
+    glib-2.0-native \
+    gtk4\
+    xdg-desktop-portal \
+    libadwaita \
+    fontconfig \
+    gsettings-desktop-schemas \
+    gnome-desktop \
+    dconf \
+"
+
+inherit meson pkgconfig gsettings
+
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome.git;p=
rotocol=3Dhttps;nobranch=3D1"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "4fd5a8bf16b01c78ed19764415cb26d29aaf7eab"
+
+PACKAGECONFIG ?=3D ""
+
+PACKAGECONFIG[screenshot] =3D ",,,gnome-shell"
+PACKAGECONFIG[screencast] =3D ",,,mutter"
+
+FILES:${PN} +=3D "${systemd_user_unitdir} ${datadir}"
--=20
2.34.1


