Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C98AC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 09:36:29 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.1415.1667986583779535115
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 01:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id C4B0D14313
	for <openembedded-devel@lists.openembedded.org>; Wed,  9 Nov 2022 10:35:41 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.39.174]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oshUj-01p16H0; Wed, 9 Nov 2022 10:35:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] hwdata: allow to build native and nativesdk
Date: Wed,  9 Nov 2022 10:35:34 +0100
Message-Id: <20221109093534.2718027-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667986541-F4FD47E2-3CBCB306/0/0 CLEAN NORMAL
X-TOI-MSGID: 8b38075e-d1e3-4548-8216-b6050b6701a0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 09:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99492

Previously, wlroots read the edid information for the drm backend from ud=
ev_hwdb.
After the latest changes, it now gets the information from hwdata to unbl=
ock platforms
without systemd support. For this, hwdata-native is needed. If it is not =
found, wlroots
uses hwdata from host, which may not be up to date. This would ensure tha=
t the
information can be read from the latest hwdata version available in oe-co=
re.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/hwdata/hwdata_0.364.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.364.bb b/meta-oe/rec=
ipes-support/hwdata/hwdata_0.364.bb
index 6499db24f..4abfb4346 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.364.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.364.bb
@@ -23,3 +23,5 @@ do_install() {
=20
 FILES:${PN} =3D "${libdir}/* \
                ${datadir}/* "
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


