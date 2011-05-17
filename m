Received: from smtp-out04.msg.oleane.net ([62.161.7.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.charreyre@cioinfoindus.fr>)
	id 1QMRSA-0004ze-Tx for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 23:05:19 +0200
Received: from smtp07.msg.oleane.net (smtp07.mail.priv [172.17.20.116]) 
	by smtp-out04.msg.oleane.net with ESMTP id p4HL2R7h025676
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 23:02:27 +0200
Received: from localhost.localdomain
	(AMarseille-551-1-81-135.w92-137.abo.wanadoo.fr [92.137.64.135]) 
	by smtp07.msg.oleane.net (MTA) with ESMTP id p4HKgOQQ007370;
	Tue, 17 May 2011 22:42:25 +0200
X-Oleane-Rep: REPA
From: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2011 22:42:17 +0200
Message-Id: <1305664937-20683-1-git-send-email-christian.charreyre@cioinfoindus.fr>
X-Mailer: git-send-email 1.7.4.1
X-Spam-Flag: NO
X-PMX-Spam: Probability=8%
X-PFSI-Info: PMX 5.6.0.2009776, Antispam-Engine: 2.7.2.376379,
	Antispam-Data: 2011.5.17.203314 (no antivirus check)
Subject: [PATCH] libsdl-pango: new recipe for version 0.1.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 May 2011 21:05:19 -0000

This patches creates a new recipe for libsdl-pango.
It uses debian patches, unless rebootstrap.patch which is very big and doesn't 
seem necessary for the recipe.

Signed-off-by: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
---
 .../libsdl-pango-0.1.2/am_maintainer_mode.patch    |   10 ++
 .../libsdl/libsdl-pango-0.1.2/api_additions.patch  |  128 +++++++++++++++++++
 .../libsdl/libsdl-pango-0.1.2/blit_overflow.patch  |   32 +++++
 .../libsdl/libsdl-pango-0.1.2/fillrect_crash.patch |   15 +++
 .../libsdl-pango-0.1.2/matrix_declarations.patch   |  131 ++++++++++++++++++++
 recipes/libsdl/libsdl-pango-0.1.2/sans-serif.patch |   13 ++
 recipes/libsdl/libsdl-pango_0.1.2.bb               |   27 ++++
 7 files changed, 356 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libsdl/libsdl-pango-0.1.2/am_maintainer_mode.patch
 create mode 100644 recipes/libsdl/libsdl-pango-0.1.2/api_additions.patch
 create mode 100644 recipes/libsdl/libsdl-pango-0.1.2/blit_overflow.patch
 create mode 100644 recipes/libsdl/libsdl-pango-0.1.2/fillrect_crash.patch
 create mode 100644 recipes/libsdl/libsdl-pango-0.1.2/matrix_declarations.patch
 create mode 100644 recipes/libsdl/libsdl-pango-0.1.2/sans-serif.patch
 create mode 100644 recipes/libsdl/libsdl-pango_0.1.2.bb

diff --git a/recipes/libsdl/libsdl-pango-0.1.2/am_maintainer_mode.patch b/recipes/libsdl/libsdl-pango-0.1.2/am_maintainer_mode.patch
new file mode 100644
index 0000000..7bc94d2
--- /dev/null
+++ b/recipes/libsdl/libsdl-pango-0.1.2/am_maintainer_mode.patch
@@ -0,0 +1,10 @@
+--- sdlpango-0.1.2.orig/configure.in
++++ sdlpango-0.1.2/configure.in
+@@ -1,6 +1,7 @@
+ # Process this file with autoconf to produce a configure script.
+ 
+ AC_INIT(README)
++AM_MAINTAINER_MODE
+ 
+ # Set various version strings - taken gratefully from the GTk sources
+ 
diff --git a/recipes/libsdl/libsdl-pango-0.1.2/api_additions.patch b/recipes/libsdl/libsdl-pango-0.1.2/api_additions.patch
new file mode 100644
index 0000000..5c02e79
--- /dev/null
+++ b/recipes/libsdl/libsdl-pango-0.1.2/api_additions.patch
@@ -0,0 +1,128 @@
+Index: SDL_Pango-0.1.2/src/SDL_Pango.c
+===================================================================
+--- SDL_Pango-0.1.2.orig/src/SDL_Pango.c	2004-12-10 10:06:33.000000000 +0100
++++ SDL_Pango-0.1.2/src/SDL_Pango.c	2007-09-18 14:56:35.362379428 +0200
+@@ -723,13 +723,9 @@
+     SDL_UnlockSurface(surface);
+ }
+ 
+-/*!
+-    Create a context which contains Pango objects.
+ 
+-    @return A pointer to the context as a SDLPango_Context*.
+-*/
+ SDLPango_Context*
+-SDLPango_CreateContext()
++SDLPango_CreateContext_GivenFontDesc(const char* font_desc)
+ {
+     SDLPango_Context *context = g_malloc(sizeof(SDLPango_Context));
+     G_CONST_RETURN char *charset;
+@@ -743,8 +739,7 @@
+     pango_context_set_language (context->context, pango_language_from_string (charset));
+     pango_context_set_base_dir (context->context, PANGO_DIRECTION_LTR);
+ 
+-    context->font_desc = pango_font_description_from_string(
+-	MAKE_FONT_NAME (DEFAULT_FONT_FAMILY, DEFAULT_FONT_SIZE));
++    context->font_desc = pango_font_description_from_string(font_desc);
+ 
+     context->layout = pango_layout_new (context->context);
+ 
+@@ -762,6 +757,17 @@
+ }
+ 
+ /*!
++    Create a context which contains Pango objects.
++
++    @return A pointer to the context as a SDLPango_Context*.
++*/
++SDLPango_Context*
++SDLPango_CreateContext()
++{
++    SDLPango_CreateContext_GivenFontDesc(MAKE_FONT_NAME(DEFAULT_FONT_FAMILY, DEFAULT_FONT_SIZE));
++}
++
++/*!
+     Free a context.
+ 
+     @param *context [i/o] Context to be free
+@@ -1053,6 +1059,20 @@
+     pango_layout_set_font_description (context->layout, context->font_desc);
+ }
+ 
++void
++SDLPango_SetText_GivenAlignment(
++    SDLPango_Context *context,
++    const char *text,
++    int length,
++    SDLPango_Alignment alignment)
++{
++    pango_layout_set_attributes(context->layout, NULL);
++    pango_layout_set_text (context->layout, text, length);
++    pango_layout_set_auto_dir (context->layout, TRUE);
++    pango_layout_set_alignment (context->layout, alignment);
++    pango_layout_set_font_description (context->layout, context->font_desc);
++}
++
+ /*!
+     Set plain text to context.
+     Text must be utf-8.
+@@ -1067,11 +1087,7 @@
+     const char *text,
+     int length)
+ {
+-    pango_layout_set_attributes(context->layout, NULL);
+-    pango_layout_set_text (context->layout, text, length);
+-    pango_layout_set_auto_dir (context->layout, TRUE);
+-    pango_layout_set_alignment (context->layout, PANGO_ALIGN_LEFT);
+-    pango_layout_set_font_description (context->layout, context->font_desc);
++    SDLPango_SetText_GivenAlignment(context, text, length, SDLPANGO_ALIGN_LEFT);
+ }
+ 
+ /*!
+Index: SDL_Pango-0.1.2/src/SDL_Pango.h
+===================================================================
+--- SDL_Pango-0.1.2.orig/src/SDL_Pango.h	2004-12-10 10:06:33.000000000 +0100
++++ SDL_Pango-0.1.2/src/SDL_Pango.h	2007-09-18 15:00:41.736419485 +0200
+@@ -26,6 +26,7 @@
+ 
+ #ifndef SDL_PANGO_H
+ #define SDL_PANGO_H
++#define SDL_PANGO_HAS_GC_EXTENSIONS
+ 
+ #include "SDL.h"
+ 
+@@ -109,12 +110,20 @@
+     SDLPANGO_DIRECTION_NEUTRAL	/*! Neutral */
+ } SDLPango_Direction;
+ 
+-
++/*!
++    Specifies alignment of text. See Pango reference for detail
++*/
++typedef enum {
++    SDLPANGO_ALIGN_LEFT,
++    SDLPANGO_ALIGN_CENTER,
++    SDLPANGO_ALIGN_RIGHT
++} SDLPango_Alignment;
+ 
+ extern DECLSPEC int SDLCALL SDLPango_Init();
+ 
+ extern DECLSPEC int SDLCALL SDLPango_WasInit();
+ 
++extern DECLSPEC SDLPango_Context* SDLCALL SDLPango_CreateContext_GivenFontDesc(const char* font_desc);
+ extern DECLSPEC SDLPango_Context* SDLCALL SDLPango_CreateContext();
+ 
+ extern DECLSPEC void SDLCALL SDLPango_FreeContext(
+@@ -157,6 +166,12 @@
+     const char *markup,
+     int length);
+ 
++extern DECLSPEC void SDLCALL SDLPango_SetText_GivenAlignment(
++    SDLPango_Context *context,
++    const char *text,
++    int length,
++    SDLPango_Alignment alignment);
++
+ extern DECLSPEC void SDLCALL SDLPango_SetText(
+     SDLPango_Context *context,
+     const char *markup,
diff --git a/recipes/libsdl/libsdl-pango-0.1.2/blit_overflow.patch b/recipes/libsdl/libsdl-pango-0.1.2/blit_overflow.patch
new file mode 100644
index 0000000..411d066
--- /dev/null
+++ b/recipes/libsdl/libsdl-pango-0.1.2/blit_overflow.patch
@@ -0,0 +1,32 @@
+Index: sdlpango-0.1.2/src/SDL_Pango.c
+===================================================================
+--- sdlpango-0.1.2.orig/src/SDL_Pango.c	2007-10-08 19:44:15.000000000 +0000
++++ sdlpango-0.1.2/src/SDL_Pango.c	2007-10-08 19:45:27.000000000 +0000
+@@ -725,16 +725,23 @@
+     int x = rect->x;
+     int y = rect->y;
+ 
++    if(x < 0) {
++	width += x; x = 0;
++    }
+     if(x + width > surface->w) {
+ 	width = surface->w - x;
+-	if(width <= 0)
+-	    return;
++    }
++    if(width <= 0)
++	return;
++
++    if(y < 0) {
++	height += y; y = 0;
+     }
+     if(y + height > surface->h) {
+ 	height = surface->h - y;
+-	if(height <= 0)
+-	    return;
+     }
++    if(height <= 0)
++	return;
+ 
+     if(SDL_LockSurface(surface)) {
+ 	SDL_SetError("surface lock failed");
diff --git a/recipes/libsdl/libsdl-pango-0.1.2/fillrect_crash.patch b/recipes/libsdl/libsdl-pango-0.1.2/fillrect_crash.patch
new file mode 100644
index 0000000..7a41bbf
--- /dev/null
+++ b/recipes/libsdl/libsdl-pango-0.1.2/fillrect_crash.patch
@@ -0,0 +1,15 @@
+Index: SDL_Pango-0.1.2/src/SDL_Pango.c
+===================================================================
+--- SDL_Pango-0.1.2.orig/src/SDL_Pango.c	2007-09-18 15:56:12.406223540 +0200
++++ SDL_Pango-0.1.2/src/SDL_Pango.c	2007-09-18 15:57:27.986530616 +0200
+@@ -932,7 +932,9 @@
+     width = PANGO_PIXELS (logical_rect.width);
+     height = PANGO_PIXELS (logical_rect.height);
+ 
+-    SDL_FillRect(surface, NULL, SDL_MapRGBA(surface->format, 0, 0, 0, 0));
++    if (width && height) {
++        SDL_FillRect(surface, NULL, SDL_MapRGBA(surface->format, 0, 0, 0, 0));
++    }
+ 
+     if((! context->tmp_ftbitmap) || context->tmp_ftbitmap->width < width
+ 	|| context->tmp_ftbitmap->rows < height)
diff --git a/recipes/libsdl/libsdl-pango-0.1.2/matrix_declarations.patch b/recipes/libsdl/libsdl-pango-0.1.2/matrix_declarations.patch
new file mode 100644
index 0000000..c35d0a7
--- /dev/null
+++ b/recipes/libsdl/libsdl-pango-0.1.2/matrix_declarations.patch
@@ -0,0 +1,131 @@
+Index: SDL_Pango-0.1.2/src/SDL_Pango.c
+===================================================================
+--- SDL_Pango-0.1.2.orig/src/SDL_Pango.c	2007-09-18 15:03:10.732910311 +0200
++++ SDL_Pango-0.1.2/src/SDL_Pango.c	2007-09-18 15:04:41.970109622 +0200
+@@ -286,6 +286,59 @@
+ } contextImpl;
+ 
+ 
++const SDLPango_Matrix _MATRIX_WHITE_BACK
++    = {255, 0, 0, 0,
++       255, 0, 0, 0,
++       255, 0, 0, 0,
++       255, 255, 0, 0,};
++
++/*!
++    Specifies white back and black letter.
++*/
++const SDLPango_Matrix *MATRIX_WHITE_BACK = &_MATRIX_WHITE_BACK;
++
++const SDLPango_Matrix _MATRIX_BLACK_BACK
++    = {0, 255, 0, 0,
++       0, 255, 0, 0,
++       0, 255, 0, 0,
++       255, 255, 0, 0,};
++/*!
++    Specifies black back and white letter.
++*/
++const SDLPango_Matrix *MATRIX_BLACK_BACK = &_MATRIX_BLACK_BACK;
++
++const SDLPango_Matrix _MATRIX_TRANSPARENT_BACK_BLACK_LETTER
++    = {0, 0, 0, 0,
++       0, 0, 0, 0,
++       0, 0, 0, 0,
++       0, 255, 0, 0,};
++/*!
++    Specifies transparent back and black letter.
++*/
++const SDLPango_Matrix *MATRIX_TRANSPARENT_BACK_BLACK_LETTER = &_MATRIX_TRANSPARENT_BACK_BLACK_LETTER;
++
++const SDLPango_Matrix _MATRIX_TRANSPARENT_BACK_WHITE_LETTER
++    = {255, 255, 0, 0,
++       255, 255, 0, 0,
++       255, 255, 0, 0,
++       0, 255, 0, 0,};
++/*!
++    Specifies transparent back and white letter.
++*/
++const SDLPango_Matrix *MATRIX_TRANSPARENT_BACK_WHITE_LETTER = &_MATRIX_TRANSPARENT_BACK_WHITE_LETTER;
++
++const SDLPango_Matrix _MATRIX_TRANSPARENT_BACK_TRANSPARENT_LETTER
++    = {255, 255, 0, 0,
++       255, 255, 0, 0,
++       255, 255, 0, 0,
++       0, 0, 0, 0,};
++/*!
++    Specifies transparent back and transparent letter.
++    This is useful for KARAOKE like rendering.
++*/
++const SDLPango_Matrix *MATRIX_TRANSPARENT_BACK_TRANSPARENT_LETTER = &_MATRIX_TRANSPARENT_BACK_TRANSPARENT_LETTER;
++
++
+ /*!
+     Initialize the Glib and Pango API.
+     This must be called before using other functions in this library,
+Index: SDL_Pango-0.1.2/src/SDL_Pango.h
+===================================================================
+--- SDL_Pango-0.1.2.orig/src/SDL_Pango.h	2007-09-18 15:03:10.732910311 +0200
++++ SDL_Pango-0.1.2/src/SDL_Pango.h	2007-09-18 15:06:24.919976401 +0200
+@@ -47,57 +47,27 @@
+     Uint8 m[4][4];  /*! Matrix variables */
+ } SDLPango_Matrix;
+ 
+-const SDLPango_Matrix _MATRIX_WHITE_BACK
+-    = {255, 0, 0, 0,
+-       255, 0, 0, 0,
+-       255, 0, 0, 0,
+-       255, 255, 0, 0,};
+-
+ /*!
+     Specifies white back and black letter.
+ */
+-const SDLPango_Matrix *MATRIX_WHITE_BACK = &_MATRIX_WHITE_BACK;
+-
+-const SDLPango_Matrix _MATRIX_BLACK_BACK
+-    = {0, 255, 0, 0,
+-       0, 255, 0, 0,
+-       0, 255, 0, 0,
+-       255, 255, 0, 0,};
++extern const SDLPango_Matrix *MATRIX_WHITE_BACK;
+ /*!
+     Specifies black back and white letter.
+ */
+-const SDLPango_Matrix *MATRIX_BLACK_BACK = &_MATRIX_BLACK_BACK;
+-
+-const SDLPango_Matrix _MATRIX_TRANSPARENT_BACK_BLACK_LETTER
+-    = {0, 0, 0, 0,
+-       0, 0, 0, 0,
+-       0, 0, 0, 0,
+-       0, 255, 0, 0,};
++extern const SDLPango_Matrix *MATRIX_BLACK_BACK;
+ /*!
+     Specifies transparent back and black letter.
+ */
+-const SDLPango_Matrix *MATRIX_TRANSPARENT_BACK_BLACK_LETTER = &_MATRIX_TRANSPARENT_BACK_BLACK_LETTER;
+-
+-const SDLPango_Matrix _MATRIX_TRANSPARENT_BACK_WHITE_LETTER
+-    = {255, 255, 0, 0,
+-       255, 255, 0, 0,
+-       255, 255, 0, 0,
+-       0, 255, 0, 0,};
++extern const SDLPango_Matrix *MATRIX_TRANSPARENT_BACK_BLACK_LETTER;
+ /*!
+     Specifies transparent back and white letter.
+ */
+-const SDLPango_Matrix *MATRIX_TRANSPARENT_BACK_WHITE_LETTER = &_MATRIX_TRANSPARENT_BACK_WHITE_LETTER;
+-
+-const SDLPango_Matrix _MATRIX_TRANSPARENT_BACK_TRANSPARENT_LETTER
+-    = {255, 255, 0, 0,
+-       255, 255, 0, 0,
+-       255, 255, 0, 0,
+-       0, 0, 0, 0,};
++extern const SDLPango_Matrix *MATRIX_TRANSPARENT_BACK_WHITE_LETTER;
+ /*!
+     Specifies transparent back and transparent letter.
+     This is useful for KARAOKE like rendering.
+ */
+-const SDLPango_Matrix *MATRIX_TRANSPARENT_BACK_TRANSPARENT_LETTER = &_MATRIX_TRANSPARENT_BACK_TRANSPARENT_LETTER;
++extern const SDLPango_Matrix *MATRIX_TRANSPARENT_BACK_TRANSPARENT_LETTER;
+ 
+ /*!
+     Specifies direction of text. See Pango reference for detail
diff --git a/recipes/libsdl/libsdl-pango-0.1.2/sans-serif.patch b/recipes/libsdl/libsdl-pango-0.1.2/sans-serif.patch
new file mode 100644
index 0000000..ccdc815
--- /dev/null
+++ b/recipes/libsdl/libsdl-pango-0.1.2/sans-serif.patch
@@ -0,0 +1,13 @@
+Index: SDL_Pango-0.1.2/src/SDL_Pango.c
+===================================================================
+--- SDL_Pango-0.1.2.orig/src/SDL_Pango.c	2007-09-18 15:12:20.736253215 +0200
++++ SDL_Pango-0.1.2/src/SDL_Pango.c	2007-09-18 15:12:44.621614364 +0200
+@@ -234,7 +234,7 @@
+ //! non-zero if initialized
+ static int IS_INITIALIZED = 0;
+ 
+-#define DEFAULT_FONT_FAMILY "Sans"
++#define DEFAULT_FONT_FAMILY "sans-serif"
+ #define DEFAULT_FONT_SIZE 12
+ #define DEFAULT_DPI 96
+ #define _MAKE_FONT_NAME(family, size) family " " #size
diff --git a/recipes/libsdl/libsdl-pango_0.1.2.bb b/recipes/libsdl/libsdl-pango_0.1.2.bb
new file mode 100644
index 0000000..81b1f00
--- /dev/null
+++ b/recipes/libsdl/libsdl-pango_0.1.2.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Simple DirectMedia Layer Pango library."
+SECTION = "libs/network"
+PRIORITY = "optional"
+DEPENDS = "virtual/libsdl pango"
+LICENSE = "LGPL"
+
+SRC_URI = "http://freefr.dl.sourceforge.net/project/sdlpango/SDL_Pango/${PV}/SDL_Pango-${PV}.tar.gz \
+	file://am_maintainer_mode.patch \
+	file://api_additions.patch \
+	file://matrix_declarations.patch \
+	file://sans-serif.patch \
+	file://fillrect_crash.patch \
+	file://blit_overflow.patch \
+"
+
+SRC_URI[md5sum] = "85bbf9bb7b1cee0538154dadd045418c"
+SRC_URI[sha256sum] = "7f75d3b97acf707c696ea126424906204ebfa07660162de925173cdd0257eba4"
+
+S = "${WORKDIR}/SDL_Pango-${PV}"
+
+inherit autotools
+
+EXTRA_OECONF += "SDL_CONFIG=${STAGING_BINDIR_CROSS}/sdl-config"
+
+do_stage() {
+	autotools_stage_all
+}
-- 
1.7.4.1



