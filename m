Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.48764.1591047936700509170
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qzfN3MN2;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id r15so1008572wmh.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DjkQRWnEibLHRR/vQUccVbhEj/MkzGYtUrrNZ6cGC68=;
        b=qzfN3MN2UMqczWTnjpznNshiZfxnsW7H+tpTZ2W1cnWQTI4zeBBUfdHxItgmVBIHdT
         dKxHagwGiJDyXI1+SvjCehboviD5FY8hGu3H3vxWZICUufoRSll2XROx0UCZ6LJ353Jq
         I3puCeqFtUoWWv2XC6XXViuGWbKGbo0VIUbBZnY+8sMMJBcKIsQ5BfI8AKbeuJuHvSXB
         DDw+4U3zRNQlQWY9sk2U0DenYNXi8TDsE90ZJn1E29pxiNsLvDGf+6w+NU1t8fsViuqx
         VKlRp5OdqxbhP/abiSnW/6FX7SHY+zpQTlb2YAmXaiUDuN+QQNUT2wHTI7Hk1KjC+aAc
         Gt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DjkQRWnEibLHRR/vQUccVbhEj/MkzGYtUrrNZ6cGC68=;
        b=QklMzHIaPZozVkcyRRIXToNdqeUEDCSQwkaaTehLA+nR2Zxpmo7n6QjoTtamgUYDfE
         ZYkiQEOr9IQFRTSu/UnGlU4zv6DPGm4akXU9ra9NUad/HSWhuOWYNW66BP2hhtqGSgfH
         MAF16AZ/B1KfZYecdecO/58Wd4HsiZbqplklxy64/yu8a19IeZq6t2A9Tw5pcx33GIXH
         216PsOpERSNGLYo47ZcJF5HdawO9hH0qEh9dBZvbKuLntSxhInmmA+LzYl+g5Pju6qQn
         X/Mu41RdkuvNUkN90bcncnqk1NOkymoBbf6xLPeoKJQc/qxrzzk4FF8EtfAfQnxQ8saX
         +Qzg==
X-Gm-Message-State: AOAM533uVr+vunwJUCVQZ03lHHu6TaM05g42ZmJMKr1YOBnuEOS4eQfu
	zASfX5abM5lhSGeYQLgOO/snkisGFJE=
X-Google-Smtp-Source: ABdhPJwRepqtw25+JDW6Q26Rng7EaLlM03OcQ7V/7BmtRLcYWPk0aGIlDObuPSrHnHJLteP7shzSkA==
X-Received: by 2002:a1c:7206:: with SMTP id n6mr1219770wmc.4.1591047934787;
        Mon, 01 Jun 2020 14:45:34 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:34 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/38] evince: upgrade 3.34.2 -> 3.36.3
Date: Mon,  1 Jun 2020 23:44:45 +0200
Message-Id: <20200601214516.26624-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* port to meson build
* 0002-add-a-formatting-attribute-check.patch: Apllies cleanly but was not
  tested with clang - don't have resources for that

================
Evince    3.36.3
================

Fix Evince on MacOS

backends:
  *  Annotate functions that wraps formatting strings (#1410, GermÃ¡n Poo-CaamaÃ±o)
  *  Fix -Wformat-zero-length warning (GermÃ¡n Poo-CaamaÃ±o)

build:
  *  use so suffix on macOS (Tom Schoonjans)

ci:
  *  Fix meson targets (GermÃ¡n Poo-CaamaÃ±o)

cut-n-paste:
  *  Annotate functions that wraps formatting strings (#1410, GermÃ¡n Poo-CaamaÃ±o)

Developers:
  * GermÃ¡n Poo-CaamaÃ±o, Tom Schoonjans

================
Evince    3.36.2
================

shell:
  *  check type of window/sidebar objects (#1409, Ilario Gelmetti)

build:
  *  Use lowercase for project name in meson (GermÃ¡n Poo-CaamaÃ±o)

ci:
  *  build with meson by default and autotools manually (GermÃ¡n Poo-CaamaÃ±o)

flatpak: Update Poppler to 0.88.0 (Casey Jao)

Developers:
  * Casey Jao, GermÃ¡n Poo-CaamaÃ±o, Ilario Gelmetti

Translations:
  * sicklylife (Japanese)

================
Evince    3.36.1
================

backends:
  * Support 'de facto' tooltip feature (#34, #842, Nelson BenÃ­tez LeÃ³n)

ci:
  * Add scripts to update Docker image for CI (GermÃ¡n Poo-CaamaÃ±o)

help:
  * Add Ukrainian screenshots for the docs (Yuri Chornoivan)
  * Fix incorrect markup in Czech UI translation (Andre Klapper)
  * Update French help image (Charles Monzat)

libdocument:
  * Allow text entries to handle clicks (#1364, Nelson BenÃ­tez LeÃ³n)
  * Ignore deprecation warnings in headers (Matthew Leeds)

libview:
  * Fix "can-have-popup" prop when creating markup annotations (#1373, Casey Jao)
  * Move annotation popup window to new position (#570, Marek Kasik)

shell:
  * Set menu button to not focus-on-click (#1339, Nelson BenÃ­tez LeÃ³n)
  * Fix too large slides on scaled display (#1365, #2599, Nelson BenÃ­tez LeÃ³n)

snap:
  * Use removable-media for access to USB drives (SÃ©bastien Bacher)

Developers:
  * Andre Klapper, Casey Jao, Charles Monzat, GermÃ¡n Poo-CaamaÃ±o, Marek Kasik,
    Matthew Leeds, Nelson BenÃ­tez LeÃ³n, SÃ©bastien Bacher, Yuri Chornoivan

Translations:
  * Jordi Mas (Catalan)
  * Marek ÄŒernockÃ½ (Czech help)
  * Charles Monzat (French)
  * Fabio Tomat (Friulian)
  * Tim Sabsch (German)
  * Yosef Or Boczko (Hebrew)
  * Andika Triwidada (Indonesian)
  * Daniel È˜erbÄƒnescu (Romanian)
  * ÐœÐ°Ñ€ÐºÐ¾ ÐšÐ¾ÑÑ‚Ð¸Ñ› (Serbian)
  * Matej UrbanÄiÄ (Slovenian)
  * Anders Jonsson (Swedish)
  * Yuri Chornoivan (Ukrainian)

================
Evince    3.36.0
================

help:
  *  Update all annotations-nav-to-page.png screenshots to 3.34 UI (Andre Klapper)

Developers:
  * Andre Klapper

Translations:
  * Jordi Mas (Catalan)
  * Goran VidoviÄ‡ (Croatian)
  * Nathan Follens (Dutch)
  * Guillaume Bernard (French)
  * Gianvito Cavasoli (Italian)
  * Changwoo Ryu (Korean)
  * Piotr DrÄ…g (Polish)
  * Daniel Mustieles (Spanish)

=================
Evince    3.35.92
=================

backends:
  * Show XMP data if newer than modification date (Evangelos Rigas)
  * Fix some code formatting in poppler (GermÃ¡n Poo-CaamaÃ±o)

build:
  * Allow building with gettext >= 0.20 with autotools (#1312, Henry Gebhardt)
  * Bump dependency versions (GermÃ¡n Poo-CaamaÃ±o)
  * Update URL for libgxps (GermÃ¡n Poo-CaamaÃ±o)
  * Update flatpak rules to match Flatpak CI (GermÃ¡n Poo-CaamaÃ±o)
  * snap: Change grade (Ken VanDine)
  * Remove flatpak parts to use inherited instructions instead (GermÃ¡n Poo-CaamaÃ±o)

help:
  *  Fix broken pt_BR help translation (Andre Klapper)
  *  Mark an icon as non-translatable (Andre Klapper)
  *  No more 'Fullscreen' menu item (Andre Klapper)
  *  No more 'View options' menu (Andre Klapper)
  *  No more 'previously visited pages' (Andre Klapper)
  *  No more First Page and Last Page menu items (Andre Klapper)
  *  No more Previous Page and Next Page menu items (Andre Klapper)
  *  PDFEdit is dead (Andre Klapper)
  *  Remove an unneeded localized screenshot without any text (Andre Klapper)
  *  Remove deleted file also from Makefile.am, not only meson.build (Andre Klapper)
  *  Side bar is called Side Pane in the UI (Andre Klapper)
  *  Update Bookmarks instructions to 3.35 UI (Andre Klapper)
  *  Update items (and their order) shown in the header (Andre Klapper)
  *  Update names of annotation buttons below header bar (Andre Klapper)
  *  Add danish screenshots
  *  No 'Edit' menu anymore to save current settings as default (Andre Klapper)

shell/libraries:
  * Hopefully fix pipeline for 740f12f6 by removing another localized image (Andre Klapper)
  * Implement SaveAs named action. (#1314, Kris Jurka)
  * Remove accelerator label from menu (Sabri Ãœnal)
  * Remove gtk_menu_popup() calls (#1023, Jason Crain)
  * Remove shell/ev-bookmark-action.* (#1023, Jason Crain)
  * Remove unused variables and functions (Jason Crain)
  * Revert "ignore scroll, text selection events while unfocused" (#1316, GermÃ¡n Poo-CaamaÃ±o)
  * Update Keyboard Shortcuts page (Sabri Ãœnal)
  * ignore scroll, text selection events while unfocused (#943, Nelson BenÃ­tez LeÃ³n)
  * Lazily create annotation windows (#1010, Niels De Graef)
  * Don't move goto window offscreen (#1023, Jason Crain)
  * remove deprecated GdkScreen functions (#1023, Jason Crain)
  * set goto window's parent (Jason Crain)
  * Remove GTK < 3.22 popup code (Jason Crain)
  * Stop using GdkDeviceManager (#1023, Jason Crain)
  * fix rgba property id (Jason Crain)
  * remove _ev_g_mkdtemp function (Jason Crain)
  * Fix running_job volatile type (Jason Crain)
  * Update libnautilus-extension includes (Jason Crain)
  * Fix url in unimplemented named actions message (GermÃ¡n Poo-CaamaÃ±o)
  * Update screenshots to fit current UI (#1278, GermÃ¡n Poo-CaamaÃ±o)

Developers:
  * Andre Klapper, Evangelos Rigas, GermÃ¡n Poo-CaamaÃ±o, Henry Gebhardt,
    Jason Crain, Ken VanDine, Kris Jurka, Nelson BenÃ­tez LeÃ³n,
    Niels De Graef, Sabri Ãœnal, scootergrisen

Translations:
  * Asier Sarasua Garmendia (Basque)
  * Rafael Fontenelle (Brazilian Portuguese)
  * Bruce Cowan (British English)
  * Jordi Mas (Catalan)
  * Dz Chen (Chinese (China))
  * Chao-Hsiung Liao (Chinese (Taiwan))
  * Yi-Jyun Pan (Chinese (Taiwan))
  * Goran VidoviÄ‡ (Croatian)
  * Marek ÄŒernockÃ½ (Czech)
  * Alan Mortensen (Danish)
  * Carmen Bianca BAKKER (Esperanto)
  * Jiri GrÃ¶nroos (Finnish)
  * Alexandre Franke (French)
  * Alexandre Franke (French docs)
  * Fabio Tomat (Friulian)
  * Fran Dieguez (Galician)
  * BalÃ¡zs Ãšr (Hungarian)
  * Andika Triwidada (Indonesian)
  * Kukuh Syafaat (Indonesian)
  * sicklylife (Japanese)
  * Jor Teron (Karbi)
  * Aurimas ÄŒernius (Lithuanian)
  * Umarzuki Bin Mochlis Moktar (Malay)
  * Danial Behzadi (Persian)
  * ÐœÐ°Ñ€ÐºÐ¾ ÐšÐ¾ÑÑ‚Ð¸Ñ› (Serbian)
  * DuÅ¡an Kazik (Slovak)
  * Daniel Mustieles (Spanish)
  * Anders Jonsson (Swedish)
  * Emin Tufan Ã‡etin (Turkish)
  * Daniel Korostil (Ukrainian)

================
Evince    3.35.1
================

libview/ev-view:
  * Make document direction independent of UI direction (#830, Abderrahim Kitouni)
  * Follow the text direction for laying out pages in dual mode (#830, Abderrahim Kitouni)
  * Fix annots from dbl/tpl click + drag (#1274, Nelson BenÃ­tez LeÃ³n)
  * Fix caret cursor navigation in non-continuous mode (#390, Nelson BenÃ­tez LeÃ³n)
  * Keep cursor visible when changing pages (#390, Jason Crain)
  * Don't enable popup actions on page change (#1168, Jason Crain)
  * Implement ATK's scrollSubstringTo() and scrollSubstringToPoint(). (#1203, Martin Pieuchot)

libdocument:
  * Get DPI from GdkMonitor (#617, Marek Kasik)
  * Deprecate ev_document_misc_get_screen_dpi() (#617, Jason Crain)

shell:
  * Set a11y names for annotation buttons (Marek Kasik)
  * Go to annotation on right click (Nelson BenÃ­tez LeÃ³n)
  * Document presentation mode shortcuts (#1302, Jason Crain)

Developers:
  * Abderrahim Kitouni, GermÃ¡n Poo-CaamaÃ±o, Jason Crain, Marek Kasik, Martin Pieuchot, Nelson BenÃ­tez LeÃ³n

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...002-add-a-formatting-attribute-check.patch | 29 -------------------
 .../{evince_3.34.2.bb => evince_3.36.3.bb}    | 19 +++++++-----
 2 files changed, 11 insertions(+), 37 deletions(-)
 rename meta-gnome/recipes-gnome/evince/{evince_3.34.2.bb => evince_3.36.3.bb} (73%)

diff --git a/meta-gnome/recipes-gnome/evince/evince/0002-add-a-formatting-attribute-check.patch b/meta-gnome/recipes-gnome/evince/evince/0002-add-a-formatting-attribute-check.patch
index c374fc943..94794a5f9 100644
--- a/meta-gnome/recipes-gnome/evince/evince/0002-add-a-formatting-attribute-check.patch
+++ b/meta-gnome/recipes-gnome/evince/evince/0002-add-a-formatting-attribute-check.patch
@@ -19,17 +19,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  cut-n-paste/unarr/common/unarr.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
---- a/cut-n-paste/unarr/common/unarr.c
-+++ b/cut-n-paste/unarr/common/unarr.c
-@@ -92,7 +92,7 @@ size_t ar_get_global_comment(ar_archive
-     return ar->get_comment(ar, buffer, count);
- }
- 
--void ar_log(const char *prefix, const char *file, int line, const char *msg, ...)
-+void __attribute__((__format__ (__printf__, 4, 5))) ar_log(const char *prefix, const char *file, int line, const char *msg, ...)
- {
-     va_list args;
-     va_start(args, msg);
 --- a/cut-n-paste/synctex/synctex_parser_utils.c
 +++ b/cut-n-paste/synctex/synctex_parser_utils.c
 @@ -87,11 +87,11 @@ void _synctex_free(void * ptr) {
@@ -76,24 +65,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  						result = NULL;
  						return NULL;
  					}
---- a/cut-n-paste/synctex/synctex_parser.c
-+++ b/cut-n-paste/synctex/synctex_parser.c
-@@ -8411,6 +8411,7 @@ struct synctex_updater_t {
-     int length;             /*  the number of chars appended */
- };
- 
-+static int _synctex_updater_print(synctex_updater_p updater, const char * format, ...) SYNCTEX_PRINTF_FORMAT(2, 3);
- static int _synctex_updater_print(synctex_updater_p updater, const char * format, ...) {
-     int result = 0;
-     if (updater) {
-@@ -8447,6 +8448,7 @@ static int vasprintf(char **ret,
- /**
-  *  gzvprintf is not available until OSX 10.10
-  */
-+static int _synctex_updater_print_gz(synctex_updater_p updater, const char * format, ...) SYNCTEX_PRINTF_FORMAT(2, 3);
- static int _synctex_updater_print_gz(synctex_updater_p updater, const char * format, ...) {
-     int result = 0;
-     if (updater) {
 --- a/cut-n-paste/synctex/synctex_parser_utils.h
 +++ b/cut-n-paste/synctex/synctex_parser_utils.h
 @@ -85,7 +85,11 @@ extern "C" {
diff --git a/meta-gnome/recipes-gnome/evince/evince_3.34.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.36.3.bb
similarity index 73%
rename from meta-gnome/recipes-gnome/evince/evince_3.34.2.bb
rename to meta-gnome/recipes-gnome/evince/evince_3.36.3.bb
index b792d4fcb..08a20d4e0 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.36.3.bb
@@ -16,18 +16,21 @@ DEPENDS = " \
     ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop3','',d)} \
 "
 
-inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection upstream-version-is-even gettext features_check mime-xdg
+GNOMEBASEBUILDCLASS = "meson"
 
-SRC_URI[archive.md5sum] = "9e9e82fa8f6045ad7817157d9335d185"
-SRC_URI[archive.sha256sum] = "3cc0955f11204e3a2db1c7ab99b866692749592257485b87304134ad69da0617"
+inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection upstream-version-is-even gettext features_check mime-xdg gtk-doc
+
+SRC_URI[archive.md5sum] = "9762dabdde37a804072bccbfd311d357"
+SRC_URI[archive.sha256sum] = "af2ebdf7f74e6580c4f1a12bdfe26b9ff90374d7acae061de0666d64012a9db2"
 SRC_URI += " \
     file://0001-Add-format-attribute-to-_synctex_malloc.patch \
     file://0002-add-a-formatting-attribute-check.patch \
 "
 
-EXTRA_OECONF = " \
-    --enable-thumbnailer \
-    --without-systemduserunitdir \
+GTKDOC_MESON_OPTION = "gtk_doc"
+
+EXTRA_OEMESON = " \
+    -Dsystemduserunitdir=no \
 "
 
 do_compile_prepend() {
@@ -35,8 +38,8 @@ do_compile_prepend() {
 }
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[nautilus] = "--enable-nautilus,--disable-nautilus,nautilus"
-PACKAGECONFIG[browser-plugin] = "--enable-browser-plugin,--disable-browser-plugin,"
+PACKAGECONFIG[nautilus] = "-Dnautilus=true,-Dnautilus=false,nautilus"
+PACKAGECONFIG[browser-plugin] = "-Dbrowser_plugin=true,-Dbrowser_plugin=false"
 
 RDEPENDS_${PN} += "glib-2.0-utils"
 RRECOMMMENDS_${PN} = "adwaita-icon-theme"
-- 
2.21.3

