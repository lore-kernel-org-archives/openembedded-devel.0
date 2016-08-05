Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2350B73257
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 08:56:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9597170"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Aug 2016 16:56:46 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4DB7A429595E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 16:56:44 +0800 (CST)
Received: from localhost.localdomain (10.167.226.25) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 5 Aug 2016 16:56:43 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1461826934-3369-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.25]
X-yoursite-MailScanner-ID: 4DB7A429595E.AE7E8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] uim: add support for anthy
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
Date: Fri, 05 Aug 2016 08:56:55 -0000
X-Original-Date: Thu, 28 Apr 2016 10:02:14 +0300
X-List-Received-Date: Fri, 05 Aug 2016 08:56:55 -0000
Content-Type: text/plain

make uim support anthy.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../uim/uim/0001-configure.ac-Error-Fix.patch      | 29 +++++++++++++++++++++
 .../uim/uim/0001-fep-uim-fep.c-Error-Fix.patch     | 30 ++++++++++++++++++++++
 meta-oe/recipes-support/uim/uim_1.8.6.bb           | 11 +++++++-
 3 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/uim/uim/0001-configure.ac-Error-Fix.patch
 create mode 100644 meta-oe/recipes-support/uim/uim/0001-fep-uim-fep.c-Error-Fix.patch

diff --git a/meta-oe/recipes-support/uim/uim/0001-configure.ac-Error-Fix.patch b/meta-oe/recipes-support/uim/uim/0001-configure.ac-Error-Fix.patch
new file mode 100644
index 0000000..1e992d9
--- /dev/null
+++ b/meta-oe/recipes-support/uim/uim/0001-configure.ac-Error-Fix.patch
@@ -0,0 +1,29 @@
+From 843155bb61729d5fa0513b0cc967f5ed34124848 Mon Sep 17 00:00:00 2001
+From: Li Xin <lixin.fnst@cn.fujitsu.com>
+Date: Fri, 26 Feb 2016 15:14:30 +0900
+Subject: [PATCH] configure.ac: Error Fix
+
+ERROR: QA Issue: uim: The compile log indicates that host
+include and/or library paths were used.
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9249bfd..be03d74 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1216,7 +1216,7 @@ if test "x$use_libedit" != "xno"; then
+             use_libedit="no")])
+     if test "x$use_libedit" != "xno"; then
+         AC_CHECK_LIB(edit, el_init,
+-            [LIBEDIT_LIBS="-ledit $LIBEDIT_LIBS -L$libedit_path/lib"
++            [LIBEDIT_LIBS="-ledit $LIBEDIT_LIBS"
+                 AC_SUBST(LIBEDIT_LIBS)],
+             [AC_MSG_WARN("libedit not found. Disabled...")
+                 use_libedit="no"])
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/uim/uim/0001-fep-uim-fep.c-Error-Fix.patch b/meta-oe/recipes-support/uim/uim/0001-fep-uim-fep.c-Error-Fix.patch
new file mode 100644
index 0000000..2ca21b0
--- /dev/null
+++ b/meta-oe/recipes-support/uim/uim/0001-fep-uim-fep.c-Error-Fix.patch
@@ -0,0 +1,30 @@
+From db57f34cf8e6483866ff7df7e65bc015a86cc71c Mon Sep 17 00:00:00 2001
+From: Li Xin <lixin.fnst@cn.fujitsu.com>
+Date: Thu, 3 Mar 2016 15:23:59 +0900
+Subject: [PATCH] fep/uim-fep.c: Error Fix
+
+uim-1.8.6/fep/uim-fep.c:93:21: error: stropts.h: No such file or directory
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ fep/uim-fep.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fep/uim-fep.c b/fep/uim-fep.c
+index 55dbf7c..3fb62bf 100644
+--- a/fep/uim-fep.c
++++ b/fep/uim-fep.c
+@@ -90,7 +90,7 @@
+ #include <sys/time.h>
+ #endif
+ #ifdef HAVE_STROPTS_H
+-#include <stropts.h>
++//#include <stropts.h>
+ #endif
+ #ifdef HAVE_SYS_PARAM_H
+ #include <sys/param.h>
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index ae193b2..acb9443 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -3,11 +3,15 @@ HOMEPAGE = "http://uim.freedesktop.org/"
 LICENSE = "BSD-3-Clause & LGPLv2+"
 SECTION = "inputmethods"
 
+PARALLEL_MAKEINST = ""
+
 SRC_URI = "http://uim.googlecode.com/files/uim-${PV}.tar.bz2 \
           "
 
 SRC_URI_append_class-target = "file://uim-module-manager.patch \
-                               file://0001-fix-bug-for-cross-compile.patch"
+                               file://0001-fix-bug-for-cross-compile.patch \
+			        file://0001-configure.ac-Error-Fix.patch"
+SRC_URI_append_class-native = "file://0001-fep-uim-fep.c-Error-Fix.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=32463fd29aa303fb2360faeeae17256b"
 SRC_URI[md5sum] = "ecea4c597bab1fd4ba98ea84edcece59"
@@ -19,6 +23,8 @@ DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native takao-fonts"
 RDEPENDS_uim = "libuim0 libedit"
 RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0"
 
+do_configure[depends] += "anthy:do_populate_sysroot"
+
 LEAD_SONAME = "libuim.so.1"
 
 inherit autotools pkgconfig gettext
@@ -31,6 +37,8 @@ EXTRA_OECONF += "--disable-emacs \
                  --without-mana \
                  --without-eb"
 
+EXTRA_OECONF_append_class-target = " --with-anthy"
+
 CONFIGUREOPTS_remove_class-target = "--disable-silent-rules"
 
 #Because m4 file's find maxdepth=2, so copy the m4 files of the deep depth.
@@ -40,6 +48,7 @@ do_configure_prepend () {
 
 do_install_append() {
     rm -rf ${D}/${datadir}/applications
+    rm -f ${D}${datadir}/uim/elatin-rules.scm
 }
 
 PACKAGES += "uim-xim uim-utils uim-skk uim-gtk2.0 uim-gtk3 uim-fep uim-common uim-anthy libuim0 libuim-dev"
-- 
2.7.4




