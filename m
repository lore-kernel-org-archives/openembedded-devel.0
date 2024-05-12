Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A23C41513
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 09:15:12 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.31931.1715505304208632354
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 02:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout10.t-online.de (Postfix) with SMTP id 7847345840
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 11:15:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.90]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s65IK-3LS1at0; Sun, 12 May 2024 11:15:00 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] flatpak: add PACKAGECONFIG for malcontent
Date: Sun, 12 May 2024 11:15:24 +0200
Message-ID: <20240512091524.90050-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240512091524.90050-1-f_l_k@t-online.de>
References: <20240512091524.90050-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1715505300-D27FBD0F-2CFA4B38/0/0 CLEAN NORMAL
X-TOI-MSGID: eb278cbd-d490-47c5-85c0-a7d695b102f7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 09:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110314

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.8.bb
index fba7bc49a..488765272 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
@@ -50,6 +50,7 @@ GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
=20
 PACKAGECONFIG[curl] =3D "-Dhttp_backend=3Dcurl,,curl"
 PACKAGECONFIG[docbook_docs] =3D "-Ddocbook_docs=3Denabled,-Ddocbook_docs=
=3Ddisabled,xmlto-native"
+PACKAGECONFIG[malcontent] =3D "-Dmalcontent=3Denabled,-Dmalcontent=3Ddis=
abled,malcontent"
 PACKAGECONFIG[man] =3D "-Dman=3Denabled,-Dman=3Ddisabled,libxslt-native"
 PACKAGECONFIG[soup] =3D "-Dhttp_backend=3Dsoup,,libsoup-2.4"
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,xauth socat-nat=
ive"
--=20
2.44.0


