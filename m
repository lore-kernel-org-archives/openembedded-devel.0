Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEF8C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 13:12:16 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.21093.1671455526622744933
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 05:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id 75BF920733
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 14:11:22 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.36.130]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7FvO-2FOh9y0; Mon, 19 Dec 2022 14:11:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 06/10] xdg-desktop-portal: add recipe
Date: Mon, 19 Dec 2022 14:10:37 +0100
Message-Id: <20221219131041.452949-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219131041.452949-1-f_l_k@t-online.de>
References: <20221219131041.452949-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671455482-68DE2991-6C410BCA/0/0 CLEAN NORMAL
X-TOI-MSGID: d4413d25-aa56-4c73-a830-9d10a33c765c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 13:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100104

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...p-portal-pc-in-add-pc_sysrootdir-dir.patch | 25 ++++++++++++
 .../xdg-desktop-portal_1.16.0.bb              | 40 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-support/xdg-desktop-portal/xdg-deskto=
p-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
 create mode 100644 meta-oe/recipes-support/xdg-desktop-portal/xdg-deskto=
p-portal_1.16.0.bb

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch b/meta-oe/rec=
ipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-porta=
l-pc-in-add-pc_sysrootdir-dir.patch
new file mode 100644
index 000000000..4b80c6e9f
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-=
xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
@@ -0,0 +1,25 @@
+From 7727dbfef4dd7ced3958ae9ada59a8899976b12d Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 12 Dec 2022 18:40:31 +0100
+Subject: [PATCH] xdg-desktop-portal.pc.in: add pc_sysrootdir dir
+
+---
+ xdg-desktop-portal.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xdg-desktop-portal.pc.in b/xdg-desktop-portal.pc.in
+index 585c0c8..15b5817 100644
+--- a/xdg-desktop-portal.pc.in
++++ b/xdg-desktop-portal.pc.in
+@@ -2,7 +2,7 @@ prefix=3D@prefix@
+ datarootdir=3D@datarootdir@
+ datadir=3D@datadir@
+=20
+-interfaces_dir=3D${datadir}/dbus-1/interfaces/
++interfaces_dir=3D${pc_sysrootdir}${datadir}/dbus-1/interfaces
+=20
+ Name: xdg-desktop-portal
+ Description: Desktop integration portal
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l_1.16.0.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-port=
al_1.16.0.bb
new file mode 100644
index 000000000..d026f3b61
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.=
0.bb
@@ -0,0 +1,40 @@
+SUMMARY =3D "A portal frontend service for Flatpak and possibly other de=
sktop containment frameworks."
+HOMEPAGE =3D "https://github.com/flatpak/xdg-desktop-portal"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+DEPENDS =3D " \
+    json-glib \
+    glib-2.0 \
+    libportal \
+    geoclue \
+    pipewire \
+    dbus-native \
+    fuse3 \
+    bubblewrap-native \
+    xmlto-native \
+    flatpak \
+    python3-dbus-native \
+    python3-dbusmock-native \
+"
+
+PORTAL_BACKENDS ?=3D " \
+	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'xdg-desktop-portal-=
wlr', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'gtk', 'xdg-desktop-portal-gnom=
e', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'gtk+3', 'xdg-desktop-portal-gn=
ome', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'gtk4', 'xdg-desktop-portal-gno=
me', '', d)} \
+"
+
+RDEPENDS:${PN} =3D "bubblewrap ${PORTAL_BACKENDS}"
+
+inherit meson pkgconfig python3native
+
+SRC_URI =3D " \
+	git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dmain \
+	file://0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch \
+"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "88af6c8ca4106fcf70925355350a669848e9fd5a"
+
+FILES:${PN} +=3D "${libdir}/systemd ${datadir}/dbus-1"
--=20
2.34.1


