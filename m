Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772B5C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 14:29:26 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.23171.1671460161082948016
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 06:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout05.t-online.de (Postfix) with SMTP id 3680D191EC
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 15:29:19 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.36.130]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7H8n-14T9yT0; Mon, 19 Dec 2022 15:29:17 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2] libxmlb: allow to build native
Date: Mon, 19 Dec 2022 15:29:08 +0100
Message-Id: <20221219142908.3393529-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671460157-5BFE8991-82277DFD/0/0 CLEAN NORMAL
X-TOI-MSGID: c402d109-64b2-496e-b4aa-ba69110555e8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 14:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100107

This will be needed for gnome-software

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb b/meta-oe/re=
cipes-gnome/libxmlb/libxmlb_0.3.10.bb
index 1f5310ca1..3366b7e7f 100644
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
@@ -18,3 +18,5 @@ PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfals=
e"
 GTKDOC_MESON_OPTION =3D "gtkdoc"
=20
 FILES:${PN}-bin +=3D "${libexecdir}/*"
+
+BBCLASSEXTEND =3D "native"
--=20
2.34.1


