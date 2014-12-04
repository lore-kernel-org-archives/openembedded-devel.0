Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D0180601F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Dec 2014 06:38:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44484919"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Dec 2014 14:34:57 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB46br88015922
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Dec 2014 14:37:53 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 4 Dec 2014 14:38:12 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Dec 2014 14:37:02 +0800
Message-ID: <1417675022-7660-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [PATCH] nana: add new recipe
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
X-List-Received-Date: Thu, 04 Dec 2014 06:38:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

GNU Nana is a free library providing improved support for assertion
checking (as in assert.h) and logging (printf style debugging) in
GNU C and C++.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../nana/nana/change-mandir-to-DESTDIR.patch       |  40 ++++++
 .../modify-acinclude.m4-and-configure.in.patch     | 147 +++++++++++++++++=
++++
 meta-oe/recipes-extended/nana/nana_2.5.bb          |  29 ++++
 3 files changed, 216 insertions(+)
 create mode 100644 meta-oe/recipes-extended/nana/nana/change-mandir-to-DES=
TDIR.patch
 create mode 100644 meta-oe/recipes-extended/nana/nana/modify-acinclude.m4-=
and-configure.in.patch
 create mode 100644 meta-oe/recipes-extended/nana/nana_2.5.bb

diff --git a/meta-oe/recipes-extended/nana/nana/change-mandir-to-DESTDIR.pa=
tch b/meta-oe/recipes-extended/nana/nana/change-mandir-to-DESTDIR.patch
new file mode 100644
index 0000000..653a7e4
--- /dev/null
+++ b/meta-oe/recipes-extended/nana/nana/change-mandir-to-DESTDIR.patch
@@ -0,0 +1,40 @@
+From 7b04c4873c0a4510bdaf9145bf01ca34b3549fdb Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Thu, 4 Dec 2014 03:50:19 +0900
+Subject: [PATCH 1/2] change mandir to DESTDIR
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ man/Makefile.am | 2 +-
+ man/Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/man/Makefile.am b/man/Makefile.am
+index 80d24d8..944bc57 100644
+--- a/man/Makefile.am
++++ b/man/Makefile.am
+@@ -16,5 +16,5 @@ install-data-local:
+ 	@sect=3D1;				\
+ 	inst=3D`echo "nana" | sed '$(transform)'`.1; \
+ 	echo installing nana.1 as $(mandir)/man$$sect/$$inst; \
+-	$(INSTALL_DATA) $(srcdir)/nana.1 $(mandir)/man$$sect/$$inst
++	$(INSTALL_DATA) $(srcdir)/nana.1 $(DESTDIR)$(mandir)/man$$sect/$$inst
+=20
+diff --git a/man/Makefile.in b/man/Makefile.in
+index 6008b20..64bb84c 100644
+--- a/man/Makefile.in
++++ b/man/Makefile.in
+@@ -274,7 +274,7 @@ install-data-local:
+ 	@sect=3D1;				\
+ 	inst=3D`echo "nana" | sed '$(transform)'`.1; \
+ 	echo installing nana.1 as $(mandir)/man$$sect/$$inst; \
+-	$(INSTALL_DATA) $(srcdir)/nana.1 $(mandir)/man$$sect/$$inst
++	$(INSTALL_DATA) $(srcdir)/nana.1 $(DESTDIR)$(mandir)/man$$sect/$$inst
+=20
+ # Tell versions [3.59,3.63) of GNU make to not export all variables.
+ # Otherwise a system limit (for SysV at least) may be exceeded.
+--=20
+1.8.4.2
+
diff --git a/meta-oe/recipes-extended/nana/nana/modify-acinclude.m4-and-con=
figure.in.patch b/meta-oe/recipes-extended/nana/nana/modify-acinclude.m4-an=
d-configure.in.patch
new file mode 100644
index 0000000..b893622
--- /dev/null
+++ b/meta-oe/recipes-extended/nana/nana/modify-acinclude.m4-and-configure.=
in.patch
@@ -0,0 +1,147 @@
+From c55540b83a3833ad3b1500810056f628e5a190a5 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Thu, 4 Dec 2014 03:55:07 +0900
+Subject: [PATCH 2/2] modify acinclude.m4 and configure.in
+
+this patch is from Debian to fix build errors.
+"acinclude.m4:34: error: automatic de-ANSI-fication
+support has been removed"
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ acinclude.m4 | 89 -------------------------------------------------------=
-----
+ configure.in | 12 ++++++++
+ 2 files changed, 12 insertions(+), 89 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index e9e5500..c7c1ccb 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -20,92 +20,3 @@ else
+ fi
+ AC_SUBST($1)
+ ])
+-#####
+-# And the old macros from the automake distribution
+-#
+-#
+-# Copyright (C) 1992, 1994, 1995 Free Software Foundation, Inc.
+-# Fran=C3=A7ois Pinard <pinard@iro.umontreal.ca>, 1992.
+-
+-## ------------------------------- ##
+-## Check for function prototypes.  ##
+-## ------------------------------- ##
+-
+-AC_DEFUN(fp_C_PROTOTYPES,
+-[AC_REQUIRE([AM_PROG_CC_STDC])
+-AC_MSG_CHECKING([for function prototypes])
+-if test "$ac_cv_prog_cc_stdc" !=3D no; then
+-  AC_MSG_RESULT(yes)
+-  AC_DEFINE(PROTOTYPES)
+-  U=3D ANSI2KNR=3D
+-else
+-  AC_MSG_RESULT(no)
+-  U=3D_ ANSI2KNR=3D./ansi2knr
+-fi
+-AC_SUBST(U)dnl
+-AC_SUBST(ANSI2KNR)dnl
+-])
+-
+-## ----------------------------------------- ##
+-## ANSIfy the C compiler whenever possible.  ##
+-## ----------------------------------------- ##
+-
+-# @defmac AC_PROG_CC_STDC
+-# @maindex PROG_CC_STDC
+-# @ovindex CC
+-# If the C compiler in not in ANSI C mode by default, try to add an optio=
n
+-# to output variable @code{CC} to make it so.  This macro tries various
+-# options that select ANSI C on some system or another.  It considers the
+-# compiler to be in ANSI C mode if it defines @code{__STDC__} to 1 and
+-# handles function prototypes correctly.
+-#
+-# If you use this macro, you should check after calling it whether the C
+-# compiler has been set to accept ANSI C; if not, the shell variable
+-# @code{ac_cv_prog_cc_stdc} is set to @samp{no}.  If you wrote your sourc=
e
+-# code in ANSI C, you can make an un-ANSIfied copy of it by using the
+-# program @code{ansi2knr}, which comes with Ghostscript.
+-# @end defmac
+-
+-AC_DEFUN(fp_PROG_CC_STDC,
+-[AC_MSG_CHECKING(for ${CC-cc} option to accept ANSI C)
+-AC_CACHE_VAL(ac_cv_prog_cc_stdc,
+-[ac_cv_prog_cc_stdc=3Dno
+-ac_save_CFLAGS=3D"$CFLAGS"
+-# Don't try gcc -ansi; that turns off useful extensions and
+-# breaks some systems' header files.
+-# AIX			-qlanglvl=3Dansi
+-# Ultrix and OSF/1	-std1
+-# HP-UX			-Aa -D_HPUX_SOURCE
+-# SVR4			-Xc
+-for ac_arg in "" -qlanglvl=3Dansi -std1 "-Aa -D_HPUX_SOURCE" -Xc
+-do
+-  CFLAGS=3D"$ac_save_CFLAGS $ac_arg"
+-  AC_TRY_COMPILE(
+-[#if !defined(__STDC__) || __STDC__ !=3D 1
+-choke me
+-#endif
+-], [int test (int i, double x);
+-struct s1 {int (*f) (int a);};
+-struct s2 {int (*f) (double a);};],
+-[ac_cv_prog_cc_stdc=3D"$ac_arg"; break])
+-done
+-CFLAGS=3D"$ac_save_CFLAGS"
+-])
+-AC_MSG_RESULT($ac_cv_prog_cc_stdc)
+-case "x$ac_cv_prog_cc_stdc" in
+-  x|xno) ;;
+-  *) CC=3D"$CC $ac_cv_prog_cc_stdc" ;;
+-esac
+-])
+-
+-## --------------------------------------------------------- ##
+-## Use AC_PROG_INSTALL, supplementing it with INSTALL_SCRIPT ##
+-## substitution.                                             ##
+-## --------------------------------------------------------- ##
+-
+-AC_DEFUN(fp_PROG_INSTALL,
+-[AC_PROG_INSTALL
+-test -z "$INSTALL_SCRIPT" && INSTALL_SCRIPT=3D'${INSTALL} -m 755'
+-AC_SUBST(INSTALL_SCRIPT)dnl
+-])
+-
+diff --git a/configure.in b/configure.in
+index 6b25ed5..a6a7f5b 100644
+--- a/configure.in
++++ b/configure.in
+@@ -103,6 +103,12 @@ nana_DEFINE(DI_MAKE_VALID_BREAKPOINT,(exprn),
+   sparc-*-*|i?86-*-*)
+     DI_MAKE_VALID_BREAKPOINT=3D'asm("nop")'
+     ;;
++  arm*-*-*|frv-*-*|mips*-*-*)
++    DI_MAKE_VALID_BREAKPOINT=3D'asm("nop")'
++    ;;
++  sh*-*-*)
++    DI_MAKE_VALID_BREAKPOINT=3D'asm("nop\n\tnop\n\t")'
++    ;;
+   esac
+ ])
+=20
+@@ -113,6 +119,12 @@ nana_DEFINE(DL_MAKE_VALID_BREAKPOINT,(),
+   sparc-*-*|i?86-*-*)
+     DL_MAKE_VALID_BREAKPOINT=3D'asm("nop")'
+     ;;
++  arm*-*-*|frv-*-*|mips*-*-*)
++    DL_MAKE_VALID_BREAKPOINT=3D'asm("nop")'
++    ;;
++  sh*-*-*)
++    DL_MAKE_VALID_BREAKPOINT=3D'asm("nop\n\tnop\n\t")'
++    ;;
+   esac
+ ])
+=20
+--=20
+1.8.4.2
+
diff --git a/meta-oe/recipes-extended/nana/nana_2.5.bb b/meta-oe/recipes-ex=
tended/nana/nana_2.5.bb
new file mode 100644
index 0000000..1715820
--- /dev/null
+++ b/meta-oe/recipes-extended/nana/nana_2.5.bb
@@ -0,0 +1,29 @@
+SUMMARY =3D "Support for assertion checking and logging in GNU C/C++"
+DESCRIPTION =3D "GNU Nana is a free library providing improved support for=
 assertion\
+checking (as in assert.h) and logging (printf style debugging) in \
+GNU C and C++."
+SECTION =3D "Development/Languages/C and C++"
+
+SRC_URI =3D "http://download.savannah.gnu.org/releases/${PN}/${BP}.tar.gz =
\
+    file://change-mandir-to-DESTDIR.patch \
+    file://modify-acinclude.m4-and-configure.in.patch"
+SRC_URI[md5sum] =3D "66c88aa0ad095b2e67673773135475f1"
+SRC_URI[sha256sum] =3D "fd1819ffea94b209513959447e4802afe2719600e7d161cd78=
b265a42812affa"
+
+LICENSE =3D "BSD-2-Clause"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D16aa57f3b7fdda870cee597275bd5d1=
1"
+
+inherit autotools-brokensep pkgconfig
+
+EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
+
+FILES_${PN} +=3D "/usr/share"
+
+do_configure_prepend_virtclass-nativesdk() {
+    sed -i -e 's:@CPP@:\$\{CXX\} \$\{CXXFLAGS\} \-E:g' ${S}/src/nana.in
+    sed -i -e 's:@CC@:\$\{CC\} \$\{CFLAGS\} \-E:g' ${S}/src/nana-clg.in
+    sed -i -e 's:@CXX@::g' ${S}/src/nana-c++lg.in
+    sed -i -e 's:@GDB@:\$\{GDB\}:g' ${S}/src/nana-run.in
+}
+BBCLASSEXTEND =3D "native nativesdk"
--=20
1.8.4.2


