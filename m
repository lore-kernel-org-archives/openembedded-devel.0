Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2D4C3DA6F
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 12:20:16 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.9983.1692793216266290487
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 05:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout05.t-online.de (Postfix) with SMTP id 1541EFFE6
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 14:20:14 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.236]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qYmqK-0tEM2m0; Wed, 23 Aug 2023 14:20:13 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/5] usbids: add recipe
Date: Wed, 23 Aug 2023 14:19:56 +0200
Message-ID: <20230823121957.5626-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823121957.5626-1-f_l_k@t-online.de>
References: <20230823121957.5626-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692793213-7D1FCE98-A995796C/0/0 CLEAN NORMAL
X-TOI-MSGID: b3548645-64ee-47b6-8b69-17e088bc2647
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 12:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104543

Linux USB ID Repository (master still in CVS at SourceForge.net)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../usbids/usbids_2023.01.16.bb                | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/usbids/usbids_2023.01.16.bb

diff --git a/meta-oe/recipes-support/usbids/usbids_2023.01.16.bb b/meta-o=
e/recipes-support/usbids/usbids_2023.01.16.bb
new file mode 100644
index 0000000000..b0dd72fb25
--- /dev/null
+++ b/meta-oe/recipes-support/usbids/usbids_2023.01.16.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "usb device database."
+HOMEPAGE =3D "https://github.com/usbids/usbids"
+
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D84dcc94da3adb52b53ae4fa38fe49=
e5d"
+
+SRC_URI =3D "git://github.com/usbids/usbids.git;branch=3Dmaster;protocol=
=3Dhttps"
+
+SRCREV =3D "7963233faf69eb9c80ffca8dfc1f31940f75999f"
+
+S =3D "${WORKDIR}/git"
+
+do_install() {
+	install -d ${D}${datadir}
+	install -m0644 ${S}/usb.ids ${D}${datadir}
+}
+
+FILES:${PN} =3D "${datadir}"
--=20
2.41.0


