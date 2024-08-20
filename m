Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2619EC5320E
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 21:18:29 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.5750.1724188701348737512
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Aug 2024 14:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout09.t-online.de (Postfix) with SMTP id 93B1C4ED0C
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 23:18:19 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.231.159]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sgWF7-2Lg4PZ0; Tue, 20 Aug 2024 23:18:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] webkitgtk3: update 2.44.2 -> 2.44.3
Date: Tue, 20 Aug 2024 23:19:40 +0200
Message-ID: <20240820211941.46814-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1724188697-40FEE9D9-4F305D5A/0/0 CLEAN NORMAL
X-TOI-MSGID: 9c8e0668-2459-4907-9721-0b01ac71e979
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 21:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111869

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../webkitgtk/{webkitgtk3_2.44.2.bb =3D> webkitgtk3_2.44.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.44.2.bb =3D> webk=
itgtk3_2.44.3.bb} (99%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.2.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
similarity index 99%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.2.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
index 31480b8d8..7d70cbda7 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.2.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/webkitg=
tk-${PV}.tar.xz \
            file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-d=
ecl.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
            "
-SRC_URI[sha256sum] =3D "523f42c8ff24832add17631f6eaafe8f9303afe316ef1a7e=
1844b952a7f7521b"
+SRC_URI[sha256sum] =3D "dc82d042ecaca981a4852357c06e5235743319cf10a94cd3=
6ad41b97883a0b54"
=20
 inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
=20
--=20
2.45.2


