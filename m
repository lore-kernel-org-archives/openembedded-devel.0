Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E20C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 20:12:26 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.3157.1699733537045479435
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 12:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout11.t-online.de (Postfix) with SMTP id 618C0171B2
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 21:12:15 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.215]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1uKx-1i7E9p0; Sat, 11 Nov 2023 21:12:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-console: Add recipe
Date: Sat, 11 Nov 2023 21:12:23 +0100
Message-ID: <20231111201224.879226-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699733531-3BFFC95D-AB01C9B8/0/0 CLEAN NORMAL
X-TOI-MSGID: 11368467-e198-4f09-892e-46d102ac1821
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 20:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106570

gnome-console ist gnomes gtk4 terminal emulator

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-console/gnome-console_45.0.bb       | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-console/gnome-console_=
45.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb=
 b/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
new file mode 100644
index 000000000..3282a6d5d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
@@ -0,0 +1,26 @@
+SUMMARY =3D "GNOME Console"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f0e2cd40e05189ec81232da84bd6=
e1a"
+
+GTKIC_VERSION =3D "4"
+inherit gnomebase gsettings pkgconfig gtk-icon-cache
+
+DEPENDS =3D " \
+    desktop-file-utils-native \
+    glib-2.0 \
+    gsettings-desktop-schemas \
+    gtk4 \
+    hicolor-icon-theme \
+    libadwaita \
+    libgtop \
+    pcre2 \
+    vte9 \
+"
+
+SRC_URI[archive.sha256sum] =3D "e7462128d2df2324a1d748062c40429cd0504af0=
9e407067b33f3a9d0c59c8e1"
+
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
+PACKAGECONFIG[devel] =3D "-Ddevel=3Dtrue,-Ddevel=3Dfalse"
+
+FILES:${PN} +=3D "${datadir}"
--=20
2.42.0


