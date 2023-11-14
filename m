Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3AEC54798
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 23:42:25 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.1083.1700005338106155356
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 15:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout02.t-online.de (Postfix) with SMTP id 9E8F11EE9
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 00:42:16 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.170.36]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r332u-34ZzY90; Wed, 15 Nov 2023 00:42:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cups-filters: Try to fix possible Makefile race condition
Date: Wed, 15 Nov 2023 00:42:46 +0100
Message-ID: <20231114234246.326099-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700005336-5C820986-4E6FE4C1/0/0 CLEAN NORMAL
X-TOI-MSGID: 7c4697b9-3ca1-440d-b569-2af99d6bb302
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106727

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb b/meta-o=
e/recipes-printing/cups/cups-filters_2.0.0.bb
index 0370ae79d..4dfb5f612 100644
--- a/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
+++ b/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
@@ -20,6 +20,10 @@ EXTRA_OECONF +=3D " \
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf',=
 'avahi', '', d)}"
 PACKAGECONFIG[avahi] =3D "--enable-avahi,--disable-avahi,avahi"
=20
+do_compile() {
+	oe_runmake -j1
+}
+
 FILES:${PN} +=3D "${datadir}"
 FILES:${PN}-dev +=3D "${datadir}/ppdc"
=20
--=20
2.42.0


