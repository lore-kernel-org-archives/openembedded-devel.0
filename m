Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F3EC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 09:11:57 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.8027.1704877916219889275
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jan 2024 01:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout11.t-online.de (Postfix) with SMTP id E213B1D1C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 10:11:53 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.230.233]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rNUcq-27uFYS0; Wed, 10 Jan 2024 10:11:53 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 4/5] gnome-software: update 45.1 -> 45.3
Date: Wed, 10 Jan 2024 10:11:45 +0100
Message-ID: <20240110091146.867242-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110091146.867242-1-f_l_k@t-online.de>
References: <20240110091146.867242-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1704877913-F8FF694C-BA201556/0/0 CLEAN NORMAL
X-TOI-MSGID: c0d03d71-5bd6-4d5c-96f9-f6dafcddba09
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 09:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108210

Version 45.3
Released: 2024-01-05
This is a stable release with the following changes:

Recognize links in package update descriptions
Increase speed of load of the category pages
Fix deadlock when cancelling app update

This release also updates translations:

Chinese (Taiwan) (Andre Klapper)
Persian (Danial Behzadi)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_45.2.bb =3D> gnome-software_45.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_45.2.bb =3D=
> gnome-software_45.3.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.2.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.3.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_45.2.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_45.3.bb
index fc2b696aa..4beb79f1b 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.3.bb
@@ -32,7 +32,7 @@ SRC_URI +=3D " \
 	file://0655f358ed0e8455e12d9634f60bc4dbaee434e3.patch \
 	file://e431ab003f3fabf616b6eb7dc93f8967bc9473e5.patch \
 "
-SRC_URI[archive.sha256sum] =3D "0bdd8fc0caecd6eb013c6010dbca93077397118a=
6ef5eaf264e2a820a292f5b7"
+SRC_URI[archive.sha256sum] =3D "d6b9245b22237da7bd1739dd28c23cc8f3835f99=
fa10c1037d9dd7635335251c"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.43.0


