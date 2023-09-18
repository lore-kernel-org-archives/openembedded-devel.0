Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17F7CD13DD
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 21:52:17 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.4196.1695073931360784284
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 14:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id E7F873482C
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:52:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiMA0-3qxV280; Mon, 18 Sep 2023 23:52:04 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 08/18] xdg-desktop-portal: upgrade 1.16.0 -> 1.18.0
Date: Mon, 18 Sep 2023 23:51:43 +0200
Message-ID: <20230918215156.1920452-8-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918215156.1920452-1-f_l_k@t-online.de>
References: <20230918215156.1920452-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695073924-47FFE5E3-2D49B317/0/0 CLEAN NORMAL
X-TOI-MSGID: 28cf954a-6c03-493e-b80f-8086c5ea250a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 21:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104934

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...on.build-add-a-hack-for-crosscompile.patch | 28 +++++++++++++++++++
 ...p-portal-pc-in-add-pc_sysrootdir-dir.patch | 27 ------------------
 ...1.16.0.bb =3D> xdg-desktop-portal_1.18.0.bb} | 14 ++++++----
 3 files changed, 36 insertions(+), 33 deletions(-)
 create mode 100644 meta-oe/recipes-support/xdg-desktop-portal/xdg-deskto=
p-portal/0001-meson.build-add-a-hack-for-crosscompile.patch
 delete mode 100644 meta-oe/recipes-support/xdg-desktop-portal/xdg-deskto=
p-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
 rename meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.=
16.0.bb =3D> xdg-desktop-portal_1.18.0.bb} (77%)

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l/0001-meson.build-add-a-hack-for-crosscompile.patch b/meta-oe/recipes-su=
pport/xdg-desktop-portal/xdg-desktop-portal/0001-meson.build-add-a-hack-f=
or-crosscompile.patch
new file mode 100644
index 000000000..3410a8831
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-=
meson.build-add-a-hack-for-crosscompile.patch
@@ -0,0 +1,28 @@
+From 7abb3840ac2870fcfc174fbbd81c4209c838e1a9 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 18 Sep 2023 22:22:17 +0200
+Subject: [PATCH] meson.build: add a hack for cross-compiling
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate [cross-compile specific]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 760613a..d339d26 100644
+--- a/meson.build
++++ b/meson.build
+@@ -168,7 +168,7 @@ pkgconfig.generate(
+     'prefix': get_option('prefix'),
+     'datarootdir': dataroot_dir,
+     'datadir': '${prefix}/@0@'.format(get_option('datadir')),
+-    'interfaces_dir': '${datadir}/dbus-1/interfaces/',
++    'interfaces_dir': '${pc_sysrootdir}${datadir}/dbus-1/interfaces/',
+   },
+ )
+=20
+--=20
+2.41.0
+
diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch b/meta-oe/rec=
ipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-porta=
l-pc-in-add-pc_sysrootdir-dir.patch
deleted file mode 100644
index 1997d0ffe..000000000
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-=
xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 7727dbfef4dd7ced3958ae9ada59a8899976b12d Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Mon, 12 Dec 2022 18:40:31 +0100
-Subject: [PATCH] xdg-desktop-portal.pc.in: add pc_sysrootdir dir
-
----
-Upstream-Status: Pending
-
- xdg-desktop-portal.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xdg-desktop-portal.pc.in b/xdg-desktop-portal.pc.in
-index 585c0c8..15b5817 100644
---- a/xdg-desktop-portal.pc.in
-+++ b/xdg-desktop-portal.pc.in
-@@ -2,7 +2,7 @@ prefix=3D@prefix@
- datarootdir=3D@datarootdir@
- datadir=3D@datadir@
-=20
--interfaces_dir=3D${datadir}/dbus-1/interfaces/
-+interfaces_dir=3D${pc_sysrootdir}${datadir}/dbus-1/interfaces
-=20
- Name: xdg-desktop-portal
- Description: Desktop integration portal
---=20
-2.34.1
-
diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l_1.16.0.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-port=
al_1.18.0.bb
similarity index 77%
rename from meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal=
_1.16.0.bb
rename to meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1=
.18.0.bb
index 0b3a93ab3..b9173a9f3 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.=
0.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.=
0.bb
@@ -8,14 +8,12 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
 DEPENDS =3D " \
     json-glib \
     glib-2.0 \
+    flatpak \
     libportal \
     geoclue \
     pipewire \
-    dbus-native \
     fuse3 \
     xmlto-native \
-    flatpak \
-    python3-dbus-native \
 "
=20
 PORTAL_BACKENDS ?=3D " \
@@ -29,15 +27,19 @@ inherit meson pkgconfig python3native features_check
=20
 SRC_URI =3D " \
 	git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dmain \
-	file://0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch \
+	file://0001-meson.build-add-a-hack-for-crosscompile.patch \
 "
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "88af6c8ca4106fcf70925355350a669848e9fd5a"
+SRCREV =3D "a4b27063222b16652e73b422e5448d75335199ef"
=20
 FILES:${PN} +=3D "${libdir}/systemd ${datadir}/dbus-1"
=20
-EXTRA_OEMESON +=3D "--cross-file=3D${WORKDIR}/meson-${PN}.cross"
+EXTRA_OEMESON +=3D " \
+	--cross-file=3D${WORKDIR}/meson-${PN}.cross \
+	-Dflatpak-interfaces-dir=3D${STAGING_DATADIR}/dbus-1/interfaces \
+	-Ddbus-service-dir=3D${datadir}/dbus-1/services \
+"
=20
 do_write_config:append() {
     cat >${WORKDIR}/meson-${PN}.cross <<EOF
--=20
2.41.0


