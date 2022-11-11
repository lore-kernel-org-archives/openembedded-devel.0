Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2863C4321E
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 10:52:42 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web09.4087.1668163954688962763
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Nov 2022 02:52:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout02.t-online.de (Postfix) with SMTP id 755495D32
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Nov 2022 11:52:32 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.57]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1otReB-1gzNjd0; Fri, 11 Nov 2022 11:52:31 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-networking][PATCH] blueman: add RDEPEND on python3-fcntl
Date: Fri, 11 Nov 2022 11:52:10 +0100
Message-Id: <20221111105210.28825-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1668163951-79BAA9DD-9E43DB79/0/0 CLEAN NORMAL
X-TOI-MSGID: 5fd9df96-2e42-41a7-b313-0107fcbc7798
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Nov 2022 10:52:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99554

After updating current poky master python3-fcntl is not installed
into my image anymore. Blueman-applet fails to run with
Error: No module named 'fcntl''Module fcntl not found'

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb
index c3cde1f27..2822e8713 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb
@@ -26,6 +26,7 @@ RDEPENDS:${PN} +=3D " \
     python3-dbus \
     python3-pygobject \
     python3-terminal \
+    python3-fcntl \
     packagegroup-tools-bluetooth \
 "
=20
--=20
2.34.1


