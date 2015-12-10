Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id ECA2D6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2015 19:00:01 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id u63so36765045wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2015 11:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wpV19X9K+kZ/K4yulLoqd69eViH5+zWfhaWyfGTfhDQ=;
	b=IzRKIM3dPx4S5xzexqFSIPsHSZ030npskYdqXQ96oXXRZXMsyr5wNrzx0AHG2/Fi3L
	vil5ZoEyyGA5rBY9Dj3yqIGCIIYtC/89kHydHMfGUgAumiAPUfh902uHP86Gm42XTmID
	IcIN77MsepeZIwnbfpTY6Y1pjKANJi263Qi+mPI/d3majn73VDn4Vul0FKus983VjvxR
	gLg+EU8Yq4ciYUzAoJOehHefuC5enX3rlfBuhCHR5BhDIds5gTAiPUSSEXx1QH9MIPHB
	cmQY6tcMHtZKT07nvs6olC1SEIPDt3rIMH/gB/W7+oOLwebB0otubfBGV0RlIs2rPb+J
	zOqg==
X-Received: by 10.194.117.163 with SMTP id kf3mr14686980wjb.139.1449774002150; 
	Thu, 10 Dec 2015 11:00:02 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gl10sm13619271wjb.30.2015.12.10.11.00.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 11:00:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Dec 2015 20:01:43 +0100
Message-Id: <1449774103-9458-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][meta-ruby][meta-oe] libgxim: move from meta-ruby back to meta-oe
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
X-List-Received-Date: Thu, 10 Dec 2015 19:00:02 -0000

* it was moved to meta-ruby (totherer with imsettings which depends on libgxim)
  because of ruby-native dependency, now when ruby was moved from meta-ruby to
  oe-core we can move libgxim back to meta-oe (which also allows imsettings
  in meta-xfce to depend only on meta-oe as well)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...CAL_AMFLAGS-isnot-supported-by-autoreconf.patch | 21 ++++++++++++++++++
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb  | 25 ++++++++++++++++++++++
 ...CAL_AMFLAGS-isnot-supported-by-autoreconf.patch | 21 ------------------
 .../recipes-extended/libgxim/libgxim_0.5.0.bb      | 25 ----------------------
 4 files changed, 46 insertions(+), 46 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
 create mode 100644 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
 delete mode 100644 meta-ruby/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
 delete mode 100644 meta-ruby/recipes-extended/libgxim/libgxim_0.5.0.bb

diff --git a/meta-oe/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch b/meta-oe/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
new file mode 100644
index 0000000..3d293b4
--- /dev/null
+++ b/meta-oe/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
@@ -0,0 +1,21 @@
+multi-line ACLOCAL_AMFLAGS isn't supported by autoreconf.
+It will cause configure error as follow.
+
+   aclocal: error: non-option arguments are not accepted: '\'.
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+diff -Nurp libgxim-0.5.0.orig/Makefile.am libgxim-0.5.0/Makefile.am
+--- libgxim-0.5.0.orig/Makefile.am	2012-12-13 15:48:09.000000000 +0800
++++ libgxim-0.5.0/Makefile.am	2014-12-19 11:05:50.727209821 +0800
+@@ -2,9 +2,7 @@ NULL =
+ AUTOMAKE_OPTIONS = dist-bzip2
+ SUBDIRS = libgxim m4macros po tests docs
+ 
+-ACLOCAL_AMFLAGS =			\
+-	-I m4macros			\
+-	$(NULL)
++ACLOCAL_AMFLAGS = -I m4macros $(NULL)
+ 
+ CONFIGURE_DEPENDENCIES =		\
+ 	requires			\
diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
new file mode 100644
index 0000000..768bdaa
--- /dev/null
+++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "GObject-based XIM protocol library"
+DESCRIPTION = "libgxim is a X Input Method protocol library that is implemented by GObject.\
+this library helps you to implement XIM servers or client applications to\
+communicate through XIM protocol without using Xlib API directly, particularly\
+if your application uses GObject-based main loop.\
+\
+This package contains the shared library."
+
+HOMEPAGE = "http://code.google.com/p/libgxim/"
+SECTION = "System Environment/Libraries"
+
+SRC_URI = "https://bitbucket.org/tagoh/libgxim/downloads/${BPN}-${PV}.tar.bz2 \
+           file://multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch"
+
+SRC_URI[md5sum] = "4bb1fa63d00eb224439d413591c29a6a"
+SRC_URI[sha256sum] = "75e20d1744139644f9951b78ea3910b162d3380302315cb4b3d0640f23694c79"
+
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "\
+file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+EXTRA_OECONF = " --disable-static --disable-rebuilds"
+DEPENDS += "gtk+ glib-2.0 ruby-native"
+
+inherit autotools pkgconfig gettext
diff --git a/meta-ruby/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch b/meta-ruby/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
deleted file mode 100644
index 3d293b4..0000000
--- a/meta-ruby/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-multi-line ACLOCAL_AMFLAGS isn't supported by autoreconf.
-It will cause configure error as follow.
-
-   aclocal: error: non-option arguments are not accepted: '\'.
-
-Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
-
-diff -Nurp libgxim-0.5.0.orig/Makefile.am libgxim-0.5.0/Makefile.am
---- libgxim-0.5.0.orig/Makefile.am	2012-12-13 15:48:09.000000000 +0800
-+++ libgxim-0.5.0/Makefile.am	2014-12-19 11:05:50.727209821 +0800
-@@ -2,9 +2,7 @@ NULL =
- AUTOMAKE_OPTIONS = dist-bzip2
- SUBDIRS = libgxim m4macros po tests docs
- 
--ACLOCAL_AMFLAGS =			\
--	-I m4macros			\
--	$(NULL)
-+ACLOCAL_AMFLAGS = -I m4macros $(NULL)
- 
- CONFIGURE_DEPENDENCIES =		\
- 	requires			\
diff --git a/meta-ruby/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-ruby/recipes-extended/libgxim/libgxim_0.5.0.bb
deleted file mode 100644
index 768bdaa..0000000
--- a/meta-ruby/recipes-extended/libgxim/libgxim_0.5.0.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "GObject-based XIM protocol library"
-DESCRIPTION = "libgxim is a X Input Method protocol library that is implemented by GObject.\
-this library helps you to implement XIM servers or client applications to\
-communicate through XIM protocol without using Xlib API directly, particularly\
-if your application uses GObject-based main loop.\
-\
-This package contains the shared library."
-
-HOMEPAGE = "http://code.google.com/p/libgxim/"
-SECTION = "System Environment/Libraries"
-
-SRC_URI = "https://bitbucket.org/tagoh/libgxim/downloads/${BPN}-${PV}.tar.bz2 \
-           file://multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch"
-
-SRC_URI[md5sum] = "4bb1fa63d00eb224439d413591c29a6a"
-SRC_URI[sha256sum] = "75e20d1744139644f9951b78ea3910b162d3380302315cb4b3d0640f23694c79"
-
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "\
-file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-
-EXTRA_OECONF = " --disable-static --disable-rebuilds"
-DEPENDS += "gtk+ glib-2.0 ruby-native"
-
-inherit autotools pkgconfig gettext
-- 
2.6.3


