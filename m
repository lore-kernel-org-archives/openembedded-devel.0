Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182BEC10F1B
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 13:12:16 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.21092.1671455526460792365
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 05:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id 0A5793A94
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 14:11:23 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.36.130]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7FvO-2FOhA10; Mon, 19 Dec 2022 14:11:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 09/10] libxmlb: allow to build native
Date: Mon, 19 Dec 2022 14:10:40 +0100
Message-Id: <20221219131041.452949-9-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219131041.452949-1-f_l_k@t-online.de>
References: <20221219131041.452949-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671455482-68DE2991-BEBEC0DF/0/0 CLEAN NORMAL
X-TOI-MSGID: 4c283e6c-7668-4dfd-8838-339f33e87457
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 13:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100103

This will be needed for gnome-software
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


