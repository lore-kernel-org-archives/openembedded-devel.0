Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PozUz-0008VT-VU
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 15:33:58 +0100
Received: by bwz10 with SMTP id 10so5249326bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 06:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=kLlBDEIf7V8QbemQJCm/MIg/B8A2lQK00PVf36/6xjU=;
	b=ixzCklIWP9y1FfHoUUpYAaIEpaYCFJbMSPwNGuZ3TmB0j0Bzdg5fi9uooIxx/CDW1X
	YZi4s4BfCaCGA62PESxYhkl+Z34eec5EDdTA/QrbRnBH8ii7U2UEQ97h/fDtu2KQKOUx
	zxHPoqFHszJ1lKt6i3dPeOXukgvER8xFTrHdo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=wnA8ugJLhEfLxuTshh9UoPvBQpW4mkGs8CK+0oltGmD/OpOo1W6LBLBPmS64vVVMVj
	y6A0ZqpVnpngjpCiH9J8H05DXCC0iZTy74oX2mck1c6kUwLp2Sm0sT1/E1gT9AX0uBgc
	KyBQQDfMudySqHc/qVZJu0YinnQRTxs7VoxKg=
Received: by 10.204.52.138 with SMTP id i10mr3478219bkg.23.1297693965863;
	Mon, 14 Feb 2011 06:32:45 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f20sm1818099bkf.16.2011.02.14.06.32.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Feb 2011 06:32:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Feb 2011 15:32:34 +0100
Message-Id: <1297693958-25388-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 1/5] python: upgrade from 2.6.5 to 2.6.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Feb 2011 14:33:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../00-fix-bindir-libdir-for-cross.patch           |   20 ---
 .../python/python-2.6.5/00-fix-parallel-make.patch |   40 ------
 .../01-use-proper-tools-for-cross-build.patch      |  116 -----------------
 .../python-2.6.5/02-remove-test-for-cross.patch    |  106 ----------------
 .../python-2.6.5/03-fix-tkinter-detection.patch    |   40 ------
 .../python-2.6.5/04-default-is-optimized.patch     |   18 ---
 .../05-enable-ctypes-cross-build.patch             |   28 ----
 .../06-ctypes-libffi-fix-configure.patch           |   51 --------
 .../10-distutils-fix-swig-parameter.patch          |   16 ---
 .../11-distutils-never-modify-shebang-line.patch   |   18 ---
 ...2-distutils-prefix-is-inside-staging-area.patch |   60 ---------
 .../python-2.6.5/99-ignore-optimization-flag.patch |   18 ---
 recipes/python/python-2.6.5/debug.patch            |   27 ----
 recipes/python/python-2.6.5/ipv6-cross.patch       |   13 --
 recipes/python/python-2.6.5/nohostlibs.patch       |   53 --------
 recipes/python/python-2.6.5/sitecustomize.py       |   45 -------
 .../python/python-2.6.6/00-fix-parallel-make.patch |   40 ++++++
 .../01-use-proper-tools-for-cross-build.patch      |  116 +++++++++++++++++
 .../python-2.6.6/02-remove-test-for-cross.patch    |  106 ++++++++++++++++
 .../python-2.6.6/03-fix-tkinter-detection.patch    |   40 ++++++
 .../python-2.6.6/04-default-is-optimized.patch     |   57 +++++++++
 .../05-enable-ctypes-cross-build.patch             |   28 ++++
 .../06-ctypes-libffi-fix-configure.patch           |   51 ++++++++
 .../10-distutils-fix-swig-parameter.patch          |   16 +++
 .../11-distutils-never-modify-shebang-line.patch   |   18 +++
 ...2-distutils-prefix-is-inside-staging-area.patch |   60 +++++++++
 recipes/python/python-2.6.6/debug.patch            |   27 ++++
 recipes/python/python-2.6.6/ipv6-cross.patch       |   13 ++
 recipes/python/python-2.6.6/nohostlibs.patch       |   57 +++++++++
 recipes/python/python-2.6.6/sitecustomize.py       |   45 +++++++
 recipes/python/python-native_2.6.5.bb              |   45 -------
 recipes/python/python-native_2.6.6.bb              |   44 +++++++
 recipes/python/python_2.6.5.bb                     |  134 --------------------
 recipes/python/python_2.6.6.bb                     |  132 +++++++++++++++++++
 34 files changed, 850 insertions(+), 848 deletions(-)
 delete mode 100644 recipes/python/python-2.6.5/00-fix-bindir-libdir-for-cross.patch
 delete mode 100644 recipes/python/python-2.6.5/00-fix-parallel-make.patch
 delete mode 100644 recipes/python/python-2.6.5/01-use-proper-tools-for-cross-build.patch
 delete mode 100644 recipes/python/python-2.6.5/02-remove-test-for-cross.patch
 delete mode 100644 recipes/python/python-2.6.5/03-fix-tkinter-detection.patch
 delete mode 100644 recipes/python/python-2.6.5/04-default-is-optimized.patch
 delete mode 100644 recipes/python/python-2.6.5/05-enable-ctypes-cross-build.patch
 delete mode 100644 recipes/python/python-2.6.5/06-ctypes-libffi-fix-configure.patch
 delete mode 100644 recipes/python/python-2.6.5/10-distutils-fix-swig-parameter.patch
 delete mode 100644 recipes/python/python-2.6.5/11-distutils-never-modify-shebang-line.patch
 delete mode 100644 recipes/python/python-2.6.5/12-distutils-prefix-is-inside-staging-area.patch
 delete mode 100644 recipes/python/python-2.6.5/99-ignore-optimization-flag.patch
 delete mode 100644 recipes/python/python-2.6.5/debug.patch
 delete mode 100644 recipes/python/python-2.6.5/ipv6-cross.patch
 delete mode 100644 recipes/python/python-2.6.5/nohostlibs.patch
 delete mode 100644 recipes/python/python-2.6.5/sitecustomize.py
 create mode 100644 recipes/python/python-2.6.6/00-fix-parallel-make.patch
 create mode 100644 recipes/python/python-2.6.6/01-use-proper-tools-for-cross-build.patch
 create mode 100644 recipes/python/python-2.6.6/02-remove-test-for-cross.patch
 create mode 100644 recipes/python/python-2.6.6/03-fix-tkinter-detection.patch
 create mode 100644 recipes/python/python-2.6.6/04-default-is-optimized.patch
 create mode 100644 recipes/python/python-2.6.6/05-enable-ctypes-cross-build.patch
 create mode 100644 recipes/python/python-2.6.6/06-ctypes-libffi-fix-configure.patch
 create mode 100644 recipes/python/python-2.6.6/10-distutils-fix-swig-parameter.patch
 create mode 100644 recipes/python/python-2.6.6/11-distutils-never-modify-shebang-line.patch
 create mode 100644 recipes/python/python-2.6.6/12-distutils-prefix-is-inside-staging-area.patch
 create mode 100644 recipes/python/python-2.6.6/debug.patch
 create mode 100644 recipes/python/python-2.6.6/ipv6-cross.patch
 create mode 100644 recipes/python/python-2.6.6/nohostlibs.patch
 create mode 100644 recipes/python/python-2.6.6/sitecustomize.py
 delete mode 100644 recipes/python/python-native_2.6.5.bb
 create mode 100644 recipes/python/python-native_2.6.6.bb
 delete mode 100644 recipes/python/python_2.6.5.bb
 create mode 100644 recipes/python/python_2.6.6.bb

diff --git a/recipes/python/python-2.6.5/00-fix-bindir-libdir-for-cross.patch b/recipes/python/python-2.6.5/00-fix-bindir-libdir-for-cross.patch
deleted file mode 100644
index 2559e3a..0000000
--- a/recipes/python/python-2.6.5/00-fix-bindir-libdir-for-cross.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-# $(exec_prefix) points to the wrong directory, when installing
-# a cross-build. @bindir@ and @libdir@ works better and doesn't
-# affect the native build.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.6.1/Makefile.pre.in
-===================================================================
---- Python-2.6.1.orig/Makefile.pre.in
-+++ Python-2.6.1/Makefile.pre.in
-@@ -86,8 +86,8 @@ exec_prefix=	@exec_prefix@
- datarootdir=    @datarootdir@
- 
- # Expanded directories
--BINDIR=		$(exec_prefix)/bin
--LIBDIR=		$(exec_prefix)/lib
-+BINDIR=		@bindir@
-+LIBDIR=		@libdir@
- MANDIR=		@mandir@
- INCLUDEDIR=	@includedir@
- CONFINCLUDEDIR=	$(exec_prefix)/include
diff --git a/recipes/python/python-2.6.5/00-fix-parallel-make.patch b/recipes/python/python-2.6.5/00-fix-parallel-make.patch
deleted file mode 100644
index c80ca19..0000000
--- a/recipes/python/python-2.6.5/00-fix-parallel-make.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-upstream: <http://bugs.python.org/issue10013>
-comment: As in the comment in the issue tracker this is fixed for py3k a little differently <http://svn.python.org/view?view=rev&revision=84068>. This patch is taken from Fedora.
-
-diff -up Python-2.7/Makefile.pre.in.fix-parallel-make Python-2.7/Makefile.pre.in
---- Python-2.7/Makefile.pre.in.fix-parallel-make	2010-07-22 15:01:39.567996932 -0400
-+++ Python-2.7/Makefile.pre.in	2010-07-22 15:47:02.437998509 -0400
-@@ -197,6 +197,7 @@ SIGNAL_OBJS=	@SIGNAL_OBJS@
- 
- ##########################################################################
- # Grammar
-+GRAMMAR_STAMP=	$(srcdir)/grammar-stamp
- GRAMMAR_H=	$(srcdir)/Include/graminit.h
- GRAMMAR_C=	$(srcdir)/Python/graminit.c
- GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
-@@ -514,10 +515,24 @@ Modules/getpath.o: $(srcdir)/Modules/get
- Modules/python.o: $(srcdir)/Modules/python.c
- 	$(MAINCC) -c $(PY_CFLAGS) -o $@ $(srcdir)/Modules/python.c
- 
-+# GNU "make" interprets rules with two dependents as two copies of the rule.
-+# 
-+# In a parallel build this can lead to pgen being run twice, once for each of
-+# GRAMMAR_H and GRAMMAR_C, leading to race conditions in which the compiler
-+# reads a partially-overwritten copy of one of these files, leading to syntax
-+# errors (or linker errors if the fragment happens to be syntactically valid C)
-+#
-+# See http://www.gnu.org/software/hello/manual/automake/Multiple-Outputs.html
-+# for more information.
-+#
-+# Introduce ".grammar-stamp" as a contrived single output from PGEN to avoid
-+# this:
-+$(GRAMMAR_H) $(GRAMMAR_C): $(GRAMMAR_STAMP)
- 
--$(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
-+$(GRAMMAR_STAMP): $(PGEN) $(GRAMMAR_INPUT)
- 		-@$(INSTALL) -d Include
- 		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+		touch $(GRAMMAR_STAMP)
- 
- $(PGEN):	$(PGENOBJS)
- 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
diff --git a/recipes/python/python-2.6.5/01-use-proper-tools-for-cross-build.patch b/recipes/python/python-2.6.5/01-use-proper-tools-for-cross-build.patch
deleted file mode 100644
index 4b485ec..0000000
--- a/recipes/python/python-2.6.5/01-use-proper-tools-for-cross-build.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-# We need to ensure our host tools get run during build, not the freshly
-# built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.6.1/Makefile.pre.in
-===================================================================
---- Python-2.6.1.orig/Makefile.pre.in
-+++ Python-2.6.1/Makefile.pre.in
-@@ -175,6 +175,7 @@ UNICODE_OBJS=   @UNICODE_OBJS@
- 
- PYTHON=		python$(EXE)
- BUILDPYTHON=	python$(BUILDEXE)
-+HOSTPYTHON=	$(BUILDPYTHON)
- 
- # The task to run while instrument when building the profile-opt target
- PROFILE_TASK=	$(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck
-@@ -206,7 +207,7 @@ GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
- ##########################################################################
- # Parser
- PGEN=		Parser/pgen$(EXE)
--
-+HOSTPGEN=	$(PGEN)$(EXE)
- POBJS=		\
- 		Parser/acceler.o \
- 		Parser/grammar1.o \
-@@ -395,8 +396,8 @@ platform: $(BUILDPYTHON)
- # Build the shared modules
- sharedmods: $(BUILDPYTHON)
- 	@case $$MAKEFLAGS in \
--	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
--	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
-+	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
-+	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
- 	esac
- 
- # Build static library
-@@ -531,7 +532,7 @@ $(GRAMMAR_H) $(GRAMMAR_C): $(GRAMMAR_STAMP)
- 
- $(GRAMMAR_STAMP): $(PGEN) $(GRAMMAR_INPUT)
- 		-@$(INSTALL) -d Include
--		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- 		touch $(GRAMMAR_STAMP)
- 
- $(PGEN):	$(PGENOBJS)
-@@ -902,23 +903,23 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
- 	done
- 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
-+		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
- 
- # Create the PLATDIR source directory, if one wasn't distributed..
- $(srcdir)/Lib/$(PLATDIR):
-@@ -1016,7 +1017,7 @@ libainstall:	all
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall:
--	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
-+	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-Index: Python-2.6.1/setup.py
-===================================================================
---- Python-2.6.1.orig/setup.py
-+++ Python-2.6.1/setup.py
-@@ -276,6 +276,7 @@ class PyBuildExt(build_ext):
-             self.failed.append(ext.name)
-             self.announce('*** WARNING: renaming "%s" since importing it'
-                           ' failed: %s' % (ext.name, why), level=3)
-+            return
-             assert not self.inplace
-             basename, tail = os.path.splitext(ext_filename)
-             newname = basename + "_failed" + tail
-@@ -310,8 +311,8 @@ class PyBuildExt(build_ext):
- 
-     def detect_modules(self):
-         # Ensure that /usr/local is always used
--        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
--        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-+        # add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
-+        # add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
- 
-         # Add paths specified in the environment variables LDFLAGS and
-         # CPPFLAGS for header and library files.
-@@ -410,6 +411,9 @@ class PyBuildExt(build_ext):
- 
-         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
- 
-+        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
-+        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
-+
-         #
-         # The following modules are all pretty straightforward, and compile
-         # on pretty much any POSIXish platform.
diff --git a/recipes/python/python-2.6.5/02-remove-test-for-cross.patch b/recipes/python/python-2.6.5/02-remove-test-for-cross.patch
deleted file mode 100644
index b1c0bfb..0000000
--- a/recipes/python/python-2.6.5/02-remove-test-for-cross.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-# OpenEmbedded prepopulates the autotools site cache, so if this
-# would be using AC_TRY_CACHE, we could patch it in a more sane way
-# Alas, I don't have enough autotalent to do that.
-#
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-Index: Python-2.6.1/configure.in
-===================================================================
---- Python-2.6.5.orig/configure.in	2010-07-06 04:37:09.000000000 -0700
-+++ Python-2.6.5/configure.in	2010-07-06 04:40:18.000000000 -0700
-@@ -2697,50 +2697,6 @@
-   AC_CHECK_LIB(resolv, inet_aton)
- )
- 
--# On Tru64, chflags seems to be present, but calling it will
--# exit Python
--AC_CACHE_CHECK([for chflags], [ac_cv_have_chflags], [dnl
--AC_TRY_RUN([[
--#include <sys/stat.h>
--#include <unistd.h>
--int main(int argc, char*argv[])
--{
--  if(chflags(argv[0], 0) != 0)
--    return 1;
--  return 0;
--}
--]], ac_cv_have_chflags=yes,
--   ac_cv_have_chflags=no,
--   ac_cv_have_chflags=cross)
--])
--if test "$ac_cv_have_chflags" = cross ; then
--  AC_CHECK_FUNC([chflags], [ac_cv_have_chflags="yes"], [ac_cv_have_chflags="no"])
--fi
--if test "$ac_cv_have_chflags" = yes ; then
--  AC_DEFINE(HAVE_CHFLAGS, 1, Define to 1 if you have the `chflags' function.)
--fi
--
--AC_CACHE_CHECK([for lchflags], [ac_cv_have_lchflags], [dnl
--AC_TRY_RUN([[
--#include <sys/stat.h>
--#include <unistd.h>
--int main(int argc, char*argv[])
--{
--  if(lchflags(argv[0], 0) != 0)
--    return 1;
--  return 0;
--}
--]], ac_cv_have_lchflags=yes,
--   ac_cv_have_lchflags=no,
--   ac_cv_have_lchflags=cross)
--])
--if test "$ac_cv_have_lchflags" = cross ; then
--  AC_CHECK_FUNC([lchflags], [ac_cv_have_lchflags="yes"], [ac_cv_have_lchflags="no"])
--fi
--if test "$ac_cv_have_lchflags" = yes ; then
--  AC_DEFINE(HAVE_LCHFLAGS, 1, Define to 1 if you have the `lchflags' function.)
--fi
--
- dnl Check if system zlib has *Copy() functions
- dnl
- dnl On MacOSX the linker will search for dylibs on the entire linker path
-@@ -3844,45 +3800,6 @@
-   AC_MSG_RESULT(no)
- fi
- 
--AC_MSG_CHECKING(for %zd printf() format support)
--AC_TRY_RUN([#include <stdio.h>
--#include <stddef.h>
--#include <string.h>
--
--#ifdef HAVE_SYS_TYPES_H
--#include <sys/types.h>
--#endif
--
--#ifdef HAVE_SSIZE_T
--typedef ssize_t Py_ssize_t;
--#elif SIZEOF_VOID_P == SIZEOF_LONG
--typedef long Py_ssize_t;
--#else
--typedef int Py_ssize_t;
--#endif
--
--int main()
--{
--    char buffer[256];
--
--    if(sprintf(buffer, "%zd", (size_t)123) < 0)
--       	return 1;
--
--    if (strcmp(buffer, "123"))
--	return 1;
--
--    if (sprintf(buffer, "%zd", (Py_ssize_t)-123) < 0)
--       	return 1;
--
--    if (strcmp(buffer, "-123"))
--	return 1;
--
--    return 0;
--}],
--[AC_MSG_RESULT(yes)
-- AC_DEFINE(PY_FORMAT_SIZE_T, "z", [Define to printf format modifier for Py_ssize_t])],
-- AC_MSG_RESULT(no))
--
- AC_CHECK_TYPE(socklen_t,,
-   AC_DEFINE(socklen_t,int,
-             Define to `int' if <sys/socket.h> does not define.),[
diff --git a/recipes/python/python-2.6.5/03-fix-tkinter-detection.patch b/recipes/python/python-2.6.5/03-fix-tkinter-detection.patch
deleted file mode 100644
index a1a385a..0000000
--- a/recipes/python/python-2.6.5/03-fix-tkinter-detection.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-# We need to supply STAGING_INCDIR here, otherwise the Tk headers
-# will not be found.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
-
-Index: Python-2.6.1/setup.py
-===================================================================
---- Python-2.6.1.orig/setup.py
-+++ Python-2.6.1/setup.py
-@@ -1543,7 +1543,7 @@ class PyBuildExt(build_ext):
-                 dotversion = dotversion[:-1] + '.' + dotversion[-1]
-             tcl_include_sub = []
-             tk_include_sub = []
--            for dir in inc_dirs:
-+            for dir in [os.getenv("STAGING_INCDIR")]:
-                 tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
-                 tk_include_sub += [dir + os.sep + "tk" + dotversion]
-             tk_include_sub += tcl_include_sub
-@@ -1562,22 +1562,6 @@ class PyBuildExt(build_ext):
-             if dir not in include_dirs:
-                 include_dirs.append(dir)
- 
--        # Check for various platform-specific directories
--        if platform == 'sunos5':
--            include_dirs.append('/usr/openwin/include')
--            added_lib_dirs.append('/usr/openwin/lib')
--        elif os.path.exists('/usr/X11R6/include'):
--            include_dirs.append('/usr/X11R6/include')
--            added_lib_dirs.append('/usr/X11R6/lib64')
--            added_lib_dirs.append('/usr/X11R6/lib')
--        elif os.path.exists('/usr/X11R5/include'):
--            include_dirs.append('/usr/X11R5/include')
--            added_lib_dirs.append('/usr/X11R5/lib')
--        else:
--            # Assume default location for X11
--            include_dirs.append('/usr/X11/include')
--            added_lib_dirs.append('/usr/X11/lib')
--
-         # If Cygwin, then verify that X is installed before proceeding
-         if platform == 'cygwin':
-             x11_inc = find_file('X11/Xlib.h', [], include_dirs)
diff --git a/recipes/python/python-2.6.5/04-default-is-optimized.patch b/recipes/python/python-2.6.5/04-default-is-optimized.patch
deleted file mode 100644
index 5131e0b..0000000
--- a/recipes/python/python-2.6.5/04-default-is-optimized.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-# When compiling for an embedded system, we need every bit of
-# performance we can get. default to optimized with the option
-# of opt-out.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.6.1/Python/compile.c
-===================================================================
---- Python-2.6.1.orig/Python/compile.c
-+++ Python-2.6.1/Python/compile.c
-@@ -32,7 +32,7 @@
- #include "symtable.h"
- #include "opcode.h"
- 
--int Py_OptimizeFlag = 0;
-+int Py_OptimizeFlag = 1;
- 
- #define DEFAULT_BLOCK_SIZE 16
- #define DEFAULT_BLOCKS 8
diff --git a/recipes/python/python-2.6.5/05-enable-ctypes-cross-build.patch b/recipes/python/python-2.6.5/05-enable-ctypes-cross-build.patch
deleted file mode 100644
index 58b8078..0000000
--- a/recipes/python/python-2.6.5/05-enable-ctypes-cross-build.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-# CTypes need to know the actual host we are building on.
-# Signed-Off: Michael Dietrich <mdt@emdete.de>
-
-Index: Python-2.6.1/setup.py
-===================================================================
---- Python-2.6.1.orig/setup.py
-+++ Python-2.6.1/setup.py
-@@ -1656,16 +1656,16 @@ class PyBuildExt(build_ext):
-                                          ffi_configfile):
-                 from distutils.dir_util import mkpath
-                 mkpath(ffi_builddir)
--                config_args = []
-+                config_args = ['--host=%s' % os.environ["HOST_SYS"], ]
- 
-                 # Pass empty CFLAGS because we'll just append the resulting
-                 # CFLAGS to Python's; -g or -O2 is to be avoided.
--                cmd = "cd %s && env CFLAGS='' '%s/configure' %s" \
--                      % (ffi_builddir, ffi_srcdir, " ".join(config_args))
-+                cmd = "(cd %s && autoconf -W cross) && (cd %s && env CFLAGS='' '%s/configure' %s)" \
-+                      % (ffi_srcdir, ffi_builddir, ffi_srcdir, " ".join(config_args))
- 
-                 res = os.system(cmd)
-                 if res or not os.path.exists(ffi_configfile):
--                    print "Failed to configure _ctypes module"
-+                    print "Failed to configure _ctypes module (res=%d) or missing conffile=%s" % ( res, ffi_configfile )
-                     return False
- 
-             fficonfig = {}
diff --git a/recipes/python/python-2.6.5/06-ctypes-libffi-fix-configure.patch b/recipes/python/python-2.6.5/06-ctypes-libffi-fix-configure.patch
deleted file mode 100644
index 3773791..0000000
--- a/recipes/python/python-2.6.5/06-ctypes-libffi-fix-configure.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-This fixes configure issues with recent autoconf, e.g:
-  autoreconf: Entering directory `Modules/_ctypes/libffi'
-  autoreconf: configure.ac: not using Gettext
-  autoreconf: running: aclocal --force
-  configure.ac:26: error: m4_copy: won't overwrite defined macro: _AC_ARG_VAR_PRECIOUS
-  configure.ac:26: the top level
-
-The problem is still present in python-2.6.5 but fixed in python-svn.
-
-diff -pruN Python-2.6.4.orig//Modules/_ctypes/libffi/configure.ac Python-2.6.4/Modules/_ctypes/libffi/configure.ac
---- Python-2.6.4.orig//Modules/_ctypes/libffi/configure.ac      2009-04-28 22:01:18.000000000 +0200
-+++ Python-2.6.4/Modules/_ctypes/libffi/configure.ac    2010-04-20 22:46:02.000000000 +0200
-@@ -23,6 +23,7 @@ AM_INIT_AUTOMAKE
- m4_rename([_AC_ARG_VAR_PRECIOUS],[real_PRECIOUS])
- m4_define([_AC_ARG_VAR_PRECIOUS],[])
- AC_PROG_CC
-+m4_undefine([_AC_ARG_VAR_PRECIOUS])
- m4_rename([real_PRECIOUS],[_AC_ARG_VAR_PRECIOUS])
- 
- AC_SUBST(CFLAGS)
-@@ -366,7 +367,7 @@ test -d src/$TARGETDIR || mkdir src/$TAR
- 
- AC_CONFIG_LINKS(include/ffitarget.h:src/$TARGETDIR/ffitarget.h)
- 
--AC_CONFIG_FILES(include/ffi.h)
-+AC_CONFIG_FILES(include/ffi.h include/Makefile Makefile)
- 
- AC_CONFIG_LINKS(include/ffi_common.h:include/ffi_common.h)
- 
-diff -pruN Python-2.6.4.orig//Modules/_ctypes/libffi/Makefile.am Python-2.6.4/Modules/_ctypes/libffi/Makefile.am
---- Python-2.6.4.orig//Modules/_ctypes/libffi/Makefile.am       2008-03-04 21:09:11.000000000 +0100
-+++ Python-2.6.4/Modules/_ctypes/libffi/Makefile.am     2010-04-20 22:54:03.000000000 +0200
-@@ -2,7 +2,7 @@
- 
- AUTOMAKE_OPTIONS = foreign subdir-objects
- 
--SUBDIRS = include testsuite man
-+SUBDIRS = include
- 
- EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
-        src/alpha/ffi.c src/alpha/osf.S src/alpha/ffitarget.h \
-@@ -32,8 +32,6 @@ EXTRA_DIST = LICENSE ChangeLog.v1 Change
-        src/frv/ffi.c src/frv/eabi.S src/frv/ffitarget.h src/dlmalloc.c \
-        libtool-version ChangeLog.libffi
- 
--info_TEXINFOS = doc/libffi.texi
--
- ## ################################################################
- 
- ##
-
diff --git a/recipes/python/python-2.6.5/10-distutils-fix-swig-parameter.patch b/recipes/python/python-2.6.5/10-distutils-fix-swig-parameter.patch
deleted file mode 100644
index f5e852a..0000000
--- a/recipes/python/python-2.6.5/10-distutils-fix-swig-parameter.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-# Some versions of SWIG do not use the extension parameter.
-# Make it optional.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-Index: Python-2.6.1/Lib/distutils/command/build_ext.py
-===================================================================
---- Python-2.6.1.orig/Lib/distutils/command/build_ext.py
-+++ Python-2.6.1/Lib/distutils/command/build_ext.py
-@@ -566,7 +566,7 @@ class build_ext (Command):
-             target_lang=language)
- 
- 
--    def swig_sources (self, sources, extension):
-+    def swig_sources (self, sources, extension=None):
- 
-         """Walk the list of source files in 'sources', looking for SWIG
-         interface (.i) files.  Run SWIG on all that are found, and
diff --git a/recipes/python/python-2.6.5/11-distutils-never-modify-shebang-line.patch b/recipes/python/python-2.6.5/11-distutils-never-modify-shebang-line.patch
deleted file mode 100644
index 8354e26..0000000
--- a/recipes/python/python-2.6.5/11-distutils-never-modify-shebang-line.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-# Don't modify the she-bang line for a cross-build.
-# Otherwise it points to our hostpython (which we do not want)
-#
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.6.1/Lib/distutils/command/build_scripts.py
-===================================================================
---- Python-2.6.1.orig/Lib/distutils/command/build_scripts.py
-+++ Python-2.6.1/Lib/distutils/command/build_scripts.py
-@@ -87,7 +87,7 @@ class build_scripts (Command):
-                     continue
- 
-                 match = first_line_re.match(first_line)
--                if match:
-+                if False: #match:
-                     adjust = 1
-                     post_interp = match.group(1) or ''
- 
diff --git a/recipes/python/python-2.6.5/12-distutils-prefix-is-inside-staging-area.patch b/recipes/python/python-2.6.5/12-distutils-prefix-is-inside-staging-area.patch
deleted file mode 100644
index aa43936..0000000
--- a/recipes/python/python-2.6.5/12-distutils-prefix-is-inside-staging-area.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-# The proper prefix is inside our staging area.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.6.1/Lib/distutils/sysconfig.py
-===================================================================
---- Python-2.6.1.orig/Lib/distutils/sysconfig.py
-+++ Python-2.6.1/Lib/distutils/sysconfig.py
-@@ -19,8 +19,8 @@ import sys
- from distutils.errors import DistutilsPlatformError
- 
- # These are needed in a couple of spots, so just compute them once.
--PREFIX = os.path.normpath(sys.prefix)
--EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
-+PREFIX = os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
-+EXEC_PREFIX = os.path.normpath(sys.exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
- 
- # Path to the base directory of the project. On Windows the binary may
- # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
-@@ -70,7 +70,10 @@ def get_python_inc(plat_specific=0, pref
-     sys.exec_prefix -- i.e., ignore 'plat_specific'.
-     """
-     if prefix is None:
--        prefix = plat_specific and EXEC_PREFIX or PREFIX
-+        if plat_specific:
-+            prefix = plat_specific and os.environ['STAGING_INCDIR'].rstrip('include')
-+        else:
-+            prefix = plat_specific and EXEC_PREFIX or PREFIX
-     if os.name == "posix":
-         if python_build:
-             base = os.path.dirname(os.path.abspath(sys.executable))
-@@ -112,7 +115,10 @@ def get_python_lib(plat_specific=0, stan
-     sys.exec_prefix -- i.e., ignore 'plat_specific'.
-     """
-     if prefix is None:
--        prefix = plat_specific and EXEC_PREFIX or PREFIX
-+        if plat_specific:
-+            prefix = plat_specific and os.environ['STAGING_LIBDIR'].rstrip('lib')
-+        else:
-+            prefix = plat_specific and EXEC_PREFIX or PREFIX
- 
-     if os.name == "posix":
-         libpython = os.path.join(prefix,
-@@ -218,7 +218,7 @@ def get_config_h_filename():
-     else:
-         # The name of the config.h file changed in 2.2
-         config_h = 'pyconfig.h'
--    return os.path.join(inc_dir, config_h)
-+    return os.path.join(inc_dir, config_h).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
- 
- 
- def get_makefile_filename():
-@@ -226,7 +226,7 @@ def get_makefile_filename():
-     if python_build:
-         return os.path.join(os.path.dirname(sys.executable), "Makefile")
-     lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
--    return os.path.join(lib_dir, "config", "Makefile")
-+    return os.path.join(lib_dir, "config", "Makefile").replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
- 
- 
- def parse_config_h(fp, g=None):
diff --git a/recipes/python/python-2.6.5/99-ignore-optimization-flag.patch b/recipes/python/python-2.6.5/99-ignore-optimization-flag.patch
deleted file mode 100644
index dcee112..0000000
--- a/recipes/python/python-2.6.5/99-ignore-optimization-flag.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-# Reinstate the empty -O option to fix weird mixing of native and target
-# binaries and libraries with LD_LIBRARY_PATH when host==target
-#
-# Signed-off-by: Denys Dmytriyenko <denis@denix.org>
-
-diff -uNr Python-2.6.5.orig//Modules/main.c Python-2.6.5/Modules/main.c
---- Python-2.6.5.orig//Modules/main.c	2009-10-27 13:48:52.000000000 +0100
-+++ Python-2.6.5/Modules/main.c	2010-08-16 21:25:04.000000000 +0200
-@@ -328,8 +328,7 @@
- 
- 		/* case 'J': reserved for Jython */
- 
--		case 'O':
--			Py_OptimizeFlag++;
-+		case 'O': /* ignore it */
- 			break;
- 
- 		case 'B':
diff --git a/recipes/python/python-2.6.5/debug.patch b/recipes/python/python-2.6.5/debug.patch
deleted file mode 100644
index beb3adc..0000000
--- a/recipes/python/python-2.6.5/debug.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Index: Python-2.6.1/Lib/distutils/unixccompiler.py
-===================================================================
---- Python-2.6.1.orig/Lib/distutils/unixccompiler.py	2009-11-13 16:04:54.000000000 +0000
-+++ Python-2.6.1/Lib/distutils/unixccompiler.py	2009-11-13 16:06:27.000000000 +0000
-@@ -300,6 +300,8 @@
-         dylib_f = self.library_filename(lib, lib_type='dylib')
-         static_f = self.library_filename(lib, lib_type='static')
- 
-+        print "Looking in %s for %s" % (lib, dirs)
-+
-         for dir in dirs:
-             shared = os.path.join(dir, shared_f)
-             dylib = os.path.join(dir, dylib_f)
-@@ -309,10 +311,13 @@
-             # assuming that *all* Unix C compilers do.  And of course I'm
-             # ignoring even GCC's "-static" option.  So sue me.
-             if os.path.exists(dylib):
-+                print "Found %s" % (dylib)
-                 return dylib
-             elif os.path.exists(shared):
-+                print "Found %s" % (shared)
-                 return shared
-             elif os.path.exists(static):
-+                print "Found %s" % (static)
-                 return static
- 
-         # Oops, didn't find it in *any* of 'dirs'
diff --git a/recipes/python/python-2.6.5/ipv6-cross.patch b/recipes/python/python-2.6.5/ipv6-cross.patch
deleted file mode 100644
index 3d2ac5e..0000000
--- a/recipes/python/python-2.6.5/ipv6-cross.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: Python-2.6.5/configure.in
-===================================================================
---- Python-2.6.5.orig/configure.in	2011-01-15 14:42:42.068656002 -0800
-+++ Python-2.6.5/configure.in	2011-01-15 15:18:39.668656002 -0800
-@@ -2951,7 +2951,7 @@
- buggygetaddrinfo=yes
- ])
- 
--if test "$buggygetaddrinfo" = "yes"; then
-+if test "$buggygetaddrinfo" = "yes" -a x"$cross_compiling" != "xyes"; then
- 	if test "$ipv6" = "yes"; then
- 		echo 'Fatal: You must get working getaddrinfo() function.'
- 		echo '       or you can specify "--disable-ipv6"'.
diff --git a/recipes/python/python-2.6.5/nohostlibs.patch b/recipes/python/python-2.6.5/nohostlibs.patch
deleted file mode 100644
index 7020f3c..0000000
--- a/recipes/python/python-2.6.5/nohostlibs.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Index: Python-2.6.1/setup.py
-===================================================================
---- Python-2.6.1.orig/setup.py	2009-11-13 16:20:47.000000000 +0000
-+++ Python-2.6.1/setup.py	2009-11-13 16:28:00.000000000 +0000
-@@ -310,8 +310,8 @@
- 
-     def detect_modules(self):
-         # Ensure that /usr/local is always used
--        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
--        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-+        #add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
-+        #add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
- 
-         # Add paths specified in the environment variables LDFLAGS and
-         # CPPFLAGS for header and library files.
-@@ -347,10 +347,10 @@
-                     for directory in reversed(options.dirs):
-                         add_dir_to_list(dir_list, directory)
- 
--        if os.path.normpath(sys.prefix) != '/usr':
--            add_dir_to_list(self.compiler.library_dirs,
-+
-+        add_dir_to_list(self.compiler.library_dirs,
-                             sysconfig.get_config_var("LIBDIR"))
--            add_dir_to_list(self.compiler.include_dirs,
-+        add_dir_to_list(self.compiler.include_dirs,
-                             sysconfig.get_config_var("INCLUDEDIR"))
- 
-         try:
-@@ -361,11 +361,8 @@
-         # lib_dirs and inc_dirs are used to search for files;
-         # if a file is found in one of those directories, it can
-         # be assumed that no additional -I,-L directives are needed.
--        lib_dirs = self.compiler.library_dirs + [
--            '/lib64', '/usr/lib64',
--            '/lib', '/usr/lib',
--            ]
--        inc_dirs = self.compiler.include_dirs + ['/usr/include']
-+        lib_dirs = self.compiler.library_dirs
-+        inc_dirs = self.compiler.include_dirs
-         exts = []
-         missing = []
- 
-@@ -583,8 +580,7 @@
-                 readline_libs.append('ncurses')
-             elif self.compiler.find_library_file(lib_dirs, 'curses'):
-                 readline_libs.append('curses')
--            elif self.compiler.find_library_file(lib_dirs +
--                                               ['/usr/lib/termcap'],
-+            elif self.compiler.find_library_file(lib_dirs,
-                                                'termcap'):
-                 readline_libs.append('termcap')
-             exts.append( Extension('readline', ['readline.c'],
diff --git a/recipes/python/python-2.6.5/sitecustomize.py b/recipes/python/python-2.6.5/sitecustomize.py
deleted file mode 100644
index 2739018..0000000
--- a/recipes/python/python-2.6.5/sitecustomize.py
+++ /dev/null
@@ -1,45 +0,0 @@
-# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-# GPLv2 or later
-# Version: 20081123
-# Features:
-# * set proper default encoding
-# * enable readline completion in the interactive interpreter
-# * load command line history on startup
-# * save command line history on exit 
-
-import os
-
-def __exithandler():
-    try:
-        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
-    except IOError:
-        pass
-
-def __registerExitHandler():
-    import atexit
-    atexit.register( __exithandler )
-
-def __enableReadlineSupport():
-    readline.set_history_length( 1000 )
-    readline.parse_and_bind( "tab: complete" )
-    try:
-        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
-    except IOError:
-        pass
-
-def __enableDefaultEncoding():
-    import sys
-    try:
-        sys.setdefaultencoding( "utf8" )
-    except LookupError:
-        pass
-
-import sys
-try:
-    import rlcompleter, readline
-except ImportError:
-    pass
-else:
-    __enableDefaultEncoding()
-    __registerExitHandler()
-    __enableReadlineSupport()
diff --git a/recipes/python/python-2.6.6/00-fix-parallel-make.patch b/recipes/python/python-2.6.6/00-fix-parallel-make.patch
new file mode 100644
index 0000000..c80ca19
--- /dev/null
+++ b/recipes/python/python-2.6.6/00-fix-parallel-make.patch
@@ -0,0 +1,40 @@
+upstream: <http://bugs.python.org/issue10013>
+comment: As in the comment in the issue tracker this is fixed for py3k a little differently <http://svn.python.org/view?view=rev&revision=84068>. This patch is taken from Fedora.
+
+diff -up Python-2.7/Makefile.pre.in.fix-parallel-make Python-2.7/Makefile.pre.in
+--- Python-2.7/Makefile.pre.in.fix-parallel-make	2010-07-22 15:01:39.567996932 -0400
++++ Python-2.7/Makefile.pre.in	2010-07-22 15:47:02.437998509 -0400
+@@ -197,6 +197,7 @@ SIGNAL_OBJS=	@SIGNAL_OBJS@
+ 
+ ##########################################################################
+ # Grammar
++GRAMMAR_STAMP=	$(srcdir)/grammar-stamp
+ GRAMMAR_H=	$(srcdir)/Include/graminit.h
+ GRAMMAR_C=	$(srcdir)/Python/graminit.c
+ GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
+@@ -514,10 +515,24 @@ Modules/getpath.o: $(srcdir)/Modules/get
+ Modules/python.o: $(srcdir)/Modules/python.c
+ 	$(MAINCC) -c $(PY_CFLAGS) -o $@ $(srcdir)/Modules/python.c
+ 
++# GNU "make" interprets rules with two dependents as two copies of the rule.
++# 
++# In a parallel build this can lead to pgen being run twice, once for each of
++# GRAMMAR_H and GRAMMAR_C, leading to race conditions in which the compiler
++# reads a partially-overwritten copy of one of these files, leading to syntax
++# errors (or linker errors if the fragment happens to be syntactically valid C)
++#
++# See http://www.gnu.org/software/hello/manual/automake/Multiple-Outputs.html
++# for more information.
++#
++# Introduce ".grammar-stamp" as a contrived single output from PGEN to avoid
++# this:
++$(GRAMMAR_H) $(GRAMMAR_C): $(GRAMMAR_STAMP)
+ 
+-$(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
++$(GRAMMAR_STAMP): $(PGEN) $(GRAMMAR_INPUT)
+ 		-@$(INSTALL) -d Include
+ 		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++		touch $(GRAMMAR_STAMP)
+ 
+ $(PGEN):	$(PGENOBJS)
+ 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
diff --git a/recipes/python/python-2.6.6/01-use-proper-tools-for-cross-build.patch b/recipes/python/python-2.6.6/01-use-proper-tools-for-cross-build.patch
new file mode 100644
index 0000000..b7467cc
--- /dev/null
+++ b/recipes/python/python-2.6.6/01-use-proper-tools-for-cross-build.patch
@@ -0,0 +1,116 @@
+# We need to ensure our host tools get run during build, not the freshly
+# built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.6/Makefile.pre.in
+===================================================================
+--- Python-2.6.6.orig/Makefile.pre.in
++++ Python-2.6.6/Makefile.pre.in
+@@ -175,6 +175,7 @@ UNICODE_OBJS=   @UNICODE_OBJS@
+ 
+ PYTHON=		python$(EXE)
+ BUILDPYTHON=	python$(BUILDEXE)
++HOSTPYTHON=	$(BUILDPYTHON)
+ 
+ # The task to run while instrument when building the profile-opt target
+ PROFILE_TASK=	$(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck
+@@ -205,7 +206,7 @@ GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
+ ##########################################################################
+ # Parser
+ PGEN=		Parser/pgen$(EXE)
+-
++HOSTPGEN=	$(PGEN)$(EXE)
+ POBJS=		\
+ 		Parser/acceler.o \
+ 		Parser/grammar1.o \
+@@ -394,8 +395,8 @@ platform: $(BUILDPYTHON)
+ # Build the shared modules
+ sharedmods: $(BUILDPYTHON)
+ 	@case $$MAKEFLAGS in \
+-	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
+-	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
++	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
++	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
+ 	esac
+ 
+ # Build static library
+@@ -517,7 +518,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
+ 
+ $(GRAMMAR_STAMP): $(PGEN) $(GRAMMAR_INPUT)
+ 		-@$(INSTALL) -d Include
+-		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+ 		touch $(GRAMMAR_STAMP)
+ 
+ $(PGEN):	$(PGENOBJS)
+@@ -887,23 +888,23 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+ 	done
+ 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
++		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
+ 
+ # Create the PLATDIR source directory, if one wasn't distributed..
+ $(srcdir)/Lib/$(PLATDIR):
+@@ -1001,7 +1002,7 @@ libainstall:	all
+ # Install the dynamically loadable modules
+ # This goes into $(exec_prefix)
+ sharedinstall:
+-	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
++	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
+ 	   	--prefix=$(prefix) \
+ 		--install-scripts=$(BINDIR) \
+ 		--install-platlib=$(DESTSHARED) \
+Index: Python-2.6.6/setup.py
+===================================================================
+--- Python-2.6.6.orig/setup.py
++++ Python-2.6.6/setup.py
+@@ -322,6 +322,7 @@ class PyBuildExt(build_ext):
+             self.failed.append(ext.name)
+             self.announce('*** WARNING: renaming "%s" since importing it'
+                           ' failed: %s' % (ext.name, why), level=3)
++            return
+             assert not self.inplace
+             basename, tail = os.path.splitext(ext_filename)
+             newname = basename + "_failed" + tail
+@@ -356,8 +357,8 @@ class PyBuildExt(build_ext):
+ 
+     def detect_modules(self):
+         # Ensure that /usr/local is always used
+-        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
+-        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
++        # add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
++        # add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+ 
+         # Add paths specified in the environment variables LDFLAGS and
+         # CPPFLAGS for header and library files.
+@@ -456,6 +457,9 @@ class PyBuildExt(build_ext):
+ 
+         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
+ 
++        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
++        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
++
+         #
+         # The following modules are all pretty straightforward, and compile
+         # on pretty much any POSIXish platform.
diff --git a/recipes/python/python-2.6.6/02-remove-test-for-cross.patch b/recipes/python/python-2.6.6/02-remove-test-for-cross.patch
new file mode 100644
index 0000000..b1c0bfb
--- /dev/null
+++ b/recipes/python/python-2.6.6/02-remove-test-for-cross.patch
@@ -0,0 +1,106 @@
+# OpenEmbedded prepopulates the autotools site cache, so if this
+# would be using AC_TRY_CACHE, we could patch it in a more sane way
+# Alas, I don't have enough autotalent to do that.
+#
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+Index: Python-2.6.1/configure.in
+===================================================================
+--- Python-2.6.5.orig/configure.in	2010-07-06 04:37:09.000000000 -0700
++++ Python-2.6.5/configure.in	2010-07-06 04:40:18.000000000 -0700
+@@ -2697,50 +2697,6 @@
+   AC_CHECK_LIB(resolv, inet_aton)
+ )
+ 
+-# On Tru64, chflags seems to be present, but calling it will
+-# exit Python
+-AC_CACHE_CHECK([for chflags], [ac_cv_have_chflags], [dnl
+-AC_TRY_RUN([[
+-#include <sys/stat.h>
+-#include <unistd.h>
+-int main(int argc, char*argv[])
+-{
+-  if(chflags(argv[0], 0) != 0)
+-    return 1;
+-  return 0;
+-}
+-]], ac_cv_have_chflags=yes,
+-   ac_cv_have_chflags=no,
+-   ac_cv_have_chflags=cross)
+-])
+-if test "$ac_cv_have_chflags" = cross ; then
+-  AC_CHECK_FUNC([chflags], [ac_cv_have_chflags="yes"], [ac_cv_have_chflags="no"])
+-fi
+-if test "$ac_cv_have_chflags" = yes ; then
+-  AC_DEFINE(HAVE_CHFLAGS, 1, Define to 1 if you have the `chflags' function.)
+-fi
+-
+-AC_CACHE_CHECK([for lchflags], [ac_cv_have_lchflags], [dnl
+-AC_TRY_RUN([[
+-#include <sys/stat.h>
+-#include <unistd.h>
+-int main(int argc, char*argv[])
+-{
+-  if(lchflags(argv[0], 0) != 0)
+-    return 1;
+-  return 0;
+-}
+-]], ac_cv_have_lchflags=yes,
+-   ac_cv_have_lchflags=no,
+-   ac_cv_have_lchflags=cross)
+-])
+-if test "$ac_cv_have_lchflags" = cross ; then
+-  AC_CHECK_FUNC([lchflags], [ac_cv_have_lchflags="yes"], [ac_cv_have_lchflags="no"])
+-fi
+-if test "$ac_cv_have_lchflags" = yes ; then
+-  AC_DEFINE(HAVE_LCHFLAGS, 1, Define to 1 if you have the `lchflags' function.)
+-fi
+-
+ dnl Check if system zlib has *Copy() functions
+ dnl
+ dnl On MacOSX the linker will search for dylibs on the entire linker path
+@@ -3844,45 +3800,6 @@
+   AC_MSG_RESULT(no)
+ fi
+ 
+-AC_MSG_CHECKING(for %zd printf() format support)
+-AC_TRY_RUN([#include <stdio.h>
+-#include <stddef.h>
+-#include <string.h>
+-
+-#ifdef HAVE_SYS_TYPES_H
+-#include <sys/types.h>
+-#endif
+-
+-#ifdef HAVE_SSIZE_T
+-typedef ssize_t Py_ssize_t;
+-#elif SIZEOF_VOID_P == SIZEOF_LONG
+-typedef long Py_ssize_t;
+-#else
+-typedef int Py_ssize_t;
+-#endif
+-
+-int main()
+-{
+-    char buffer[256];
+-
+-    if(sprintf(buffer, "%zd", (size_t)123) < 0)
+-       	return 1;
+-
+-    if (strcmp(buffer, "123"))
+-	return 1;
+-
+-    if (sprintf(buffer, "%zd", (Py_ssize_t)-123) < 0)
+-       	return 1;
+-
+-    if (strcmp(buffer, "-123"))
+-	return 1;
+-
+-    return 0;
+-}],
+-[AC_MSG_RESULT(yes)
+- AC_DEFINE(PY_FORMAT_SIZE_T, "z", [Define to printf format modifier for Py_ssize_t])],
+- AC_MSG_RESULT(no))
+-
+ AC_CHECK_TYPE(socklen_t,,
+   AC_DEFINE(socklen_t,int,
+             Define to `int' if <sys/socket.h> does not define.),[
diff --git a/recipes/python/python-2.6.6/03-fix-tkinter-detection.patch b/recipes/python/python-2.6.6/03-fix-tkinter-detection.patch
new file mode 100644
index 0000000..a1a385a
--- /dev/null
+++ b/recipes/python/python-2.6.6/03-fix-tkinter-detection.patch
@@ -0,0 +1,40 @@
+# We need to supply STAGING_INCDIR here, otherwise the Tk headers
+# will not be found.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
+
+Index: Python-2.6.1/setup.py
+===================================================================
+--- Python-2.6.1.orig/setup.py
++++ Python-2.6.1/setup.py
+@@ -1543,7 +1543,7 @@ class PyBuildExt(build_ext):
+                 dotversion = dotversion[:-1] + '.' + dotversion[-1]
+             tcl_include_sub = []
+             tk_include_sub = []
+-            for dir in inc_dirs:
++            for dir in [os.getenv("STAGING_INCDIR")]:
+                 tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
+                 tk_include_sub += [dir + os.sep + "tk" + dotversion]
+             tk_include_sub += tcl_include_sub
+@@ -1562,22 +1562,6 @@ class PyBuildExt(build_ext):
+             if dir not in include_dirs:
+                 include_dirs.append(dir)
+ 
+-        # Check for various platform-specific directories
+-        if platform == 'sunos5':
+-            include_dirs.append('/usr/openwin/include')
+-            added_lib_dirs.append('/usr/openwin/lib')
+-        elif os.path.exists('/usr/X11R6/include'):
+-            include_dirs.append('/usr/X11R6/include')
+-            added_lib_dirs.append('/usr/X11R6/lib64')
+-            added_lib_dirs.append('/usr/X11R6/lib')
+-        elif os.path.exists('/usr/X11R5/include'):
+-            include_dirs.append('/usr/X11R5/include')
+-            added_lib_dirs.append('/usr/X11R5/lib')
+-        else:
+-            # Assume default location for X11
+-            include_dirs.append('/usr/X11/include')
+-            added_lib_dirs.append('/usr/X11/lib')
+-
+         # If Cygwin, then verify that X is installed before proceeding
+         if platform == 'cygwin':
+             x11_inc = find_file('X11/Xlib.h', [], include_dirs)
diff --git a/recipes/python/python-2.6.6/04-default-is-optimized.patch b/recipes/python/python-2.6.6/04-default-is-optimized.patch
new file mode 100644
index 0000000..93e6e8e
--- /dev/null
+++ b/recipes/python/python-2.6.6/04-default-is-optimized.patch
@@ -0,0 +1,57 @@
+# when compiling for an embedded system, we need every bit of
+# performance we can get. default to optimized with the option
+# of opt-out.
+# 
+# JaMa: don't remove -O option as it's used while building python-native
+#
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.6/Python/compile.c
+===================================================================
+--- Python-2.6.6.orig/Python/compile.c
++++ Python-2.6.6/Python/compile.c
+@@ -32,7 +32,7 @@
+ #include "symtable.h"
+ #include "opcode.h"
+ 
+-int Py_OptimizeFlag = 0;
++int Py_OptimizeFlag = 1;
+ 
+ #define DEFAULT_BLOCK_SIZE 16
+ #define DEFAULT_BLOCKS 8
+Index: Python-2.6.6/Modules/main.c
+===================================================================
+--- Python-2.6.6.orig/Modules/main.c
++++ Python-2.6.6/Modules/main.c
+@@ -40,7 +40,7 @@ static char **orig_argv;
+ static int  orig_argc;
+ 
+ /* command line options */
+-#define BASE_OPTS "3bBc:dEhiJm:OQ:sStuUvVW:xX?"
++#define BASE_OPTS "3bBc:dEhiJm:NOQ:sStuUvVW:xX?"
+ 
+ #ifndef RISCOS
+ #define PROGRAM_OPTS BASE_OPTS
+@@ -69,8 +69,9 @@ Options and arguments (and corresponding
+ static char *usage_2 = "\
+          if stdin does not appear to be a terminal; also PYTHONINSPECT=x\n\
+ -m mod : run library module as a script (terminates option list)\n\
+ -O     : optimize generated bytecode slightly; also PYTHONOPTIMIZE=x\n\
+ -OO    : remove doc-strings in addition to the -O optimizations\n\
++-N     : do NOT optimize generated bytecode\n\
+ -Q arg : division options: -Qold (default), -Qwarn, -Qwarnall, -Qnew\n\
+ -s     : don't add user site directory to sys.path; also PYTHONNOUSERSITE\n\
+ -S     : don't imply 'import site' on initialization\n\
+@@ -329,7 +329,11 @@
+         /* case 'J': reserved for Jython */
+ 
+         case 'O':
+-            Py_OptimizeFlag++;
++            /* ignore it */
++            break;
++
++        case 'N':
++            Py_OptimizeFlag=0;
+             break;
+ 
+         case 'B':
diff --git a/recipes/python/python-2.6.6/05-enable-ctypes-cross-build.patch b/recipes/python/python-2.6.6/05-enable-ctypes-cross-build.patch
new file mode 100644
index 0000000..58b8078
--- /dev/null
+++ b/recipes/python/python-2.6.6/05-enable-ctypes-cross-build.patch
@@ -0,0 +1,28 @@
+# CTypes need to know the actual host we are building on.
+# Signed-Off: Michael Dietrich <mdt@emdete.de>
+
+Index: Python-2.6.1/setup.py
+===================================================================
+--- Python-2.6.1.orig/setup.py
++++ Python-2.6.1/setup.py
+@@ -1656,16 +1656,16 @@ class PyBuildExt(build_ext):
+                                          ffi_configfile):
+                 from distutils.dir_util import mkpath
+                 mkpath(ffi_builddir)
+-                config_args = []
++                config_args = ['--host=%s' % os.environ["HOST_SYS"], ]
+ 
+                 # Pass empty CFLAGS because we'll just append the resulting
+                 # CFLAGS to Python's; -g or -O2 is to be avoided.
+-                cmd = "cd %s && env CFLAGS='' '%s/configure' %s" \
+-                      % (ffi_builddir, ffi_srcdir, " ".join(config_args))
++                cmd = "(cd %s && autoconf -W cross) && (cd %s && env CFLAGS='' '%s/configure' %s)" \
++                      % (ffi_srcdir, ffi_builddir, ffi_srcdir, " ".join(config_args))
+ 
+                 res = os.system(cmd)
+                 if res or not os.path.exists(ffi_configfile):
+-                    print "Failed to configure _ctypes module"
++                    print "Failed to configure _ctypes module (res=%d) or missing conffile=%s" % ( res, ffi_configfile )
+                     return False
+ 
+             fficonfig = {}
diff --git a/recipes/python/python-2.6.6/06-ctypes-libffi-fix-configure.patch b/recipes/python/python-2.6.6/06-ctypes-libffi-fix-configure.patch
new file mode 100644
index 0000000..3773791
--- /dev/null
+++ b/recipes/python/python-2.6.6/06-ctypes-libffi-fix-configure.patch
@@ -0,0 +1,51 @@
+This fixes configure issues with recent autoconf, e.g:
+  autoreconf: Entering directory `Modules/_ctypes/libffi'
+  autoreconf: configure.ac: not using Gettext
+  autoreconf: running: aclocal --force
+  configure.ac:26: error: m4_copy: won't overwrite defined macro: _AC_ARG_VAR_PRECIOUS
+  configure.ac:26: the top level
+
+The problem is still present in python-2.6.5 but fixed in python-svn.
+
+diff -pruN Python-2.6.4.orig//Modules/_ctypes/libffi/configure.ac Python-2.6.4/Modules/_ctypes/libffi/configure.ac
+--- Python-2.6.4.orig//Modules/_ctypes/libffi/configure.ac      2009-04-28 22:01:18.000000000 +0200
++++ Python-2.6.4/Modules/_ctypes/libffi/configure.ac    2010-04-20 22:46:02.000000000 +0200
+@@ -23,6 +23,7 @@ AM_INIT_AUTOMAKE
+ m4_rename([_AC_ARG_VAR_PRECIOUS],[real_PRECIOUS])
+ m4_define([_AC_ARG_VAR_PRECIOUS],[])
+ AC_PROG_CC
++m4_undefine([_AC_ARG_VAR_PRECIOUS])
+ m4_rename([real_PRECIOUS],[_AC_ARG_VAR_PRECIOUS])
+ 
+ AC_SUBST(CFLAGS)
+@@ -366,7 +367,7 @@ test -d src/$TARGETDIR || mkdir src/$TAR
+ 
+ AC_CONFIG_LINKS(include/ffitarget.h:src/$TARGETDIR/ffitarget.h)
+ 
+-AC_CONFIG_FILES(include/ffi.h)
++AC_CONFIG_FILES(include/ffi.h include/Makefile Makefile)
+ 
+ AC_CONFIG_LINKS(include/ffi_common.h:include/ffi_common.h)
+ 
+diff -pruN Python-2.6.4.orig//Modules/_ctypes/libffi/Makefile.am Python-2.6.4/Modules/_ctypes/libffi/Makefile.am
+--- Python-2.6.4.orig//Modules/_ctypes/libffi/Makefile.am       2008-03-04 21:09:11.000000000 +0100
++++ Python-2.6.4/Modules/_ctypes/libffi/Makefile.am     2010-04-20 22:54:03.000000000 +0200
+@@ -2,7 +2,7 @@
+ 
+ AUTOMAKE_OPTIONS = foreign subdir-objects
+ 
+-SUBDIRS = include testsuite man
++SUBDIRS = include
+ 
+ EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
+        src/alpha/ffi.c src/alpha/osf.S src/alpha/ffitarget.h \
+@@ -32,8 +32,6 @@ EXTRA_DIST = LICENSE ChangeLog.v1 Change
+        src/frv/ffi.c src/frv/eabi.S src/frv/ffitarget.h src/dlmalloc.c \
+        libtool-version ChangeLog.libffi
+ 
+-info_TEXINFOS = doc/libffi.texi
+-
+ ## ################################################################
+ 
+ ##
+
diff --git a/recipes/python/python-2.6.6/10-distutils-fix-swig-parameter.patch b/recipes/python/python-2.6.6/10-distutils-fix-swig-parameter.patch
new file mode 100644
index 0000000..f5e852a
--- /dev/null
+++ b/recipes/python/python-2.6.6/10-distutils-fix-swig-parameter.patch
@@ -0,0 +1,16 @@
+# Some versions of SWIG do not use the extension parameter.
+# Make it optional.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+Index: Python-2.6.1/Lib/distutils/command/build_ext.py
+===================================================================
+--- Python-2.6.1.orig/Lib/distutils/command/build_ext.py
++++ Python-2.6.1/Lib/distutils/command/build_ext.py
+@@ -566,7 +566,7 @@ class build_ext (Command):
+             target_lang=language)
+ 
+ 
+-    def swig_sources (self, sources, extension):
++    def swig_sources (self, sources, extension=None):
+ 
+         """Walk the list of source files in 'sources', looking for SWIG
+         interface (.i) files.  Run SWIG on all that are found, and
diff --git a/recipes/python/python-2.6.6/11-distutils-never-modify-shebang-line.patch b/recipes/python/python-2.6.6/11-distutils-never-modify-shebang-line.patch
new file mode 100644
index 0000000..8354e26
--- /dev/null
+++ b/recipes/python/python-2.6.6/11-distutils-never-modify-shebang-line.patch
@@ -0,0 +1,18 @@
+# Don't modify the she-bang line for a cross-build.
+# Otherwise it points to our hostpython (which we do not want)
+#
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.1/Lib/distutils/command/build_scripts.py
+===================================================================
+--- Python-2.6.1.orig/Lib/distutils/command/build_scripts.py
++++ Python-2.6.1/Lib/distutils/command/build_scripts.py
+@@ -87,7 +87,7 @@ class build_scripts (Command):
+                     continue
+ 
+                 match = first_line_re.match(first_line)
+-                if match:
++                if False: #match:
+                     adjust = 1
+                     post_interp = match.group(1) or ''
+ 
diff --git a/recipes/python/python-2.6.6/12-distutils-prefix-is-inside-staging-area.patch b/recipes/python/python-2.6.6/12-distutils-prefix-is-inside-staging-area.patch
new file mode 100644
index 0000000..bf4366f
--- /dev/null
+++ b/recipes/python/python-2.6.6/12-distutils-prefix-is-inside-staging-area.patch
@@ -0,0 +1,60 @@
+# The proper prefix is inside our staging area.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.6/Lib/distutils/sysconfig.py
+===================================================================
+--- Python-2.6.6.orig/Lib/distutils/sysconfig.py
++++ Python-2.6.6/Lib/distutils/sysconfig.py
+@@ -19,8 +19,8 @@ import sys
+ from distutils.errors import DistutilsPlatformError
+ 
+ # These are needed in a couple of spots, so just compute them once.
+-PREFIX = os.path.normpath(sys.prefix)
+-EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
++PREFIX = os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
++EXEC_PREFIX = os.path.normpath(sys.exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
+ 
+ # Path to the base directory of the project. On Windows the binary may
+ # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
+@@ -70,7 +70,10 @@ def get_python_inc(plat_specific=0, pref
+     sys.exec_prefix -- i.e., ignore 'plat_specific'.
+     """
+     if prefix is None:
+-        prefix = plat_specific and EXEC_PREFIX or PREFIX
++        if plat_specific:
++            prefix = plat_specific and os.environ['STAGING_INCDIR'].rstrip('include')
++        else:
++            prefix = plat_specific and EXEC_PREFIX or PREFIX
+ 
+     if os.name == "posix":
+         if python_build:
+@@ -116,7 +119,10 @@ def get_python_lib(plat_specific=0, stan
+     sys.exec_prefix -- i.e., ignore 'plat_specific'.
+     """
+     if prefix is None:
+-        prefix = plat_specific and EXEC_PREFIX or PREFIX
++        if plat_specific:
++            prefix = plat_specific and os.environ['STAGING_LIBDIR'].rstrip('lib')
++        else:
++            prefix = plat_specific and EXEC_PREFIX or PREFIX
+ 
+     if os.name == "posix":
+         libpython = os.path.join(prefix,
+@@ -216,7 +222,7 @@ def get_config_h_filename():
+     else:
+         # The name of the config.h file changed in 2.2
+         config_h = 'pyconfig.h'
+-    return os.path.join(inc_dir, config_h)
++    return os.path.join(inc_dir, config_h).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
+ 
+ 
+ def get_makefile_filename():
+@@ -225,7 +231,7 @@ def get_makefile_filename():
+         return os.path.join(os.path.dirname(os.path.realpath(sys.executable)),
+                             "Makefile")
+     lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
+-    return os.path.join(lib_dir, "config", "Makefile")
++    return os.path.join(lib_dir, "config", "Makefile").replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
+ 
+ 
+ def parse_config_h(fp, g=None):
diff --git a/recipes/python/python-2.6.6/debug.patch b/recipes/python/python-2.6.6/debug.patch
new file mode 100644
index 0000000..beb3adc
--- /dev/null
+++ b/recipes/python/python-2.6.6/debug.patch
@@ -0,0 +1,27 @@
+Index: Python-2.6.1/Lib/distutils/unixccompiler.py
+===================================================================
+--- Python-2.6.1.orig/Lib/distutils/unixccompiler.py	2009-11-13 16:04:54.000000000 +0000
++++ Python-2.6.1/Lib/distutils/unixccompiler.py	2009-11-13 16:06:27.000000000 +0000
+@@ -300,6 +300,8 @@
+         dylib_f = self.library_filename(lib, lib_type='dylib')
+         static_f = self.library_filename(lib, lib_type='static')
+ 
++        print "Looking in %s for %s" % (lib, dirs)
++
+         for dir in dirs:
+             shared = os.path.join(dir, shared_f)
+             dylib = os.path.join(dir, dylib_f)
+@@ -309,10 +311,13 @@
+             # assuming that *all* Unix C compilers do.  And of course I'm
+             # ignoring even GCC's "-static" option.  So sue me.
+             if os.path.exists(dylib):
++                print "Found %s" % (dylib)
+                 return dylib
+             elif os.path.exists(shared):
++                print "Found %s" % (shared)
+                 return shared
+             elif os.path.exists(static):
++                print "Found %s" % (static)
+                 return static
+ 
+         # Oops, didn't find it in *any* of 'dirs'
diff --git a/recipes/python/python-2.6.6/ipv6-cross.patch b/recipes/python/python-2.6.6/ipv6-cross.patch
new file mode 100644
index 0000000..3d2ac5e
--- /dev/null
+++ b/recipes/python/python-2.6.6/ipv6-cross.patch
@@ -0,0 +1,13 @@
+Index: Python-2.6.5/configure.in
+===================================================================
+--- Python-2.6.5.orig/configure.in	2011-01-15 14:42:42.068656002 -0800
++++ Python-2.6.5/configure.in	2011-01-15 15:18:39.668656002 -0800
+@@ -2951,7 +2951,7 @@
+ buggygetaddrinfo=yes
+ ])
+ 
+-if test "$buggygetaddrinfo" = "yes"; then
++if test "$buggygetaddrinfo" = "yes" -a x"$cross_compiling" != "xyes"; then
+ 	if test "$ipv6" = "yes"; then
+ 		echo 'Fatal: You must get working getaddrinfo() function.'
+ 		echo '       or you can specify "--disable-ipv6"'.
diff --git a/recipes/python/python-2.6.6/nohostlibs.patch b/recipes/python/python-2.6.6/nohostlibs.patch
new file mode 100644
index 0000000..cc9b28c
--- /dev/null
+++ b/recipes/python/python-2.6.6/nohostlibs.patch
@@ -0,0 +1,57 @@
+Index: Python-2.6.6/setup.py
+===================================================================
+--- Python-2.6.6.orig/setup.py
++++ Python-2.6.6/setup.py
+@@ -356,8 +356,8 @@ class PyBuildExt(build_ext):
+ 
+     def detect_modules(self):
+         # Ensure that /usr/local is always used
+-        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
+-        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
++        #add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
++        #add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+ 
+         # Add paths specified in the environment variables LDFLAGS and
+         # CPPFLAGS for header and library files.
+@@ -393,10 +393,10 @@ class PyBuildExt(build_ext):
+                     for directory in reversed(options.dirs):
+                         add_dir_to_list(dir_list, directory)
+ 
+-        if os.path.normpath(sys.prefix) != '/usr':
+-            add_dir_to_list(self.compiler.library_dirs,
++
++        add_dir_to_list(self.compiler.library_dirs,
+                             sysconfig.get_config_var("LIBDIR"))
+-            add_dir_to_list(self.compiler.include_dirs,
++        add_dir_to_list(self.compiler.include_dirs,
+                             sysconfig.get_config_var("INCLUDEDIR"))
+ 
+         try:
+@@ -407,11 +407,8 @@ class PyBuildExt(build_ext):
+         # lib_dirs and inc_dirs are used to search for files;
+         # if a file is found in one of those directories, it can
+         # be assumed that no additional -I,-L directives are needed.
+-        lib_dirs = self.compiler.library_dirs + [
+-            '/lib64', '/usr/lib64',
+-            '/lib', '/usr/lib',
+-            ]
+-        inc_dirs = self.compiler.include_dirs + ['/usr/include']
++        lib_dirs = self.compiler.library_dirs
++        inc_dirs = self.compiler.include_dirs
+         exts = []
+         missing = []
+ 
+@@ -661,8 +658,7 @@ class PyBuildExt(build_ext):
+                 pass # Issue 7384: Already linked against curses or tinfo.
+             elif curses_library:
+                 readline_libs.append(curses_library)
+-            elif self.compiler.find_library_file(lib_dirs +
+-                                               ['/usr/lib/termcap'],
++            elif self.compiler.find_library_file(lib_dirs,
+                                                'termcap'):
+                 readline_libs.append('termcap')
+             exts.append( Extension('readline', ['readline.c'],
+-                                   library_dirs=['/usr/lib/termcap'],
+                                    extra_link_args=readline_extra_link_args,
+                                    libraries=readline_libs) )
+         else:
diff --git a/recipes/python/python-2.6.6/sitecustomize.py b/recipes/python/python-2.6.6/sitecustomize.py
new file mode 100644
index 0000000..2739018
--- /dev/null
+++ b/recipes/python/python-2.6.6/sitecustomize.py
@@ -0,0 +1,45 @@
+# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# GPLv2 or later
+# Version: 20081123
+# Features:
+# * set proper default encoding
+# * enable readline completion in the interactive interpreter
+# * load command line history on startup
+# * save command line history on exit 
+
+import os
+
+def __exithandler():
+    try:
+        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+def __registerExitHandler():
+    import atexit
+    atexit.register( __exithandler )
+
+def __enableReadlineSupport():
+    readline.set_history_length( 1000 )
+    readline.parse_and_bind( "tab: complete" )
+    try:
+        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+def __enableDefaultEncoding():
+    import sys
+    try:
+        sys.setdefaultencoding( "utf8" )
+    except LookupError:
+        pass
+
+import sys
+try:
+    import rlcompleter, readline
+except ImportError:
+    pass
+else:
+    __enableDefaultEncoding()
+    __registerExitHandler()
+    __enableReadlineSupport()
diff --git a/recipes/python/python-native_2.6.5.bb b/recipes/python/python-native_2.6.5.bb
deleted file mode 100644
index 0fd6dcb..0000000
--- a/recipes/python/python-native_2.6.5.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-require python.inc
-DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
-PR = "${INC_PR}.2"
-
-FILESPATHPKG .= ":python-${PV}:python"
-SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
-           file://00-fix-parallel-make.patch \
-           file://00-fix-bindir-libdir-for-cross.patch \
-           file://04-default-is-optimized.patch \
-           file://05-enable-ctypes-cross-build.patch \
-           file://06-ctypes-libffi-fix-configure.patch \
-           file://10-distutils-fix-swig-parameter.patch \
-           file://11-distutils-never-modify-shebang-line.patch \
-           file://12-distutils-prefix-is-inside-staging-area.patch \
-           file://debug.patch \
-           file://nohostlibs.patch"
-SRC_URI[md5sum] = "6bef0417e71a1a1737ccf5750420fdb3"
-SRC_URI[sha256sum] = "62da62eb685621ede2be1275f11b89fa0e0be578db8daa5320d0a7855c0a9ebc"
-
-S = "${WORKDIR}/Python-${PV}"
-
-inherit native
-
-EXTRA_OECONF_append = '\
-  --enable-unicode=ucs4 \
-'
-
-EXTRA_OEMAKE = '\
-  BUILD_SYS="" \
-  HOST_SYS="" \
-  LIBC="" \
-  STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
-  STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
-'
-
-do_install() {
-	oe_runmake 'DESTDIR=${D}' install
-	install -d ${D}${bindir}/
-	install -m 0755 Parser/pgen ${D}${bindir}/
-
-	# Make sure we use /usr/bin/env python
-	for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
-		sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
-	done
-}
diff --git a/recipes/python/python-native_2.6.6.bb b/recipes/python/python-native_2.6.6.bb
new file mode 100644
index 0000000..2eef01d
--- /dev/null
+++ b/recipes/python/python-native_2.6.6.bb
@@ -0,0 +1,44 @@
+require python.inc
+DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
+PR = "${INC_PR}.0"
+
+FILESPATHPKG .= ":python-${PV}:python"
+SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+           file://00-fix-parallel-make.patch \
+           file://04-default-is-optimized.patch \
+           file://05-enable-ctypes-cross-build.patch \
+           file://06-ctypes-libffi-fix-configure.patch \
+           file://10-distutils-fix-swig-parameter.patch \
+           file://11-distutils-never-modify-shebang-line.patch \
+           file://12-distutils-prefix-is-inside-staging-area.patch \
+           file://debug.patch \
+           file://nohostlibs.patch"
+SRC_URI[md5sum] = "cf4e6881bb84a7ce6089e4a307f71f14"
+SRC_URI[sha256sum] = "134c5e0736bae2e5570d0b915693374f11108ded63c35a23a35d282737d2ce83"
+
+S = "${WORKDIR}/Python-${PV}"
+
+inherit native
+
+EXTRA_OECONF_append = '\
+  --enable-unicode=ucs4 \
+'
+
+EXTRA_OEMAKE = '\
+  BUILD_SYS="" \
+  HOST_SYS="" \
+  LIBC="" \
+  STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
+  STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
+'
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+	install -d ${D}${bindir}/
+	install -m 0755 Parser/pgen ${D}${bindir}/
+
+	# Make sure we use /usr/bin/env python
+	for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
+		sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
+	done
+}
diff --git a/recipes/python/python_2.6.5.bb b/recipes/python/python_2.6.5.bb
deleted file mode 100644
index d7d42a7..0000000
--- a/recipes/python/python_2.6.5.bb
+++ /dev/null
@@ -1,134 +0,0 @@
-require python.inc
-DEPENDS = "python-native db gdbm openssl readline sqlite3 tcl zlib\
-           ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
-DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-# set to .0 on every increase of INC_PR
-PR = "${INC_PR}.3"
-
-SRC_URI = "\
-  http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
-  file://00-fix-parallel-make.patch \
-  file://00-fix-bindir-libdir-for-cross.patch \
-  file://01-use-proper-tools-for-cross-build.patch \
-  file://02-remove-test-for-cross.patch \
-  file://03-fix-tkinter-detection.patch \
-  file://04-default-is-optimized.patch \
-  file://05-enable-ctypes-cross-build.patch \
-  file://06-ctypes-libffi-fix-configure.patch \
-  file://99-ignore-optimization-flag.patch \
-  file://ipv6-cross.patch \
-  file://sitecustomize.py \
-"
-SRC_URI[md5sum] = "6bef0417e71a1a1737ccf5750420fdb3"
-SRC_URI[sha256sum] = "62da62eb685621ede2be1275f11b89fa0e0be578db8daa5320d0a7855c0a9ebc"
-
-S = "${WORKDIR}/Python-${PV}"
-
-inherit autotools
-
-# The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
-#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
-TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
-TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
-
-do_configure_prepend() {
-	autoreconf -Wcross --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || oenote "_ctypes failed to autoreconf"
-}
-
-#
-# Copy config.h and an appropriate Makefile for distutils.sysconfig,
-# which laters uses the information out of these to compile extensions
-#
-do_compile_prepend() {
-	install -d ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
-	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
-	install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
-	install -m 0644 Makefile Makefile.orig
-	install -m 0644 Makefile Makefile.backup
-	sed -e 's,${includedir},${STAGING_INCDIR},' < Makefile.backup > Makefile
-	install -m 0644 Makefile Makefile.backup
-	sed -e 's,${libdir},${STAGING_LIBDIR},' < Makefile.backup > Makefile
-	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
-}
-
-do_compile() {
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-		OPT="${CFLAGS}" libpython${PYTHON_MAJMIN}.so
-
-	oe_libinstall -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
-
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-		RUNSHARED= OPT="${CFLAGS}"
-}
-
-do_install() {
-	install -m 0644 Makefile.orig Makefile
-	
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-		DESTDIR=${D} LIBDIR=${libdir} RUNSHARED= install
-
-	install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
-
-	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
-	sed -i -e s,ccache,'$(CCACHE)', ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
-}
-
-do_install_append() {
-	# remove unecessary files from python-distutils' packages
-	rm ${D}/${libdir}/python${PYTHON_MAJMIN}/config/libpython2.6.a
-	rm ${D}/${libdir}/python${PYTHON_MAJMIN}/distutils/command/win*
-}
-
-require python-${PYTHON_MAJMIN}-manifest.inc
-
-# manual dependency additions
-RPROVIDES_python-core = "python"
-RRECOMMENDS_python-core = "python-readline"
-RRECOMMENDS_python-crypt = "openssl"
-
-# add sitecustomize
-FILES_python-core += "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py"
-# ship 2to3
-FILES_python-core += "${bindir}/2to3"
-
-# package libpython2
-PACKAGES =+ "libpython2"
-FILES_libpython2 = "${libdir}/libpython*.so.*"
-
-# additional stuff -dev
-
-FILES_${PN}-dev += "\
-  ${includedir} \
-  ${libdir}/lib*${SOLIBSDEV} \
-  ${libdir}/*.la \
-  ${libdir}/*.a \
-  ${libdir}/*.o \
-  ${libdir}/pkgconfig \
-  ${base_libdir}/*.a \
-  ${base_libdir}/*.o \
-  ${datadir}/aclocal \
-  ${datadir}/pkgconfig \
-"
-
-# catch debug extensions (isn't that already in python-core-dbg?)
-FILES_python-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
-
-# catch all the rest (unsorted)
-PACKAGES += "python-misc"
-FILES_python-misc = "${libdir}/python${PYTHON_MAJMIN}"
-
-# catch manpage
-PACKAGES += "python-man"
-FILES_python-man = "${datadir}/man"
diff --git a/recipes/python/python_2.6.6.bb b/recipes/python/python_2.6.6.bb
new file mode 100644
index 0000000..4152554
--- /dev/null
+++ b/recipes/python/python_2.6.6.bb
@@ -0,0 +1,132 @@
+require python.inc
+DEPENDS = "python-native db gdbm openssl readline sqlite3 tcl zlib\
+           ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
+DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
+# set to .0 on every increase of INC_PR
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+  file://00-fix-parallel-make.patch \
+  file://01-use-proper-tools-for-cross-build.patch \
+  file://02-remove-test-for-cross.patch \
+  file://03-fix-tkinter-detection.patch \
+  file://04-default-is-optimized.patch \
+  file://05-enable-ctypes-cross-build.patch \
+  file://06-ctypes-libffi-fix-configure.patch \
+  file://ipv6-cross.patch \
+  file://sitecustomize.py \
+"
+SRC_URI[md5sum] = "cf4e6881bb84a7ce6089e4a307f71f14"
+SRC_URI[sha256sum] = "134c5e0736bae2e5570d0b915693374f11108ded63c35a23a35d282737d2ce83"
+
+S = "${WORKDIR}/Python-${PV}"
+
+inherit autotools
+
+# The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
+#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
+TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
+TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
+
+do_configure_prepend() {
+	autoreconf -Wcross --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || oenote "_ctypes failed to autoreconf"
+}
+
+#
+# Copy config.h and an appropriate Makefile for distutils.sysconfig,
+# which laters uses the information out of these to compile extensions
+#
+do_compile_prepend() {
+	install -d ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
+	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
+	install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
+	install -m 0644 Makefile Makefile.orig
+	install -m 0644 Makefile Makefile.backup
+	sed -e 's,${includedir},${STAGING_INCDIR},' < Makefile.backup > Makefile
+	install -m 0644 Makefile Makefile.backup
+	sed -e 's,${libdir},${STAGING_LIBDIR},' < Makefile.backup > Makefile
+	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
+}
+
+do_compile() {
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		OPT="${CFLAGS}" libpython${PYTHON_MAJMIN}.so
+
+	oe_libinstall -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
+
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		RUNSHARED= OPT="${CFLAGS}"
+}
+
+do_install() {
+	install -m 0644 Makefile.orig Makefile
+	
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		DESTDIR=${D} LIBDIR=${libdir} RUNSHARED= install
+
+	install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
+
+	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
+	sed -i -e s,ccache,'$(CCACHE)', ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+}
+
+do_install_append() {
+	# remove unecessary files from python-distutils' packages
+	rm ${D}/${libdir}/python${PYTHON_MAJMIN}/config/libpython2.6.a
+	rm ${D}/${libdir}/python${PYTHON_MAJMIN}/distutils/command/win*
+}
+
+require python-${PYTHON_MAJMIN}-manifest.inc
+
+# manual dependency additions
+RPROVIDES_python-core = "python"
+RRECOMMENDS_python-core = "python-readline"
+RRECOMMENDS_python-crypt = "openssl"
+
+# add sitecustomize
+FILES_python-core += "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py"
+# ship 2to3
+FILES_python-core += "${bindir}/2to3"
+
+# package libpython2
+PACKAGES =+ "libpython2"
+FILES_libpython2 = "${libdir}/libpython*.so.*"
+
+# additional stuff -dev
+
+FILES_${PN}-dev += "\
+  ${includedir} \
+  ${libdir}/lib*${SOLIBSDEV} \
+  ${libdir}/*.la \
+  ${libdir}/*.a \
+  ${libdir}/*.o \
+  ${libdir}/pkgconfig \
+  ${base_libdir}/*.a \
+  ${base_libdir}/*.o \
+  ${datadir}/aclocal \
+  ${datadir}/pkgconfig \
+"
+
+# catch debug extensions (isn't that already in python-core-dbg?)
+FILES_python-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
+
+# catch all the rest (unsorted)
+PACKAGES += "python-misc"
+FILES_python-misc = "${libdir}/python${PYTHON_MAJMIN}"
+
+# catch manpage
+PACKAGES += "python-man"
+FILES_python-man = "${datadir}/man"
-- 
1.7.4.1



