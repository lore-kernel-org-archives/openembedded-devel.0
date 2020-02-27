Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2C0856121C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 06:02:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,490,1574092800"; d="scan'208";a="84484447"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Feb 2020 14:02:45 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 6369C50A997C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 13:52:55 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 27 Feb 2020 14:02:38 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 27 Feb 2020 14:02:47 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Feb 2020 04:43:18 -0800
Message-ID: <1582807398-13955-8-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582807398-13955-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582807398-13955-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 6369C50A997C.A495C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] libmbim: upgrade 1.20.4 -> 1.22.0
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
X-List-Received-Date: Thu, 27 Feb 2020 06:02:43 -0000
Content-Type: text/plain

clang.patch
Revemod since the file of this patch is non-existent.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libmbim/libmbim/clang.patch               | 73 -------------------
 .../{libmbim_1.20.4.bb => libmbim_1.22.0.bb}  |  9 +--
 2 files changed, 4 insertions(+), 78 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libmbim/libmbim/clang.patch
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.20.4.bb => libmbim_1.22.0.bb} (76%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim/clang.patch b/meta-oe/recipes-connectivity/libmbim/libmbim/clang.patch
deleted file mode 100644
index d88578418..000000000
--- a/meta-oe/recipes-connectivity/libmbim/libmbim/clang.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-Check for clang compiler since we need to disable
-unused-function warning for clang, at same time
-pass werror when checking for compiler options if
-werror is enabled so spurious options do not get
-enabled. Only the ones that are supported by given
-compiler are accepted.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: libmbim-1.14.0/m4/compiler-warnings.m4
-===================================================================
---- libmbim-1.14.0.orig/m4/compiler-warnings.m4
-+++ libmbim-1.14.0/m4/compiler-warnings.m4
-@@ -2,10 +2,30 @@ AC_DEFUN([LIBMBIM_COMPILER_WARNINGS],
- [AC_ARG_ENABLE(more-warnings,
- 	AS_HELP_STRING([--enable-more-warnings], [Possible values: no/yes/error]),
- 	set_more_warnings="$enableval",set_more_warnings=error)
-+
-+# Clang throws a lot of warnings when it does not understand a flag. Disable
-+# this warning for now so other warnings are visible.
-+AC_MSG_CHECKING([if compiling with clang])
-+AC_COMPILE_IFELSE([AC_LANG_PROGRAM([], [[
-+#ifndef __clang__
-+	not clang
-+#endif
-+	]])],
-+	[CLANG=yes],
-+	[CLANG=no]
-+)
-+AC_MSG_RESULT([$CLANG])
-+AS_IF([test "x$CLANG" = "xyes"], [CLANG_FLAGS=-Wno-error=unused-function])
-+CFLAGS="$CFLAGS $CLANG_FLAGS"
-+LDFLAGS="$LDFLAGS $CLANG_FLAGS"
-+
- AC_MSG_CHECKING(for more warnings)
- if test "$GCC" = "yes" -a "$set_more_warnings" != "no"; then
- 	AC_MSG_RESULT(yes)
- 	CFLAGS="-Wall -std=gnu89 $CFLAGS"
-+	if test "x$set_more_warnings" = xerror; then
-+		WERROR="-Werror"
-+	fi
- 
- 	for option in -Wmissing-declarations -Wmissing-prototypes \
- 		      -Wdeclaration-after-statement -Wstrict-prototypes \
-@@ -17,22 +37,23 @@ if test "$GCC" = "yes" -a "$set_more_war
- 		      -Wmissing-include-dirs -Waggregate-return \
- 		      -Wformat-security -Wtype-limits; do
- 		SAVE_CFLAGS="$CFLAGS"
--		CFLAGS="$CFLAGS $option"
-+		CFLAGS="$CFLAGS $option $WERROR"
- 		AC_MSG_CHECKING([whether gcc understands $option])
- 		AC_TRY_COMPILE([], [],
- 			has_option=yes,
- 			has_option=no,)
- 		if test $has_option = no; then
- 			CFLAGS="$SAVE_CFLAGS"
-+		else
-+			CFLAGS="$SAVE_CFLAGS $option"
- 		fi
- 		AC_MSG_RESULT($has_option)
- 		unset has_option
- 		unset SAVE_CFLAGS
- 	done
-+	CFLAGS="$CFLAGS $WERROR"
- 	unset option
--	if test "x$set_more_warnings" = xerror; then
--		CFLAGS="$CFLAGS -Werror"
--	fi
-+	unset WERROR
- else
- 	AC_MSG_RESULT(no)
- fi
diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.20.4.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.22.0.bb
similarity index 76%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.20.4.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.22.0.bb
index a3ef80c1b..61e314f1f 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.20.4.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.22.0.bb
@@ -11,8 +11,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libgudev"
 
 inherit autotools pkgconfig bash-completion
 
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
-           file://clang.patch \
-"
-SRC_URI[md5sum] = "d38d637e33cde8a91484f53a9f6c4d49"
-SRC_URI[sha256sum] = "ac2708a409b09f1f6f1786a8a9e39c36619aa8d6f285ea943daa7a48ea36d3e8"
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "87060e8957013177e4140edc6f64f5bd"
+SRC_URI[sha256sum] = "5c0778eb1cd12c3604523134e55183f5147b0cae71150e875b583768f7aa1f38"
-- 
2.17.1




