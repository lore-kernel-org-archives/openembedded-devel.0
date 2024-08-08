Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF92C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 07:13:35 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.54250.1723101210964543487
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 00:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout01.t-online.de (Postfix) with SMTP id 178662FF1E
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Aug 2024 09:12:53 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.49]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sbxKN-0vPN3Z0; Thu, 8 Aug 2024 09:12:51 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCHv4] blueman: skip buildpath error
Date: Thu,  8 Aug 2024 09:14:14 +0200
Message-ID: <20240808071414.183510-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1723101171-AAFEDB54-E70FB402/0/0 CLEAN NORMAL
X-TOI-MSGID: 35e59eef-5d22-4900-a801-ac34a106d692
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 07:13:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111644

Blueman has compiled the buildpath into _blueman.so.
The underlying issue is related to the cython compiler, so theres nothing
that can be done from the blueman side.
[https://github.com/cython/cython/issues/5949]

Disable the buildpath error to keep blueman usable until the problem is f=
ixed.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
index 5aa3b2bd5..5e146d648 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
@@ -64,3 +64,6 @@ do_install:append() {
         chmod 700 ${D}/${datadir}/polkit-1/rules.d
         chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
 }
+
+INSANE_SKIP:${PN} +=3D "buildpaths"
+INSANE_SKIP:${PN}-src +=3D "buildpaths"
--=20
2.45.2


