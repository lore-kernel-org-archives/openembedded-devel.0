Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4263C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 20:07:59 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.3369.1715630874685095494
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 May 2024 13:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout08.t-online.de (Postfix) with SMTP id E3A4FCCC3
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 22:07:52 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.44.250]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s6bxg-3atEq90; Mon, 13 May 2024 22:07:52 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] malcontent-ui: add malcontent to RDEPENDS
Date: Mon, 13 May 2024 22:08:24 +0200
Message-ID: <20240513200825.39767-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1715630872-423C0C65-40925124/0/0 CLEAN NORMAL
X-TOI-MSGID: ae0cf080-6717-4a9b-88d7-9f9bf0b6dabb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 20:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110341

This fixes:
ERROR: malcontent-ui-0.12.0-r0 do_package_qa: QA Issue: /usr/lib/libmalco=
ntent-ui-1.so.1
contained in package malcontent-ui requires libmalcontent-0.so.0()(64bit)=
, but no providers
found in RDEPENDS:malcontent-ui? [file-rdeps]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb b/m=
eta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
index 4ff16a82d..f64f69a78 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
+++ b/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
@@ -48,3 +48,5 @@ do_install() {
=20
 FILES:${PN} =3D "${bindir} ${libdir} ${datadir}"
=20
+RDEPENDS:${PN} =3D "malcontent"
+
--=20
2.44.0


