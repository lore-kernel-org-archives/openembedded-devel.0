Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3E1C573CBD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2015 22:30:41 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so3275148wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Oct 2015 15:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TBRBwANzABg5xjfWMJuY61DMQ2xmLpPob1aNJtkHDwU=;
	b=XdK3A+vHyVDJvhYxyjDuvvkb3gKeQ5X6evd6LnKzz8EZwz+3nVBBEQjyOB3sRu0sUk
	OUKZyNlp4c7hzve7lvAEIjslLxSRu5zPMFVlWh8G65vPXYmYIizDSJa0SeSvHBUFD6Cg
	wKWPOTp1CUNBCrmuAoknEW/C7bqahQPl7knextSiWLIcdHZ5VBTPIt+z6hF9xbcYTwgp
	+m6ToqYnWms/Zu1ZQ+bgGZud6ILL6asibdwAss7hrFgiR1t/cWKh0INT6u7QvFH7lg6x
	id1DY4YM4ogG2GSct/HjASy+pg7Idkg+OJGm8qdnG4ToWorElWgEt62tBdN3WxDBSvW3
	Ec9Q==
X-Received: by 10.180.198.142 with SMTP id jc14mr21102837wic.32.1444170641864; 
	Tue, 06 Oct 2015 15:30:41 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ka10sm35132468wjc.30.2015.10.06.15.30.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Oct 2015 15:30:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Oct 2015 00:30:38 +0200
Message-Id: <1444170642-23088-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444170642-23088-1-git-send-email-Martin.Jansa@gmail.com>
References: <1444170642-23088-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 4/8] Revert "gcalctool: move to nonworking"
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
X-List-Received-Date: Tue, 06 Oct 2015 22:30:44 -0000

* use PNBLACKLIST instead

This reverts commit 84e8fee8b8631138ef52ef3dcf0ab7c8ce2925d0.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gcalctool/gcalctool/fix-includedir.patch       | 31 ++++++++++++++++++++++
 .../recipes-gnome/gcalctool/gcalctool_5.32.0.bb    | 20 ++++++++++++++
 .../gcalctool/gcalctool/fix-includedir.patch       | 31 ----------------------
 .../nonworking/gcalctool/gcalctool_5.32.0.bb       | 18 -------------
 4 files changed, 51 insertions(+), 49 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
 create mode 100644 meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool/fix-includedir.patch
 delete mode 100644 meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb

diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch b/meta-gnome/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
new file mode 100644
index 0000000..aeb02ab
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
@@ -0,0 +1,31 @@
+---
+ Makefile.am           |    2 +-
+ gcalctool/Makefile.am |    2 --
+ 2 files changed, 1 insertion(+), 3 deletions(-)
+
+Index: gcalctool-5.8.17/gcalctool/Makefile.am
+===================================================================
+--- gcalctool-5.8.17.orig/gcalctool/Makefile.am	2005-12-19 15:46:57.000000000 +0000
++++ gcalctool-5.8.17/gcalctool/Makefile.am	2007-05-16 16:03:26.000000000 +0100
+@@ -1,8 +1,6 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+ INCLUDES = \
+-	-I$(includedir) \
+-	-DG_DISABLE_DEPRECATED \
+ 	-DGDK_PIXBUF_DISABLE_DEPRECATED \
+ 	-DGDK_DISABLE_DEPRECATED \
+ 	-DGNOME_DISABLE_DEPRECATED \
+Index: gcalctool-5.8.17/Makefile.am
+===================================================================
+--- gcalctool-5.8.17.orig/Makefile.am	2007-05-16 15:35:44.000000000 +0100
++++ gcalctool-5.8.17/Makefile.am	2007-05-16 16:06:46.000000000 +0100
+@@ -29,7 +29,7 @@ DISTCLEANFILES =                \
+ 	gnome-doc-utils.make	\
+ 	gcalctool.desktop
+ 
+-SUBDIRS = po gcalctool help
++SUBDIRS = po gcalctool
+ 
+ SCHEMAS_FILE = gcalctool.schemas
+ 
diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
new file mode 100644
index 0000000..d391bba
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "gcalctool is a powerful calculator"
+SECTION = "x11"
+DEPENDS = "gtk+ gnome-doc-utils"
+
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SRC_URI = "http://download.gnome.org/sources/${BPN}/${SHRT_VER}/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "48db927c6e7ee1d5395f953a8c184c98"
+SRC_URI[sha256sum] = "346f645c0fdef900642f6e9a2c18e7ba9a7ca9bc62fe2b08eb418f065a425c89"
+
+inherit autotools pkgconfig gsettings
+
+do_configure_prepend() {
+    sed -i -e "s: help: :g" ${S}/Makefile.am
+}
+
+PNBLACKLIST[gcalctool] ?= "broken at least since April 2013 http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57920 and nobody complained, it's also replaced by gnome calculator"
diff --git a/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool/fix-includedir.patch b/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool/fix-includedir.patch
deleted file mode 100644
index aeb02ab..0000000
--- a/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool/fix-includedir.patch
+++ /dev/null
@@ -1,31 +0,0 @@
----
- Makefile.am           |    2 +-
- gcalctool/Makefile.am |    2 --
- 2 files changed, 1 insertion(+), 3 deletions(-)
-
-Index: gcalctool-5.8.17/gcalctool/Makefile.am
-===================================================================
---- gcalctool-5.8.17.orig/gcalctool/Makefile.am	2005-12-19 15:46:57.000000000 +0000
-+++ gcalctool-5.8.17/gcalctool/Makefile.am	2007-05-16 16:03:26.000000000 +0100
-@@ -1,8 +1,6 @@
- ## Process this file with automake to produce Makefile.in
- 
- INCLUDES = \
--	-I$(includedir) \
--	-DG_DISABLE_DEPRECATED \
- 	-DGDK_PIXBUF_DISABLE_DEPRECATED \
- 	-DGDK_DISABLE_DEPRECATED \
- 	-DGNOME_DISABLE_DEPRECATED \
-Index: gcalctool-5.8.17/Makefile.am
-===================================================================
---- gcalctool-5.8.17.orig/Makefile.am	2007-05-16 15:35:44.000000000 +0100
-+++ gcalctool-5.8.17/Makefile.am	2007-05-16 16:06:46.000000000 +0100
-@@ -29,7 +29,7 @@ DISTCLEANFILES =                \
- 	gnome-doc-utils.make	\
- 	gcalctool.desktop
- 
--SUBDIRS = po gcalctool help
-+SUBDIRS = po gcalctool
- 
- SCHEMAS_FILE = gcalctool.schemas
- 
diff --git a/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb b/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb
deleted file mode 100644
index 4812fe3..0000000
--- a/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "gcalctool is a powerful calculator"
-SECTION = "x11"
-DEPENDS = "gtk+ gnome-doc-utils"
-
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-SRC_URI = "http://download.gnome.org/sources/${BPN}/${SHRT_VER}/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "48db927c6e7ee1d5395f953a8c184c98"
-SRC_URI[sha256sum] = "346f645c0fdef900642f6e9a2c18e7ba9a7ca9bc62fe2b08eb418f065a425c89"
-
-inherit autotools pkgconfig gsettings
-
-do_configure_prepend() {
-    sed -i -e "s: help: :g" ${S}/Makefile.am
-}
-- 
2.6.0


