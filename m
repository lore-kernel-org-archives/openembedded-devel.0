Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16630C2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 14:57:30 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.52244.1700492243064270821
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Nov 2023 06:57:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout03.t-online.de (Postfix) with SMTP id B20A1489F3
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 15:57:20 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.47]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r55iA-1auNgP0; Mon, 20 Nov 2023 15:57:18 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] flatpak: Add packageconfigs for man and docbook docs
Date: Mon, 20 Nov 2023 15:57:43 +0100
Message-ID: <20231120145743.11512-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700492238-337FD820-3FBA6179/0/0 CLEAN NORMAL
X-TOI-MSGID: 4892cb6d-cf64-4029-adbe-b22222546990
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 14:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106961

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.6.bb
index 9f2835a5d..cbd68eb16 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
@@ -55,6 +55,8 @@ GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
 GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
=20
 PACKAGECONFIG[curl] =3D "-Dhttp_backend=3Dcurl,,curl"
+PACKAGECONFIG[docbook_docs] =3D "-Ddocbook_docs=3Denabled,-Ddocbook_docs=
=3Ddisabled,docbook-xsl-stylesheets-native"
+PACKAGECONFIG[man] =3D "-Dman=3Denabled,-Dman=3Ddisabled,libxslt-native"
 PACKAGECONFIG[soup] =3D "-Dhttp_backend=3Dsoup,,libsoup-2.4"
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,xauth socat-nat=
ive"
 PACKAGECONFIG[xauth] =3D "-Dxauth=3Denabled,-Dxauth=3Ddisabled,xauth"
--=20
2.42.0


