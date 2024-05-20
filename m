Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B2AC04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 12:28:35 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.58861.1716208109987961105
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 May 2024 05:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout05.t-online.de (Postfix) with SMTP id 0C4151A093
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 May 2024 14:28:28 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.45.105]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s927s-2X6hRh0; Mon, 20 May 2024 14:28:24 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] malcontent: move PV to malcontent.inc
Date: Mon, 20 May 2024 14:29:00 +0200
Message-ID: <20240520122900.45666-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716208104-3E18DC7B-B957F551/0/0 CLEAN NORMAL
X-TOI-MSGID: 61bf8e75-6499-41d3-9650-e018dc7bdfd2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 May 2024 12:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110441

PV must be consistent for malcontent and malcontent-ui.	Ensure this by mo=
ving
PV to malcontent.inc

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../malcontent/{malcontent-ui_0.12.0.bb =3D> malcontent-ui.bb}     | 0
 .../malcontent/{malcontent_0.12.0.bb =3D> malcontent.bb}           | 0
 meta-oe/recipes-gnome/malcontent/malcontent.inc                  | 1 +
 3 files changed, 1 insertion(+)
 rename meta-oe/recipes-gnome/malcontent/{malcontent-ui_0.12.0.bb =3D> ma=
lcontent-ui.bb} (100%)
 rename meta-oe/recipes-gnome/malcontent/{malcontent_0.12.0.bb =3D> malco=
ntent.bb} (100%)

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb b/m=
eta-oe/recipes-gnome/malcontent/malcontent-ui.bb
similarity index 100%
rename from meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
rename to meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
diff --git a/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb b/meta=
-oe/recipes-gnome/malcontent/malcontent.bb
similarity index 100%
rename from meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb
rename to meta-oe/recipes-gnome/malcontent/malcontent.bb
diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.inc b/meta-oe/re=
cipes-gnome/malcontent/malcontent.inc
index 0446005a3..d48be08bb 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent.inc
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.inc
@@ -1,3 +1,4 @@
 SRC_URI =3D "git://gitlab.freedesktop.org/pwithnall/malcontent.git;proto=
col=3Dhttps;branch=3Dmain"
 S =3D "${WORKDIR}/git"
 SRCREV =3D "3ba80995bb25b7aeda7e21d547f9e39ff9a81736"
+PV =3D "0.12.0"
--=20
2.44.0


