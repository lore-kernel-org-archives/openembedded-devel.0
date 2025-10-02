Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498BFCAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 14:20:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.10320.1759414835467878748
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 07:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout10.t-online.de (Postfix) with SMTP id 1023C37AD6;
	Thu,  2 Oct 2025 16:19:46 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.165.198]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1v4K9n-3GcZKj0; Thu, 2 Oct 2025 16:19:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCHv3] telepathy-mission-control: add recipe
Date: Thu,  2 Oct 2025 16:19:22 +0200
Message-ID: <20251002141922.1945002-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1759414783-157F9947-E14BBB19/0/0 CLEAN NORMAL
X-TOI-MSGID: 5bbd67a7-df1f-41e1-be0b-51a9dca38b75
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 14:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120197

'telepathy-mission-control' is an account manager as requested by the 'fo=
lks' telepathy
backend at runtime.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../telepathy-mission-control_5.16.6.bb         | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-miss=
ion-control_5.16.6.bb

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-con=
trol_5.16.6.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-mission=
-control_5.16.6.bb
new file mode 100644
index 0000000000..cafbd4ad92
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.=
16.6.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "Telepathy Mission Control 5 is an account manager and chann=
el dispatcher for the Telepathy framework"
+HOMEPAGE =3D "http://telepathy.freedesktop.org/wiki/"
+LICENSE =3D "LGPL-2.1-only"
+
+DEPENDS =3D "glib-2.0 glib-2.0-native telepathy-glib dbus dbus-native db=
us-glib libxslt-native"
+
+SRC_URI =3D "http://telepathy.freedesktop.org/releases/telepathy-mission=
-control/${BP}.tar.gz"
+SRC_URI[sha256sum] =3D "2df8ae3995e919a7670e01aa3568215ef0777e34961ace1c=
ac1c6477cb297a45"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd737b=
499"
+
+inherit autotools pkgconfig gtk-doc
+
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[networkmanager] =3D "--with-connectivity=3Dnm,--with-conne=
ctivity=3Dno,networkmanager"
+
+FILES:${PN} +=3D "${datadir}/dbus-1 ${datadir}/glib-2.0"
--=20
2.51.0


