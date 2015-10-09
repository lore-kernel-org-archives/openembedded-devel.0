Return-Path: <gary@mlbassoc.com>
X-Greylist: delayed 320 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 Oct 2015 12:59:57 UTC
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id E9E0D759D5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Oct 2015 12:59:57 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 09064F811D7; Fri,  9 Oct 2015 06:54:36 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 63ED7F811D7;
	Fri,  9 Oct 2015 06:54:36 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Oct 2015 06:55:01 -0600
Message-Id: <1444395301-28118-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [meta-oe][PATCH] poppler: Support building against QT4-embedded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Oct 2015 12:59:58 -0000

These changes allow the poppler package to build using qt4e.
To enable them, add this line to local.conf
  PACKAGECONFIG_append_pn-poppler = " qt4e"

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
Upstream-status: Innapropriate [OE configuration]
---
 .../fix-qt4e-library-dependencies.patch            | 28 ++++++++++++++++++++++
 meta-oe/recipes-support/poppler/poppler_0.35.0.bb  |  6 ++++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/poppler/poppler-0.35.0/fix-qt4e-library-dependencies.patch

diff --git a/meta-oe/recipes-support/poppler/poppler-0.35.0/fix-qt4e-library-dependencies.patch b/meta-oe/recipes-support/poppler/poppler-0.35.0/fix-qt4e-library-dependencies.patch
new file mode 100644
index 0000000..f67e1f5
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler-0.35.0/fix-qt4e-library-dependencies.patch
@@ -0,0 +1,28 @@
+Configuration changes needed to allow building with QT4-embedded
+
+Index: poppler-0.35.0/configure.ac
+===================================================================
+--- poppler-0.35.0.orig/configure.ac
++++ poppler-0.35.0/configure.ac
+@@ -654,17 +654,17 @@ AC_ARG_ENABLE(poppler-qt4,
+               enable_poppler_qt4="try")
+ if test x$enable_poppler_qt4 = xyes; then
+   PKG_CHECK_MODULES(POPPLER_QT4, 
+-	            QtCore >= 4.7.0 QtGui >= 4.7.0 QtXml >= 4.7.0)
++	            QtCoreE >= 4.7.0 QtGuiE >= 4.7.0 QtXmlE >= 4.7.0)
+   PKG_CHECK_MODULES(POPPLER_QT4_TEST, 
+-	            QtTest >= 4.7.0)
++	            QtTestE >= 4.7.0)
+ elif test x$enable_poppler_qt4 = xtry; then
+   PKG_CHECK_MODULES(POPPLER_QT4,
+-                    QtCore >= 4.7.0 QtGui >= 4.7.0 QtXml >= 4.7.0,
++                    QtCoreE >= 4.7.0 QtGuiE >= 4.7.0 QtXmlE >= 4.7.0,
+                     [enable_poppler_qt4="yes"],
+                     [enable_poppler_qt4="no"])
+   if test x$enable_poppler_qt4 = xyes; then
+     PKG_CHECK_MODULES(POPPLER_QT4_TEST,
+-                    QtTest >= 4.7.0,
++                    QtTestE >= 4.7.0,
+                     [enable_poppler_qt4="yes"],
+                     [enable_poppler_qt4="no"])
+   fi
diff --git a/meta-oe/recipes-support/poppler/poppler_0.35.0.bb b/meta-oe/recipes-support/poppler/poppler_0.35.0.bb
index 520aa6b..efb7241 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.35.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.35.0.bb
@@ -20,14 +20,18 @@ PACKAGECONFIG[tiff] = "--enable-libtiff,--disable-libtiff,tiff"
 PACKAGECONFIG[curl] = "--enable-libcurl,--disable-libcurl,curl"
 PACKAGECONFIG[openjpeg] = "--enable-libopenjpeg=openjpeg2,--disable-libopenjpeg,openjpeg"
 PACKAGECONFIG[qt5] = "--enable-poppler-qt5 --with-moc-qt5=${STAGING_BINDIR_NATIVE}/qt5/moc,--disable-poppler-qt5,qtbase"
+PACKAGECONFIG[qt4e] = "--enable-poppler-qt4 --with-moc-qt4=${STAGING_BINDIR_NATIVE}/moc4,--disable-poppler-qt4,qt4-embedded"
 
 EXTRA_OECONF = "\
     --enable-xpdf-headers \
     --disable-gtk-test \
-    --disable-poppler-qt4 \
     --enable-zlib \
 "
 
+# Adjust library names when building for QT4e
+QT4E_PATCHES = "${@bb.utils.contains('PACKAGECONFIG', 'qt4e', 'file://fix-qt4e-library-dependencies.patch', '', d)}"
+SRC_URI_append = "${QT4E_PATCHES}"
+
 # check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
 def get_poppler_fpu_setting(bb, d):
     if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
-- 
1.9.1


