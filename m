Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A4CC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 12:01:03 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.50604.1699704054377412882
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 04:00:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout06.t-online.de (Postfix) with SMTP id 38F0E1EDFE
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 13:00:52 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.215]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1mfR-4DuoAz0; Sat, 11 Nov 2023 13:00:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] ghex: Upgrade 3.18.4 -> 45.0
Date: Sat, 11 Nov 2023 13:01:16 +0100
Message-ID: <20231111120116.31517-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699704049-FB7FD850-F36DE1BE/0/0 CLEAN NORMAL
X-TOI-MSGID: 4b8332d1-7c24-422a-940c-461283d74151
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 12:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106552

- enable gi,vapi,api-documentation
- switch to gtk4

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb | 17 -----------------
 meta-gnome/recipes-gnome/ghex/ghex_45.0.bb   | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 17 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb
 create mode 100644 meta-gnome/recipes-gnome/ghex/ghex_45.0.bb

diff --git a/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb b/meta-gnome/re=
cipes-gnome/ghex/ghex_3.18.4.bb
deleted file mode 100644
index 08e50409e..000000000
--- a/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY =3D "GHex - a hex editor for GNOME"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
-
-GNOMEBASEBUILDCLASS =3D "meson"
-
-DEPENDS =3D " \
-    glib-2.0-native \
-    gtk+3 \
-"
-
-inherit gnomebase gsettings gtk-icon-cache gnome-help gettext upstream-v=
ersion-is-even
-
-SRC_URI[archive.md5sum] =3D "7e6ed808766bc18285bdc6999bdf0f15"
-SRC_URI[archive.sha256sum] =3D "c2d9c191ff5bce836618779865bee4059db81a3a=
0dff38bda3cc7a9e729637c0"
-
-FILES:${PN} +=3D "${datadir}/metainfo"
diff --git a/meta-gnome/recipes-gnome/ghex/ghex_45.0.bb b/meta-gnome/reci=
pes-gnome/ghex/ghex_45.0.bb
new file mode 100644
index 000000000..6d3e9b978
--- /dev/null
+++ b/meta-gnome/recipes-gnome/ghex/ghex_45.0.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "GHex - a hex editor for GNOME"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+
+
+DEPENDS =3D " \
+    desktop-file-utils-native  \
+    glib-2.0-native \
+    gtk4 \
+    libadwaita \
+"
+
+GIR_MESON_ENABLE_FLAG =3D 'enabled'
+GIR_MESON_DISABLE_FLAG =3D 'disabled'
+
+inherit gnomebase gsettings gtk-icon-cache gnome-help gettext gobject-in=
trospection vala gi-docgen
+
+SRC_URI[archive.sha256sum] =3D "05cecc4561ca40b257c5db31da9f68d696133efc=
0ae427ed82fb985a986e840e"
+
+FILES:${PN} +=3D "${libdir} ${datadir}/metainfo"
--=20
2.42.0


