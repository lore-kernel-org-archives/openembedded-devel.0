Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UB2aV-0004Wf-Kf
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Feb 2013 13:28:06 +0100
Received: by mail-wi0-f179.google.com with SMTP id ez12so1971198wid.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2013 04:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=1L1yyLEQWmPs7DxdOpPuuB8gM/3KajJ6jprjl9gCqV0=;
	b=n08FqKYsQPuSYZ9yO3+f5wy8cxU4Nuekm0sWUyG3/ab48v5CXgmq1D7NYW/OtAOEK5
	k4xZV3o2mM1I70xbchZWl6uUFsiWA69zoLiE7qXBHlqkwq7c6gkaYgkJRmf31ME+PfKq
	R+Xt1cD6a6xtNVhCeyX2tXxYoK7PO/dq7sKuLOLFO1exitA0tznO3H+0j7BwmzoSW7wr
	BLfESXHx3TG0a4QdaF3JmeCSCax6d1rZwl+Eo322x6sB/TIAYzSbyJRWv8Y291zlc9xF
	j3Wan8Y5Da1/zaIUuIW9tcvQfc1Pu1Y42VZCsvfJ+/v3qEs6CC9A05tJ/b2qXU/7Lzvu
	4EKg==
X-Received: by 10.180.91.106 with SMTP id cd10mr10156336wib.6.1362053489870;
	Thu, 28 Feb 2013 04:11:29 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eo1sm32969583wib.8.2013.02.28.04.11.27
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 04:11:28 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Feb 2013 12:09:00 +0000
Message-Id: <c7a6f54eb07086712eeedbfc6d5ada4e97340ee4.1362053187.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362053187.git.ross.burton@intel.com>
References: <cover.1362053187.git.ross.burton@intel.com>
In-Reply-To: <cover.1362053187.git.ross.burton@intel.com>
References: <cover.1362053187.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQljjhpLCvHRiyRDx3rtqpblYn+QjYHOyF7TSaJTrVAhXtQ0g3avPUTRrvYY4n8F4QyTSKLF
Subject: [PATCH 1/3] gthumb: add, taken from oe-core
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
X-List-Received-Date: Thu, 28 Feb 2013 12:28:15 -0000

This was removed in oe-core, so add it to meta-gnome.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-gnome/gthumb/files/parallel.patch      |  158 ++++++++++++++++++++
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb   |   27 ++++
 2 files changed, 185 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gthumb/files/parallel.patch
 create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb

diff --git a/meta-gnome/recipes-gnome/gthumb/files/parallel.patch b/meta-gnome/recipes-gnome/gthumb/files/parallel.patch
new file mode 100644
index 0000000..20ce5c5
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gthumb/files/parallel.patch
@@ -0,0 +1,158 @@
+From 34969cde1dcb7740b4a7c3b6e3d04d481e5980b5 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 31 Jul 2012 17:26:27 +0100
+Subject: [PATCH] build: Fix parallel build problems with enum generation
+
+This is a backport from a patch against master.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=680925]
+---
+ extensions/file_tools/Makefile.am    |   10 ++++------
+ extensions/importer/Makefile.am      |   10 ++++------
+ extensions/pixbuf_savers/Makefile.am |   10 ++++------
+ gthumb/Makefile.am                   |   10 ++++------
+ 4 files changed, 16 insertions(+), 24 deletions(-)
+
+diff --git a/extensions/file_tools/Makefile.am b/extensions/file_tools/Makefile.am
+index 7785eff..d70a8a5 100644
+--- a/extensions/file_tools/Makefile.am
++++ b/extensions/file_tools/Makefile.am
+@@ -24,17 +24,16 @@ HEADER_FILES = 				\
+ 	gth-file-tool-undo.h		\
+ 	preferences.h
+ 
+-enum-types.h: $(HEADER_FILES) $(GLIB_MKENUMS)
++enum-types.h: $(HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#ifndef ENUM_TYPES_H\n#define ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
+ 		--fprod "/* enumerations from \"@filename@\" */\n" \
+ 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
+ 		--ftail "G_END_DECLS\n\n#endif /* ENUM_TYPES_H */" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) enum-types.h || cp xgen-$(@F) enum-types.h ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) enum-types.h )
+ 
+-enum-types.c: $(HEADER_FILES) enum-types.h
++enum-types.c: $(HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#include <glib-object.h>\n" \
+ 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
+@@ -42,8 +41,7 @@ enum-types.c: $(HEADER_FILES) enum-types.h
+ 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
+ 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) enum-types.c || cp xgen-$(@F) enum-types.c ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) enum-types.c )
+ 
+ libfile_tools_la_SOURCES = 		\
+ 	$(ENUM_TYPES)			\
+diff --git a/extensions/importer/Makefile.am b/extensions/importer/Makefile.am
+index 29e7f2c..07c1eba 100644
+--- a/extensions/importer/Makefile.am
++++ b/extensions/importer/Makefile.am
+@@ -14,17 +14,16 @@ HEADER_FILES = 					\
+ 	preferences.h				\
+ 	utils.h
+ 
+-gth-import-enum-types.h: $(HEADER_FILES) $(GLIB_MKENUMS)
++gth-import-enum-types.h: $(HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#ifndef ENUM_TYPES_H\n#define ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
+ 		--fprod "/* enumerations from \"@filename@\" */\n" \
+ 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
+ 		--ftail "G_END_DECLS\n\n#endif /* ENUM_TYPES_H */" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) gth-import-enum-types.h || cp xgen-$(@F) gth-import-enum-types.h ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) gth-import-enum-types.h )
+ 
+-gth-import-enum-types.c: $(HEADER_FILES) gth-import-enum-types.h
++gth-import-enum-types.c: $(HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#include <glib-object.h>\n" \
+ 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
+@@ -32,8 +31,7 @@ gth-import-enum-types.c: $(HEADER_FILES) gth-import-enum-types.h
+ 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
+ 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) gth-import-enum-types.c || cp xgen-$(@F) gth-import-enum-types.c ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) gth-import-enum-types.c )
+ 
+ libimporter_la_SOURCES = 			\
+ 	$(ENUM_TYPES)				\
+diff --git a/extensions/pixbuf_savers/Makefile.am b/extensions/pixbuf_savers/Makefile.am
+index bfe9f34..4764c32 100644
+--- a/extensions/pixbuf_savers/Makefile.am
++++ b/extensions/pixbuf_savers/Makefile.am
+@@ -10,17 +10,16 @@ ENUM_TYPES =				\
+ HEADER_FILES = 				\
+ 	preferences.h
+ 
+-enum-types.h: $(HEADER_FILES) $(GLIB_MKENUMS)
++enum-types.h: $(HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#ifndef ENUM_TYPES_H\n#define ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
+ 		--fprod "/* enumerations from \"@filename@\" */\n" \
+ 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
+ 		--ftail "G_END_DECLS\n\n#endif /* ENUM_TYPES_H */" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) enum-types.h || cp xgen-$(@F) enum-types.h ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) enum-types.h )
+ 
+-enum-types.c: $(HEADER_FILES) enum-types.h
++enum-types.c: $(HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#include <glib-object.h>\n" \
+ 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
+@@ -28,8 +27,7 @@ enum-types.c: $(HEADER_FILES) enum-types.h
+ 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
+ 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) enum-types.c || cp xgen-$(@F) enum-types.c ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) enum-types.c )
+ 
+ libpixbuf_savers_la_SOURCES = 	\
+ 	$(ENUM_TYPES)		\
+diff --git a/gthumb/Makefile.am b/gthumb/Makefile.am
+index e9e385e..2f14e03 100644
+--- a/gthumb/Makefile.am
++++ b/gthumb/Makefile.am
+@@ -296,17 +296,16 @@ gthumb_CFLAGS =							\
+ 	-DGTHUMB_EXTENSIONS_DIR=\"$(extensions_dir)\"		\
+ 	$(NULL)
+ 
+-gth-enum-types.h: $(PUBLIC_HEADER_FILES) $(GLIB_MKENUMS)
++gth-enum-types.h: $(PUBLIC_HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#ifndef GTH_ENUM_TYPES_H\n#define GTH_ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
+ 		--fprod "/* enumerations from \"@filename@\" */\n" \
+ 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
+ 		--ftail "G_END_DECLS\n\n#endif /* GTH_ENUM_TYPES_H */" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) gth-enum-types.h || cp xgen-$(@F) gth-enum-types.h ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) gth-enum-types.h )
+ 
+-gth-enum-types.c: $(PUBLIC_HEADER_FILES) gth-enum-types.h
++gth-enum-types.c: $(PUBLIC_HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#include <glib-object.h>\n" \
+ 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
+@@ -314,8 +313,7 @@ gth-enum-types.c: $(PUBLIC_HEADER_FILES) gth-enum-types.h
+ 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
+ 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) gth-enum-types.c || cp xgen-$(@F) gth-enum-types.c ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) gth-enum-types.c )
+ 
+ gth-marshal.h: gth-marshal.list $(GLIB_GENMARSHAL)
+ 	$(AM_V_GEN)( $(GLIB_GENMARSHAL) $(srcdir)/gth-marshal.list --header --prefix=gth_marshal > $@ )
+-- 
+1.7.10.4
+
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
new file mode 100644
index 0000000..0414386
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "gThumb is an image viewer and browser for the GNOME Desktop"
+SECTION = "x11/gnome"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base"
+
+PR = "r4"
+
+EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
+
+inherit gnome pkgconfig
+
+SRC_URI[archive.md5sum] = "97fc13221b0c5d80c27a2e25a3a3ac6f"
+SRC_URI[archive.sha256sum] = "cf809695230ab8892a078be454a42ade865754c72ec1da7c3d74d4310de54f1d"
+
+SRC_URI += "file://parallel.patch"
+
+do_install_append () {
+	rm ${D}${libdir}/${BPN}/extensions/*.a
+}
+
+FILES_${PN} += "${datadir}/icons"
+FILES_${PN} += "${libdir}/${BPN}/extensions/*.so \
+                ${libdir}/${BPN}/extensions/*.extension"
+FILES_${PN}-dev += "${libdir}/${BPN}/extensions/*.la"
+FILES_${PN}-dbg += "${libdir}/${BPN}/extensions/.debug/"
+
-- 
1.7.10.4



