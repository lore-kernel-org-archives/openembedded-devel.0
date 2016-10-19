Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id AA30B719A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:38:42 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id r16so1418043pfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vf2LSnvCu0dD6gcUjKY2J/TY0IcqePuddhxNt9cT86o=;
	b=eW+0eoa5Rz8QX4yTw+lwR+8f01Ce2gLBuZZ4MFFD2FC67BvOGdBHnmh/hcH15Ctjbh
	Q1nWngXE15B6rxJrVVf5BNTYbDe0wHJiVIagrSl7g83romdPEVjBX+ZM7H2+SgGxIZxd
	HZUv1bSvhgwmzttlqsNpZZd3CARP/C1tQDcTJaOvXF7+LA/eGqk47q3C+uuK8PnS11Fc
	1SQrLB5C5Hh+4MnV9zHb0sM5B4Ter2tog3fZZUiFKJ9McbPv2EfOic9t7jR9X012SyNo
	nNmzhL7Gj4/t7HP3wNaFoBpzJsTufUMJjR9qsMYY5VeD7RS7optKfHaOeF8OJJvXVtBZ
	GVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vf2LSnvCu0dD6gcUjKY2J/TY0IcqePuddhxNt9cT86o=;
	b=dQwwYkTw1pUSYtuu5e0fh8ti/AXroqOKZWwnPyknyGIIWL2jIy2xJc1R/YfWsRBAlJ
	GTQQuiStyt/RrQ1b27VEjKNgF5DuBM0Fls9lv1V/6/sUmK2nxR3GDIsFJxZ5HIbs8D5a
	UntaSne63k8eunRiCFMCtmc/i8JQ37KDJIDAylYeo2vu6XhjRC1QTrh5OygwLsUtJ/rq
	DKcLAvW0+zuAXnm4tQvGonkSj1wsNh6vX7n6BSuwurbwOf3r1Fh15HI+jmAUHhuXwVvv
	u/8IWgFOXXUuEZOlu78iK0AVCXmy4zHp4TYKJgvo8/rTikvEp/POpK9wVkV+byIwOS3s
	O0Pw==
X-Gm-Message-State: AA6/9Rn/H1DIJbQmxNmwhmQgPJUC59lawJJIGzYBFu0YLckeZ9fLS5tZczJoVBrFSAgU6w==
X-Received: by 10.99.9.129 with SMTP id 123mr6412768pgj.84.1476855524370;
	Tue, 18 Oct 2016 22:38:44 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qd12sm60099564pab.22.2016.10.18.22.38.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 22:38:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 22:38:21 -0700
Message-Id: <20161019053834.11523-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/16] libmbim: Fix build with clang
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
X-List-Received-Date: Wed, 19 Oct 2016 05:38:42 -0000

We need to check for clang in configure so
the warning options can be added surgically
depending upon compiler type

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libmbim/libmbim/clang.patch                    | 73 ++++++++++++++++++++++
 .../recipes-connectivity/libmbim/libmbim_1.14.0.bb |  4 +-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libmbim/libmbim/clang.patch

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim/clang.patch b/meta-oe/recipes-connectivity/libmbim/libmbim/clang.patch
new file mode 100644
index 0000000..92e657c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim/clang.patch
@@ -0,0 +1,73 @@
+Check for clang compiler since we need to disable
+unused-function warning for clang, at same time
+pass werror when checking for compiler options if
+werror is enabled so spurious options do not get
+enabled. Only the ones that are supported by given
+compiler are accepted.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: libmbim-1.14.0/m4/compiler-warnings.m4
+===================================================================
+--- libmbim-1.14.0.orig/m4/compiler-warnings.m4
++++ libmbim-1.14.0/m4/compiler-warnings.m4
+@@ -2,10 +2,30 @@ AC_DEFUN([LIBMBIM_COMPILER_WARNINGS],
+ [AC_ARG_ENABLE(more-warnings,
+ 	AS_HELP_STRING([--enable-more-warnings], [Possible values: no/yes/error]),
+ 	set_more_warnings="$enableval",set_more_warnings=error)
++
++# Clang throws a lot of warnings when it does not understand a flag. Disable
++# this warning for now so other warnings are visible.
++AC_MSG_CHECKING([if compiling with clang])
++AC_COMPILE_IFELSE([AC_LANG_PROGRAM([], [[
++#ifndef __clang__
++	not clang
++#endif
++	]])],
++	[CLANG=yes],
++	[CLANG=no]
++)
++AC_MSG_RESULT([$CLANG])
++AS_IF([test "x$CLANG" = "xyes"], [CLANG_FLAGS=-Wno-error=unused-function])
++CFLAGS="$CFLAGS $CLANG_FLAGS"
++LDFLAGS="$LDFLAGS $CLANG_FLAGS"
++
+ AC_MSG_CHECKING(for more warnings)
+ if test "$GCC" = "yes" -a "$set_more_warnings" != "no"; then
+ 	AC_MSG_RESULT(yes)
+ 	CFLAGS="-Wall -std=gnu89 $CFLAGS"
++	if test "x$set_more_warnings" = xerror; then
++		WERROR="-Werror"
++	fi
+ 
+ 	for option in -Wmissing-declarations -Wmissing-prototypes \
+ 		      -Wdeclaration-after-statement -Wstrict-prototypes \
+@@ -17,22 +37,23 @@ if test "$GCC" = "yes" -a "$set_more_war
+ 		      -Wmissing-include-dirs -Waggregate-return \
+ 		      -Wformat-security; do
+ 		SAVE_CFLAGS="$CFLAGS"
+-		CFLAGS="$CFLAGS $option"
++		CFLAGS="$CFLAGS $option $WERROR"
+ 		AC_MSG_CHECKING([whether gcc understands $option])
+ 		AC_TRY_COMPILE([], [],
+ 			has_option=yes,
+ 			has_option=no,)
+ 		if test $has_option = no; then
+ 			CFLAGS="$SAVE_CFLAGS"
++		else
++			CFLAGS="$SAVE_CFLAGS $option"
+ 		fi
+ 		AC_MSG_RESULT($has_option)
+ 		unset has_option
+ 		unset SAVE_CFLAGS
+ 	done
++	CFLAGS="$CFLAGS $WERROR"
+ 	unset option
+-	if test "x$set_more_warnings" = xerror; then
+-		CFLAGS="$CFLAGS -Werror"
+-	fi
++	unset WERROR
+ else
+ 	AC_MSG_RESULT(no)
+ fi
diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
index 0a8aaaf..02a1788 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
@@ -11,6 +11,8 @@ DEPENDS = "glib-2.0 libgudev"
 
 inherit autotools pkgconfig bash-completion
 
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
+           file://clang.patch \
+"
 SRC_URI[md5sum] = "2ed809e65c85353d3ab59e372890e549"
 SRC_URI[sha256sum] = "ca8d52a95a18cbabae8f15f83f1572316e888b6504f946e6645d24405127ab5b"
-- 
2.10.0


