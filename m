Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EDCC77B7C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.17452.1679731392214700433
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id F12C918979
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:09 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrl-0RoPhN0; Sat, 25 Mar 2023 09:03:09 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 05/32] gdm: update 43.0 -> 44.0
Date: Sat, 25 Mar 2023 09:02:29 +0100
Message-Id: <20230325080256.923752-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731389-8556AC08-D5455129/0/0 CLEAN NORMAL
X-TOI-MSGID: 2899f40d-fdeb-4c1b-8c81-a40af95dfdf2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101715

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gdm/{gdm_43.0.bb =3D> gdm_44.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_43.0.bb =3D> gdm_44.0.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_43.0.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_44.0.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gdm/gdm_43.0.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_44.0.bb
index 1b09c20d4..09e8acc72 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_43.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_44.0.bb
@@ -21,7 +21,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext syst=
emd useradd itstool gnome-help features_check
=20
-SRC_URI[archive.sha256sum] =3D "94d70d6ed7df59fa7fde4fd02fed1168593a8adc=
e10fcee113c148d52b392294"
+SRC_URI[archive.sha256sum] =3D "ce20b0a221dbf8cde0064b501fd8f38f73839152=
857c4535337eb09cc52f7f6c"
=20
 EXTRA_OEMESON =3D " \
     -Dplymouth=3Ddisabled \
--=20
2.34.1


