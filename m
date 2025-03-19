Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B35CC35FFF
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 19:11:39 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.2998.1742411490471371576
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 12:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id 5D377FD7
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 20:11:28 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.245]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuyp4-4Ziteb0; Wed, 19 Mar 2025 20:11:26 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] evince: update 46.3 -> 48.0
Date: Wed, 19 Mar 2025 20:12:09 +0100
Message-ID: <20250319191210.328548-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1742411486-EB7E8B7D-3C1A5E28/0/0 CLEAN NORMAL
X-TOI-MSGID: 66782889-0a56-4dab-9b4a-e6c3a1a2b3ac
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 19:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116106

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Evince 48.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

backend:
  * Add missing break to make two columns right work (#1395, Alexandre Fr=
anke)
  * Add missing break to make two columns right work (#1395, Alexandre Fr=
anke)
  * Improve support for Adobe PDF open parameters (#2044, #222, #5, #7, N=
elson Ben=C3=ADtez Le=C3=B3n)
  * Do not implement module loading through GTypeModule (Pablo Correa G=C3=
=B3mez)
  * Dvi: Fix code style relate to inline functions (Qiu Wenbo)
  * Dvi: Remove always false check (Qiu Wenbo)
  * Use GDateTime alternatives for EvAttachment (Pablo Correa G=C3=B3mez)
  * Remove usage of ev_backends_manager_get_document (Qiu Wenbo)

build:
  * Bump libraries' API version to 4, do not hard-code (Pablo Correa Gome=
z)
  * Bump the minimum required version of cairo to 1.14.0 (Qiu Wenbo)
  * Bumpt libview, libdocument and Evince API version (Germ=C3=A1n Poo-Ca=
ama=C3=B1o)
  * Enable dri permission in flatpak (Germ=C3=A1n Poo-Caama=C3=B1o)
  * Fix app_id for flatpak in development mode (Germ=C3=A1n Poo-Caama=C3=B1=
o)
  * Fix generated desktop file names (Germ=C3=A1n Poo-Caama=C3=B1o)
  * Improve build location (Germ=C3=A1n Poo-Caama=C3=B1o)
  * Improve development build story (Germ=C3=A1n Poo-Caama=C3=B1o)
  * Reduce indirections to generate desktop files (Germ=C3=A1n Poo-Caama=C3=
=B1o)
  * Remove ENABLE_NLS flag (Qiu Wenbo)
  * Remove indirection for building schemas (Germ=C3=A1n Poo-Caama=C3=B1o=
)
  * Remove gidocgen submodule and requirement (Pablo Correa G=C3=B3mez)
  * Remove name suffix workaround on MacOS (Qiu Wenbo)
  * Remove org.gnome.SettingsDaemon.MediaKeys (Maximiliano Sandoval R)
  * Remove unused EVINCEDATADIR (Qiu Wenbo)
  * Rename GNOMELOCALEDIR to EV_LOCALEDIR (Qiu Wenbo)
  * Set HAVE_CAIRO_PDF and HAVE_CAIRO_PS in config (Qiu Wenbo)
  * Update dependencies in flatpak (Germ=C3=A1n Poo-Caama=C3=B1o)
  * Update dependency versions for flatpak (Germ=C3=A1n Poo-Caama=C3=B1o)
  * Update flatpak dependencies (Germ=C3=A1n Poo-Caama=C3=B1o)
  * Updated flatpak poppler dependency (Andrew Murray)
  * Use different names when in development (Germ=C3=A1n Poo-Caama=C3=B1o=
)
  * Version bump (Germ=C3=A1n Poo-Caama=C3=B1o)

ci:
  * Bump Ubuntu version to add libadwaita (Germ=C3=A1n Poo-Caama=C3=B1o)
  * Set development build in flatpak (Germ=C3=A1n Poo-Caama=C3=B1o)
  * Use updated image for both gtk3 and gtk4 (Germ=C3=A1n Poo-Caama=C3=B1=
o)
  * Add default template (Pablo Correa G=C3=B3mez)

data:
  * Add vcs-browser URL support (Sabri =C3=9Cnal)
  * Fix URLs in metadata (#2024, Germ=C3=A1n Poo-Caama=C3=B1o)
  * Fix appdata to use custom app-id (Germ=C3=A1n Poo-Caama=C3=B1o)
  * Fix typo in URL (#2030, Germ=C3=A1n Poo-Caama=C3=B1o)
  * Improve appdata for AppStream 1.0 (Sabri =C3=9Cnal)
  * Remove unused icons (Pablo Correa G=C3=B3mez)
  * Remove none OARS tags (Sabri =C3=9Cnal)
  * Update the copyright year (Sabri =C3=9Cnal)
  * Replace non-existing mailing list with GNOME Discourse URL (Andre Kla=
pper)
  * metainfo: Move from top-level dir to data dir (Pablo Correa G=C3=B3me=
z)
  * metainfo: Use gitlab issues as the official bugtracker (#1969, Pablo =
Correa G=C3=B3mez)

docs:
  * Fix dead link in CONTRIBUTING (Rebecca Palmer)

general:
  * "go to previous page" action restores scroll position (#1458, Robert =
Gay)
  * Do not disable deprecations by default on Evince (Pablo Correa G=C3=B3=
mez)
  * Fix warning about function pointer cast (Qiu Wenbo)
  * Remove gspell feature for spell checking (Qiu Wenbo)
  * Remove usage of deprecated GdkColor (Qiu Wenbo)

help:
  * Fix invalid markup in Hungarian translation (Andre Klapper)
  * Correct dead IRC link (Andre Klapper)

libdocument:
  * Add IGNORE_DEPRECATED guards around GTime usage (Pablo Correa G=C3=B3=
mez)
  * Declare EvDocument as derivable type (Qiu Wenbo)
  * Declare EvImage as final type (Qiu Wenbo)
  * Declare EvLayer as final type (Qiu Wenbo)
  * Declare EvLink as final type (Qiu Wenbo)
  * Declare EvLinkAction as final type (Qiu Wenbo)
  * Declare EvLinkDest as final type (Qiu Wenbo)
  * Declare EvMedia as final type (Qiu Wenbo)
  * Declare EvPage as final type (Qiu Wenbo)
  * Declare EvRenderContext as final type (Qiu Wenbo)
  * Declare EvTransitionEffect as final type (Qiu Wenbo)
  * Fix a crash with ev_document_factory_new_document_for_mime_type (Qiu =
Wenbo)
  * Remove all but one find API (Pablo Correa G=C3=B3mez)
  * Remove old macros used for backend registration (Pablo Correa G=C3=B3=
mez)
  * Remove deprecated GTime from EvAttachment (Qiu Wenbo)
  * Remove deprecated GTime from EvDocumentInfo (Qiu Wenbo)
  * Remove deprecated ev_document_misc_get_thumbnail_frame (Pablo Correa =
G=C3=B3mez)
  * Remove deprecated ev_annotation_set_modified_from_time (Qiu Wenbo)
  * Remove deprecated ev_backends_manager_get_document_module_name (Qiu W=
enbo)
  * Remove deprecated ev_backends_manager_get_document_type_info (Qiu Wen=
bo)
  * Remove deprecated ev_document_find_find_text (Qiu Wenbo)
  * Remove deprecated ev_document_misc_format_date (Qiu Wenbo)
  * Remove deprecated ev_document_misc_get_loading_thumbnail (Qiu Wenbo)
  * Remove deprecated ev_document_misc_get_page_border_size (Qiu Wenbo)
  * Remove deprecated ev_document_misc_get_screen_dpi (Qiu Wenbo)
  * Remove deprecated ev_document_misc_paint_one_page (Qiu Wenbo)
  * Remove EvAsyncRenderer interface (Pablo Correa G=C3=B3mez)
  * Remove ev-backends-manager.h (Qiu Wenbo)
  * Remove ev_document_misc_render_thumbnail_with_frame (Pablo Correa G=C3=
=B3mez)
  * Remove redundant initialization (Qiu Wenbo)
  * Remove unused rendering API (Qiu Wenbo)
  * Remove usage of deprecated g_module_build_path (Qiu Wenbo)
  * Use G_DECLARE_INTERFACE to simplify custom macros (Qiu Wenbo)
  * Use GtkFileChooser in add filters (#1863, Jake Dane)
  * Use exempi to replace hand written parser (Qiu Wenbo)
  * Use mkenums_simple to simplify code generation (Qiu Wenbo)

libmisc:
  * Fix regression after porting to g_clear_signal_handler (Germ=C3=A1n P=
oo-Caama=C3=B1o)
  * Move ev-search-box from libmisc to shell (Pablo Correa Gomez)
  * Port EvPageAction to UI template (Qiu Wenbo)
  * Port to g_clear_signal_handler (#1988, Pablo Correa G=C3=B3mez)
  * Re-parent EvPageActionWidget to a GtkBox (Pablo Correa G=C3=B3mez)
  * Send the page in "updated" signal ev-search-box as defined (Pablo Cor=
rea Gomez)

libview:
  * Don't attempt to load non-seekable files directly (#1971, Corey Berla=
)
  * Do not define unnecessary function prototype ahead (Pablo Correa G=C3=
=B3mez)
  * Removed deprecated ev_view_find_changed (#682875, Pablo Correa G=C3=B3=
mez)
  * Do not keep track of annotation window position with respect to view =
(Pablo Correa G=C3=B3mez)
  * Do not track fullscreen mode (Pablo Correa G=C3=B3mez)
  * Drop EV_JOB_THUMBNAIL_PIXBUF option, and all related code (Pablo Corr=
ea G=C3=B3mez)
  * EvJobFind: use EvFindOptions instead of old case_sensitive (Pablo Cor=
rea G=C3=B3mez)
  * Fix transformation of view coordinates (#1951, Marek Kasik)
  * Initialize window_children list to NULL (Pablo Correa G=C3=B3mez)
  * Improve detection of non-seekable files (#2037, Nelson Ben=C3=ADtez L=
e=C3=B3n)
  * Just use gbooleans to keep track of cache state (Germ=C3=A1n Poo-Caam=
a=C3=B1o)
  * Let EvAnnotationWindow focus be managed by GTK (Pablo Correa G=C3=B3m=
ez)
  * Make deprecated ev_view_scroll private (Pablo Correa G=C3=B3mez)
  * Make deprecated ev_view_set_loading private (Pablo Correa G=C3=B3mez)
  * Only hide annotations if the page went out of range (Pablo Correa G=C3=
=B3mez)
  * Remove EvStockIcons (Pablo Correa G=C3=B3mez)
  * Remove always true check about GTK version (Qiu Wenbo)
  * Remove deprecated EV_SIZING_BEST_FIT (Qiu Wenbo)
  * Remove deprecated dual_page property (Qiu Wenbo)
  * Remove deprecated ev_job_find_get_n_results (Qiu Wenbo)
  * Remove ev_annotation_window_set_annotation (Pablo Correa G=C3=B3mez)
  * Remove fullscreen property in document-model (Pablo Correa G=C3=B3mez=
)
  * Remove multimedia media player (Qiu Wenbo)
  * Rename EvJobRender to EvJobRenderCairo (Pablo Correa G=C3=B3mez)
  * Rename EvJobThumbnail to EvJobThumbnailCairo (Pablo Correa G=C3=B3mez=
)
  * Silence maybe-uninitialized warnings (Pablo Correa G=C3=B3mez)
  * Stop using deprecated ev_view_scroll (Pablo Correa G=C3=B3mez)
  * Stop using deprecated ev_document_misc_get_thumbnail_frame (Pablo Cor=
rea G=C3=B3mez)
  * Use configure-event signal instead of custom one (Pablo Correa G=C3=B3=
mez)
  * Use decorated window in EvAnnotationWindow (Pablo Correa Gomez)
  * Use mkenums_simple to simplify code generation (Qiu Wenbo)

po:
  * Fix updated files (Sabri =C3=9Cnal)
  * Remove unused Makevars (Qiu Wenbo)
  * Update translations files from main branch (Germ=C3=A1n Poo-Caama=C3=B1=
o)

previewer:
  * Merge EvPreviewerToolbar into EvPreviewerWindow (Pablo Correa G=C3=B3=
mez)
  * Remove un-used invocation of ev_stock_icons (Mads Chr. Olesen)
  * Use ui template for EvPreviewerToolbar (Pablo Correa G=C3=B3mez)

shell:
  * Avoid crash when deleting annotation (#2022, Nelson Ben=C3=ADtez Le=C3=
=B3n)
  * Remove GtkIconFactory code (Pablo Correa G=C3=B3mez)
  * Activate search-outline mode from text entry (#1991, Nelson Ben=C3=AD=
tez Le=C3=B3n)
  * Add "document-model" property to EvToolbar (Pablo Correa G=C3=B3mez)
  * Add a place holder for empty recent view (#992, Raffaele Tranquillini=
)
  * Check icon_view exists upon usage in EvSidebarThumbnails (#1996, Pabl=
o Correa G=C3=B3mez)
  * Derive EvRecentView from GtkBin to simplify GTK4 move (Pablo Correa G=
=C3=B3mez)
  * Deprecate GTime related functions for GDateTime variants (Pablo Corre=
a G=C3=B3mez)
  * Do not keep track of EvWindow parent in a EvToolbar property (Pablo C=
orrea G=C3=B3mez)
  * Do not update links model when going fullscreen (Pablo Correa Gomez)
  * Do not use gtk_window_resize (Pablo Correa Gomez)
  * Don't check for "show_toolbar" metadata value (Pablo Correa G=C3=B3me=
z)
  * Don't set show close button on infobar (Pablo Correa G=C3=B3mez)
  * Evince-recent-view.ui: indent according to editorconfig (Pablo Correa=
 G=C3=B3mez)
  * Fix signal handler id types (Pablo Correa G=C3=B3mez)
  * Keep track of fullscreen through action instead of model (Pablo Corre=
a G=C3=B3mez)
  * Make buttons don't grab focus on click (Nelson Ben=C3=ADtez Le=C3=B3n=
)
  * Modernize freeing EvRegisterDocData in ev-application (Pablo Correa G=
omez)
  * Move EvWindow menus from generic file to template (Pablo Correa G=C3=B3=
mez)
  * Move EvWindow model to template (Pablo Correa G=C3=B3mez)
  * Move application id constant to meson (Germ=C3=A1n Poo-Caama=C3=B1o)
  * Move dbus dependent definitions to meson (Germ=C3=A1n Poo-Caama=C3=B1=
o)
  * Only set "fullscreen" in metadata if it's not maximized (#1985, Pablo=
 Correa Gomez)
  * Only set "fullscreen" in metadata if it's not maximized (#1985, Pablo=
 Correa G=C3=B3mez)
  * Port to g_clear_signal_handler (#1988, Pablo Correa G=C3=B3mez)
  * Properly organize EvRecentView widgets (#2000, Pablo Correa G=C3=B3me=
z)
  * Remove EV_CHROME since only used for sidebar (Pablo Correa G=C3=B3mez=
)
  * Remove EV_CHROME_FINDBAR and EV_CHROME_FULLSCREEN_TOOLBAR (Pablo Corr=
ea G=C3=B3mez)
  * Remove EV_CHROME_RAISE_TOOLBAR (Pablo Correa G=C3=B3mez)
  * Remove EV_CHROME_TOOLBAR, unconditionally set to TRUE (Pablo Correa G=
=C3=B3mez)
  * Remove MediaKeys support (#1762, Qiu Wenbo)
  * Remove sidebar_page_main_widget_update_cb from EvWindow (Pablo Correa=
 G=C3=B3mez)
  * Remove unused EV_TOOLBAR_MODE_FULLSCREEN (Pablo Correa G=C3=B3mez)
  * Revert Simplify reset_jobs calls" (#2035, Nelson Ben=C3=ADtez Le=C3=B3=
n)
  * Show close button by default in EvToolbar (Pablo Correa G=C3=B3mez)
  * Stop fullscreen activation on the thumbnails' sidebar (Pablo Correa G=
=C3=B3mez)
  * Stop using EvStockIcon within the application (Pablo Correa G=C3=B3me=
z)
  * Stop using aux sidebar_widget in EvWindow creating the sidebar (Pablo=
 Correa G=C3=B3mez)
  * Use G_DECLARE_INTERFACE to simplify custom macros (Qiu Wenbo)
  * Use g_timeout_add_once and g_idle_add_once (Pablo Correa G=C3=B3mez)
  * Use gtk_widget_set_visible instead of custom function (Pablo Correa G=
=C3=B3mez)
  * Use page_layout instead of dual_page (Qiu Wenbo)
  * Use sidebar-show-symbolic icon instead of custom one (Qiu Wenbo)
  * When "saving as.." don't copy the original file modification time (#7=
06, Nelson Ben=C3=ADtez Le=C3=B3n)
  * Use box-shadow to draw the shadow when possible (Qiu Wenbo)

thumbnailer:
  * Remove async renderer code path (Qiu Wenbo)

Developers:
  * Alexandre Franke, Andre Klapper, Andrew Murray, Brage Fuglseth, Corey=
 Berla, Germ=C3=A1n Poo-Caama=C3=B1o, Jake Dane, Mads Chr. Olesen, Marek =
Kasik, Maximiliano Sandoval R, Nelson Ben=C3=ADtez Le=C3=B3n, Pablo Corre=
a Gomez, Pablo Correa G=C3=B3mez, Piotr Dr=C4=85g, Qiu Wenbo, Raffaele Tr=
anquillini, Rebecca Palmer, Robert Gay, Sabri =C3=9Cnal

Translations:
  * Asier Sarasua Garmendia (Basque)
  * Vasil Pupkin (Belarusian)
  * Rafael Fontenelle (Brazilian Portuguese)
  * Andi Chandler (British English)
  * twlvnn kraftwerk (Bulgarian)
  * Jordi Mas i Hernandez (Catalan)
  * Luming Zh (Chinese (China))
  * Chao-Hsiung Liao (Chinese (Taiwan))
  * Daniel Rusek (Czech)
  * Alan Mortensen (Danish)
  * Nathan Follens (Dutch)
  * Kristjan SCHMIDT (Esperanto)
  * Jiri Gr=C3=B6nroos (Finnish)
  * Ir=C3=A9n=C3=A9e THIRION (French)
  * Fabio Tomat (Friulian)
  * Fran Dieguez (Galician)
  * Ekaterine Papava (Georgian)
  * J=C3=BCrgen Benvenuti (German)
  * Philipp Kiemle (German)
  * Efstathios Iosifidis (Greek)
  * Yaron Shahrabani (Hebrew)
  * Yosef Or Boczko (Hebrew)
  * Guntupalli Karunakar (Hindi)
  * Scrambled 777 (Hindi)
  * Bal=C3=A1zs =C3=9Ar (Hungarian)
  * Andika Triwidada (Indonesian)
  * Baurzhan Muftakhidinov (Kazakh)
  * Changwoo Ryu (Korean)
  * R=C5=ABdolfs Mazurs (Latvian)
  * Aurimas =C4=8Cernius (Lithuanian)
  * Quentin PAG=C3=88S (Occitan)
  * Danial Behzadi (Persian)
  * Piotr Dr=C4=85g (Polish)
  * Hugo Carvalho (Portuguese)
  * Amn Alam (Punjabi)
  * Daniel =C8=98erb=C4=83nescu (Romanian)
  * Florentina Mu=C8=99at (Romanian)
  * Artur S0 (Russian)
  * Sergej A (Russian)
  * =D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D1=9B (=
Serbian)
  * Du=C5=A1an Kazik (Slovak)
  * Jose Riha (Slovak)
  * Martin (Slovenian)
  * Daniel (Spanish)
  * Anders Jonsson (Swedish)
  * Sabri =C3=9Cnal (Turkish)
  * Yuri Chornoivan (Ukrainian)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/evince/{evince_46.3.bb =3D> evince_48.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_46.3.bb =3D> evince_48.0.=
bb} (95%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_46.3.bb b/meta-gnome/=
recipes-gnome/evince/evince_48.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/evince/evince_46.3.bb
rename to meta-gnome/recipes-gnome/evince/evince_48.0.bb
index 47c0950b61..9f9de50acf 100644
--- a/meta-gnome/recipes-gnome/evince/evince_46.3.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_48.0.bb
@@ -33,7 +33,7 @@ REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DIS=
TRO_FEATURES', 'x11', 'open
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI[archive.sha256sum] =3D "bc0d1d41b9d7ffc762e99d2abfafacbf745182f0=
b31d86db5eec8c67f5f3006b"
+SRC_URI[archive.sha256sum] =3D "cd2f658355fa9075fdf9e5b44aa0af3a7e0928c5=
5614eb1042b36176cf451126"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.48.1


