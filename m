Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07668C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 13:11:36 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.21068.1671455487914825653
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 05:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id D4B8F1E7BB
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 14:11:22 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.36.130]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7FvO-2FOh9x0; Mon, 19 Dec 2022 14:11:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 05/10] xdg-desktop-portal-wlr: add recipe
Date: Mon, 19 Dec 2022 14:10:36 +0100
Message-Id: <20221219131041.452949-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219131041.452949-1-f_l_k@t-online.de>
References: <20221219131041.452949-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671455482-68DE2991-C05795D7/0/0 CLEAN NORMAL
X-TOI-MSGID: 8eba2704-7ab9-4933-b7c3-6c27d4676725
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 13:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100098

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../xdg-desktop-portal-wlr_0.6.0.bb           | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/xdg-desktop-portal/xdg-deskto=
p-portal-wlr_0.6.0.bb

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-wlr_0.6.0.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-p=
ortal-wlr_0.6.0.bb
new file mode 100644
index 000000000..07650a139
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal-wlr_0=
.6.0.bb
@@ -0,0 +1,28 @@
+SUMMARY =3D "A xdg-desktop-portal backend for gnome."
+HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De316e9609dd7672b87ff25b46b2cf=
3e1"
+
+DEPENDS =3D " \
+    wayland \
+    wayland-native \
+    wayland-protocols \
+    libdrm \
+    libinih \
+    pipewire \
+    virtual/libgbm \
+"
+
+inherit meson pkgconfig
+
+SRC_URI =3D "git://github.com/emersion/xdg-desktop-portal-wlr.git;protoc=
ol=3Dhttps;nobranch=3D1"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "0a8bfa14607022a080f8b6eabc4757d1918d3cd9"
+
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}=
"
+
+PACKAGECONFIG[man-pages] =3D "-Dman-pages=3Denabled,-Dman-pages=3Ddisabl=
ed,scdoc-native"
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled"
+
+FILES:${PN} +=3D "${systemd_user_unitdir} ${datadir}"
--=20
2.34.1


