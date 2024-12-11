Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F87E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 18:45:25 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.2282.1733942716799697638
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 10:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout09.t-online.de (Postfix) with SMTP id BD5FB702
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 19:45:13 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.33.231]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tLRhw-2dQpBh0; Wed, 11 Dec 2024 19:45:12 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-text-editor: update 47.0 -> 47.2
Date: Wed, 11 Dec 2024 19:45:17 +0100
Message-ID: <20241211184517.22413-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1733942712-2E7FB9DE-368CCC15/0/0 CLEAN NORMAL
X-TOI-MSGID: 70144f2f-db84-4606-9b5f-6274b6c926cf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 18:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114282

 * Unescaping URIs for tooltips to improve legibility
 * Fix initial-trailing-newline when settings auto-discovery is disabled
 * Fix save-as when using admin:// URIs
 * Pin document encoding when loading a file
 * Override extend_selection for multi-mouse-press to avoid some slow
   corner cases in minified JSON files
 * Markup fixes in properties dialog
 * Updated translations

 * Fix document to default to implicit trailing newlines
 * Improve text wrapping for banners on small form factors

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-text-editor_47.0.bb =3D> gnome-text-editor_47.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_47.=
0.bb =3D> gnome-text-editor_47.2.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor=
_47.0.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_4=
7.2.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_=
47.0.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_47=
.2.bb
index 71d0f2c122..aad4842e52 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_47.0.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_47.2.b=
b
@@ -18,7 +18,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mim=
e-xdg features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "0304961974bdacc7e6e8d146dadc949527df99b2=
823582c8d1ba8b33d25d4217"
+SRC_URI[archive.sha256sum] =3D "7d04039b16174ec5fd65fea2f447f3febd9fdf2a=
a36e9997abc6ff992cc31e38"
=20
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
--=20
2.47.0


