Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFCAC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 09:18:43 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.7354.1742289521607405426
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 02:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout11.t-online.de (Postfix) with SMTP id 4EC1EA41
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 10:17:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.234.59]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuT52-2eYOYu0; Tue, 18 Mar 2025 10:17:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 4/4] gnome-text-editor: update 47.2 -> 48.1
Date: Tue, 18 Mar 2025 10:18:27 +0100
Message-ID: <20250318091827.831270-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318091827.831270-1-f_l_k@t-online.de>
References: <20250318091827.831270-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742289468-A17F05D8-3F78ED46/0/0 CLEAN NORMAL
X-TOI-MSGID: 6257761e-f1a0-4707-9e56-27ab81716eb9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 09:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116055

 * Fix accessibility properties on search entry
 * Translation updates

 * Defaults for markdown no longer imply 80 char right margin and
   it is instead inherted from gsetting defaults.
 * Fallback indentation selection is in preferences now.
 * Translation updates

 * Slight UI tweaks to the open button to allow for better shrinking
   of the window to narrow sizes
 * Search bar cancellation bug fixes
 * Fix right-margin-position in preferences not working on some
   distributions
 * Translation updates

 * More refinement on design updates
 * Search bar moved to bottom of text area
 * Track changes in xdg-portal
 * Translation updates

 * The view menu has been removed in favor of a new properties panel
   based on feedback from users over the past couple of years.
 * The indention selection menu has also been removed for the same
   reason.
 * More options in preferences have been exposed.
 * The 'grid' option has been removed from preferences as it has had
   a number of issues. Though if you've enabled it, it will continue
   to be visible to allow turning it off.
 * Opening files with encoding errors will present the option to select
   an encoding from the infobar.
 * Text Editor now uses the new "text" GtkFileDialog APIs from GTK.
   This should allow using portals and thus, Nautilus as a file chooser.
 * Document statistics can be updated as you type in the new panel.
 * The language selection dialog shows recent languages above other
   languages to make common changes quicker.
 * The position label is now displayed above the editor view when the
   cursor moves for reasons other than typing such as jumping by arrow
   movement or mouse/touch press to move the cursor.
 * Fix alignment/sizing of zoom buttons.
 * A new fullscreen mode similar to Ptyxis/Epiphany.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-text-editor_47.2.bb =3D> gnome-text-editor_48.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_47.=
2.bb =3D> gnome-text-editor_48.1.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor=
_47.2.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_4=
8.1.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_=
47.2.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_48=
.1.bb
index aad4842e52..317d082940 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_47.2.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_48.1.b=
b
@@ -18,7 +18,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mim=
e-xdg features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "7d04039b16174ec5fd65fea2f447f3febd9fdf2a=
a36e9997abc6ff992cc31e38"
+SRC_URI[archive.sha256sum] =3D "52089ba978a665841803b1b69e0e7be75b09a7d5=
4e01e8d0bb29926e0f342437"
=20
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
--=20
2.48.1


