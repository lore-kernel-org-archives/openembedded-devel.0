Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9RnE-0007Yq-SW
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:17:05 +0200
Received: by gwaa11 with SMTP id a11so1560489gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:16:25 -0700 (PDT)
Received: by 10.100.253.5 with SMTP id a5mr2713118ani.128.1287792985345;
	Fri, 22 Oct 2010 17:16:25 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id u3sm4239972ani.19.2010.10.22.17.16.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:16:24 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:15:41 -0200
Message-Id: <4cc22958.0311650a.0c4d.ffffaf59@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 01/17] EFL: Fix epdf recipe
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
X-List-Received-Date: Sat, 23 Oct 2010 00:17:05 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/efl1/epdf/fix-plugin-path-check.patch |   24 -----------------------
 recipes/efl1/epdf_svn.bb                      |   26 ++++++++----------------
 2 files changed, 9 insertions(+), 41 deletions(-)
 delete mode 100644 recipes/efl1/epdf/fix-plugin-path-check.patch

diff --git a/recipes/efl1/epdf/fix-plugin-path-check.patch b/recipes/efl1/epdf/fix-plugin-path-check.patch
deleted file mode 100644
index b218fff..0000000
--- a/recipes/efl1/epdf/fix-plugin-path-check.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Index: epdf/configure.in
-===================================================================
---- epdf.orig/configure.in
-+++ epdf/configure.in
-@@ -95,8 +95,8 @@
-      [
-       have_ewl="yes"
-       requirements="$requirements ewl"
--      EWL_TEST_LIBS_DIR="`$PKG_CONFIG --variable=testsdir ewl`"
--      EWL_TEST_SOURCE_DIR="`$PKG_CONFIG --variable=testssrcdir ewl`"
-+      EWL_TEST_LIBS_DIR="/usr/lib/ewl/tests/"
-+      EWL_TEST_SOURCE_DIR="/usr/share/ewl/examples/"
-       AC_SUBST(EWL_TEST_LIBS_DIR)
-       AC_SUBST(EWL_TEST_SOURCE_DIR)
-      ],
-@@ -144,7 +144,7 @@
-   [
-    have_epsilon="yes"
-    requirements="$requirements epsilon imlib2"
--   EPSILON_PLUGINS_DIR="`$PKG_CONFIG --variable=pluginsdir epsilon`"
-+   EPSILON_PLUGINS_DIR="/usr/lib/epsilon/plugins/"
-    AC_SUBST(EPSILON_PLUGINS_DIR)
-   ],
-   [
diff --git a/recipes/efl1/epdf_svn.bb b/recipes/efl1/epdf_svn.bb
index eac8e87..6d880a3 100644
--- a/recipes/efl1/epdf_svn.bb
+++ b/recipes/efl1/epdf_svn.bb
@@ -2,27 +2,19 @@ DESCRIPTION = "Epdf is the glue between EFL and libpoppler"
 LICENSE = "MIT BSD"
 DEPENDS = "poppler evas ecore"
 PV = "0.1.0+svnr${SRCPV}"
-PR = "r3"
+PR = "r4"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
-SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk/PROTO;module=epdf;proto=http"
-#           file://fix-plugin-path-check.patch;HACK=1"
-# FIXME This package is not really working correctly at the moment. It doesn't
-# recognize epsilon and doesn't build everything. The next one actually using
-# this package is welcome to fix it.
-
+EXTRA_OECONF = "\
+    --enable-poppler \
+    --disable-ewl \
+    --disable-mupdf \
+"
 
-# add ewl additions
-FILES_${PN}-dev += "${libdir}/ewl/tests/*.a ${libdir}/ewl/tests/*.la"
-FILES_${PN}-dbg += "${libdir}/ewl/tests/.debug"
-
-# add epsilon additions
-FILES_${PN}-dev += "${libdir}/epsilon/plugins/epdf_thumbnailer.a ${libdir}/epsilon/plugins/epdf_thumbnailer.la"
-FILES_${PN}-dbg += "${libdir}/epsilon/plugins/.debug"
+SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk/PROTO;module=epdf;proto=http"
 
-PACKAGES += "${PN}-ewl-widget epsilon-plugin-${PN}"
-FILES_${PN}-ewl-widget = "${libdir}/ewl/tests/libewl_pdf*.so*"
-FILES_epsilon-plugin-${PN} = "${libdir}/epsilon/plugins/epdf_thumbnailer.so*"
+# Some upgrade path tweaking, as in evas
+AUTO_LIBNAME_PKGS = ""
 
-- 
1.7.3.1



