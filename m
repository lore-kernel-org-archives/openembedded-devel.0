Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1ObIJH-0005ur-TO
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 21:17:04 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id E42AB43D6B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 21:16:50 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz E42AB43D6B
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1279653410; i=@fjfi.cvut.cz; bh=bVOCNuNNgGOSOpZBWDY3BMkO2EM=;
	h=From:Date:Subject:To:Message-Id;
	b=F7FRo16FYe25/WJvygnBIvMUU9QaRlFAhgpHRGvVVk1oddoBZ6kUZI3zPjOGJecil
	bER70sS/s4AEZUWSDGwTQ==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id T3jjioc1SC8M
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 21:16:43 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id EC92A43D61
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 21:16:42 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz EC92A43D61
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz EC92A43D61
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id C2E6646774; Tue, 20 Jul 2010 21:16:42 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
Date: Tue, 20 Jul 2010 21:06:45 +0200
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100720191642.C2E6646774@linux.fjfi.cvut.cz>
X-SA-Exim-Connect-IP: 147.32.9.3
X-SA-Exim-Mail-From: zub@linux.fjfi.cvut.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] webkit-gtk_svn: Update recipe to use r63746.
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
X-List-Received-Date: Tue, 20 Jul 2010 19:17:05 -0000

Tested GtkLauncher on om-gta02. Built epiphany and devhelp to see if
they compile ok with new version.

Signed-off-by: David Kozub <zub@linux.fjfi.cvut.cz>
---
 recipes/webkit/webkit-gtk/GNUmakefile.am           |  118 +++++++-------
 recipes/webkit/webkit-gtk/Makefile                 |   17 --
 recipes/webkit/webkit-gtk/Makefile.shared          |   18 --
 recipes/webkit/webkit-gtk/WebKit.pri               |  107 ------------
 recipes/webkit/webkit-gtk/WebKit.pro               |   13 --
 recipes/webkit/webkit-gtk/autogen.sh               |   63 -------
 recipes/webkit/webkit-gtk/configure.ac             |  101 +++++++++++-
 recipes/webkit/webkit-gtk/copy-lib-jsc-1.patch     |   17 ++
 recipes/webkit/webkit-gtk/gtk-doc.make             |  173 --------------------
 .../webkit/webkit-gtk/install-gtk-launcher.patch   |   23 +++
 recipes/webkit/webkit-gtk/update-webkit.sh         |    8 -
 recipes/webkit/webkit-gtk_svn.bb                   |   51 ++----
 12 files changed, 209 insertions(+), 500 deletions(-)
 delete mode 100644 recipes/webkit/webkit-gtk/Makefile
 delete mode 100644 recipes/webkit/webkit-gtk/Makefile.shared
 delete mode 100644 recipes/webkit/webkit-gtk/WebKit.pri
 delete mode 100644 recipes/webkit/webkit-gtk/WebKit.pro
 delete mode 100644 recipes/webkit/webkit-gtk/autogen.sh
 create mode 100644 recipes/webkit/webkit-gtk/copy-lib-jsc-1.patch
 delete mode 100644 recipes/webkit/webkit-gtk/gtk-doc.make
 create mode 100644 recipes/webkit/webkit-gtk/install-gtk-launcher.patch
 delete mode 100755 recipes/webkit/webkit-gtk/update-webkit.sh

diff --git a/recipes/webkit/webkit-gtk/GNUmakefile.am b/recipes/webkit/webkit-gtk/GNUmakefile.am
index a662290..755b51b 100644
--- a/recipes/webkit/webkit-gtk/GNUmakefile.am
+++ b/recipes/webkit/webkit-gtk/GNUmakefile.am
@@ -35,15 +35,11 @@ DISTCHECK_CONFIGURE_FLAGS = \
 
 # Directory for autogenerated sources
 GENSOURCES := $(top_builddir)/DerivedSources
-GENSOURCESWEBKITDOM := $(top_builddir)/DerivedSources/webkit
+GENSOURCES_JAVASCRIPTCORE := $(top_builddir)/DerivedSources/JavaScriptCore
+GENSOURCES_WEBCORE := $(top_builddir)/DerivedSources/WebCore
+GENSOURCES_WEBKIT := $(top_builddir)/DerivedSources/webkit
 GENPROGRAMS := $(top_builddir)/Programs
 
-# Script for creating hash tables
-CREATE_HASH_TABLE = $(srcdir)/JavaScriptCore/create_hash_table
-
-# Script for creating regexp tables
-CREATE_REGEXP_TABLES = $(srcdir)/JavaScriptCore/create_regex_tables
-
 # Programs to run the WebKitGtk unit tests
 GTESTER = gtester
 GTESTER_REPORT = gtester-report
@@ -53,7 +49,7 @@ bin_PROGRAMS :=
 noinst_PROGRAMS :=
 noinst_HEADERS :=
 noinst_LTLIBRARIES :=
-lib_LIBRARIES :=
+lib_LTLIBRARIES :=
 IDL_BINDINGS :=
 TEST_PROGS :=
 POFILES :=
@@ -63,13 +59,11 @@ javascriptcore_cppflags:=
 javascriptcore_sources :=
 javascriptcore_built_sources :=
 javascriptcore_built_nosources :=
-javascriptcore_dist :=
 webcore_cppflags :=
 webcore_sources :=
 webcore_libadd :=
 webcore_built_sources :=
 webcore_built_nosources :=
-webcore_dist :=
 webcoregtk_cppflags :=
 webcoregtk_sources :=
 IDL_BINDINGS_GDOM :=
@@ -167,8 +161,8 @@ version_script = -Wl,--version-script,$(srcdir)/autotools/symbols.filter
 endif
 
 # Shared libraries
-lib_LTLIBRARIES = \
-	libwebkit-1.0.la
+lib_LTLIBRARIES += \
+	libwebkitgtk-@WEBKITGTK_API_MAJOR_VERSION@.@WEBKITGTK_API_MINOR_VERSION@.la
 
 # Convenience libraries
 noinst_LTLIBRARIES += \
@@ -181,7 +175,7 @@ javascriptcore_cppflags += \
 	-I$(srcdir)/JavaScriptCore/wtf \
 	-I$(srcdir)/JavaScriptCore/wtf/gtk \
 	-I$(srcdir)/JavaScriptCore/wtf/gobject \
-	-I$(top_builddir)/DerivedSources
+	-I$(top_builddir)/DerivedSources/JavaScriptCore
 
 nodist_EXTRA_libJavaScriptCore_la_SOURCES = \
 	$(javascriptcore_built_nosources)
@@ -189,7 +183,7 @@ nodist_EXTRA_libJavaScriptCore_la_SOURCES = \
 nodist_libJavaScriptCore_la_SOURCES = \
 	$(javascriptcore_built_sources)
 
-libJavaScriptCore_ladir = $(prefix)/include/webkit-1.0/JavaScriptCore
+libJavaScriptCore_ladir = $(prefix)/include/webkit-@WEBKITGTK_API_VERSION@/JavaScriptCore
 libJavaScriptCore_la_HEADERS = $(javascriptcore_h_api)
 
 libJavaScriptCore_la_SOURCES = \
@@ -216,45 +210,44 @@ libJavaScriptCore_la_CPPFLAGS = \
 	$(javascriptcore_cppflags)
 
 # WebKit
-nodist_EXTRA_libwebkit_1_0_la_SOURCES = \
+nodist_EXTRA_libwebkitgtk_@WEBKITGTK_API_MAJOR_VERSION@_@WEBKITGTK_API_MINOR_VERSION@_la_SOURCES = \
 	$(webcore_built_nosources)
 
-nodist_libwebkit_1_0_la_SOURCES = \
+nodist_libwebkitgtk_@WEBKITGTK_API_MAJOR_VERSION@_@WEBKITGTK_API_MINOR_VERSION@_la_SOURCES = \
 	$(webcore_built_sources) \
 	$(webkitgtk_built_sources)
 
-libwebkit_1_0_ladir = $(prefix)/include/webkit-1.0/webkit
-libwebkit_1_0_la_HEADERS = \
+libwebkitgtk_@WEBKITGTK_API_MAJOR_VERSION@_@WEBKITGTK_API_MINOR_VERSION@_ladir = $(prefix)/include/webkit-@WEBKITGTK_API_VERSION@/webkit
+libwebkitgtk_@WEBKITGTK_API_MAJOR_VERSION@_@WEBKITGTK_API_MINOR_VERSION@_la_HEADERS = \
 	$(webkitgtk_h_api) \
 	WebKit/gtk/webkit/webkitenumtypes.h
 
-libwebkit_1_0_la_SOURCES = \
+libwebkitgtk_@WEBKITGTK_API_MAJOR_VERSION@_@WEBKITGTK_API_MINOR_VERSION@_la_SOURCES = \
 	$(webcore_sources) \
 	$(webcoregtk_sources) \
 	$(webkitgtk_sources)
 
-libwebkit_1_0_la_CXXFLAGS = \
+libwebkitgtk_@WEBKITGTK_API_MAJOR_VERSION@_@WEBKITGTK_API_MINOR_VERSION@_la_CXXFLAGS = \
 	$(global_cxxflags) \
 	$(corekit_cflags)
 
-libwebkit_1_0_la_CFLAGS = \
+libwebkitgtk_@WEBKITGTK_API_MAJOR_VERSION@_@WEBKITGTK_API_MINOR_VERSION@_la_CFLAGS = \
 	$(global_cflags) \
 	$(corekit_cflags)
 
-libwebkit_1_0_la_CPPFLAGS = \
+libwebkitgtk_@WEBKITGTK_API_MAJOR_VERSION@_@WEBKITGTK_API_MINOR_VERSION@_la_CPPFLAGS = \
 	$(corekit_cppflags) \
 	$(webkitgtk_cppflags) \
 	$(HILDON_CPPFLAGS)
 
-libwebkit_1_0_la_LDFLAGS = \
+libwebkitgtk_@WEBKITGTK_API_MAJOR_VERSION@_@WEBKITGTK_API_MINOR_VERSION@_la_LDFLAGS = \
 	-version-info @LIBWEBKITGTK_VERSION@ \
 	$(version_script) \
 	$(no_undefined)
 
-libwebkit_1_0_la_LIBADD = \
+libwebkitgtk_@WEBKITGTK_API_MAJOR_VERSION@_@WEBKITGTK_API_MINOR_VERSION@_la_LIBADD = \
 	-lpthread \
 	libJavaScriptCore.la \
-	libWebCoreJS.la \
 	libgdom.la \
 	$(webcore_ldflags) \
 	$(CAIRO_LIBS) \
@@ -277,7 +270,7 @@ libwebkit_1_0_la_LIBADD = \
 	$(UNICODE_LIBS) \
 	$(XT_LIBS)
 
-libgdom_ladir = $(prefix)/include/webkit-1.0/webkit
+libgdom_ladir = $(prefix)/include/webkit-@WEBKITGTK_API_VERSION@/webkit
 nodist_libgdom_la_HEADERS = \
 	$(libgdom_h_api)
 
@@ -311,7 +304,6 @@ endif
 if !ENABLE_DEBUG
 global_cppflags += -DNDEBUG
 global_cflags += $(SYMBOL_VISIBILITY)
-
 else
 webcoregtk_cppflags += \
 	-DG_DISABLE_DEPRECATED \
@@ -357,10 +349,10 @@ webkitgtk_h_api += \
 	$(top_builddir)/WebKit/gtk/webkit/webkitversion.h
 
 webkitgtk_built_sources += \
-	DerivedSources/webkitenumtypes.cpp \
-	DerivedSources/webkitdomenumtypes.cpp \
-	DerivedSources/webkitmarshal.cpp \
-	DerivedSources/webkitmarshal.h \
+	DerivedSources/webkit/webkitenumtypes.cpp \
+	DerivedSources/webkit/webkitdomenumtypes.cpp \
+	DerivedSources/webkit/webkitmarshal.cpp \
+	DerivedSources/webkit/webkitmarshal.h \
 	WebKit/gtk/webkit/webkitenumtypes.h
 
 webkitgtk_sources += \
@@ -415,7 +407,7 @@ webkitgtk_cppflags += \
 	-I$(srcdir)/WebKit/gtk/webkit \
 	-I$(top_builddir)/WebKit/gtk \
 	-I$(top_builddir)/WebKit/gtk/webkit \
-	-I$(GENSOURCESWEBKITDOM)
+	-I$(GENSOURCES_WEBKIT)
 
 webkitgtk_cleanfiles += \
 	$(top_builddir)/stamp-webkitmarshal.cpp \
@@ -425,38 +417,39 @@ webkitgtk_cleanfiles += \
 	$(top_builddir)/Programs/GtkLauncher \
 	$(top_builddir)/WebKit/gtk/docs/version.xml \
 	$(top_builddir)/WebKit/gtk/docs/GNUmakefile \
-	$(top_builddir)/WebKit/gtk/webkit-1.0.pc \
+	$(top_builddir)/WebKit/gtk/@WEBKITGTK_PC_NAME@-@WEBKITGTK_API_VERSION@.pc \
 	$(top_builddir)/WebKit/gtk/webkit/webkitenumtypes.h \
 	$(top_builddir)/WebKit/gtk/webkit/webkitversion.h
 
 pkgconfigdir = $(libdir)/pkgconfig
-pkgconfig_DATA = WebKit/gtk/webkit-1.0.pc
+pkgconfig_DATA = WebKit/gtk/@WEBKITGTK_PC_NAME@-@WEBKITGTK_API_VERSION@.pc
 
 if ENABLE_INTROSPECTION
-JSCORE_GIRSOURCES += JSCore-1.0.gir
-WEBKIT_GIRSOURCES += WebKit-1.0.gir
 
-# JSCore-1.0.gir is handwritten - this is a hack to make the typelib
-# generation work during make dist
-JSCore-1.0.gir: $(srcdir)/WebKit/gtk/JSCore-1.0.gir
-	cp $(srcdir)/WebKit/gtk/JSCore-1.0.gir $(builddir)/
+JSCore-@WEBKITGTK_API_VERSION@.gir: $(builddir)/WebKit/gtk/JSCore-@WEBKITGTK_API_VERSION@.gir
+	cp $(builddir)/WebKit/gtk/JSCore-@WEBKITGTK_API_VERSION@.gir $(builddir)/
+
+JSCORE_GIRSOURCES += JSCore-@WEBKITGTK_API_VERSION@.gir
+WEBKIT_GIRSOURCES += WebKit-@WEBKITGTK_API_VERSION@.gir
 
-$(WEBKIT_GIRSOURCES): $(JSCORE_GIRSOURCES) $(G_IR_SCANNER) libwebkit-1.0.la
-	$(AM_V_GEN)$(G_IR_SCANNER) -v --namespace WebKit --nsversion=1.0 \
+$(WEBKIT_GIRSOURCES): $(G_IR_SCANNER) $(JSCORE_GIRSOURCES) libwebkitgtk-@WEBKITGTK_API_MAJOR_VERSION@.@WEBKITGTK_API_MINOR_VERSION@.la
+	$(AM_V_GEN)$(G_IR_SCANNER) -v --namespace WebKit --nsversion=@WEBKITGTK_API_VERSION@ \
 	     --include=GObject-2.0 \
-	     --include=Gtk-2.0 \
-	     --include=JSCore-1.0 \
+	     --include=Gtk-@GTK_API_VERSION@ \
+	     --include=JSCore-@WEBKITGTK_API_VERSION@ \
 	     --include=Soup-2.4 \
-	     --library=webkit-1.0 \
+	     --library=webkitgtk-@WEBKITGTK_API_VERSION@ \
 	     --libtool="$(LIBTOOL)" \
 	     --pkg gobject-2.0 \
-	     --pkg gtk+-2.0 \
+	     --pkg gtk+-@GTK_API_VERSION@ \
 	     --pkg libsoup-2.4 \
 	     --output $@ \
 	     --add-include-path $(top_srcdir)/WebKit/gtk \
+	     --add-include-path $(builddir) \
 	     -I$(top_srcdir)/WebKit/gtk \
 	     -I$(top_builddir)/WebKit/gtk \
 	     -I$(top_builddir)/DerivedSources \
+	     -I$(top_builddir)/DerivedSources/webkit \
 	     -I$(top_srcdir)/JavaScriptCore/ForwardingHeaders \
 	     -I$(top_srcdir) \
 	     $(webkitgtk_h_api) \
@@ -469,15 +462,15 @@ typelibsdir += $(libdir)/girepository-1.0
 typelibs_DATA += $(JSCORE_GIRSOURCES:.gir=.typelib) $(WEBKIT_GIRSOURCES:.gir=.typelib)
 
 %.typelib: %.gir $(G_IR_COMPILER)
-	$(AM_V_GEN)$(G_IR_COMPILER) --includedir $(top_srcdir)/WebKit/gtk $< -o $@
+	$(AM_V_GEN)$(G_IR_COMPILER) --includedir $(top_srcdir)/WebKit/gtk --includedir $(builddir) $< -o $@
 
 CLEANFILES += $(JSCORE_GIRSOURCES) $(WEBKIT_GIRSOURCES) $(typelibs_DATA)
 
 endif
 
-EXTRA_DIST += WebKit/gtk/JSCore-1.0.gir
+EXTRA_DIST += $(builddir)/WebKit/gtk/JSCore-@WEBKITGTK_API_VERSION@.gir
 
-WEBKIT_MARSHAL = $(GENSOURCES)/webkitmarshal
+WEBKIT_MARSHAL = $(GENSOURCES_WEBKIT)/webkitmarshal
 WEBKIT_MARSHAL_LIST = $(top_srcdir)/WebKit/gtk/webkitmarshal.list
 
 $(WEBKIT_MARSHAL).cpp: stamp-webkitmarshal.cpp
@@ -517,7 +510,7 @@ stamp-webkitenumtypes.h: $(webkitgtk_h_api) GNUmakefile
 	&& rm -f xgen-gth \
 	&& echo timestamp > $(@F)
 
-DerivedSources/webkitenumtypes.cpp: $(webkitgtk_h_api) GNUmakefile
+DerivedSources/webkit/webkitenumtypes.cpp: $(webkitgtk_h_api) GNUmakefile
 	$(AM_V_GEN)glib-mkenums \
 			--fhead "#include <config.h>\n" \
 			--fhead "#include <glib-object.h>\n" \
@@ -560,7 +553,7 @@ stamp-webkitdomenumtypes.h: $(libgdom_h_api) GNUmakefile
 	&& rm -f xgen-cgth \
 	&& echo timestamp > $(@F)
 
-DerivedSources/webkitdomenumtypes.cpp: $(top_builddir)/WebKit/gtk/webkit/webkitdomenumtypes.h $(libgdom_h_api) GNUmakefile
+DerivedSources/webkit/webkitdomenumtypes.cpp: $(top_builddir)/WebKit/gtk/webkit/webkitdomenumtypes.h $(libgdom_h_api) GNUmakefile
 	$(AM_V_GEN)glib-mkenums \
 			--fhead "#include <config.h>\n" \
 			--fhead "#include <glib-object.h>\n" \
@@ -586,8 +579,6 @@ DerivedSources/webkitdomenumtypes.cpp: $(top_builddir)/WebKit/gtk/webkit/webkitd
 EXTRA_DIST += \
 	$(srcdir)/gtk-doc.make \
 	WebKit/LICENSE \
-	$(javascriptcore_dist) \
-	$(webcore_dist) \
 	$(srcdir)/autotools/symbols.filter \
 	$(srcdir)/WebKit/gtk/ChangeLog \
 	$(srcdir)/WebKit/gtk/NEWS \
@@ -603,7 +594,7 @@ EXTRA_DIST += \
 	$(srcdir)/WebKit/gtk/tests/test_utils.h
 
 # extra resource files
-resourcesdir = ${datadir}/webkit-1.0/resources
+resourcesdir = ${datadir}/webkit-@WEBKITGTK_API_VERSION@/resources
 dist_resources_DATA = \
 	$(shell ls $(srcdir)/WebKit/gtk/resources/*.html)
 
@@ -632,7 +623,7 @@ webkit_tests_cflags = \
 	$(LIBSOUP_CFLAGS)
 
 webkit_tests_ldadd = \
-	libwebkit-1.0.la \
+	libwebkitgtk-@WEBKITGTK_API_MAJOR_VERSION@.@WEBKITGTK_API_MINOR_VERSION@.la \
 	$(GTK_LIBS)	\
 	$(GLIB_LIBS) \
 	$(LIBSOUP_LIBS)
@@ -644,6 +635,7 @@ webkit_tests_ldflags = \
 TEST_PROGS += \
 	Programs/unittests/testdomdocument \
 	Programs/unittests/testdomdomwindow \
+	Programs/unittests/testdomnode \
 	Programs/unittests/testhttpbackend \
 	Programs/unittests/testloading \
 	Programs/unittests/testglobals \
@@ -662,7 +654,8 @@ TEST_PROGS += \
 	Programs/unittests/testwebresource \
 	Programs/unittests/testwebdatasource \
 	Programs/unittests/testwebview \
-	Programs/unittests/testkeyevents
+	Programs/unittests/testkeyevents \
+	Programs/unittests/testcopyandpaste
 
 # Add additional tests here
 Programs_unittests_testdomdocument_SOURCES = WebKit/gtk/tests/testdomdocument.c
@@ -675,6 +668,11 @@ Programs_unittests_testdomdomwindow_CFLAGS = $(webkit_tests_cflags)
 Programs_unittests_testdomdomwindow_LDADD = $(webkit_tests_ldadd)
 Programs_unittests_testdomdomwindow_LDFLAGS = $(webkit_tests_ldflags)
 
+Programs_unittests_testdomnode_SOURCES = WebKit/gtk/tests/testdomnode.c
+Programs_unittests_testdomnode_CFLAGS = $(webkit_tests_cflags)
+Programs_unittests_testdomnode_LDADD = $(webkit_tests_ldadd)
+Programs_unittests_testdomnode_LDFLAGS = $(webkit_tests_ldflags)
+
 Programs_unittests_testhttpbackend_SOURCES = WebKit/gtk/tests/testhttpbackend.c
 Programs_unittests_testhttpbackend_CFLAGS = $(webkit_tests_cflags)
 Programs_unittests_testhttpbackend_LDADD = $(webkit_tests_ldadd)
@@ -767,6 +765,11 @@ Programs_unittests_testkeyevents_CFLAGS = $(webkit_tests_cflags)
 Programs_unittests_testkeyevents_LDADD = $(webkit_tests_ldadd)
 Programs_unittests_testkeyevents_LDFLAGS = $(webkit_tests_ldflags)
 
+Programs_unittests_testcopyandpaste_SOURCES = WebKit/gtk/tests/testcopyandpaste.c
+Programs_unittests_testcopyandpaste_CFLAGS = $(webkit_tests_cflags)
+Programs_unittests_testcopyandpaste_LDADD = $(webkit_tests_ldadd)
+Programs_unittests_testcopyandpaste_LDFLAGS = $(webkit_tests_ldflags)
+
 # Autogenerated sources
 BUILT_SOURCES += \
 	$(javascriptcore_built_sources) \
@@ -819,6 +822,9 @@ maintainer-clean-local: distclean-local
 distclean-local:
 	-rm -rf $(GENSOURCES) $(GENPROGRAMS)
 
+dist-hook:
+	cp $(srcdir)/WebKit/gtk/NEWS $(distdir)
+
 install-data-local: po-install-data-local
 
 installdirs-data-local: po-installdirs-data-local
diff --git a/recipes/webkit/webkit-gtk/Makefile b/recipes/webkit/webkit-gtk/Makefile
deleted file mode 100644
index 1e50d1d..0000000
--- a/recipes/webkit/webkit-gtk/Makefile
+++ /dev/null
@@ -1,17 +0,0 @@
-MODULES = JavaScriptCore JavaScriptGlue WebCore WebKit WebKit2 WebKitTools 
-
-all:
-	@for dir in $(MODULES); do ${MAKE} $@ -C $$dir; exit_status=$$?; \
-	if [ $$exit_status -ne 0 ]; then exit $$exit_status; fi; done
-
-debug d development dev develop:
-	@for dir in $(MODULES); do ${MAKE} $@ -C $$dir; exit_status=$$?; \
-	if [ $$exit_status -ne 0 ]; then exit $$exit_status; fi; done
-
-release r deployment dep deploy:
-	@for dir in $(MODULES); do ${MAKE} $@ -C $$dir; exit_status=$$?; \
-	if [ $$exit_status -ne 0 ]; then exit $$exit_status; fi; done
-
-clean:
-	@for dir in $(MODULES); do ${MAKE} $@ -C $$dir; exit_status=$$?; \
-	if [ $$exit_status -ne 0 ]; then exit $$exit_status; fi; done
diff --git a/recipes/webkit/webkit-gtk/Makefile.shared b/recipes/webkit/webkit-gtk/Makefile.shared
deleted file mode 100644
index aa9fa72..0000000
--- a/recipes/webkit/webkit-gtk/Makefile.shared
+++ /dev/null
@@ -1,18 +0,0 @@
-SCRIPTS_PATH ?= ../WebKitTools/Scripts
-XCODE_OPTIONS = `perl -I$(SCRIPTS_PATH) -Mwebkitdirs -e 'print XcodeOptionString()'` $(ARGS)
-
-all:
-	( xcodebuild $(OTHER_OPTIONS) $(XCODE_OPTIONS) | grep -v setenv && exit $${PIPESTATUS[0]} )
-
-debug d development dev develop: force
-	$(SCRIPTS_PATH)/set-webkit-configuration --debug
-	( xcodebuild $(OTHER_OPTIONS) $(XCODE_OPTIONS) | grep -v setenv && exit $${PIPESTATUS[0]} )
-
-release r deployment dep deploy: force
-	$(SCRIPTS_PATH)/set-webkit-configuration --release
-	( xcodebuild $(OTHER_OPTIONS) $(XCODE_OPTIONS) | grep -v setenv && exit $${PIPESTATUS[0]} )
-
-clean:
-	( xcodebuild $(OTHER_OPTIONS) -alltargets clean $(XCODE_OPTIONS) | grep -v setenv && exit $${PIPESTATUS[0]} )
-
-force: ;
diff --git a/recipes/webkit/webkit-gtk/WebKit.pri b/recipes/webkit/webkit-gtk/WebKit.pri
deleted file mode 100644
index 73288ab..0000000
--- a/recipes/webkit/webkit-gtk/WebKit.pri
+++ /dev/null
@@ -1,107 +0,0 @@
-# Include file to make it easy to include WebKit into Qt projects
-
-
-isEmpty(OUTPUT_DIR) {
-    CONFIG(debug, debug|release) {
-        OUTPUT_DIR=$$PWD/WebKitBuild/Debug
-    } else { # Release
-        OUTPUT_DIR=$$PWD/WebKitBuild/Release
-    }
-}
-
-DEFINES += BUILDING_QT__=1
-building-libs {
-    win32-msvc*: INCLUDEPATH += $$PWD/JavaScriptCore/os-win32
-} else {
-    CONFIG(QTDIR_build) {
-        QT += webkit
-    } else {
-        QMAKE_LIBDIR = $$OUTPUT_DIR/lib $$QMAKE_LIBDIR
-        mac:!static:contains(QT_CONFIG, qt_framework):!CONFIG(webkit_no_framework) {
-            LIBS += -framework QtWebKit
-            QMAKE_FRAMEWORKPATH = $$OUTPUT_DIR/lib $$QMAKE_FRAMEWORKPATH
-        } else {
-            win32-*|wince* {
-                LIBS += -lQtWebKit$${QT_MAJOR_VERSION}
-            } else {
-                LIBS += -lQtWebKit
-            }
-        }
-    }
-    DEPENDPATH += $$PWD/WebKit/qt/Api
-}
-
-DEFINES += USE_SYSTEM_MALLOC
-CONFIG(release, debug|release) {
-    DEFINES += NDEBUG
-}
-
-BASE_DIR = $$PWD
-INCLUDEPATH += $$PWD/WebKit/qt/Api
-
-#
-# For builds inside Qt we interpret the output rule and the input of each extra compiler manually
-# and add the resulting sources to the SOURCES variable, because the build inside Qt contains already
-# all the generated files. We do not need to generate any extra compiler rules in that case.
-#
-# In addition this function adds a new target called 'generated_files' that allows manually calling
-# all the extra compilers to generate all the necessary files for the build using 'make generated_files'
-#
-defineTest(addExtraCompiler) {
-    CONFIG(QTDIR_build) {
-        outputRule = $$eval($${1}.output)
-        outVariable = $$eval($${1}.variable_out)
-        !isEqual(outVariable,GENERATED_SOURCES):return(true)
-
-        input = $$eval($${1}.input)
-        input = $$eval($$input)
-
-        for(file,input) {
-            base = $$basename(file)
-            base ~= s/\..+//
-            newfile=$$replace(outputRule,\\$\\{QMAKE_FILE_BASE\\},$$base)
-            SOURCES += $$newfile
-        }
-
-        export(SOURCES)
-    } else {
-        QMAKE_EXTRA_COMPILERS += $$1
-        generated_files.depends += compiler_$${1}_make_all
-        export(QMAKE_EXTRA_COMPILERS)
-        export(generated_files.depends)
-    }
-    return(true)
-}
-
-defineTest(addExtraCompilerWithHeader) {
-    addExtraCompiler($$1)
-
-    eval(headerFile = $${2})
-    isEmpty(headerFile) {
-        eval($${1}_header.output = $$eval($${1}.output))
-        eval($${1}_header.output ~= s/\.cpp/.h/)
-        eval($${1}_header.output ~= s/\.c/.h/)
-    } else {
-        eval($${1}_header.output = $$headerFile)
-    }
-
-    eval($${1}_header.input = $$eval($${1}.input))
-    eval($${1}_header.commands = @echo -n '')
-    eval($${1}_header.depends = compiler_$${1}_make_all)
-    eval($${1}_header.variable_out = GENERATED_FILES)
-
-    export($${1}_header.output)
-    export($${1}_header.input)
-    export($${1}_header.commands)
-    export($${1}_header.depends)
-    export($${1}_header.variable_out)
-
-    !CONFIG(QTDIR_build): QMAKE_EXTRA_COMPILERS += $${1}_header
-
-    export(QMAKE_EXTRA_COMPILERS)
-    export(generated_files.depends)
-    export(SOURCES)
-
-    return(true)
-}
-
diff --git a/recipes/webkit/webkit-gtk/WebKit.pro b/recipes/webkit/webkit-gtk/WebKit.pro
deleted file mode 100644
index bb2ae97..0000000
--- a/recipes/webkit/webkit-gtk/WebKit.pro
+++ /dev/null
@@ -1,13 +0,0 @@
-TEMPLATE = subdirs
-CONFIG += ordered
-
-SUBDIRS += \
-        WebCore \
-        JavaScriptCore/jsc.pro \
-        WebKit/qt/QtLauncher \
-        WebKit/qt/tests
-
-!win32:!symbian: SUBDIRS += WebKitTools/DumpRenderTree/qt/DumpRenderTree.pro \
-                            WebKitTools/DumpRenderTree/qt/TestNetscapePlugin/TestNetscapePlugin.pro
-
-include(WebKit/qt/docs/docs.pri)
diff --git a/recipes/webkit/webkit-gtk/autogen.sh b/recipes/webkit/webkit-gtk/autogen.sh
deleted file mode 100644
index 97beb20..0000000
--- a/recipes/webkit/webkit-gtk/autogen.sh
+++ /dev/null
@@ -1,63 +0,0 @@
-#! /bin/sh
-
-# Allow invocation from a separate build directory; in that case, we change
-# to the source directory to run the auto*, then change back before running configure
-srcdir=`dirname $0`
-test -z "$srcdir" && srcdir=.
-
-ORIGDIR=`pwd`
-cd $srcdir
-
-GTKDOCIZE_FLAGS="--copy"
-LIBTOOLIZE_FLAGS="--force --automake"
-ACLOCAL_FLAGS="-I autotools"
-AUTOMAKE_FLAGS="--foreign --add-missing"
-
-DIE=0
-
-(autoconf --version) < /dev/null > /dev/null 2>&1 || {
-    echo
-    echo "You must have autoconf installed to compile $PROJECT."
-    echo "Install the appropriate package for your distribution,"
-    echo "or get the source tarball at http://ftp.gnu.org/gnu/autoconf/"
-    DIE=1
-}
-
-(automake --version) < /dev/null > /dev/null 2>&1 || {
-    echo
-    echo "You must have automake installed to compile $PROJECT."
-    echo "Install the appropriate package for your distribution,"
-    echo "or get the source tarball at http://ftp.gnu.org/gnu/automake/"
-    DIE=1
-}
-
-LIBTOOLIZE=libtoolize
-($LIBTOOLIZE --version) < /dev/null > /dev/null 2>&1 || {
-    LIBTOOLIZE=glibtoolize
-    ($LIBTOOLIZE --version) < /dev/null > /dev/null 2>&1 || {
-        echo
-        echo "You must have libtool installed to compile $PROJECT."
-        echo "Install the appropriate package for your distribution,"
-        echo "or get the source tarball at http://ftp.gnu.org/gnu/libtool/"
-        DIE=1
-    }
-}
-
-if test "$DIE" -eq 1; then
-    exit 1
-fi
-
-rm -rf $top_srcdir/autom4te.cache
-
-touch README INSTALL
-
-gtkdocize $GTKDOCIZE_FLAGS > /dev/null 2>&1 || echo "Warning: not running gtk-docize."
-aclocal $ACLOCAL_FLAGS || exit $?
-$LIBTOOLIZE $LIBTOOLIZE_FLAGS || exit $?
-autoheader || exit $?
-automake $AUTOMAKE_FLAGS || exit $?
-autoconf || exit $?
-
-cd $ORIGDIR || exit 1
-
-$srcdir/configure $AUTOGEN_CONFIGURE_ARGS "$@" || exit $?
diff --git a/recipes/webkit/webkit-gtk/configure.ac b/recipes/webkit/webkit-gtk/configure.ac
index be29495..1e0194e 100644
--- a/recipes/webkit/webkit-gtk/configure.ac
+++ b/recipes/webkit/webkit-gtk/configure.ac
@@ -2,7 +2,7 @@ AC_PREREQ(2.59)
 
 m4_define([webkit_major_version], [1])
 m4_define([webkit_minor_version], [3])
-m4_define([webkit_micro_version], [1])
+m4_define([webkit_micro_version], [3])
 
 # This is the version we'll be using as part of our User-Agent string
 # e.g., AppleWebKit/$(webkit_user_agent_version) ...
@@ -35,7 +35,7 @@ AC_CONFIG_SRCDIR([WebCore/config.h])
 
 dnl # Libtool library version, not to confuse with API version
 dnl # see http://www.gnu.org/software/libtool/manual/html_node/Libtool-versioning.html#Libtool-versioning
-LIBWEBKITGTK_VERSION=20:0:18
+LIBWEBKITGTK_VERSION=0:1:0
 AC_SUBST([LIBWEBKITGTK_VERSION])
 
 AM_INIT_AUTOMAKE([foreign subdir-objects tar-ustar])
@@ -167,6 +167,45 @@ if test "$png_ok" != yes; then
 fi
 AC_SUBST([PNG_LIBS])
 
+# determine the GTK+ version to use
+AC_MSG_CHECKING([the GTK+ version to use])
+AC_ARG_WITH([gtk],
+        [AS_HELP_STRING([--with-gtk=2.0|3.0], [the GTK+ version to use (default: 2.0)])],
+        [case "$with_gtk" in
+        2.0|3.0) ;;
+        *) AC_MSG_ERROR([invalid GTK+ version specified]) ;;
+        esac],
+        [with_gtk=2.0])
+AC_MSG_RESULT([$with_gtk])
+
+case "$with_gtk" in
+     2.0) GTK_REQUIRED_VERSION=2.10
+          GTK_API_VERSION=2.0
+          WEBKITGTK_API_MAJOR_VERSION=1
+          WEBKITGTK_API_MINOR_VERSION=0
+          WEBKITGTK_API_VERSION=1.0
+          WEBKITGTK_PC_NAME=webkit
+          GAIL_PC_NAME=gail
+          GAIL_REQUIRED_VERSION=1.8
+          ;;
+     3.0) GTK_REQUIRED_VERSION=2.90
+          GTK_API_VERSION=3.0
+          WEBKITGTK_API_MAJOR_VERSION=3
+          WEBKITGTK_API_MINOR_VERSION=0
+          WEBKITGTK_API_VERSION=3.0
+          WEBKITGTK_PC_NAME=webkitgtk
+          GAIL_PC_NAME=gail-3.0
+          GAIL_REQUIRED_VERSION=2.90.4
+          ;;
+esac
+
+AC_SUBST([WEBKITGTK_API_MAJOR_VERSION])
+AC_SUBST([WEBKITGTK_API_MINOR_VERSION])
+AC_SUBST([WEBKITGTK_API_VERSION])
+AC_SUBST([WEBKITGTK_PC_NAME])
+AC_SUBST([GTK_API_VERSION])
+AM_CONDITIONAL([GTK_API_VERSION_2],[test "$GTK_API_VERSION" = "2.0"])
+
 # determine the GDK/GTK+ target
 AC_MSG_CHECKING([the target windowing system])
 AC_ARG_WITH(target,
@@ -205,7 +244,6 @@ LIBXML_REQUIRED_VERSION=2.6
 
 # minimum GTK+ base dependencies
 PANGO_REQUIRED_VERSION=1.12
-GTK_REQUIRED_VERSION=2.10
 
 # optional modules
 LIBXSLT_REQUIRED_VERSION=1.1.7
@@ -213,7 +251,6 @@ SQLITE_REQUIRED_VERSION=3.0
 GSTREAMER_REQUIRED_VERSION=0.10
 GSTREAMER_PLUGINS_BASE_REQUIRED_VERSION=0.10.25
 ENCHANT_REQUIRED_VERSION=0.22
-GAIL_REQUIRED_VERSION=1.8
 
 # Available modules
 #
@@ -223,7 +260,7 @@ GAIL_REQUIRED_VERSION=1.8
 # todo: webcore gtk
 WEBKIT_CHECK_DEPENDENCIES([glib unicode])
 
-GETTEXT_PACKAGE=$PACKAGE
+GETTEXT_PACKAGE=$PACKAGE-$GTK_API_VERSION
 AC_SUBST(GETTEXT_PACKAGE)
 AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE,"$GETTEXT_PACKAGE",
                    [The gettext catalog name])
@@ -242,7 +279,7 @@ PKG_CHECK_MODULES(ENCHANT, enchant >= $ENCHANT_REQUIRED_VERSION)
 AC_SUBST(ENCHANT_CFLAGS)
 AC_SUBST(ENCHANT_LIBS)
 
-PKG_CHECK_MODULES(GAIL, gail >= $GAIL_REQUIRED_VERSION)
+PKG_CHECK_MODULES(GAIL, $GAIL_PC_NAME >= $GAIL_REQUIRED_VERSION)
 AC_SUBST(GAIL_CFLAGS)
 AC_SUBST(GAIL_LIBS)
 
@@ -253,7 +290,7 @@ if test "$with_target" = "directfb"; then
    AC_DEFINE([WTF_PLATFORM_DIRECTFB],[1],[Define if target is DirectFB])
 else
    PKG_CHECK_MODULES(CAIRO, cairo >= $CAIRO_REQUIRED_VERSION)
-   PKG_CHECK_MODULES(GTK, gtk+-2.0 >= $GTK_REQUIRED_VERSION)
+   PKG_CHECK_MODULES(GTK, gtk+-$GTK_API_VERSION >= $GTK_REQUIRED_VERSION)
 
    if test "$with_target" = "x11" && test "$os_win32" = "no"; then
       # check for XT
@@ -347,6 +384,14 @@ AC_ARG_ENABLE(indexed_database,
               [],[enable_indexed_database="no"])
 AC_MSG_RESULT([$enable_indexed_database])
 
+# check whether to enable the speech input API
+AC_MSG_CHECKING([whether to enable the speech input API])
+AC_ARG_ENABLE(input_speech,
+              AC_HELP_STRING([--enable-input-speech],
+                             [enable the speech input API [default=no]]),
+              [],[enable_input_speech="no"])
+AC_MSG_RESULT([$enable_input_speech])
+
 # check whether to build with database support
 AC_MSG_CHECKING([whether to enable HTML5 client-side database storage support])
 AC_ARG_ENABLE(database,
@@ -371,6 +416,14 @@ AC_ARG_ENABLE(icon_database,
               [],[enable_icon_database="yes"])
 AC_MSG_RESULT([$enable_icon_database])
 
+# check whether to build with image resizer API support
+AC_MSG_CHECKING([whether to enable image resizer API support])
+AC_ARG_ENABLE(image_resizer,
+              AC_HELP_STRING([--enable-image-resizer],
+                             [enable image resizer [default=no]]),
+              [],[enable_image_resizer="no"])
+AC_MSG_RESULT([$enable_image_resizer])
+
 # check whether to enable HTML5 datalist support
 AC_MSG_CHECKING([whether to enable HTML5 datalist support])
 AC_ARG_ENABLE(datalist,
@@ -475,6 +528,14 @@ AC_ARG_ENABLE(workers,
               [],[enable_workers="yes"])
 AC_MSG_RESULT([$enable_workers])
 
+# check whether to enable directory upload support
+AC_MSG_CHECKING([whether to enable directory upload support])
+AC_ARG_ENABLE(directory_upload,
+              AC_HELP_STRING([--enable-directory-upload],
+                             [enable support for directory upload [default=no]]),
+              [], [enable_directory_upload="no"])
+AC_MSG_RESULT([$enable_directory_upload])
+
 # turn off svg features if --disable-svg is requested
 if test "$enable_svg" = "no"; then
    enable_svg_animation=no
@@ -553,6 +614,14 @@ AC_ARG_ENABLE(web_sockets,
               [],[enable_web_sockets="no"])
 AC_MSG_RESULT([$enable_web_sockets])
 
+# check whether to enable Web Timing support
+AC_MSG_CHECKING([whether to enable Web Timing support])
+AC_ARG_ENABLE(web_timing,
+              AC_HELP_STRING([--enable-web-timing],
+                             [enable support for Web Timing [default=no]]),
+              [],[enable_web_timing="no"])
+AC_MSG_RESULT([$enable_web_timing])
+
 # check whether to enable Blob.slice support
 AC_MSG_CHECKING([whether to enable Blob.slice support])
 AC_ARG_ENABLE(blob_slice,
@@ -646,7 +715,7 @@ GIRDIR=
 GIRTYPELIBDIR=
 
 if test "$enable_introspection" = "yes"; then
-  GOBJECT_INTROSPECTION_REQUIRED=0.6.2
+  GOBJECT_INTROSPECTION_REQUIRED=0.6.15
   PKG_CHECK_MODULES([INTROSPECTION],[gobject-introspection-1.0 >= $GOBJECT_INTROSPECTION_REQUIRED])
   
   G_IR_SCANNER="$($PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0)"
@@ -807,13 +876,16 @@ AM_CONDITIONAL([ENABLE_BLOB_SLICE],[test "$enable_blob_slice" = "yes"])
 AM_CONDITIONAL([ENABLE_CHANNEL_MESSAGING],[test "$enable_channel_messaging" = "yes"])
 AM_CONDITIONAL([ENABLE_JAVASCRIPT_DEBUGGER],[test "$enable_javascript_debugger" = "yes"])
 AM_CONDITIONAL([ENABLE_OFFLINE_WEB_APPLICATIONS],[test "$enable_offline_web_applications" = "yes"])
+AM_CONDITIONAL([ENABLE_DIRECTORY_UPLOAD],[test "$enable_directory_upload" = "yes"])
 AM_CONDITIONAL([ENABLE_DOM_STORAGE],[test "$enable_dom_storage" = "yes"])
 AM_CONDITIONAL([ENABLE_DATABASE],[test "$enable_database" = "yes"])
 AM_CONDITIONAL([ENABLE_DATALIST],[test "$enable_datalist" = "yes"])
 AM_CONDITIONAL([ENABLE_EVENTSOURCE],[test "$enable_eventsource" = "yes"])
 AM_CONDITIONAL([ENABLE_FAST_MOBILE_SCROLLING],[test "$enable_fast_mobile_scrolling" = "yes"])
 AM_CONDITIONAL([ENABLE_ICONDATABASE],[test "$enable_icon_database" = "yes"])
+AM_CONDITIONAL([ENABLE_IMAGE_RESIZER],[test "$enable_image_resizer" = "yes"])
 AM_CONDITIONAL([ENABLE_INDEXED_DATABASE],[test "$enable_indexed_database" = "yes"])
+AM_CONDITIONAL([ENABLE_INPUT_SPEECH],[test "$enable_input_speech" = "yes"])
 AM_CONDITIONAL([ENABLE_XHTMLMP],[test "$enable_xhtmlmp" = "yes"])
 AM_CONDITIONAL([ENABLE_XPATH],[test "$enable_xpath" = "yes"])
 AM_CONDITIONAL([ENABLE_XSLT],[test "$enable_xslt" = "yes"])
@@ -841,6 +913,7 @@ AM_CONDITIONAL([ENABLE_SHARED_WORKERS],[test "$enable_shared_workers" = "yes"])
 AM_CONDITIONAL([SVG_FLAGS],[test "$svg_flags" = "yes"])
 AM_CONDITIONAL([HTML_FLAGS],[test "$html_flags" = "yes"])
 AM_CONDITIONAL([ENABLE_WEB_SOCKETS],[test "$enable_web_sockets" = "yes"])
+AM_CONDITIONAL([ENABLE_WEB_TIMING],[test "$enable_web_timing" = "yes"])
 
 # Gtk conditionals
 AM_CONDITIONAL([ENABLE_INTROSPECTION],[test "$enable_introspection" = "yes"])
@@ -848,13 +921,18 @@ AM_CONDITIONAL([ENABLE_INTROSPECTION],[test "$enable_introspection" = "yes"])
 
 AC_CONFIG_FILES([
 GNUmakefile
-WebKit/gtk/webkit-1.0.pc:WebKit/gtk/webkit.pc.in
 WebKit/gtk/webkit/webkitversion.h
 WebKit/gtk/docs/GNUmakefile
 WebKit/gtk/docs/version.xml
 ]
 )
 
+AC_CONFIG_FILES([
+WebKit/gtk/${WEBKITGTK_PC_NAME}-${WEBKITGTK_API_VERSION}.pc:WebKit/gtk/webkit.pc.in
+WebKit/gtk/JSCore-${WEBKITGTK_API_VERSION}.gir:WebKit/gtk/JSCore.gir.in]
+,[WEBKITGTK_API_VERSION=$WEBKITGTK_API_VERSION,WEBKITGTK_PC_NAME=$WEBKITGTK_PC_NAME]
+)
+
 AC_OUTPUT
 
 echo "
@@ -870,6 +948,7 @@ Build configuration:
 Features:
  3D Transforms                                            : $enable_3D_transforms
  Blob.slice support                                       : $enable_blob_slice
+ Directory upload                                         : $enable_directory_upload
  Fast Mobile Scrolling                                    : $enable_fast_mobile_scrolling
  JIT compilation                                          : $enable_jit
  Filters support                                          : $enable_filters
@@ -887,7 +966,9 @@ Features:
  HTML5 server-sent events support                         : $enable_eventsource
  HTML5 video element support                              : $enable_video
  Icon database support                                    : $enable_icon_database
+ Image resizer support                                    : $enable_image_resizer
  SharedWorkers support                                    : $enable_shared_workers
+ Speech input support                                     : $enable_input_speech
  SVG support                                              : $enable_svg
  SVG animation support                                    : $enable_svg_animation
  SVG fonts support                                        : $enable_svg_fonts
@@ -896,11 +977,13 @@ Features:
  SVG use element support                                  : $enable_svg_use
  WML support                                              : $enable_wml
  Web Sockets support                                      : $enable_web_sockets
+ Web Timing support                                       : $enable_web_timing
  Web Workers support                                      : $enable_workers
  XHTML-MP support                                         : $enable_xhtmlmp
  XPATH support                                            : $enable_xpath
  XSLT support                                             : $enable_xslt
 GTK+ configuration:
+ GTK+ version                                             : $with_gtk
  GDK target                                               : $with_target
  Hildon UI extensions                                     : $with_hildon
  Introspection support                                    : $enable_introspection
diff --git a/recipes/webkit/webkit-gtk/copy-lib-jsc-1.patch b/recipes/webkit/webkit-gtk/copy-lib-jsc-1.patch
new file mode 100644
index 0000000..1eee544
--- /dev/null
+++ b/recipes/webkit/webkit-gtk/copy-lib-jsc-1.patch
@@ -0,0 +1,17 @@
+Programs/jsc is copied to Programs/jsc-1 by GNUmakefile. But Programs/jsc is just libtool
+wrapper to Programs/.libs/jsc. The jsc-1 copy then fails to install because it lacks
+Programs/.libs/jsc-1.
+
+Copy .libs/jsc too to fix that.
+
+diff -ru WebKit.original/JavaScriptCore/GNUmakefile.am WebKit/JavaScriptCore/GNUmakefile.am
+--- WebKit.original/JavaScriptCore/GNUmakefile.am	2010-07-18 10:11:42.000000000 +0200
++++ WebKit/JavaScriptCore/GNUmakefile.am	2010-07-18 10:16:13.000000000 +0200
+@@ -607,6 +607,7 @@
+ # jsc
+ Programs/jsc-@WEBKITGTK_API_MAJOR_VERSION@: Programs/jsc
+ 	$(AM_V_GEN)cp -f Programs/jsc Programs/jsc-@WEBKITGTK_API_MAJOR_VERSION@
++	$(AM_V_GEN)cp -f Programs/.libs/jsc Programs/.libs/jsc-@WEBKITGTK_API_MAJOR_VERSION@
+ Programs_jsc_@WEBKITGTK_API_MAJOR_VERSION@_LDADD =
+ Programs_jsc_@WEBKITGTK_API_MAJOR_VERSION@_SOURCES =
+ 
diff --git a/recipes/webkit/webkit-gtk/gtk-doc.make b/recipes/webkit/webkit-gtk/gtk-doc.make
deleted file mode 100644
index 354ffb7..0000000
--- a/recipes/webkit/webkit-gtk/gtk-doc.make
+++ /dev/null
@@ -1,173 +0,0 @@
-# -*- mode: makefile -*-
-
-####################################
-# Everything below here is generic #
-####################################
-
-if GTK_DOC_USE_LIBTOOL
-GTKDOC_CC = $(LIBTOOL) --mode=compile $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
-GTKDOC_LD = $(LIBTOOL) --mode=link $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
-else
-GTKDOC_CC = $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
-GTKDOC_LD = $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
-endif
-
-# We set GPATH here; this gives us semantics for GNU make
-# which are more like other make's VPATH, when it comes to
-# whether a source that is a target of one rule is then
-# searched for in VPATH/GPATH.
-#
-GPATH = $(srcdir)
-
-TARGET_DIR=$(HTML_DIR)/$(DOC_MODULE)
-
-EXTRA_DIST = 				\
-	$(content_files)		\
-	$(HTML_IMAGES)			\
-	$(DOC_MAIN_SGML_FILE)		\
-	$(DOC_MODULE)-sections.txt	\
-	$(DOC_MODULE)-overrides.txt
-
-DOC_STAMPS=scan-build.stamp tmpl-build.stamp sgml-build.stamp html-build.stamp \
-	   $(srcdir)/tmpl.stamp $(srcdir)/sgml.stamp $(srcdir)/html.stamp
-
-SCANOBJ_FILES = 		 \
-	$(DOC_MODULE).args 	 \
-	$(DOC_MODULE).hierarchy  \
-	$(DOC_MODULE).interfaces \
-	$(DOC_MODULE).prerequisites \
-	$(DOC_MODULE).signals
-
-REPORT_FILES = \
-	$(DOC_MODULE)-undocumented.txt \
-	$(DOC_MODULE)-undeclared.txt \
-	$(DOC_MODULE)-unused.txt
-
-CLEANFILES = $(SCANOBJ_FILES) $(REPORT_FILES) $(DOC_STAMPS)
-
-if ENABLE_GTK_DOC
-all-local: html-build.stamp
-else
-all-local:
-endif
-
-docs: html-build.stamp
-
-#### scan ####
-
-scan-build.stamp: $(HFILE_GLOB) $(CFILE_GLOB)
-	@echo 'gtk-doc: Scanning header files'
-	@-chmod -R u+w $(srcdir)
-	cd $(srcdir) && \
-	  gtkdoc-scan --module=$(DOC_MODULE) --source-dir=$(DOC_SOURCE_DIR) --ignore-headers="$(IGNORE_HFILES)" $(SCAN_OPTIONS) $(EXTRA_HFILES)
-	if grep -l '^..*$$' $(srcdir)/$(DOC_MODULE).types > /dev/null 2>&1 ; then \
-	    CC="$(GTKDOC_CC)" LD="$(GTKDOC_LD)" CFLAGS="$(GTKDOC_CFLAGS)" LDFLAGS="$(GTKDOC_LIBS)" gtkdoc-scangobj $(SCANGOBJ_OPTIONS) --module=$(DOC_MODULE) --output-dir=$(srcdir) ; \
-	else \
-	    cd $(srcdir) ; \
-	    for i in $(SCANOBJ_FILES) ; do \
-               test -f $$i || touch $$i ; \
-	    done \
-	fi
-	touch scan-build.stamp
-
-$(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt: scan-build.stamp
-	@true
-
-#### templates ####
-
-tmpl-build.stamp: $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt
-	@echo 'gtk-doc: Rebuilding template files'
-	@-chmod -R u+w $(srcdir)
-	cd $(srcdir) && gtkdoc-mktmpl --module=$(DOC_MODULE) $(MKTMPL_OPTIONS)
-	touch tmpl-build.stamp
-
-tmpl.stamp: tmpl-build.stamp
-	@true
-
-tmpl/*.sgml:
-	@true
-
-
-#### xml ####
-
-sgml-build.stamp: tmpl.stamp $(HFILE_GLOB) $(CFILE_GLOB) $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*.sgml $(expand_content_files)
-	@echo 'gtk-doc: Building XML'
-	@-chmod -R u+w $(srcdir)
-	cd $(srcdir) && \
-	gtkdoc-mkdb --module=$(DOC_MODULE) --source-dir=$(DOC_SOURCE_DIR) --output-format=xml --expand-content-files="$(expand_content_files)" --main-sgml-file=$(DOC_MAIN_SGML_FILE) $(MKDB_OPTIONS)
-	touch sgml-build.stamp
-
-sgml.stamp: sgml-build.stamp
-	@true
-
-#### html ####
-
-html-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
-	@echo 'gtk-doc: Building HTML'
-	@-chmod -R u+w $(srcdir)
-	rm -rf $(srcdir)/html
-	mkdir $(srcdir)/html
-	cd $(srcdir)/html && gtkdoc-mkhtml $(DOC_MODULE) ../$(DOC_MAIN_SGML_FILE)
-	test "x$(HTML_IMAGES)" = "x" || ( cd $(srcdir) && cp $(HTML_IMAGES) html )
-	@echo 'gtk-doc: Fixing cross-references'
-	cd $(srcdir) && gtkdoc-fixxref --module-dir=html --html-dir=$(HTML_DIR) $(FIXXREF_OPTIONS)
-	touch html-build.stamp
-
-##############
-
-clean-local:
-	rm -f *~ *.bak
-	rm -rf .libs
-
-distclean-local:
-	cd $(srcdir) && \
-	  rm -rf xml $(REPORT_FILES) \
-	         $(DOC_MODULE)-decl-list.txt $(DOC_MODULE)-decl.txt
-
-maintainer-clean-local: clean
-	cd $(srcdir) && rm -rf xml html
-
-install-data-local:
-	-installfiles=`echo $(srcdir)/html/*`; \
-	if test "$$installfiles" = '$(srcdir)/html/*'; \
-	then echo '-- Nothing to install' ; \
-	else \
-	  $(mkinstalldirs) $(DESTDIR)$(TARGET_DIR); \
-	  for i in $$installfiles; do \
-	    echo '-- Installing '$$i ; \
-	    $(INSTALL_DATA) $$i $(DESTDIR)$(TARGET_DIR); \
-	  done; \
-	  echo '-- Installing $(srcdir)/html/index.sgml' ; \
-	  $(INSTALL_DATA) $(srcdir)/html/index.sgml $(DESTDIR)$(TARGET_DIR) || :; \
-	  which gtkdoc-rebase >/dev/null && \
-	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
-	fi
-	
-
-uninstall-local:
-	rm -f $(DESTDIR)$(TARGET_DIR)/*
-
-#
-# Require gtk-doc when making dist
-#
-if ENABLE_GTK_DOC
-dist-check-gtkdoc:
-else
-dist-check-gtkdoc:
-	@echo "*** gtk-doc must be installed and enabled in order to make dist"
-	@false
-endif
-
-dist-hook: dist-check-gtkdoc dist-hook-local
-	mkdir $(distdir)/tmpl
-	mkdir $(distdir)/xml
-	mkdir $(distdir)/html
-	-cp $(srcdir)/tmpl/*.sgml $(distdir)/tmpl
-	-cp $(srcdir)/xml/*.xml $(distdir)/xml
-	cp $(srcdir)/html/* $(distdir)/html
-	-cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
-	-cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
-	cd $(distdir) && rm -f $(DISTCLEANFILES)
-	-gtkdoc-rebase --online --relative --html-dir=$(distdir)/html
-
-.PHONY : dist-hook-local docs
diff --git a/recipes/webkit/webkit-gtk/install-gtk-launcher.patch b/recipes/webkit/webkit-gtk/install-gtk-launcher.patch
new file mode 100644
index 0000000..3d95c4b
--- /dev/null
+++ b/recipes/webkit/webkit-gtk/install-gtk-launcher.patch
@@ -0,0 +1,23 @@
+--- webkit-gtk-1.3.1+svnr63062-r63062-r2.orig/WebKitTools/GNUmakefile.am	2010-07-13 11:49:55.000000000 +0200
++++ webkit-gtk-1.3.1+svnr63062-r63062-r2/WebKitTools/GNUmakefile.am	2010-07-13 22:49:58.000000000 +0200
+@@ -1,6 +1,8 @@
++bin_PROGRAMS += \
++        Programs/GtkLauncher
++
+ noinst_PROGRAMS += \
+ 	Programs/DumpRenderTree \
+-	Programs/GtkLauncher \
+ 	Programs/ImageDiff
+ 
+ # GtkLauncher
+@@ -26,10 +28,6 @@
+ 	$(GTK_LIBS) \
+ 	$(GLIB_LIBS)
+ 
+-Programs_GtkLauncher_LDFLAGS = \
+-	-no-fast-install \
+-	-no-install
+-
+ # DumpRenderTree
+ dumprendertree_cppflags := \
+ 	-I$(srcdir)/WebKitTools/DumpRenderTree \
diff --git a/recipes/webkit/webkit-gtk/update-webkit.sh b/recipes/webkit/webkit-gtk/update-webkit.sh
deleted file mode 100755
index 723c45a..0000000
--- a/recipes/webkit/webkit-gtk/update-webkit.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-# usage: sh update-webkit.sh <revision>
-
-export rev=$1
-
-for i in autogen.sh configure.ac GNUmakefile.am Makefile Makefile.shared  ; do
-	wget "http://trac.webkit.org/browser/trunk/$i?rev=$rev&format=raw" -O $i
-done
diff --git a/recipes/webkit/webkit-gtk_svn.bb b/recipes/webkit/webkit-gtk_svn.bb
index b646049..7dc6980 100644
--- a/recipes/webkit/webkit-gtk_svn.bb
+++ b/recipes/webkit/webkit-gtk_svn.bb
@@ -3,10 +3,14 @@ DEPENDS = "geoclue enchant gtk-doc-native gtk-doc gnome-keyring libsoup-2.4 curl
 
 SRCREV_FORMAT = "webcore-rwebkit"
 
-PR = "r1"
-SRCREV = "60413"
-PV = "1.3.1+svnr${SRCPV}"
-
+PR = "r2"
+SRCREV = "63746"
+PV = "1.3.3+svnr${SRCPV}"
+
+# svn://svn.webkit.org/repository/webkit/;module=trunk would do but then lots
+# of unneeded code/tests would be fetched. -> Fetch just subdirs that are needed.
+# Unfortunately, svn fetcher can't fetch single files, so the few top-level
+# files that are needed are in ./webkit-gtk. They come from the svn repo.
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=JavaScriptCore;proto=http \
   svn://svn.webkit.org/repository/webkit/trunk/;module=JavaScriptGlue;proto=http \
@@ -15,55 +19,30 @@ SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;proto=http \
   svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitTools;proto=http \
   svn://svn.webkit.org/repository/webkit/trunk/;module=autotools;proto=http \
-  file://Makefile \
-  file://Makefile.shared \
-  file://autogen.sh \
   file://configure.ac \
   file://GNUmakefile.am \
-  file://gtk-doc.make \
- "
+  file://copy-lib-jsc-1.patch \
+  file://install-gtk-launcher.patch \
+"
 
 S = "${WORKDIR}/"
 
-inherit autotools lib_package
+inherit autotools lib_package gtk-doc
 
 export BISON="${STAGING_BINDIR_NATIVE}/bison"
 ARM_INSTRUCTION_SET = "arm"
 EXTRA_OECONF = "\
                 --enable-debug=no \
-                --enable-svg \
+                --enable-optimizations=yes \
+                --enable-svg=yes \
                 --enable-icon-database=yes \
                 --enable-geolocation=yes \
-#                --with-unicode-backend=glib \
 "
 
 EXTRA_AUTORECONF = " -I autotools "
 
-# Dolt gets used on x86 and ppc and hardcodes 'libtool'
-do_configure_append() {
-	cp ${TARGET_PREFIX}libtool libtool || true
-}
-
-do_compile_prepend() {
-        mkdir -p ${S}/WebKitBuilds/Debug/JavaScriptCore/pcre/tmp/
-        mkdir -p ${S}/Programs/
-	cd ${S}/JavaScriptCore/pcre
-        if test -e dftables.c
-        then
-            ${BUILD_CC} dftables.c -o dftables -I. -I../wtf
-        elif test -e dftables.cpp
-        then
-            ${BUILD_CXX} dftables.cpp -o dftables -I. -I../wtf
-        fi
-        cp dftables ${S}/WebKitBuilds/Debug/JavaScriptCore/pcre/tmp/
-        cp dftables ${S}/Programs/
-	cd ${S}
-}
-
-PACKAGES =+ "${PN}-webinspector ${PN}launcher-dbg ${PN}launcher libjavascriptcore"
+PACKAGES =+ "${PN}-webinspector ${PN}launcher ${PN}launcher-dbg"
 FILES_${PN}launcher = "${bindir}/GtkLauncher"
 FILES_${PN}launcher-dbg = "${bindir}/.debug/GtkLauncher"
-FILES_libjavascriptcore = "${libdir}/libJavaScriptCore.so.*"
 FILES_${PN}-webinspector = "${datadir}/webkit-1.0/webinspector/"
 FILES_${PN} += "${datadir}/webkit-1.0/resources/error.html ${datadir}/webkit-1.0/images"
-
-- 
1.7.1



