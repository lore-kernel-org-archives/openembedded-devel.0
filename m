Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C5DC54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 12:22:58 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.14299.1711628568001813763
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 05:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout08.t-online.de (Postfix) with SMTP id 8DF5A3BCC
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 13:22:46 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.230]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rpomK-3DTber0; Thu, 28 Mar 2024 13:22:44 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH] apache2: preset mpm=prefork by default
Date: Thu, 28 Mar 2024 13:23:05 +0100
Message-ID: <20240328122305.30205-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711628564-E7FFC9C0-E61128EE/0/0 CLEAN NORMAL
X-TOI-MSGID: 74982eae-935b-4e1e-8d6a-e7dea8528bc7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 12:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109665

currently this is chosen depending on machine at do_configure

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb b/met=
a-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
index e4f7e1ceb..a6cdfd165 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
@@ -63,6 +63,7 @@ EXTRA_OECONF:class-target =3D "\
     --with-berkeley-db=3Dno \
     --enable-info \
     --enable-rewrite \
+    --with-mpm=3Dprefork \
     --enable-mpms-shared \
     ap_cv_void_ptr_lt_long=3Dno \
     ac_cv_have_threadsafe_pollset=3Dno \
--=20
2.44.0


