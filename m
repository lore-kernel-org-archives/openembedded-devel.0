Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD161D743F2
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 23:26:02 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.1927.1732145161997181337
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 15:26:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout10.t-online.de (Postfix) with SMTP id 979F1912
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 00:25:59 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.160.173]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tDu58-3zmzPG0; Thu, 21 Nov 2024 00:25:58 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gnome-boxes: add itstool-native dependency
Date: Thu, 21 Nov 2024 00:28:12 +0100
Message-ID: <20241120232812.2718277-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120232812.2718277-1-f_l_k@t-online.de>
References: <20241120232812.2718277-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1732145158-0F7FC459-AE2E5CBE/0/0 CLEAN NORMAL
X-TOI-MSGID: ac506b4e-f6a8-48d1-a7bd-a1c67024b1ed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 23:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113942

fixes:
| Configuring org.gnome.Boxes.SearchProvider.ini using configuration
| Program itstool found: NO
|
| ../gnome-boxes-47.0/help/meson.build:36:6: ERROR: Program 'itstool' not=
 found or not executable
|

- also provide appstream-cli
---
 .../recipes-gnome/gnome-boxes/gnome-boxes_47.0.bb               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/=
gnome-boxes/gnome-boxes_47.0.bb b/meta-gnome/dynamic-layers/meta-virtuali=
zation/recipes-gnome/gnome-boxes/gnome-boxes_47.0.bb
index 4787651a9..80f0e89a6 100644
--- a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_47.0.bb
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_47.0.bb
@@ -9,8 +9,10 @@ GNOMEBASEBUILDCLASS =3D "meson"
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data opengl"
=20
 DEPENDS =3D " \
+  appstream-native \
   glib-2.0 \
   desktop-file-utils-native \
+  itstool-native \
   libarchive \
   libgudev \
   libhandy \
--=20
2.47.0


