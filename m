Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.17087.1610488335807901729
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 13:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=etBcoSxG;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id g10so1759591wmh.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 13:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FzN7jcbtUH6rekZx19xuKHxufSszcakYb6ePNz4MtK8=;
        b=etBcoSxGbvE2isaZNZBqrPTNEnRVimcBXQTNr8YsRLP6Wvf3dJ7JNMsyu1boxkKjYH
         NPAiqvVrVjc2CPSKMB/0I2rvO/c3SDLN3pVITkJboBgQ5b+/7yyBSNaidbimR0F10aIh
         uNCshsH+H2SU9w4mw3B+PVC93DNS3i6xC1HAjmOixKRrw+WxExjs0LakytjeAWCxDJTy
         v2Foo5e5aySJzsfAQdyCZ3vrfDqjBl/GEJFORoOs4Rs630FhqHsIh/AocaT3JyhPUrlT
         lAmufdrUE8TD0HoUEBLtpf1EtRq4okiB2tpRoKYeIV/n6VOby6wSC8PRFjkJnSiYIcu9
         C79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FzN7jcbtUH6rekZx19xuKHxufSszcakYb6ePNz4MtK8=;
        b=mm8MvsmPUdHBsWaiqMTAABwUC8/44mIqahnDwVkQzIIMr5ZwNPEldbLQLR5l40fpHO
         qxmpKpsHjBF5DsXFaCipfmChHkgqMuaurMdXetSNMtUWAs71t8Lz5jtoY5ZvETonkYbn
         9Z7vUr3hhXBQKmgyElRvy/kAVZoCf6vswCO/8RB4JM8teNPQBchyM7eG/Ft4bcKCEOCr
         /fBpveZCuUnnEtzobprnlNBnrE9kzHoGK9kjN7nuW5nvMGzeeXeGxJMr3R5HZg0wQ9aF
         iJyFi7OG+hla5oHAcqwMKWlJvCTtKxyuBijsnys0qcojy54IJfNnMsJEmv+S+CQBza7G
         ii+A==
X-Gm-Message-State: AOAM532hsVbOqVdtIMi9T1w3ksb8hCrBqkRs0JPYHKnc8s2iisubeqsC
	WwqjPsMgfl8xDKUQpNnV+TmmCtAG8Sd5GA==
X-Google-Smtp-Source: ABdhPJxQRmxzLPF0Uec2yZaU9K2sEy7kl3P0q4dJxgey5885HpSXyDq4oMOuUxcM9nz8Mxzj4Uh/RQ==
X-Received: by 2002:a1c:4986:: with SMTP id w128mr1108178wma.89.1610488334349;
        Tue, 12 Jan 2021 13:52:14 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0538793397820a7f9846fa.dip0.t-ipconnect.de. [2003:f0:7f05:3879:3397:820a:7f98:46fa])
        by smtp.gmail.com with ESMTPSA id c6sm6881300wrh.7.2021.01.12.13.52.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 13:52:13 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/8] evince: upgrade 3.36.7 -> 3.38.0
Date: Tue, 12 Jan 2021 22:51:58 +0100
Message-Id: <20210112215201.3940196-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112215201.3940196-1-schnitzeltony@gmail.com>
References: <20210112215201.3940196-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

clang patches are not necessary any more

================
Evince    3.38.0
================
build:
  * Build using libm in some of the backends (Sebastien Bacher)
dvi:
  *  Minus sign doesn't appear with mathdesign fonts (#1477, David C. Sterratt)
pdf:
  *  Reimplement 'de facto' tooltip with no ABI break (Germán Poo-Caamaño)
Developers:
  * David C. Sterratt, Germán Poo-Caamaño, Sebastien Bacher
Translations:
  * Asier Sarasua Garmendia (Basque)
  * Rafael Fontenelle (Brazilian Portuguese)
  * Goran Vidović (Croatian)
  * Nathan Follens (Dutch)
  * Jiri Grönroos (Finnish)
  * Julien Humbert (French)
  * Balázs Úr (Hungarian)
  * sicklylife (Japanese)
  * Changwoo Ryu (Korean)
  * Danial Behzadi (Persian)
  * Yuri Chornoivan (Ukrainian)

=================
Evince    3.37.90
=================
build:
  * Bump glib requirement to 2.44 (Germán Poo-Caamaño)
  * Correct a typo in meson.build (Felix Yan)
ci:
  * remove deprecated jobs (Jordan Petridis)
dvi:
  * Fix some math fonts when using virtual fonts (#53, David C. Sterratt)
libdocument:
  * Replace deprecated GTime by GDateTime (vanadiae)
libview:
  * Fix deprecation for getting background color (Germán Poo-Caamaño)
Developers:
  * David C. Sterratt, Felix Yan, Germán Poo-Caamaño, Jordan Petridis, vanadiae
Translations:
  * Boyuan Yang (Chinese (China))
  * Marek Černocký (Czech)
  * Jiri Grönroos (Finnish)
  * Thibault Martin (French)
  * Fabio Tomat (Friulian)
  * Fran Dieguez (Galician)
  * Kukuh Syafaat (Indonesian)
  * Aurimas Černius (Lithuanian)
  * Piotr Drąg (Polish)
  * Марко Костић (Serbian)
  * Matej Urbančič (Slovenian)
  * Daniel Mustieles (Spanish)
  * Anders Jonsson (Swedish)
  * Emin Tufan Çetin (Turkish)
  * Yuri Chornoivan (Ukrainian)

================
Evince    3.37.3
================
backend:
  * Add support for xmpRights:UsageTerms in PDF (#128, Juanjo Marín)
  * Fix -Werror=format=2 fixes on dvi for ARM (#1429, Germán Poo-Caamaño)
  * Fix warnings (Germán Poo-Caamaño)
build:
  * Remove autotools (Iñigo Martínez)
  * add usual meson build directory to gitignore (vanadiae)
cut-n-paste:
  * Add libdazzle utilities to open file manager (Germán Poo-Caamaño)
  * Use async calls in file manager (Germán Poo-Caamaño)
  * filemanager: create proxy synchronously (Christian Hergert)
data:
  * Add man pages for evince-previewer and evince-thumbnailer (#680, Caolán McNamara)
  * Crop out of place pixel line of screenshot (Germán Poo-Caamaño)
flatpak:
  * Bump gnome-desktop to 3.36.1 (Germán Poo-Caamaño)
  * Bump poppler to 0.89.0 (Germán Poo-Caamaño)
  * Update Flatpak for app-provided gdk-pixbuf loader (Bastien Nocera)
  * don't build user help as slow and not needed for development (vanadiae)
help:
  * Link to the GNOME Desktop help for two print pages (#1344, Pranali Deshmukh)
  * Updated annotation navigation page (#1345, Pranali Deshmukh)
history:
  * Add links when jumping to first or last page. (#785627, #810, Casey Jao)
  * Don't assume EvLink has always a valid EvLinkAction (#810, Nelson Benítez León)
  * Move some responsibilities out of EvHistory. (#785627, #810, Casey Jao)
  * Record current page when going back in history (#810, Casey Jao)
  * Record links in history when activating bookmarks (#785627, #810, Casey Jao)
libdocument:
  * Annotate deprecated function (Germán Poo-Caamaño)
  * Load application-specific gdk-pixbuf loaders (Bastien Nocera)
libview:
  * Add delay before showing link preview popover (#662, Mads Chr. Olesen)
  * Adjust preview size and contents' position (#662, Henry Gebhardt)
  * Allow find results be styled with CSS (Germán Poo-Caamaño)
  * Cleanup link preview popover, on mouseover of it (#662, Mads Chr. Olesen)
  * Fix deprecated use of gdk_flush (Germán Poo-Caamaño)
  * Fix gtk_drag_begin deprecations (Germán Poo-Caamaño)
  * Increase page duration resolution (#637, Marc Vinyals)
  * Let handle_cursor_over_xy handle link preview (#662, Mads Chr. Olesen)
  * Make a preview popover for links (#662, Mads Chr. Olesen)
  * Remove gtk_adjustment_changed calls (Germán Poo-Caamaño)
  * Remove unused variables (#1010, Germán Poo-Caamaño)
  * Replace "cursor-color" by "caret-color" (Germán Poo-Caamaño)
  * Make contrast functions available in all libview/ (vanadiae)
  * Use annotation color for the close button (vanadiae)
meson:
  *  set license to GPLv2+ as it's the one for the license notices (vanadiae)
misc:
  * Add contribution guidelines (Germán Poo-Caamaño)
  * Add editorconfig file to keep style consistency (vanadiae)
  * Fix formatting CONTRIBUTING.md (Germán Poo-Caamaño)
  * Fix tabs in guidelines for contributors (Germán Poo-Caamaño)
  * Make "Open Containing Folder" work in flatpak (#1147, Casey Jao)
  * Update POTFILES.skip (Piotr Drąg)
  * Updated Contribution Guidelines (Pranali Deshmukh)
  * Fix warning on documents lacking annotations interface (Nelson Benítez León)
shell:
  *  Add meaningful description in about dialog (#1418, Germán Poo-Caamaño)
  *  Check "page-changed" in EvSidebarBookmarks (#623, Casey Jao)
  *  Fix interval for displaying the loading message (Germán Poo-Caamaño)
  *  Make opening file year-2038-safe (Germán Poo-Caamaño)
  *  Use GMenu for bookmarks' popup menu (Germán Poo-Caamaño)
  *  Use GtkFileChooserNative for opening and saving files. (Casey Jao)
snap:
  *  Don't specify candidate channel for the build snap (Ken VanDine)
  *  updated to use latest snapcraft extension. Fixes #1426 (Ken VanDine)
synctex:
  *  Annotate more functions that wraps formatting strings (Germán Poo-Caamaño)
  *  Sync against upstream synctex (Germán Poo-Caamaño)
Developers:
  * Bastien Nocera, Caolán McNamara, Casey Jao, Christian Hergert, Germán Poo-Caamaño, Henry Gebhardt, Iñigo Martínez, Juanjo Marín, Ken VanDine, Mads Chr. Olesen, Marc Vinyals, Nelson Benítez León, Piotr Drąg, Pranali Deshmukh, vanadiae
Translations:
  * Gil Forcada (Catalan)
  * Jordi Mas (Catalan)
  * Boyuan Yang (Chinese (China))
  * Baurzhan Muftakhidinov (Kazakh)
  * Daniel Șerbănescu (Romanian)
  * Florentina Mușat (Romanian)
  * Matej Urbančič (Slovenian)
  * Daniel Mustieles (Spanish)
  * Emin Tufan Çetin (Turkish)
  * Yuri Chornoivan (Ukrainian)

================
Evince    3.37.2
================
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
Translations:
  * Kukuh Syafaat (Indonesian)

================
Evince    3.37.1
================
build:
  * Use lowercase for project name in meson (Germán Poo-Caamaño)
  * Add 'user_doc' option to meson (Nelson Benítez León)
ci:
  * build with meson by default and autotools manually (Germán Poo-Caamaño)
flatpak:
  * Update Poppler to 0.88.0 (Casey Jao)
libview:
  * Fix typo in parameter's description (Yuri Chornoivan)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-format-attribute-to-_synctex_malloc.patch | 27 ------
 ...002-add-a-formatting-attribute-check.patch | 93 -------------------
 .../{evince_3.36.7.bb => evince_3.38.0.bb}    |  7 +-
 3 files changed, 1 insertion(+), 126 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-Add-format-attribute-to-_synctex_malloc.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0002-add-a-formatting-attribute-check.patch
 rename meta-gnome/recipes-gnome/evince/{evince_3.36.7.bb => evince_3.38.0.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-Add-format-attribute-to-_synctex_malloc.patch b/meta-gnome/recipes-gnome/evince/evince/0001-Add-format-attribute-to-_synctex_malloc.patch
deleted file mode 100644
index 32ca073f9..000000000
--- a/meta-gnome/recipes-gnome/evince/evince/0001-Add-format-attribute-to-_synctex_malloc.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3776fd0b42e473fe51d3678bf26cdaa37e1d8e0d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 8 Apr 2017 13:36:12 -0700
-Subject: [PATCH] Add format attribute to _synctex_malloc
-
-Helps in avoiding compile errors about formating with clang
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- cut-n-paste/synctex/synctex_parser_utils.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/cut-n-paste/synctex/synctex_parser_utils.c b/cut-n-paste/synctex/synctex_parser_utils.c
-index 08053f0..0519b38 100644
---- a/cut-n-paste/synctex/synctex_parser_utils.c
-+++ b/cut-n-paste/synctex/synctex_parser_utils.c
-@@ -136,6 +136,7 @@ int _synctex_log(int level, const char * prompt, const char * reason,va_list arg
- 	return result;
- }
- 
-+__attribute__((__format__ (__printf__, 1, 0)))
- int _synctex_error(const char * reason,...) {
-     va_list arg;
-     int result;
--- 
-2.20.1
-
diff --git a/meta-gnome/recipes-gnome/evince/evince/0002-add-a-formatting-attribute-check.patch b/meta-gnome/recipes-gnome/evince/evince/0002-add-a-formatting-attribute-check.patch
deleted file mode 100644
index 94794a5f9..000000000
--- a/meta-gnome/recipes-gnome/evince/evince/0002-add-a-formatting-attribute-check.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From ef170dda7fbab53682c9bc287dec93fa86130bc9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 9 Sep 2018 21:49:59 -0700
-Subject: [PATCH] add a formatting attribute check
-
-Tell Clang that parameter is a printf style format using the
-attribute flag
-
-This helps in avoiding below warnings seen with clang
-
-unarr.c:106:22: error: format string is not a string literal
-[-Werror,-Wformat-nonliteral]
-|     vfprintf(stderr, msg, args);
-|                      ^~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- cut-n-paste/unarr/common/unarr.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/cut-n-paste/synctex/synctex_parser_utils.c
-+++ b/cut-n-paste/synctex/synctex_parser_utils.c
-@@ -87,11 +87,11 @@ void _synctex_free(void * ptr) {
- #   include <syslog.h>
- #endif
- 
--int _synctex_error(const char * reason, ...) __attribute__((__format__ (__printf__, 1, 2)));
--int _synctex_log(int level, const char * prompt, const char * reason, va_list arg) __attribute__((__format__ (__printf__, 3, 0)));
--
--int _synctex_log(int level, const char * prompt, const char * reason,va_list arg) {
-+static int _synctex_log(int level, const char * prompt, const char * reason, ...) SYNCTEX_PRINTF_FORMAT(3, 0);
-+static int _synctex_log(int level, const char * prompt, const char * reason, ...) {
-+	va_list arg;
- 	int result;
-+	va_start(arg, reason);
- #	ifdef SYNCTEX_RECENT_WINDOWS
- 	{/*	This code is contributed by William Blum.
-         As it does not work on some older computers,
-@@ -133,10 +133,10 @@ int _synctex_log(int level, const char *
-     result += vfprintf(where, reason, arg);
-     result += fprintf(where,"\n");
- #   endif
-+    va_end(arg);
- 	return result;
- }
- 
--__attribute__((__format__ (__printf__, 1, 0)))
- int _synctex_error(const char * reason,...) {
-     va_list arg;
-     int result;
-@@ -355,6 +355,7 @@ char * _synctex_merge_strings(const char
- 		size_t len = strlen(temp);
- 		if(UINT_MAX-len<size) {
- 			_synctex_error("!  _synctex_merge_strings: Capacity exceeded.");
-+			va_end(arg);
- 			return NULL;
- 		}
- 		size+=len;
-@@ -374,6 +375,7 @@ char * _synctex_merge_strings(const char
- 					if(dest != strncpy(dest,temp,size)) {
- 						_synctex_error("!  _synctex_merge_strings: Copy problem");
- 						free(result);
-+						va_end(arg);
- 						result = NULL;
- 						return NULL;
- 					}
---- a/cut-n-paste/synctex/synctex_parser_utils.h
-+++ b/cut-n-paste/synctex/synctex_parser_utils.h
-@@ -85,7 +85,11 @@ extern "C" {
- #	else
- #		define SYNCTEX_ARE_PATH_CHARACTERS_EQUAL(left,right) (toupper(left) != toupper(right))
- #	endif
--    
-+#	ifdef __GNUC__
-+#		define SYNCTEX_PRINTF_FORMAT(si, ftc) __attribute__ ((format (printf, si, ftc)))
-+#	else
-+#		define SYNCTEX_PRINTF_FORMAT(si, ftc)
-+#	endif    
- /*  This custom malloc functions initializes to 0 the newly allocated memory.
-  *  There is no bzero function on windows. */
- void *_synctex_malloc(size_t size);
-@@ -97,8 +101,8 @@ void _synctex_free(void * ptr);
- /*  This is used to log some informational message to the standard error stream.
-  *  On Windows, the stderr stream is not exposed and another method is used.
-  *	The return value is the number of characters printed.	*/
--    int _synctex_error(const char * reason,...);
--    int _synctex_debug(const char * reason,...);
-+    int _synctex_error(const char * reason,...) SYNCTEX_PRINTF_FORMAT(1, 2);
-+    int _synctex_debug(const char * reason,...) SYNCTEX_PRINTF_FORMAT(1, 2);
- 
- /*  strip the last extension of the given string, this string is modified!
-  *  This function depends on the OS because the path separator may differ.
diff --git a/meta-gnome/recipes-gnome/evince/evince_3.36.7.bb b/meta-gnome/recipes-gnome/evince/evince_3.38.0.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/evince/evince_3.36.7.bb
rename to meta-gnome/recipes-gnome/evince/evince_3.38.0.bb
index 3ea54101c..9c1d8641e 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.36.7.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.38.0.bb
@@ -20,12 +20,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection upstream-version-is-even gettext mime-xdg gtk-doc
 
-SRC_URI[archive.md5sum] = "a7ebf1f76552579be71fc63947a15297"
-SRC_URI[archive.sha256sum] = "65d61a423e3fbbe07001f65e87422dfb7d2e42b9edf0ca6a1d427af9a04b8f32"
-SRC_URI += " \
-    file://0001-Add-format-attribute-to-_synctex_malloc.patch \
-    file://0002-add-a-formatting-attribute-check.patch \
-"
+SRC_URI[archive.sha256sum] = "26df897a417545b476d2606b14731122e84278ae994bd64ea535449c3cf01948"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.26.2

