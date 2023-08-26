Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6201CC83F0B
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 00:05:22 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.39.1693008313478358034
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 17:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout07.t-online.de (Postfix) with SMTP id 97DE867D1
	for <openembedded-devel@lists.openembedded.org>; Sat, 26 Aug 2023 02:04:52 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.172.109]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZgnM-2CICvL0; Sat, 26 Aug 2023 02:04:52 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC[meta-oe][PATCH 3/3] xdg-desktop-portal: upgrade 1.16.0 -> 1.17.0
Date: Sat, 26 Aug 2023 02:04:33 +0200
Message-ID: <20230826000433.544757-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230826000433.544757-1-f_l_k@t-online.de>
References: <20230826000433.544757-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1693008292-ED7F82E6-248C07D4/0/0 CLEAN NORMAL
X-TOI-MSGID: 76ae2871-5982-4463-a5ac-bde37c26dece
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Aug 2023 00:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104615

This is a pre-release version. I'm not sure if it's a blocker, but it has
some nice features and if done like this we don't need to patch the .pc f=
iles
for flatpak and xdg-portal-desktop anymore.

I think being able to omit this is an improvement.

Remove the dbus-native dependency as it is needed only for tests and for =
that
we also would need to provide python3-dbusmock-native

Explicitly set the target directories for dbus-service-dir and
flatpak-interfaces-dir

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...p-portal-pc-in-add-pc_sysrootdir-dir.patch | 27 -------------------
 ...1.16.0.bb =3D> xdg-desktop-portal_1.17.0.bb} | 15 ++++++-----
 2 files changed, 8 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xdg-desktop-portal/xdg-deskto=
p-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
 rename meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.=
16.0.bb =3D> xdg-desktop-portal_1.17.0.bb} (73%)

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
al_1.17.0.bb
similarity index 73%
rename from meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal=
_1.16.0.bb
rename to meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1=
.17.0.bb
index 0b3a93ab3..daf52f72e 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.=
0.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.17.=
0.bb
@@ -8,10 +8,10 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
 DEPENDS =3D " \
     json-glib \
     glib-2.0 \
+    flatpak-native \
     libportal \
     geoclue \
     pipewire \
-    dbus-native \
     fuse3 \
     xmlto-native \
     flatpak \
@@ -27,17 +27,18 @@ RDEPENDS:${PN} =3D "bubblewrap rtkit ${PORTAL_BACKEND=
S}"
=20
 inherit meson pkgconfig python3native features_check
=20
-SRC_URI =3D " \
-	git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dmain \
-	file://0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch \
-"
+SRC_URI =3D "git://github.com/flatpak/xdg-desktop-portal.git;protocol=3D=
https;branch=3Dmain"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "88af6c8ca4106fcf70925355350a669848e9fd5a"
+SRCREV =3D "e31960ab3d3ecd3efeef1c97d1d40d94b866f4b7"
=20
 FILES:${PN} +=3D "${libdir}/systemd ${datadir}/dbus-1"
=20
-EXTRA_OEMESON +=3D "--cross-file=3D${WORKDIR}/meson-${PN}.cross"
+EXTRA_OEMESON +=3D " \
+	--cross-file=3D${WORKDIR}/meson-${PN}.cross \
+	-Dflatpak-interfaces-dir=3D${STAGING_DATADIR_NATIVE}/dbus-1/interfaces =
\
+	-Ddbus-service-dir=3D${datadir}/dbus-1/services \
+"
=20
 do_write_config:append() {
     cat >${WORKDIR}/meson-${PN}.cross <<EOF
--=20
2.41.0


