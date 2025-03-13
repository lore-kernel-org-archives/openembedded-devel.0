Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC4BC28B28
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 07:43:48 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.9441.1741851821844113789
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 00:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id 081251031
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 08:43:38 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.231.110]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tsdE9-4WdEZD0; Thu, 13 Mar 2025 08:43:37 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][gnome48][meta-gnome][PATCH 7/8] gtksourceview: update 5.12.0 -> 5.15.1
Date: Thu, 13 Mar 2025 08:44:10 +0100
Message-ID: <20250313074411.5600-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313074411.5600-1-f_l_k@t-online.de>
References: <20250313074411.5600-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741851817-BE7FA466-4A9CD199/0/0 CLEAN NORMAL
X-TOI-MSGID: b6e5b94d-983e-48c9-b031-61bad39c2473
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 07:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115958

News in 5.15.1, 2025-02-24
--------------------------
 * Remove use of various GTK deprecations
 * Testsuite improvements
 * Translation updates
News in 5.15.0, 2025-02-02
--------------------------
This is a beta release for GNOME 48.beta
 * Various introspection fixes
 * Improvements to GtkSourceAssistants
 * Various GtkTextIter performance improvements
 * Deduplication fixes when sorting
 * Alter paths for resource:// usage so that resources take priority
   over system installations other than the current one
 * Adwaita.xml, Adwaita-dark.xml style updates
 * Quantize Y position for gutter line numbers
 * New and updated languages: meson.lang, zig.lang
 * Translation updates
News in 5.14.1, 2024-10-04
--------------------------
This is a bug-fix release for GNOME 47
 * Ensure you cannot show context menu from GtkSourceMap which otherwise
   has a limited FontMap containing only the BuilderBlocks font.
News in 5.14.0, 2024-09-13
--------------------------
This is a stable release for GNOME 47.0
 * Fix an issue where the gutter would not redraw when focus changes.
 * Add support for Groff syntax
News in 5.13.1, 2024-08-04
--------------------------
This is an unstable release update for GNOME 47.beta
 * Documentation improvements
 * Improve performance of BuilderBlocks font loading. Some of this
   effort required changes to the TTF, so user testing with a wide
   variety of languages is desired. This should reduce startup time
   of GtkSourceView using applications.
 * gtk-doc.lang: highlight `backtick` spans
 * c.lang: highlight [[]] style attributes
 * java.lang: improve escaped character matching
 * Adwaita.xml, Adwaita-dark.xml: style updates to track platform
   changes for GNOME 47.
News in 5.13.0, 2024-06-28
--------------------------
This is an unstable release update for GNOME 47.alpha
 * Ensure gutter renderers are released during dispose
 * Make default auto-indenter keep indentation when cursor is at line sta=
rt
 * python3.lang: Fix f-string in curly braces to have no-spellcheck appli=
ed
 * Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gtksourceview5_5.12.0.bb =3D> gtksourceview5_5.15.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.12.0.bb =
=3D> gtksourceview5_5.15.1.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.12.0=
.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.15.1.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.12.0.=
bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.15.1.bb
index f3267acbeb..33a4832fcd 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.12.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.15.1.bb
@@ -23,8 +23,8 @@ inherit gnomebase lib_package gettext features_check gi=
-docgen gtk-icon-cache go
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI =3D "https://download.gnome.org/sources/gtksourceview/5.12/${PNA=
ME}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "daf32ff5d3150d6385917d3503a85b9e047ba158b2b03079=
314c9c00813fa01f"
+SRC_URI =3D "https://download.gnome.org/sources/gtksourceview/5.15/${PNA=
ME}-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "39c0c82148c088a7a65765c4fb8f9f045590bf0b464930ba=
32c9f709b2a5f40e"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
--=20
2.48.1


