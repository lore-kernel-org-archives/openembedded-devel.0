Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Nbx8M-0006Oa-4V
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 15:20:13 +0100
Received: from [192.168.1.12] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by drlauer-research.com (Postfix) with ESMTP id 88C6C5847EE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2010 16:10:34 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1077)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <1264719083-19638-2-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 1 Feb 2010 15:17:44 +0100
Message-Id: <B145218B-3E97-48C6-B342-225BDCA1FB26@vanille-media.de>
References: <1264719083-19638-1-git-send-email-Martin.Jansa@gmail.com>
	<1264719083-19638-2-git-send-email-Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] python: add version 2.6.4
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
X-List-Received-Date: Mon, 01 Feb 2010 14:20:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Great work, thanks!

Acked-by: Michael 'Mickey' Lauer <mickey@vanille-media.de>

Am 28.01.2010 um 23:51 schrieb Martin Jansa:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> .../00-fix-bindir-libdir-for-cross.patch           |   20 +++
> .../01-use-proper-tools-for-cross-build.patch      |  116 =
++++++++++++++++
> .../python-2.6.4/02-remove-test-for-cross.patch    |   94 =
+++++++++++++
> .../python-2.6.4/03-fix-tkinter-detection.patch    |   40 ++++++
> .../python-2.6.4/04-default-is-optimized.patch     |   52 ++++++++
> .../05-enable-ctypes-cross-build.patch             |   28 ++++
> .../python-2.6.4/99-ignore-optimization-flag.patch |   19 +++
> recipes/python/python-2.6.4/sitecustomize.py       |   45 +++++++
> .../00-fix-bindir-libdir-for-cross.patch           |   20 +++
> .../04-default-is-optimized.patch                  |   18 +++
> .../10-distutils-fix-swig-parameter.patch          |   16 +++
> .../11-distutils-never-modify-shebang-line.patch   |   18 +++
> ...2-distutils-prefix-is-inside-staging-area.patch |   60 +++++++++
> recipes/python/python-native-2.6.4/debug.patch     |   27 ++++
> .../python/python-native-2.6.4/nohostlibs.patch    |   53 ++++++++
> .../python/python-native-2.6.4/sitecustomize.py    |   45 +++++++
> recipes/python/python-native_2.6.4.bb              |   33 +++++
> recipes/python/python_2.6.4.bb                     |  139 =
++++++++++++++++++++
> 18 files changed, 843 insertions(+), 0 deletions(-)
> create mode 100644 =
recipes/python/python-2.6.4/00-fix-bindir-libdir-for-cross.patch
> create mode 100644 =
recipes/python/python-2.6.4/01-use-proper-tools-for-cross-build.patch
> create mode 100644 =
recipes/python/python-2.6.4/02-remove-test-for-cross.patch
> create mode 100644 =
recipes/python/python-2.6.4/03-fix-tkinter-detection.patch
> create mode 100644 =
recipes/python/python-2.6.4/04-default-is-optimized.patch
> create mode 100644 =
recipes/python/python-2.6.4/05-enable-ctypes-cross-build.patch
> create mode 100644 =
recipes/python/python-2.6.4/99-ignore-optimization-flag.patch
> create mode 100644 recipes/python/python-2.6.4/sitecustomize.py
> create mode 100644 =
recipes/python/python-native-2.6.4/00-fix-bindir-libdir-for-cross.patch
> create mode 100644 =
recipes/python/python-native-2.6.4/04-default-is-optimized.patch
> create mode 100644 =
recipes/python/python-native-2.6.4/10-distutils-fix-swig-parameter.patch
> create mode 100644 =
recipes/python/python-native-2.6.4/11-distutils-never-modify-shebang-line.=
patch
> create mode 100644 =
recipes/python/python-native-2.6.4/12-distutils-prefix-is-inside-staging-a=
rea.patch
> create mode 100644 recipes/python/python-native-2.6.4/debug.patch
> create mode 100644 recipes/python/python-native-2.6.4/nohostlibs.patch
> create mode 100644 recipes/python/python-native-2.6.4/sitecustomize.py
> create mode 100644 recipes/python/python-native_2.6.4.bb
> create mode 100644 recipes/python/python_2.6.4.bb
>=20
> diff --git =
a/recipes/python/python-2.6.4/00-fix-bindir-libdir-for-cross.patch =
b/recipes/python/python-2.6.4/00-fix-bindir-libdir-for-cross.patch
> new file mode 100644
> index 0000000..2559e3a
> --- /dev/null
> +++ b/recipes/python/python-2.6.4/00-fix-bindir-libdir-for-cross.patch
> @@ -0,0 +1,20 @@
> +# $(exec_prefix) points to the wrong directory, when installing
> +# a cross-build. @bindir@ and @libdir@ works better and doesn't
> +# affect the native build.
> +# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> +
> +Index: Python-2.6.1/Makefile.pre.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1.orig/Makefile.pre.in
> ++++ Python-2.6.1/Makefile.pre.in
> +@@ -86,8 +86,8 @@ exec_prefix=3D	@exec_prefix@
> + datarootdir=3D    @datarootdir@
> +=20
> + # Expanded directories
> +-BINDIR=3D		$(exec_prefix)/bin
> +-LIBDIR=3D		$(exec_prefix)/lib
> ++BINDIR=3D		@bindir@
> ++LIBDIR=3D		@libdir@
> + MANDIR=3D		@mandir@
> + INCLUDEDIR=3D	@includedir@
> + CONFINCLUDEDIR=3D	$(exec_prefix)/include
> diff --git =
a/recipes/python/python-2.6.4/01-use-proper-tools-for-cross-build.patch =
b/recipes/python/python-2.6.4/01-use-proper-tools-for-cross-build.patch
> new file mode 100644
> index 0000000..e89faa4
> --- /dev/null
> +++ =
b/recipes/python/python-2.6.4/01-use-proper-tools-for-cross-build.patch
> @@ -0,0 +1,116 @@
> +# We need to ensure our host tools get run during build, not the =
freshly
> +# built cross-tools (this will not work), so we introduce HOSTPYTHON =
and HOSTPGEN.
> +# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> +
> +Index: Python-2.6.1/Makefile.pre.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1.orig/Makefile.pre.in
> ++++ Python-2.6.1/Makefile.pre.in
> +@@ -175,6 +175,7 @@ UNICODE_OBJS=3D   @UNICODE_OBJS@
> +=20
> + PYTHON=3D		python$(EXE)
> + BUILDPYTHON=3D	python$(BUILDEXE)
> ++HOSTPYTHON=3D	$(BUILDPYTHON)
> +=20
> + # The task to run while instrument when building the profile-opt =
target
> + PROFILE_TASK=3D	$(srcdir)/Tools/pybench/pybench.py -n 2 =
--with-gc --with-syscheck
> +@@ -205,7 +206,7 @@ GRAMMAR_INPUT=3D	$(srcdir)/Grammar/Grammar
> + =
##########################################################################=

> + # Parser
> + PGEN=3D		Parser/pgen$(EXE)
> +-
> ++HOSTPGEN=3D	$(PGEN)$(EXE)
> + POBJS=3D		\
> + 		Parser/acceler.o \
> + 		Parser/grammar1.o \
> +@@ -394,8 +395,8 @@ platform: $(BUILDPYTHON)
> + # Build the shared modules
> + sharedmods: $(BUILDPYTHON)
> + 	@case $$MAKEFLAGS in \
> +-	*s*) $(RUNSHARED) CC=3D'$(CC)' LDSHARED=3D'$(BLDSHARED)' =
OPT=3D'$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
> +-	*) $(RUNSHARED) CC=3D'$(CC)' LDSHARED=3D'$(BLDSHARED)' =
OPT=3D'$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
> ++	*s*) $(RUNSHARED) CC=3D'$(CC)' LDSHARED=3D'$(BLDSHARED)' =
OPT=3D'$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
> ++	*) $(RUNSHARED) CC=3D'$(CC)' LDSHARED=3D'$(BLDSHARED)' =
OPT=3D'$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
> + 	esac
> +=20
> + # Build static library
> +@@ -513,7 +514,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
> +=20
> + $(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
> + 		-@$(INSTALL) -d Include
> +-		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
> ++		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
> +=20
> + $(PGEN):	$(PGENOBJS)
> + 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
> +@@ -879,23 +880,23 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
> + 	done
> + 	$(INSTALL_DATA) $(srcdir)/LICENSE =
$(DESTDIR)$(LIBDEST)/LICENSE.txt
> + 	PYTHONPATH=3D$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
> +-		./$(BUILDPYTHON) -Wi -tt =
$(DESTDIR)$(LIBDEST)/compileall.py \
> ++		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py =
\
> + 		-d $(LIBDEST) -f \
> + 		-x 'bad_coding|badsyntax|site-packages' =
$(DESTDIR)$(LIBDEST)
> + 	PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> +-		./$(BUILDPYTHON) -Wi -tt -O =
$(DESTDIR)$(LIBDEST)/compileall.py \
> ++		$(HOSTPYTHON) -Wi -tt -O =
$(DESTDIR)$(LIBDEST)/compileall.py \
> + 		-d $(LIBDEST) -f \
> + 		-x 'bad_coding|badsyntax|site-packages' =
$(DESTDIR)$(LIBDEST)
> + 	-PYTHONPATH=3D$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
> +-		./$(BUILDPYTHON) -Wi -t =
$(DESTDIR)$(LIBDEST)/compileall.py \
> ++		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py =
\
> + 		-d $(LIBDEST)/site-packages -f \
> + 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
> + 	-PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> +-		./$(BUILDPYTHON) -Wi -t -O =
$(DESTDIR)$(LIBDEST)/compileall.py \
> ++		$(HOSTPYTHON) -Wi -t -O =
$(DESTDIR)$(LIBDEST)/compileall.py \
> + 		-d $(LIBDEST)/site-packages -f \
> + 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
> + 	-PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> +-		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, =
lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
> ++		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, =
lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
> +=20
> + # Create the PLATDIR source directory, if one wasn't distributed..
> + $(srcdir)/Lib/$(PLATDIR):
> +@@ -993,7 +994,7 @@ libainstall:	all
> + # Install the dynamically loadable modules
> + # This goes into $(exec_prefix)
> + sharedinstall:
> +-	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
> ++	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
> + 	   	--prefix=3D$(prefix) \
> + 		--install-scripts=3D$(BINDIR) \
> + 		--install-platlib=3D$(DESTSHARED) \
> +Index: Python-2.6.1/setup.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1.orig/setup.py
> ++++ Python-2.6.1/setup.py
> +@@ -276,6 +276,7 @@ class PyBuildExt(build_ext):
> +             self.failed.append(ext.name)
> +             self.announce('*** WARNING: renaming "%s" since =
importing it'
> +                           ' failed: %s' % (ext.name, why), level=3D3)
> ++            return
> +             assert not self.inplace
> +             basename, tail =3D os.path.splitext(ext_filename)
> +             newname =3D basename + "_failed" + tail
> +@@ -310,8 +311,8 @@ class PyBuildExt(build_ext):
> +=20
> +     def detect_modules(self):
> +         # Ensure that /usr/local is always used
> +-        add_dir_to_list(self.compiler.library_dirs, =
'/usr/local/lib')
> +-        add_dir_to_list(self.compiler.include_dirs, =
'/usr/local/include')
> ++        # add_dir_to_list(self.compiler.library_dirs, =
'/usr/local/lib')
> ++        # add_dir_to_list(self.compiler.include_dirs, =
'/usr/local/include')
> +=20
> +         # Add paths specified in the environment variables LDFLAGS =
and
> +         # CPPFLAGS for header and library files.
> +@@ -410,6 +411,9 @@ class PyBuildExt(build_ext):
> +=20
> +         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
> +=20
> ++        lib_dirs =3D [ os.getenv( "STAGING_LIBDIR" ) ]
> ++        inc_dirs =3D [ os.getenv( "STAGING_INCDIR" ) ]
> ++
> +         #
> +         # The following modules are all pretty straightforward, and =
compile
> +         # on pretty much any POSIXish platform.
> diff --git =
a/recipes/python/python-2.6.4/02-remove-test-for-cross.patch =
b/recipes/python/python-2.6.4/02-remove-test-for-cross.patch
> new file mode 100644
> index 0000000..48386ea
> --- /dev/null
> +++ b/recipes/python/python-2.6.4/02-remove-test-for-cross.patch
> @@ -0,0 +1,94 @@
> +# OpenEmbedded prepopulates the autotools site cache, so if this
> +# would be using AC_TRY_CACHE, we could patch it in a more sane way
> +# Alas, I don't have enough autotalent to do that.
> +#
> +# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> +Index: Python-2.6.1/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1.orig/configure.in
> ++++ Python-2.6.1/configure.in
> +@@ -2556,38 +2556,6 @@ AC_CHECK_LIB(c, inet_aton, [$ac_cv_prog_
> +   AC_CHECK_LIB(resolv, inet_aton)
> + )
> +=20
> +-# On Tru64, chflags seems to be present, but calling it will
> +-# exit Python
> +-AC_MSG_CHECKING(for chflags)
> +-AC_TRY_RUN([
> +-#include <sys/stat.h>
> +-#include <unistd.h>
> +-int main(int argc, char*argv[])
> +-{
> +-  if(chflags(argv[0], 0) !=3D 0)
> +-    return 1;
> +-  return 0;
> +-}
> +-],AC_DEFINE(HAVE_CHFLAGS, 1, Define to 1 if you have the `chflags' =
function.)
> +-  AC_MSG_RESULT(yes),
> +-  AC_MSG_RESULT(no)
> +-)
> +-
> +-AC_MSG_CHECKING(for lchflags)
> +-AC_TRY_RUN([
> +-#include <sys/stat.h>
> +-#include <unistd.h>
> +-int main(int argc, char*argv[])
> +-{
> +-  if(lchflags(argv[0], 0) !=3D 0)
> +-    return 1;
> +-  return 0;
> +-}
> +-],AC_DEFINE(HAVE_LCHFLAGS, 1, Define to 1 if you have the `lchflags' =
function.)
> +-  AC_MSG_RESULT(yes),
> +-  AC_MSG_RESULT(no)
> +-)
> +-
> + dnl Check if system zlib has *Copy() functions
> + dnl
> + dnl On MacOSX the linker will search for dylibs on the entire linker =
path
> +@@ -3649,45 +3617,6 @@ else
> +   AC_MSG_RESULT(no)
> + fi
> +=20
> +-AC_MSG_CHECKING(for %zd printf() format support)
> +-AC_TRY_RUN([#include <stdio.h>
> +-#include <stddef.h>
> +-#include <string.h>
> +-
> +-#ifdef HAVE_SYS_TYPES_H
> +-#include <sys/types.h>
> +-#endif
> +-
> +-#ifdef HAVE_SSIZE_T
> +-typedef ssize_t Py_ssize_t;
> +-#elif SIZEOF_VOID_P =3D=3D SIZEOF_LONG
> +-typedef long Py_ssize_t;
> +-#else
> +-typedef int Py_ssize_t;
> +-#endif
> +-
> +-int main()
> +-{
> +-    char buffer[256];
> +-
> +-    if(sprintf(buffer, "%zd", (size_t)123) < 0)
> +-       	return 1;
> +-
> +-    if (strcmp(buffer, "123"))
> +-	return 1;
> +-
> +-    if (sprintf(buffer, "%zd", (Py_ssize_t)-123) < 0)
> +-       	return 1;
> +-
> +-    if (strcmp(buffer, "-123"))
> +-	return 1;
> +-
> +-    return 0;
> +-}],
> +-[AC_MSG_RESULT(yes)
> +- AC_DEFINE(PY_FORMAT_SIZE_T, "z", [Define to printf format modifier =
for Py_ssize_t])],
> +- AC_MSG_RESULT(no))
> +-
> + AC_CHECK_TYPE(socklen_t,,
> +   AC_DEFINE(socklen_t,int,
> +             Define to `int' if <sys/socket.h> does not define.),[
> diff --git =
a/recipes/python/python-2.6.4/03-fix-tkinter-detection.patch =
b/recipes/python/python-2.6.4/03-fix-tkinter-detection.patch
> new file mode 100644
> index 0000000..a1a385a
> --- /dev/null
> +++ b/recipes/python/python-2.6.4/03-fix-tkinter-detection.patch
> @@ -0,0 +1,40 @@
> +# We need to supply STAGING_INCDIR here, otherwise the Tk headers
> +# will not be found.
> +# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
> +
> +Index: Python-2.6.1/setup.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1.orig/setup.py
> ++++ Python-2.6.1/setup.py
> +@@ -1543,7 +1543,7 @@ class PyBuildExt(build_ext):
> +                 dotversion =3D dotversion[:-1] + '.' + =
dotversion[-1]
> +             tcl_include_sub =3D []
> +             tk_include_sub =3D []
> +-            for dir in inc_dirs:
> ++            for dir in [os.getenv("STAGING_INCDIR")]:
> +                 tcl_include_sub +=3D [dir + os.sep + "tcl" + =
dotversion]
> +                 tk_include_sub +=3D [dir + os.sep + "tk" + =
dotversion]
> +             tk_include_sub +=3D tcl_include_sub
> +@@ -1562,22 +1562,6 @@ class PyBuildExt(build_ext):
> +             if dir not in include_dirs:
> +                 include_dirs.append(dir)
> +=20
> +-        # Check for various platform-specific directories
> +-        if platform =3D=3D 'sunos5':
> +-            include_dirs.append('/usr/openwin/include')
> +-            added_lib_dirs.append('/usr/openwin/lib')
> +-        elif os.path.exists('/usr/X11R6/include'):
> +-            include_dirs.append('/usr/X11R6/include')
> +-            added_lib_dirs.append('/usr/X11R6/lib64')
> +-            added_lib_dirs.append('/usr/X11R6/lib')
> +-        elif os.path.exists('/usr/X11R5/include'):
> +-            include_dirs.append('/usr/X11R5/include')
> +-            added_lib_dirs.append('/usr/X11R5/lib')
> +-        else:
> +-            # Assume default location for X11
> +-            include_dirs.append('/usr/X11/include')
> +-            added_lib_dirs.append('/usr/X11/lib')
> +-
> +         # If Cygwin, then verify that X is installed before =
proceeding
> +         if platform =3D=3D 'cygwin':
> +             x11_inc =3D find_file('X11/Xlib.h', [], include_dirs)
> diff --git a/recipes/python/python-2.6.4/04-default-is-optimized.patch =
b/recipes/python/python-2.6.4/04-default-is-optimized.patch
> new file mode 100644
> index 0000000..805f4f6
> --- /dev/null
> +++ b/recipes/python/python-2.6.4/04-default-is-optimized.patch
> @@ -0,0 +1,52 @@
> +# when compiling for an embedded system, we need every bit of
> +# performance we can get. default to optimized with the option
> +# of opt-out.
> +# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> +
> +Index: Python-2.6.1/Python/compile.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1.orig/Python/compile.c
> ++++ Python-2.6.1/Python/compile.c
> +@@ -32,7 +32,7 @@
> + #include "symtable.h"
> + #include "opcode.h"
> +=20
> +-int Py_OptimizeFlag =3D 0;
> ++int Py_OptimizeFlag =3D 1;
> +=20
> + #define DEFAULT_BLOCK_SIZE 16
> + #define DEFAULT_BLOCKS 8
> +Index: Python-2.6.1/Modules/main.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1.orig/Modules/main.c
> ++++ Python-2.6.1/Modules/main.c
> +@@ -40,7 +40,7 @@ static char **orig_argv;
> + static int  orig_argc;
> +=20
> + /* command line options */
> +-#define BASE_OPTS "3bBc:dEhiJm:OQ:sStuUvVW:xX?"
> ++#define BASE_OPTS "3bBc:dEhiJm:NOQ:sStuUvVW:xX?"
> +=20
> + #ifndef RISCOS
> + #define PROGRAM_OPTS BASE_OPTS
> +@@ -69,8 +69,7 @@ Options and arguments (and corresponding
> + static char *usage_2 =3D "\
> +          if stdin does not appear to be a terminal; also =
PYTHONINSPECT=3Dx\n\
> + -m mod : run library module as a script (terminates option list)\n\
> +--O     : optimize generated bytecode slightly; also =
PYTHONOPTIMIZE=3Dx\n\
> +--OO    : remove doc-strings in addition to the -O optimizations\n\
> ++-N     : do NOT optimize generated bytecode\n\
> + -Q arg : division options: -Qold (default), -Qwarn, -Qwarnall, =
-Qnew\n\
> + -s     : don't add user site directory to sys.path; also =
PYTHONNOUSERSITE\n\
> + -S     : don't imply 'import site' on initialization\n\
> +@@ -353,8 +352,8 @@ Py_Main(int argc, char **argv)
> +=20
> + 		/* case 'J': reserved for Jython */
> +=20
> +-		case 'O':
> +-			Py_OptimizeFlag++;
> ++		case 'N':
> ++			Py_OptimizeFlag=3D0;
> + 			break;
> +=20
> + 		case 'B':
> diff --git =
a/recipes/python/python-2.6.4/05-enable-ctypes-cross-build.patch =
b/recipes/python/python-2.6.4/05-enable-ctypes-cross-build.patch
> new file mode 100644
> index 0000000..58b8078
> --- /dev/null
> +++ b/recipes/python/python-2.6.4/05-enable-ctypes-cross-build.patch
> @@ -0,0 +1,28 @@
> +# CTypes need to know the actual host we are building on.
> +# Signed-Off: Michael Dietrich <mdt@emdete.de>
> +
> +Index: Python-2.6.1/setup.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1.orig/setup.py
> ++++ Python-2.6.1/setup.py
> +@@ -1656,16 +1656,16 @@ class PyBuildExt(build_ext):
> +                                          ffi_configfile):
> +                 from distutils.dir_util import mkpath
> +                 mkpath(ffi_builddir)
> +-                config_args =3D []
> ++                config_args =3D ['--host=3D%s' % =
os.environ["HOST_SYS"], ]
> +=20
> +                 # Pass empty CFLAGS because we'll just append the =
resulting
> +                 # CFLAGS to Python's; -g or -O2 is to be avoided.
> +-                cmd =3D "cd %s && env CFLAGS=3D'' '%s/configure' %s" =
\
> +-                      % (ffi_builddir, ffi_srcdir, " =
".join(config_args))
> ++                cmd =3D "(cd %s && autoconf -W cross) && (cd %s && =
env CFLAGS=3D'' '%s/configure' %s)" \
> ++                      % (ffi_srcdir, ffi_builddir, ffi_srcdir, " =
".join(config_args))
> +=20
> +                 res =3D os.system(cmd)
> +                 if res or not os.path.exists(ffi_configfile):
> +-                    print "Failed to configure _ctypes module"
> ++                    print "Failed to configure _ctypes module =
(res=3D%d) or missing conffile=3D%s" % ( res, ffi_configfile )
> +                     return False
> +=20
> +             fficonfig =3D {}
> diff --git =
a/recipes/python/python-2.6.4/99-ignore-optimization-flag.patch =
b/recipes/python/python-2.6.4/99-ignore-optimization-flag.patch
> new file mode 100644
> index 0000000..02dc44c
> --- /dev/null
> +++ b/recipes/python/python-2.6.4/99-ignore-optimization-flag.patch
> @@ -0,0 +1,19 @@
> +# Reinstate the empty -O option to fix weird mixing of native and =
target
> +# binaries and libraries with LD_LIBRARY_PATH when host=3D=3Dtarget
> +#
> +# Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> +
> +Index: Python-2.6.1/Modules/main.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1-orig/Modules/main.c
> ++++ Python-2.6.1/Modules/main.c
> +@@ -352,6 +352,9 @@ Py_Main(int argc, char **argv)
> +=20
> + 		/* case 'J': reserved for Jython */
> +=20
> ++		case 'O': /* ignore it */
> ++			break;
> ++
> + 		case 'N':
> + 			Py_OptimizeFlag=3D0;
> + 			break;
> diff --git a/recipes/python/python-2.6.4/sitecustomize.py =
b/recipes/python/python-2.6.4/sitecustomize.py
> new file mode 100644
> index 0000000..2739018
> --- /dev/null
> +++ b/recipes/python/python-2.6.4/sitecustomize.py
> @@ -0,0 +1,45 @@
> +# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer =
<mlauer@vanille-media.de>
> +# GPLv2 or later
> +# Version: 20081123
> +# Features:
> +# * set proper default encoding
> +# * enable readline completion in the interactive interpreter
> +# * load command line history on startup
> +# * save command line history on exit=20
> +
> +import os
> +
> +def __exithandler():
> +    try:
> +        readline.write_history_file( "%s/.python-history" % =
os.getenv( "HOME", "/tmp" ) )
> +    except IOError:
> +        pass
> +
> +def __registerExitHandler():
> +    import atexit
> +    atexit.register( __exithandler )
> +
> +def __enableReadlineSupport():
> +    readline.set_history_length( 1000 )
> +    readline.parse_and_bind( "tab: complete" )
> +    try:
> +        readline.read_history_file( "%s/.python-history" % os.getenv( =
"HOME", "/tmp" ) )
> +    except IOError:
> +        pass
> +
> +def __enableDefaultEncoding():
> +    import sys
> +    try:
> +        sys.setdefaultencoding( "utf8" )
> +    except LookupError:
> +        pass
> +
> +import sys
> +try:
> +    import rlcompleter, readline
> +except ImportError:
> +    pass
> +else:
> +    __enableDefaultEncoding()
> +    __registerExitHandler()
> +    __enableReadlineSupport()
> diff --git =
a/recipes/python/python-native-2.6.4/00-fix-bindir-libdir-for-cross.patch =
b/recipes/python/python-native-2.6.4/00-fix-bindir-libdir-for-cross.patch
> new file mode 100644
> index 0000000..2559e3a
> --- /dev/null
> +++ =
b/recipes/python/python-native-2.6.4/00-fix-bindir-libdir-for-cross.patch
> @@ -0,0 +1,20 @@
> +# $(exec_prefix) points to the wrong directory, when installing
> +# a cross-build. @bindir@ and @libdir@ works better and doesn't
> +# affect the native build.
> +# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> +
> +Index: Python-2.6.1/Makefile.pre.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1.orig/Makefile.pre.in
> ++++ Python-2.6.1/Makefile.pre.in
> +@@ -86,8 +86,8 @@ exec_prefix=3D	@exec_prefix@
> + datarootdir=3D    @datarootdir@
> +=20
> + # Expanded directories
> +-BINDIR=3D		$(exec_prefix)/bin
> +-LIBDIR=3D		$(exec_prefix)/lib
> ++BINDIR=3D		@bindir@
> ++LIBDIR=3D		@libdir@
> + MANDIR=3D		@mandir@
> + INCLUDEDIR=3D	@includedir@
> + CONFINCLUDEDIR=3D	$(exec_prefix)/include
> diff --git =
a/recipes/python/python-native-2.6.4/04-default-is-optimized.patch =
b/recipes/python/python-native-2.6.4/04-default-is-optimized.patch
> new file mode 100644
> index 0000000..5131e0b
> --- /dev/null
> +++ b/recipes/python/python-native-2.6.4/04-default-is-optimized.patch
> @@ -0,0 +1,18 @@
> +# When compiling for an embedded system, we need every bit of
> +# performance we can get. default to optimized with the option
> +# of opt-out.
> +# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> +
> +Index: Python-2.6.1/Python/compile.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1.orig/Python/compile.c
> ++++ Python-2.6.1/Python/compile.c
> +@@ -32,7 +32,7 @@
> + #include "symtable.h"
> + #include "opcode.h"
> +=20
> +-int Py_OptimizeFlag =3D 0;
> ++int Py_OptimizeFlag =3D 1;
> +=20
> + #define DEFAULT_BLOCK_SIZE 16
> + #define DEFAULT_BLOCKS 8
> diff --git =
a/recipes/python/python-native-2.6.4/10-distutils-fix-swig-parameter.patch=
 =
b/recipes/python/python-native-2.6.4/10-distutils-fix-swig-parameter.patch=

> new file mode 100644
> index 0000000..f5e852a
> --- /dev/null
> +++ =
b/recipes/python/python-native-2.6.4/10-distutils-fix-swig-parameter.patch=

> @@ -0,0 +1,16 @@
> +# Some versions of SWIG do not use the extension parameter.
> +# Make it optional.
> +# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> +Index: Python-2.6.1/Lib/distutils/command/build_ext.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1.orig/Lib/distutils/command/build_ext.py
> ++++ Python-2.6.1/Lib/distutils/command/build_ext.py
> +@@ -566,7 +566,7 @@ class build_ext (Command):
> +             target_lang=3Dlanguage)
> +=20
> +=20
> +-    def swig_sources (self, sources, extension):
> ++    def swig_sources (self, sources, extension=3DNone):
> +=20
> +         """Walk the list of source files in 'sources', looking for =
SWIG
> +         interface (.i) files.  Run SWIG on all that are found, and
> diff --git =
a/recipes/python/python-native-2.6.4/11-distutils-never-modify-shebang-lin=
e.patch =
b/recipes/python/python-native-2.6.4/11-distutils-never-modify-shebang-lin=
e.patch
> new file mode 100644
> index 0000000..8354e26
> --- /dev/null
> +++ =
b/recipes/python/python-native-2.6.4/11-distutils-never-modify-shebang-lin=
e.patch
> @@ -0,0 +1,18 @@
> +# Don't modify the she-bang line for a cross-build.
> +# Otherwise it points to our hostpython (which we do not want)
> +#
> +# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> +
> +Index: Python-2.6.1/Lib/distutils/command/build_scripts.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1.orig/Lib/distutils/command/build_scripts.py
> ++++ Python-2.6.1/Lib/distutils/command/build_scripts.py
> +@@ -87,7 +87,7 @@ class build_scripts (Command):
> +                     continue
> +=20
> +                 match =3D first_line_re.match(first_line)
> +-                if match:
> ++                if False: #match:
> +                     adjust =3D 1
> +                     post_interp =3D match.group(1) or ''
> +=20
> diff --git =
a/recipes/python/python-native-2.6.4/12-distutils-prefix-is-inside-staging=
-area.patch =
b/recipes/python/python-native-2.6.4/12-distutils-prefix-is-inside-staging=
-area.patch
> new file mode 100644
> index 0000000..aa43936
> --- /dev/null
> +++ =
b/recipes/python/python-native-2.6.4/12-distutils-prefix-is-inside-staging=
-area.patch
> @@ -0,0 +1,60 @@
> +# The proper prefix is inside our staging area.
> +# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> +
> +Index: Python-2.6.1/Lib/distutils/sysconfig.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1.orig/Lib/distutils/sysconfig.py
> ++++ Python-2.6.1/Lib/distutils/sysconfig.py
> +@@ -19,8 +19,8 @@ import sys
> + from distutils.errors import DistutilsPlatformError
> +=20
> + # These are needed in a couple of spots, so just compute them once.
> +-PREFIX =3D os.path.normpath(sys.prefix)
> +-EXEC_PREFIX =3D os.path.normpath(sys.exec_prefix)
> ++PREFIX =3D os.path.normpath(sys.prefix).replace( =
os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> ++EXEC_PREFIX =3D os.path.normpath(sys.exec_prefix).replace( =
os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> +=20
> + # Path to the base directory of the project. On Windows the binary =
may
> + # live in project/PCBuild9.  If we're dealing with an x64 Windows =
build,
> +@@ -70,7 +70,10 @@ def get_python_inc(plat_specific=3D0, pref
> +     sys.exec_prefix -- i.e., ignore 'plat_specific'.
> +     """
> +     if prefix is None:
> +-        prefix =3D plat_specific and EXEC_PREFIX or PREFIX
> ++        if plat_specific:
> ++            prefix =3D plat_specific and =
os.environ['STAGING_INCDIR'].rstrip('include')
> ++        else:
> ++            prefix =3D plat_specific and EXEC_PREFIX or PREFIX
> +     if os.name =3D=3D "posix":
> +         if python_build:
> +             base =3D =
os.path.dirname(os.path.abspath(sys.executable))
> +@@ -112,7 +115,10 @@ def get_python_lib(plat_specific=3D0, stan
> +     sys.exec_prefix -- i.e., ignore 'plat_specific'.
> +     """
> +     if prefix is None:
> +-        prefix =3D plat_specific and EXEC_PREFIX or PREFIX
> ++        if plat_specific:
> ++            prefix =3D plat_specific and =
os.environ['STAGING_LIBDIR'].rstrip('lib')
> ++        else:
> ++            prefix =3D plat_specific and EXEC_PREFIX or PREFIX
> +=20
> +     if os.name =3D=3D "posix":
> +         libpython =3D os.path.join(prefix,
> +@@ -218,7 +218,7 @@ def get_config_h_filename():
> +     else:
> +         # The name of the config.h file changed in 2.2
> +         config_h =3D 'pyconfig.h'
> +-    return os.path.join(inc_dir, config_h)
> ++    return os.path.join(inc_dir, config_h).replace( =
os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> +=20
> +=20
> + def get_makefile_filename():
> +@@ -226,7 +226,7 @@ def get_makefile_filename():
> +     if python_build:
> +         return os.path.join(os.path.dirname(sys.executable), =
"Makefile")
> +     lib_dir =3D get_python_lib(plat_specific=3D1, standard_lib=3D1)
> +-    return os.path.join(lib_dir, "config", "Makefile")
> ++    return os.path.join(lib_dir, "config", "Makefile").replace( =
os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> +=20
> +=20
> + def parse_config_h(fp, g=3DNone):
> diff --git a/recipes/python/python-native-2.6.4/debug.patch =
b/recipes/python/python-native-2.6.4/debug.patch
> new file mode 100644
> index 0000000..beb3adc
> --- /dev/null
> +++ b/recipes/python/python-native-2.6.4/debug.patch
> @@ -0,0 +1,27 @@
> +Index: Python-2.6.1/Lib/distutils/unixccompiler.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1.orig/Lib/distutils/unixccompiler.py	2009-11-13 =
16:04:54.000000000 +0000
> ++++ Python-2.6.1/Lib/distutils/unixccompiler.py	2009-11-13 =
16:06:27.000000000 +0000
> +@@ -300,6 +300,8 @@
> +         dylib_f =3D self.library_filename(lib, lib_type=3D'dylib')
> +         static_f =3D self.library_filename(lib, lib_type=3D'static')
> +=20
> ++        print "Looking in %s for %s" % (lib, dirs)
> ++
> +         for dir in dirs:
> +             shared =3D os.path.join(dir, shared_f)
> +             dylib =3D os.path.join(dir, dylib_f)
> +@@ -309,10 +311,13 @@
> +             # assuming that *all* Unix C compilers do.  And of =
course I'm
> +             # ignoring even GCC's "-static" option.  So sue me.
> +             if os.path.exists(dylib):
> ++                print "Found %s" % (dylib)
> +                 return dylib
> +             elif os.path.exists(shared):
> ++                print "Found %s" % (shared)
> +                 return shared
> +             elif os.path.exists(static):
> ++                print "Found %s" % (static)
> +                 return static
> +=20
> +         # Oops, didn't find it in *any* of 'dirs'
> diff --git a/recipes/python/python-native-2.6.4/nohostlibs.patch =
b/recipes/python/python-native-2.6.4/nohostlibs.patch
> new file mode 100644
> index 0000000..7020f3c
> --- /dev/null
> +++ b/recipes/python/python-native-2.6.4/nohostlibs.patch
> @@ -0,0 +1,53 @@
> +Index: Python-2.6.1/setup.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.1.orig/setup.py	2009-11-13 16:20:47.000000000 =
+0000
> ++++ Python-2.6.1/setup.py	2009-11-13 16:28:00.000000000 +0000
> +@@ -310,8 +310,8 @@
> +=20
> +     def detect_modules(self):
> +         # Ensure that /usr/local is always used
> +-        add_dir_to_list(self.compiler.library_dirs, =
'/usr/local/lib')
> +-        add_dir_to_list(self.compiler.include_dirs, =
'/usr/local/include')
> ++        #add_dir_to_list(self.compiler.library_dirs, =
'/usr/local/lib')
> ++        #add_dir_to_list(self.compiler.include_dirs, =
'/usr/local/include')
> +=20
> +         # Add paths specified in the environment variables LDFLAGS =
and
> +         # CPPFLAGS for header and library files.
> +@@ -347,10 +347,10 @@
> +                     for directory in reversed(options.dirs):
> +                         add_dir_to_list(dir_list, directory)
> +=20
> +-        if os.path.normpath(sys.prefix) !=3D '/usr':
> +-            add_dir_to_list(self.compiler.library_dirs,
> ++
> ++        add_dir_to_list(self.compiler.library_dirs,
> +                             sysconfig.get_config_var("LIBDIR"))
> +-            add_dir_to_list(self.compiler.include_dirs,
> ++        add_dir_to_list(self.compiler.include_dirs,
> +                             sysconfig.get_config_var("INCLUDEDIR"))
> +=20
> +         try:
> +@@ -361,11 +361,8 @@
> +         # lib_dirs and inc_dirs are used to search for files;
> +         # if a file is found in one of those directories, it can
> +         # be assumed that no additional -I,-L directives are needed.
> +-        lib_dirs =3D self.compiler.library_dirs + [
> +-            '/lib64', '/usr/lib64',
> +-            '/lib', '/usr/lib',
> +-            ]
> +-        inc_dirs =3D self.compiler.include_dirs + ['/usr/include']
> ++        lib_dirs =3D self.compiler.library_dirs
> ++        inc_dirs =3D self.compiler.include_dirs
> +         exts =3D []
> +         missing =3D []
> +=20
> +@@ -583,8 +580,7 @@
> +                 readline_libs.append('ncurses')
> +             elif self.compiler.find_library_file(lib_dirs, =
'curses'):
> +                 readline_libs.append('curses')
> +-            elif self.compiler.find_library_file(lib_dirs +
> +-                                               ['/usr/lib/termcap'],
> ++            elif self.compiler.find_library_file(lib_dirs,
> +                                                'termcap'):
> +                 readline_libs.append('termcap')
> +             exts.append( Extension('readline', ['readline.c'],
> diff --git a/recipes/python/python-native-2.6.4/sitecustomize.py =
b/recipes/python/python-native-2.6.4/sitecustomize.py
> new file mode 100644
> index 0000000..2739018
> --- /dev/null
> +++ b/recipes/python/python-native-2.6.4/sitecustomize.py
> @@ -0,0 +1,45 @@
> +# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer =
<mlauer@vanille-media.de>
> +# GPLv2 or later
> +# Version: 20081123
> +# Features:
> +# * set proper default encoding
> +# * enable readline completion in the interactive interpreter
> +# * load command line history on startup
> +# * save command line history on exit=20
> +
> +import os
> +
> +def __exithandler():
> +    try:
> +        readline.write_history_file( "%s/.python-history" % =
os.getenv( "HOME", "/tmp" ) )
> +    except IOError:
> +        pass
> +
> +def __registerExitHandler():
> +    import atexit
> +    atexit.register( __exithandler )
> +
> +def __enableReadlineSupport():
> +    readline.set_history_length( 1000 )
> +    readline.parse_and_bind( "tab: complete" )
> +    try:
> +        readline.read_history_file( "%s/.python-history" % os.getenv( =
"HOME", "/tmp" ) )
> +    except IOError:
> +        pass
> +
> +def __enableDefaultEncoding():
> +    import sys
> +    try:
> +        sys.setdefaultencoding( "utf8" )
> +    except LookupError:
> +        pass
> +
> +import sys
> +try:
> +    import rlcompleter, readline
> +except ImportError:
> +    pass
> +else:
> +    __enableDefaultEncoding()
> +    __registerExitHandler()
> +    __enableReadlineSupport()
> diff --git a/recipes/python/python-native_2.6.4.bb =
b/recipes/python/python-native_2.6.4.bb
> new file mode 100644
> index 0000000..ca65057
> --- /dev/null
> +++ b/recipes/python/python-native_2.6.4.bb
> @@ -0,0 +1,33 @@
> +require python.inc
> +DEPENDS =3D "openssl-native bzip2-full-native zlib-native =
readline-native"
> +PR =3D "${INC_PR}.2"
> +
> +SRC_URI =3D "\
> +  =
http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2;name=3Darchive=
 \
> +  file://00-fix-bindir-libdir-for-cross.patch;patch=3D1 \
> +  file://04-default-is-optimized.patch;patch=3D1 \
> +  file://05-enable-ctypes-cross-build.patch;patch=3D1 \
> +  file://10-distutils-fix-swig-parameter.patch;patch=3D1 \
> +  file://11-distutils-never-modify-shebang-line.patch;patch=3D1 \
> +  file://12-distutils-prefix-is-inside-staging-area.patch;patch=3D1 \
> +  file://debug.patch;patch=3D1 \
> +  file://nohostlibs.patch;patch=3D1 \
> +"
> +S =3D "${WORKDIR}/Python-${PV}"
> +
> +SRC_URI[archive.md5sum] =3D "fee5408634a54e721a93531aba37f8c1"
> +SRC_URI[archive.sha256sum] =3D =
"dad8d5575144a210d5cc4fdbc40b8a26386e9cdb1ef58941bec0be02c7cb9d89"
> +
> +inherit native
> +
> +EXTRA_OEMAKE =3D '\
> +  BUILD_SYS=3D"" \
> +  HOST_SYS=3D"" \
> +  LIBC=3D"" \
> +  STAGING_LIBDIR=3D${STAGING_LIBDIR_NATIVE} \
> +  STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} \
> +'
> +
> +do_stage_append() {
> +	install -m 0755 Parser/pgen ${STAGING_BINDIR_NATIVE}/pgen
> +}
> diff --git a/recipes/python/python_2.6.4.bb =
b/recipes/python/python_2.6.4.bb
> new file mode 100644
> index 0000000..6d93c2c
> --- /dev/null
> +++ b/recipes/python/python_2.6.4.bb
> @@ -0,0 +1,139 @@
> +require python.inc
> +DEPENDS =3D "python-native db gdbm openssl readline sqlite3 tcl zlib\
> +           ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
> +DEPENDS_sharprom =3D "python-native db readline zlib gdbm openssl"
> +# set to .0 on every increase of INC_PR
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI =3D "\
> +  =
http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2;name=3Darchive=
 \
> +  file://00-fix-bindir-libdir-for-cross.patch;patch=3D1 \
> +  file://01-use-proper-tools-for-cross-build.patch;patch=3D1 \
> +  file://02-remove-test-for-cross.patch;patch=3D1 \
> +  file://03-fix-tkinter-detection.patch;patch=3D1 \
> +  file://04-default-is-optimized.patch;patch=3D1 \
> +  file://05-enable-ctypes-cross-build.patch;patch=3D1 \
> +  file://99-ignore-optimization-flag.patch;patch=3D1 \
> +  \
> +# not yet pushed forward
> +# sitebranding
> +  \
> +#  file://05-install.patch;patch=3D1 \
> +#  file://06-fix-urllib-exception.patch;patch=3D1 \
> +#  file://16-bug1179-imageop.patch;patch=3D1 \
> +#  file://13-set-wakeup-fix.patch;patch=3D1 \
> +  \
> +  file://sitecustomize.py \
> +"
> +SRC_URI[archive.md5sum] =3D "fee5408634a54e721a93531aba37f8c1"
> +SRC_URI[archive.sha256sum] =3D =
"dad8d5575144a210d5cc4fdbc40b8a26386e9cdb1ef58941bec0be02c7cb9d89"
> +
> +S =3D "${WORKDIR}/Python-${PV}"
> +
> +inherit autotools
> +
> +# The 3 lines below are copied from the libffi recipe, ctypes ships =
its own copy of the libffi sources
> +#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=3Dsoftp =
:(
> +TARGET_CC_ARCH_append_armv6 =3D " -D__SOFTFP__"
> +TARGET_CC_ARCH_append_armv7a =3D " -D__SOFTFP__"
> +
> +do_configure_prepend() {
> +	autoreconf -Wcross --verbose --install --force =
--exclude=3Dautopoint Modules/_ctypes/libffi || oenote "_ctypes failed =
to autoreconf"
> +}
> +
> +#
> +# Copy config.h and an appropriate Makefile for distutils.sysconfig,
> +# which laters uses the information out of these to compile =
extensions
> +#
> +do_compile_prepend() {
> +	install -d ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
> +	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
> +	install -m 0644 pyconfig.h =
${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
> +	install -m 0644 Makefile Makefile.orig
> +	install -m 0644 Makefile Makefile.backup
> +	sed -e 's,${includedir},${STAGING_INCDIR},' < Makefile.backup > =
Makefile
> +	install -m 0644 Makefile Makefile.backup
> +	sed -e 's,${libdir},${STAGING_LIBDIR},' < Makefile.backup > =
Makefile
> +	install -m 0644 Makefile =
${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
> +}
> +
> +do_compile() {
> +	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/pgen \
> +		HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python \
> +		STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> +		STAGING_INCDIR=3D${STAGING_INCDIR} \
> +		BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> +		OPT=3D"${CFLAGS}" libpython${PYTHON_MAJMIN}.so
> +
> +	oe_libinstall -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
> +
> +	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/pgen \
> +		HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python \
> +		STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> +		STAGING_INCDIR=3D${STAGING_INCDIR} \
> +		BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> +		RUNSHARED=3D OPT=3D"${CFLAGS}"
> +}
> +
> +do_stage() {
> +	install -m 0644 Include/*.h =
${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
> +	oe_libinstall -a -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
> +}
> +
> +do_install() {
> +	install -m 0644 Makefile.orig Makefile
> +=09
> +	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/pgen \
> +		HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python \
> +		STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> +		STAGING_INCDIR=3D${STAGING_INCDIR} \
> +		BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> +		DESTDIR=3D${D} LIBDIR=3D${libdir} RUNSHARED=3D install
> +
> +	install -m 0644 ${WORKDIR}/sitecustomize.py =
${D}/${libdir}/python${PYTHON_MAJMIN}
> +
> +	# remove hardcoded ccache, see =
http://bugs.openembedded.net/show_bug.cgi?id=3D4144
> +	sed -i -e s,ccache,'$(CCACHE)', =
${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
> +}
> +
> +require python-${PYTHON_MAJMIN}-manifest.inc
> +
> +# manual dependency additions
> +RPROVIDES_python-core =3D "python"
> +RRECOMMENDS_python-core =3D "python-readline"
> +RRECOMMENDS_python-crypt =3D "openssl"
> +
> +# add sitecustomize
> +FILES_python-core +=3D =
"${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py"
> +# ship 2to3
> +FILES_python-core +=3D "${bindir}/2to3"
> +
> +# package libpython2
> +PACKAGES =3D+ "libpython2"
> +FILES_libpython2 =3D "${libdir}/libpython*.so*"
> +
> +# additional stuff -dev
> +
> +FILES_${PN}-dev =3D "\
> +  ${includedir} \
> +  ${libdir}/lib*${SOLIBSDEV} \
> +  ${libdir}/*.la \
> +  ${libdir}/*.a \
> +  ${libdir}/*.o \
> +  ${libdir}/pkgconfig \
> +  ${base_libdir}/*.a \
> +  ${base_libdir}/*.o \
> +  ${datadir}/aclocal \
> +  ${datadir}/pkgconfig \
> +"
> +
> +# catch debug extensions (isn't that already in python-core-dbg?)
> +FILES_python-dbg +=3D =
"${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
> +
> +# catch all the rest (unsorted)
> +PACKAGES +=3D "python-misc"
> +FILES_python-misc =3D "${libdir}/python${PYTHON_MAJMIN}"
> +
> +# catch manpage
> +PACKAGES +=3D "python-man"
> +FILES_python-man =3D "${datadir}/man"
> --=20
> 1.6.6.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



