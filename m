Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0EEFF75A3E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 05:38:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97685051"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Jun 2015 13:42:22 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5O5adkX005349
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 13:36:40 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 24 Jun 2015 13:38:38 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Jun 2015 13:29:03 +0800
Message-ID: <1435123743-14401-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-ruby][PATCH v2] imsettings: add new recipe
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
X-List-Received-Date: Wed, 24 Jun 2015 05:38:21 -0000
Content-Type: text/plain

imsettings is a delivery framework for general input-method configuration

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../imsettings/gtk-is-required-by-notify.patch     | 18 +++++++++++++
 ...CAL_AMFLAGS-isnot-supported-by-autoreconf.patch | 21 +++++++++++++++
 .../imsettings/imsettings_1.6.8.bb                 | 30 ++++++++++++++++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
 create mode 100644 meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
 create mode 100644 meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb

diff --git a/meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch b/meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
new file mode 100644
index 0000000..d42358d
--- /dev/null
+++ b/meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
@@ -0,0 +1,18 @@
+gtk+ is required by linnotify. So make sure gtk be linked before libnotify
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+diff -Nurp imsettings-1.6.7.orig/configure.ac imsettings-1.6.7/configure.ac
+--- imsettings-1.6.7.orig/configure.ac	2013-11-26 16:09:09.000000000 +0800
++++ imsettings-1.6.7/configure.ac	2014-12-30 11:27:44.370003209 +0800
+@@ -93,8 +93,8 @@ PKG_CHECK_MODULES(LIBNOTIFY, libnotify,
+ 		has_old_libnotify=yes
+ 		PKG_CHECK_MODULES(GTK, gtk+-2.0 >= $GTK_REQUIRED)
+ 		AC_DEFINE(HAS_OLD_LIBNOTIFY,, [Using older libnotify])
+-		IMDAEMON_CFLAGS="$GTK_CFLAGS $LIBNOTIFY_OLD_CFLAGS"
+-		IMDAEMON_LIBS="$GTK_LIBS $LIBNOTIFY_OLD_LIBS"],[
++		IMDAEMON_CFLAGS="$LIBNOTIFY_OLD_CFLAGS $GTK_CFLAGS"
++		IMDAEMON_LIBS="$LIBNOTIFY_OLD_LIBS $GTK_LIBS"],[
+ 		has_old_libnotify=no
+ 		IMDAEMON_CFLAGS="$LIBNOTIFY_CFLAGS"
+ 		IMDAEMON_LIBS="$LIBNOTIFY_LIBS"])
diff --git a/meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch b/meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
new file mode 100644
index 0000000..9e31847
--- /dev/null
+++ b/meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
@@ -0,0 +1,21 @@
+multi-line ACLOCAL_AMFLAGS isn't supported by autoreconf.
+It will cause configure error as follow.
+
+  aclocal: error: non-option arguments are not accepted: '\'.
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+diff -Nurp imsettings-1.6.8.orig/Makefile.am imsettings-1.6.8/Makefile.am
+--- imsettings-1.6.8.orig/Makefile.am	2013-02-08 11:33:59.000000000 +0900
++++ imsettings-1.6.8/Makefile.am	2015-06-24 14:15:32.070000007 +0900
+@@ -1,9 +1,7 @@
+ NULL =
+ SUBDIRS = data imsettings imsettings-daemon backends utils po tests docs
+ 
+-ACLOCAL_AMFLAGS =			\
+-	-I m4macros			\
+-	$(NULL)
++ACLOCAL_AMFLAGS = -I m4macros $(NULL)
+ 
+ CONFIGURE_DEPENDENCIES =		\
+ 	requires			\
diff --git a/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb b/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
new file mode 100644
index 0000000..64a229b
--- /dev/null
+++ b/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Delivery framework for general Input Method configuration"
+DESCRIPTION = "IMSettings is a framework that delivers Input Method \
+settings and applies the changes so they take effect \
+immediately without any need to restart applications \
+or the desktop. \
+This package contains the core DBus services and some utilities."
+HOMEPAGE = "http://code.google.com/p/imsettings/"
+SECTION = "Applications/System"
+
+inherit autotools gtk-doc
+
+SRC_URI = "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2 \
+           file://gtk-is-required-by-notify.patch \
+           file://multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch"
+
+SRC_URI[md5sum] = "c31429f1d60e36d7f811f871c75b6c41"
+SRC_URI[sha256sum] = "2620ffbf9a6dc842dbf994b4773d4fe355eb77076ccf33f726ba63f16c0d08ba"
+
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+EXTRA_OECONF = "--with-xinputsh=50-xinput.sh \
+                --disable-static \
+               "
+
+DEPENDS = "gtk+ gconf libnotify dbus-glib libgxim"
+
+RDEPENDS_${PN} += "bash"
+
+FILES_${PN} += "${datadir}/dbus-1/*"
-- 
1.8.4.2


