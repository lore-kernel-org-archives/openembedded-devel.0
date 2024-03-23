Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561E1CD1283
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 08:41:27 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.5315.1711183282130461436
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 01:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id 493CA5AAC0
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 09:41:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnwwE-1MMRGi0; Sat, 23 Mar 2024 09:41:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 08/13] gnome-text-editor: update 45.1 -> 46.0
Date: Sat, 23 Mar 2024 09:41:33 +0100
Message-ID: <20240323084138.178281-8-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240323084138.178281-1-f_l_k@t-online.de>
References: <20240323084138.178281-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1711183274-0CA7E850-EC7A9838/0/0 CLEAN NORMAL
X-TOI-MSGID: 28603dd6-24db-4fe1-a720-be892004bc1c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 08:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109538

 =E2=80=A2 Various performance workarounds have been added to the overvie=
w
   map to improve rendering performance and quality with fractional
   scaling.
 =E2=80=A2 Translation updates

Changes since 46.beta

 =E2=80=A2 Disable editing while document is loading
 =E2=80=A2 Discard still-loading documents when saving session
 =E2=80=A2 Fix some tab integration issues with libadwaita

Changes since 46.alpha

 =E2=80=A2 Use AdwAboutDialog
 =E2=80=A2 Fix keyboard access to light/dark/follow theme selectors
 =E2=80=A2 Use GtkFontDialog instead of deprecated GtkFontChooserDialog
 =E2=80=A2 Check for files on disk before restoring drafts to avoid displ=
aying
   deleted files.
 =E2=80=A2 Performance improvements to the minimap on GTKs new renderer
 =E2=80=A2 Avoid draft auto-save file the document is still loading
 =E2=80=A2 The language selection dialog is now modal
 =E2=80=A2 A new-window action was added to .desktop file for GNOME Shell
 =E2=80=A2 Improve support for closing a page while it is still loading
 =E2=80=A2 Updated translations

 Changes since 45.0

 =E2=80=A2 Make various UI elements conform better to GNOME HIG
 =E2=80=A2 Fix etag usage when comparing changes from GFileMonitor
 =E2=80=A2 Cancel document loading when tab or window closes. This fixes =
an issue
   where you could have 100% CPU doing Pango line breaking on extremely l=
arge
   files even after closing a window or tab.
 =E2=80=A2 Improve margin for RTL languages
 =E2=80=A2 Updated appdata/metainfo
 =E2=80=A2 Fix memory leak in usage of GtkNativeDialog
 =E2=80=A2 Work around some broken user configurations for XDG special di=
rectories
 =E2=80=A2 Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-text-editor_45.1.bb =3D> gnome-text-editor_46.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_45.=
1.bb =3D> gnome-text-editor_46.0.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor=
_45.1.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_4=
6.0.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_=
45.1.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46=
.0.bb
index 2d310bd05..967182aea 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.0.b=
b
@@ -18,7 +18,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mim=
e-xdg features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "6a86ec9920f466b6ed92695524d3b507b1e84272=
dafa5341d06a157de868af71"
+SRC_URI[archive.sha256sum] =3D "c018d0b3792c044c1558d1d0dd92b09fb0a96c9e=
2d25e1ae1f4cf91f7eab4614"
=20
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
--=20
2.44.0


