Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573FEC10F1E
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 09:52:32 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.46692.1671529950653853232
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 01:52:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout03.t-online.de (Postfix) with SMTP id 358479FFB
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 10:52:28 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.229]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7ZIR-4UmI7d0; Tue, 20 Dec 2022 10:52:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv3] xdg-desktop-portal: add recipe
Date: Tue, 20 Dec 2022 10:52:07 +0100
Message-Id: <20221220095207.34654-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671529947-4CC58B8C-1A4E8BB6/0/0 CLEAN NORMAL
X-TOI-MSGID: ac077121-1215-46f3-a276-38b838e7461a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 09:52:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100127

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...p-portal-pc-in-add-pc_sysrootdir-dir.patch | 25 +++++++++++
 .../xdg-desktop-portal_1.16.0.bb              | 41 +++++++++++++++++++
 2 files changed, 66 insertions(+)
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
index 000000000..84e04e9f2
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.=
0.bb
@@ -0,0 +1,41 @@
+SUMMARY =3D "A portal frontend service for Flatpak and possibly other de=
sktop containment frameworks."
+HOMEPAGE =3D "https://github.com/flatpak/xdg-desktop-portal"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+REQUIRED_DISTRO_FEATURES =3D "polkit"
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
+inherit meson pkgconfig python3native features_check
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


