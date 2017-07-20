Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id BDB5D7832B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 15:35:22 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id v105so42193125wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 08:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ob2Saj8zZ+tk3TnfIkzNbJU+dYHJoc03OKdFk5OSWWo=;
	b=eg4OKVbroyEN9TWz6kMH/XEcsWNfg64v1H5eLwivIbM9swLBHBmPfDHceB7+TWfSa3
	5mwimoCnRqicnVsGU+D1UimgfmRc/k9ztzK1MbTTzPOqvyna33OhuoHiycVRjgv61ZI8
	nsRWDGB6AC2u0f8j7Gp+QJitcPadubD5mEjMfsCGz4P+N2h5vZINyDX+tBficZl+Mhfu
	vCEN09OOx+zPj0ultLVGdQj7moqgAq5lWXWRGjiVL+Gyz8+YEMcaDEb6fy+0gsUkoueR
	bVbKD0ves0efgp4ZtfQqoz0JdfYu+6ME8CNdQP+dwcTlhkLD9XfXUghag2AzyzDvPAyh
	Il5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ob2Saj8zZ+tk3TnfIkzNbJU+dYHJoc03OKdFk5OSWWo=;
	b=AykvJfOlAOAAQwGd3M3CYmKw9HngvivWKdZ+yPLMENKEsblLrogDoeT29Vnq9yKeYM
	JbyDBIez2uiXiJQoiSrzM9AcHd8nrRxxRezc/Z+6xVApPPK2KPuB7w4n2VxOQSbRUCHD
	1ILQQF4dT3ksr69AMEo3C998dICJ1BWROSQaI4cJqtiFNxha4ngz/h1G8PcD7dAwyo10
	18GW4YRMBkynpbh4kM9XKLfDDmPPAwC6kXJ9LMjjzCRTQusFrZyxFMrvr4i6dDofUAng
	+t+6sAmeBiscG90LhdyYa2Q4fmHq36L13N70sLKRVnd7bKyPZ8U3b7FNcX8DocpCsoOt
	WjwQ==
X-Gm-Message-State: AIVw111Ymh182gQMHpcyVsufJkQ4BjFMfk9E9y+UfoHISWM2YCYQx489
	fk4EwZb11dhIl5EUlkg=
X-Received: by 10.223.141.146 with SMTP id o18mr3268840wrb.215.1500564922890; 
	Thu, 20 Jul 2017 08:35:22 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	190sm2853628wmh.36.2017.07.20.08.35.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 08:35:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:35:06 +0100
Message-Id: <20170720153508.23113-7-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170720153508.23113-1-ross.burton@intel.com>
References: <20170720153508.23113-1-ross.burton@intel.com>
Subject: [PATCH][meta-gnome 7/9] gthumb: remove (previously blacklisted)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jul 2017 15:35:23 -0000

GThumb 2.12.4 is from 2011 and blacklisted, so remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-Drop-help-directory-from-build.patch      |  25 ----
 .../recipes-gnome/gthumb/files/parallel.patch      | 158 ---------------------
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb   |  35 -----
 3 files changed, 218 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gthumb/files/0001-Drop-help-directory-from-build.patch
 delete mode 100644 meta-gnome/recipes-gnome/gthumb/files/parallel.patch
 delete mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb

diff --git a/meta-gnome/recipes-gnome/gthumb/files/0001-Drop-help-directory-from-build.patch b/meta-gnome/recipes-gnome/gthumb/files/0001-Drop-help-directory-from-build.patch
deleted file mode 100644
index d116968a6..000000000
--- a/meta-gnome/recipes-gnome/gthumb/files/0001-Drop-help-directory-from-build.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 48cb878cb724e7a509260f014db6365510b8b541 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 17 May 2016 14:05:29 +0300
-Subject: [PATCH] Drop help directory from build
-
-It hardcodes the use of xml2po tool form gnome-doc-utils
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index d056875..3fc4a41 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,4 +1,4 @@
--SUBDIRS = m4 copy-n-paste data po gthumb extensions tests help
-+SUBDIRS = m4 copy-n-paste data po gthumb extensions tests
- 
- ACLOCAL_AMFLAGS = -I m4
- AMCFLAGS = -fPIC -DPIC
--- 
-2.8.1
-
diff --git a/meta-gnome/recipes-gnome/gthumb/files/parallel.patch b/meta-gnome/recipes-gnome/gthumb/files/parallel.patch
deleted file mode 100644
index 20ce5c5aa..000000000
--- a/meta-gnome/recipes-gnome/gthumb/files/parallel.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From 34969cde1dcb7740b4a7c3b6e3d04d481e5980b5 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 31 Jul 2012 17:26:27 +0100
-Subject: [PATCH] build: Fix parallel build problems with enum generation
-
-This is a backport from a patch against master.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=680925]
----
- extensions/file_tools/Makefile.am    |   10 ++++------
- extensions/importer/Makefile.am      |   10 ++++------
- extensions/pixbuf_savers/Makefile.am |   10 ++++------
- gthumb/Makefile.am                   |   10 ++++------
- 4 files changed, 16 insertions(+), 24 deletions(-)
-
-diff --git a/extensions/file_tools/Makefile.am b/extensions/file_tools/Makefile.am
-index 7785eff..d70a8a5 100644
---- a/extensions/file_tools/Makefile.am
-+++ b/extensions/file_tools/Makefile.am
-@@ -24,17 +24,16 @@ HEADER_FILES = 				\
- 	gth-file-tool-undo.h		\
- 	preferences.h
- 
--enum-types.h: $(HEADER_FILES) $(GLIB_MKENUMS)
-+enum-types.h: $(HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#ifndef ENUM_TYPES_H\n#define ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
- 		--fprod "/* enumerations from \"@filename@\" */\n" \
- 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
- 		--ftail "G_END_DECLS\n\n#endif /* ENUM_TYPES_H */" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) enum-types.h || cp xgen-$(@F) enum-types.h ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) enum-types.h )
- 
--enum-types.c: $(HEADER_FILES) enum-types.h
-+enum-types.c: $(HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#include <glib-object.h>\n" \
- 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
-@@ -42,8 +41,7 @@ enum-types.c: $(HEADER_FILES) enum-types.h
- 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
- 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) enum-types.c || cp xgen-$(@F) enum-types.c ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) enum-types.c )
- 
- libfile_tools_la_SOURCES = 		\
- 	$(ENUM_TYPES)			\
-diff --git a/extensions/importer/Makefile.am b/extensions/importer/Makefile.am
-index 29e7f2c..07c1eba 100644
---- a/extensions/importer/Makefile.am
-+++ b/extensions/importer/Makefile.am
-@@ -14,17 +14,16 @@ HEADER_FILES = 					\
- 	preferences.h				\
- 	utils.h
- 
--gth-import-enum-types.h: $(HEADER_FILES) $(GLIB_MKENUMS)
-+gth-import-enum-types.h: $(HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#ifndef ENUM_TYPES_H\n#define ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
- 		--fprod "/* enumerations from \"@filename@\" */\n" \
- 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
- 		--ftail "G_END_DECLS\n\n#endif /* ENUM_TYPES_H */" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) gth-import-enum-types.h || cp xgen-$(@F) gth-import-enum-types.h ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) gth-import-enum-types.h )
- 
--gth-import-enum-types.c: $(HEADER_FILES) gth-import-enum-types.h
-+gth-import-enum-types.c: $(HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#include <glib-object.h>\n" \
- 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
-@@ -32,8 +31,7 @@ gth-import-enum-types.c: $(HEADER_FILES) gth-import-enum-types.h
- 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
- 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) gth-import-enum-types.c || cp xgen-$(@F) gth-import-enum-types.c ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) gth-import-enum-types.c )
- 
- libimporter_la_SOURCES = 			\
- 	$(ENUM_TYPES)				\
-diff --git a/extensions/pixbuf_savers/Makefile.am b/extensions/pixbuf_savers/Makefile.am
-index bfe9f34..4764c32 100644
---- a/extensions/pixbuf_savers/Makefile.am
-+++ b/extensions/pixbuf_savers/Makefile.am
-@@ -10,17 +10,16 @@ ENUM_TYPES =				\
- HEADER_FILES = 				\
- 	preferences.h
- 
--enum-types.h: $(HEADER_FILES) $(GLIB_MKENUMS)
-+enum-types.h: $(HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#ifndef ENUM_TYPES_H\n#define ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
- 		--fprod "/* enumerations from \"@filename@\" */\n" \
- 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
- 		--ftail "G_END_DECLS\n\n#endif /* ENUM_TYPES_H */" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) enum-types.h || cp xgen-$(@F) enum-types.h ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) enum-types.h )
- 
--enum-types.c: $(HEADER_FILES) enum-types.h
-+enum-types.c: $(HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#include <glib-object.h>\n" \
- 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
-@@ -28,8 +27,7 @@ enum-types.c: $(HEADER_FILES) enum-types.h
- 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
- 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) enum-types.c || cp xgen-$(@F) enum-types.c ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) enum-types.c )
- 
- libpixbuf_savers_la_SOURCES = 	\
- 	$(ENUM_TYPES)		\
-diff --git a/gthumb/Makefile.am b/gthumb/Makefile.am
-index e9e385e..2f14e03 100644
---- a/gthumb/Makefile.am
-+++ b/gthumb/Makefile.am
-@@ -296,17 +296,16 @@ gthumb_CFLAGS =							\
- 	-DGTHUMB_EXTENSIONS_DIR=\"$(extensions_dir)\"		\
- 	$(NULL)
- 
--gth-enum-types.h: $(PUBLIC_HEADER_FILES) $(GLIB_MKENUMS)
-+gth-enum-types.h: $(PUBLIC_HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#ifndef GTH_ENUM_TYPES_H\n#define GTH_ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
- 		--fprod "/* enumerations from \"@filename@\" */\n" \
- 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
- 		--ftail "G_END_DECLS\n\n#endif /* GTH_ENUM_TYPES_H */" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) gth-enum-types.h || cp xgen-$(@F) gth-enum-types.h ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) gth-enum-types.h )
- 
--gth-enum-types.c: $(PUBLIC_HEADER_FILES) gth-enum-types.h
-+gth-enum-types.c: $(PUBLIC_HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#include <glib-object.h>\n" \
- 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
-@@ -314,8 +313,7 @@ gth-enum-types.c: $(PUBLIC_HEADER_FILES) gth-enum-types.h
- 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
- 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) gth-enum-types.c || cp xgen-$(@F) gth-enum-types.c ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) gth-enum-types.c )
- 
- gth-marshal.h: gth-marshal.list $(GLIB_GENMARSHAL)
- 	$(AM_V_GEN)( $(GLIB_GENMARSHAL) $(srcdir)/gth-marshal.list --header --prefix=gth_marshal > $@ )
--- 
-1.7.10.4
-
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
deleted file mode 100644
index 62d3df98e..000000000
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "gThumb is an image viewer and browser for the GNOME Desktop"
-SECTION = "x11/gnome"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "gnome-common-native glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base intltool-native gconf-native"
-
-PR = "r4"
-
-EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
-
-inherit gnome pkgconfig
-
-SRC_URI[archive.md5sum] = "97fc13221b0c5d80c27a2e25a3a3ac6f"
-SRC_URI[archive.sha256sum] = "cf809695230ab8892a078be454a42ade865754c72ec1da7c3d74d4310de54f1d"
-GNOME_COMPRESS_TYPE="bz2"
-
-SRC_URI += "file://parallel.patch \
-            file://0001-Drop-help-directory-from-build.patch"
-
-do_configure_prepend () {
-    rm -f ${S}/m4/gnome-doc-utils.m4
-}
-
-do_install_append () {
-    rm -f ${D}${libdir}/${BPN}/extensions/*.a
-}
-
-FILES_${PN} += "${datadir}/icons"
-FILES_${PN} += "${libdir}/${BPN}/extensions/*.so \
-                ${libdir}/${BPN}/extensions/*.extension"
-FILES_${PN}-dev += "${libdir}/${BPN}/extensions/*.la"
-FILES_${PN}-dbg += "${libdir}/${BPN}/extensions/.debug/"
-
-
-PNBLACKLIST[gthumb] ?= "Depends on blacklisted gstreamer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.11.0


