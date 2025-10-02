Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8563FCCA470
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 01:01:09 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.1831.1759366868307533497
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 18:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout02.t-online.de (Postfix) with SMTP id 8046EFFDE
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Oct 2025 03:01:05 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.165.198]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1v47gt-0oneBV0; Thu, 2 Oct 2025 03:01:03 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] telepathy-mission-control: add recipe
Date: Thu,  2 Oct 2025 03:00:54 +0200
Message-ID: <20251002010054.41854-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1759366863-4DFF89A1-3426A83B/0/0 CLEAN NORMAL
X-TOI-MSGID: cdd2d9ca-973a-4039-818d-5a13dc974e66
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 01:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120152

'telepathy-mission-control' is an account manager as requested by the 'fo=
lks' telepathy
backend at runtime.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../telepathy-mission-control_5.16.6.bb         | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-miss=
ion-control_5.16.6.bb

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-con=
trol_5.16.6.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-mission=
-control_5.16.6.bb
new file mode 100644
index 0000000000..e7cb55c0f5
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.=
16.6.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "Telepathy Mission Control 5 is an account manager and chann=
el dispatcher for the Telepathy framework"
+HOMEPAGE =3D "http://telepathy.freedesktop.org/wiki/"
+LICENSE =3D "LGPL-2.1-only"
+
+DEPENDS =3D "glib-2.0 telepathy-glib dbus dbus-native dbus-glib libxslt-=
native"
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


