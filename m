Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 146687C6F7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 13:13:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46VGLD06CTzK2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 15:13:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568380436;
	bh=2i/XOwNF3eXIL+/uy5CqcSgIXB22bKu/Txcwqx/yyzI=;
	h=From:To:Subject:Date:From;
	b=W4V7wSoX056+C6dwnbUuHBXQGjBwHu9zMRDM9GP67mlseO36Jed2c2tsN4SPtBud6
	3eWl9xm6FqRDzVPah6S+4pJAj9IsIhg4FG01srYJyrZe8/cGQjauzC0sttbD6y+P3Z
	NvrEQJpTNvEBfMatsarKa+sXwuun62SeoGz3mDKRVGOJqSwz/D9T79R7C06eZ8uJOf
	2A4EXId/5PSUzEc7jN1QjBCuVQ3iyP9eq41wOfNRRmHMqOOe41CvwT4X83YxUYhz8b
	LYxbOAYob+mOhrwzdtiivX03c9fK2TAVKedQlSLgKArLHgA9YlzEMz1bY6+2LcdSNU
	EgphsE0xEZTmirgpjuQSVdiJ7HUyNAZpyzRlMDycPsyYSeX6mn9pzmwRQsDglxKxEw
	9zokVROkslrdIBTf9AL56f0CekSlT8P2RMSlmTrJ5JXu6NUGX0Dh33gRm9zklmCUuE
	IWgkcdk356wm+/I63QG/ZrhsP9oHyP7vBjNOT3qpM87TVHcHv2MukB3B9/slRLZbpP
	BMTLlVz5KFIexbFtOFDzKm6MxEN8kkGfCBu5Lbu9Ll6NXdnF3hwr18xNvErmBDaK8o
	fKvGA67pLPRt5KN+SHEH8uaEKcGru2kpLI86lyv59ICItNRbLUlOpAZqU10UVCKXW4
	iwTXzJD1BWZCLLNjzWt3IUzk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 16:13:54 +0300
Message-Id: <20190913131354.18199-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libqmi: Replace clang patch with configure option
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
X-List-Received-Date: Fri, 13 Sep 2019 13:13:56 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libqmi/libqmi/0001-Detect-clang.patch     | 85 -------------------
 .../libqmi/libqmi_1.22.2.bb                   |  2 +-
 2 files changed, 1 insertion(+), 86 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch b/meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch
deleted file mode 100644
index 7a3429b9d..000000000
--- a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 4cfb728804157e8f3c69e11ba4df449d8f76388f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 20 Oct 2016 04:42:26 +0000
-Subject: [PATCH] Detect clang
-
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
----
- m4/compiler-warnings.m4 | 29 +++++++++++++++++++++++++----
- 1 file changed, 25 insertions(+), 4 deletions(-)
-
-diff --git a/m4/compiler-warnings.m4 b/m4/compiler-warnings.m4
-index de4a8b0..e4ba718 100644
---- a/m4/compiler-warnings.m4
-+++ b/m4/compiler-warnings.m4
-@@ -2,10 +2,30 @@ AC_DEFUN([LIBQMI_COMPILER_WARNINGS],
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
-@@ -17,22 +37,23 @@ if test "$GCC" = "yes" -a "$set_more_warnings" != "no"; then
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
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb
index da13286b4..3b2fe51bb 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb
@@ -12,7 +12,6 @@ DEPENDS = "glib-2.0 glib-2.0-native"
 inherit autotools pkgconfig bash-completion
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
-           file://0001-Detect-clang.patch \
            "
 SRC_URI[md5sum] = "3fd831c1b0de4a4432be628432a960ff"
 SRC_URI[sha256sum] = "f1f1e514a89b1dcba05cf7274895e7301a2da4c947b7c2f17acb84fc74038227"
@@ -21,3 +20,4 @@ PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
 PACKAGECONFIG[mbim] = "--enable-mbim-qmux,--disable-mbim-qmux,libmbim"
 
+EXTRA_OECONF_append_toolchain-clang = " --enable-more-warnings=no"
-- 
2.17.1


