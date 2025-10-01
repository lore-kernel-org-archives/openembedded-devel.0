Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE00CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 06:24:09 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.9898.1759299836940984619
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 23:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout01.t-online.de (Postfix) with SMTP id E44691C680
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Oct 2025 08:23:54 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.168.197]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1v3qFi-1OWM5J0; Wed, 1 Oct 2025 08:23:50 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] telepathy-mission-control: add recipe
Date: Wed,  1 Oct 2025 08:23:38 +0200
Message-ID: <20251001062339.74011-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1759299830-46FFAA62-E4863815/0/0 CLEAN NORMAL
X-TOI-MSGID: 88f0c1f0-518d-4bd9-b0c3-20e7974b5cf5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120087

'telepathy-mission-control' is an account manager as requested by the 'fo=
lks' telepathy
backend at runtime.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../telepathy/telepathy-mission-control_5.16.6.bb  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-miss=
ion-control_5.16.6.bb

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-con=
trol_5.16.6.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-mission=
-control_5.16.6.bb
new file mode 100644
index 0000000000..c6ff3abe9f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.=
16.6.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "Telepathy Mission Control 5 is an account manager and chann=
el dispatcher for the Telepathy framework"
+HOMEPAGE =3D "http://telepathy.freedesktop.org/wiki/"
+LICENSE =3D "LGPL-2.1-only"
+
+DEPENDS =3D "telepathy-glib dbus networkmanager dbus-native dbus-glib"
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
+FILES:${PN} +=3D "${datadir}/dbus-1 ${datadir}/glib-2.0"
--=20
2.51.0


