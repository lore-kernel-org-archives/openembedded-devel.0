Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1Jh523-0003et-6Y
	for openembedded-devel@openembedded.org; Wed, 02 Apr 2008 17:37:47 +0200
Received: (qmail 5965 invoked by uid 813007); 2 Apr 2008 15:37:45 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Apr 2008 15:37:45 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 2 Apr 2008 17:37:43 +0200
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200804021737.44621.openembedded@haerwu.biz>
Subject: [REVIEW] WebKit update from Poky
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Apr 2008 15:37:47 -0000
X-Groupsio-MsgNum: 4898
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_Ih68HgkgT/q4IIE"

--Boundary-00=_Ih68HgkgT/q4IIE
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi

I updated WebKit-gtk in Poky few days ago from 30762 (current OE) to 31467 
(svn HEAD). I do not want to push it into OE as it is because there are 
also webkit-qt and webkit-qtopia which status I do not know.

Attached is patch against current OE.dev tree.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

        Due to unexpected conditions Windows 2000 will be released
        in first quarter of year 1901

--Boundary-00=_Ih68HgkgT/q4IIE
Content-Type: text/x-diff;
  charset="us-ascii";
  name="webkit.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="webkit.diff"

#
# old_revision [a4b45f4907654ad330b95a10864d7f41447ae1f4]
#
# patch "conf/distro/include/sane-srcrevs.inc"
#  from [6ff9f0304e5d4462c4374384fd4e7eba9fda15a6]
#    to [2ab1d5eb4c6626aaa9307b560b98682e7a2e344b]
# 
# patch "packages/webkit/files/GNUmakefile.am"
#  from [8556a83aa4c1fdae91e3e777e3092fd07b5dd83b]
#    to [980f38c1ef2f2a0447872f7268b876241352a033]
# 
# patch "packages/webkit/files/WebKit.pri"
#  from [fd53e0bf98b68fce203d07770736c2aaa6b8b6bb]
#    to [fd870b3307fb95ac907a4095ab79658dd7879277]
# 
# patch "packages/webkit/files/WebKit.pro"
#  from [ecf886ef5178fc86bdf74101c5bb563cb326002b]
#    to [1e5c7f9961944af590055c84c58d1acabab3632b]
# 
# patch "packages/webkit/files/autogen.sh"
#  from [8eabc60e96af596bdd80383f8f68222b9aec5aaf]
#    to [aa58f66750dc6ee25269a29dd5ba9558fbb3ef9d]
# 
# patch "packages/webkit/files/configure.ac"
#  from [4fb7336ff014fc035bb051db697963cbf5338ee6]
#    to [46b2a1a5440da45f964759e24a8d8dc6059ff7db]
# 
# patch "packages/webkit/webkit-gtk_svn.bb"
#  from [68fe5f795ffe7d3ccd3257b4536bdb9b292655dd]
#    to [7f56b28fd61a19194f3f9a57863368430d6d2515]
#
============================================================
--- conf/distro/include/sane-srcrevs.inc	6ff9f0304e5d4462c4374384fd4e7eba9fda15a6
+++ conf/distro/include/sane-srcrevs.inc	2ab1d5eb4c6626aaa9307b560b98682e7a2e344b
@@ -156,7 +156,7 @@ SRCREV_pn-usbpath-native ?= "3172"
 SRCREV_pn-u-boot-openmoko ?= "4138"
 SRCREV_pn-usbpath ?= "3172"
 SRCREV_pn-usbpath-native ?= "3172"
-SRCREV_pn-webkit-gtk ?= "30762"
+SRCREV_pn-webkit-gtk ?= "31467"
 SRCREV_pn-webkit-qt ?= "28656"
 SRCREV_pn-webkit-qtopia ?= "28656"
 SRCREV_pn-wesnoth ?= "22021"
============================================================
--- packages/webkit/files/GNUmakefile.am	8556a83aa4c1fdae91e3e777e3092fd07b5dd83b
+++ packages/webkit/files/GNUmakefile.am	980f38c1ef2f2a0447872f7268b876241352a033
@@ -52,11 +52,7 @@ global_cppflags += \
 global_cppflags :=
 
 global_cppflags += \
-	-I$(srcdir)/JavaScriptCore \
-	-I$(srcdir)/JavaScriptCore/ForwardingHeaders \
-	-I$(srcdir)/JavaScriptCore/wtf \
-	-I$(srcdir)/JavaScriptCore/kjs \
-	-I$(top_builddir)/DerivedSources
+	-DWTF_USE_ICU_UNICODE=1
 
 # Default compiler flags
 global_cflags := \
@@ -94,6 +90,13 @@ javascriptcore_built_nosources :=
 javascriptcore_built_sources :=
 javascriptcore_built_nosources :=
 
+javascriptcore_cppflags += \
+	-I$(srcdir)/JavaScriptCore \
+	-I$(srcdir)/JavaScriptCore/ForwardingHeaders \
+	-I$(srcdir)/JavaScriptCore/wtf \
+	-I$(srcdir)/JavaScriptCore/kjs \
+	-I$(top_builddir)/DerivedSources
+
 # The variables above are already included below so no need to touch
 # these variables unless you really have to
 libJavaScriptCore_ladir = $(prefix)/include/webkit-1.0/JavaScriptCore
@@ -104,7 +107,7 @@ libJavaScriptCore_la_LIBADD = \
 	$(javascriptcore_sources)
 
 libJavaScriptCore_la_LIBADD = \
-	$(ICU_LIBS) \
+	$(UNICODE_LIBS) \
 	$(GLOBALDEPS_LIBS) \
 	-lpthread
 
@@ -112,17 +115,18 @@ libJavaScriptCore_la_CXXFLAGS = \
 	$(global_cxxflags) \
 	$(global_cflags) \
 	$(GLOBALDEPS_CFLAGS) \
+	$(UNICODE_CFLAGS) \
 	-fstrict-aliasing
 
 libJavaScriptCore_la_CFLAGS = \
 	$(global_cflags) \
 	$(GLOBALDEPS_CFLAGS) \
+	$(UNICODE_CFLAGS) \
 	-fstrict-aliasing
 
 libJavaScriptCore_la_CPPFLAGS = \
 	$(global_cppflags) \
-	$(javascriptcore_cppflags) \
-	$(ICU_CPPFLAGS)
+	$(javascriptcore_cppflags)
 
 #
 # WebCore
@@ -154,8 +158,10 @@ libWebCore_la_CXXFLAGS = \
 	$(global_cxxflags) \
 	$(global_cflags) \
 	$(GLOBALDEPS_CFLAGS) \
+	$(UNICODE_CFLAGS) \
 	$(WEBKITDEPS_CFLAGS) \
 	$(LIBCURL_CFLAGS) \
+	$(LIBSOUP_CFLAGS) \
 	$(SQLITE3_CFLAGS) \
 	$(GSTREAMER_CFLAGS) \
 	$(LIBXSLT_CFLAGS) \
@@ -166,8 +172,10 @@ libWebCore_la_CFLAGS = \
 	-fno-strict-aliasing \
 	$(global_cflags) \
 	$(GLOBALDEPS_CFLAGS) \
+	$(UNICODE_CFLAGS) \
 	$(WEBKITDEPS_CFLAGS) \
 	$(LIBCURL_CFLAGS) \
+	$(LIBSOUP_CFLAGS) \
 	$(SQLITE3_CFLAGS) \
 	$(GSTREAMER_CFLAGS) \
 	$(LIBXSLT_CFLAGS) \
@@ -175,9 +183,9 @@ libWebCore_la_CPPFLAGS = \
 	$(HILDON_CFLAGS)
 
 libWebCore_la_CPPFLAGS = \
-	$(ICU_CPPFLAGS) \
 	$(global_cppflags) \
 	$(webcore_cppflags) \
+	$(javascriptcore_cppflags) \
 	$(webkitgtk_cppflags)
 
 libWebCore_la_LIBADD = \
@@ -186,7 +194,8 @@ libWebCore_la_LIBADD = \
 	$(GLOBALDEPS_LIBS) \
 	$(WEBKITDEPS_LIBS) \
 	$(LIBCURL_LIBS) \
-	$(ICU_LIBS) \
+	$(LIBSOUP_LIBS) \
+	$(UNICODE_LIBS) \
 	$(SQLITE3_LIBS) \
 	$(GSTREAMER_LIBS) \
 	$(LIBXSLT_LIBS) \
============================================================
--- packages/webkit/files/WebKit.pri	fd53e0bf98b68fce203d07770736c2aaa6b8b6bb
+++ packages/webkit/files/WebKit.pri	fd870b3307fb95ac907a4095ab79658dd7879277
@@ -17,7 +17,7 @@ gtk-port:!building-libs {
 gtk-port:!building-libs {
     QMAKE_LIBDIR = $$OUTPUT_DIR/lib $$QMAKE_LIBDIR
     LIBS += -lWebKitGtk
-    DEPENDPATH += $$PWD/WebKit/gtk/WebView $$PWD/WebKit/gtk/WebCoreSupport
+    DEPENDPATH += $$PWD/WebKit/gtk $$PWD/WebKit/gtk/WebCoreSupport $$PWD/WebKit/gtk/webkit
 }
 
 gtk-port {
@@ -36,6 +36,7 @@ gtk-port {
 
     # We use the curl http backend on all platforms
     PKGCONFIG += libcurl
+    DEFINES += WTF_USE_CURL=1
 
     LIBS += -lWebKitGtk -ljpeg -lpng
 
@@ -72,8 +73,9 @@ gtk-port:INCLUDEPATH += \
     $$BASE_DIR/WebCore/platform/graphics/cairo \
     $$BASE_DIR/WebCore/loader/gtk \
     $$BASE_DIR/WebCore/page/gtk \
-    $$BASE_DIR/WebKit/gtk/WebView \
-    $$BASE_DIR/WebKit/gtk/WebCoreSupport
+    $$BASE_DIR/WebKit/gtk \
+    $$BASE_DIR/WebKit/gtk/WebCoreSupport \
+    $$BASE_DIR/WebKit/gtk/webkit
 INCLUDEPATH += \
     $$BASE_DIR/JavaScriptCore/ \
     $$BASE_DIR/JavaScriptCore/kjs \
@@ -95,7 +97,8 @@ INCLUDEPATH += \
     $$BASE_DIR/WebCore/rendering \
     $$BASE_DIR/WebCore/history \
     $$BASE_DIR/WebCore/xml \
-    $$BASE_DIR/WebCore/html
+    $$BASE_DIR/WebCore/html \
+    $$BASE_DIR/WebCore/plugins
 
 
 macx {
============================================================
--- packages/webkit/files/WebKit.pro	ecf886ef5178fc86bdf74101c5bb563cb326002b
+++ packages/webkit/files/WebKit.pro	1e5c7f9961944af590055c84c58d1acabab3632b
@@ -1,7 +1,11 @@ CONFIG += ordered
 TEMPLATE = subdirs
 CONFIG += ordered
 !gtk-port:CONFIG += qt-port
-qt-port:!win32-*:SUBDIRS += WebKit/qt/Plugins
+qt-port {
+    lessThan(QT_MINOR_VERSION, 4) {
+        !win32-*:SUBDIRS += WebKit/qt/Plugins
+    }
+}
 SUBDIRS += \
         WebCore \
         JavaScriptCore/kjs/testkjs.pro
============================================================
--- packages/webkit/files/autogen.sh	8eabc60e96af596bdd80383f8f68222b9aec5aaf
+++ packages/webkit/files/autogen.sh	aa58f66750dc6ee25269a29dd5ba9558fbb3ef9d
@@ -11,23 +11,35 @@ DIE=0
 DIE=0
 
 (autoconf --version) < /dev/null > /dev/null 2>&1 || {
-	echo
-	echo "You must have autoconf installed to compile $PROJECT."
-	echo "Install the appropriate package for your distribution,"
-	echo "or get the source tarball at http://ftp.gnu.org/gnu/autoconf/"
-	DIE=1
+    echo
+    echo "You must have autoconf installed to compile $PROJECT."
+    echo "Install the appropriate package for your distribution,"
+    echo "or get the source tarball at http://ftp.gnu.org/gnu/autoconf/"
+    DIE=1
 }
 
 (automake --version) < /dev/null > /dev/null 2>&1 || {
-	echo
-	echo "You must have automake installed to compile $PROJECT."
-	echo "Install the appropriate package for your distribution,"
-	echo "or get the source tarball at http://ftp.gnu.org/gnu/automake/"
-	DIE=1
+    echo
+    echo "You must have automake installed to compile $PROJECT."
+    echo "Install the appropriate package for your distribution,"
+    echo "or get the source tarball at http://ftp.gnu.org/gnu/automake/"
+    DIE=1
 }
 
+LIBTOOLIZE=libtoolize
+($LIBTOOLIZE --version) < /dev/null > /dev/null 2>&1 || {
+    LIBTOOLIZE=glibtoolize
+    ($LIBTOOLIZE --version) < /dev/null > /dev/null 2>&1 || {
+        echo
+        echo "You must have libtool installed to compile $PROJECT."
+        echo "Install the appropriate package for your distribution,"
+        echo "or get the source tarball at http://ftp.gnu.org/gnu/libtool/"
+        DIE=1
+    }
+}
+
 if test "$DIE" -eq 1; then
-	exit 1
+    exit 1
 fi
 
 rm -rf $top_srcdir/autom4te.cache
@@ -35,7 +47,7 @@ aclocal || exit $?
 touch README INSTALL
 
 aclocal || exit $?
-libtoolize --force || exit $?
+$LIBTOOLIZE --force || exit $?
 autoheader || exit $?
 automake --foreign --add-missing || exit $?
 autoconf || exit $?
============================================================
--- packages/webkit/files/configure.ac	4fb7336ff014fc035bb051db697963cbf5338ee6
+++ packages/webkit/files/configure.ac	46b2a1a5440da45f964759e24a8d8dc6059ff7db
@@ -129,25 +129,42 @@ fi
    AC_MSG_ERROR([Cannot find pkg-config, make sure it is installed in your PATH])
 fi
 
-# check for icu-config
-if test "$os_darwin" = "yes"; then
-ICU_CPPFLAGS="-I\$(srcdir)/JavaScriptCore/icu -I\$(srcdir)/WebCore/icu"
-ICU_LIBS="-licucore"
-else
-AC_PATH_PROG(icu_config, icu-config, no)
-if test "$icu_config" = "no"; then
-   AC_MSG_ERROR([Cannot find icu-config. ICU library is needed.])
-fi
+# determine the Unicode backend
+AC_MSG_CHECKING([the Unicode backend to use])
+AC_ARG_WITH(unicode_backend,
+            AC_HELP_STRING([--with-unicode-backend=@<:@icu@:>@],
+                           [Select Unicode backend [default=icu]]),
+            [],[unicode_backend="icu"])
 
-# We don't use --cflags as this gives us a lot of things that we don't
-# necessarily want, like debugging and optimization flags
-# See man (1) icu-config for more info.
-ICU_CPPFLAGS=`$icu_config --cppflags`
-ICU_LIBS=`$icu_config --ldflags`
-AC_SUBST([ICU_CPPFLAGS])
-AC_SUBST([ICU_LIBS])
+case "$unicode_backend" in
+     icu) ;;
+     *) AC_MSG_ERROR([Invalid Unicode backend: must be icu.]) ;;
+esac
+
+AC_MSG_RESULT([$unicode_backend])
+
+if test "$unicode_backend" = "icu"; then
+	# check for icu-config
+	if test "$os_darwin" = "yes"; then
+		UNICODE_CFLAGS="-I\$(srcdir)/JavaScriptCore/icu -I\$(srcdir)/WebCore/icu"
+		UNICODE_LIBS="-licucore"
+	else
+		AC_PATH_PROG(icu_config, icu-config, no)
+		if test "$icu_config" = "no"; then
+			AC_MSG_ERROR([Cannot find icu-config. The ICU library is needed.])
+		fi
+
+		# We don't use --cflags as this gives us a lot of things that we don't
+		# necessarily want, like debugging and optimization flags
+		# See man (1) icu-config for more info.
+		UNICODE_CFLAGS=`$icu_config --cppflags`
+		UNICODE_LIBS=`$icu_config --ldflags`
+	fi
 fi
 
+AC_SUBST([UNICODE_CFLAGS])
+AC_SUBST([UNICODE_LIBS])
+
 # determine the GDK/GTK+ target
 AC_MSG_CHECKING([the target windowing system])
 AC_ARG_WITH(target,
@@ -180,16 +197,16 @@ AC_ARG_WITH(http_backend,
 # determine the http backend
 AC_MSG_CHECKING([the HTTP backend to use])
 AC_ARG_WITH(http_backend,
-            AC_HELP_STRING([--with-http-backend=@<:@curl@:>@],
+            AC_HELP_STRING([--with-http-backend=@<:@curl/soup@:>@],
                            [Select HTTP backend [default=curl]]),
-            [],[http_backend="curl"])
+            [],[with_http_backend="curl"])
 
-case "$http_backend" in
-     curl) ;;
-     *) AC_MSG_ERROR([Invalid HTTP backend: must be curl.]) ;;
+case "$with_http_backend" in
+     curl|soup) ;;
+     *) AC_MSG_ERROR([Invalid HTTP backend: must be curl, soup.]) ;;
 esac
 
-AC_MSG_RESULT([$http_backend])
+AC_MSG_RESULT([$with_http_backend])
 
 # minimum base dependencies
 CAIRO_REQUIRED_VERSION=1.4
@@ -206,6 +223,7 @@ LIBCURL_REQUIRED_VERSION=7.15
 
 # optional modules
 LIBCURL_REQUIRED_VERSION=7.15
+LIBSOUP_REQUIRED_VERSION=2.4
 LIBXSLT_REQUIRED_VERSION=1.1.7
 SQLITE_REQUIRED_VERSION=3.0
 GSTREAMER_REQUIRED_VERSION=0.10
@@ -376,6 +394,19 @@ AC_MSG_RESULT([$enable_fast_malloc])
               [],[if test "$enable_debug" = "yes"; then enable_fast_malloc="no"; else enable_fast_malloc="yes"; fi])
 AC_MSG_RESULT([$enable_fast_malloc])
 
+# determine the font backend
+AC_MSG_CHECKING([the font backend to use])
+AC_ARG_WITH(font_backend,
+            AC_HELP_STRING([--with-font-backend=@<:@freetype/pango@:>@],
+                           [Select font backend [default=freetype]]),
+            [],[with_font_backend="freetype"])
+
+case "$with_font_backend" in
+     freetype|pango) ;;
+     *) AC_MSG_ERROR([Invalid font backend: must be freetype or pango.]) ;;
+esac
+AC_MSG_RESULT([$with_font_backend])
+
 # Add '-g' flag to gcc if it's debug build
 if test "$enable_debug" = "yes"; then
    CXXFLAGS="$CXXFLAGS -g"
@@ -383,13 +414,20 @@ fi
 fi
 
 # check if curl is available
-if test "$http_backend" = "curl"; then
+if test "$with_http_backend" = "curl"; then
    PKG_CHECK_MODULES([LIBCURL],
                      [libcurl >= $LIBCURL_REQUIRED_VERSION])
    AC_SUBST([LIBCURL_CFLAGS])
    AC_SUBST([LIBCURL_LIBS])
 fi
 
+if test "$with_http_backend" = "soup"; then
+   PKG_CHECK_MODULES([LIBSOUP],
+                     [libsoup-2.4 >= $LIBSOUP_REQUIRED_VERSION])
+   AC_SUBST([LIBSOUP_CFLAGS])
+   AC_SUBST([LIBSOUP_LIBS])
+fi
+
 # check if sqlite 3 is available
 if test "$enable_icon_database" = "yes" || test "$enable_database" = "yes"; then
    PKG_CHECK_MODULES([SQLITE3], [sqlite3 >= $SQLITE_REQUIRED_VERSION])
@@ -450,8 +488,13 @@ AM_CONDITIONAL([TARGET_DIRECTFB], [test 
 AM_CONDITIONAL([TARGET_DIRECTFB], [test "$with_target" = "directfb"])
 
 # HTTP backend conditionals
-AM_CONDITIONAL([USE_CURL], [test "$http_backend" = "curl"])
+AM_CONDITIONAL([USE_CURL], [test "$with_http_backend" = "curl"])
+AM_CONDITIONAL([USE_SOUP], [test "$with_http_backend" = "soup"])
 
+# Font backend conditionals
+AM_CONDITIONAL([USE_FREETYPE], [test "$with_font_backend" = "freetype"])
+AM_CONDITIONAL([USE_PANGO], [test "$with_font_backend" = "pango"])
+
 # WebKit feature conditionals
 AM_CONDITIONAL([ENABLE_DEBUG],[test "$enable_debug" = "yes"])
 AM_CONDITIONAL([ENABLE_CROSS_DOCUMENT_MESSAGING],[test "$enable_cross_document_messaging" = "yes"])
@@ -485,7 +528,9 @@ Build configuration:
 Build configuration:
  Enable debugging (slow)           : $enable_debug
  Code coverage support             : $enable_coverage
- HTTP backend                      : $http_backend
+ Unicode backend                   : $unicode_backend
+ HTTP backend                      : $with_http_backend
+ Font backend                      : $with_font_backend
  Optimized memory allocator        : $enable_fast_malloc
 Features:
  HTML5 cross-document messaging    : $enable_cross_document_messaging
============================================================
--- packages/webkit/webkit-gtk_svn.bb	68fe5f795ffe7d3ccd3257b4536bdb9b292655dd
+++ packages/webkit/webkit-gtk_svn.bb	7f56b28fd61a19194f3f9a57863368430d6d2515
@@ -27,6 +27,7 @@ EXTRA_OECONF = "\
 EXTRA_OECONF = "\
                 --enable-debug=no \
                 --enable-svg \
+		--enable-svg-fonts \
                 --enable-icon-database=yes \
                "
 

--Boundary-00=_Ih68HgkgT/q4IIE--
