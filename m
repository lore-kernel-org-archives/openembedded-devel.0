Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2CDC433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:48:48 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web12.11160.1653407320562890500
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 08:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id F2E1817669
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 17:48:36 +0200 (CEST)
Received: from localhost.localdomain ([79.219.234.203]) by fwd85.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ntWlw-13DtEP0; Tue, 24 May 2022 17:48:36 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv2] p8platform: unbreak do_populate_sdk
Date: Tue, 24 May 2022 17:48:27 +0200
Message-Id: <20220524154827.416433-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653407316-00014AB5-269CAA8C/0/0 CLEAN NORMAL
X-TOI-MSGID: 2f21b2d0-f957-4cf3-92b6-acc3201a10a0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 May 2022 15:48:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97259

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
index 8a0699057..1307f6dc4 100644
--- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
+++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
@@ -17,3 +17,5 @@ inherit cmake pkgconfig
 EXTRA_OECMAKE +=3D "-DCMAKE_INSTALL_LIBDIR=3D${libdir} -DCMAKE_INSTALL_L=
IBDIR_NOARCH=3D${libdir}"
=20
 FILES:${PN}-dev +=3D "${libdir}/p8-platform"
+
+RDEPENDS:${PN}-dev =3D ""
--=20
2.25.1


