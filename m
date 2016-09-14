Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E39D4731D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 04:57:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10962003"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Sep 2016 12:57:10 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E62B44623466
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 12:57:09 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 14 Sep 2016 12:57:08 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Sep 2016 00:57:06 -0400
Message-ID: <1473829026-3132-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: E62B44623466.A4AAA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-xfce][PATCH] imsettings: 1.6.8 -> 1.7.1
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
X-List-Received-Date: Wed, 14 Sep 2016 04:57:13 -0000
Content-Type: text/plain

1) Upgrade imsettings from 1.6.8 to 1.7.1.
2) Fix the directory structure.
3) Modify one patch, since the data has been changed.
    multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
4) Modify DEPENDS, fix warning.
    WARNING: imsettings-1.7.1-r0 do_configure: Missing DEPENDS on intltool-native

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../{ => imsettings}/gtk-is-required-by-notify.patch         |  0
 ...-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch | 12 +++++-------
 .../{imsettings_1.6.8.bb => imsettings/imsettings_1.7.1.bb}  |  8 ++++----
 3 files changed, 9 insertions(+), 11 deletions(-)
 rename meta-xfce/recipes-extended/imsettings/{ => imsettings}/gtk-is-required-by-notify.patch (100%)
 rename meta-xfce/recipes-extended/imsettings/{ => imsettings}/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch (61%)
 rename meta-xfce/recipes-extended/{imsettings_1.6.8.bb => imsettings/imsettings_1.7.1.bb} (74%)

diff --git a/meta-xfce/recipes-extended/imsettings/gtk-is-required-by-notify.patch b/meta-xfce/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
similarity index 100%
rename from meta-xfce/recipes-extended/imsettings/gtk-is-required-by-notify.patch
rename to meta-xfce/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
diff --git a/meta-xfce/recipes-extended/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch b/meta-xfce/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
similarity index 61%
rename from meta-xfce/recipes-extended/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
rename to meta-xfce/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
index 9e31847..d5ac87d 100644
--- a/meta-xfce/recipes-extended/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
+++ b/meta-xfce/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
@@ -5,16 +5,14 @@ It will cause configure error as follow.
 
 Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
 
-diff -Nurp imsettings-1.6.8.orig/Makefile.am imsettings-1.6.8/Makefile.am
---- imsettings-1.6.8.orig/Makefile.am	2013-02-08 11:33:59.000000000 +0900
-+++ imsettings-1.6.8/Makefile.am	2015-06-24 14:15:32.070000007 +0900
-@@ -1,9 +1,7 @@
+diff -Nurp imsettings-1.7.1.orig/Makefile.am imsettings-1.7.1/Makefile.am
+--- imsettings-1.7.1.orig/Makefile.am	2013-02-08 11:33:59.000000000 +0900
++++ imsettings-1.7.1/Makefile.am	2015-06-24 14:15:32.070000007 +0900
+@@ -1,7 +1,7 @@
  NULL =
  SUBDIRS = data imsettings imsettings-daemon backends utils po tests docs
  
--ACLOCAL_AMFLAGS =			\
--	-I m4macros			\
--	$(NULL)
+-ACLOCAL_AMFLAGS = -Im4macros
 +ACLOCAL_AMFLAGS = -I m4macros $(NULL)
  
  CONFIGURE_DEPENDENCIES =		\
diff --git a/meta-xfce/recipes-extended/imsettings_1.6.8.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb
similarity index 74%
rename from meta-xfce/recipes-extended/imsettings_1.6.8.bb
rename to meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb
index 699547d..8c04db6 100644
--- a/meta-xfce/recipes-extended/imsettings_1.6.8.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2
            file://gtk-is-required-by-notify.patch \
            file://multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch"
 
-SRC_URI[md5sum] = "c31429f1d60e36d7f811f871c75b6c41"
-SRC_URI[sha256sum] = "2620ffbf9a6dc842dbf994b4773d4fe355eb77076ccf33f726ba63f16c0d08ba"
+SRC_URI[md5sum] = "ab439e21a7d86fa99fbc04586c755349"
+SRC_URI[sha256sum] = "12c35352386057ba68d69a0b7d9a1d0d01ebbd893aafe0a094c3158c8079ac9a"
 
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
@@ -23,8 +23,8 @@ EXTRA_OECONF = "--with-xinputsh=50-xinput.sh \
                 --disable-static \
                "
 
-DEPENDS = "gtk+ gconf libnotify dbus-glib libgxim xfconf"
+DEPENDS = "gtk+ gconf libnotify dbus-glib libgxim xfconf intltool-native"
 
 RDEPENDS_${PN} += "bash"
 
-FILES_${PN} += "${datadir}/dbus-1/*"
+FILES_${PN} += "${datadir}/dbus-1/* ${datadir}/gir-1.0/* ${libdir}/girepository-1.0/*"
-- 
2.7.4




