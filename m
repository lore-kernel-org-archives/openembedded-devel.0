Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA1CC433F5
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:19:17 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web08.10764.1653405556431991761
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 08:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80,
 mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout01.t-online.de (Postfix) with SMTP id 72BE48493
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 17:19:13 +0200 (CEST)
Received: from localhost.localdomain ([79.219.234.203]) by fwd83.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ntWJV-2Gnac50; Tue, 24 May 2022 17:19:13 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] p8platform: unbreak do_populate_sdk
Date: Tue, 24 May 2022 17:19:05 +0200
Message-Id: <20220524151905.309358-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653405553-0000EDC4-CF3BEEBC/0/0 CLEAN NORMAL
X-TOI-MSGID: 748a009e-67ed-40a7-abdd-2cf81bf2a220
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 May 2022 15:19:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97251

Error:
 Problem: package libcec-dev-6.0.2-r0.corei7_64 requires p8platform-dev, =
but none of the providers can be installed
  - conflicting requests
  - nothing provides p8platform =3D 2.1.0.1-r0 needed by p8platform-dev-2=
.1.0.1-r0.corei7_64
(try to add '--skip-broken' to skip uninstallable packages)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/p8platform/p8platform_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta=
-oe/recipes-extended/p8platform/p8platform_git.bb
index 8a0699057..777c6c7ca 100644
--- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
+++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
@@ -17,3 +17,5 @@ inherit cmake pkgconfig
 EXTRA_OECMAKE +=3D "-DCMAKE_INSTALL_LIBDIR=3D${libdir} -DCMAKE_INSTALL_L=
IBDIR_NOARCH=3D${libdir}"
=20
 FILES:${PN}-dev +=3D "${libdir}/p8-platform"
+
+ALLOW_EMPTY:${PN} =3D "1"
--=20
2.25.1


