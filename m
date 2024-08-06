Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2025CC52D70
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 20:33:44 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.17504.1722976414013324295
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 13:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout05.t-online.de (Postfix) with SMTP id 6853F1C142
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 22:33:30 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.121]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sbQs1-0TSQqH0; Tue, 6 Aug 2024 22:33:25 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] blueman: skip buildpath error
Date: Tue,  6 Aug 2024 22:34:23 +0200
Message-ID: <20240806203423.993216-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1722976405-317E6B54-F0A5EB4D/0/0 CLEAN NORMAL
X-TOI-MSGID: e6c567ef-4313-455a-9879-78bc32a2675a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 20:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111598

Blueman has compiled the buildpath into _blueman.so.
The underlying issue is related to the cython compiler, so theres nothing
that can be done from the blueman side.
[https://github.com/cython/cython/issues/5949]

Disable the buildpath error to keep blueman usable until the problem is f=
ixed.
---
 meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
index 0374d23f0..afb97ee28 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
@@ -86,3 +86,5 @@ do_install:append() {
         chmod 700 ${D}/${datadir}/polkit-1/rules.d
         chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
 }
+
+INSANE_SKIP =3D "buildpaths"
--=20
2.45.2


