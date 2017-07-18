Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A7AC665D35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 06:09:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I69JHv023081
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jul 2017 23:09:19 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 23:09:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Jul 2017 02:09:04 -0400
Message-ID: <56636a4e07c1ea81d5769d31da3bd781c618f7a8.1500357921.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500357921.git.hongxu.jia@windriver.com>
References: <cover.1500357921.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/9] glade: add recipe 3.20.0
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
X-List-Received-Date: Tue, 18 Jul 2017 06:09:18 -0000
Content-Type: text/plain

The newly added glade is the original Glade codebase,
and glade3 is a complete rewrite of it.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../glade/glade/remove-yelp-help-rules-var.patch   | 39 ++++++++++++++++++++++
 ...gnome-doc-utils.make-sysrooted-pkg-config.patch |  0
 .../{files => glade3}/0002-fix-gcc-6-build.patch   |  0
 meta-oe/recipes-devtools/glade/glade_3.20.0.bb     | 27 +++++++++++++++
 4 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/glade/glade/remove-yelp-help-rules-var.patch
 rename meta-oe/recipes-devtools/glade/{files => glade3}/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch (100%)
 rename meta-oe/recipes-devtools/glade/{files => glade3}/0002-fix-gcc-6-build.patch (100%)
 create mode 100644 meta-oe/recipes-devtools/glade/glade_3.20.0.bb

diff --git a/meta-oe/recipes-devtools/glade/glade/remove-yelp-help-rules-var.patch b/meta-oe/recipes-devtools/glade/glade/remove-yelp-help-rules-var.patch
new file mode 100644
index 0000000..78a8719
--- /dev/null
+++ b/meta-oe/recipes-devtools/glade/glade/remove-yelp-help-rules-var.patch
@@ -0,0 +1,39 @@
+From 42efc94c11d510b41d8cf3407e1c3900eb52b600 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 4 Jun 2015 16:28:02 +0800
+Subject: [PATCH] Remove unused variable (YELP_HELP_RULES)
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ help/Makefile.am | 2 --
+ help/Makefile.in | 2 --
+ 2 files changed, 4 deletions(-)
+
+diff --git a/help/Makefile.am b/help/Makefile.am
+index 50c0e84..5c5d2e9 100644
+--- a/help/Makefile.am
++++ b/help/Makefile.am
+@@ -1,5 +1,3 @@
+-@YELP_HELP_RULES@
+-
+ HELP_ID = glade
+ 
+ HELP_FILES = \
+diff --git a/help/Makefile.in b/help/Makefile.in
+index 6978ea5..e1c7d3b 100644
+--- a/help/Makefile.in
++++ b/help/Makefile.in
+@@ -521,8 +521,6 @@ uninstall-am:
+ 
+ .PRECIOUS: Makefile
+ 
+-@YELP_HELP_RULES@
+-
+ # Tell versions [3.59,3.63) of GNU make to not export all variables.
+ # Otherwise a system limit (for SysV at least) may be exceeded.
+ .NOEXPORT:
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/glade/files/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch b/meta-oe/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
similarity index 100%
rename from meta-oe/recipes-devtools/glade/files/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
rename to meta-oe/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
diff --git a/meta-oe/recipes-devtools/glade/files/0002-fix-gcc-6-build.patch b/meta-oe/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
similarity index 100%
rename from meta-oe/recipes-devtools/glade/files/0002-fix-gcc-6-build.patch
rename to meta-oe/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
diff --git a/meta-oe/recipes-devtools/glade/glade_3.20.0.bb b/meta-oe/recipes-devtools/glade/glade_3.20.0.bb
new file mode 100644
index 0000000..8b35a9c
--- /dev/null
+++ b/meta-oe/recipes-devtools/glade/glade_3.20.0.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Glade - A User Interface Designer"
+HOMEPAGE = "http://www.gnu.org/software/gnash"
+LICENSE = "GPLv2 & LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
+                    file://COPYING.GPL;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
+                    file://COPYING.LGPL;md5=252890d9eee26aab7b432e8b8a616475"
+DEPENDS = "gtk+ gtk+3 glib-2.0 libxml2 intltool-native \
+           gnome-common-native \
+"
+
+
+inherit autotools pkgconfig pythonnative gnomebase gobject-introspection
+
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.20/glade-${PV}.tar.xz \
+           file://remove-yelp-help-rules-var.patch \
+          "
+SRC_URI[md5sum] = "9964a2da14c5f845eae363889586ca43"
+SRC_URI[sha256sum] = "82d96dca5dec40ee34e2f41d49c13b4ea50da8f32a3a49ca2da802ff14dc18fe"
+
+EXTRA_OECONF += "--disable-man-pages"
+
+FILES_${PN} += "${datadir}/* ${libdir}/glade/modules/libgladegtk.so"
+FILES_${PN}-dev += "${libdir}/glade/modules/libgladegtk.la"
+FILES_${PN}-dbg += "${libdir}/glade/modules/.debug/libgladegtk.so"
+
+PYTHON_PN = "python"
+
-- 
2.8.1


