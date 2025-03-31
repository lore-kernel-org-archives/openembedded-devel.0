Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6EDC36018
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 06:22:08 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.45674.1743402118209704605
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 23:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id 8A9538EB
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 08:21:55 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.73]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tz8Ws-0eB43G0; Mon, 31 Mar 2025 08:21:50 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] celluloid: add recipe
Date: Mon, 31 Mar 2025 08:22:37 +0200
Message-ID: <20250331062237.8115-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331062237.8115-1-f_l_k@t-online.de>
References: <20250331062237.8115-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1743402110-827FBACD-40DB51AE/10/3626336762 SUSPECT URL
X-TOI-MSGID: d1454323-a6de-47fb-a4c1-52cf07523db2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 06:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116394

Celluloid is a nice and clean gtk4/libadwaita frontend for mpv that impro=
ves
usability in gnome

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../celluloid/celluloid_0.2.7.bb              | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-gnome/recipes-extended/celluloid/celluloid_0.2.7=
.bb

diff --git a/meta-gnome/recipes-extended/celluloid/celluloid_0.2.7.bb b/m=
eta-gnome/recipes-extended/celluloid/celluloid_0.2.7.bb
new file mode 100644
index 0000000000..d4aada37ff
--- /dev/null
+++ b/meta-gnome/recipes-extended/celluloid/celluloid_0.2.7.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "Celluloid is a simple GTK4 frontend for mpv"
+HOMEPAGE =3D "https://github.com/celluloid-player/celluloid"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8006d9c814277c1bfc4ca22af94b5=
9ee"
+
+DEPENDS =3D " \
+    appstream-glib \
+    appstream-glib-native \
+    desktop-file-utils-native \
+    gtk4 \
+    glib-2.0 \
+    glib-2.0-native \
+    libadwaita \
+    libepoxy \
+    mpv \
+"
+
+inherit meson gettext mime-xdg pkgconfig gtk-icon-cache
+
+SRC_URI =3D "git://github.com/celluloid-player/celluloid.git;protocol=3D=
https;branch=3Dmaster"
+SRCREV =3D "a7d30b11693e48b18637eb8adc3cfd6a07794680"
+S =3D "${WORKDIR}/git"
+
+FILES:${PN} +=3D "${datadir}"
--=20
2.49.0


