Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6A8C678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 20:33:35 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.5238.1678221207459095108
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Mar 2023 12:33:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id 46D60F180
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Mar 2023 21:33:25 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.81]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pZdzw-4JMlHd0; Tue, 7 Mar 2023 21:33:24 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 1/2] xdg-dbus-proxy: add recipe
Date: Tue,  7 Mar 2023 21:33:17 +0100
Message-Id: <20230307203318.689651-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678221204-B73A5DF7-6B45BC06/0/0 CLEAN NORMAL
X-TOI-MSGID: 5cf11b39-f067-4c78-9628-c6233542ec6b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Mar 2023 20:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101407

xdg-dbus-proxy-native is needed for sandboxing webkitgtk

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../xdg-dbus-proxy/xdg-dbus-proxy_0.1.4.bb    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy=
_0.1.4.bb

diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.4.=
bb b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.4.bb
new file mode 100644
index 000000000..35dee632a
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.4.bb
@@ -0,0 +1,19 @@
+SUMMARY =3D "xdg-dbus-proxy is a filtering proxy for D-Bus connections"
+HOMEPAGE =3D "https://github.com/flatpak/xdg-dbus-proxy"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+DEPENDS =3D " \
+    glib-2.0 \
+    libxslt-native \
+    docbook-xsl-stylesheets-native \
+"
+
+inherit meson pkgconfig
+
+SRC_URI =3D "git://github.com/flatpak/xdg-dbus-proxy.git;protocol=3Dhttp=
s;branch=3Dmain"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "6bfe8c32ab23f8c1d80af7a70b3d318a79a17652"
+
+BBCLASSEXTEND =3D "native"
--=20
2.34.1


