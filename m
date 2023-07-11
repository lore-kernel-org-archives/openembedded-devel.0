Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9355EB64DD
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 17:48:47 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.2728.1689097720670531718
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 10:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout05.t-online.de (Postfix) with SMTP id CFE53154C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 19:48:38 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.45.62]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qJHTa-20A8A70; Tue, 11 Jul 2023 19:48:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/3] mutter: upgrade 44.2 -> 44.3
Date: Tue, 11 Jul 2023 19:48:27 +0200
Message-Id: <20230711174827.53666-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711174827.53666-1-f_l_k@t-online.de>
References: <20230711174827.53666-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1689097718-1301F931-8A345E03/0/0 CLEAN NORMAL
X-TOI-MSGID: 0e202056-c6db-48b2-aef6-256812187c13
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 17:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103731

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/mutter/{mutter_44.2.bb =3D> mutter_44.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_44.2.bb =3D> mutter_44.3.=
bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_44.2.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_44.3.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_44.2.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_44.3.bb
index 9c25eda6f7..6bd8a7b08e 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_44.2.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_44.3.bb
@@ -25,7 +25,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "37566d7e55c93dc8894e9c7f23a7ba5879a8b30b=
af65558223009d2b467402a1"
+SRC_URI[archive.sha256sum] =3D "185cbebf2150d3e450550e371bdb13a8b4db0969=
78b14f99521e966eacc70551"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
--=20
2.34.1


