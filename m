Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F421C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:33:16 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.11897.1642771995669695513
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout09.t-online.de (Postfix) with SMTP id 3FD1A17277
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 14:33:14 +0100 (CET)
Received: from localhost.localdomain ([84.163.45.199]) by fwd85.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nAu2T-1rotAQ0; Fri, 21 Jan 2022 14:33:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv2 2/5] gspell: inherit vala
Date: Fri, 21 Jan 2022 14:32:52 +0100
Message-Id: <20220121133255.2464068-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121133255.2464068-1-f_l_k@t-online.de>
References: <20220121133255.2464068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1642771993-00014AB5-3217077F/0/0 CLEAN NORMAL
X-TOI-MSGID: 9eb47f67-7ba7-48a4-b159-8bf304d955c9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 13:33:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94972

This is needed to get the vala gir files created (needed e.g. to build ge=
ary).

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb b/meta-gnome=
/recipes-gnome/gspell/gspell_1.9.1.bb
index d6de146b1..aba9be87a 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8c2e1ec1540fb3=
e0beb68361344cba7e"
=20
 DEPENDS =3D "gtk+3 iso-codes enchant2"
=20
-inherit gnomebase gettext gobject-introspection
+inherit gnomebase gettext gobject-introspection vala
=20
 SRC_URI[archive.sha256sum] =3D "dcbb769dfdde8e3c0a8ed3102ce7e661abbf7ddf=
85df08b29915e92cd723abdd"
--=20
2.25.1


