Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F21D3EE91
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:44:00 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40177.1769096637228214678
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout05.t-online.de (Postfix) with SMTP id C26587DD
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 16:43:54 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.253]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1viwqc-1auNgX0; Thu, 22 Jan 2026 16:43:50 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 09/11] libgtop: fix build without x11
Date: Thu, 22 Jan 2026 16:43:32 +0100
Message-ID: <20260122154334.1872038-9-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122154334.1872038-1-f_l_k@t-online.de>
References: <20260122154334.1872038-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769096630-257F9925-AD22B592/0/0 CLEAN NORMAL
X-TOI-MSGID: c0b05235-9000-475a-a6ad-d2554522183c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 15:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123741

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb b/meta-gn=
ome/recipes-gnome/libgtop/libgtop_2.41.3.bb
index e7b61a7b20..edab207458 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb
@@ -11,4 +11,4 @@ SRC_URI[archive.sha256sum] =3D "775676df958e2ea2452f756=
8f28b2ea581063d312773dd5c0b
=20
 UPSTREAM_CHECK_REGEX =3D "libgtop-(?P<pver>\d+(\.\d+)+).tar"
=20
-DEPENDS =3D "glib-2.0 libxau"
+DEPENDS =3D "glib-2.0"
--=20
2.52.0


