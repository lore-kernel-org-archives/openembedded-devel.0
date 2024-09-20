Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD2BCF9C47
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:11 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.20593.1726844890012247634
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id C1390DE49
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfEU-3JaG0S0; Fri, 20 Sep 2024 17:07:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 12/23] gnome-text-editor: update 46.3 -> 47.0
Date: Fri, 20 Sep 2024 17:08:11 +0200
Message-ID: <20240920150822.1131707-12-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726844862-F57F8467-4E86E550/0/0 CLEAN NORMAL
X-TOI-MSGID: 48ea6cc5-2932-46f7-91d2-1c93bf02dc43
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112416

- use libspelling instead of enchant2

 * Fix focus ring around checkmark in save-changes dialog
 * Translation updates
 * Text Editor now uses libspelling for spellchecking
 * Various CSS fixes for transitioning to AdwDialog
 * implicit-trailing-newline is now turned on by default
 * Various recoloring tweaks to better match platform styling.
 * Improvements to use of AdwDialog.
 * Print operations improvements.
 * Spellcheck improvements including support for use with F10/Menu.
 * Prefer wide layout for save-changes-dialog.
 * Various UI elements have been ported to new libadwaita features so
   this is a good chance to discover bugs early.
 * A number of papercuts in accordance with the GNOME HIG.
 * Text Editor will try harder to break out of potential CPU cyclic
   issues from GTK forward validation of text buffers. This should
   help reduce CPU usage if/when large files are closed.
 * Various spellcheck improvements.
 * Ensure encoding is propagated when using Save As.
 * More detailed error messages in the error banner.
 * Many translation updates.
Thanks to everyone who contributed!

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-text-editor_46.3.bb =3D> gnome-text-editor_47.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_46.=
3.bb =3D> gnome-text-editor_47.0.bb} (80%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor=
_46.3.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_4=
7.0.bb
similarity index 80%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_=
46.3.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_47=
.0.bb
index 1e3268238..71d0f2c12 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.3.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_47.0.b=
b
@@ -9,7 +9,7 @@ DEPENDS =3D " \
     gtk4 \
     gtksourceview5 \
     editorconfig-core-c \
-    enchant2 \
+    libspelling \
 "
=20
 GTKIC_VERSION =3D "4"
@@ -18,7 +18,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mim=
e-xdg features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "005b48104a909be66ae07448d2bc5706c7d11378=
1057a24ff6da55bdf324c73d"
+SRC_URI[archive.sha256sum] =3D "0304961974bdacc7e6e8d146dadc949527df99b2=
823582c8d1ba8b33d25d4217"
=20
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
--=20
2.46.0


