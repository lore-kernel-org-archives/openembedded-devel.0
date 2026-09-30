Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D2DCA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 07:26:51 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7887.1790753209125582784
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 00:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=bl2SO8EZ;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout06.t-online.de (Postfix) with SMTP id 8E73B2DD
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:26:13 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.219]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xBohd-2nLPUn0; Wed, 30 Sep 2026 09:26:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] ptyxis: add recipe
Date: Wed, 30 Sep 2026 09:26:03 +0200
Message-ID: <20260930072603.16075-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790753169-68FF6837-E0C0613E/0/0 CLEAN NORMAL
X-TOI-MSGID: 34667300-e710-4f56-bbc5-d759412db0a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790753173; i=f_l_k@t-online.de;
	bh=5Ihv4uyP+GtFxw4eCr7iuAPuXDPiRsMoUrdkP3kTR1o=;
	h=From:To:Subject:Date;
	b=bl2SO8EZcHON4F6pjoB9ey0On1TLQtQ5djp1vmvE8VL6mjStZeh5WytVdjfCWWLCa
	 zObfz+tcH69x4ixxxPk66tiXHkPKYgQ5+IsdNE0kRA9OPfiEiimteSo9aZDCbxGVd3
	 ApSQeWSZIBZTOYy9gt5RumrCY78WXoqXdI8OHKB5ZKaCVw0kbPAu26XeCNOjvIThPq
	 cbQ+BXOP404Agca7Tw0vXNVF5aJnY8puXQaWLDvSqLlsKDs5kYQGx4+66dLuo1aR06
	 XfMAyyz4pZncyEoo+ZM54eaCK2z8Y1hy/xujD9uOJUs1+h1AdiwX5cmkYFozIPGLPU
	 xKmEBieBo5WHQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 07:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130517

Ptyxis is a GTK 4 terminal for GNOME with first-class support for
containers. It is the default terminal in Fedora Workstation and
Ubuntu.

Build it from the release tarball.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/ptyxis/ptyxis_50.1.bb       | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/ptyxis/ptyxis_50.1.bb

diff --git a/meta-gnome/recipes-gnome/ptyxis/ptyxis_50.1.bb b/meta-gnome/=
recipes-gnome/ptyxis/ptyxis_50.1.bb
new file mode 100644
index 0000000000..5b80c7dd15
--- /dev/null
+++ b/meta-gnome/recipes-gnome/ptyxis/ptyxis_50.1.bb
@@ -0,0 +1,26 @@
+SUMMARY =3D "Ptyxis is a terminal for GNOME with first-class support for=
 containers"
+HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/ptyxis"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f0e2cd40e05189ec81232da84bd6=
e1a"
+
+GTKIC_VERSION =3D "4"
+inherit gnomebase gsettings pkgconfig gtk-icon-cache gettext
+REQUIRED_DISTRO_FEATURES =3D "opengl"
+
+DEPENDS =3D " \
+    desktop-file-utils-native \
+    gtk4-native \
+    glib-2.0 \
+    gsettings-desktop-schemas \
+    gtk4 \
+    json-glib \
+    libadwaita \
+    libportal \
+    vte \
+"
+
+SRC_URI[archive.sha256sum] =3D "73f4b76480644b2840415859a51d20cd7487b061=
9714f8defcd38212c3ddcffe"
+
+FILES:${PN} +=3D "${datadir}"
+
+RDEPENDS:${PN} +=3D "hicolor-icon-theme"
--=20
2.55.0


