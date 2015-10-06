Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4990C757AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2015 22:30:42 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so185893927wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Oct 2015 15:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vK+BL73opo4oxDB9S8zKNdfLU6Mwak597msL3zUZFjM=;
	b=EWRLoUicp2p77tF82AZIP1ocR1/CXv9cNuhK8c+fZk/yOuaXN/nTttGaJDjfN178hX
	BXaEzMNr32xE/UQUJt0FpknElRJxw9RCJRLVQCkEvBmu70jxUmt3XtQwWjoYDSwliCJ+
	lXiOwIwphWwHSnTDuOg45mVHPY6NiAz8r6GpK0HGzE1hdeGOEqZvhUfLX5keeIz2gdTv
	wp9LBNCnEu5y4G8FBasGmB4ms43ypyHZfM8xUWeEwERvUS09vXb7V1445MLbnaZQ6jGg
	2nJyN+9z9PPKHkO0ooOqrMLJWk68zhUzGeM3bF0Oit2qln+4bVR4bX8HRslsFloH1QmR
	kOdQ==
X-Received: by 10.180.103.167 with SMTP id fx7mr18729689wib.89.1444170642954; 
	Tue, 06 Oct 2015 15:30:42 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fv13sm21598949wic.7.2015.10.06.15.30.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Oct 2015 15:30:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Oct 2015 00:30:39 +0200
Message-Id: <1444170642-23088-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444170642-23088-1-git-send-email-Martin.Jansa@gmail.com>
References: <1444170642-23088-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 5/8] Revert "screenshot: Move to nonworking because depends on emprint"
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
X-List-Received-Date: Tue, 06 Oct 2015 22:30:43 -0000

* use PNBLACKLIST instead

This reverts commit 694119f6bffa44941ac73f35d932eef1a582549d.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../screenshot/screenshot-fix-mkinstalldirs.patch  | 23 ----------------------
 .../recipes-efl/e17/nonworking/screenshot_svn.bb   | 16 ---------------
 .../screenshot/screenshot-fix-mkinstalldirs.patch  | 23 ++++++++++++++++++++++
 meta-efl/recipes-efl/e17/screenshot_svn.bb         | 16 +++++++++++++++
 4 files changed, 39 insertions(+), 39 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/nonworking/screenshot/screenshot-fix-mkinstalldirs.patch
 delete mode 100644 meta-efl/recipes-efl/e17/nonworking/screenshot_svn.bb
 create mode 100644 meta-efl/recipes-efl/e17/screenshot/screenshot-fix-mkinstalldirs.patch
 create mode 100644 meta-efl/recipes-efl/e17/screenshot_svn.bb

diff --git a/meta-efl/recipes-efl/e17/nonworking/screenshot/screenshot-fix-mkinstalldirs.patch b/meta-efl/recipes-efl/e17/nonworking/screenshot/screenshot-fix-mkinstalldirs.patch
deleted file mode 100644
index 14f1141..0000000
--- a/meta-efl/recipes-efl/e17/nonworking/screenshot/screenshot-fix-mkinstalldirs.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-Subject: fix screenshot po/ building
-Upstream-Status: Pending
-
-Somehow configure doesn't substitute @MKINSTALLDIRS@ by default anymore,
-however this substitution is required for po/Makefile
-
-Fix that by calling AM_MKINSTALLDIRS from configure.ac
-
-Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-
-Index: E-MODULES-EXTRA/screenshot/configure.ac
-===================================================================
---- E-MODULES-EXTRA.orig/screenshot/configure.ac	2011-08-17 15:49:22.000000000 +0400
-+++ E-MODULES-EXTRA/screenshot/configure.ac	2011-08-17 15:49:34.000000000 +0400
-@@ -24,6 +24,7 @@
- define([AC_LIBTOOL_LANG_F77_CONFIG], [:])dnl
- AC_PROG_LIBTOOL
- 
-+AM_MKINSTALLDIRS
- m4_ifdef([AM_GNU_GETTEXT_VERSION], [
- AM_GNU_GETTEXT_VERSION([0.14])
- ])
diff --git a/meta-efl/recipes-efl/e17/nonworking/screenshot_svn.bb b/meta-efl/recipes-efl/e17/nonworking/screenshot_svn.bb
deleted file mode 100644
index 9689f46..0000000
--- a/meta-efl/recipes-efl/e17/nonworking/screenshot_svn.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-LICENSE = "MIT"
-PV = "0.3.0+svnr${SRCREV}"
-PR = "${INC_PR}.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
-SRC_URI += "file://screenshot-fix-mkinstalldirs.patch"
-
-require e-module.inc
-
-DEPENDS += "emprint"
-RDEPENDS_${PN} += "emprint"
-
-do_configure_prepend() {
-    sed -i -e 's:AC_MSG_ERROR(emprint not found):echo foo:g' ${S}/configure.ac
-}
-
-
diff --git a/meta-efl/recipes-efl/e17/screenshot/screenshot-fix-mkinstalldirs.patch b/meta-efl/recipes-efl/e17/screenshot/screenshot-fix-mkinstalldirs.patch
new file mode 100644
index 0000000..14f1141
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/screenshot/screenshot-fix-mkinstalldirs.patch
@@ -0,0 +1,23 @@
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Subject: fix screenshot po/ building
+Upstream-Status: Pending
+
+Somehow configure doesn't substitute @MKINSTALLDIRS@ by default anymore,
+however this substitution is required for po/Makefile
+
+Fix that by calling AM_MKINSTALLDIRS from configure.ac
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
+Index: E-MODULES-EXTRA/screenshot/configure.ac
+===================================================================
+--- E-MODULES-EXTRA.orig/screenshot/configure.ac	2011-08-17 15:49:22.000000000 +0400
++++ E-MODULES-EXTRA/screenshot/configure.ac	2011-08-17 15:49:34.000000000 +0400
+@@ -24,6 +24,7 @@
+ define([AC_LIBTOOL_LANG_F77_CONFIG], [:])dnl
+ AC_PROG_LIBTOOL
+ 
++AM_MKINSTALLDIRS
+ m4_ifdef([AM_GNU_GETTEXT_VERSION], [
+ AM_GNU_GETTEXT_VERSION([0.14])
+ ])
diff --git a/meta-efl/recipes-efl/e17/screenshot_svn.bb b/meta-efl/recipes-efl/e17/screenshot_svn.bb
new file mode 100644
index 0000000..6dec194
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/screenshot_svn.bb
@@ -0,0 +1,16 @@
+LICENSE = "MIT"
+PV = "0.3.0+svnr${SRCREV}"
+PR = "${INC_PR}.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
+SRC_URI += "file://screenshot-fix-mkinstalldirs.patch"
+
+require e-module.inc
+
+DEPENDS += "emprint"
+RDEPENDS_${PN} += "emprint"
+
+do_configure_prepend() {
+    sed -i -e 's:AC_MSG_ERROR(emprint not found):echo foo:g' ${S}/configure.ac
+}
+
+PNBLACKLIST[screenshot] ?= "depends on blacklisted emprint"
-- 
2.6.0


