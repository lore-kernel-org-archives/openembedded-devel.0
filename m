Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10560C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 07:56:51 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.38457.1710921402982410778
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 00:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout12.t-online.de (Postfix) with SMTP id 29DABF982
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 08:56:41 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.101]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmqoP-1yRzHd0; Wed, 20 Mar 2024 08:56:37 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-session: update 45.0 -> 46.0
Date: Wed, 20 Mar 2024 08:57:08 +0100
Message-ID: <20240320075709.12553-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710921397-87FFC968-80D97CC2/0/0 CLEAN NORMAL
X-TOI-MSGID: b1e7043b-f05d-4296-a520-d9c89ada99fc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 07:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109482

 - consolekit support was removed upstream
 - add PACKAGECONFIG for doc

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-session/gnome-session_45.0.bb       | 36 -------------------
 .../gnome-session/gnome-session_46.0.bb       | 34 ++++++++++++++++++
 2 files changed, 34 insertions(+), 36 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-session_=
45.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-session_=
46.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb=
 b/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb
deleted file mode 100644
index c5e27af58..000000000
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY =3D "GNOME session"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
-
-DEPENDS =3D " \
-    glib-2.0-native \
-    libxslt-native \
-    xmlto-native \
-    xtrans \
-    libice \
-    libsm \
-    virtual/libx11 \
-    gtk+3 \
-    gnome-desktop \
-    gsettings-desktop-schemas \
-    json-glib \
-"
-
-
-inherit gnomebase gettext gsettings upstream-version-is-even features_ch=
eck
-
-REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
-
-SRC_URI[archive.sha256sum] =3D "706d2ffcacac38553a3c0185793f5a2b4aac940b=
b5e789d953c9808163bef2f1"
-
-PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'systemd', 'consolekit',d)}"
-
-PACKAGECONFIG[consolekit] =3D "-Dconsolekit=3Dtrue, -Dconsolekit=3Dfalse=
, dbus-glib"
-PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Dsystemd_journal=3Dtrue, -=
Dsystemd=3Dfalse -Dsystemd_journal=3Dfalse, systemd"
-
-FILES:${PN} +=3D " \
-   ${datadir}/xdg-desktop-portal \
-    ${datadir}/xsessions \
-    ${datadir}/wayland-sessions \
-    ${systemd_user_unitdir} \
-"
diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb=
 b/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
new file mode 100644
index 000000000..94e639456
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
@@ -0,0 +1,34 @@
+SUMMARY =3D "GNOME session"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+
+DEPENDS =3D " \
+    glib-2.0-native \
+    xtrans \
+    libice \
+    libsm \
+    virtual/libx11 \
+    gtk+3 \
+    gnome-desktop \
+    json-glib \
+    systemd \
+"
+
+
+inherit gnomebase gettext gsettings upstream-version-is-even features_ch=
eck
+
+REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam gobject-introspection-d=
ata"
+
+SRC_URI[archive.sha256sum] =3D "c6e1624af6090bc4e1a191fe2268abfa7a8de078=
31ca7a57f217e679bf7b9a54"
+
+PACKAGECONFIG ??=3D ""
+
+PACKAGECONFIG[docbook] =3D "-Ddocbook=3Dtrue, -Ddocbook=3Dfalse"
+PACKAGECONFIG[man] =3D "-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native libxslt=
-native"
+
+FILES:${PN} +=3D " \
+   ${datadir}/xdg-desktop-portal \
+    ${datadir}/xsessions \
+    ${datadir}/wayland-sessions \
+    ${systemd_user_unitdir} \
+"
--=20
2.44.0


