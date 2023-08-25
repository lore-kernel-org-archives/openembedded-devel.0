Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC38EE49A6
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 20:54:12 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.687.1692996848041721569
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 13:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout01.t-online.de (Postfix) with SMTP id 9E0AD1CAF0
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 22:54:06 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.212]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZdok-38mfuk0; Fri, 25 Aug 2023 22:54:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] xdg-desktop-portal: upgrade 1.16.0 -> 1.17.0
Date: Fri, 25 Aug 2023 22:53:55 +0200
Message-ID: <20230825205355.220438-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825205355.220438-1-f_l_k@t-online.de>
References: <20230825205355.220438-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692996846-061C4670-4E434D1D/0/0 CLEAN NORMAL
X-TOI-MSGID: 654c7596-7dbf-4411-84c3-f2d478dca561
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 20:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104613

This is a pre-release version. I'm not sure if it's a blocker, but it has
some nice features and as my tests have shown, it doesn't seem to require
patching the .pc file anymore. I'm not sure if this was fixed externally
and by now it would work with 1.16.0 without the patch.

In any case, being able to omit this is an improvement.

Remove the dbus-native dependency as it is needed only for tests and for =
that
we also would need to provide python3-dbusmock-native

Explicitly set the target directories for dbus-service-dir and flatpak-in=
terfaces-dir
to avoid this issue shown in log.do_configure:
Flatpak interfaces dir      : /home/flk/poky/build/tmp/work/corei7-64-pok=
y-linux/xdg-desktop-portal/1.17.0/recipe-sysroot/usr/share/dbus-1/interfa=
ces/

Changes in 1.17.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Released: 2023-08-04

- Drop the Autotools build. Meson is now the only supported build system.
- Rework how portal implementations are loaded. This new, more robust sys=
tem
  allows selecting specific backends for specific portals, and layering t=
hem
  when necessary. Platforms that provide portals implementation are encou=
raged
  to provide a suitable configuration file.
- Introduce a new Clipboard portal. This portal extends the Remote Deskto=
p
  portal by adding support for sharing clipboard between remote machines.
- Introduce a new Input Capture portal. This portal adds mechanisms for t=
aking
  control of input devices. The primary usage model is centered around th=
e
  InputLeap and Synergy use cases, where local devices are used to contro=
l
  remote displays.
- Stop using the deprecated GTimeVal struct
- Bump GLib dependency to 2.66
- Add an "accept-label" option the the Print portal. This lets apps sugge=
st a
  proper label to the print operation.
- Various fixes to the Global Shortcuts portal
- Support restoring remote desktop sessions
- Improve robustness of the OpenURI portal by validating more URIs
- The PipeWire dependency is now mandatory
- Various improvements for the test suite
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...p-portal-pc-in-add-pc_sysrootdir-dir.patch | 27 -------------------
 ...1.16.0.bb =3D> xdg-desktop-portal_1.17.0.bb} | 10 ++++---
 2 files changed, 6 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xdg-desktop-portal/xdg-deskto=
p-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
 rename meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.=
16.0.bb =3D> xdg-desktop-portal_1.17.0.bb} (82%)

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
similarity index 82%
rename from meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal=
_1.16.0.bb
rename to meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1=
.17.0.bb
index 0b3a93ab3..125ab23ee 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.=
0.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.17.=
0.bb
@@ -11,7 +11,6 @@ DEPENDS =3D " \
     libportal \
     geoclue \
     pipewire \
-    dbus-native \
     fuse3 \
     xmlto-native \
     flatpak \
@@ -29,15 +28,18 @@ inherit meson pkgconfig python3native features_check
=20
 SRC_URI =3D " \
 	git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dmain \
-	file://0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch \
 "
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
+	-Dflatpak-interfaces-dir=3D${datadir}/dbus-1/interfaces \
+	-Ddbus-service-dir=3D${datadir}/dbus-1/services \
+"
=20
 do_write_config:append() {
     cat >${WORKDIR}/meson-${PN}.cross <<EOF
--=20
2.41.0


