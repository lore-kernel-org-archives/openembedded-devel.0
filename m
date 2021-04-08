Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web09.276.1617899833211896088
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LevrFSZH;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id i3so2789800oik.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ifbVfKqlitSIDCMoC+TxV6HajulGtCaqCbGHV76Kt7Y=;
        b=LevrFSZHW96PYjmNV1TK2eh9bf60IBw3SJQ9AUrB2B89taUpCi46Vlk1NfZ7ACBupQ
         gG9IBsWLIe+jR9U8ZX5ULnqS0WI5r3eADM5Tvo3NArvjj/9aX8hNhQJRjL4LOTbwqYnO
         Pqja8sauT4BwUKlx+IkGKgjQ1o3HCp0948WcO73O0g6fG7q2NtB7bk5d/cI6RsZJyFE3
         PkuXtW34vl9QsCMI/fFoCFrQtvBZ54hcQEwTsXpselkd/3w0Xbv5uIzmTku/OvFx7Oif
         gxI4nDgUJ6pXf/sgxl5jEaLRRGZVG5x/t33eKNlnod3agSG39bVoJ4wVzqVSqKj4cWOc
         j9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ifbVfKqlitSIDCMoC+TxV6HajulGtCaqCbGHV76Kt7Y=;
        b=SEUmGkz1KvaYhyUDSKBE4hhMzSZ7EShUhBf44udQlyd6J9BTIHo3I0ApDk4Q58TNxX
         2GxQul7mssAyO/WLQXREWYhALi8FV02IG3ytyxPQVzKDC8F128t/ne+iI1c3Wmru6ANH
         VeyhKKtaNG48M7BQnHOQTGhfudkBPvV1iGIDbqQFqjSSqf7lYjpCKq451MWW3DYE8gse
         NQVoR7daK6iCk10Tb5Tc0lfVrFspsXNfchuRpj30/09d4QtLt/TICQw9XyORGPHIm+a1
         r7EKbNde7mRrB0+nc0FrsObTDk/DFiZAr/pFnAhszvg++Lp6/SLcL5CVCoGZvCkhY6JU
         HqyA==
X-Gm-Message-State: AOAM530ilcJ/cp46DI51yXlzOcgbFVqxPw3XgOkczVyNEhYJMHf4HlPQ
	YnGmeON4d5ESBE/FaBLlMwZR5Xghw1A=
X-Google-Smtp-Source: ABdhPJz7t4+PaUN03FwbPb9Wuzch/+WEJZGKnUwC535wiowGMOljzQui0adJDrUzitb9FAWs1aDC/w==
X-Received: by 2002:a05:6808:d4d:: with SMTP id w13mr6997726oik.179.1617899832124;
        Thu, 08 Apr 2021 09:37:12 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.37.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:37:11 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 63/64] poppler: Backport patches to fix build with glib-2.0 2.68+ and GCC11
Date: Thu,  8 Apr 2021 09:36:10 -0700
Message-Id: <8d810cf22cc5583bef312ee7d56be70f6c6129fc.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c6f3bec2e9768d9231cc042a9902570610a05ffb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...tock-glib-macro-to-define-boxed-type.patch | 228 ++++++++++++++++++
 ...rrecly-used-volatile-from-enum-type-.patch |  47 ++++
 .../poppler/poppler_21.03.0.bb                |   2 +
 3 files changed, 277 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-glib-Use-stock-glib-macro-to-define-boxed-type.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0002-glib-Remove-incorrecly-used-volatile-from-enum-type-.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-glib-Use-stock-glib-macro-to-define-boxed-type.patch b/meta-oe/recipes-support/poppler/poppler/0001-glib-Use-stock-glib-macro-to-define-boxed-type.patch
new file mode 100644
index 00000000000..89de98c0cb9
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/0001-glib-Use-stock-glib-macro-to-define-boxed-type.patch
@@ -0,0 +1,228 @@
+From 17b25e3122685d8277fe70fb6d27ab1eaf15b3e7 Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@src.gnome.org>
+Date: Fri, 26 Mar 2021 18:17:25 +0100
+Subject: [PATCH 1/2] glib: Use stock glib macro to define boxed type
+
+Upstream-Staus: Backport [https://github.com/freedesktop/poppler/commit/47de887d7658cfd68df44b3acf710971054f957b]
+Poppler already depends on a sufficiently new glib version, so we can
+simply use G_DEFINE_BOXED_TYPE instead of defining our own macro.
+---
+ glib/poppler-action.cc            |  4 ++--
+ glib/poppler-annot.cc             |  2 +-
+ glib/poppler-document.cc          |  6 +++---
+ glib/poppler-page.cc              | 20 ++++++++++----------
+ glib/poppler-private.h            | 15 ---------------
+ glib/poppler-structure-element.cc |  4 ++--
+ 6 files changed, 18 insertions(+), 33 deletions(-)
+
+diff --git a/glib/poppler-action.cc b/glib/poppler-action.cc
+index d395db7..b772a3c 100644
+--- a/glib/poppler-action.cc
++++ b/glib/poppler-action.cc
+@@ -25,7 +25,7 @@
+  * @title: PopplerAction
+  */
+ 
+-POPPLER_DEFINE_BOXED_TYPE(PopplerDest, poppler_dest, poppler_dest_copy, poppler_dest_free)
++G_DEFINE_BOXED_TYPE(PopplerDest, poppler_dest, poppler_dest_copy, poppler_dest_free)
+ 
+ /**
+  * poppler_dest_copy:
+@@ -88,7 +88,7 @@ static PopplerActionLayer *poppler_action_layer_copy(PopplerActionLayer *action_
+     return retval;
+ }
+ 
+-POPPLER_DEFINE_BOXED_TYPE(PopplerAction, poppler_action, poppler_action_copy, poppler_action_free)
++G_DEFINE_BOXED_TYPE(PopplerAction, poppler_action, poppler_action_copy, poppler_action_free)
+ 
+ /**
+  * poppler_action_free:
+diff --git a/glib/poppler-annot.cc b/glib/poppler-annot.cc
+index f4c5bb1..5320565 100644
+--- a/glib/poppler-annot.cc
++++ b/glib/poppler-annot.cc
+@@ -1693,7 +1693,7 @@ gchar *poppler_annot_file_attachment_get_name(PopplerAnnotFileAttachment *popple
+ }
+ 
+ /* PopplerAnnotCalloutLine */
+-POPPLER_DEFINE_BOXED_TYPE(PopplerAnnotCalloutLine, poppler_annot_callout_line, poppler_annot_callout_line_copy, poppler_annot_callout_line_free)
++G_DEFINE_BOXED_TYPE(PopplerAnnotCalloutLine, poppler_annot_callout_line, poppler_annot_callout_line_copy, poppler_annot_callout_line_free)
+ 
+ /**
+  * poppler_annot_callout_line_new:
+diff --git a/glib/poppler-document.cc b/glib/poppler-document.cc
+index bd26bc7..9e62ff6 100644
+--- a/glib/poppler-document.cc
++++ b/glib/poppler-document.cc
+@@ -2360,7 +2360,7 @@ struct _PopplerIndexIter
+     int index;
+ };
+ 
+-POPPLER_DEFINE_BOXED_TYPE(PopplerIndexIter, poppler_index_iter, poppler_index_iter_copy, poppler_index_iter_free)
++G_DEFINE_BOXED_TYPE(PopplerIndexIter, poppler_index_iter, poppler_index_iter_copy, poppler_index_iter_free)
+ 
+ /**
+  * poppler_index_iter_copy:
+@@ -2579,7 +2579,7 @@ struct _PopplerFontsIter
+     int index;
+ };
+ 
+-POPPLER_DEFINE_BOXED_TYPE(PopplerFontsIter, poppler_fonts_iter, poppler_fonts_iter_copy, poppler_fonts_iter_free)
++G_DEFINE_BOXED_TYPE(PopplerFontsIter, poppler_fonts_iter, poppler_fonts_iter_copy, poppler_fonts_iter_free)
+ 
+ /**
+  * poppler_fonts_iter_get_full_name:
+@@ -3111,7 +3111,7 @@ struct _PopplerLayersIter
+     int index;
+ };
+ 
+-POPPLER_DEFINE_BOXED_TYPE(PopplerLayersIter, poppler_layers_iter, poppler_layers_iter_copy, poppler_layers_iter_free)
++G_DEFINE_BOXED_TYPE(PopplerLayersIter, poppler_layers_iter, poppler_layers_iter_copy, poppler_layers_iter_free)
+ 
+ /**
+  * poppler_layers_iter_copy:
+diff --git a/glib/poppler-page.cc b/glib/poppler-page.cc
+index 7e21c71..2e229bf 100644
+--- a/glib/poppler-page.cc
++++ b/glib/poppler-page.cc
+@@ -1566,7 +1566,7 @@ void poppler_page_remove_annot(PopplerPage *page, PopplerAnnot *annot)
+ 
+ /* PopplerRectangle type */
+ 
+-POPPLER_DEFINE_BOXED_TYPE(PopplerRectangle, poppler_rectangle, poppler_rectangle_copy, poppler_rectangle_free)
++G_DEFINE_BOXED_TYPE(PopplerRectangle, poppler_rectangle, poppler_rectangle_copy, poppler_rectangle_free)
+ 
+ /**
+  * poppler_rectangle_new:
+@@ -1608,7 +1608,7 @@ void poppler_rectangle_free(PopplerRectangle *rectangle)
+ 
+ /* PopplerPoint type */
+ 
+-POPPLER_DEFINE_BOXED_TYPE(PopplerPoint, poppler_point, poppler_point_copy, poppler_point_free)
++G_DEFINE_BOXED_TYPE(PopplerPoint, poppler_point, poppler_point_copy, poppler_point_free)
+ 
+ /**
+  * poppler_point_new:
+@@ -1657,7 +1657,7 @@ void poppler_point_free(PopplerPoint *point)
+ 
+ /* PopplerQuadrilateral type */
+ 
+-POPPLER_DEFINE_BOXED_TYPE(PopplerQuadrilateral, poppler_quadrilateral, poppler_quadrilateral_copy, poppler_quadrilateral_free)
++G_DEFINE_BOXED_TYPE(PopplerQuadrilateral, poppler_quadrilateral, poppler_quadrilateral_copy, poppler_quadrilateral_free)
+ 
+ /**
+  * poppler_quadrilateral_new:
+@@ -1705,7 +1705,7 @@ void poppler_quadrilateral_free(PopplerQuadrilateral *quad)
+ 
+ /* PopplerTextAttributes type */
+ 
+-POPPLER_DEFINE_BOXED_TYPE(PopplerTextAttributes, poppler_text_attributes, poppler_text_attributes_copy, poppler_text_attributes_free)
++G_DEFINE_BOXED_TYPE(PopplerTextAttributes, poppler_text_attributes, poppler_text_attributes_copy, poppler_text_attributes_free)
+ 
+ /**
+  * poppler_text_attributes_new:
+@@ -1804,7 +1804,7 @@ void poppler_text_attributes_free(PopplerTextAttributes *text_attrs)
+  */
+ 
+ /* PopplerColor type */
+-POPPLER_DEFINE_BOXED_TYPE(PopplerColor, poppler_color, poppler_color_copy, poppler_color_free)
++G_DEFINE_BOXED_TYPE(PopplerColor, poppler_color, poppler_color_copy, poppler_color_free)
+ 
+ /**
+  * poppler_color_new:
+@@ -1848,7 +1848,7 @@ void poppler_color_free(PopplerColor *color)
+ }
+ 
+ /* PopplerLinkMapping type */
+-POPPLER_DEFINE_BOXED_TYPE(PopplerLinkMapping, poppler_link_mapping, poppler_link_mapping_copy, poppler_link_mapping_free)
++G_DEFINE_BOXED_TYPE(PopplerLinkMapping, poppler_link_mapping, poppler_link_mapping_copy, poppler_link_mapping_free)
+ 
+ /**
+  * poppler_link_mapping_new:
+@@ -1900,7 +1900,7 @@ void poppler_link_mapping_free(PopplerLinkMapping *mapping)
+ }
+ 
+ /* Poppler Image mapping type */
+-POPPLER_DEFINE_BOXED_TYPE(PopplerImageMapping, poppler_image_mapping, poppler_image_mapping_copy, poppler_image_mapping_free)
++G_DEFINE_BOXED_TYPE(PopplerImageMapping, poppler_image_mapping, poppler_image_mapping_copy, poppler_image_mapping_free)
+ 
+ /**
+  * poppler_image_mapping_new:
+@@ -1939,7 +1939,7 @@ void poppler_image_mapping_free(PopplerImageMapping *mapping)
+ }
+ 
+ /* Page Transition */
+-POPPLER_DEFINE_BOXED_TYPE(PopplerPageTransition, poppler_page_transition, poppler_page_transition_copy, poppler_page_transition_free)
++G_DEFINE_BOXED_TYPE(PopplerPageTransition, poppler_page_transition, poppler_page_transition_copy, poppler_page_transition_free)
+ 
+ /**
+  * poppler_page_transition_new:
+@@ -1983,7 +1983,7 @@ void poppler_page_transition_free(PopplerPageTransition *transition)
+ }
+ 
+ /* Form Field Mapping Type */
+-POPPLER_DEFINE_BOXED_TYPE(PopplerFormFieldMapping, poppler_form_field_mapping, poppler_form_field_mapping_copy, poppler_form_field_mapping_free)
++G_DEFINE_BOXED_TYPE(PopplerFormFieldMapping, poppler_form_field_mapping, poppler_form_field_mapping_copy, poppler_form_field_mapping_free)
+ 
+ /**
+  * poppler_form_field_mapping_new:
+@@ -2035,7 +2035,7 @@ void poppler_form_field_mapping_free(PopplerFormFieldMapping *mapping)
+ }
+ 
+ /* PopplerAnnot Mapping Type */
+-POPPLER_DEFINE_BOXED_TYPE(PopplerAnnotMapping, poppler_annot_mapping, poppler_annot_mapping_copy, poppler_annot_mapping_free)
++G_DEFINE_BOXED_TYPE(PopplerAnnotMapping, poppler_annot_mapping, poppler_annot_mapping_copy, poppler_annot_mapping_free)
+ 
+ /**
+  * poppler_annot_mapping_new:
+diff --git a/glib/poppler-private.h b/glib/poppler-private.h
+index d41b59c..1027271 100644
+--- a/glib/poppler-private.h
++++ b/glib/poppler-private.h
+@@ -143,21 +143,6 @@ gboolean _poppler_convert_pdf_date_to_gtime(const GooString *date, time_t *gdate
+ GDateTime *_poppler_convert_pdf_date_to_date_time(const GooString *date);
+ GooString *_poppler_convert_date_time_to_pdf_date(GDateTime *datetime);
+ 
+-/*
+- * A convenience macro for boxed type implementations, which defines a
+- * type_name_get_type() function registering the boxed type.
+- */
+-#define POPPLER_DEFINE_BOXED_TYPE(TypeName, type_name, copy_func, free_func)                                                                                                                                                                   \
+-    GType type_name##_get_type(void)                                                                                                                                                                                                           \
+-    {                                                                                                                                                                                                                                          \
+-        static volatile gsize g_define_type_id__volatile = 0;                                                                                                                                                                                  \
+-        if (g_once_init_enter(&g_define_type_id__volatile)) {                                                                                                                                                                                  \
+-            GType g_define_type_id = g_boxed_type_register_static(g_intern_static_string(#TypeName), (GBoxedCopyFunc)copy_func, (GBoxedFreeFunc)free_func);                                                                                    \
+-            g_once_init_leave(&g_define_type_id__volatile, g_define_type_id);                                                                                                                                                                  \
+-        }                                                                                                                                                                                                                                      \
+-        return g_define_type_id__volatile;                                                                                                                                                                                                     \
+-    }
+-
+ void _poppler_error_cb(ErrorCategory category, Goffset pos, const char *message);
+ 
+ #endif
+diff --git a/glib/poppler-structure-element.cc b/glib/poppler-structure-element.cc
+index aec7cd1..29d3e5c 100644
+--- a/glib/poppler-structure-element.cc
++++ b/glib/poppler-structure-element.cc
+@@ -581,7 +581,7 @@ struct _PopplerStructureElementIter
+     unsigned index;
+ };
+ 
+-POPPLER_DEFINE_BOXED_TYPE(PopplerStructureElementIter, poppler_structure_element_iter, poppler_structure_element_iter_copy, poppler_structure_element_iter_free)
++G_DEFINE_BOXED_TYPE(PopplerStructureElementIter, poppler_structure_element_iter, poppler_structure_element_iter_copy, poppler_structure_element_iter_free)
+ 
+ /**
+  * poppler_structure_element_iter_copy:
+@@ -763,7 +763,7 @@ struct _PopplerTextSpan
+     PopplerColor color;
+ };
+ 
+-POPPLER_DEFINE_BOXED_TYPE(PopplerTextSpan, poppler_text_span, poppler_text_span_copy, poppler_text_span_free)
++G_DEFINE_BOXED_TYPE(PopplerTextSpan, poppler_text_span, poppler_text_span_copy, poppler_text_span_free)
+ 
+ enum
+ {
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-support/poppler/poppler/0002-glib-Remove-incorrecly-used-volatile-from-enum-type-.patch b/meta-oe/recipes-support/poppler/poppler/0002-glib-Remove-incorrecly-used-volatile-from-enum-type-.patch
new file mode 100644
index 00000000000..f4a54a184f2
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/0002-glib-Remove-incorrecly-used-volatile-from-enum-type-.patch
@@ -0,0 +1,47 @@
+From 8b0890e2d1623e580d8a849e56c1f3a2984e782d Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@src.gnome.org>
+Date: Fri, 26 Mar 2021 18:17:25 +0100
+Subject: [PATCH 2/2] glib: Remove incorrecly used volatile from enum type
+ registration code
+
+Upstream-Status: Backport [https://github.com/freedesktop/poppler/commit/bdd110b45a38e8a4f80f522892e4c4a9e432abd5]
+---
+ glib/poppler-enums.c.template | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/glib/poppler-enums.c.template b/glib/poppler-enums.c.template
+index 26a51b4..eefc769 100644
+--- a/glib/poppler-enums.c.template
++++ b/glib/poppler-enums.c.template
+@@ -15,9 +15,9 @@
+ GType
+ @enum_name@_get_type (void)
+ {
+-  static volatile gsize g_define_type_id__volatile = 0;
++  static volatile gsize g_define_type_id = 0;
+  
+-  if (g_once_init_enter (&g_define_type_id__volatile)) {
++  if (g_once_init_enter (&g_define_type_id)) {
+     static const G@Type@Value values[] = {
+ /*** END value-header ***/
+ 
+@@ -28,13 +28,13 @@ GType
+ /*** BEGIN value-tail ***/
+       { 0, NULL, NULL }
+     };
+-    GType g_define_type_id = 
++    GType type =
+        g_@type@_register_static (g_intern_static_string ("@EnumName@"), values);
+       
+-    g_once_init_leave (&g_define_type_id__volatile, g_define_type_id);
++    g_once_init_leave (&g_define_type_id, type);
+   }
+     
+-  return g_define_type_id__volatile;
++  return g_define_type_id;
+ }
+ 
+ /*** END value-tail ***/
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-support/poppler/poppler_21.03.0.bb b/meta-oe/recipes-support/poppler/poppler_21.03.0.bb
index 52aa170216a..b272bc82cce 100644
--- a/meta-oe/recipes-support/poppler/poppler_21.03.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_21.03.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
+           file://0001-glib-Use-stock-glib-macro-to-define-boxed-type.patch \
+           file://0002-glib-Remove-incorrecly-used-volatile-from-enum-type-.patch \
            "
 SRC_URI[sha256sum] = "fd51ead4aac1d2f4684fa6e7b0ec06f0233ed21667e720a4e817e4455dd63d27"
 
-- 
2.17.1

