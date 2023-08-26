Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95609C83F11
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 00:48:12 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.681.1693010889772126877
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 17:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout09.t-online.de (Postfix) with SMTP id 679682040B
	for <openembedded-devel@lists.openembedded.org>; Sat, 26 Aug 2023 02:48:07 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.172.109]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZhT9-0ys8Fm0; Sat, 26 Aug 2023 02:48:03 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC2[meta-oe][PATCH 2/2] xdg-desktop-portal: upgrade 1.16.0 -> 1.17.0
Date: Sat, 26 Aug 2023 02:47:48 +0200
Message-ID: <20230826004748.578231-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230826004748.578231-1-f_l_k@t-online.de>
References: <20230826004748.578231-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1693010883-9A8249C6-1768EE20/0/0 CLEAN NORMAL
X-TOI-MSGID: e869f811-acc5-4f8a-82ed-81f37142cd2a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Aug 2023 00:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104621

This is a pre-release version. I'm not sure if it's a blocker, but it has
some nice features and if done like this we don't need to patch the .pc f=
iles
for flatpak and xdg-portal-desktop anymore.

I think being able to omit this is an improvement.

Remove the dbus-native and python3-dbus dependencies as  they are needed =
only
for tests and for that we also would need to provide python3-dbusmock-nat=
ive

Explicitly set the target directories for dbus-service-dir and
flatpak-interfaces-dir

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...l_1.16.0.bb =3D> xdg-desktop-portal_1.17.0.bb} | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.=
16.0.bb =3D> xdg-desktop-portal_1.17.0.bb} (74%)

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l_1.16.0.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-port=
al_1.17.0.bb
similarity index 74%
rename from meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal=
_1.16.0.bb
rename to meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1=
.17.0.bb
index 0b3a93ab3..ad946d6b2 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.=
0.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.17.=
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
@@ -27,17 +25,18 @@ RDEPENDS:${PN} =3D "bubblewrap rtkit ${PORTAL_BACKEND=
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
+	-Dflatpak-interfaces-dir=3D${STAGING_DATADIR}/dbus-1/interfaces \
+	-Ddbus-service-dir=3D${datadir}/dbus-1/services \
+"
=20
 do_write_config:append() {
     cat >${WORKDIR}/meson-${PN}.cross <<EOF
--=20
2.41.0


