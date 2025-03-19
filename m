Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE06C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 18:49:58 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.2608.1742410193541530241
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 11:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout02.t-online.de (Postfix) with SMTP id 79ED2E6D
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 19:49:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.245]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuyU7-13jEo70; Wed, 19 Mar 2025 19:49:47 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/4] file-roller: update 44.4 -> 44.5
Date: Wed, 19 Mar 2025 19:50:28 +0100
Message-ID: <20250319185029.296821-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319185029.296821-1-f_l_k@t-online.de>
References: <20250319185029.296821-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742410187-777E896A-69183CF8/0/0 CLEAN NORMAL
X-TOI-MSGID: a03823f0-54f9-40bb-a24c-38c95fcc0eaf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 18:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116103

Version 44.5
~~~~~~~~~~~~
Released: 2025-02-09

Bugfixes:
 * 7zip: ask the password again if it is wrong.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../file-roller/{file-roller_44.4.bb =3D> file-roller_44.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_44.4.bb =3D> fi=
le-roller_44.5.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_44.4.bb b/m=
eta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_44.4.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
index 8f2c6b7fe5..496e0dc7ae 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_44.4.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
@@ -17,7 +17,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings itstool gobject-introspection gnome-help get=
text upstream-version-is-even mime-xdg gtk-icon-cache features_check
=20
-SRC_URI[archive.sha256sum] =3D "b8c309da3aa784c719558c3466402378f4a3d6ca=
e8ed77cf6849aacd56ceb9ec"
+SRC_URI[archive.sha256sum] =3D "dfaf4bb989c0b8986be8bdae9fffeab8d0f30669=
ae3a627e8c3df94f23888339"
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
--=20
2.48.1


