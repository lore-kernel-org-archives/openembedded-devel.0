Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E798C4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:33:17 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web09.11706.1642771996085261815
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout09.t-online.de (Postfix) with SMTP id C2C0917276
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 14:33:14 +0100 (CET)
Received: from localhost.localdomain ([84.163.45.199]) by fwd85.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nAu2U-1rotAR0; Fri, 21 Jan 2022 14:33:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv2 3/5] gmime: inherit vala
Date: Fri, 21 Jan 2022 14:32:53 +0100
Message-Id: <20220121133255.2464068-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121133255.2464068-1-f_l_k@t-online.de>
References: <20220121133255.2464068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1642771994-00014AB5-4B46A99D/0/0 CLEAN NORMAL
X-TOI-MSGID: 9ad0ce9e-2e57-4b76-9492-cc7c40845f40
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 13:33:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94973

This is needed to get the vala gir files created (needed e.g. to build ge=
ary).

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-gnome/gmime/gmime_3.2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/gmime/gmime_3.2.7.bb b/meta-oe/recipes=
-gnome/gmime/gmime_3.2.7.bb
index 7f38d42be..d89613d74 100644
--- a/meta-oe/recipes-gnome/gmime/gmime_3.2.7.bb
+++ b/meta-oe/recipes-gnome/gmime/gmime_3.2.7.bb
@@ -5,7 +5,7 @@ SECTION =3D "libs"
=20
 DEPENDS =3D "glib-2.0 zlib"
=20
-inherit gnomebase gobject-introspection
+inherit gnomebase gobject-introspection vala
=20
 SRC_URI +=3D "file://iconv-detect.h \
             file://nodolt.patch"
--=20
2.25.1


