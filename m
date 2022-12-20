Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8511BC4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 07:05:11 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.45019.1671519902063181516
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 23:05:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout05.t-online.de (Postfix) with SMTP id B6CABA8D6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 08:04:44 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.229]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7Wg8-0T9BQ10; Tue, 20 Dec 2022 08:04:44 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCHv2] xdg-desktop-portal-wlr: add recipe
Date: Tue, 20 Dec 2022 08:04:35 +0100
Message-Id: <20221220070435.4929-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671519884-EEFEF7E2-1D316273/0/0 CLEAN NORMAL
X-TOI-MSGID: 574e53bd-7fbc-4785-81d3-840ba7db7342
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 07:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100125

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../xdg-desktop-portal-wlr_0.6.0.bb           | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-multimedia/recipes-support/xdg-desktop-portal-wl=
r/xdg-desktop-portal-wlr_0.6.0.bb

diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-d=
esktop-portal-wlr_0.6.0.bb b/meta-multimedia/recipes-support/xdg-desktop-=
portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb
new file mode 100644
index 000000000..9201e2823
--- /dev/null
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.6.0.bb
@@ -0,0 +1,28 @@
+SUMMARY =3D "This provides screenshot/screencast xdg-desktop-portal back=
ends for wlroots."
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


