Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB56C54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 09:03:51 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.30518.1710061414694000391
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Mar 2024 01:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout08.t-online.de (Postfix) with SMTP id 5DC92D390
	for <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 10:01:43 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.166.16]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rjF3t-30IuP40; Sun, 10 Mar 2024 10:01:42 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] crossguid: fix reproducibility issue
Date: Sun, 10 Mar 2024 10:01:55 +0100
Message-ID: <20240310090155.1097000-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240310090155.1097000-1-f_l_k@t-online.de>
References: <20240310090155.1097000-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710061302-E4A16957-6B1A68EC/0/0 CLEAN NORMAL
X-TOI-MSGID: 51530a57-84a6-44fa-8c12-61188bf98ae5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 09:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109252

remove STAGING_DIR_HOST from the crossguid-config.cmake file

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb=
 b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
index 58b049bb4..5e680c464 100644
--- a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
+++ b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
@@ -15,3 +15,6 @@ S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
+do_install:append() {
+    sed -i -e 's|${STAGING_DIR_HOST}||g' ${D}${datadir}/crossguid/cmake/=
crossguid-config.cmake
+}
--=20
2.44.0


