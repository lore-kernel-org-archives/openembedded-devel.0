Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CB8C25B75
	for <webhook@archiver.kernel.org>; Sat, 11 May 2024 07:58:25 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.10575.1715414297156618160
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 May 2024 00:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout09.t-online.de (Postfix) with SMTP id 5B09015C9A
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 May 2024 09:58:15 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.160.148]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s5hcU-1NX2B80; Sat, 11 May 2024 09:58:14 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/3] file-roller: update 46.0 -> 46.1
Date: Sat, 11 May 2024 09:58:41 +0200
Message-ID: <20240511075842.480843-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240511075842.480843-1-f_l_k@t-online.de>
References: <20240511075842.480843-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1715414294-437FDD34-673D9A28/0/0 CLEAN NORMAL
X-TOI-MSGID: ddceceb0-e1e4-4703-a212-12d8cb30fad8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 May 2024 07:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110312

Version 44.2
~~~~~~~~~~~~
Released: 2024-05-08

Features:
 * Added expanders to the tree view (!220)

Bugfixes:
 * Fixed crash opening some rar files (!243)
 * Do not crash if the loaded file is empty (!233)

Translations:
 * Indonesian (Andika Triwidada)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../file-roller/{file-roller_44.1.bb =3D> file-roller_44.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_44.1.bb =3D> fi=
le-roller_44.2.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_44.1.bb b/m=
eta-gnome/recipes-gnome/file-roller/file-roller_44.2.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_44.1.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_44.2.bb
index 30760387f..2131cdd85 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_44.1.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_44.2.bb
@@ -22,7 +22,7 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
 EXTRA_OEMESON +=3D "-Dintrospection=3Denabled"
=20
 SRC_URI =3D "git://gitlab.gnome.org/GNOME/file-roller.git;protocol=3Dhtt=
ps;branch=3Dmaster"
-SRCREV =3D "299e86c77d8fe600ee6658357e209b15c674397e"
+SRCREV =3D "5b21d887e087155b008f9293ca054d6ac3116a2b"
 S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D ""
--=20
2.44.0


