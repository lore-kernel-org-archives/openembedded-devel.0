Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79217C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:33:15 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web12.11716.1642771994224642332
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout09.t-online.de (Postfix) with SMTP id 3DCAF17274
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 14:33:12 +0100 (CET)
Received: from localhost.localdomain ([84.163.45.199]) by fwd85.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nAu2R-1rotAP0; Fri, 21 Jan 2022 14:33:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv2 1/5] libgdata: add vala PACKAGECONFIG
Date: Fri, 21 Jan 2022 14:32:51 +0100
Message-Id: <20220121133255.2464068-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1642771992-00014AB5-7BD99838/0/0 CLEAN NORMAL
X-TOI-MSGID: 2d2c9ffd-056e-4da7-912a-1b07d68c8e62
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 13:33:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94971

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb b/meta-=
gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
index aaefcecb7..a1be2a2b6 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
@@ -22,7 +22,7 @@ do_compile:prepend() {
 }
=20
 # goa is required for gnome-photos
-PACKAGECONFIG ??=3D "goa gtk"
+PACKAGECONFIG ??=3D "goa gtk vala"
 PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse"
 PACKAGECONFIG[goa] =3D "-Dgoa=3Denabled,-Dgoa=3Ddisabled,gnome-online-ac=
counts"
 PACKAGECONFIG[gtk] =3D "-Dgtk=3Denabled,-Dgtk=3Ddisabled,gtk+3"
--=20
2.25.1


