Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pda88-000759-6A
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 04:15:13 +0100
Received: by pvd12 with SMTP id 12so363516pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 19:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=uBpuruf1y8F1uDL7gP9aixmxzlKDBoc7XOI2gZ7SYIo=;
	b=rdgNCZLllxnyuqE5w2GQe3YRzlh8diFwZ0r5DtIb37fsqEhHgedi+vT6JT0EEiwkEi
	tE/que+k3eEoXIkDDIEga5OBn+If1pcJN7Qs3JMjAA1FJOtGTgCignPmgw+xrH1zvxVN
	0eFVlEVaFTrK8jvqMz0bY9UNyg19y0deMgxfY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=viVC8njxA7MczbXxm+kcaK1FiSXExMplY7MZxfFE/GEnNzFCavferHa3Mdsrv+WNPH
	7MzRlHdQncngI6h2Fto1dCYjrmMZLQf+o1lMYv+928qPdaxGGgl+0H/qaUpqb+mEsPSy
	ewLI9hYySomKAsYyG9zqyBkQLIkkiwKR3gxCw=
Received: by 10.143.165.4 with SMTP id s4mr288642wfo.161.1294974874300;
	Thu, 13 Jan 2011 19:14:34 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p8sm988160wff.4.2011.01.13.19.14.32
	(version=SSLv3 cipher=RC4-MD5); Thu, 13 Jan 2011 19:14:33 -0800 (PST)
Message-ID: <4D2FBF93.7030706@gmail.com>
Date: Thu, 13 Jan 2011 19:14:27 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293564540-9596-1-git-send-email-bgamari.foss@gmail.com>
	<1294911352-13946-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1294911352-13946-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH] python-native: drop old versions 2.6.1 and 2.6.4, remove unneeded python-native-* directories
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
X-List-Received-Date: Fri, 14 Jan 2011 03:15:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/13/2011 1:35 AM, Martin Jansa wrote:
> * python-native-2.7.1 is the same as python-2.7.1 and thanks to FILESPATHPKG .= ':python-:python' it's not needed to keep it twice
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>

Thanks for doing it.

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>   .../00-fix-bindir-libdir-for-cross.patch           |   20 ---
>   .../04-default-is-optimized.patch                  |   18 --
>   .../10-distutils-fix-swig-parameter.patch          |   16 --
>   .../11-distutils-never-modify-shebang-line.patch   |   18 --
>   ...2-distutils-prefix-is-inside-staging-area.patch |   60 -------
>   recipes/python/python-native-2.6.1/debug.patch     |   27 ---
>   .../python/python-native-2.6.1/nohostlibs.patch    |   53 ------
>   .../python/python-native-2.6.1/sitecustomize.py    |   45 -----
>   .../00-fix-bindir-libdir-for-cross.patch           |   20 ---
>   .../04-default-is-optimized.patch                  |   18 --
>   .../10-distutils-fix-swig-parameter.patch          |   16 --
>   .../11-distutils-never-modify-shebang-line.patch   |   18 --
>   ...2-distutils-prefix-is-inside-staging-area.patch |   60 -------
>   recipes/python/python-native-2.6.4/debug.patch     |   27 ---
>   .../python/python-native-2.6.4/nohostlibs.patch    |   53 ------
>   .../python/python-native-2.6.4/sitecustomize.py    |   45 -----
>   .../00-fix-bindir-libdir-for-cross.patch           |   20 ---
>   .../01-fix-have-long-long-format.patch             |   19 ---
>   .../01-use-proper-tools-for-cross-build.patch      |  169 --------------------
>   .../02-remove-test-for-cross.patch                 |  108 -------------
>   .../03-fix-tkinter-detection.patch                 |   40 -----
>   .../04-default-is-optimized.patch                  |   18 --
>   .../05-enable-ctypes-cross-build.patch             |   28 ----
>   .../06-ctypes-libffi-fix-configure.patch           |   44 -----
>   .../10-distutils-fix-swig-parameter.patch          |   16 --
>   .../11-distutils-never-modify-shebang-line.patch   |   18 --
>   ...2-distutils-prefix-is-inside-staging-area.patch |   60 -------
>   .../99-ignore-optimization-flag.patch              |   19 ---
>   recipes/python/python-native-2.7.1/debug.patch     |   27 ---
>   .../python/python-native-2.7.1/nohostlibs.patch    |   29 ----
>   .../python/python-native-2.7.1/sitecustomize.py    |   45 -----
>   recipes/python/python-native_2.6.1.bb              |   33 ----
>   recipes/python/python-native_2.6.4.bb              |   35 ----
>   33 files changed, 0 insertions(+), 1242 deletions(-)
>   delete mode 100644 recipes/python/python-native-2.6.1/00-fix-bindir-libdir-for-cross.patch
>   delete mode 100644 recipes/python/python-native-2.6.1/04-default-is-optimized.patch
>   delete mode 100644 recipes/python/python-native-2.6.1/10-distutils-fix-swig-parameter.patch
>   delete mode 100644 recipes/python/python-native-2.6.1/11-distutils-never-modify-shebang-line.patch
>   delete mode 100644 recipes/python/python-native-2.6.1/12-distutils-prefix-is-inside-staging-area.patch
>   delete mode 100644 recipes/python/python-native-2.6.1/debug.patch
>   delete mode 100644 recipes/python/python-native-2.6.1/nohostlibs.patch
>   delete mode 100644 recipes/python/python-native-2.6.1/sitecustomize.py
>   delete mode 100644 recipes/python/python-native-2.6.4/00-fix-bindir-libdir-for-cross.patch
>   delete mode 100644 recipes/python/python-native-2.6.4/04-default-is-optimized.patch
>   delete mode 100644 recipes/python/python-native-2.6.4/10-distutils-fix-swig-parameter.patch
>   delete mode 100644 recipes/python/python-native-2.6.4/11-distutils-never-modify-shebang-line.patch
>   delete mode 100644 recipes/python/python-native-2.6.4/12-distutils-prefix-is-inside-staging-area.patch
>   delete mode 100644 recipes/python/python-native-2.6.4/debug.patch
>   delete mode 100644 recipes/python/python-native-2.6.4/nohostlibs.patch
>   delete mode 100644 recipes/python/python-native-2.6.4/sitecustomize.py
>   delete mode 100644 recipes/python/python-native-2.7.1/00-fix-bindir-libdir-for-cross.patch
>   delete mode 100644 recipes/python/python-native-2.7.1/01-fix-have-long-long-format.patch
>   delete mode 100644 recipes/python/python-native-2.7.1/01-use-proper-tools-for-cross-build.patch
>   delete mode 100644 recipes/python/python-native-2.7.1/02-remove-test-for-cross.patch
>   delete mode 100644 recipes/python/python-native-2.7.1/03-fix-tkinter-detection.patch
>   delete mode 100644 recipes/python/python-native-2.7.1/04-default-is-optimized.patch
>   delete mode 100644 recipes/python/python-native-2.7.1/05-enable-ctypes-cross-build.patch
>   delete mode 100644 recipes/python/python-native-2.7.1/06-ctypes-libffi-fix-configure.patch
>   delete mode 100644 recipes/python/python-native-2.7.1/10-distutils-fix-swig-parameter.patch
>   delete mode 100644 recipes/python/python-native-2.7.1/11-distutils-never-modify-shebang-line.patch
>   delete mode 100644 recipes/python/python-native-2.7.1/12-distutils-prefix-is-inside-staging-area.patch
>   delete mode 100644 recipes/python/python-native-2.7.1/99-ignore-optimization-flag.patch
>   delete mode 100644 recipes/python/python-native-2.7.1/debug.patch
>   delete mode 100644 recipes/python/python-native-2.7.1/nohostlibs.patch
>   delete mode 100644 recipes/python/python-native-2.7.1/sitecustomize.py
>   delete mode 100644 recipes/python/python-native_2.6.1.bb
>   delete mode 100644 recipes/python/python-native_2.6.4.bb
>
> diff --git a/recipes/python/python-native-2.6.1/00-fix-bindir-libdir-for-cross.patch b/recipes/python/python-native-2.6.1/00-fix-bindir-libdir-for-cross.patch
> deleted file mode 100644
> index 2559e3a..0000000
> --- a/recipes/python/python-native-2.6.1/00-fix-bindir-libdir-for-cross.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -# $(exec_prefix) points to the wrong directory, when installing
> -# a cross-build. @bindir@ and @libdir@ works better and doesn't
> -# affect the native build.
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -
> -Index: Python-2.6.1/Makefile.pre.in
> -===================================================================
> ---- Python-2.6.1.orig/Makefile.pre.in
> -+++ Python-2.6.1/Makefile.pre.in
> -@@ -86,8 +86,8 @@ exec_prefix=	@exec_prefix@
> - datarootdir=    @datarootdir@
> -
> - # Expanded directories
> --BINDIR=		$(exec_prefix)/bin
> --LIBDIR=		$(exec_prefix)/lib
> -+BINDIR=		@bindir@
> -+LIBDIR=		@libdir@
> - MANDIR=		@mandir@
> - INCLUDEDIR=	@includedir@
> - CONFINCLUDEDIR=	$(exec_prefix)/include
> diff --git a/recipes/python/python-native-2.6.1/04-default-is-optimized.patch b/recipes/python/python-native-2.6.1/04-default-is-optimized.patch
> deleted file mode 100644
> index 5131e0b..0000000
> --- a/recipes/python/python-native-2.6.1/04-default-is-optimized.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -# When compiling for an embedded system, we need every bit of
> -# performance we can get. default to optimized with the option
> -# of opt-out.
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -
> -Index: Python-2.6.1/Python/compile.c
> -===================================================================
> ---- Python-2.6.1.orig/Python/compile.c
> -+++ Python-2.6.1/Python/compile.c
> -@@ -32,7 +32,7 @@
> - #include "symtable.h"
> - #include "opcode.h"
> -
> --int Py_OptimizeFlag = 0;
> -+int Py_OptimizeFlag = 1;
> -
> - #define DEFAULT_BLOCK_SIZE 16
> - #define DEFAULT_BLOCKS 8
> diff --git a/recipes/python/python-native-2.6.1/10-distutils-fix-swig-parameter.patch b/recipes/python/python-native-2.6.1/10-distutils-fix-swig-parameter.patch
> deleted file mode 100644
> index f5e852a..0000000
> --- a/recipes/python/python-native-2.6.1/10-distutils-fix-swig-parameter.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -# Some versions of SWIG do not use the extension parameter.
> -# Make it optional.
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -Index: Python-2.6.1/Lib/distutils/command/build_ext.py
> -===================================================================
> ---- Python-2.6.1.orig/Lib/distutils/command/build_ext.py
> -+++ Python-2.6.1/Lib/distutils/command/build_ext.py
> -@@ -566,7 +566,7 @@ class build_ext (Command):
> -             target_lang=language)
> -
> -
> --    def swig_sources (self, sources, extension):
> -+    def swig_sources (self, sources, extension=None):
> -
> -         """Walk the list of source files in 'sources', looking for SWIG
> -         interface (.i) files.  Run SWIG on all that are found, and
> diff --git a/recipes/python/python-native-2.6.1/11-distutils-never-modify-shebang-line.patch b/recipes/python/python-native-2.6.1/11-distutils-never-modify-shebang-line.patch
> deleted file mode 100644
> index 8354e26..0000000
> --- a/recipes/python/python-native-2.6.1/11-distutils-never-modify-shebang-line.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -# Don't modify the she-bang line for a cross-build.
> -# Otherwise it points to our hostpython (which we do not want)
> -#
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -
> -Index: Python-2.6.1/Lib/distutils/command/build_scripts.py
> -===================================================================
> ---- Python-2.6.1.orig/Lib/distutils/command/build_scripts.py
> -+++ Python-2.6.1/Lib/distutils/command/build_scripts.py
> -@@ -87,7 +87,7 @@ class build_scripts (Command):
> -                     continue
> -
> -                 match = first_line_re.match(first_line)
> --                if match:
> -+                if False: #match:
> -                     adjust = 1
> -                     post_interp = match.group(1) or ''
> -
> diff --git a/recipes/python/python-native-2.6.1/12-distutils-prefix-is-inside-staging-area.patch b/recipes/python/python-native-2.6.1/12-distutils-prefix-is-inside-staging-area.patch
> deleted file mode 100644
> index aa43936..0000000
> --- a/recipes/python/python-native-2.6.1/12-distutils-prefix-is-inside-staging-area.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -# The proper prefix is inside our staging area.
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -
> -Index: Python-2.6.1/Lib/distutils/sysconfig.py
> -===================================================================
> ---- Python-2.6.1.orig/Lib/distutils/sysconfig.py
> -+++ Python-2.6.1/Lib/distutils/sysconfig.py
> -@@ -19,8 +19,8 @@ import sys
> - from distutils.errors import DistutilsPlatformError
> -
> - # These are needed in a couple of spots, so just compute them once.
> --PREFIX = os.path.normpath(sys.prefix)
> --EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
> -+PREFIX = os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> -+EXEC_PREFIX = os.path.normpath(sys.exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> -
> - # Path to the base directory of the project. On Windows the binary may
> - # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
> -@@ -70,7 +70,10 @@ def get_python_inc(plat_specific=0, pref
> -     sys.exec_prefix -- i.e., ignore 'plat_specific'.
> -     """
> -     if prefix is None:
> --        prefix = plat_specific and EXEC_PREFIX or PREFIX
> -+        if plat_specific:
> -+            prefix = plat_specific and os.environ['STAGING_INCDIR'].rstrip('include')
> -+        else:
> -+            prefix = plat_specific and EXEC_PREFIX or PREFIX
> -     if os.name == "posix":
> -         if python_build:
> -             base = os.path.dirname(os.path.abspath(sys.executable))
> -@@ -112,7 +115,10 @@ def get_python_lib(plat_specific=0, stan
> -     sys.exec_prefix -- i.e., ignore 'plat_specific'.
> -     """
> -     if prefix is None:
> --        prefix = plat_specific and EXEC_PREFIX or PREFIX
> -+        if plat_specific:
> -+            prefix = plat_specific and os.environ['STAGING_LIBDIR'].rstrip('lib')
> -+        else:
> -+            prefix = plat_specific and EXEC_PREFIX or PREFIX
> -
> -     if os.name == "posix":
> -         libpython = os.path.join(prefix,
> -@@ -218,7 +218,7 @@ def get_config_h_filename():
> -     else:
> -         # The name of the config.h file changed in 2.2
> -         config_h = 'pyconfig.h'
> --    return os.path.join(inc_dir, config_h)
> -+    return os.path.join(inc_dir, config_h).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> -
> -
> - def get_makefile_filename():
> -@@ -226,7 +226,7 @@ def get_makefile_filename():
> -     if python_build:
> -         return os.path.join(os.path.dirname(sys.executable), "Makefile")
> -     lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
> --    return os.path.join(lib_dir, "config", "Makefile")
> -+    return os.path.join(lib_dir, "config", "Makefile").replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> -
> -
> - def parse_config_h(fp, g=None):
> diff --git a/recipes/python/python-native-2.6.1/debug.patch b/recipes/python/python-native-2.6.1/debug.patch
> deleted file mode 100644
> index beb3adc..0000000
> --- a/recipes/python/python-native-2.6.1/debug.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Index: Python-2.6.1/Lib/distutils/unixccompiler.py
> -===================================================================
> ---- Python-2.6.1.orig/Lib/distutils/unixccompiler.py	2009-11-13 16:04:54.000000000 +0000
> -+++ Python-2.6.1/Lib/distutils/unixccompiler.py	2009-11-13 16:06:27.000000000 +0000
> -@@ -300,6 +300,8 @@
> -         dylib_f = self.library_filename(lib, lib_type='dylib')
> -         static_f = self.library_filename(lib, lib_type='static')
> -
> -+        print "Looking in %s for %s" % (lib, dirs)
> -+
> -         for dir in dirs:
> -             shared = os.path.join(dir, shared_f)
> -             dylib = os.path.join(dir, dylib_f)
> -@@ -309,10 +311,13 @@
> -             # assuming that *all* Unix C compilers do.  And of course I'm
> -             # ignoring even GCC's "-static" option.  So sue me.
> -             if os.path.exists(dylib):
> -+                print "Found %s" % (dylib)
> -                 return dylib
> -             elif os.path.exists(shared):
> -+                print "Found %s" % (shared)
> -                 return shared
> -             elif os.path.exists(static):
> -+                print "Found %s" % (static)
> -                 return static
> -
> -         # Oops, didn't find it in *any* of 'dirs'
> diff --git a/recipes/python/python-native-2.6.1/nohostlibs.patch b/recipes/python/python-native-2.6.1/nohostlibs.patch
> deleted file mode 100644
> index 7020f3c..0000000
> --- a/recipes/python/python-native-2.6.1/nohostlibs.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -Index: Python-2.6.1/setup.py
> -===================================================================
> ---- Python-2.6.1.orig/setup.py	2009-11-13 16:20:47.000000000 +0000
> -+++ Python-2.6.1/setup.py	2009-11-13 16:28:00.000000000 +0000
> -@@ -310,8 +310,8 @@
> -
> -     def detect_modules(self):
> -         # Ensure that /usr/local is always used
> --        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
> --        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
> -+        #add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
> -+        #add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
> -
> -         # Add paths specified in the environment variables LDFLAGS and
> -         # CPPFLAGS for header and library files.
> -@@ -347,10 +347,10 @@
> -                     for directory in reversed(options.dirs):
> -                         add_dir_to_list(dir_list, directory)
> -
> --        if os.path.normpath(sys.prefix) != '/usr':
> --            add_dir_to_list(self.compiler.library_dirs,
> -+
> -+        add_dir_to_list(self.compiler.library_dirs,
> -                             sysconfig.get_config_var("LIBDIR"))
> --            add_dir_to_list(self.compiler.include_dirs,
> -+        add_dir_to_list(self.compiler.include_dirs,
> -                             sysconfig.get_config_var("INCLUDEDIR"))
> -
> -         try:
> -@@ -361,11 +361,8 @@
> -         # lib_dirs and inc_dirs are used to search for files;
> -         # if a file is found in one of those directories, it can
> -         # be assumed that no additional -I,-L directives are needed.
> --        lib_dirs = self.compiler.library_dirs + [
> --            '/lib64', '/usr/lib64',
> --            '/lib', '/usr/lib',
> --            ]
> --        inc_dirs = self.compiler.include_dirs + ['/usr/include']
> -+        lib_dirs = self.compiler.library_dirs
> -+        inc_dirs = self.compiler.include_dirs
> -         exts = []
> -         missing = []
> -
> -@@ -583,8 +580,7 @@
> -                 readline_libs.append('ncurses')
> -             elif self.compiler.find_library_file(lib_dirs, 'curses'):
> -                 readline_libs.append('curses')
> --            elif self.compiler.find_library_file(lib_dirs +
> --                                               ['/usr/lib/termcap'],
> -+            elif self.compiler.find_library_file(lib_dirs,
> -                                                'termcap'):
> -                 readline_libs.append('termcap')
> -             exts.append( Extension('readline', ['readline.c'],
> diff --git a/recipes/python/python-native-2.6.1/sitecustomize.py b/recipes/python/python-native-2.6.1/sitecustomize.py
> deleted file mode 100644
> index 2739018..0000000
> --- a/recipes/python/python-native-2.6.1/sitecustomize.py
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer<mlauer@vanille-media.de>
> -# GPLv2 or later
> -# Version: 20081123
> -# Features:
> -# * set proper default encoding
> -# * enable readline completion in the interactive interpreter
> -# * load command line history on startup
> -# * save command line history on exit
> -
> -import os
> -
> -def __exithandler():
> -    try:
> -        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
> -    except IOError:
> -        pass
> -
> -def __registerExitHandler():
> -    import atexit
> -    atexit.register( __exithandler )
> -
> -def __enableReadlineSupport():
> -    readline.set_history_length( 1000 )
> -    readline.parse_and_bind( "tab: complete" )
> -    try:
> -        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
> -    except IOError:
> -        pass
> -
> -def __enableDefaultEncoding():
> -    import sys
> -    try:
> -        sys.setdefaultencoding( "utf8" )
> -    except LookupError:
> -        pass
> -
> -import sys
> -try:
> -    import rlcompleter, readline
> -except ImportError:
> -    pass
> -else:
> -    __enableDefaultEncoding()
> -    __registerExitHandler()
> -    __enableReadlineSupport()
> diff --git a/recipes/python/python-native-2.6.4/00-fix-bindir-libdir-for-cross.patch b/recipes/python/python-native-2.6.4/00-fix-bindir-libdir-for-cross.patch
> deleted file mode 100644
> index 2559e3a..0000000
> --- a/recipes/python/python-native-2.6.4/00-fix-bindir-libdir-for-cross.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -# $(exec_prefix) points to the wrong directory, when installing
> -# a cross-build. @bindir@ and @libdir@ works better and doesn't
> -# affect the native build.
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -
> -Index: Python-2.6.1/Makefile.pre.in
> -===================================================================
> ---- Python-2.6.1.orig/Makefile.pre.in
> -+++ Python-2.6.1/Makefile.pre.in
> -@@ -86,8 +86,8 @@ exec_prefix=	@exec_prefix@
> - datarootdir=    @datarootdir@
> -
> - # Expanded directories
> --BINDIR=		$(exec_prefix)/bin
> --LIBDIR=		$(exec_prefix)/lib
> -+BINDIR=		@bindir@
> -+LIBDIR=		@libdir@
> - MANDIR=		@mandir@
> - INCLUDEDIR=	@includedir@
> - CONFINCLUDEDIR=	$(exec_prefix)/include
> diff --git a/recipes/python/python-native-2.6.4/04-default-is-optimized.patch b/recipes/python/python-native-2.6.4/04-default-is-optimized.patch
> deleted file mode 100644
> index 5131e0b..0000000
> --- a/recipes/python/python-native-2.6.4/04-default-is-optimized.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -# When compiling for an embedded system, we need every bit of
> -# performance we can get. default to optimized with the option
> -# of opt-out.
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -
> -Index: Python-2.6.1/Python/compile.c
> -===================================================================
> ---- Python-2.6.1.orig/Python/compile.c
> -+++ Python-2.6.1/Python/compile.c
> -@@ -32,7 +32,7 @@
> - #include "symtable.h"
> - #include "opcode.h"
> -
> --int Py_OptimizeFlag = 0;
> -+int Py_OptimizeFlag = 1;
> -
> - #define DEFAULT_BLOCK_SIZE 16
> - #define DEFAULT_BLOCKS 8
> diff --git a/recipes/python/python-native-2.6.4/10-distutils-fix-swig-parameter.patch b/recipes/python/python-native-2.6.4/10-distutils-fix-swig-parameter.patch
> deleted file mode 100644
> index f5e852a..0000000
> --- a/recipes/python/python-native-2.6.4/10-distutils-fix-swig-parameter.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -# Some versions of SWIG do not use the extension parameter.
> -# Make it optional.
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -Index: Python-2.6.1/Lib/distutils/command/build_ext.py
> -===================================================================
> ---- Python-2.6.1.orig/Lib/distutils/command/build_ext.py
> -+++ Python-2.6.1/Lib/distutils/command/build_ext.py
> -@@ -566,7 +566,7 @@ class build_ext (Command):
> -             target_lang=language)
> -
> -
> --    def swig_sources (self, sources, extension):
> -+    def swig_sources (self, sources, extension=None):
> -
> -         """Walk the list of source files in 'sources', looking for SWIG
> -         interface (.i) files.  Run SWIG on all that are found, and
> diff --git a/recipes/python/python-native-2.6.4/11-distutils-never-modify-shebang-line.patch b/recipes/python/python-native-2.6.4/11-distutils-never-modify-shebang-line.patch
> deleted file mode 100644
> index 8354e26..0000000
> --- a/recipes/python/python-native-2.6.4/11-distutils-never-modify-shebang-line.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -# Don't modify the she-bang line for a cross-build.
> -# Otherwise it points to our hostpython (which we do not want)
> -#
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -
> -Index: Python-2.6.1/Lib/distutils/command/build_scripts.py
> -===================================================================
> ---- Python-2.6.1.orig/Lib/distutils/command/build_scripts.py
> -+++ Python-2.6.1/Lib/distutils/command/build_scripts.py
> -@@ -87,7 +87,7 @@ class build_scripts (Command):
> -                     continue
> -
> -                 match = first_line_re.match(first_line)
> --                if match:
> -+                if False: #match:
> -                     adjust = 1
> -                     post_interp = match.group(1) or ''
> -
> diff --git a/recipes/python/python-native-2.6.4/12-distutils-prefix-is-inside-staging-area.patch b/recipes/python/python-native-2.6.4/12-distutils-prefix-is-inside-staging-area.patch
> deleted file mode 100644
> index aa43936..0000000
> --- a/recipes/python/python-native-2.6.4/12-distutils-prefix-is-inside-staging-area.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -# The proper prefix is inside our staging area.
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -
> -Index: Python-2.6.1/Lib/distutils/sysconfig.py
> -===================================================================
> ---- Python-2.6.1.orig/Lib/distutils/sysconfig.py
> -+++ Python-2.6.1/Lib/distutils/sysconfig.py
> -@@ -19,8 +19,8 @@ import sys
> - from distutils.errors import DistutilsPlatformError
> -
> - # These are needed in a couple of spots, so just compute them once.
> --PREFIX = os.path.normpath(sys.prefix)
> --EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
> -+PREFIX = os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> -+EXEC_PREFIX = os.path.normpath(sys.exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> -
> - # Path to the base directory of the project. On Windows the binary may
> - # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
> -@@ -70,7 +70,10 @@ def get_python_inc(plat_specific=0, pref
> -     sys.exec_prefix -- i.e., ignore 'plat_specific'.
> -     """
> -     if prefix is None:
> --        prefix = plat_specific and EXEC_PREFIX or PREFIX
> -+        if plat_specific:
> -+            prefix = plat_specific and os.environ['STAGING_INCDIR'].rstrip('include')
> -+        else:
> -+            prefix = plat_specific and EXEC_PREFIX or PREFIX
> -     if os.name == "posix":
> -         if python_build:
> -             base = os.path.dirname(os.path.abspath(sys.executable))
> -@@ -112,7 +115,10 @@ def get_python_lib(plat_specific=0, stan
> -     sys.exec_prefix -- i.e., ignore 'plat_specific'.
> -     """
> -     if prefix is None:
> --        prefix = plat_specific and EXEC_PREFIX or PREFIX
> -+        if plat_specific:
> -+            prefix = plat_specific and os.environ['STAGING_LIBDIR'].rstrip('lib')
> -+        else:
> -+            prefix = plat_specific and EXEC_PREFIX or PREFIX
> -
> -     if os.name == "posix":
> -         libpython = os.path.join(prefix,
> -@@ -218,7 +218,7 @@ def get_config_h_filename():
> -     else:
> -         # The name of the config.h file changed in 2.2
> -         config_h = 'pyconfig.h'
> --    return os.path.join(inc_dir, config_h)
> -+    return os.path.join(inc_dir, config_h).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> -
> -
> - def get_makefile_filename():
> -@@ -226,7 +226,7 @@ def get_makefile_filename():
> -     if python_build:
> -         return os.path.join(os.path.dirname(sys.executable), "Makefile")
> -     lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
> --    return os.path.join(lib_dir, "config", "Makefile")
> -+    return os.path.join(lib_dir, "config", "Makefile").replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> -
> -
> - def parse_config_h(fp, g=None):
> diff --git a/recipes/python/python-native-2.6.4/debug.patch b/recipes/python/python-native-2.6.4/debug.patch
> deleted file mode 100644
> index beb3adc..0000000
> --- a/recipes/python/python-native-2.6.4/debug.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Index: Python-2.6.1/Lib/distutils/unixccompiler.py
> -===================================================================
> ---- Python-2.6.1.orig/Lib/distutils/unixccompiler.py	2009-11-13 16:04:54.000000000 +0000
> -+++ Python-2.6.1/Lib/distutils/unixccompiler.py	2009-11-13 16:06:27.000000000 +0000
> -@@ -300,6 +300,8 @@
> -         dylib_f = self.library_filename(lib, lib_type='dylib')
> -         static_f = self.library_filename(lib, lib_type='static')
> -
> -+        print "Looking in %s for %s" % (lib, dirs)
> -+
> -         for dir in dirs:
> -             shared = os.path.join(dir, shared_f)
> -             dylib = os.path.join(dir, dylib_f)
> -@@ -309,10 +311,13 @@
> -             # assuming that *all* Unix C compilers do.  And of course I'm
> -             # ignoring even GCC's "-static" option.  So sue me.
> -             if os.path.exists(dylib):
> -+                print "Found %s" % (dylib)
> -                 return dylib
> -             elif os.path.exists(shared):
> -+                print "Found %s" % (shared)
> -                 return shared
> -             elif os.path.exists(static):
> -+                print "Found %s" % (static)
> -                 return static
> -
> -         # Oops, didn't find it in *any* of 'dirs'
> diff --git a/recipes/python/python-native-2.6.4/nohostlibs.patch b/recipes/python/python-native-2.6.4/nohostlibs.patch
> deleted file mode 100644
> index 7020f3c..0000000
> --- a/recipes/python/python-native-2.6.4/nohostlibs.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -Index: Python-2.6.1/setup.py
> -===================================================================
> ---- Python-2.6.1.orig/setup.py	2009-11-13 16:20:47.000000000 +0000
> -+++ Python-2.6.1/setup.py	2009-11-13 16:28:00.000000000 +0000
> -@@ -310,8 +310,8 @@
> -
> -     def detect_modules(self):
> -         # Ensure that /usr/local is always used
> --        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
> --        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
> -+        #add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
> -+        #add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
> -
> -         # Add paths specified in the environment variables LDFLAGS and
> -         # CPPFLAGS for header and library files.
> -@@ -347,10 +347,10 @@
> -                     for directory in reversed(options.dirs):
> -                         add_dir_to_list(dir_list, directory)
> -
> --        if os.path.normpath(sys.prefix) != '/usr':
> --            add_dir_to_list(self.compiler.library_dirs,
> -+
> -+        add_dir_to_list(self.compiler.library_dirs,
> -                             sysconfig.get_config_var("LIBDIR"))
> --            add_dir_to_list(self.compiler.include_dirs,
> -+        add_dir_to_list(self.compiler.include_dirs,
> -                             sysconfig.get_config_var("INCLUDEDIR"))
> -
> -         try:
> -@@ -361,11 +361,8 @@
> -         # lib_dirs and inc_dirs are used to search for files;
> -         # if a file is found in one of those directories, it can
> -         # be assumed that no additional -I,-L directives are needed.
> --        lib_dirs = self.compiler.library_dirs + [
> --            '/lib64', '/usr/lib64',
> --            '/lib', '/usr/lib',
> --            ]
> --        inc_dirs = self.compiler.include_dirs + ['/usr/include']
> -+        lib_dirs = self.compiler.library_dirs
> -+        inc_dirs = self.compiler.include_dirs
> -         exts = []
> -         missing = []
> -
> -@@ -583,8 +580,7 @@
> -                 readline_libs.append('ncurses')
> -             elif self.compiler.find_library_file(lib_dirs, 'curses'):
> -                 readline_libs.append('curses')
> --            elif self.compiler.find_library_file(lib_dirs +
> --                                               ['/usr/lib/termcap'],
> -+            elif self.compiler.find_library_file(lib_dirs,
> -                                                'termcap'):
> -                 readline_libs.append('termcap')
> -             exts.append( Extension('readline', ['readline.c'],
> diff --git a/recipes/python/python-native-2.6.4/sitecustomize.py b/recipes/python/python-native-2.6.4/sitecustomize.py
> deleted file mode 100644
> index 2739018..0000000
> --- a/recipes/python/python-native-2.6.4/sitecustomize.py
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer<mlauer@vanille-media.de>
> -# GPLv2 or later
> -# Version: 20081123
> -# Features:
> -# * set proper default encoding
> -# * enable readline completion in the interactive interpreter
> -# * load command line history on startup
> -# * save command line history on exit
> -
> -import os
> -
> -def __exithandler():
> -    try:
> -        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
> -    except IOError:
> -        pass
> -
> -def __registerExitHandler():
> -    import atexit
> -    atexit.register( __exithandler )
> -
> -def __enableReadlineSupport():
> -    readline.set_history_length( 1000 )
> -    readline.parse_and_bind( "tab: complete" )
> -    try:
> -        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
> -    except IOError:
> -        pass
> -
> -def __enableDefaultEncoding():
> -    import sys
> -    try:
> -        sys.setdefaultencoding( "utf8" )
> -    except LookupError:
> -        pass
> -
> -import sys
> -try:
> -    import rlcompleter, readline
> -except ImportError:
> -    pass
> -else:
> -    __enableDefaultEncoding()
> -    __registerExitHandler()
> -    __enableReadlineSupport()
> diff --git a/recipes/python/python-native-2.7.1/00-fix-bindir-libdir-for-cross.patch b/recipes/python/python-native-2.7.1/00-fix-bindir-libdir-for-cross.patch
> deleted file mode 100644
> index 2559e3a..0000000
> --- a/recipes/python/python-native-2.7.1/00-fix-bindir-libdir-for-cross.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -# $(exec_prefix) points to the wrong directory, when installing
> -# a cross-build. @bindir@ and @libdir@ works better and doesn't
> -# affect the native build.
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -
> -Index: Python-2.6.1/Makefile.pre.in
> -===================================================================
> ---- Python-2.6.1.orig/Makefile.pre.in
> -+++ Python-2.6.1/Makefile.pre.in
> -@@ -86,8 +86,8 @@ exec_prefix=	@exec_prefix@
> - datarootdir=    @datarootdir@
> -
> - # Expanded directories
> --BINDIR=		$(exec_prefix)/bin
> --LIBDIR=		$(exec_prefix)/lib
> -+BINDIR=		@bindir@
> -+LIBDIR=		@libdir@
> - MANDIR=		@mandir@
> - INCLUDEDIR=	@includedir@
> - CONFINCLUDEDIR=	$(exec_prefix)/include
> diff --git a/recipes/python/python-native-2.7.1/01-fix-have-long-long-format.patch b/recipes/python/python-native-2.7.1/01-fix-have-long-long-format.patch
> deleted file mode 100644
> index 6cf3cd4..0000000
> --- a/recipes/python/python-native-2.7.1/01-fix-have-long-long-format.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -# The configure script assumes the %lld printf format is not available as it
> -# can't run its check script. For some reason python refuses to compile without
> -# this functionality, so we just assume that our printf supports %lld.
> -#
> -# Include/pyport.h:243:13: error: #error "This platform's pyconfig.h needs to define PY_FORMAT_LONG_LONG"
> -
> -Index: Python-2.7.1/configure.in
> -===================================================================
> ---- Python-2.7.1.orig/configure.in
> -+++ Python-2.7.1/configure.in
> -@@ -4151,7 +4151,7 @@ then
> -   ]]])],
> -   [ac_cv_have_long_long_format=yes],
> -   [ac_cv_have_long_long_format=no],
> --  [ac_cv_have_long_long_format=no])
> -+  [ac_cv_have_long_long_format=yes])
> -   )
> -   AC_MSG_RESULT($ac_cv_have_long_long_format)
> - fi
> diff --git a/recipes/python/python-native-2.7.1/01-use-proper-tools-for-cross-build.patch b/recipes/python/python-native-2.7.1/01-use-proper-tools-for-cross-build.patch
> deleted file mode 100644
> index 8420eb3..0000000
> --- a/recipes/python/python-native-2.7.1/01-use-proper-tools-for-cross-build.patch
> +++ /dev/null
> @@ -1,169 +0,0 @@
> -# We need to ensure our host tools get run during build, not the freshly
> -# built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -
> -Index: Python-2.7.1/setup.py
> -===================================================================
> ---- Python-2.7.1.orig/setup.py	2010-12-27 13:16:38.032631011 -0500
> -+++ Python-2.7.1/setup.py	2010-12-27 13:16:50.130290766 -0500
> -@@ -313,6 +313,7 @@
> -             self.failed.append(ext.name)
> -             self.announce('*** WARNING: renaming "%s" since importing it'
> -                           ' failed: %s' % (ext.name, why), level=3)
> -+            return
> -             assert not self.inplace
> -             basename, tail = os.path.splitext(ext_filename)
> -             newname = basename + "_failed" + tail
> -@@ -347,8 +348,8 @@
> -
> -     def detect_modules(self):
> -         # Ensure that /usr/local is always used
> --        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
> --        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
> -+        # add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
> -+        # add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
> -
> -         # Add paths specified in the environment variables LDFLAGS and
> -         # CPPFLAGS for header and library files.
> -@@ -452,6 +453,9 @@
> -
> -         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
> -
> -+        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
> -+        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
> -+
> -         #
> -         # The following modules are all pretty straightforward, and compile
> -         # on pretty much any POSIXish platform.
> -Index: Python-2.7.1/Makefile.pre.in
> -===================================================================
> ---- Python-2.7.1.orig/Makefile.pre.in	2010-12-27 13:16:38.022628181 -0500
> -+++ Python-2.7.1/Makefile.pre.in	2010-12-27 13:17:31.870473931 -0500
> -@@ -201,6 +201,7 @@
> -
> - ##########################################################################
> - # Grammar
> -+GRAMMAR_STAMP=	$(srcdir)/grammar-stamp
> - GRAMMAR_H=	$(srcdir)/Include/graminit.h
> - GRAMMAR_C=	$(srcdir)/Python/graminit.c
> - GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
> -@@ -380,7 +381,7 @@
> - 	$(MAKE) all CFLAGS="$(CFLAGS) -fprofile-generate" LIBS="$(LIBS) -lgcov"
> -
> - run_profile_task:
> --	./$(BUILDPYTHON) $(PROFILE_TASK)
> -+	$(HOSTPYTHON) $(PROFILE_TASK)
> -
> - build_all_use_profile:
> - 	$(MAKE) all CFLAGS="$(CFLAGS) -fprofile-use"
> -@@ -398,14 +399,14 @@
> - 			$(BLDLIBRARY) $(LIBS) $(MODLIBS) $(SYSLIBS) $(LDLAST)
> -
> - platform: $(BUILDPYTHON)
> --	$(RUNSHARED) ./$(BUILDPYTHON) -E -c 'import sys ; from sysconfig import get_platform ; print get_platform()+"-"+sys.version[0:3]'>platform
> -+	$(RUNSHARED) $(HOSTPYTHON) -E -c 'import sys ; from sysconfig import get_platform ; print get_platform()+"-"+sys.version[0:3]'>platform
> -
> -
> - # Build the shared modules
> - sharedmods: $(BUILDPYTHON)
> - 	@case $$MAKEFLAGS in \
> --	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
> --	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
> -+	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
> -+	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
> - 	esac
> -
> - # Build static library
> -@@ -535,10 +536,24 @@
> - Modules/python.o: $(srcdir)/Modules/python.c
> - 	$(MAINCC) -c $(PY_CFLAGS) -o $@ $(srcdir)/Modules/python.c
> -
> -+# GNU "make" interprets rules with two dependents as two copies of the rule.
> -+#
> -+# In a parallel build this can lead to pgen being run twice, once for each of
> -+# GRAMMAR_H and GRAMMAR_C, leading to race conditions in which the compiler
> -+# reads a partially-overwritten copy of one of these files, leading to syntax
> -+# errors (or linker errors if the fragment happens to be syntactically valid C)
> -+#
> -+# See http://www.gnu.org/software/hello/manual/automake/Multiple-Outputs.html
> -+# for more information.
> -+#
> -+# Introduce ".grammar-stamp" as a contrived single output from PGEN to avoid
> -+# this:
> -+$(GRAMMAR_H) $(GRAMMAR_C): $(GRAMMAR_STAMP)
> -
> --$(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
> -+$(GRAMMAR_STAMP): $(PGEN) $(GRAMMAR_INPUT)
> - 		-@$(INSTALL) -d Include
> - 		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
> -+		touch $(GRAMMAR_STAMP)
> -
> - $(PGEN):	$(PGENOBJS)
> - 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
> -@@ -921,25 +936,25 @@
> - 	done
> - 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
> - 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
> --		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
> -+		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
> - 		-d $(LIBDEST) -f \
> - 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
> - 		$(DESTDIR)$(LIBDEST)
> - 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> --		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
> -+		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
> - 		-d $(LIBDEST) -f \
> - 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
> - 		$(DESTDIR)$(LIBDEST)
> - 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
> --		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
> -+		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
> - 		-d $(LIBDEST)/site-packages -f \
> - 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
> - 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> --		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
> -+		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
> - 		-d $(LIBDEST)/site-packages -f \
> - 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
> - 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> --		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
> -+		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
> -
> - # Create the PLATDIR source directory, if one wasn't distributed..
> - $(srcdir)/Lib/$(PLATDIR):
> -@@ -1044,7 +1059,7 @@
> - # Install the dynamically loadable modules
> - # This goes into $(exec_prefix)
> - sharedinstall: sharedmods
> --	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
> -+	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
> - 	   	--prefix=$(prefix) \
> - 		--install-scripts=$(BINDIR) \
> - 		--install-platlib=$(DESTSHARED) \
> -@@ -1117,7 +1132,7 @@
> - # This installs a few of the useful scripts in Tools/scripts
> - scriptsinstall:
> - 	SRCDIR=$(srcdir) $(RUNSHARED) \
> --	./$(BUILDPYTHON) $(srcdir)/Tools/scripts/setup.py install \
> -+	$(HOSTPYTHON) $(srcdir)/Tools/scripts/setup.py install \
> - 	--prefix=$(prefix) \
> - 	--install-scripts=$(BINDIR) \
> - 	--root=/$(DESTDIR)
> -@@ -1139,7 +1154,7 @@
> -
> - # Run reindent on the library
> - reindent:
> --	./$(BUILDPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
> -+	$(HOSTPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
> -
> - # Rerun configure with the same options as it was run last time,
> - # provided the config.status script exists
> -@@ -1242,7 +1257,7 @@
> -
> - # Perform some verification checks on any modified files.
> - patchcheck:
> --	$(RUNSHARED) ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
> -+	$(RUNSHARED) $(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
> -
> - # Dependencies
> -
> diff --git a/recipes/python/python-native-2.7.1/02-remove-test-for-cross.patch b/recipes/python/python-native-2.7.1/02-remove-test-for-cross.patch
> deleted file mode 100644
> index ab5858c..0000000
> --- a/recipes/python/python-native-2.7.1/02-remove-test-for-cross.patch
> +++ /dev/null
> @@ -1,108 +0,0 @@
> -# OpenEmbedded prepopulates the autotools site cache, so if this
> -# would be using AC_TRY_CACHE, we could patch it in a more sane way
> -# Alas, I don't have enough autotalent to do that.
> -#
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -Index: Python-2.7.1/configure.in
> -===================================================================
> ---- Python-2.7.1.orig/configure.in	2010-12-26 10:02:03.222663593 -0500
> -+++ Python-2.7.1/configure.in	2010-12-26 10:02:19.891414484 -0500
> -@@ -2822,49 +2822,6 @@
> -   AC_CHECK_LIB(resolv, inet_aton)
> - )
> -
> --# On Tru64, chflags seems to be present, but calling it will
> --# exit Python
> --AC_CACHE_CHECK([for chflags], [ac_cv_have_chflags], [dnl
> --AC_RUN_IFELSE([AC_LANG_SOURCE([[[
> --#include<sys/stat.h>
> --#include<unistd.h>
> --int main(int argc, char*argv[])
> --{
> --  if(chflags(argv[0], 0) != 0)
> --    return 1;
> --  return 0;
> --}
> --]]])],
> --[ac_cv_have_chflags=yes],
> --[ac_cv_have_chflags=no],
> --[ac_cv_have_chflags=cross])
> --])
> --if test "$ac_cv_have_chflags" = cross ; then
> --  AC_CHECK_FUNC([chflags], [ac_cv_have_chflags="yes"], [ac_cv_have_chflags="no"])
> --fi
> --if test "$ac_cv_have_chflags" = yes ; then
> --  AC_DEFINE(HAVE_CHFLAGS, 1, [Define to 1 if you have the `chflags' function.])
> --fi
> --
> --AC_CACHE_CHECK([for lchflags], [ac_cv_have_lchflags], [dnl
> --AC_RUN_IFELSE([AC_LANG_SOURCE([[[
> --#include<sys/stat.h>
> --#include<unistd.h>
> --int main(int argc, char*argv[])
> --{
> --  if(lchflags(argv[0], 0) != 0)
> --    return 1;
> --  return 0;
> --}
> --]]])],[ac_cv_have_lchflags=yes],[ac_cv_have_lchflags=no],[ac_cv_have_lchflags=cross])
> --])
> --if test "$ac_cv_have_lchflags" = cross ; then
> --  AC_CHECK_FUNC([lchflags], [ac_cv_have_lchflags="yes"], [ac_cv_have_lchflags="no"])
> --fi
> --if test "$ac_cv_have_lchflags" = yes ; then
> --  AC_DEFINE(HAVE_LCHFLAGS, 1, [Define to 1 if you have the `lchflags' function.])
> --fi
> --
> - dnl Check if system zlib has *Copy() functions
> - dnl
> - dnl On MacOSX the linker will search for dylibs on the entire linker path
> -@@ -4210,48 +4167,6 @@
> - 	LIBS="$LIBS -framework CoreFoundation"
> - fi
> -
> --
> --AC_CACHE_CHECK([for %zd printf() format support], ac_cv_have_size_t_format, [dnl
> --AC_RUN_IFELSE([AC_LANG_SOURCE([[
> --#include<stdio.h>
> --#include<stddef.h>
> --#include<string.h>
> --
> --#ifdef HAVE_SYS_TYPES_H
> --#include<sys/types.h>
> --#endif
> --
> --#ifdef HAVE_SSIZE_T
> --typedef ssize_t Py_ssize_t;
> --#elif SIZEOF_VOID_P == SIZEOF_LONG
> --typedef long Py_ssize_t;
> --#else
> --typedef int Py_ssize_t;
> --#endif
> --
> --int main()
> --{
> --    char buffer[256];
> --
> --    if(sprintf(buffer, "%zd", (size_t)123)<  0)
> --       	return 1;
> --
> --    if (strcmp(buffer, "123"))
> --	return 1;
> --
> --    if (sprintf(buffer, "%zd", (Py_ssize_t)-123)<  0)
> --       	return 1;
> --
> --    if (strcmp(buffer, "-123"))
> --	return 1;
> --
> --    return 0;
> --}
> --]])],
> --[ac_cv_have_size_t_format=yes],
> --[ac_cv_have_size_t_format=no],
> --[ac_cv_have_size_t_format="cross -- assuming yes"
> --])])
> - if test "$ac_cv_have_size_t_format" != no ; then
> -   AC_DEFINE(PY_FORMAT_SIZE_T, "z",
> -   [Define to printf format modifier for Py_ssize_t])
> diff --git a/recipes/python/python-native-2.7.1/03-fix-tkinter-detection.patch b/recipes/python/python-native-2.7.1/03-fix-tkinter-detection.patch
> deleted file mode 100644
> index 47274b3..0000000
> --- a/recipes/python/python-native-2.7.1/03-fix-tkinter-detection.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -# We need to supply STAGING_INCDIR here, otherwise the Tk headers
> -# will not be found.
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille.de>
> -
> -Index: Python-2.7.1/setup.py
> -===================================================================
> ---- Python-2.7.1.orig/setup.py	2010-12-26 10:01:38.992621096 -0500
> -+++ Python-2.7.1/setup.py	2010-12-26 10:02:31.032604626 -0500
> -@@ -1712,7 +1712,7 @@
> -                 dotversion = dotversion[:-1] + '.' + dotversion[-1]
> -             tcl_include_sub = []
> -             tk_include_sub = []
> --            for dir in inc_dirs:
> -+            for dir in [os.getenv("STAGING_INCDIR")]:
> -                 tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
> -                 tk_include_sub += [dir + os.sep + "tk" + dotversion]
> -             tk_include_sub += tcl_include_sub
> -@@ -1731,22 +1731,6 @@
> -             if dir not in include_dirs:
> -                 include_dirs.append(dir)
> -
> --        # Check for various platform-specific directories
> --        if platform == 'sunos5':
> --            include_dirs.append('/usr/openwin/include')
> --            added_lib_dirs.append('/usr/openwin/lib')
> --        elif os.path.exists('/usr/X11R6/include'):
> --            include_dirs.append('/usr/X11R6/include')
> --            added_lib_dirs.append('/usr/X11R6/lib64')
> --            added_lib_dirs.append('/usr/X11R6/lib')
> --        elif os.path.exists('/usr/X11R5/include'):
> --            include_dirs.append('/usr/X11R5/include')
> --            added_lib_dirs.append('/usr/X11R5/lib')
> --        else:
> --            # Assume default location for X11
> --            include_dirs.append('/usr/X11/include')
> --            added_lib_dirs.append('/usr/X11/lib')
> --
> -         # If Cygwin, then verify that X is installed before proceeding
> -         if platform == 'cygwin':
> -             x11_inc = find_file('X11/Xlib.h', [], include_dirs)
> diff --git a/recipes/python/python-native-2.7.1/04-default-is-optimized.patch b/recipes/python/python-native-2.7.1/04-default-is-optimized.patch
> deleted file mode 100644
> index 5131e0b..0000000
> --- a/recipes/python/python-native-2.7.1/04-default-is-optimized.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -# When compiling for an embedded system, we need every bit of
> -# performance we can get. default to optimized with the option
> -# of opt-out.
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -
> -Index: Python-2.6.1/Python/compile.c
> -===================================================================
> ---- Python-2.6.1.orig/Python/compile.c
> -+++ Python-2.6.1/Python/compile.c
> -@@ -32,7 +32,7 @@
> - #include "symtable.h"
> - #include "opcode.h"
> -
> --int Py_OptimizeFlag = 0;
> -+int Py_OptimizeFlag = 1;
> -
> - #define DEFAULT_BLOCK_SIZE 16
> - #define DEFAULT_BLOCKS 8
> diff --git a/recipes/python/python-native-2.7.1/05-enable-ctypes-cross-build.patch b/recipes/python/python-native-2.7.1/05-enable-ctypes-cross-build.patch
> deleted file mode 100644
> index c33dc9f..0000000
> --- a/recipes/python/python-native-2.7.1/05-enable-ctypes-cross-build.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -# CTypes need to know the actual host we are building on.
> -# Signed-Off: Michael Dietrich<mdt@emdete.de>
> -
> -Index: Python-2.7.1/setup.py
> -===================================================================
> ---- Python-2.7.1.orig/setup.py	2010-12-26 10:02:31.032604626 -0500
> -+++ Python-2.7.1/setup.py	2010-12-26 10:02:43.182604395 -0500
> -@@ -1825,16 +1825,16 @@
> -                                          ffi_configfile):
> -                 from distutils.dir_util import mkpath
> -                 mkpath(ffi_builddir)
> --                config_args = []
> -+                config_args = ['--host=%s' % os.environ["HOST_SYS"], ]
> -
> -                 # Pass empty CFLAGS because we'll just append the resulting
> -                 # CFLAGS to Python's; -g or -O2 is to be avoided.
> --                cmd = "cd %s&&  env CFLAGS='' '%s/configure' %s" \
> --                      % (ffi_builddir, ffi_srcdir, " ".join(config_args))
> -+                cmd = "(cd %s&&  autoconf -W cross)&&  (cd %s&&  env CFLAGS='' '%s/configure' %s)" \
> -+                      % (ffi_srcdir, ffi_builddir, ffi_srcdir, " ".join(config_args))
> -
> -                 res = os.system(cmd)
> -                 if res or not os.path.exists(ffi_configfile):
> --                    print "Failed to configure _ctypes module"
> -+                    print "Failed to configure _ctypes module (res=%d) or missing conffile=%s" % ( res, ffi_configfile )
> -                     return False
> -
> -             fficonfig = {}
> diff --git a/recipes/python/python-native-2.7.1/06-ctypes-libffi-fix-configure.patch b/recipes/python/python-native-2.7.1/06-ctypes-libffi-fix-configure.patch
> deleted file mode 100644
> index b5e59e6..0000000
> --- a/recipes/python/python-native-2.7.1/06-ctypes-libffi-fix-configure.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -This fixes configure issues with recent autoconf, e.g:
> -  autoreconf: Entering directory `Modules/_ctypes/libffi'
> -  autoreconf: configure.ac: not using Gettext
> -  autoreconf: running: aclocal --force
> -  configure.ac:26: error: m4_copy: won't overwrite defined macro: _AC_ARG_VAR_PRECIOUS
> -  configure.ac:26: the top level
> -
> -The problem is still present in python-2.6.5 but fixed in python-svn.
> -
> -Index: Python-2.7.1/Modules/_ctypes/libffi/Makefile.am
> -===================================================================
> ---- Python-2.7.1.orig/Modules/_ctypes/libffi/Makefile.am	2010-03-19 14:59:20.000000000 -0400
> -+++ Python-2.7.1/Modules/_ctypes/libffi/Makefile.am	2010-12-26 10:05:56.112625174 -0500
> -@@ -2,7 +2,7 @@
> -
> - AUTOMAKE_OPTIONS = foreign subdir-objects
> -
> --SUBDIRS = include testsuite man
> -+SUBDIRS = include
> -
> - EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
> - 	src/alpha/ffi.c src/alpha/osf.S src/alpha/ffitarget.h \
> -@@ -34,8 +34,6 @@
> - 	libtool-version ChangeLog.libffi m4/libtool.m4 \
> - 	m4/lt~obsolete.m4 m4/ltoptions.m4 m4/ltsugar.m4 m4/ltversion.m4
> -
> --info_TEXINFOS = doc/libffi.texi
> --
> - ## ################################################################
> -
> - ##
> -Index: Python-2.7.1/Modules/_ctypes/libffi/configure.ac
> -===================================================================
> ---- Python-2.7.1.orig/Modules/_ctypes/libffi/configure.ac	2010-12-26 10:06:09.752605599 -0500
> -+++ Python-2.7.1/Modules/_ctypes/libffi/configure.ac	2010-12-26 10:07:18.260769612 -0500
> -@@ -409,7 +409,7 @@
> -
> - AC_CONFIG_LINKS(include/ffitarget.h:src/$TARGETDIR/ffitarget.h)
> -
> --AC_CONFIG_FILES(include/Makefile include/ffi.h Makefile testsuite/Makefile man/Makefile libffi.pc)
> -+AC_CONFIG_FILES(include/Makefile include/ffi.h Makefile testsuite/Makefile man/Makefile libffi.pc Makefile)
> -
> - AC_CONFIG_LINKS(include/ffi_common.h:include/ffi_common.h)
> -
> diff --git a/recipes/python/python-native-2.7.1/10-distutils-fix-swig-parameter.patch b/recipes/python/python-native-2.7.1/10-distutils-fix-swig-parameter.patch
> deleted file mode 100644
> index 0e86954..0000000
> --- a/recipes/python/python-native-2.7.1/10-distutils-fix-swig-parameter.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -# Some versions of SWIG do not use the extension parameter.
> -# Make it optional.
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -Index: Python-2.7.1/Lib/distutils/command/build_ext.py
> -===================================================================
> ---- Python-2.7.1.orig/Lib/distutils/command/build_ext.py	2010-09-10 16:03:17.000000000 -0400
> -+++ Python-2.7.1/Lib/distutils/command/build_ext.py	2010-12-26 10:07:28.492632349 -0500
> -@@ -531,7 +531,7 @@
> -             target_lang=language)
> -
> -
> --    def swig_sources (self, sources, extension):
> -+    def swig_sources (self, sources, extension=None):
> -
> -         """Walk the list of source files in 'sources', looking for SWIG
> -         interface (.i) files.  Run SWIG on all that are found, and
> diff --git a/recipes/python/python-native-2.7.1/11-distutils-never-modify-shebang-line.patch b/recipes/python/python-native-2.7.1/11-distutils-never-modify-shebang-line.patch
> deleted file mode 100644
> index 20f3605..0000000
> --- a/recipes/python/python-native-2.7.1/11-distutils-never-modify-shebang-line.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -# Don't modify the she-bang line for a cross-build.
> -# Otherwise it points to our hostpython (which we do not want)
> -#
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -
> -Index: Python-2.7.1/Lib/distutils/command/build_scripts.py
> -===================================================================
> ---- Python-2.7.1.orig/Lib/distutils/command/build_scripts.py	2010-01-23 04:23:15.000000000 -0500
> -+++ Python-2.7.1/Lib/distutils/command/build_scripts.py	2010-12-26 10:07:35.762597668 -0500
> -@@ -85,7 +85,7 @@
> -                     continue
> -
> -                 match = first_line_re.match(first_line)
> --                if match:
> -+                if False: #match:
> -                     adjust = 1
> -                     post_interp = match.group(1) or ''
> -
> diff --git a/recipes/python/python-native-2.7.1/12-distutils-prefix-is-inside-staging-area.patch b/recipes/python/python-native-2.7.1/12-distutils-prefix-is-inside-staging-area.patch
> deleted file mode 100644
> index afe4201..0000000
> --- a/recipes/python/python-native-2.7.1/12-distutils-prefix-is-inside-staging-area.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -# The proper prefix is inside our staging area.
> -# Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> -
> -Index: Python-2.7.1/Lib/distutils/sysconfig.py
> -===================================================================
> ---- Python-2.7.1.orig/Lib/distutils/sysconfig.py	2010-11-06 10:16:30.000000000 -0400
> -+++ Python-2.7.1/Lib/distutils/sysconfig.py	2010-12-26 10:08:40.760410838 -0500
> -@@ -19,8 +19,8 @@
> - from distutils.errors import DistutilsPlatformError
> -
> - # These are needed in a couple of spots, so just compute them once.
> --PREFIX = os.path.normpath(sys.prefix)
> --EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
> -+PREFIX = os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> -+EXEC_PREFIX = os.path.normpath(sys.exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> -
> - # Path to the base directory of the project. On Windows the binary may
> - # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
> -@@ -70,7 +70,10 @@
> -     sys.exec_prefix -- i.e., ignore 'plat_specific'.
> -     """
> -     if prefix is None:
> --        prefix = plat_specific and EXEC_PREFIX or PREFIX
> -+        if plat_specific:
> -+            prefix = plat_specific and os.environ['STAGING_INCDIR'].rstrip('include')
> -+        else:
> -+            prefix = plat_specific and EXEC_PREFIX or PREFIX
> -
> -     if os.name == "posix":
> -         if python_build:
> -@@ -111,7 +114,10 @@
> -     sys.exec_prefix -- i.e., ignore 'plat_specific'.
> -     """
> -     if prefix is None:
> --        prefix = plat_specific and EXEC_PREFIX or PREFIX
> -+        if plat_specific:
> -+            prefix = plat_specific and os.environ['STAGING_LIBDIR'].rstrip('lib')
> -+        else:
> -+            prefix = plat_specific and EXEC_PREFIX or PREFIX
> -
> -     if os.name == "posix":
> -         libpython = os.path.join(prefix,
> -@@ -199,7 +205,7 @@
> -     else:
> -         # The name of the config.h file changed in 2.2
> -         config_h = 'pyconfig.h'
> --    return os.path.join(inc_dir, config_h)
> -+    return os.path.join(inc_dir, config_h).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> -
> -
> - def get_makefile_filename():
> -@@ -207,7 +213,7 @@
> -     if python_build:
> -         return os.path.join(os.path.dirname(sys.executable), "Makefile")
> -     lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
> --    return os.path.join(lib_dir, "config", "Makefile")
> -+    return os.path.join(lib_dir, "config", "Makefile").replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> -
> -
> - def parse_config_h(fp, g=None):
> diff --git a/recipes/python/python-native-2.7.1/99-ignore-optimization-flag.patch b/recipes/python/python-native-2.7.1/99-ignore-optimization-flag.patch
> deleted file mode 100644
> index f068ece..0000000
> --- a/recipes/python/python-native-2.7.1/99-ignore-optimization-flag.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -# Reinstate the empty -O option to fix weird mixing of native and target
> -# binaries and libraries with LD_LIBRARY_PATH when host==target
> -#
> -# Signed-off-by: Denys Dmytriyenko<denis@denix.org>
> -
> -Index: Python-2.7.1/Modules/main.c
> -===================================================================
> ---- Python-2.7.1.orig/Modules/main.c	2010-06-13 02:50:39.000000000 -0400
> -+++ Python-2.7.1/Modules/main.c	2010-12-26 10:09:34.300455892 -0500
> -@@ -329,8 +329,7 @@
> -
> -         /* case 'J': reserved for Jython */
> -
> --        case 'O':
> --            Py_OptimizeFlag++;
> -+        case 'O': /* ignore it */
> -             break;
> -
> -         case 'B':
> diff --git a/recipes/python/python-native-2.7.1/debug.patch b/recipes/python/python-native-2.7.1/debug.patch
> deleted file mode 100644
> index c7f5081..0000000
> --- a/recipes/python/python-native-2.7.1/debug.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Index: Python-2.7.1/Lib/distutils/unixccompiler.py
> -===================================================================
> ---- Python-2.7.1.orig/Lib/distutils/unixccompiler.py	2010-06-27 08:36:16.000000000 -0400
> -+++ Python-2.7.1/Lib/distutils/unixccompiler.py	2010-12-26 10:09:44.282632589 -0500
> -@@ -318,6 +318,8 @@
> -
> -
> -
> -+        print "Looking in %s for %s" % (lib, dirs)
> -+
> -         for dir in dirs:
> -             shared = os.path.join(dir, shared_f)
> -             dylib = os.path.join(dir, dylib_f)
> -@@ -336,10 +338,13 @@
> -             # assuming that *all* Unix C compilers do.  And of course I'm
> -             # ignoring even GCC's "-static" option.  So sue me.
> -             if os.path.exists(dylib):
> -+                print "Found %s" % (dylib)
> -                 return dylib
> -             elif os.path.exists(shared):
> -+                print "Found %s" % (shared)
> -                 return shared
> -             elif os.path.exists(static):
> -+                print "Found %s" % (static)
> -                 return static
> -
> -         # Oops, didn't find it in *any* of 'dirs'
> diff --git a/recipes/python/python-native-2.7.1/nohostlibs.patch b/recipes/python/python-native-2.7.1/nohostlibs.patch
> deleted file mode 100644
> index 6f33a49..0000000
> --- a/recipes/python/python-native-2.7.1/nohostlibs.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Index: Python-2.7.1/setup.py
> -===================================================================
> ---- Python-2.7.1.orig/setup.py	2010-12-26 10:02:43.000000000 -0500
> -+++ Python-2.7.1/setup.py	2010-12-26 10:12:30.920427195 -0500
> -@@ -404,11 +404,8 @@
> -         # lib_dirs and inc_dirs are used to search for files;
> -         # if a file is found in one of those directories, it can
> -         # be assumed that no additional -I,-L directives are needed.
> --        lib_dirs = self.compiler.library_dirs + [
> --            '/lib64', '/usr/lib64',
> --            '/lib', '/usr/lib',
> --            ]
> --        inc_dirs = self.compiler.include_dirs + ['/usr/include']
> -+        lib_dirs = self.compiler.library_dirs
> -+        inc_dirs = self.compiler.include_dirs
> -         exts = []
> -         missing = []
> -
> -@@ -657,9 +654,7 @@
> -                 pass # Issue 7384: Already linked against curses or tinfo.
> -             elif curses_library:
> -                 readline_libs.append(curses_library)
> --            elif self.compiler.find_library_file(lib_dirs +
> --                                                     ['/usr/lib/termcap'],
> --                                                     'termcap'):
> -+            elif self.compiler.find_library_file(lib_dirs, 'termcap'):
> -                 readline_libs.append('termcap')
> -             exts.append( Extension('readline', ['readline.c'],
> -                                    library_dirs=['/usr/lib/termcap'],
> diff --git a/recipes/python/python-native-2.7.1/sitecustomize.py b/recipes/python/python-native-2.7.1/sitecustomize.py
> deleted file mode 100644
> index 2739018..0000000
> --- a/recipes/python/python-native-2.7.1/sitecustomize.py
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer<mlauer@vanille-media.de>
> -# GPLv2 or later
> -# Version: 20081123
> -# Features:
> -# * set proper default encoding
> -# * enable readline completion in the interactive interpreter
> -# * load command line history on startup
> -# * save command line history on exit
> -
> -import os
> -
> -def __exithandler():
> -    try:
> -        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
> -    except IOError:
> -        pass
> -
> -def __registerExitHandler():
> -    import atexit
> -    atexit.register( __exithandler )
> -
> -def __enableReadlineSupport():
> -    readline.set_history_length( 1000 )
> -    readline.parse_and_bind( "tab: complete" )
> -    try:
> -        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
> -    except IOError:
> -        pass
> -
> -def __enableDefaultEncoding():
> -    import sys
> -    try:
> -        sys.setdefaultencoding( "utf8" )
> -    except LookupError:
> -        pass
> -
> -import sys
> -try:
> -    import rlcompleter, readline
> -except ImportError:
> -    pass
> -else:
> -    __enableDefaultEncoding()
> -    __registerExitHandler()
> -    __enableReadlineSupport()
> diff --git a/recipes/python/python-native_2.6.1.bb b/recipes/python/python-native_2.6.1.bb
> deleted file mode 100644
> index 18002df..0000000
> --- a/recipes/python/python-native_2.6.1.bb
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -require python.inc
> -DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native"
> -PR = "${INC_PR}.3"
> -
> -SRC_URI = "\
> -  http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
> -  file://00-fix-bindir-libdir-for-cross.patch \
> -  file://04-default-is-optimized.patch \
> -  file://05-enable-ctypes-cross-build.patch \
> -  file://10-distutils-fix-swig-parameter.patch \
> -  file://11-distutils-never-modify-shebang-line.patch \
> -  file://12-distutils-prefix-is-inside-staging-area.patch \
> -  file://debug.patch \
> -  file://nohostlibs.patch \
> -"
> -S = "${WORKDIR}/Python-${PV}"
> -
> -inherit native
> -
> -EXTRA_OEMAKE = '\
> -  BUILD_SYS="" \
> -  HOST_SYS="" \
> -  LIBC="" \
> -  STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
> -  STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
> -'
> -
> -do_install_append() {
> -	install -m 0755 Parser/pgen ${D}${bindir}/pgen
> -}
> -
> -SRC_URI[md5sum] = "e81c2f0953aa60f8062c05a4673f2be0"
> -SRC_URI[sha256sum] = "cf153f10ba6312a8303ceb01bed834a2786d28aa89c7d73dba64714f691628f6"
> diff --git a/recipes/python/python-native_2.6.4.bb b/recipes/python/python-native_2.6.4.bb
> deleted file mode 100644
> index df2aa72..0000000
> --- a/recipes/python/python-native_2.6.4.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -require python.inc
> -DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native"
> -# set to 0 on every increase of INC_PR
> -PR = "${INC_PR}.1"
> -
> -SRC_URI = "\
> -  http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2;name=archive \
> -  file://00-fix-bindir-libdir-for-cross.patch \
> -  file://04-default-is-optimized.patch \
> -  file://05-enable-ctypes-cross-build.patch \
> -  file://06-ctypes-libffi-fix-configure.patch \
> -  file://10-distutils-fix-swig-parameter.patch \
> -  file://11-distutils-never-modify-shebang-line.patch \
> -  file://12-distutils-prefix-is-inside-staging-area.patch \
> -  file://debug.patch \
> -  file://nohostlibs.patch \
> -"
> -S = "${WORKDIR}/Python-${PV}"
> -
> -SRC_URI[archive.md5sum] = "fee5408634a54e721a93531aba37f8c1"
> -SRC_URI[archive.sha256sum] = "dad8d5575144a210d5cc4fdbc40b8a26386e9cdb1ef58941bec0be02c7cb9d89"
> -
> -inherit native
> -
> -EXTRA_OEMAKE = '\
> -  BUILD_SYS="" \
> -  HOST_SYS="" \
> -  LIBC="" \
> -  STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
> -  STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
> -'
> -
> -do_install_append() {
> -	install -m 0755 Parser/pgen ${D}${bindir}/pgen
> -}



