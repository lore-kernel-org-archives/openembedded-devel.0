Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B519C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 15:08:50 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.52522.1700492926904680479
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Nov 2023 07:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout02.t-online.de (Postfix) with SMTP id 2CBC9114EB
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 16:08:36 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.47]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r55t3-00ZkMD0; Mon, 20 Nov 2023 16:08:33 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] flatpak: Add packageconfigs for man and docbook docs
Date: Mon, 20 Nov 2023 16:09:01 +0100
Message-ID: <20231120150901.24756-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700492913-DEA1B917-54556F0E/0/0 CLEAN NORMAL
X-TOI-MSGID: 7c18165e-9300-489a-9153-236cbef9db8a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 15:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106962

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.6.bb
index 9f2835a5d..0ee53afb6 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
@@ -29,11 +29,9 @@ DEPENDS =3D " \
     libarchive \
     libcap \
     libxml2 \
-    libxslt-native \
     ostree \
     polkit \
     python3-pyparsing-native \
-    xmlto-native \
     zstd \
 "
=20
@@ -55,6 +53,8 @@ GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
 GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
=20
 PACKAGECONFIG[curl] =3D "-Dhttp_backend=3Dcurl,,curl"
+PACKAGECONFIG[docbook_docs] =3D "-Ddocbook_docs=3Denabled,-Ddocbook_docs=
=3Ddisabled,xmlto-native"
+PACKAGECONFIG[man] =3D "-Dman=3Denabled,-Dman=3Ddisabled,libxslt-native"
 PACKAGECONFIG[soup] =3D "-Dhttp_backend=3Dsoup,,libsoup-2.4"
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,xauth socat-nat=
ive"
 PACKAGECONFIG[xauth] =3D "-Dxauth=3Denabled,-Dxauth=3Ddisabled,xauth"
--=20
2.42.0


