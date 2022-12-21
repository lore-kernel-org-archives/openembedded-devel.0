Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA4BC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 05:32:51 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.12628.1671600767318868297
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 21:32:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id 582C619089
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 06:32:45 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.46.43]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7riR-1aVuKX0; Wed, 21 Dec 2022 06:32:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCHv4] xdg-desktop-portal-wlr: add recipe
Date: Wed, 21 Dec 2022 06:32:24 +0100
Message-Id: <20221221053224.28840-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671600752-3B7ED81E-3412E45E/0/0 CLEAN NORMAL
X-TOI-MSGID: 6469e212-2e24-48d2-98a4-d8e858a1802f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 05:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100173

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../xdg-desktop-portal-wlr_0.6.0.bb           | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-multimedia/recipes-support/xdg-desktop-portal-wl=
r/xdg-desktop-portal-wlr_0.6.0.bb

diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-d=
esktop-portal-wlr_0.6.0.bb b/meta-multimedia/recipes-support/xdg-desktop-=
portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb
new file mode 100644
index 000000000..b8cdf25c1
--- /dev/null
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.6.0.bb
@@ -0,0 +1,29 @@
+SUMMARY =3D "This provides screenshot/screencast xdg-desktop-portal back=
ends for wlroots."
+HOMEPAGE =3D "https://github.com/emersion/xdg-desktop-portal-wlr"
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
+PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
systemd', 'basu', d)}"
+
+PACKAGECONFIG[man-pages] =3D "-Dman-pages=3Denabled,-Dman-pages=3Ddisabl=
ed,scdoc-native"
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled -Dsd-bus-provider=3Dlibs=
ystemd,-Dsystemd=3Ddisabled"
+PACKAGECONFIG[basu] =3D "-Dsd-bus-provider=3Dbasu,,basu"
+
+FILES:${PN} +=3D "${systemd_user_unitdir} ${datadir}"
--=20
2.34.1


