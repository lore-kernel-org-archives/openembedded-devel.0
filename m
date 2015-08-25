Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 21AAC75E80
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:45:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99994930"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Aug 2015 17:48:34 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7P9jHn5029112
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:45:17 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 25 Aug 2015 17:45:23 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2015 17:45:45 +0800
Message-ID: <1440495945-26114-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH v3] uim: 1.3.1->1.8.6
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
X-List-Received-Date: Tue, 25 Aug 2015 09:45:25 -0000
Content-Type: text/plain

- deleted 0001-fix-bug-about-stdlib.patch that not be needed.
- modified license

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../uim/uim/0001-fix-bug-about-stdlib.patch        | 40 ----------------------
 .../uim/uim/0001-fix-bug-for-cross-compile.patch   | 38 ++++++++++----------
 .../uim/{uim_1.3.1.bb => uim_1.8.6.bb}             | 15 +++++---
 3 files changed, 29 insertions(+), 64 deletions(-)
 delete mode 100644 meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.patch
 rename meta-oe/recipes-support/uim/{uim_1.3.1.bb => uim_1.8.6.bb} (90%)

diff --git a/meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.patch b/meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.patch
deleted file mode 100644
index 9e63683..0000000
--- a/meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e0e3f82bd2918fdcc722918c108bc33647a4805f Mon Sep 17 00:00:00 2001
-From: Leimaohui <leimaohui@cn.fujitsu.com>
-Date: Fri, 25 Oct 2013 18:31:22 +0900
-Subject: [PATCH] fix bug about stdlib
-
-Signed-off-by: leimaohui <leimaohui@cn.fujitsu.com>
----
- xim/locale.cpp    |    3 ++-
- xim/ximserver.cpp |    1 +
- 2 files changed, 3 insertions(+), 1 deletions(-)
-
-diff --git a/xim/locale.cpp b/xim/locale.cpp
-index 380e945..edfaf03 100644
---- a/xim/locale.cpp
-+++ b/xim/locale.cpp
-@@ -35,7 +35,8 @@
- #ifdef HAVE_CONFIG_H
- # include <config.h>
- #endif
--
-+#include <string.h>
-+#include <stdlib.h>
- #include <stdio.h>
- #include <locale.h>
- #include <iconv.h>
-diff --git a/xim/ximserver.cpp b/xim/ximserver.cpp
-index 245c5f8..cde9918 100644
---- a/xim/ximserver.cpp
-+++ b/xim/ximserver.cpp
-@@ -34,6 +34,7 @@
- # include <config.h>
- #endif
- 
-+#include <stdlib.h>
- #include <stdio.h>
- #include <ctype.h>
- #include <locale.h>
--- 
-1.7.1
-
diff --git a/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch b/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
index 61392c9..df82b07 100644
--- a/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
+++ b/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
@@ -1,28 +1,28 @@
-From 2e87c39ae3a00b8231ee21a54c47361c1bf502f7 Mon Sep 17 00:00:00 2001
-From: Leimaohui <leimaohui@cn.fujitsu.com>
-Date: Fri, 25 Oct 2013 18:23:12 +0900
+From 2918196ba782dfa4401bdca917ad4de1910505e0 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Fri, 21 Aug 2015 15:58:42 +0900
 Subject: [PATCH] fix bug for cross compile
 
-Signed-off-by: leimaohui <leimaohui@cn.fujitsu.com>
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
 ---
- configure.ac |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3b64593..57395d4 100644
+index 9be879c..9249bfd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -601,8 +601,8 @@ AC_HELP_STRING([--with-libedit[=DIR], Enable libedit support
-  if test "x$use_libedit" != "xno"; then
-      saved_CPPFLAGS=$CPPFLAGS
-      saved_LDFLAGS=$LDFLAGS
--     CPPFLAGS="${CPPFLAGS} -I$libedit_path/include"
--     LDFLAGS="${LDFLAGS} -L$libedit_path/lib"
-+     CPPFLAGS="${CPPFLAGS} "
-+     LDFLAGS="${LDFLAGS} "
-      AC_CHECK_LIB(edit, el_init,	
-      		[
- 		   LIBEDIT_LIBS="-ledit -lcurses -l$libedit_path/lib"
+@@ -1208,8 +1208,8 @@ AC_HELP_STRING([--with-libedit[=DIR], Enable libedit support
+ if test "x$use_libedit" != "xno"; then
+     saved_CPPFLAGS=$CPPFLAGS
+     saved_LDFLAGS=$LDFLAGS
+-    CPPFLAGS="${CPPFLAGS} -I$libedit_path/include"
+-    LDFLAGS="${LDFLAGS} -L$libedit_path/lib"
++    CPPFLAGS="${CPPFLAGS} "
++    LDFLAGS="${LDFLAGS} "
+     AC_CHECK_LIB(curses, tgetent, LIBEDIT_LIBS="-lcurses",
+         [AC_CHECK_LIB(ncurses, tgetent, LIBEDIT_LIBS="-lncurses",
+             AC_MSG_WARN("libedit needs libcurses or libncurses. disabled...")
 -- 
-1.7.1
+1.8.4.2
 
diff --git a/meta-oe/recipes-support/uim/uim_1.3.1.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
similarity index 90%
rename from meta-oe/recipes-support/uim/uim_1.3.1.bb
rename to meta-oe/recipes-support/uim/uim_1.8.6.bb
index 2232405..8f3797f 100644
--- a/meta-oe/recipes-support/uim/uim_1.3.1.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -1,17 +1,17 @@
 DESCRIPTION = "A multilingual user input method library"
 HOMEPAGE = "http://uim.freedesktop.org/"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause & LGPLv2+"
 SECTION = "inputmethods"
 
 SRC_URI = "http://uim.googlecode.com/files/uim-${PV}.tar.bz2 \
-           file://0001-fix-bug-about-stdlib.patch "
+          "
 
 SRC_URI_append_class-target = "file://uim-module-manager.patch \
                                file://0001-fix-bug-for-cross-compile.patch"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=9c372efbeca58ce22017a29c1ebf8bf0"
-SRC_URI[md5sum] = "2832e23d4778bbacbfa4b49bf642d667"
-SRC_URI[sha256sum] = "ed2cfa15018a4fd2557e875f66fcb3f0b9dabe12fa0700aa2f11cca69c2cb256"
+LIC_FILES_CHKSUM = "file://COPYING;md5=32463fd29aa303fb2360faeeae17256b"
+SRC_URI[md5sum] = "ecea4c597bab1fd4ba98ea84edcece59"
+SRC_URI[sha256sum] = "7b1ea803c73f3478917166f04f67cce6e45ad7ea5ab6df99b948c17eb1cb235f"
 
 DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
 DEPENDS_class-target += "gtk+ uim-native takao-fonts"
@@ -33,6 +33,11 @@ EXTRA_OECONF += "--disable-emacs \
 
 CONFIGUREOPTS_remove_class-target = "--disable-silent-rules"
 
+#Because m4 file's find maxdepth=2, so copy the m4 files of the deep depth.
+do_configure_prepend () {
+    cp ${S}/sigscheme/m4/* ${S}/m4/
+}
+
 PACKAGES += "uim-xim uim-utils uim-skk uim-gtk2.0 uim-fep uim-common uim-anthy libuim0 libuim-dev"
 
 FILES_libuim0 = "${libdir}/uim/plugin/libuim-custom-enabler.* \
-- 
1.8.4.2


