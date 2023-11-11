Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94229C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 22:18:47 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.5286.1699741121170820929
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 14:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id 99AED134C1
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 23:18:38 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.215]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1wJK-0lT8SH0; Sat, 11 Nov 2023 23:18:38 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cups-filters: Fix for current gcc
Date: Sat, 11 Nov 2023 23:18:48 +0100
Message-ID: <20231111221848.1363223-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699741118-E6A6E957-CA6082A4/0/0 CLEAN NORMAL
X-TOI-MSGID: f0f6c96a-67a0-46c4-8187-eadea7a89c41
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 22:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106575

std::string_view is part of c++17

This fixes:
error: 'std::string_view' has not been declared

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb b/meta=
-oe/recipes-printing/cups/cups-filters_1.28.17.bb
index 01c29d2c9..dc527bf72 100644
--- a/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
+++ b/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
@@ -30,6 +30,8 @@ EXTRA_OECONF:class-native +=3D " --with-pdftops=3Dpdfto=
ps \
                                     --disable-ldap \
                                     --with-png --without-jpeg --without-=
tiff"
=20
+CXXFLAGS +=3D "-std=3Dc++17"
+
 PACKAGECONFIG[jpeg] =3D "--with-jpeg,--without-jpeg,jpeg"
 PACKAGECONFIG[png] =3D "--with-png,--without-png,libpng"
 PACKAGECONFIG[tiff] =3D "--with-tiff,--without-tiff,tiff"
--=20
2.42.0


