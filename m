Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA37C10F1B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:52:55 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.152489.1672123968007331352
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout11.t-online.de (Postfix) with SMTP id 053584601
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 07:52:45 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.104]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pA3pM-2m9AI50; Tue, 27 Dec 2022 07:52:44 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 1/4] libcloudproviders: add recipe
Date: Tue, 27 Dec 2022 07:52:32 +0100
Message-Id: <20221227065235.95271-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672123964-6B7FA9DD-318F48F3/0/0 CLEAN NORMAL
X-TOI-MSGID: 01ecb21b-154e-4975-b971-f51e8cd12025
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100279

It is a mandatory dependency of nautilus

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libcloudproviders/libcloudproviders_0.3.1.bb      | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-gnome/recipes-support/libcloudproviders/libcloud=
providers_0.3.1.bb

diff --git a/meta-gnome/recipes-support/libcloudproviders/libcloudprovide=
rs_0.3.1.bb b/meta-gnome/recipes-support/libcloudproviders/libcloudprovid=
ers_0.3.1.bb
new file mode 100644
index 000000000..b6448b939
--- /dev/null
+++ b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.=
1.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "libcloudproviders is a DBus API that allows cloud storage s=
ync clients to expose their services."
+LICENSE=3D"LGPL-3.0-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De6a600fd5e1d9cbde2d983680233a=
d02"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+DEPENDS =3D "glib-2.0"
+
+inherit gnomebase gobject-introspection vala
+
+SRC_URI[archive.sha256sum] =3D "4763213ca1e1fe30d422f5ae3b4f02a454f63414=
c1860ad142d6385f89d05929"
--=20
2.34.1


