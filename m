Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0718EC52D73
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 07:09:16 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.54190.1723100949287395928
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 00:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout05.t-online.de (Postfix) with SMTP id BDF22C007
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Aug 2024 09:09:06 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.49]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sbxGk-3phgBt0; Thu, 8 Aug 2024 09:09:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCHv3] blueman: skip buildpath error
Date: Thu,  8 Aug 2024 09:10:29 +0200
Message-ID: <20240808071029.151458-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1723100946-427FA414-9B959E22/0/0 CLEAN NORMAL
X-TOI-MSGID: a51f9ae1-c802-48da-b310-3329327889cf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 07:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111643

Blueman has compiled the buildpath into _blueman.so.
The underlying issue is related to the cython compiler, so theres nothing
that can be done from the blueman side.
[https://github.com/cython/cython/issues/5949]

Disable the buildpath error to keep blueman usable until the problem is f=
ixed.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
index 5aa3b2bd5..61bd8f971 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
@@ -64,3 +64,5 @@ do_install:append() {
         chmod 700 ${D}/${datadir}/polkit-1/rules.d
         chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
 }
+
+INSANE_SKIP:${PN}-src +=3D "buildpaths"
--=20
2.45.2


