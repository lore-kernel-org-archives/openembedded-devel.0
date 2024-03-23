Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F121CD1284
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 08:41:27 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.5242.1711183282109762068
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 01:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id 46415452EC
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 09:41:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnwwE-1MMRGg0; Sat, 23 Mar 2024 09:41:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 06/13] libgtop: update 2.41.1 -> 2.41.3
Date: Sat, 23 Mar 2024 09:41:31 +0100
Message-ID: <20240323084138.178281-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240323084138.178281-1-f_l_k@t-online.de>
References: <20240323084138.178281-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711183274-0CA7E850-11833BEA/0/0 CLEAN NORMAL
X-TOI-MSGID: d3d9880a-0660-451e-9251-5d4caf61e487
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 08:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109537

This update is required for gnome-system-monitor-46.0
---
 .../libgtop/{libgtop_2.41.1.bb =3D> libgtop_2.41.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libgtop/{libgtop_2.41.1.bb =3D> libgtop_=
2.41.3.bb} (80%)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.1.bb b/meta-gn=
ome/recipes-gnome/libgtop/libgtop_2.41.3.bb
similarity index 80%
rename from meta-gnome/recipes-gnome/libgtop/libgtop_2.41.1.bb
rename to meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb
index a8483de1a..5587baa0f 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.1.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb
@@ -7,6 +7,6 @@ inherit gnomebase lib_package gtk-doc gobject-introspecti=
on gettext upstream-ver
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-SRC_URI[archive.sha256sum] =3D "43ea9ad13f7caf98303e64172b191be9b96bab34=
0b019deeec72251ee140fe3b"
+SRC_URI[archive.sha256sum] =3D "775676df958e2ea2452f7568f28b2ea581063d31=
2773dd5c0b7624c1b9b2da8c"
=20
 DEPENDS =3D "glib-2.0 libxau"
--=20
2.44.0


