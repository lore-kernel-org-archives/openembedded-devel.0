Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A27FCD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 05:39:38 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.5639.1712036370860536359
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 22:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout03.t-online.de (Postfix) with SMTP id 5995D474BA
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Apr 2024 07:39:29 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.110]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rrWro-1OhM2c0; Tue, 2 Apr 2024 07:39:29 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] gnome-backgrounds: add runtime depenency for libjxl
Date: Tue,  2 Apr 2024 07:39:44 +0200
Message-ID: <20240402053944.7305-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402053944.7305-1-f_l_k@t-online.de>
References: <20240402053944.7305-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1712036369-527FB995-83B38109/0/0 CLEAN NORMAL
X-TOI-MSGID: 3e49542c-bd16-4166-bda8-5cb9b43a7b80
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 05:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109773

Provides the jpegxl gdk-pixbuf-loader that is required for the jxl
wallpapers.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-backgrounds/gnome-backgrounds_46.0.bb  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds=
_46.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_4=
6.0.bb
index 5d6c5d31e..d938ae94c 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_46.0.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_46.0.b=
b
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db52fb0a6df395e=
fb7047cb6fc56bfd7e"
=20
 SECTION =3D "x11/gnome"
=20
-
 inherit gnomebase gettext allarch
=20
 SRC_URI[archive.sha256sum] =3D "4ddd3ac439a4a067876805921bb75f4d3c8b85a2=
18d47c276dddde8928443c2e"
@@ -13,3 +12,5 @@ FILES:${PN} +=3D " \
     ${datadir}/backgrounds \
     ${datadir}/gnome-background-properties \
 "
+
+RDEPENDS:${PN} +=3D "libjxl"
--=20
2.44.0


