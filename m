Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 92DDB728AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 03:34:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="45482667"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Dec 2014 11:31:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBJ3YKE1014203
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:34:21 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 19 Dec 2014 11:34:51 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Dec 2014 11:31:20 +0800
Message-ID: <1418959880-4891-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH] libgxim: Add recipe
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
X-List-Received-Date: Fri, 19 Dec 2014 03:34:54 -0000
Content-Type: text/plain

libgxim is a GObject-based XIM protocol library.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 ...CAL_AMFLAGS-isnot-supported-by-autoreconf.patch | 21 ++++++++++++++++++
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb  | 25 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
 create mode 100644 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb

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
index 0000000..0b4b743
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
+inherit autotools pkgconfig
-- 
1.9.1


