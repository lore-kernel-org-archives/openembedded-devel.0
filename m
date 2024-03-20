Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7AFCD11DB
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 07:56:51 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.38458.1710921403538887676
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 00:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout12.t-online.de (Postfix) with SMTP id 57296F985
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 08:56:41 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.101]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmqoQ-1yRzHe0; Wed, 20 Mar 2024 08:56:38 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] freerdp3: fix faac PACKAGECONFIG
Date: Wed, 20 Mar 2024 08:57:09 +0100
Message-ID: <20240320075709.12553-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320075709.12553-1-f_l_k@t-online.de>
References: <20240320075709.12553-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710921398-94855968-C3B2DD3E/0/0 CLEAN NORMAL
X-TOI-MSGID: b11bc473-765f-4a73-a9c0-601c32b1e154
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 07:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109483

---
 meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/=
recipes-support/freerdp/freerdp3_3.4.0.bb
index f04be56c6..27add9909 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -49,7 +49,7 @@ PACKAGECONFIG[openh264] =3D "-DWITH_OPENH264=3DON,-DWIT=
H_OPENH264=3DOFF,openh264"
 PACKAGECONFIG[opencl] =3D "-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,opencl=
-icd-loader"
 PACKAGECONFIG[lame] =3D "-DWITH_LAME=3DON,-DWITH_LAME=3DOFF,lame"
 PACKAGECONFIG[faad] =3D "-DWITH_FAAD=3DON,-DWITH_FAAD=3DOFF,faad2"
-PACKAGECONFIG[faac] =3D "-DWITH_FAAD=3DON,-DWITH_FAAD=3DOFF,faac"
+PACKAGECONFIG[faac] =3D "-DWITH_FAAC=3DON,-DWITH_FAAC=3DOFF,faac"
=20
 do_configure:append() {
     sed -i -e 's|${WORKDIR}||g' ${B}/include/freerdp/buildflags.h
--=20
2.44.0


