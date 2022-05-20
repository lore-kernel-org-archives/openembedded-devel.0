Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687EAC433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 12:53:42 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web12.8427.1653051217050277333
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 May 2022 05:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout03.t-online.de (Postfix) with SMTP id 5B65C5695
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 May 2022 14:53:33 +0200 (CEST)
Received: from localhost.localdomain ([84.154.173.254]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ns28J-1OuYOA0; Fri, 20 May 2022 14:53:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][RFC PATCH 2/2] jack: allow to build native/nativesdk
Date: Fri, 20 May 2022 14:53:13 +0200
Message-Id: <20220520125313.4115361-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520125313.4115361-1-f_l_k@t-online.de>
References: <20220520125313.4115361-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653051211-0000C4DD-F491A4E0/0/0 CLEAN NORMAL
X-TOI-MSGID: 9567a882-f763-4162-8490-69302a5c82d1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 May 2022 12:53:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97213

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-multimedia/jack/jack_1.19.20.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.20.bb b/meta-oe/re=
cipes-multimedia/jack/jack_1.19.20.bb
index 452f06655..90e5d5621 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.19.20.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.19.20.bb
@@ -49,3 +49,5 @@ FILES:jack-server =3D " \
 FILES:jack-utils =3D "${bindir}/*"
=20
 FILES:${PN}-doc +=3D " ${datadir}/jack-audio-connection-kit/reference/ht=
ml/*"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


