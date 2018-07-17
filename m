Return-Path: <prvs=729781e0a=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id A778B78A0E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 14:08:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,365,1526335200"; d="scan'208";a="11386162"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Jul 2018 16:08:42 +0200
Message-ID: <20180717140842.18051-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-oe][PATCH] libmxml: update to current git master (ba3cca8)
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
X-List-Received-Date: Tue, 17 Jul 2018 14:08:40 -0000
Content-Type: text/plain

Update the Mini-XML library to a 2.12 pre-release version which
integrates the needed patches for OE. Therefore remove those patches
from here.

Furthermore avoid using autoheader as suggested by mxml's author:
	https://github.com/michaelrsweet/mxml/pull/223

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 ...ove-rpath-from-configure.in-and-configure.patch | 55 ----------------------
 .../libmxml/0002-link-libmxml-with-pthread.patch   | 27 -----------
 .../0003-add-missing-LDFLAGS-to-Makefile.patch     | 27 -----------
 .../libmxml/0004-mxml-string-compile-headers.patch | 28 -----------
 .../0005-several-autoheader-define-fixes.patch     | 54 ---------------------
 .../libmxml/0006-several-compile-fixes.patch       | 49 -------------------
 ...le-require-libmxml.a-for-its-installation.patch | 26 ----------
 meta-oe/recipes-support/libmxml/libmxml_2.11.bb    | 29 ------------
 meta-oe/recipes-support/libmxml/libmxml_git.bb     | 41 ++++++++++++++++
 9 files changed, 41 insertions(+), 295 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libmxml/libmxml/0001-remove-rpath-from-configure.in-and-configure.patch
 delete mode 100644 meta-oe/recipes-support/libmxml/libmxml/0002-link-libmxml-with-pthread.patch
 delete mode 100644 meta-oe/recipes-support/libmxml/libmxml/0003-add-missing-LDFLAGS-to-Makefile.patch
 delete mode 100644 meta-oe/recipes-support/libmxml/libmxml/0004-mxml-string-compile-headers.patch
 delete mode 100644 meta-oe/recipes-support/libmxml/libmxml/0005-several-autoheader-define-fixes.patch
 delete mode 100644 meta-oe/recipes-support/libmxml/libmxml/0006-several-compile-fixes.patch
 delete mode 100644 meta-oe/recipes-support/libmxml/libmxml/0007-Makefile-require-libmxml.a-for-its-installation.patch
 delete mode 100644 meta-oe/recipes-support/libmxml/libmxml_2.11.bb
 create mode 100644 meta-oe/recipes-support/libmxml/libmxml_git.bb

diff --git a/meta-oe/recipes-support/libmxml/libmxml/0001-remove-rpath-from-configure.in-and-configure.patch b/meta-oe/recipes-support/libmxml/libmxml/0001-remove-rpath-from-configure.in-and-configure.patch
deleted file mode 100644
index cab203e7f..000000000
--- a/meta-oe/recipes-support/libmxml/libmxml/0001-remove-rpath-from-configure.in-and-configure.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From bcf5391c0c7edd85ee0c956be65cf4eeeea0a82a Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fboudra@free.fr>
-Date: Fri, 1 Jun 2018 14:16:52 +0200
-Subject: [PATCH 1/7] remove rpath from configure.in and configure
-
-This patch was taken from Debian's libmxml 2.11-1 source:
-	01_remove_rpath.diff
----
- configure.ac | 11 ++++-------
- 1 file changed, 4 insertions(+), 7 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 47a0d41..6b3bbfa 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -184,8 +184,7 @@ if test x$enable_shared != xno; then
- 			AC_MSG_RESULT(yes)
- 			LIBMXML="libmxml.so.1.6"
- 			DSO="\$(CC)"
--			DSOFLAGS="$DSOFLAGS -Wl,-h,libmxml.so.1 -G -R\$(libdir) \$(OPTIM)"
--			LDFLAGS="$LDFLAGS -R\$(libdir)"
-+			DSOFLAGS="$DSOFLAGS -Wl,-h,libmxml.so.1 -G \$(OPTIM)"
-                 	;;
- 
- 		hp-ux)
-@@ -200,23 +199,21 @@ if test x$enable_shared != xno; then
- 			AC_MSG_RESULT(yes)
- 			LIBMXML="libmxml.so.1.6"
- 			DSO="\$(CC)"
--			DSOFLAGS="$DSOFLAGS -Wl,-rpath,\$(libdir),-set_version,sgi1.0,-soname,libmxml.so.1 -shared \$(OPTIM)"
-+			DSOFLAGS="$DSOFLAGS -Wl,-set_version,sgi1.0,-soname,libmxml.so.1 -shared \$(OPTIM)"
- 			;;
- 
- 		osf | linux* | gnu)
- 			AC_MSG_RESULT(yes)
- 			LIBMXML="libmxml.so.1.6"
- 			DSO="\$(CC)"
--			DSOFLAGS="$DSOFLAGS -Wl,-soname,libmxml.so.1,-rpath,\$(libdir) -shared \$(OPTIM)"
--                        LDFLAGS="$LDFLAGS -Wl,-rpath,\$(libdir)"
-+			DSOFLAGS="$DSOFLAGS -Wl,-soname,libmxml.so.1 -shared \$(OPTIM)"
- 			;;
- 
- 		*bsd)
- 			AC_MSG_RESULT(yes)
- 			LIBMXML="libmxml.so.1.6"
- 			DSO="\$(CC)"
--			DSOFLAGS="$DSOFLAGS -Wl,-soname,libmxml.so.1,-R\$(libdir) -shared \$(OPTIM)"
--			LDFLAGS="$LDFLAGS -Wl,-R\$(libdir)"
-+			DSOFLAGS="$DSOFLAGS -Wl,-soname,libmxml.so.1  -shared \$(OPTIM)"
-                         ;;
- 
- 		darwin)
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/libmxml/libmxml/0002-link-libmxml-with-pthread.patch b/meta-oe/recipes-support/libmxml/libmxml/0002-link-libmxml-with-pthread.patch
deleted file mode 100644
index ec9d170bb..000000000
--- a/meta-oe/recipes-support/libmxml/libmxml/0002-link-libmxml-with-pthread.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 5e415d207465f41ae821235eb64c94916b515260 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Gon=C3=A9ri=20Le=20Bouder?= <goneri@rulezlan.org>
-Date: Fri, 1 Jun 2018 14:20:10 +0200
-Subject: [PATCH 2/7] link libmxml with pthread
-
-This patch was taken from Debian's libmxml 2.11-1 source:
-	02_link_with_pthread.diff
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index eef14fe..70c322c 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -271,7 +271,7 @@ mxml1.dll:	$(LIBOBJS)
- 
- libmxml.so.1.6:	$(LIBOBJS)
- 	echo Creating $@...
--	$(DSO) $(DSOFLAGS) -o libmxml.so.1.6 $(LIBOBJS)
-+	$(DSO) $(DSOFLAGS) -o libmxml.so.1.6 $(LIBOBJS) $(LIBS)
- 	$(RM) libmxml.so libmxml.so.1
- 	$(LN) libmxml.so.1.6 libmxml.so
- 	$(LN) libmxml.so.1.6 libmxml.so.1
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/libmxml/libmxml/0003-add-missing-LDFLAGS-to-Makefile.patch b/meta-oe/recipes-support/libmxml/libmxml/0003-add-missing-LDFLAGS-to-Makefile.patch
deleted file mode 100644
index 33b1d0893..000000000
--- a/meta-oe/recipes-support/libmxml/libmxml/0003-add-missing-LDFLAGS-to-Makefile.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 249c34c57ecd9bb49f8e3b420bde651c4bcad36d Mon Sep 17 00:00:00 2001
-From: Luis Uribe <acme@eviled.org>
-Date: Fri, 1 Jun 2018 14:21:49 +0200
-Subject: [PATCH 3/7] add missing $(LDFLAGS) to Makefile
-
-This patch was taken from Debian's libmxml 2.11-1 source:
-	03_link_ldflags.diff
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 70c322c..fd48565 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -271,7 +271,7 @@ mxml1.dll:	$(LIBOBJS)
- 
- libmxml.so.1.6:	$(LIBOBJS)
- 	echo Creating $@...
--	$(DSO) $(DSOFLAGS) -o libmxml.so.1.6 $(LIBOBJS) $(LIBS)
-+	$(DSO) $(DSOFLAGS) -o libmxml.so.1.6 $(LIBOBJS) $(LIBS) $(LDFLAGS)
- 	$(RM) libmxml.so libmxml.so.1
- 	$(LN) libmxml.so.1.6 libmxml.so
- 	$(LN) libmxml.so.1.6 libmxml.so.1
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/libmxml/libmxml/0004-mxml-string-compile-headers.patch b/meta-oe/recipes-support/libmxml/libmxml/0004-mxml-string-compile-headers.patch
deleted file mode 100644
index 0fd5422a7..000000000
--- a/meta-oe/recipes-support/libmxml/libmxml/0004-mxml-string-compile-headers.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e0c02526840d26758e4bcfd84dd5f7cda3cfbe1a Mon Sep 17 00:00:00 2001
-From: Richard Leitner <richard.leitner@skidata.com>
-Date: Fri, 1 Jun 2018 14:23:40 +0200
-Subject: [PATCH 4/7] mxml-string: compile headers
-
-This patch was taken from Debian's libmxml 2.11-1 source:
-	04_compile_headers.diff
----
- mxml-string.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/mxml-string.c b/mxml-string.c
-index 2495753..9bdb4c3 100644
---- a/mxml-string.c
-+++ b/mxml-string.c
-@@ -17,7 +17,8 @@
-  */
- 
- #include "config.h"
--
-+#include <stdlib.h>
-+#include <stdarg.h>
- 
- /*
-  * The va_copy macro is part of C99, but many compilers don't implement it.
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/libmxml/libmxml/0005-several-autoheader-define-fixes.patch b/meta-oe/recipes-support/libmxml/libmxml/0005-several-autoheader-define-fixes.patch
deleted file mode 100644
index ba6541503..000000000
--- a/meta-oe/recipes-support/libmxml/libmxml/0005-several-autoheader-define-fixes.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From f77da2043c0840412f1a5bc89d04a8f595cc2027 Mon Sep 17 00:00:00 2001
-From: Richard Leitner <richard.leitner@skidata.com>
-Date: Fri, 1 Jun 2018 14:26:15 +0200
-Subject: [PATCH 5/7] several autoheader define fixes
-
-This patch was taken from Debian's libmxml 2.11-1 source:
-	06_autoheader-fixes.patch
----
- configure.ac | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6b3bbfa..47063dc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -28,7 +28,7 @@ AC_CONFIG_HEADER(config.h)
- dnl Version number...
- VERSION="AC_PACKAGE_VERSION"
- AC_SUBST(VERSION)
--AC_DEFINE_UNQUOTED(MXML_VERSION, "Mini-XML v$VERSION")
-+AC_DEFINE_UNQUOTED(MXML_VERSION, "Mini-XML v$VERSION", "MXML VERSION")
- 
- dnl Clear default debugging options and set normal optimization by
- dnl default unless the user asks for debugging specifically.
-@@ -113,7 +113,7 @@ AC_CACHE_CHECK(for long long int, ac_cv_c_long_long,
- 	fi])
- 
- if test $ac_cv_c_long_long = yes; then
--	AC_DEFINE(HAVE_LONG_LONG)
-+	AC_DEFINE(HAVE_LONG_LONG, 1, "long long int support")
- fi
- 
- dnl EPUB support (via libz and zipc)
-@@ -122,7 +122,7 @@ AC_SUBST(MXML_EPUB)
- ZIPC=""
- AC_SUBST(ZIPC)
- AC_SEARCH_LIBS(gzgets,z,[
--	AC_DEFINE(HAVE_ZLIB_H)
-+	AC_DEFINE(HAVE_ZLIB_H, 1, "<zlib.h> present")
- 	ZIPC="zipc.o"
- 	MXML_EPUB="mxml.epub"
- 	LIBS="-lz $LIBS"])
-@@ -135,7 +135,7 @@ PTHREAD_FLAGS=""
- PTHREAD_LIBS=""
- 
- if test "x$enable_threads" != xno; then
--	AC_CHECK_HEADER(pthread.h, AC_DEFINE(HAVE_PTHREAD_H))
-+	AC_CHECK_HEADER(pthread.h, AC_DEFINE(HAVE_PTHREAD_H, 1, "pthreads headers available"))
- 
- 	if test x$ac_cv_header_pthread_h = xyes; then
- 		dnl Check various threading options for the platforms we support
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/libmxml/libmxml/0006-several-compile-fixes.patch b/meta-oe/recipes-support/libmxml/libmxml/0006-several-compile-fixes.patch
deleted file mode 100644
index e6c3cba1a..000000000
--- a/meta-oe/recipes-support/libmxml/libmxml/0006-several-compile-fixes.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 2477dbea92d4111fb70beaf975bce0eeee9ac8e5 Mon Sep 17 00:00:00 2001
-From: Richard Leitner <richard.leitner@skidata.com>
-Date: Fri, 1 Jun 2018 14:28:05 +0200
-Subject: [PATCH 6/7] several compile fixes
-
-This patch was taken from Debian's libmxml 2.11-1 source:
-	07_compile_fixes.patch
----
- mxml.h    |  2 +-
- mxmldoc.c | 10 +++++++++-
- 2 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/mxml.h b/mxml.h
-index 5ad96b8..e78b8e9 100644
---- a/mxml.h
-+++ b/mxml.h
-@@ -28,7 +28,7 @@
- #  include <string.h>
- #  include <ctype.h>
- #  include <errno.h>
--
-+#  include <stdarg.h>
- 
- /*
-  * Constants...
-diff --git a/mxmldoc.c b/mxmldoc.c
-index de5c8a7..bbdf758 100644
---- a/mxmldoc.c
-+++ b/mxmldoc.c
-@@ -37,7 +37,15 @@ extern char **environ;
- #  include "zipc.h"
- #endif /* HAVE_ZLIB_H */
- 
--
-+#  ifndef HAVE_STRLCPY
-+extern size_t	_mxml_strlcpy(char *, const char *, size_t);
-+#    define strlcpy _mxml_strlcpy
-+#  endif /* !HAVE_STRLCPY */
-+
-+#ifndef HAVE_STRLCAT
-+extern size_t  _mxml_strlcat( char *, const char *, size_t);
-+#define strlcat _mxml_strlcat
-+#endif
- /*
-  * This program scans source and header files and produces public API
-  * documentation for code that conforms to the CUPS Configuration
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/libmxml/libmxml/0007-Makefile-require-libmxml.a-for-its-installation.patch b/meta-oe/recipes-support/libmxml/libmxml/0007-Makefile-require-libmxml.a-for-its-installation.patch
deleted file mode 100644
index 14c4ac0fa..000000000
--- a/meta-oe/recipes-support/libmxml/libmxml/0007-Makefile-require-libmxml.a-for-its-installation.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 5d58c984e1a1173def37a99267afd78757998642 Mon Sep 17 00:00:00 2001
-From: Richard Leitner <richard.leitner@skidata.com>
-Date: Mon, 4 Jun 2018 11:23:36 +0200
-Subject: [PATCH 7/7] Makefile: require libmxml.a for its installation
-
-Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index fd48565..155a17a 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -162,7 +162,7 @@ install:	$(TARGETS) install-$(LIBMXML) install-libmxml.a
- 	$(INSTALL_DIR) $(BUILDROOT)$(mandir)/man3
- 	$(INSTALL_MAN) doc/mxml.man $(BUILDROOT)$(mandir)/man3/mxml.3
- 
--install-libmxml.a:
-+install-libmxml.a: libmxml.a
- 	echo Installing libmxml.a to $(BUILDROOT)$(libdir)...
- 	$(INSTALL_DIR) $(BUILDROOT)$(libdir)
- 	$(INSTALL_LIB) libmxml.a $(BUILDROOT)$(libdir)
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/libmxml/libmxml_2.11.bb b/meta-oe/recipes-support/libmxml/libmxml_2.11.bb
deleted file mode 100644
index 384e056d1..000000000
--- a/meta-oe/recipes-support/libmxml/libmxml_2.11.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "Tiny XML Library"
-LICENSE = "Mini-XML-License"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6ba38606d63bb042c5d8cfee182e120"
-HOMEPAGE = "https://www.msweet.org/mxml/"
-BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
-
-SRC_URI = " \
-    https://github.com/michaelrsweet/mxml/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
-    file://0001-remove-rpath-from-configure.in-and-configure.patch \
-    file://0002-link-libmxml-with-pthread.patch \
-    file://0003-add-missing-LDFLAGS-to-Makefile.patch \
-    file://0004-mxml-string-compile-headers.patch \
-    file://0005-several-autoheader-define-fixes.patch \
-    file://0006-several-compile-fixes.patch \
-    file://0007-Makefile-require-libmxml.a-for-its-installation.patch \
-"
-
-SRC_URI[md5sum] = "b9b49af414a2f0a8b13636d9635c3b6a"
-SRC_URI[sha256sum] = "7d3dfe661e50908fe41aef9b97ba6f7f158cab5208515c6be9f5bc9daf032329"
-
-inherit autotools-brokensep gettext
-
-S = "${WORKDIR}/mxml-${PV}"
-
-EXTRA_OEMAKE = "DSTROOT=${D}"
-
-PACKAGES += " ${PN}-bin "
-FILES_${PN} = "${libdir}/*"
-FILES_${PN}-bin = "${bindir}/*"
diff --git a/meta-oe/recipes-support/libmxml/libmxml_git.bb b/meta-oe/recipes-support/libmxml/libmxml_git.bb
new file mode 100644
index 000000000..542fe8157
--- /dev/null
+++ b/meta-oe/recipes-support/libmxml/libmxml_git.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "Tiny XML Library"
+LICENSE = "Mini-XML-License"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6ba38606d63bb042c5d8cfee182e120"
+HOMEPAGE = "https://www.msweet.org/mxml/"
+BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
+
+SRC_URI = "git://github.com/michaelrsweet/mxml.git"
+SRCREV = "ba3cca82e15a88a9cc6afb60f059288a99afc703"
+S = "${WORKDIR}/git"
+PV = "2.12+git${SRCPV}"
+
+CONFIGUREOPTS = " --prefix=${prefix} \
+                  --bindir=${bindir} \
+                  --sbindir=${sbindir} \
+                  --libexecdir=${libexecdir} \
+                  --datadir=${datadir} \
+                  --sysconfdir=${sysconfdir} \
+                  --sharedstatedir=${sharedstatedir} \
+                  --localstatedir=${localstatedir} \
+                  --libdir=${libdir} \
+                  --includedir=${includedir} \
+                  --oldincludedir=${oldincludedir} \
+                  --infodir=${infodir} \
+                  --mandir=${mandir} \
+                  --host=${TARGET_SYS} \
+                  --build=${BUILD_SYS} \
+                  ${PACKAGECONFIG_CONFARGS} \
+                "
+
+do_configure() {
+    ./configure ${CONFIGUREOPTS} --enable-shared
+}
+
+do_install () {
+    export DSTROOT=${D}
+    oe_runmake install
+}
+
+PACKAGES += " ${PN}-bin "
+FILES_${PN} = "${libdir}/*"
+FILES_${PN}-bin = "${bindir}/*"
-- 
2.11.0


