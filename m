Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F65C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 14:18:10 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.46280.1681136285205813942
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 07:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout12.t-online.de (Postfix) with SMTP id AE0F1EB5
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 16:17:58 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.40.74]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1plsLB-1bJ85J0; Mon, 10 Apr 2023 16:17:53 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] adw-gtk3: add recipe
Date: Mon, 10 Apr 2023 16:17:47 +0200
Message-Id: <20230410141747.592811-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1681136273-8F7FDC12-0003E709/0/0 CLEAN NORMAL
X-TOI-MSGID: 2d45c0d2-0a57-4456-a402-5af0b61c9880
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 14:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102033

This Theme will provide a unified look for gtk2/3/4

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-themes/adw-gtk3_4.5.bb   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.5.bb

diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.5.bb b/meta-oe=
/recipes-gnome/gnome-themes/adw-gtk3_4.5.bb
new file mode 100644
index 000000000..cb79b5df8
--- /dev/null
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.5.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "An unofficial GTK3 port of libadwaita."
+HOMEPAGE =3D "http://github.com/lassekongo83/adw-gtk3"
+SECTION =3D "graphics"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d75310=
742"
+
+DEPENDS =3D "sassc-native"
+
+inherit meson
+
+SRC_URI =3D "git://github.com/lassekongo83/adw-gtk3.git;protocol=3Dhttps=
;branch=3Dmain"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "bbc539534e881aa9c554665bd3cbf42ffeec6b76"
+
+FILES:${PN} =3D "${datadir}/themes"
--=20
2.34.1


