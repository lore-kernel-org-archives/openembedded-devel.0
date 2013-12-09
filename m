Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8EE61222
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2013 19:23:02 +0000 (UTC)
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB9JN1Lp007902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Dec 2013 11:23:02 -0800 (PST)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>) id 1Vq6Q1-000093-BI
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Dec 2013 14:23:01 -0500
Date: Mon, 9 Dec 2013 14:23:01 -0500
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131209192301.GA524@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-java][PATCH] Uprev classpath-initial and jamvm-initial
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
X-List-Received-Date: Mon, 09 Dec 2013 19:23:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Note:
1. the segfaults were regularly observed when using gcc versions 4.8.*
2. precompiled glibj.zip not attached to message (too big: 9.5M in size).


=46rom 81f50c8b8873560a687510b91db43d81e135fca6 Mon Sep 17 00:00:00 2001
=46rom: Amy Fong <amy.fong@windriver.com>
Date: Tue, 03 Dec 2013 20:05:22 +0000
Subject: Uprev classpath-initial and jamvm-initial

jamvm-1.4.5 has a lot of memory issues that results in segfaults happening
when classpath-native gets configured. We uprev jamvm to 1.5.4, this
also requires upreving classpath-initial to 0.98.

Since jikes cannot compile this version of classpath, we provide a
precompiled version of glibj.zip. glibj.zip was built from classpath 0.98.
using the configure line: ./configure --disable-plugin --disable-Werror
config.log is included in recipes-core/classpath/classpath-0.98/

Note: Attempting to use classpath 0.99 resulted in the build hanging
      at classpath-native with the following error mesage:

(on openSUSE 12.3)

0: classpath-native-0.99-r6.0 do_compile (pid 21173)
*** Error in `jamvm-initial': free(): invalid next size (normal):
    0x000000000151e4d0 ***
*** Error in `jamvm-initial': malloc(): memory corruption:
    0x000000000151e580 ***

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
diff --git a/recipes-core/classpath/classpath-0.98/autotools.patch b/recipe=
s-core/classpath/classpath-0.98/autotools.patch
new file mode 100644
index 0000000..7261ecf
--- a/dev/null
+++ b/recipes-core/classpath/classpath-0.98/autotools.patch
@@ -0,0 +1,121 @@
+Backported from classpath-native uprev to 0.99 commit
+ea76b80108b4c292379e37e01cdbb9d984d74759
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+---
+ configure.ac         |    4 ++++
+ examples/Makefile.am |    4 ++--
+ lib/Makefile.am      |   10 +++++-----
+ tools/Makefile.am    |    8 ++++----
+ 4 files changed, 15 insertions(+), 11 deletions(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -41,6 +41,9 @@
+ AC_CONFIG_HEADERS([include/config.h])
+ AC_PREFIX_DEFAULT(/usr/local/classpath)
+=20
++AC_PROG_MKDIR_P
++AM_ICONV_LINK
++
+ dnl -----------------------------------------------------------
+ dnl Enable collections.jar (disabled by default)
+ dnl -----------------------------------------------------------
+@@ -381,6 +384,7 @@
+ AC_PROG_CC
+ AM_PROG_CC_C_O
+ AC_PROG_CPP
++AM_PROG_CC_C_O
+=20
+ # Handle -Werror default case.
+ if test "$ENABLE_WERROR" =3D default; then
+--- a/examples/Makefile.am
++++ b/examples/Makefile.am
+@@ -96,9 +96,9 @@
+ endif
+=20
+ $(EXAMPLE_ZIP): $(EXAMPLE_JAVA_FILES)
+-	@mkdir_p@ classes/gnu/classpath/examples/icons
++	$(MKDIR_P) classes/gnu/classpath/examples/icons
+ 	cp $(EXAMPLE_ICONS) classes/gnu/classpath/examples/icons
+-	@mkdir_p@ classes/gnu/classpath/examples/swing
++	$(MKDIR_P) classes/gnu/classpath/examples/swing
+ 	cp $(EXAMPLE_HTML) classes/gnu/classpath/examples/swing
+ 	$(JCOMPILER) -d classes $(EXAMPLE_JAVA_FILES)=20
+ 	(cd classes; \
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -83,18 +83,18 @@
+ resources: copy-vmresources.sh
+ 	@list=3D`cd $(top_srcdir)/resource && $(FIND) gnu java javax org -name \=
*\.properties -print -o -name \*\.css -print`; for p in $$list; do \
+           dirname=3D`dirname $$p`; \
+-          if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
++          if ! test -d "$$dirname"; then $(MKDIR_P) "$$dirname"; fi; \
+ 	  cp $(top_srcdir)/resource/$$p $$p; \
+ 	done
+ 	@list=3D`cd $(top_srcdir)/resource && $(FIND) META-INF -name CVS -prune =
-o -name .svn -prune -o -name \*\.in -prune -o -type f -print`; for p in $$=
list; do \
+           dirname=3D`dirname $$p`; \
+-          if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
++          if ! test -d "$$dirname"; then $(MKDIR_P) "$$dirname"; fi; \
+ 	  cp $(top_srcdir)/resource/$$p $$p; \
+ 	done
+ 	@$(SHELL) ./copy-vmresources.sh
+ 	@list=3D`cd $(top_srcdir) && $(FIND) gnu/javax/swing/plaf/gtk/icons -nam=
e *.png -type f -print`; for p in $$list; do \
+           dirname=3D`dirname $$p`; \
+-          if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
++          if ! test -d "$$dirname"; then $(MKDIR_P) "$$dirname"; fi; \
+ 	  cp $(top_srcdir)/$$p $$p; \
+ 	done
+ 	touch resources
+@@ -102,7 +102,7 @@
+ classes: genclasses
+=20
+ $(top_builddir)/gnu/java/locale/LocaleData.java: $(top_srcdir)/scripts/ge=
nerate-locale-list.sh=20
+-	@mkdir_p@ $(top_builddir)/gnu/java/locale
++	$(MKDIR_P) $(top_builddir)/gnu/java/locale
+ 	$(top_srcdir)/scripts/generate-locale-list.sh > $(top_builddir)/gnu/java=
/locale/LocaleData.java
+=20
+ genclasses: gen-classlist.sh standard.omit $(top_builddir)/gnu/java/local=
e/LocaleData.java gen-xpath-parser
+@@ -160,7 +160,7 @@
+ 	-rm -rf lists
+=20
+ dist-hook:
+-	@mkdir_p@ $(distdir)
++	$(MKDIR_P) $(distdir)
+ 	cp -pdfR $(top_srcdir)/gnu $(top_srcdir)/java $(top_srcdir)/javax $(top_=
srcdir)/org $(top_srcdir)/sun $(top_srcdir)/vm $(top_srcdir)/resource $(dis=
tdir)/..
+ # Delete not wanted files.
+ 	$(FIND) $(distdir)/../gnu $(distdir)/../java $(distdir)/../javax $(distd=
ir)/../org $(distdir)/../sun $(distdir)/../vm $(distdir)/../resource -name =
CVS -print | xargs rm -fr
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -312,11 +312,11 @@
+ # so they get also included.
+ $(TOOLS_ZIP): $(ALL_TOOLS_FILES)
+ 	@rm -rf classes asm
+-	@mkdir_p@ classes asm=20
++	$(MKDIR_P) classes asm
+ if CREATE_GJDOC
+ if CREATE_GJDOC_PARSER
+ ## Generate antlr sources.
+-	@mkdir_p@ $(gjdoc_gendir)/gnu/classpath/tools/gjdoc/expr
++	$(MKDIR_P) $(gjdoc_gendir)/gnu/classpath/tools/gjdoc/expr
+ 	$(ANTLR) -o $(gjdoc_gendir)/gnu/classpath/tools/gjdoc/expr/ \
+ 	  $(srcdir)/gnu/classpath/tools/gjdoc/expr/java-expression.g
+ endif
+@@ -346,7 +346,7 @@
+ 	       sun/rmi/rmic $(GJDOC_EX) -name \*.properties -print -o -name \*.j=
av -print`; \
+ 	for p in $$list; do \
+ 	  dirname=3Dclasses/`dirname $$p`; \
+-	  if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
++	  if ! test -d "$$dirname"; then $(MKDIR_P) "$$dirname"; fi; \
+ 	  echo "  cp $(srcdir)/resource/$$p classes/$$p"; \
+ 	  cp $(srcdir)/resource/$$p classes/$$p; \
+ 	done
+@@ -354,7 +354,7 @@
+ ## Copy over gjdoc resource files.
+ 	for res in $(gjdoc_resources); do \
+ 	  dir=3Dclasses/`dirname $$res`; \
+-	  if ! test -d "$$dir"; then @mkdir_p@ "$$dir"; fi; \
++	  if ! test -d "$$dir"; then $(MKDIR_P) "$$dir"; fi; \
+ 	  echo "  cp $(srcdir)/resource/gnu/classpath/tools/gjdoc/$$res classes/=
$$res"; \
+ 	  cp $(srcdir)/resource/gnu/classpath/tools/gjdoc/$$res classes/$$res; \
+ 	done=20
diff --git a/recipes-core/classpath/classpath-0.98/config.log b/recipes-cor=
e/classpath/classpath-0.98/config.log
new file mode 100644
index 0000000..f50c0ea
--- a/dev/null
+++ b/recipes-core/classpath/classpath-0.98/config.log
@@ -0,0 +1,3975 @@
+This file contains any messages produced by compilers while
+running configure, to aid debugging if configure makes a mistake.
+
+It was created by GNU Classpath configure 0.98, which was
+generated by GNU Autoconf 2.63.  Invocation command line was
+
+  $ ./configure --disable-plugin --disable-Werror
+
+## --------- ##
+## Platform. ##
+## --------- ##
+
+hostname =3D yow-afong-lx2
+uname -m =3D x86_64
+uname -r =3D 3.11.1
+uname -s =3D Linux
+uname -v =3D #4 SMP PREEMPT Wed Oct 2 14:48:54 EDT 2013
+
+/usr/bin/uname -p =3D unknown
+/bin/uname -X     =3D unknown
+
+/bin/arch              =3D unknown
+/usr/bin/arch -k       =3D unknown
+/usr/convex/getsysinfo =3D unknown
+/usr/bin/hostinfo      =3D unknown
+/bin/machine           =3D unknown
+/usr/bin/oslevel       =3D unknown
+/bin/universe          =3D unknown
+
+PATH: /home/afong/bin
+PATH: /home/afong/bin
+PATH: /usr/local/bin
+PATH: /usr/bin
+PATH: /bin
+PATH: /usr/local/games
+PATH: /usr/games
+PATH: /sbin
+PATH: /usr/sbin
+PATH: /usr/local/sbin
+PATH: /sbin
+PATH: /usr/sbin
+PATH: /usr/local/sbin
+
+
+## ----------- ##
+## Core tests. ##
+## ----------- ##
+
+configure:2352: checking build system type
+configure:2370: result: x86_64-unknown-linux-gnu
+configure:2392: checking host system type
+configure:2407: result: x86_64-unknown-linux-gnu
+configure:2429: checking target system type
+configure:2444: result: x86_64-unknown-linux-gnu
+configure:2509: checking for a BSD-compatible install
+configure:2577: result: /usr/bin/install -c
+configure:2588: checking whether build environment is sane
+configure:2631: result: yes
+configure:2656: checking for a thread-safe mkdir -p
+configure:2695: result: /bin/mkdir -p
+configure:2708: checking for gawk
+configure:2724: found /usr/bin/gawk
+configure:2735: result: gawk
+configure:2746: checking whether make sets $(MAKE)
+configure:2768: result: yes
+configure:2947: checking how to create a ustar tar archive
+configure:2960: tar --version
+tar (GNU tar) 1.26
+Copyright (C) 2011 Free Software Foundation, Inc.
+License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.ht=
ml>.
+This is free software: you are free to change and redistribute it.
+There is NO WARRANTY, to the extent permitted by law.
+
+Written by John Gilmore and Jay Fenlason.
+configure:2963: $? =3D 0
+configure:3003: tardir=3Dconftest.dir && eval tar --format=3Dustar -chf - =
"$tardir" >conftest.tar
+configure:3006: $? =3D 0
+configure:3010: tar -xf - <conftest.tar
+configure:3013: $? =3D 0
+configure:3026: result: gnutar
+configure:3225: checking for style of include used by make
+configure:3253: result: GNU
+configure:3323: checking for gcc
+configure:3339: found /usr/bin/gcc
+configure:3350: result: gcc
+configure:3582: checking for C compiler version
+configure:3590: gcc --version >&5
+gcc-4.8.real (Debian 4.8.2-1) 4.8.2
+Copyright (C) 2013 Free Software Foundation, Inc.
+This is free software; see the source for copying conditions.  There is NO
+warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+
+configure:3594: $? =3D 0
+configure:3601: gcc -v >&5
+Using built-in specs.
+COLLECT_GCC=3D/usr/bin/gcc-4.8.real
+COLLECT_LTO_WRAPPER=3D/usr/lib/gcc/x86_64-linux-gnu/4.8/lto-wrapper
+Target: x86_64-linux-gnu
+Configured with: ../src/configure -v --with-pkgversion=3D'Debian 4.8.2-1' =
--with-bugurl=3Dfile:///usr/share/doc/gcc-4.8/README.Bugs --enable-language=
s=3Dc,c++,java,go,d,fortran,objc,obj-c++ --prefix=3D/usr --program-suffix=
=3D-4.8 --enable-shared --enable-linker-build-id --libexecdir=3D/usr/lib --=
without-included-gettext --enable-threads=3Dposix --with-gxx-include-dir=3D=
/usr/include/c++/4.8 --libdir=3D/usr/lib --enable-nls --with-sysroot=3D/ --=
enable-clocale=3Dgnu --enable-libstdcxx-debug --enable-libstdcxx-time=3Dyes=
 --enable-gnu-unique-object --enable-plugin --with-system-zlib --disable-br=
owser-plugin --enable-java-awt=3Dgtk --enable-gtk-cairo --with-java-home=3D=
/usr/lib/jvm/java-1.5.0-gcj-4.8-amd64/jre --enable-java-home --with-jvm-roo=
t-dir=3D/usr/lib/jvm/java-1.5.0-gcj-4.8-amd64 --with-jvm-jar-dir=3D/usr/lib=
/jvm-exports/java-1.5.0-gcj-4.8-amd64 --with-arch-directory=3Damd64 --with-=
ecj-jar=3D/usr/share/java/eclipse-ecj.jar --enable-objc-gc --enable-multiar=
ch --with-arch-32=3Di586 --with-abi=3Dm64 --with-multilib-list=3Dm32,m64,mx=
32 --with-tune=3Dgeneric --enable-checking=3Drelease --build=3Dx86_64-linux=
-gnu --host=3Dx86_64-linux-gnu --target=3Dx86_64-linux-gnu
+Thread model: posix
+gcc version 4.8.2 (Debian 4.8.2-1)=20
+configure:3605: $? =3D 0
+configure:3612: gcc -V >&5
+gcc-4.8.real: error: unrecognized command line option '-V'
+gcc-4.8.real: fatal error: no input files
+compilation terminated.
+configure:3616: $? =3D 4
+configure:3639: checking for C compiler default output file name
+configure:3661: gcc    conftest.c  >&5
+configure:3665: $? =3D 0
+configure:3703: result: a.out
+configure:3722: checking whether the C compiler works
+configure:3732: ./a.out
+configure:3736: $? =3D 0
+configure:3755: result: yes
+configure:3762: checking whether we are cross compiling
+configure:3764: result: no
+configure:3767: checking for suffix of executables
+configure:3774: gcc -o conftest    conftest.c  >&5
+configure:3778: $? =3D 0
+configure:3804: result:=20
+configure:3810: checking for suffix of object files
+configure:3836: gcc -c   conftest.c >&5
+configure:3840: $? =3D 0
+configure:3865: result: o
+configure:3869: checking whether we are using the GNU C compiler
+configure:3898: gcc -c   conftest.c >&5
+configure:3905: $? =3D 0
+configure:3922: result: yes
+configure:3931: checking whether gcc accepts -g
+configure:3961: gcc -c -g  conftest.c >&5
+configure:3968: $? =3D 0
+configure:4069: result: yes
+configure:4086: checking for gcc option to accept ISO C89
+configure:4160: gcc  -c -g -O2  conftest.c >&5
+configure:4167: $? =3D 0
+configure:4190: result: none needed
+configure:4210: checking dependency style of gcc
+configure:4301: result: gcc3
+configure:4322: checking how to run the C preprocessor
+configure:4362: gcc -E  conftest.c
+configure:4369: $? =3D 0
+configure:4400: gcc -E  conftest.c
+conftest.c:10:28: fatal error: ac_nonexistent.h: No such file or directory
+ #include <ac_nonexistent.h>
+                            ^
+compilation terminated.
+configure:4407: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| /* end confdefs.h.  */
+| #include <ac_nonexistent.h>
+configure:4440: result: gcc -E
+configure:4469: gcc -E  conftest.c
+configure:4476: $? =3D 0
+configure:4507: gcc -E  conftest.c
+conftest.c:10:28: fatal error: ac_nonexistent.h: No such file or directory
+ #include <ac_nonexistent.h>
+                            ^
+compilation terminated.
+configure:4514: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| /* end confdefs.h.  */
+| #include <ac_nonexistent.h>
+configure:4554: checking for grep that handles long lines and -e
+configure:4614: result: /bin/grep
+configure:4619: checking for egrep
+configure:4683: result: /bin/grep -E
+configure:4688: checking for ANSI C header files
+configure:4718: gcc -c -g -O2  conftest.c >&5
+configure:4725: $? =3D 0
+configure:4824: gcc -o conftest -g -O2   conftest.c  >&5
+configure:4828: $? =3D 0
+configure:4834: ./conftest
+configure:4838: $? =3D 0
+configure:4856: result: yes
+configure:4880: checking for sys/types.h
+configure:4901: gcc -c -g -O2  conftest.c >&5
+configure:4908: $? =3D 0
+configure:4925: result: yes
+configure:4880: checking for sys/stat.h
+configure:4901: gcc -c -g -O2  conftest.c >&5
+configure:4908: $? =3D 0
+configure:4925: result: yes
+configure:4880: checking for stdlib.h
+configure:4901: gcc -c -g -O2  conftest.c >&5
+configure:4908: $? =3D 0
+configure:4925: result: yes
+configure:4880: checking for string.h
+configure:4901: gcc -c -g -O2  conftest.c >&5
+configure:4908: $? =3D 0
+configure:4925: result: yes
+configure:4880: checking for memory.h
+configure:4901: gcc -c -g -O2  conftest.c >&5
+configure:4908: $? =3D 0
+configure:4925: result: yes
+configure:4880: checking for strings.h
+configure:4901: gcc -c -g -O2  conftest.c >&5
+configure:4908: $? =3D 0
+configure:4925: result: yes
+configure:4880: checking for inttypes.h
+configure:4901: gcc -c -g -O2  conftest.c >&5
+configure:4908: $? =3D 0
+configure:4925: result: yes
+configure:4880: checking for stdint.h
+configure:4901: gcc -c -g -O2  conftest.c >&5
+configure:4908: $? =3D 0
+configure:4925: result: yes
+configure:4880: checking for unistd.h
+configure:4901: gcc -c -g -O2  conftest.c >&5
+configure:4908: $? =3D 0
+configure:4925: result: yes
+configure:4963: checking alsa/asoundlib.h usability
+configure:4980: gcc -c -g -O2  conftest.c >&5
+configure:4987: $? =3D 0
+configure:5001: result: yes
+configure:5005: checking alsa/asoundlib.h presence
+configure:5020: gcc -E  conftest.c
+configure:5027: $? =3D 0
+configure:5041: result: yes
+configure:5074: checking for alsa/asoundlib.h
+configure:5083: result: yes
+configure:5093: checking for snd_seq_open in -lasound
+configure:5128: gcc -o conftest -g -O2   conftest.c -lasound   >&5
+configure:5135: $? =3D 0
+configure:5156: result: yes
+configure:5206: checking dssi.h usability
+configure:5223: gcc -c -g -O2  conftest.c >&5
+conftest.c:54:18: fatal error: dssi.h: No such file or directory
+ #include <dssi.h>
+                  ^
+compilation terminated.
+configure:5230: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| /* end confdefs.h.  */
+| #include <stdio.h>
+| #ifdef HAVE_SYS_TYPES_H
+| # include <sys/types.h>
+| #endif
+| #ifdef HAVE_SYS_STAT_H
+| # include <sys/stat.h>
+| #endif
+| #ifdef STDC_HEADERS
+| # include <stdlib.h>
+| # include <stddef.h>
+| #else
+| # ifdef HAVE_STDLIB_H
+| #  include <stdlib.h>
+| # endif
+| #endif
+| #ifdef HAVE_STRING_H
+| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
+| #  include <memory.h>
+| # endif
+| # include <string.h>
+| #endif
+| #ifdef HAVE_STRINGS_H
+| # include <strings.h>
+| #endif
+| #ifdef HAVE_INTTYPES_H
+| # include <inttypes.h>
+| #endif
+| #ifdef HAVE_STDINT_H
+| # include <stdint.h>
+| #endif
+| #ifdef HAVE_UNISTD_H
+| # include <unistd.h>
+| #endif
+| #include <dssi.h>
+configure:5244: result: no
+configure:5248: checking dssi.h presence
+configure:5263: gcc -E  conftest.c
+conftest.c:21:18: fatal error: dssi.h: No such file or directory
+ #include <dssi.h>
+                  ^
+compilation terminated.
+configure:5270: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| /* end confdefs.h.  */
+| #include <dssi.h>
+configure:5284: result: no
+configure:5317: checking for dssi.h
+configure:5326: result: no
+configure:5646: checking whether to regenerate the headers
+configure:5663: result: no
+configure:5674: checking whether to regenerate the GJDoc parser
+configure:5691: result: yes
+configure:5959: checking whether ln -s works
+configure:5963: result: yes
+configure:5984: checking for a BSD-compatible install
+configure:6052: result: /usr/bin/install -c
+configure:6122: checking for g++
+configure:6138: found /usr/bin/g++
+configure:6149: result: g++
+configure:6176: checking for C++ compiler version
+configure:6184: g++ --version >&5
+g++-4.8.real (Debian 4.8.2-1) 4.8.2
+Copyright (C) 2013 Free Software Foundation, Inc.
+This is free software; see the source for copying conditions.  There is NO
+warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+
+configure:6188: $? =3D 0
+configure:6195: g++ -v >&5
+Using built-in specs.
+COLLECT_GCC=3D/usr/bin/g++-4.8.real
+COLLECT_LTO_WRAPPER=3D/usr/lib/gcc/x86_64-linux-gnu/4.8/lto-wrapper
+Target: x86_64-linux-gnu
+Configured with: ../src/configure -v --with-pkgversion=3D'Debian 4.8.2-1' =
--with-bugurl=3Dfile:///usr/share/doc/gcc-4.8/README.Bugs --enable-language=
s=3Dc,c++,java,go,d,fortran,objc,obj-c++ --prefix=3D/usr --program-suffix=
=3D-4.8 --enable-shared --enable-linker-build-id --libexecdir=3D/usr/lib --=
without-included-gettext --enable-threads=3Dposix --with-gxx-include-dir=3D=
/usr/include/c++/4.8 --libdir=3D/usr/lib --enable-nls --with-sysroot=3D/ --=
enable-clocale=3Dgnu --enable-libstdcxx-debug --enable-libstdcxx-time=3Dyes=
 --enable-gnu-unique-object --enable-plugin --with-system-zlib --disable-br=
owser-plugin --enable-java-awt=3Dgtk --enable-gtk-cairo --with-java-home=3D=
/usr/lib/jvm/java-1.5.0-gcj-4.8-amd64/jre --enable-java-home --with-jvm-roo=
t-dir=3D/usr/lib/jvm/java-1.5.0-gcj-4.8-amd64 --with-jvm-jar-dir=3D/usr/lib=
/jvm-exports/java-1.5.0-gcj-4.8-amd64 --with-arch-directory=3Damd64 --with-=
ecj-jar=3D/usr/share/java/eclipse-ecj.jar --enable-objc-gc --enable-multiar=
ch --with-arch-32=3Di586 --with-abi=3Dm64 --with-multilib-list=3Dm32,m64,mx=
32 --with-tune=3Dgeneric --enable-checking=3Drelease --build=3Dx86_64-linux=
-gnu --host=3Dx86_64-linux-gnu --target=3Dx86_64-linux-gnu
+Thread model: posix
+gcc version 4.8.2 (Debian 4.8.2-1)=20
+configure:6199: $? =3D 0
+configure:6206: g++ -V >&5
+g++-4.8.real: error: unrecognized command line option '-V'
+g++-4.8.real: fatal error: no input files
+compilation terminated.
+configure:6210: $? =3D 4
+configure:6213: checking whether we are using the GNU C++ compiler
+configure:6242: g++ -c   conftest.cpp >&5
+configure:6249: $? =3D 0
+configure:6266: result: yes
+configure:6275: checking whether g++ accepts -g
+configure:6305: g++ -c -g  conftest.cpp >&5
+configure:6312: $? =3D 0
+configure:6413: result: yes
+configure:6438: checking dependency style of g++
+configure:6529: result: gcc3
+configure:6617: checking for a sed that does not truncate output
+configure:6673: result: /bin/sed
+configure:6687: checking for ld used by gcc
+configure:6754: result: /usr/bin/ld
+configure:6763: checking if the linker (/usr/bin/ld) is GNU ld
+configure:6778: result: yes
+configure:6783: checking for /usr/bin/ld option to reload object files
+configure:6790: result: -r
+configure:6808: checking for BSD-compatible nm
+configure:6857: result: /usr/bin/nm -B
+configure:6861: checking how to recognize dependent libraries
+configure:7047: result: pass_all
+configure:7135: gcc -c -g -O2  conftest.c >&5
+configure:7138: $? =3D 0
+configure:7306: checking dlfcn.h usability
+configure:7323: gcc -c -g -O2  conftest.c >&5
+configure:7330: $? =3D 0
+configure:7344: result: yes
+configure:7348: checking dlfcn.h presence
+configure:7363: gcc -E  conftest.c
+configure:7370: $? =3D 0
+configure:7384: result: yes
+configure:7417: checking for dlfcn.h
+configure:7426: result: yes
+configure:7451: checking how to run the C++ preprocessor
+configure:7487: g++ -E  conftest.cpp
+configure:7494: $? =3D 0
+configure:7525: g++ -E  conftest.cpp
+conftest.cpp:22:28: fatal error: ac_nonexistent.h: No such file or directo=
ry
+ #include <ac_nonexistent.h>
+                            ^
+compilation terminated.
+configure:7532: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| /* end confdefs.h.  */
+| #include <ac_nonexistent.h>
+configure:7565: result: g++ -E
+configure:7594: g++ -E  conftest.cpp
+configure:7601: $? =3D 0
+configure:7632: g++ -E  conftest.cpp
+conftest.cpp:22:28: fatal error: ac_nonexistent.h: No such file or directo=
ry
+ #include <ac_nonexistent.h>
+                            ^
+compilation terminated.
+configure:7639: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| /* end confdefs.h.  */
+| #include <ac_nonexistent.h>
+configure:7734: checking for g77
+configure:7764: result: no
+configure:7734: checking for xlf
+configure:7764: result: no
+configure:7734: checking for f77
+configure:7764: result: no
+configure:7734: checking for frt
+configure:7764: result: no
+configure:7734: checking for pgf77
+configure:7764: result: no
+configure:7734: checking for cf77
+configure:7764: result: no
+configure:7734: checking for fort77
+configure:7764: result: no
+configure:7734: checking for fl32
+configure:7764: result: no
+configure:7734: checking for af77
+configure:7764: result: no
+configure:7734: checking for xlf90
+configure:7764: result: no
+configure:7734: checking for f90
+configure:7764: result: no
+configure:7734: checking for pgf90
+configure:7764: result: no
+configure:7734: checking for pghpf
+configure:7764: result: no
+configure:7734: checking for epcf90
+configure:7764: result: no
+configure:7734: checking for gfortran
+configure:7750: found /usr/bin/gfortran
+configure:7761: result: gfortran
+configure:7787: checking for Fortran 77 compiler version
+configure:7795: gfortran --version >&5
+GNU Fortran (Debian 4.8.2-1) 4.8.2
+Copyright (C) 2013 Free Software Foundation, Inc.
+
+GNU Fortran comes with NO WARRANTY, to the extent permitted by law.
+You may redistribute copies of GNU Fortran
+under the terms of the GNU General Public License.
+For more information about these matters, see the file named COPYING
+
+configure:7799: $? =3D 0
+configure:7806: gfortran -v >&5
+Using built-in specs.
+COLLECT_GCC=3Dgfortran
+COLLECT_LTO_WRAPPER=3D/usr/lib/gcc/x86_64-linux-gnu/4.8/lto-wrapper
+Target: x86_64-linux-gnu
+Configured with: ../src/configure -v --with-pkgversion=3D'Debian 4.8.2-1' =
--with-bugurl=3Dfile:///usr/share/doc/gcc-4.8/README.Bugs --enable-language=
s=3Dc,c++,java,go,d,fortran,objc,obj-c++ --prefix=3D/usr --program-suffix=
=3D-4.8 --enable-shared --enable-linker-build-id --libexecdir=3D/usr/lib --=
without-included-gettext --enable-threads=3Dposix --with-gxx-include-dir=3D=
/usr/include/c++/4.8 --libdir=3D/usr/lib --enable-nls --with-sysroot=3D/ --=
enable-clocale=3Dgnu --enable-libstdcxx-debug --enable-libstdcxx-time=3Dyes=
 --enable-gnu-unique-object --enable-plugin --with-system-zlib --disable-br=
owser-plugin --enable-java-awt=3Dgtk --enable-gtk-cairo --with-java-home=3D=
/usr/lib/jvm/java-1.5.0-gcj-4.8-amd64/jre --enable-java-home --with-jvm-roo=
t-dir=3D/usr/lib/jvm/java-1.5.0-gcj-4.8-amd64 --with-jvm-jar-dir=3D/usr/lib=
/jvm-exports/java-1.5.0-gcj-4.8-amd64 --with-arch-directory=3Damd64 --with-=
ecj-jar=3D/usr/share/java/eclipse-ecj.jar --enable-objc-gc --enable-multiar=
ch --with-arch-32=3Di586 --with-abi=3Dm64 --with-multilib-list=3Dm32,m64,mx=
32 --with-tune=3Dgeneric --enable-checking=3Drelease --build=3Dx86_64-linux=
-gnu --host=3Dx86_64-linux-gnu --target=3Dx86_64-linux-gnu
+Thread model: posix
+gcc version 4.8.2 (Debian 4.8.2-1)=20
+configure:7810: $? =3D 0
+configure:7817: gfortran -V >&5
+gfortran: error: unrecognized command line option '-V'
+gfortran: fatal error: no input files
+compilation terminated.
+configure:7821: $? =3D 4
+configure:7829: checking whether we are using the GNU Fortran 77 compiler
+configure:7848: gfortran -c  conftest.F >&5
+configure:7855: $? =3D 0
+configure:7872: result: yes
+configure:7878: checking whether gfortran accepts -g
+configure:7895: gfortran -c -g conftest.f >&5
+configure:7902: $? =3D 0
+configure:7918: result: yes
+configure:7951: checking the maximum length of command line arguments
+configure:8063: result: 1572864
+configure:8075: checking command to parse /usr/bin/nm -B output from gcc o=
bject
+configure:8180: gcc -c -g -O2  conftest.c >&5
+configure:8183: $? =3D 0
+configure:8187: /usr/bin/nm -B conftest.o \| sed -n -e 's/^.*[ 	]\([ABCDGI=
RSTW][ABCDGIRSTW]*\)[ 	][ 	]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' \> con=
ftest.nm
+configure:8190: $? =3D 0
+configure:8242: gcc -o conftest -g -O2   conftest.c conftstm.o >&5
+configure:8245: $? =3D 0
+configure:8283: result: ok
+configure:8287: checking for objdir
+configure:8302: result: .libs
+configure:8394: checking for ar
+configure:8410: found /usr/bin/ar
+configure:8421: result: ar
+configure:8486: checking for ranlib
+configure:8502: found /usr/bin/ranlib
+configure:8513: result: ranlib
+configure:8578: checking for strip
+configure:8594: found /usr/bin/strip
+configure:8605: result: strip
+configure:9146: checking for correct ltmain.sh version
+configure:9196: result: yes
+configure:9256: checking if gcc supports -fno-rtti -fno-exceptions
+configure:9274: gcc -c -g -O2  -fno-rtti -fno-exceptions conftest.c >&5
+cc1: warning: command line option '-fno-rtti' is valid for C++/ObjC++ but =
not for C [enabled by default]
+configure:9278: $? =3D 0
+configure:9291: result: no
+configure:9306: checking for gcc option to produce PIC
+configure:9538: result: -fPIC
+configure:9546: checking if gcc PIC flag -fPIC works
+configure:9564: gcc -c -g -O2  -fPIC -DPIC conftest.c >&5
+configure:9568: $? =3D 0
+configure:9581: result: yes
+configure:9609: checking if gcc static flag -static works
+configure:9637: result: yes
+configure:9647: checking if gcc supports -c -o file.o
+configure:9668: gcc -c -g -O2  -o out/conftest2.o conftest.c >&5
+configure:9672: $? =3D 0
+configure:9694: result: yes
+configure:9720: checking whether the gcc linker (/usr/bin/ld -m elf_x86_64=
) supports shared libraries
+configure:10708: result: yes
+configure:10729: checking whether -lc should be explicitly linked in
+configure:10734: gcc -c -g -O2  conftest.c >&5
+configure:10737: $? =3D 0
+configure:10752: gcc -shared conftest.o  -v -Wl,-soname -Wl,conftest -o co=
nftest 2\>\&1 \| grep  -lc  \>/dev/null 2\>\&1
+configure:10755: $? =3D 0
+configure:10767: result: no
+configure:10775: checking dynamic linker characteristics
+configure:11390: result: GNU/Linux ld.so
+configure:11414: checking how to hardcode library paths into programs
+configure:11439: result: immediate
+configure:11453: checking whether stripping libraries is possible
+configure:11458: result: yes
+configure:12288: checking if libtool supports shared libraries
+configure:12290: result: yes
+configure:12293: checking whether to build shared libraries
+configure:12314: result: yes
+configure:12317: checking whether to build static libraries
+configure:12321: result: no
+configure:12415: creating libtool
+configure:13008: checking for ld used by g++
+configure:13075: result: /usr/bin/ld -m elf_x86_64
+configure:13084: checking if the linker (/usr/bin/ld -m elf_x86_64) is GNU=
 ld
+configure:13099: result: yes
+configure:13150: checking whether the g++ linker (/usr/bin/ld -m elf_x86_6=
4) supports shared libraries
+configure:14104: result: yes
+configure:14121: g++ -c -g -O2  conftest.cpp >&5
+configure:14124: $? =3D 0
+configure:14280: checking for g++ option to produce PIC
+configure:14564: result: -fPIC
+configure:14572: checking if g++ PIC flag -fPIC works
+configure:14590: g++ -c -g -O2  -fPIC -DPIC conftest.cpp >&5
+configure:14594: $? =3D 0
+configure:14607: result: yes
+configure:14635: checking if g++ static flag -static works
+configure:14663: result: yes
+configure:14673: checking if g++ supports -c -o file.o
+configure:14694: g++ -c -g -O2  -o out/conftest2.o conftest.cpp >&5
+configure:14698: $? =3D 0
+configure:14720: result: yes
+configure:14746: checking whether the g++ linker (/usr/bin/ld -m elf_x86_6=
4) supports shared libraries
+configure:14772: result: yes
+configure:14839: checking dynamic linker characteristics
+configure:15402: result: GNU/Linux ld.so
+configure:15426: checking how to hardcode library paths into programs
+configure:15451: result: immediate
+configure:15990: checking if libtool supports shared libraries
+configure:15992: result: yes
+configure:15995: checking whether to build shared libraries
+configure:16015: result: yes
+configure:16018: checking whether to build static libraries
+configure:16022: result: no
+configure:16032: checking for gfortran option to produce PIC
+configure:16264: result: -fPIC
+configure:16272: checking if gfortran PIC flag -fPIC works
+configure:16290: gfortran -c -g -O2 -fPIC conftest.f >&5
+configure:16294: $? =3D 0
+configure:16307: result: yes
+configure:16335: checking if gfortran static flag -static works
+configure:16363: result: yes
+configure:16373: checking if gfortran supports -c -o file.o
+configure:16394: gfortran -c -g -O2 -o out/conftest2.o conftest.f >&5
+configure:16398: $? =3D 0
+configure:16420: result: yes
+configure:16446: checking whether the gfortran linker (/usr/bin/ld -m elf_=
x86_64) supports shared libraries
+configure:17414: result: yes
+configure:17481: checking dynamic linker characteristics
+configure:18044: result: GNU/Linux ld.so
+configure:18068: checking how to hardcode library paths into programs
+configure:18093: result: immediate
+configure:21718: checking for gawk
+configure:21745: result: gawk
+configure:21804: checking for gcc
+configure:21831: result: gcc
+configure:22063: checking for C compiler version
+configure:22071: gcc --version >&5
+gcc-4.8.real (Debian 4.8.2-1) 4.8.2
+Copyright (C) 2013 Free Software Foundation, Inc.
+This is free software; see the source for copying conditions.  There is NO
+warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+
+configure:22075: $? =3D 0
+configure:22082: gcc -v >&5
+Using built-in specs.
+COLLECT_GCC=3D/usr/bin/gcc-4.8.real
+COLLECT_LTO_WRAPPER=3D/usr/lib/gcc/x86_64-linux-gnu/4.8/lto-wrapper
+Target: x86_64-linux-gnu
+Configured with: ../src/configure -v --with-pkgversion=3D'Debian 4.8.2-1' =
--with-bugurl=3Dfile:///usr/share/doc/gcc-4.8/README.Bugs --enable-language=
s=3Dc,c++,java,go,d,fortran,objc,obj-c++ --prefix=3D/usr --program-suffix=
=3D-4.8 --enable-shared --enable-linker-build-id --libexecdir=3D/usr/lib --=
without-included-gettext --enable-threads=3Dposix --with-gxx-include-dir=3D=
/usr/include/c++/4.8 --libdir=3D/usr/lib --enable-nls --with-sysroot=3D/ --=
enable-clocale=3Dgnu --enable-libstdcxx-debug --enable-libstdcxx-time=3Dyes=
 --enable-gnu-unique-object --enable-plugin --with-system-zlib --disable-br=
owser-plugin --enable-java-awt=3Dgtk --enable-gtk-cairo --with-java-home=3D=
/usr/lib/jvm/java-1.5.0-gcj-4.8-amd64/jre --enable-java-home --with-jvm-roo=
t-dir=3D/usr/lib/jvm/java-1.5.0-gcj-4.8-amd64 --with-jvm-jar-dir=3D/usr/lib=
/jvm-exports/java-1.5.0-gcj-4.8-amd64 --with-arch-directory=3Damd64 --with-=
ecj-jar=3D/usr/share/java/eclipse-ecj.jar --enable-objc-gc --enable-multiar=
ch --with-arch-32=3Di586 --with-abi=3Dm64 --with-multilib-list=3Dm32,m64,mx=
32 --with-tune=3Dgeneric --enable-checking=3Drelease --build=3Dx86_64-linux=
-gnu --host=3Dx86_64-linux-gnu --target=3Dx86_64-linux-gnu
+Thread model: posix
+gcc version 4.8.2 (Debian 4.8.2-1)=20
+configure:22086: $? =3D 0
+configure:22093: gcc -V >&5
+gcc-4.8.real: error: unrecognized command line option '-V'
+gcc-4.8.real: fatal error: no input files
+compilation terminated.
+configure:22097: $? =3D 4
+configure:22100: checking whether we are using the GNU C compiler
+configure:22153: result: yes
+configure:22162: checking whether gcc accepts -g
+configure:22300: result: yes
+configure:22317: checking for gcc option to accept ISO C89
+configure:22421: result: none needed
+configure:22441: checking dependency style of gcc
+configure:22532: result: gcc3
+configure:22548: checking whether gcc and cc understand -c and -o together
+configure:22583: gcc -c conftest.c -o conftest2.o >&5
+configure:22587: $? =3D 0
+configure:22593: gcc -c conftest.c -o conftest2.o >&5
+configure:22597: $? =3D 0
+configure:22608: cc -c conftest.c >&5
+configure:22612: $? =3D 0
+configure:22620: cc -c conftest.c -o conftest2.o >&5
+configure:22624: $? =3D 0
+configure:22630: cc -c conftest.c -o conftest2.o >&5
+configure:22634: $? =3D 0
+configure:22652: result: yes
+configure:22684: checking how to run the C preprocessor
+configure:22802: result: gcc -E
+configure:22831: gcc -E  conftest.c
+configure:22838: $? =3D 0
+configure:22869: gcc -E  conftest.c
+conftest.c:22:28: fatal error: ac_nonexistent.h: No such file or directory
+ #include <ac_nonexistent.h>
+                            ^
+compilation terminated.
+configure:22876: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| /* end confdefs.h.  */
+| #include <ac_nonexistent.h>
+configure:22980: checking __attribute__((,,))
+configure:23007: gcc -c -g -O2  conftest.c >&5
+configure:23014: $? =3D 0
+configure:23033: result: yes
+configure:23057: checking __attribute__((unused))
+configure:23084: gcc -c -g -O2  conftest.c >&5
+configure:23091: $? =3D 0
+configure:23110: result: yes
+configure:23130: checking for ANSI C header files
+configure:23298: result: yes
+configure:23309: checking size of void *
+configure:23339: gcc -c -g -O2  conftest.c >&5
+conftest.c: In function 'main':
+conftest.c:32:20: error: duplicate case value
+ switch (0) case 0: case (sizeof (void *) =3D=3D 4):;
+                    ^
+conftest.c:32:12: error: previously used here
+ switch (0) case 0: case (sizeof (void *) =3D=3D 4):;
+            ^
+configure:23346: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| /* end confdefs.h.  */
+| #include "confdefs.h"
+| #include <sys/types.h>
+|=20
+|=20
+| int
+| main ()
+| {
+| switch (0) case 0: case (sizeof (void *) =3D=3D 4):;
+|   ;
+|   return 0;
+| }
+configure:23339: gcc -c -g -O2  conftest.c >&5
+configure:23346: $? =3D 0
+configure:23370: result: 8
+configure:23379: checking whether byte ordering is bigendian
+configure:23411: gcc -c -g -O2  conftest.c >&5
+configure:23418: $? =3D 0
+configure:23449: gcc -c -g -O2  conftest.c >&5
+conftest.c: In function 'main':
+conftest.c:33:2: error: unknown type name 'not'
+  not big endian
+  ^
+conftest.c:33:10: error: expected '=3D', ',', ';', 'asm' or '__attribute__=
' before 'endian'
+  not big endian
+          ^
+configure:23456: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| /* end confdefs.h.  */
+| #include <sys/types.h>
+| #include <sys/param.h>
+| int
+| main ()
+| {
+|=20
+| #if BYTE_ORDER !=3D BIG_ENDIAN
+|  not big endian
+| #endif
+|   ;
+|   return 0;
+| }
+configure:23537: result: no
+configure:23639: checking for unistd.h
+configure:23646: result: yes
+configure:23639: checking for sys/types.h
+configure:23646: result: yes
+configure:23650: checking sys/config.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+conftest.c:62:24: fatal error: sys/config.h: No such file or directory
+ #include <sys/config.h>
+                        ^
+compilation terminated.
+configure:23674: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| /* end confdefs.h.  */
+| #include <stdio.h>
+| #ifdef HAVE_SYS_TYPES_H
+| # include <sys/types.h>
+| #endif
+| #ifdef HAVE_SYS_STAT_H
+| # include <sys/stat.h>
+| #endif
+| #ifdef STDC_HEADERS
+| # include <stdlib.h>
+| # include <stddef.h>
+| #else
+| # ifdef HAVE_STDLIB_H
+| #  include <stdlib.h>
+| # endif
+| #endif
+| #ifdef HAVE_STRING_H
+| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
+| #  include <memory.h>
+| # endif
+| # include <string.h>
+| #endif
+| #ifdef HAVE_STRINGS_H
+| # include <strings.h>
+| #endif
+| #ifdef HAVE_INTTYPES_H
+| # include <inttypes.h>
+| #endif
+| #ifdef HAVE_STDINT_H
+| # include <stdint.h>
+| #endif
+| #ifdef HAVE_UNISTD_H
+| # include <unistd.h>
+| #endif
+| #include <sys/config.h>
+configure:23688: result: no
+configure:23692: checking sys/config.h presence
+configure:23707: gcc -E  conftest.c
+conftest.c:29:24: fatal error: sys/config.h: No such file or directory
+ #include <sys/config.h>
+                        ^
+compilation terminated.
+configure:23714: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| /* end confdefs.h.  */
+| #include <sys/config.h>
+configure:23728: result: no
+configure:23761: checking for sys/config.h
+configure:23770: result: no
+configure:23650: checking sys/ioctl.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+configure:23674: $? =3D 0
+configure:23688: result: yes
+configure:23692: checking sys/ioctl.h presence
+configure:23707: gcc -E  conftest.c
+configure:23714: $? =3D 0
+configure:23728: result: yes
+configure:23761: checking for sys/ioctl.h
+configure:23770: result: yes
+configure:23650: checking asm/ioctls.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+configure:23674: $? =3D 0
+configure:23688: result: yes
+configure:23692: checking asm/ioctls.h presence
+configure:23707: gcc -E  conftest.c
+configure:23714: $? =3D 0
+configure:23728: result: yes
+configure:23761: checking for asm/ioctls.h
+configure:23770: result: yes
+configure:23639: checking for inttypes.h
+configure:23646: result: yes
+configure:23639: checking for stdint.h
+configure:23646: result: yes
+configure:23650: checking utime.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+configure:23674: $? =3D 0
+configure:23688: result: yes
+configure:23692: checking utime.h presence
+configure:23707: gcc -E  conftest.c
+configure:23714: $? =3D 0
+configure:23728: result: yes
+configure:23761: checking for utime.h
+configure:23770: result: yes
+configure:23650: checking sys/utime.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+conftest.c:67:23: fatal error: sys/utime.h: No such file or directory
+ #include <sys/utime.h>
+                       ^
+compilation terminated.
+configure:23674: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| /* end confdefs.h.  */
+| #include <stdio.h>
+| #ifdef HAVE_SYS_TYPES_H
+| # include <sys/types.h>
+| #endif
+| #ifdef HAVE_SYS_STAT_H
+| # include <sys/stat.h>
+| #endif
+| #ifdef STDC_HEADERS
+| # include <stdlib.h>
+| # include <stddef.h>
+| #else
+| # ifdef HAVE_STDLIB_H
+| #  include <stdlib.h>
+| # endif
+| #endif
+| #ifdef HAVE_STRING_H
+| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
+| #  include <memory.h>
+| # endif
+| # include <string.h>
+| #endif
+| #ifdef HAVE_STRINGS_H
+| # include <strings.h>
+| #endif
+| #ifdef HAVE_INTTYPES_H
+| # include <inttypes.h>
+| #endif
+| #ifdef HAVE_STDINT_H
+| # include <stdint.h>
+| #endif
+| #ifdef HAVE_UNISTD_H
+| # include <unistd.h>
+| #endif
+| #include <sys/utime.h>
+configure:23688: result: no
+configure:23692: checking sys/utime.h presence
+configure:23707: gcc -E  conftest.c
+conftest.c:34:23: fatal error: sys/utime.h: No such file or directory
+ #include <sys/utime.h>
+                       ^
+compilation terminated.
+configure:23714: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| /* end confdefs.h.  */
+| #include <sys/utime.h>
+configure:23728: result: no
+configure:23761: checking for sys/utime.h
+configure:23770: result: no
+configure:23650: checking sys/filio.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+conftest.c:67:23: fatal error: sys/filio.h: No such file or directory
+ #include <sys/filio.h>
+                       ^
+compilation terminated.
+configure:23674: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| /* end confdefs.h.  */
+| #include <stdio.h>
+| #ifdef HAVE_SYS_TYPES_H
+| # include <sys/types.h>
+| #endif
+| #ifdef HAVE_SYS_STAT_H
+| # include <sys/stat.h>
+| #endif
+| #ifdef STDC_HEADERS
+| # include <stdlib.h>
+| # include <stddef.h>
+| #else
+| # ifdef HAVE_STDLIB_H
+| #  include <stdlib.h>
+| # endif
+| #endif
+| #ifdef HAVE_STRING_H
+| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
+| #  include <memory.h>
+| # endif
+| # include <string.h>
+| #endif
+| #ifdef HAVE_STRINGS_H
+| # include <strings.h>
+| #endif
+| #ifdef HAVE_INTTYPES_H
+| # include <inttypes.h>
+| #endif
+| #ifdef HAVE_STDINT_H
+| # include <stdint.h>
+| #endif
+| #ifdef HAVE_UNISTD_H
+| # include <unistd.h>
+| #endif
+| #include <sys/filio.h>
+configure:23688: result: no
+configure:23692: checking sys/filio.h presence
+configure:23707: gcc -E  conftest.c
+conftest.c:34:23: fatal error: sys/filio.h: No such file or directory
+ #include <sys/filio.h>
+                       ^
+compilation terminated.
+configure:23714: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| /* end confdefs.h.  */
+| #include <sys/filio.h>
+configure:23728: result: no
+configure:23761: checking for sys/filio.h
+configure:23770: result: no
+configure:23650: checking sys/time.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+configure:23674: $? =3D 0
+configure:23688: result: yes
+configure:23692: checking sys/time.h presence
+configure:23707: gcc -E  conftest.c
+configure:23714: $? =3D 0
+configure:23728: result: yes
+configure:23761: checking for sys/time.h
+configure:23770: result: yes
+configure:23650: checking sys/select.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+configure:23674: $? =3D 0
+configure:23688: result: yes
+configure:23692: checking sys/select.h presence
+configure:23707: gcc -E  conftest.c
+configure:23714: $? =3D 0
+configure:23728: result: yes
+configure:23761: checking for sys/select.h
+configure:23770: result: yes
+configure:23650: checking crt_externs.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+conftest.c:69:25: fatal error: crt_externs.h: No such file or directory
+ #include <crt_externs.h>
+                         ^
+compilation terminated.
+configure:23674: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| /* end confdefs.h.  */
+| #include <stdio.h>
+| #ifdef HAVE_SYS_TYPES_H
+| # include <sys/types.h>
+| #endif
+| #ifdef HAVE_SYS_STAT_H
+| # include <sys/stat.h>
+| #endif
+| #ifdef STDC_HEADERS
+| # include <stdlib.h>
+| # include <stddef.h>
+| #else
+| # ifdef HAVE_STDLIB_H
+| #  include <stdlib.h>
+| # endif
+| #endif
+| #ifdef HAVE_STRING_H
+| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
+| #  include <memory.h>
+| # endif
+| # include <string.h>
+| #endif
+| #ifdef HAVE_STRINGS_H
+| # include <strings.h>
+| #endif
+| #ifdef HAVE_INTTYPES_H
+| # include <inttypes.h>
+| #endif
+| #ifdef HAVE_STDINT_H
+| # include <stdint.h>
+| #endif
+| #ifdef HAVE_UNISTD_H
+| # include <unistd.h>
+| #endif
+| #include <crt_externs.h>
+configure:23688: result: no
+configure:23692: checking crt_externs.h presence
+configure:23707: gcc -E  conftest.c
+conftest.c:36:25: fatal error: crt_externs.h: No such file or directory
+ #include <crt_externs.h>
+                         ^
+compilation terminated.
+configure:23714: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| /* end confdefs.h.  */
+| #include <crt_externs.h>
+configure:23728: result: no
+configure:23761: checking for crt_externs.h
+configure:23770: result: no
+configure:23650: checking fcntl.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+configure:23674: $? =3D 0
+configure:23688: result: yes
+configure:23692: checking fcntl.h presence
+configure:23707: gcc -E  conftest.c
+configure:23714: $? =3D 0
+configure:23728: result: yes
+configure:23761: checking for fcntl.h
+configure:23770: result: yes
+configure:23650: checking sys/mman.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+configure:23674: $? =3D 0
+configure:23688: result: yes
+configure:23692: checking sys/mman.h presence
+configure:23707: gcc -E  conftest.c
+configure:23714: $? =3D 0
+configure:23728: result: yes
+configure:23761: checking for sys/mman.h
+configure:23770: result: yes
+configure:23650: checking magic.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+conftest.c:71:19: fatal error: magic.h: No such file or directory
+ #include <magic.h>
+                   ^
+compilation terminated.
+configure:23674: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| #define HAVE_FCNTL_H 1
+| #define HAVE_SYS_MMAN_H 1
+| /* end confdefs.h.  */
+| #include <stdio.h>
+| #ifdef HAVE_SYS_TYPES_H
+| # include <sys/types.h>
+| #endif
+| #ifdef HAVE_SYS_STAT_H
+| # include <sys/stat.h>
+| #endif
+| #ifdef STDC_HEADERS
+| # include <stdlib.h>
+| # include <stddef.h>
+| #else
+| # ifdef HAVE_STDLIB_H
+| #  include <stdlib.h>
+| # endif
+| #endif
+| #ifdef HAVE_STRING_H
+| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
+| #  include <memory.h>
+| # endif
+| # include <string.h>
+| #endif
+| #ifdef HAVE_STRINGS_H
+| # include <strings.h>
+| #endif
+| #ifdef HAVE_INTTYPES_H
+| # include <inttypes.h>
+| #endif
+| #ifdef HAVE_STDINT_H
+| # include <stdint.h>
+| #endif
+| #ifdef HAVE_UNISTD_H
+| # include <unistd.h>
+| #endif
+| #include <magic.h>
+configure:23688: result: no
+configure:23692: checking magic.h presence
+configure:23707: gcc -E  conftest.c
+conftest.c:38:19: fatal error: magic.h: No such file or directory
+ #include <magic.h>
+                   ^
+compilation terminated.
+configure:23714: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| #define HAVE_FCNTL_H 1
+| #define HAVE_SYS_MMAN_H 1
+| /* end confdefs.h.  */
+| #include <magic.h>
+configure:23728: result: no
+configure:23761: checking for magic.h
+configure:23770: result: no
+configure:23650: checking sys/event.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+conftest.c:71:23: fatal error: sys/event.h: No such file or directory
+ #include <sys/event.h>
+                       ^
+compilation terminated.
+configure:23674: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| #define HAVE_FCNTL_H 1
+| #define HAVE_SYS_MMAN_H 1
+| /* end confdefs.h.  */
+| #include <stdio.h>
+| #ifdef HAVE_SYS_TYPES_H
+| # include <sys/types.h>
+| #endif
+| #ifdef HAVE_SYS_STAT_H
+| # include <sys/stat.h>
+| #endif
+| #ifdef STDC_HEADERS
+| # include <stdlib.h>
+| # include <stddef.h>
+| #else
+| # ifdef HAVE_STDLIB_H
+| #  include <stdlib.h>
+| # endif
+| #endif
+| #ifdef HAVE_STRING_H
+| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
+| #  include <memory.h>
+| # endif
+| # include <string.h>
+| #endif
+| #ifdef HAVE_STRINGS_H
+| # include <strings.h>
+| #endif
+| #ifdef HAVE_INTTYPES_H
+| # include <inttypes.h>
+| #endif
+| #ifdef HAVE_STDINT_H
+| # include <stdint.h>
+| #endif
+| #ifdef HAVE_UNISTD_H
+| # include <unistd.h>
+| #endif
+| #include <sys/event.h>
+configure:23688: result: no
+configure:23692: checking sys/event.h presence
+configure:23707: gcc -E  conftest.c
+conftest.c:38:23: fatal error: sys/event.h: No such file or directory
+ #include <sys/event.h>
+                       ^
+compilation terminated.
+configure:23714: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| #define HAVE_FCNTL_H 1
+| #define HAVE_SYS_MMAN_H 1
+| /* end confdefs.h.  */
+| #include <sys/event.h>
+configure:23728: result: no
+configure:23761: checking for sys/event.h
+configure:23770: result: no
+configure:23650: checking sys/epoll.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+configure:23674: $? =3D 0
+configure:23688: result: yes
+configure:23692: checking sys/epoll.h presence
+configure:23707: gcc -E  conftest.c
+configure:23714: $? =3D 0
+configure:23728: result: yes
+configure:23761: checking for sys/epoll.h
+configure:23770: result: yes
+configure:23650: checking ifaddrs.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+configure:23674: $? =3D 0
+configure:23688: result: yes
+configure:23692: checking ifaddrs.h presence
+configure:23707: gcc -E  conftest.c
+configure:23714: $? =3D 0
+configure:23728: result: yes
+configure:23761: checking for ifaddrs.h
+configure:23770: result: yes
+configure:23650: checking netinet/in_systm.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+configure:23674: $? =3D 0
+configure:23688: result: yes
+configure:23692: checking netinet/in_systm.h presence
+configure:23707: gcc -E  conftest.c
+configure:23714: $? =3D 0
+configure:23728: result: yes
+configure:23761: checking for netinet/in_systm.h
+configure:23770: result: yes
+configure:23650: checking netinet/ip.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+configure:23674: $? =3D 0
+configure:23688: result: yes
+configure:23692: checking netinet/ip.h presence
+configure:23707: gcc -E  conftest.c
+configure:23714: $? =3D 0
+configure:23728: result: yes
+configure:23761: checking for netinet/ip.h
+configure:23770: result: yes
+configure:23650: checking net/if.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+configure:23674: $? =3D 0
+configure:23688: result: yes
+configure:23692: checking net/if.h presence
+configure:23707: gcc -E  conftest.c
+configure:23714: $? =3D 0
+configure:23728: result: yes
+configure:23761: checking for net/if.h
+configure:23770: result: yes
+configure:23650: checking sys/loadavg.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+conftest.c:76:25: fatal error: sys/loadavg.h: No such file or directory
+ #include <sys/loadavg.h>
+                         ^
+compilation terminated.
+configure:23674: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| #define HAVE_FCNTL_H 1
+| #define HAVE_SYS_MMAN_H 1
+| #define HAVE_SYS_EPOLL_H 1
+| #define HAVE_IFADDRS_H 1
+| #define HAVE_NETINET_IN_SYSTM_H 1
+| #define HAVE_NETINET_IP_H 1
+| #define HAVE_NET_IF_H 1
+| /* end confdefs.h.  */
+| #include <stdio.h>
+| #ifdef HAVE_SYS_TYPES_H
+| # include <sys/types.h>
+| #endif
+| #ifdef HAVE_SYS_STAT_H
+| # include <sys/stat.h>
+| #endif
+| #ifdef STDC_HEADERS
+| # include <stdlib.h>
+| # include <stddef.h>
+| #else
+| # ifdef HAVE_STDLIB_H
+| #  include <stdlib.h>
+| # endif
+| #endif
+| #ifdef HAVE_STRING_H
+| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
+| #  include <memory.h>
+| # endif
+| # include <string.h>
+| #endif
+| #ifdef HAVE_STRINGS_H
+| # include <strings.h>
+| #endif
+| #ifdef HAVE_INTTYPES_H
+| # include <inttypes.h>
+| #endif
+| #ifdef HAVE_STDINT_H
+| # include <stdint.h>
+| #endif
+| #ifdef HAVE_UNISTD_H
+| # include <unistd.h>
+| #endif
+| #include <sys/loadavg.h>
+configure:23688: result: no
+configure:23692: checking sys/loadavg.h presence
+configure:23707: gcc -E  conftest.c
+conftest.c:43:25: fatal error: sys/loadavg.h: No such file or directory
+ #include <sys/loadavg.h>
+                         ^
+compilation terminated.
+configure:23714: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| #define HAVE_FCNTL_H 1
+| #define HAVE_SYS_MMAN_H 1
+| #define HAVE_SYS_EPOLL_H 1
+| #define HAVE_IFADDRS_H 1
+| #define HAVE_NETINET_IN_SYSTM_H 1
+| #define HAVE_NETINET_IP_H 1
+| #define HAVE_NET_IF_H 1
+| /* end confdefs.h.  */
+| #include <sys/loadavg.h>
+configure:23728: result: no
+configure:23761: checking for sys/loadavg.h
+configure:23770: result: no
+configure:23650: checking sys/sockio.h usability
+configure:23667: gcc -c -g -O2  conftest.c >&5
+conftest.c:76:24: fatal error: sys/sockio.h: No such file or directory
+ #include <sys/sockio.h>
+                        ^
+compilation terminated.
+configure:23674: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| #define HAVE_FCNTL_H 1
+| #define HAVE_SYS_MMAN_H 1
+| #define HAVE_SYS_EPOLL_H 1
+| #define HAVE_IFADDRS_H 1
+| #define HAVE_NETINET_IN_SYSTM_H 1
+| #define HAVE_NETINET_IP_H 1
+| #define HAVE_NET_IF_H 1
+| /* end confdefs.h.  */
+| #include <stdio.h>
+| #ifdef HAVE_SYS_TYPES_H
+| # include <sys/types.h>
+| #endif
+| #ifdef HAVE_SYS_STAT_H
+| # include <sys/stat.h>
+| #endif
+| #ifdef STDC_HEADERS
+| # include <stdlib.h>
+| # include <stddef.h>
+| #else
+| # ifdef HAVE_STDLIB_H
+| #  include <stdlib.h>
+| # endif
+| #endif
+| #ifdef HAVE_STRING_H
+| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
+| #  include <memory.h>
+| # endif
+| # include <string.h>
+| #endif
+| #ifdef HAVE_STRINGS_H
+| # include <strings.h>
+| #endif
+| #ifdef HAVE_INTTYPES_H
+| # include <inttypes.h>
+| #endif
+| #ifdef HAVE_STDINT_H
+| # include <stdint.h>
+| #endif
+| #ifdef HAVE_UNISTD_H
+| # include <unistd.h>
+| #endif
+| #include <sys/sockio.h>
+configure:23688: result: no
+configure:23692: checking sys/sockio.h presence
+configure:23707: gcc -E  conftest.c
+conftest.c:43:24: fatal error: sys/sockio.h: No such file or directory
+ #include <sys/sockio.h>
+                        ^
+compilation terminated.
+configure:23714: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| #define HAVE_FCNTL_H 1
+| #define HAVE_SYS_MMAN_H 1
+| #define HAVE_SYS_EPOLL_H 1
+| #define HAVE_IFADDRS_H 1
+| #define HAVE_NETINET_IN_SYSTM_H 1
+| #define HAVE_NETINET_IP_H 1
+| #define HAVE_NET_IF_H 1
+| /* end confdefs.h.  */
+| #include <sys/sockio.h>
+configure:23728: result: no
+configure:23761: checking for sys/sockio.h
+configure:23770: result: no
+conftest.c:46:24: fatal error: sys/config.h: No such file or directory
+ #include <sys/config.h>
+                        ^
+compilation terminated.
+configure:23863: checking for library containing inet_pton
+configure:23904: gcc -o conftest -g -O2   conftest.c  >&5
+configure:23911: $? =3D 0
+configure:23942: result: none required
+configure:23951: checking for gethostname in -lsocket
+configure:23986: gcc -o conftest -g -O2   conftest.c -lsocket   >&5
+/usr/bin/ld.bfd.real: cannot find -lsocket
+collect2: error: ld returned 1 exit status
+configure:23993: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| #define HAVE_FCNTL_H 1
+| #define HAVE_SYS_MMAN_H 1
+| #define HAVE_SYS_EPOLL_H 1
+| #define HAVE_IFADDRS_H 1
+| #define HAVE_NETINET_IN_SYSTM_H 1
+| #define HAVE_NETINET_IP_H 1
+| #define HAVE_NET_IF_H 1
+| #define HAVE_INT32_DEFINED 1
+| #define HAVE_INT32_DEFINED 1
+| #define HAVE_BSD_INT32_DEFINED 1
+| /* end confdefs.h.  */
+|=20
+| /* Override any GCC internal prototype to avoid an error.
+|    Use char because int might match the return type of a GCC
+|    builtin and then its argument prototype would still apply.  */
+| #ifdef __cplusplus
+| extern "C"
+| #endif
+| char gethostname ();
+| int
+| main ()
+| {
+| return gethostname ();
+|   ;
+|   return 0;
+| }
+configure:24014: result: no
+configure:24097: checking for ftruncate
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for fsync
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for select
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for gethostname
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for socket
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for strerror
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for fork
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+conftest.c:75:6: warning: conflicting types for built-in function 'fork' [=
enabled by default]
+ char fork ();
+      ^
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for pipe
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for execve
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+conftest.c:77:6: warning: conflicting types for built-in function 'execve'=
 [enabled by default]
+ char execve ();
+      ^
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for open
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for close
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for lseek
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for fstat
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for read
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for readv
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for write
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for writev
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for htonl
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for memset
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+conftest.c:87:6: warning: conflicting types for built-in function 'memset'=
 [enabled by default]
+ char memset ();
+      ^
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for htons
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for connect
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for getsockname
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for getpeername
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for bind
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for listen
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for accept
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for recvfrom
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for send
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for sendto
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for setsockopt
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for getsockopt
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for time
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for mktime
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for gethostbyname_r
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for localtime_r
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for strerror_r
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for fcntl
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for statvfs
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for mmap
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for munmap
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for mincore
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for msync
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for madvise
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for getpagesize
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for sysconf
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for lstat
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for readlink
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for inet_aton
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for inet_addr
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for inet_pton
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for getifaddrs
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for kqueue
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+/tmp/ccRosL8V.o: In function `main':
+/home/afong/foo/classpath-0.98/conftest.c:131: undefined reference to `kqu=
eue'
+collect2: error: ld returned 1 exit status
+configure:24160: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| #define HAVE_FCNTL_H 1
+| #define HAVE_SYS_MMAN_H 1
+| #define HAVE_SYS_EPOLL_H 1
+| #define HAVE_IFADDRS_H 1
+| #define HAVE_NETINET_IN_SYSTM_H 1
+| #define HAVE_NETINET_IP_H 1
+| #define HAVE_NET_IF_H 1
+| #define HAVE_INT32_DEFINED 1
+| #define HAVE_INT32_DEFINED 1
+| #define HAVE_BSD_INT32_DEFINED 1
+| #define HAVE_FTRUNCATE 1
+| #define HAVE_FSYNC 1
+| #define HAVE_SELECT 1
+| #define HAVE_GETHOSTNAME 1
+| #define HAVE_SOCKET 1
+| #define HAVE_STRERROR 1
+| #define HAVE_FORK 1
+| #define HAVE_PIPE 1
+| #define HAVE_EXECVE 1
+| #define HAVE_OPEN 1
+| #define HAVE_CLOSE 1
+| #define HAVE_LSEEK 1
+| #define HAVE_FSTAT 1
+| #define HAVE_READ 1
+| #define HAVE_READV 1
+| #define HAVE_WRITE 1
+| #define HAVE_WRITEV 1
+| #define HAVE_HTONL 1
+| #define HAVE_MEMSET 1
+| #define HAVE_HTONS 1
+| #define HAVE_CONNECT 1
+| #define HAVE_GETSOCKNAME 1
+| #define HAVE_GETPEERNAME 1
+| #define HAVE_BIND 1
+| #define HAVE_LISTEN 1
+| #define HAVE_ACCEPT 1
+| #define HAVE_RECVFROM 1
+| #define HAVE_SEND 1
+| #define HAVE_SENDTO 1
+| #define HAVE_SETSOCKOPT 1
+| #define HAVE_GETSOCKOPT 1
+| #define HAVE_TIME 1
+| #define HAVE_MKTIME 1
+| #define HAVE_GETHOSTBYNAME_R 1
+| #define HAVE_LOCALTIME_R 1
+| #define HAVE_STRERROR_R 1
+| #define HAVE_FCNTL 1
+| #define HAVE_STATVFS 1
+| #define HAVE_MMAP 1
+| #define HAVE_MUNMAP 1
+| #define HAVE_MINCORE 1
+| #define HAVE_MSYNC 1
+| #define HAVE_MADVISE 1
+| #define HAVE_GETPAGESIZE 1
+| #define HAVE_SYSCONF 1
+| #define HAVE_LSTAT 1
+| #define HAVE_READLINK 1
+| #define HAVE_INET_ATON 1
+| #define HAVE_INET_ADDR 1
+| #define HAVE_INET_PTON 1
+| #define HAVE_GETIFADDRS 1
+| /* end confdefs.h.  */
+| /* Define kqueue to an innocuous variant, in case <limits.h> declares kq=
ueue.
+|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
+| #define kqueue innocuous_kqueue
+|=20
+| /* System header to define __stub macros and hopefully few prototypes,
+|     which can conflict with char kqueue (); below.
+|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
+|     <limits.h> exists even on freestanding compilers.  */
+|=20
+| #ifdef __STDC__
+| # include <limits.h>
+| #else
+| # include <assert.h>
+| #endif
+|=20
+| #undef kqueue
+|=20
+| /* Override any GCC internal prototype to avoid an error.
+|    Use char because int might match the return type of a GCC
+|    builtin and then its argument prototype would still apply.  */
+| #ifdef __cplusplus
+| extern "C"
+| #endif
+| char kqueue ();
+| /* The GNU C library defines this for functions which it implements
+|     to always fail with ENOSYS.  Some functions are actually named
+|     something starting with __ and the normal name is an alias.  */
+| #if defined __stub_kqueue || defined __stub___kqueue
+| choke me
+| #endif
+|=20
+| int
+| main ()
+| {
+| return kqueue ();
+|   ;
+|   return 0;
+| }
+configure:24182: result: no
+configure:24097: checking for kevent
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+/tmp/ccRTkSBP.o: In function `main':
+/home/afong/foo/classpath-0.98/conftest.c:131: undefined reference to `kev=
ent'
+collect2: error: ld returned 1 exit status
+configure:24160: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| #define HAVE_FCNTL_H 1
+| #define HAVE_SYS_MMAN_H 1
+| #define HAVE_SYS_EPOLL_H 1
+| #define HAVE_IFADDRS_H 1
+| #define HAVE_NETINET_IN_SYSTM_H 1
+| #define HAVE_NETINET_IP_H 1
+| #define HAVE_NET_IF_H 1
+| #define HAVE_INT32_DEFINED 1
+| #define HAVE_INT32_DEFINED 1
+| #define HAVE_BSD_INT32_DEFINED 1
+| #define HAVE_FTRUNCATE 1
+| #define HAVE_FSYNC 1
+| #define HAVE_SELECT 1
+| #define HAVE_GETHOSTNAME 1
+| #define HAVE_SOCKET 1
+| #define HAVE_STRERROR 1
+| #define HAVE_FORK 1
+| #define HAVE_PIPE 1
+| #define HAVE_EXECVE 1
+| #define HAVE_OPEN 1
+| #define HAVE_CLOSE 1
+| #define HAVE_LSEEK 1
+| #define HAVE_FSTAT 1
+| #define HAVE_READ 1
+| #define HAVE_READV 1
+| #define HAVE_WRITE 1
+| #define HAVE_WRITEV 1
+| #define HAVE_HTONL 1
+| #define HAVE_MEMSET 1
+| #define HAVE_HTONS 1
+| #define HAVE_CONNECT 1
+| #define HAVE_GETSOCKNAME 1
+| #define HAVE_GETPEERNAME 1
+| #define HAVE_BIND 1
+| #define HAVE_LISTEN 1
+| #define HAVE_ACCEPT 1
+| #define HAVE_RECVFROM 1
+| #define HAVE_SEND 1
+| #define HAVE_SENDTO 1
+| #define HAVE_SETSOCKOPT 1
+| #define HAVE_GETSOCKOPT 1
+| #define HAVE_TIME 1
+| #define HAVE_MKTIME 1
+| #define HAVE_GETHOSTBYNAME_R 1
+| #define HAVE_LOCALTIME_R 1
+| #define HAVE_STRERROR_R 1
+| #define HAVE_FCNTL 1
+| #define HAVE_STATVFS 1
+| #define HAVE_MMAP 1
+| #define HAVE_MUNMAP 1
+| #define HAVE_MINCORE 1
+| #define HAVE_MSYNC 1
+| #define HAVE_MADVISE 1
+| #define HAVE_GETPAGESIZE 1
+| #define HAVE_SYSCONF 1
+| #define HAVE_LSTAT 1
+| #define HAVE_READLINK 1
+| #define HAVE_INET_ATON 1
+| #define HAVE_INET_ADDR 1
+| #define HAVE_INET_PTON 1
+| #define HAVE_GETIFADDRS 1
+| /* end confdefs.h.  */
+| /* Define kevent to an innocuous variant, in case <limits.h> declares ke=
vent.
+|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
+| #define kevent innocuous_kevent
+|=20
+| /* System header to define __stub macros and hopefully few prototypes,
+|     which can conflict with char kevent (); below.
+|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
+|     <limits.h> exists even on freestanding compilers.  */
+|=20
+| #ifdef __STDC__
+| # include <limits.h>
+| #else
+| # include <assert.h>
+| #endif
+|=20
+| #undef kevent
+|=20
+| /* Override any GCC internal prototype to avoid an error.
+|    Use char because int might match the return type of a GCC
+|    builtin and then its argument prototype would still apply.  */
+| #ifdef __cplusplus
+| extern "C"
+| #endif
+| char kevent ();
+| /* The GNU C library defines this for functions which it implements
+|     to always fail with ENOSYS.  Some functions are actually named
+|     something starting with __ and the normal name is an alias.  */
+| #if defined __stub_kevent || defined __stub___kevent
+| choke me
+| #endif
+|=20
+| int
+| main ()
+| {
+| return kevent ();
+|   ;
+|   return 0;
+| }
+configure:24182: result: no
+configure:24097: checking for epoll_create
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24097: checking for getloadavg
+configure:24153: gcc -o conftest -g -O2   conftest.c  >&5
+configure:24160: $? =3D 0
+configure:24182: result: yes
+configure:24196: checking for magic_open in -lmagic
+configure:24231: gcc -o conftest -g -O2   conftest.c -lmagic   >&5
+/usr/bin/ld.bfd.real: cannot find -lmagic
+collect2: error: ld returned 1 exit status
+configure:24238: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| #define HAVE_FCNTL_H 1
+| #define HAVE_SYS_MMAN_H 1
+| #define HAVE_SYS_EPOLL_H 1
+| #define HAVE_IFADDRS_H 1
+| #define HAVE_NETINET_IN_SYSTM_H 1
+| #define HAVE_NETINET_IP_H 1
+| #define HAVE_NET_IF_H 1
+| #define HAVE_INT32_DEFINED 1
+| #define HAVE_INT32_DEFINED 1
+| #define HAVE_BSD_INT32_DEFINED 1
+| #define HAVE_FTRUNCATE 1
+| #define HAVE_FSYNC 1
+| #define HAVE_SELECT 1
+| #define HAVE_GETHOSTNAME 1
+| #define HAVE_SOCKET 1
+| #define HAVE_STRERROR 1
+| #define HAVE_FORK 1
+| #define HAVE_PIPE 1
+| #define HAVE_EXECVE 1
+| #define HAVE_OPEN 1
+| #define HAVE_CLOSE 1
+| #define HAVE_LSEEK 1
+| #define HAVE_FSTAT 1
+| #define HAVE_READ 1
+| #define HAVE_READV 1
+| #define HAVE_WRITE 1
+| #define HAVE_WRITEV 1
+| #define HAVE_HTONL 1
+| #define HAVE_MEMSET 1
+| #define HAVE_HTONS 1
+| #define HAVE_CONNECT 1
+| #define HAVE_GETSOCKNAME 1
+| #define HAVE_GETPEERNAME 1
+| #define HAVE_BIND 1
+| #define HAVE_LISTEN 1
+| #define HAVE_ACCEPT 1
+| #define HAVE_RECVFROM 1
+| #define HAVE_SEND 1
+| #define HAVE_SENDTO 1
+| #define HAVE_SETSOCKOPT 1
+| #define HAVE_GETSOCKOPT 1
+| #define HAVE_TIME 1
+| #define HAVE_MKTIME 1
+| #define HAVE_GETHOSTBYNAME_R 1
+| #define HAVE_LOCALTIME_R 1
+| #define HAVE_STRERROR_R 1
+| #define HAVE_FCNTL 1
+| #define HAVE_STATVFS 1
+| #define HAVE_MMAP 1
+| #define HAVE_MUNMAP 1
+| #define HAVE_MINCORE 1
+| #define HAVE_MSYNC 1
+| #define HAVE_MADVISE 1
+| #define HAVE_GETPAGESIZE 1
+| #define HAVE_SYSCONF 1
+| #define HAVE_LSTAT 1
+| #define HAVE_READLINK 1
+| #define HAVE_INET_ATON 1
+| #define HAVE_INET_ADDR 1
+| #define HAVE_INET_PTON 1
+| #define HAVE_GETIFADDRS 1
+| #define HAVE_EPOLL_CREATE 1
+| #define HAVE_GETLOADAVG 1
+| /* end confdefs.h.  */
+|=20
+| /* Override any GCC internal prototype to avoid an error.
+|    Use char because int might match the return type of a GCC
+|    builtin and then its argument prototype would still apply.  */
+| #ifdef __cplusplus
+| extern "C"
+| #endif
+| char magic_open ();
+| int
+| main ()
+| {
+| return magic_open ();
+|   ;
+|   return 0;
+| }
+configure:24259: result: no
+configure:24267: checking whether struct sockaddr_in6 is in netinet/in.h
+configure:24290: gcc -c -g -O2  conftest.c >&5
+configure:24297: $? =3D 0
+configure:24307: result: yes
+configure:24319: checking whether time.h and sys/time.h may both be includ=
ed
+configure:24349: gcc -c -g -O2  conftest.c >&5
+configure:24356: $? =3D 0
+configure:24371: result: yes
+configure:24381: checking whether struct tm is in sys/time.h or time.h
+configure:24411: gcc -c -g -O2  conftest.c >&5
+configure:24418: $? =3D 0
+configure:24433: result: time.h
+configure:24443: checking for struct tm.tm_zone
+configure:24474: gcc -c -g -O2  conftest.c >&5
+configure:24481: $? =3D 0
+configure:24542: result: yes
+configure:24699: checking for tm_gmtoff in struct tm
+configure:24722: gcc -c -g -O2  conftest.c >&5
+configure:24729: $? =3D 0
+configure:24739: result: yes
+configure:24853: checking for an ANSI C-conforming const
+configure:24928: gcc -c -g -O2  conftest.c >&5
+configure:24935: $? =3D 0
+configure:24950: result: yes
+configure:24960: checking for inline
+configure:24986: gcc -c -g -O2  conftest.c >&5
+configure:24993: $? =3D 0
+configure:25011: result: inline
+configure:25030: checking for __attribute__
+configure:25051: gcc -c -g -O2  conftest.c >&5
+configure:25058: $? =3D 0
+configure:25075: result: yes
+configure:25096: checking how many arguments gethostbyname_r() takes
+configure:25141: gcc -c -g -O2  conftest.c >&5
+conftest.c: In function 'main':
+conftest.c:110:13: error: too few arguments to function 'gethostbyname_r'
+             (void)gethostbyname_r(name) /* ; */
+             ^
+In file included from conftest.c:104:0:
+/usr/include/netdb.h:179:12: note: declared here
+ extern int gethostbyname_r (const char *__restrict __name,
+            ^
+configure:25148: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| #define HAVE_FCNTL_H 1
+| #define HAVE_SYS_MMAN_H 1
+| #define HAVE_SYS_EPOLL_H 1
+| #define HAVE_IFADDRS_H 1
+| #define HAVE_NETINET_IN_SYSTM_H 1
+| #define HAVE_NETINET_IP_H 1
+| #define HAVE_NET_IF_H 1
+| #define HAVE_INT32_DEFINED 1
+| #define HAVE_INT32_DEFINED 1
+| #define HAVE_BSD_INT32_DEFINED 1
+| #define HAVE_FTRUNCATE 1
+| #define HAVE_FSYNC 1
+| #define HAVE_SELECT 1
+| #define HAVE_GETHOSTNAME 1
+| #define HAVE_SOCKET 1
+| #define HAVE_STRERROR 1
+| #define HAVE_FORK 1
+| #define HAVE_PIPE 1
+| #define HAVE_EXECVE 1
+| #define HAVE_OPEN 1
+| #define HAVE_CLOSE 1
+| #define HAVE_LSEEK 1
+| #define HAVE_FSTAT 1
+| #define HAVE_READ 1
+| #define HAVE_READV 1
+| #define HAVE_WRITE 1
+| #define HAVE_WRITEV 1
+| #define HAVE_HTONL 1
+| #define HAVE_MEMSET 1
+| #define HAVE_HTONS 1
+| #define HAVE_CONNECT 1
+| #define HAVE_GETSOCKNAME 1
+| #define HAVE_GETPEERNAME 1
+| #define HAVE_BIND 1
+| #define HAVE_LISTEN 1
+| #define HAVE_ACCEPT 1
+| #define HAVE_RECVFROM 1
+| #define HAVE_SEND 1
+| #define HAVE_SENDTO 1
+| #define HAVE_SETSOCKOPT 1
+| #define HAVE_GETSOCKOPT 1
+| #define HAVE_TIME 1
+| #define HAVE_MKTIME 1
+| #define HAVE_GETHOSTBYNAME_R 1
+| #define HAVE_LOCALTIME_R 1
+| #define HAVE_STRERROR_R 1
+| #define HAVE_FCNTL 1
+| #define HAVE_STATVFS 1
+| #define HAVE_MMAP 1
+| #define HAVE_MUNMAP 1
+| #define HAVE_MINCORE 1
+| #define HAVE_MSYNC 1
+| #define HAVE_MADVISE 1
+| #define HAVE_GETPAGESIZE 1
+| #define HAVE_SYSCONF 1
+| #define HAVE_LSTAT 1
+| #define HAVE_READLINK 1
+| #define HAVE_INET_ATON 1
+| #define HAVE_INET_ADDR 1
+| #define HAVE_INET_PTON 1
+| #define HAVE_GETIFADDRS 1
+| #define HAVE_EPOLL_CREATE 1
+| #define HAVE_GETLOADAVG 1
+| #define HAVE_INET6 1
+| #define TIME_WITH_SYS_TIME 1
+| #define HAVE_STRUCT_TM_TM_ZONE 1
+| #define HAVE_TM_ZONE 1
+| #define STRUCT_TM_HAS_GMTOFF 1
+| /* end confdefs.h.  */
+| #include <netdb.h>
+| int
+| main ()
+| {
+|=20
+|             char *name =3D "www.gnu.org";
+|             (void)gethostbyname_r(name) /* ; */
+|=20
+|   ;
+|   return 0;
+| }
+configure:25198: gcc -c -g -O2  conftest.c >&5
+configure:25205: $? =3D 0
+configure:25365: result: six
+configure:25440: checking for ld used by GCC
+configure:25503: result: /usr/bin/ld -m elf_x86_64
+configure:25512: checking if the linker (/usr/bin/ld -m elf_x86_64) is GNU=
 ld
+GNU ld (GNU Binutils for Debian) 2.23.90.20131017
+configure:25524: result: yes
+configure:25530: checking for shared library run path origin
+configure:25543: result: done
+configure:25973: checking for iconv
+configure:26005: gcc -o conftest -g -O2   conftest.c  >&5
+configure:26012: $? =3D 0
+configure:26089: result: yes
+configure:26112: checking for iconv declaration
+configure:26151: gcc -c -g -O2  conftest.c >&5
+configure:26158: $? =3D 0
+configure:26177: result:=20
+         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesle=
ft, char * *outbuf, size_t *outbytesleft);
+configure:26412: checking for X
+configure:26583: gcc -o conftest -g -O2   conftest.c -lX11  >&5
+configure:26590: $? =3D 0
+configure:26652: result: libraries , headers=20
+configure:26821: gcc -o conftest -g -O2   conftest.c   -lX11 >&5
+configure:26828: $? =3D 0
+configure:26996: checking for gethostbyname
+configure:27052: gcc -o conftest -g -O2   conftest.c  >&5
+configure:27059: $? =3D 0
+configure:27079: result: yes
+configure:27232: checking for connect
+configure:27315: result: yes
+configure:27391: checking for remove
+configure:27447: gcc -o conftest -g -O2   conftest.c  >&5
+configure:27454: $? =3D 0
+configure:27474: result: yes
+configure:27550: checking for shmat
+configure:27606: gcc -o conftest -g -O2   conftest.c  >&5
+configure:27613: $? =3D 0
+configure:27633: result: yes
+configure:27718: checking for IceConnectionNumber in -lICE
+configure:27753: gcc -o conftest -g -O2   conftest.c -lICE   >&5
+configure:27760: $? =3D 0
+configure:27781: result: yes
+configure:27796: checking for XTestQueryExtension in -lXtst
+configure:27831: gcc -o conftest -g -O2   conftest.c -lXtst   >&5
+/usr/bin/ld.bfd.real: cannot find -lXtst
+collect2: error: ld returned 1 exit status
+configure:27838: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| #define HAVE_FCNTL_H 1
+| #define HAVE_SYS_MMAN_H 1
+| #define HAVE_SYS_EPOLL_H 1
+| #define HAVE_IFADDRS_H 1
+| #define HAVE_NETINET_IN_SYSTM_H 1
+| #define HAVE_NETINET_IP_H 1
+| #define HAVE_NET_IF_H 1
+| #define HAVE_INT32_DEFINED 1
+| #define HAVE_INT32_DEFINED 1
+| #define HAVE_BSD_INT32_DEFINED 1
+| #define HAVE_FTRUNCATE 1
+| #define HAVE_FSYNC 1
+| #define HAVE_SELECT 1
+| #define HAVE_GETHOSTNAME 1
+| #define HAVE_SOCKET 1
+| #define HAVE_STRERROR 1
+| #define HAVE_FORK 1
+| #define HAVE_PIPE 1
+| #define HAVE_EXECVE 1
+| #define HAVE_OPEN 1
+| #define HAVE_CLOSE 1
+| #define HAVE_LSEEK 1
+| #define HAVE_FSTAT 1
+| #define HAVE_READ 1
+| #define HAVE_READV 1
+| #define HAVE_WRITE 1
+| #define HAVE_WRITEV 1
+| #define HAVE_HTONL 1
+| #define HAVE_MEMSET 1
+| #define HAVE_HTONS 1
+| #define HAVE_CONNECT 1
+| #define HAVE_GETSOCKNAME 1
+| #define HAVE_GETPEERNAME 1
+| #define HAVE_BIND 1
+| #define HAVE_LISTEN 1
+| #define HAVE_ACCEPT 1
+| #define HAVE_RECVFROM 1
+| #define HAVE_SEND 1
+| #define HAVE_SENDTO 1
+| #define HAVE_SETSOCKOPT 1
+| #define HAVE_GETSOCKOPT 1
+| #define HAVE_TIME 1
+| #define HAVE_MKTIME 1
+| #define HAVE_GETHOSTBYNAME_R 1
+| #define HAVE_LOCALTIME_R 1
+| #define HAVE_STRERROR_R 1
+| #define HAVE_FCNTL 1
+| #define HAVE_STATVFS 1
+| #define HAVE_MMAP 1
+| #define HAVE_MUNMAP 1
+| #define HAVE_MINCORE 1
+| #define HAVE_MSYNC 1
+| #define HAVE_MADVISE 1
+| #define HAVE_GETPAGESIZE 1
+| #define HAVE_SYSCONF 1
+| #define HAVE_LSTAT 1
+| #define HAVE_READLINK 1
+| #define HAVE_INET_ATON 1
+| #define HAVE_INET_ADDR 1
+| #define HAVE_INET_PTON 1
+| #define HAVE_GETIFADDRS 1
+| #define HAVE_EPOLL_CREATE 1
+| #define HAVE_GETLOADAVG 1
+| #define HAVE_INET6 1
+| #define TIME_WITH_SYS_TIME 1
+| #define HAVE_STRUCT_TM_TM_ZONE 1
+| #define HAVE_TM_ZONE 1
+| #define STRUCT_TM_HAS_GMTOFF 1
+| #define HAVE_FUNC_GETHOSTBYNAME_R_6 1
+| #define HAVE_ICONV 1
+| #define ICONV_CONST=20
+| /* end confdefs.h.  */
+|=20
+| /* Override any GCC internal prototype to avoid an error.
+|    Use char because int might match the return type of a GCC
+|    builtin and then its argument prototype would still apply.  */
+| #ifdef __cplusplus
+| extern "C"
+| #endif
+| char XTestQueryExtension ();
+| int
+| main ()
+| {
+| return XTestQueryExtension ();
+|   ;
+|   return 0;
+| }
+configure:27859: result: no
+configure:27879: checking for pkg-config
+configure:27897: found /usr/bin/pkg-config
+configure:27910: result: /usr/bin/pkg-config
+configure:27928: checking for gtk+-2.0 >=3D 2.8 gthread-2.0 >=3D 2.2 gdk-p=
ixbuf-2.0
+configure:27932: result: yes
+configure:27936: checking GTK_CFLAGS
+configure:27939: result: -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64=
-linux-gnu/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/u=
sr/include/gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/gio-unix-=
2.0/ -I/usr/include/freetype2 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-lin=
ux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/libpng12 -I/=
usr/include/libdrm -I/usr/include/harfbuzz =20
+configure:27942: checking GTK_LIBS
+configure:27945: result: -pthread -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -l=
gio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfontconfig -l=
freetype -lgthread-2.0 -lgdk_pixbuf-2.0 -lgobject-2.0 -lglib-2.0 =20
+configure:28027: checking for freetype2
+configure:28031: result: yes
+configure:28035: checking FREETYPE2_CFLAGS
+configure:28038: result: -I/usr/include/freetype2 =20
+configure:28041: checking FREETYPE2_LIBS
+configure:28044: result: -lfreetype =20
+configure:28126: checking for pangoft2
+configure:28130: result: yes
+configure:28134: checking PANGOFT2_CFLAGS
+configure:28137: result: -pthread -I/usr/include/pango-1.0 -I/usr/include/=
harfbuzz -I/usr/include/freetype2 -I/usr/include/glib-2.0 -I/usr/lib/x86_64=
-linux-gnu/glib-2.0/include =20
+configure:28140: checking PANGOFT2_LIBS
+configure:28143: result: -lpangoft2-1.0 -lpango-1.0 -lfontconfig -lgobject=
-2.0 -lglib-2.0 -lfreetype =20
+configure:28225: checking for cairo >=3D 1.1.8
+configure:28229: result: yes
+configure:28233: checking CAIRO_CFLAGS
+configure:28236: result: -I/usr/include/cairo -I/usr/include/glib-2.0 -I/u=
sr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/inc=
lude/freetype2 -I/usr/include/libpng12 -I/usr/include/libdrm =20
+configure:28239: checking CAIRO_LIBS
+configure:28242: result: -lcairo =20
+configure:28269: checking for XRenderQueryExtension in -lXrender
+configure:28304: gcc -o conftest -g -O2   conftest.c -lXrender   >&5
+configure:28311: $? =3D 0
+configure:28332: result: yes
+configure:28345: checking for XRRQueryExtension in -lXrandr
+configure:28380: gcc -o conftest -g -O2   conftest.c -lXrandr   >&5
+configure:28387: $? =3D 0
+configure:28408: result: yes
+configure:28486: checking for gconf-2.0 >=3D 2.6.0
+configure:28490: result: yes
+configure:28494: checking GCONF_CFLAGS
+configure:28497: result: -pthread -I/usr/include/gconf/2 -I/usr/include/db=
us-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/glib-2.0=
 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include =20
+configure:28500: checking GCONF_LIBS
+configure:28503: result: -lgconf-2 -lglib-2.0 =20
+configure:28587: checking for gdk-2.0 >=3D 2.8
+configure:28591: result: yes
+configure:28595: checking GDK_CFLAGS
+configure:28598: result: -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64=
-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/free=
type2 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/gdk-pixb=
uf-2.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include=
 -I/usr/include/pixman-1 -I/usr/include/libpng12 -I/usr/include/libdrm =20
+configure:28601: checking GDK_LIBS
+configure:28604: result: -lgdk-x11-2.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -=
lpango-1.0 -lcairo -lgobject-2.0 -lglib-2.0 =20
+configure:29373: checking for MSG_NOSIGNAL
+configure:29396: gcc -c -g -O2  conftest.c >&5
+configure:29403: $? =3D 0
+configure:29408: result: yes
+configure:29425: checking for SO_NOSIGPIPE=20
+configure:29448: gcc -c -g -O2  conftest.c >&5
+conftest.c: In function 'main':
+conftest.c:114:10: error: 'SO_NOSIGPIPE' undeclared (first use in this fun=
ction)
+  int f =3D SO_NOSIGPIPE;
+          ^
+conftest.c:114:10: note: each undeclared identifier is reported only once =
for each function it appears in
+configure:29455: $? =3D 1
+configure: failed program was:
+| /* confdefs.h.  */
+| #define PACKAGE_NAME "GNU Classpath"
+| #define PACKAGE_TARNAME "classpath"
+| #define PACKAGE_VERSION "0.98"
+| #define PACKAGE_STRING "GNU Classpath 0.98"
+| #define PACKAGE_BUGREPORT "classpath@gnu.org"
+| #define PACKAGE "classpath"
+| #define VERSION "0.98"
+| #define STDC_HEADERS 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_STAT_H 1
+| #define HAVE_STDLIB_H 1
+| #define HAVE_STRING_H 1
+| #define HAVE_MEMORY_H 1
+| #define HAVE_STRINGS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UNISTD_H 1
+| #define HAVE_ALSA_ASOUNDLIB_H 1
+| #define HAVE_DLFCN_H 1
+| #define HAVE_GNUC25_ATTRIB /**/
+| #define HAVE_GNUC25_UNUSED /**/
+| #define STDC_HEADERS 1
+| #define SIZEOF_VOID_P 8
+| #define BYTEORDER 1234
+| #define HAVE_UNISTD_H 1
+| #define HAVE_SYS_TYPES_H 1
+| #define HAVE_SYS_IOCTL_H 1
+| #define HAVE_ASM_IOCTLS_H 1
+| #define HAVE_INTTYPES_H 1
+| #define HAVE_STDINT_H 1
+| #define HAVE_UTIME_H 1
+| #define HAVE_SYS_TIME_H 1
+| #define HAVE_SYS_SELECT_H 1
+| #define HAVE_FCNTL_H 1
+| #define HAVE_SYS_MMAN_H 1
+| #define HAVE_SYS_EPOLL_H 1
+| #define HAVE_IFADDRS_H 1
+| #define HAVE_NETINET_IN_SYSTM_H 1
+| #define HAVE_NETINET_IP_H 1
+| #define HAVE_NET_IF_H 1
+| #define HAVE_INT32_DEFINED 1
+| #define HAVE_INT32_DEFINED 1
+| #define HAVE_BSD_INT32_DEFINED 1
+| #define HAVE_FTRUNCATE 1
+| #define HAVE_FSYNC 1
+| #define HAVE_SELECT 1
+| #define HAVE_GETHOSTNAME 1
+| #define HAVE_SOCKET 1
+| #define HAVE_STRERROR 1
+| #define HAVE_FORK 1
+| #define HAVE_PIPE 1
+| #define HAVE_EXECVE 1
+| #define HAVE_OPEN 1
+| #define HAVE_CLOSE 1
+| #define HAVE_LSEEK 1
+| #define HAVE_FSTAT 1
+| #define HAVE_READ 1
+| #define HAVE_READV 1
+| #define HAVE_WRITE 1
+| #define HAVE_WRITEV 1
+| #define HAVE_HTONL 1
+| #define HAVE_MEMSET 1
+| #define HAVE_HTONS 1
+| #define HAVE_CONNECT 1
+| #define HAVE_GETSOCKNAME 1
+| #define HAVE_GETPEERNAME 1
+| #define HAVE_BIND 1
+| #define HAVE_LISTEN 1
+| #define HAVE_ACCEPT 1
+| #define HAVE_RECVFROM 1
+| #define HAVE_SEND 1
+| #define HAVE_SENDTO 1
+| #define HAVE_SETSOCKOPT 1
+| #define HAVE_GETSOCKOPT 1
+| #define HAVE_TIME 1
+| #define HAVE_MKTIME 1
+| #define HAVE_GETHOSTBYNAME_R 1
+| #define HAVE_LOCALTIME_R 1
+| #define HAVE_STRERROR_R 1
+| #define HAVE_FCNTL 1
+| #define HAVE_STATVFS 1
+| #define HAVE_MMAP 1
+| #define HAVE_MUNMAP 1
+| #define HAVE_MINCORE 1
+| #define HAVE_MSYNC 1
+| #define HAVE_MADVISE 1
+| #define HAVE_GETPAGESIZE 1
+| #define HAVE_SYSCONF 1
+| #define HAVE_LSTAT 1
+| #define HAVE_READLINK 1
+| #define HAVE_INET_ATON 1
+| #define HAVE_INET_ADDR 1
+| #define HAVE_INET_PTON 1
+| #define HAVE_GETIFADDRS 1
+| #define HAVE_EPOLL_CREATE 1
+| #define HAVE_GETLOADAVG 1
+| #define HAVE_INET6 1
+| #define TIME_WITH_SYS_TIME 1
+| #define HAVE_STRUCT_TM_TM_ZONE 1
+| #define HAVE_TM_ZONE 1
+| #define STRUCT_TM_HAS_GMTOFF 1
+| #define HAVE_FUNC_GETHOSTBYNAME_R_6 1
+| #define HAVE_ICONV 1
+| #define ICONV_CONST=20
+| #define HAVE_XRENDER 1
+| #define HAVE_XRANDR 1
+| #define HAVE_MSG_NOSIGNAL 1
+| /* end confdefs.h.  */
+| #include <sys/socket.h>
+| int
+| main ()
+| {
+|  int f =3D SO_NOSIGPIPE;
+|   ;
+|   return 0;
+| }
+configure:29471: result: no
+configure:29477: checking for MSG_WAITALL
+configure:29500: gcc -c -g -O2  conftest.c >&5
+configure:29507: $? =3D 0
+configure:29512: result: yes
+configure:30340: checking for __gmpz_mul_si in -lgmp
+configure:30375: gcc -o conftest -g -O2   conftest.c -lgmp   >&5
+configure:30382: $? =3D 0
+configure:30403: result: yes
+configure:30432: checking gmp.h usability
+configure:30449: gcc -c -g -O2  conftest.c >&5
+configure:30456: $? =3D 0
+configure:30470: result: yes
+configure:30474: checking gmp.h presence
+configure:30489: gcc -E  conftest.c
+configure:30496: $? =3D 0
+configure:30510: result: yes
+configure:30543: checking for gmp.h
+configure:30552: result: yes
+configure:30896: checking jni_md.h support
+configure:30899: result: yes
+configure:30930: checking whether to enable maintainer-specific portions o=
f Makefiles
+configure:30939: result: no
+configure:31021: checking for mkdir
+configure:31039: found /bin/mkdir
+configure:31051: result: /bin/mkdir
+configure:31061: checking for cp
+configure:31079: found /bin/cp
+configure:31091: result: /bin/cp
+configure:31101: checking for date
+configure:31119: found /bin/date
+configure:31131: result: /bin/date
+configure:31142: checking for find
+configure:31160: found /usr/bin/find
+configure:31172: result: /usr/bin/find
+configure:31184: checking for zip
+configure:31202: found /usr/bin/zip
+configure:31214: result: /usr/bin/zip
+configure:31223: checking for a jar-like tool
+configure:31260: result: trying fastjar, gjar and jar
+configure:31266: checking for fastjar
+configure:31284: found /usr/bin/fastjar
+configure:31296: result: /usr/bin/fastjar
+configure:31657: checking whether to regenerate parsers with jay
+configure:31659: result: no
+configure:31696: checking for stdint types
+configure:31729: gcc -c   conftest.c >&5
+configure:31736: $? =3D 0
+configure:31769: result: stdint.h (shortcircuit)
+configure:34621: result: make use of stdint.h in include/config-int.h (ass=
uming C99 compatible system)
+configure:34672: checking for cacao
+configure:34702: result: no
+configure:34672: checking for jamvm
+configure:34702: result: no
+configure:34672: checking for kaffe
+configure:34702: result: no
+configure:34672: checking for gij
+configure:34688: found /usr/bin/gij
+configure:34699: result: gij
+configure:34761: checking for uudecode
+configure:34777: found /usr/bin/uudecode
+configure:34788: result: yes
+configure:34797: checking if uudecode can decode base 64 file
+configure:34824: result: yes
+configure:35003: checking if gij works
+configure:35036: CLASSPATH=3D.: gij  Test
+configure:35039: $? =3D 0
+configure:35052: result: yes
+configure:35060: checking for the ANTLR parser generator JAR file
+configure:35075: result: /usr/share/java/antlr.jar
+configure:35130: checking for cantlr
+configure:35160: result: no
+configure:35130: checking for runantlr
+configure:35160: result: no
+configure:35130: checking for antlr
+configure:35160: result: no
+configure:35191: checking for antlr 2.7.1 or better
+configure:35206: result: 2.7.7
+configure:35228: checking for ecj
+configure:35244: found /usr/bin/ecj
+configure:35255: result: ecj -warn:-deprecation,serial,unusedImport
+configure:35314: checking if ecj -warn:-deprecation,serial,unusedImport is=
 a version of gcj
+configure:35325: result:=20
+configure:35338: checking if ecj -warn:-deprecation,serial,unusedImport wo=
rks
+configure:35363: ecj -warn:-deprecation,serial,unusedImport  -source 1.5 -=
target 1.5 Object.java
+configure:35366: $? =3D 0
+configure:35379: result: yes
+configure:35397: checking whether javac supports -J
+configure:35402: result: yes
+configure:36126: creating ./config.status
+
+## ---------------------- ##
+## Running config.status. ##
+## ---------------------- ##
+
+This file was extended by GNU Classpath config.status 0.98, which was
+generated by GNU Autoconf 2.63.  Invocation command line was
+
+  CONFIG_FILES    =3D=20
+  CONFIG_HEADERS  =3D=20
+  CONFIG_LINKS    =3D=20
+  CONFIG_COMMANDS =3D=20
+  $ ./config.status=20
+
+on yow-afong-lx2
+
+config.status:1142: creating Makefile
+config.status:1142: creating doc/Makefile
+config.status:1142: creating doc/api/Makefile
+config.status:1142: creating external/Makefile
+config.status:1142: creating external/sax/Makefile
+config.status:1142: creating external/w3c_dom/Makefile
+config.status:1142: creating external/relaxngDatatype/Makefile
+config.status:1142: creating external/jsr166/Makefile
+config.status:1142: creating gnu/classpath/Configuration.java
+config.status:1142: creating gnu/java/security/Configuration.java
+config.status:1142: creating include/Makefile
+config.status:1142: creating native/Makefile
+config.status:1142: creating native/fdlibm/Makefile
+config.status:1142: creating native/jawt/Makefile
+config.status:1142: creating native/jni/Makefile
+config.status:1142: creating native/jni/classpath/Makefile
+config.status:1142: creating native/jni/java-io/Makefile
+config.status:1142: creating native/jni/java-lang/Makefile
+config.status:1142: creating native/jni/java-math/Makefile
+config.status:1142: creating native/jni/java-net/Makefile
+config.status:1142: creating native/jni/java-nio/Makefile
+config.status:1142: creating native/jni/java-util/Makefile
+config.status:1142: creating native/jni/gtk-peer/Makefile
+config.status:1142: creating native/jni/gconf-peer/Makefile
+config.status:1142: creating native/jni/gstreamer-peer/Makefile
+config.status:1142: creating native/jni/qt-peer/Makefile
+config.status:1142: creating native/jni/xmlj/Makefile
+config.status:1142: creating native/jni/midi-alsa/Makefile
+config.status:1142: creating native/jni/midi-dssi/Makefile
+config.status:1142: creating native/jni/native-lib/Makefile
+config.status:1142: creating native/plugin/Makefile
+config.status:1142: creating resource/Makefile
+config.status:1142: creating resource/META-INF/services/java.util.prefs.Pr=
eferencesFactory
+config.status:1142: creating resource/META-INF/services/javax.sound.sample=
d.spi.AudioFileReader
+config.status:1142: creating resource/META-INF/services/javax.sound.sample=
d.spi.MixerProvider
+config.status:1142: creating scripts/Makefile
+config.status:1142: creating scripts/classpath.spec
+config.status:1142: creating lib/Makefile
+config.status:1142: creating lib/gen-classlist.sh
+config.status:1142: creating lib/copy-vmresources.sh
+config.status:1142: creating scripts/check_jni_methods.sh
+config.status:1142: creating tools/Makefile
+config.status:1142: creating examples/Makefile
+config.status:1142: creating examples/Makefile.jawt
+config.status:1142: creating examples/Makefile.java2d
+config.status:1142: creating tools/gappletviewer
+config.status:1142: creating tools/gjarsigner
+config.status:1142: creating tools/gkeytool
+config.status:1142: creating tools/gjar
+config.status:1142: creating tools/gnative2ascii
+config.status:1142: creating tools/gserialver
+config.status:1142: creating tools/grmiregistry
+config.status:1142: creating tools/gtnameserv
+config.status:1142: creating tools/gorbd
+config.status:1142: creating tools/grmid
+config.status:1142: creating tools/grmic
+config.status:1142: creating tools/gjavah
+config.status:1142: creating tools/gjdoc
+config.status:1142: creating include/config.h
+config.status:1428: linking include/jni_md-x86-linux-gnu.h to include/jni_=
md.h
+config.status:1451: executing depfiles commands
+config.status:1451: executing include/config-int.h commands
+config.status:1593: creating include/config-int.h : _CLASSPATH_INCLUDE_CON=
FIG_INT_H
+config.status:1451: executing gappletviewer commands
+config.status:1451: executing gjarsigner commands
+config.status:1451: executing gkeytool commands
+config.status:1451: executing gjar commands
+config.status:1451: executing gnative2ascii commands
+config.status:1451: executing gserialver commands
+config.status:1451: executing grmiregistry commands
+config.status:1451: executing gtnameserv commands
+config.status:1451: executing gorbd commands
+config.status:1451: executing grmid commands
+config.status:1451: executing grmic commands
+config.status:1451: executing gjavah commands
+config.status:1451: executing gjdoc commands
+config.status:1451: executing gen-classlist commands
+config.status:1451: executing copy-vmresources commands
+
+## ---------------- ##
+## Cache variables. ##
+## ---------------- ##
+
+ac_cv_build=3Dx86_64-unknown-linux-gnu
+ac_cv_c_attribute=3Dyes
+ac_cv_c_bigendian=3Dno
+ac_cv_c_compiler_gnu=3Dyes
+ac_cv_c_const=3Dyes
+ac_cv_c_inline=3Dinline
+ac_cv_cxx_compiler_gnu=3Dyes
+ac_cv_env_CCC_set=3D
+ac_cv_env_CCC_value=3D
+ac_cv_env_CC_set=3D
+ac_cv_env_CC_value=3D
+ac_cv_env_CFLAGS_set=3D
+ac_cv_env_CFLAGS_value=3D
+ac_cv_env_CPPFLAGS_set=3D
+ac_cv_env_CPPFLAGS_value=3D
+ac_cv_env_CPP_set=3D
+ac_cv_env_CPP_value=3D
+ac_cv_env_CXXCPP_set=3D
+ac_cv_env_CXXCPP_value=3D
+ac_cv_env_CXXFLAGS_set=3D
+ac_cv_env_CXXFLAGS_value=3D
+ac_cv_env_CXX_set=3D
+ac_cv_env_CXX_value=3D
+ac_cv_env_F77_set=3D
+ac_cv_env_F77_value=3D
+ac_cv_env_FFLAGS_set=3D
+ac_cv_env_FFLAGS_value=3D
+ac_cv_env_LDFLAGS_set=3D
+ac_cv_env_LDFLAGS_value=3D
+ac_cv_env_LIBS_set=3D
+ac_cv_env_LIBS_value=3D
+ac_cv_env_XMKMF_set=3D
+ac_cv_env_XMKMF_value=3D
+ac_cv_env_build_alias_set=3D
+ac_cv_env_build_alias_value=3D
+ac_cv_env_host_alias_set=3D
+ac_cv_env_host_alias_value=3D
+ac_cv_env_target_alias_set=3D
+ac_cv_env_target_alias_value=3D
+ac_cv_f77_compiler_gnu=3Dyes
+ac_cv_func_accept=3Dyes
+ac_cv_func_bind=3Dyes
+ac_cv_func_close=3Dyes
+ac_cv_func_connect=3Dyes
+ac_cv_func_epoll_create=3Dyes
+ac_cv_func_execve=3Dyes
+ac_cv_func_fcntl=3Dyes
+ac_cv_func_fork=3Dyes
+ac_cv_func_fstat=3Dyes
+ac_cv_func_fsync=3Dyes
+ac_cv_func_ftruncate=3Dyes
+ac_cv_func_gethostbyname=3Dyes
+ac_cv_func_gethostbyname_r=3Dyes
+ac_cv_func_gethostname=3Dyes
+ac_cv_func_getifaddrs=3Dyes
+ac_cv_func_getloadavg=3Dyes
+ac_cv_func_getpagesize=3Dyes
+ac_cv_func_getpeername=3Dyes
+ac_cv_func_getsockname=3Dyes
+ac_cv_func_getsockopt=3Dyes
+ac_cv_func_htonl=3Dyes
+ac_cv_func_htons=3Dyes
+ac_cv_func_inet_addr=3Dyes
+ac_cv_func_inet_aton=3Dyes
+ac_cv_func_inet_pton=3Dyes
+ac_cv_func_kevent=3Dno
+ac_cv_func_kqueue=3Dno
+ac_cv_func_listen=3Dyes
+ac_cv_func_localtime_r=3Dyes
+ac_cv_func_lseek=3Dyes
+ac_cv_func_lstat=3Dyes
+ac_cv_func_madvise=3Dyes
+ac_cv_func_memset=3Dyes
+ac_cv_func_mincore=3Dyes
+ac_cv_func_mktime=3Dyes
+ac_cv_func_mmap=3Dyes
+ac_cv_func_msync=3Dyes
+ac_cv_func_munmap=3Dyes
+ac_cv_func_open=3Dyes
+ac_cv_func_pipe=3Dyes
+ac_cv_func_read=3Dyes
+ac_cv_func_readlink=3Dyes
+ac_cv_func_readv=3Dyes
+ac_cv_func_recvfrom=3Dyes
+ac_cv_func_remove=3Dyes
+ac_cv_func_select=3Dyes
+ac_cv_func_send=3Dyes
+ac_cv_func_sendto=3Dyes
+ac_cv_func_setsockopt=3Dyes
+ac_cv_func_shmat=3Dyes
+ac_cv_func_socket=3Dyes
+ac_cv_func_statvfs=3Dyes
+ac_cv_func_strerror=3Dyes
+ac_cv_func_strerror_r=3Dyes
+ac_cv_func_sysconf=3Dyes
+ac_cv_func_time=3Dyes
+ac_cv_func_which_gethostbyname_r=3Dsix
+ac_cv_func_write=3Dyes
+ac_cv_func_writev=3Dyes
+ac_cv_have_x=3D'have_x=3Dyes	ac_x_includes=3D'\'''\''	ac_x_libraries=3D'\'=
''\'''
+ac_cv_header_alsa_asoundlib_h=3Dyes
+ac_cv_header_asm_ioctls_h=3Dyes
+ac_cv_header_crt_externs_h=3Dno
+ac_cv_header_dlfcn_h=3Dyes
+ac_cv_header_dssi_h=3Dno
+ac_cv_header_fcntl_h=3Dyes
+ac_cv_header_gmp_h=3Dyes
+ac_cv_header_ifaddrs_h=3Dyes
+ac_cv_header_inttypes_h=3Dyes
+ac_cv_header_magic_h=3Dno
+ac_cv_header_memory_h=3Dyes
+ac_cv_header_net_if_h=3Dyes
+ac_cv_header_netinet_in_systm_h=3Dyes
+ac_cv_header_netinet_ip_h=3Dyes
+ac_cv_header_stdc=3Dyes
+ac_cv_header_stdint=3Dstdint.h
+ac_cv_header_stdint_h=3Dyes
+ac_cv_header_stdint_t=3Dstdint.h
+ac_cv_header_stdlib_h=3Dyes
+ac_cv_header_string_h=3Dyes
+ac_cv_header_strings_h=3Dyes
+ac_cv_header_sys_config_h=3Dno
+ac_cv_header_sys_epoll_h=3Dyes
+ac_cv_header_sys_event_h=3Dno
+ac_cv_header_sys_filio_h=3Dno
+ac_cv_header_sys_ioctl_h=3Dyes
+ac_cv_header_sys_loadavg_h=3Dno
+ac_cv_header_sys_mman_h=3Dyes
+ac_cv_header_sys_select_h=3Dyes
+ac_cv_header_sys_sockio_h=3Dno
+ac_cv_header_sys_stat_h=3Dyes
+ac_cv_header_sys_time_h=3Dyes
+ac_cv_header_sys_types_h=3Dyes
+ac_cv_header_sys_utime_h=3Dno
+ac_cv_header_time=3Dyes
+ac_cv_header_unistd_h=3Dyes
+ac_cv_header_utime_h=3Dyes
+ac_cv_host=3Dx86_64-unknown-linux-gnu
+ac_cv_lib_ICE_IceConnectionNumber=3Dyes
+ac_cv_lib_Xrandr_XRRQueryExtension=3Dyes
+ac_cv_lib_Xrender_XRenderQueryExtension=3Dyes
+ac_cv_lib_Xtst_XTestQueryExtension=3Dno
+ac_cv_lib_asound_snd_seq_open=3Dyes
+ac_cv_lib_gmp___gmpz_mul_si=3Dyes
+ac_cv_lib_magic_magic_open=3Dno
+ac_cv_lib_socket_gethostname=3Dno
+ac_cv_member_struct_tm_tm_zone=3Dyes
+ac_cv_objext=3Do
+ac_cv_path_CP=3D/bin/cp
+ac_cv_path_DATE=3D/bin/date
+ac_cv_path_EGREP=3D'/bin/grep -E'
+ac_cv_path_FIND=3D/usr/bin/find
+ac_cv_path_GREP=3D/bin/grep
+ac_cv_path_JAR=3D/usr/bin/fastjar
+ac_cv_path_MKDIR=3D/bin/mkdir
+ac_cv_path_PKG_CONFIG=3D/usr/bin/pkg-config
+ac_cv_path_ZIP=3D/usr/bin/zip
+ac_cv_path_install=3D'/usr/bin/install -c'
+ac_cv_path_mkdir=3D/bin/mkdir
+ac_cv_prog_AWK=3Dgawk
+ac_cv_prog_CPP=3D'gcc -E'
+ac_cv_prog_CXXCPP=3D'g++ -E'
+ac_cv_prog_JAVA=3Dgij
+ac_cv_prog_JAVAC=3D'ecj -warn:-deprecation,serial,unusedImport'
+ac_cv_prog_ac_ct_AR=3Dar
+ac_cv_prog_ac_ct_CC=3Dgcc
+ac_cv_prog_ac_ct_CXX=3Dg++
+ac_cv_prog_ac_ct_F77=3Dgfortran
+ac_cv_prog_ac_ct_RANLIB=3Dranlib
+ac_cv_prog_ac_ct_STRIP=3Dstrip
+ac_cv_prog_cc_c89=3D
+ac_cv_prog_cc_g=3Dyes
+ac_cv_prog_cc_gcc_c_o=3Dyes
+ac_cv_prog_cxx_g=3Dyes
+ac_cv_prog_f77_g=3Dyes
+ac_cv_prog_java_works=3Dyes
+ac_cv_prog_javac_works=3Dyes
+ac_cv_prog_make_make_set=3Dyes
+ac_cv_prog_uudecode=3Dyes
+ac_cv_prog_uudecode_base64=3Dyes
+ac_cv_search_inet_pton=3D'none required'
+ac_cv_sizeof_void_p=3D8
+ac_cv_stdint_message=3D'using gnu compiler gcc-4.8.real (Debian 4.8.2-1) 4=
=2E8.2'
+ac_cv_stdint_result=3D'(assuming C99 compatible system)'
+ac_cv_struct_tm=3Dtime.h
+ac_cv_target=3Dx86_64-unknown-linux-gnu
+acl_cv_path_LD=3D'/usr/bin/ld -m elf_x86_64'
+acl_cv_prog_gnu_ld=3Dyes
+acl_cv_rpath=3Ddone
+am_cv_CC_dependencies_compiler_type=3Dgcc3
+am_cv_CXX_dependencies_compiler_type=3Dgcc3
+am_cv_func_iconv=3Dyes
+am_cv_lib_iconv=3Dno
+am_cv_prog_tar_ustar=3Dgnutar
+am_cv_proto_iconv=3D'extern size_t iconv (iconv_t cd, char * *inbuf, size_=
t *inbytesleft, char * *outbuf, size_t *outbytesleft);'
+am_cv_proto_iconv_arg1=3D
+gcc_cv_c_gcc_attribute_supported=3Dyes
+gcc_cv_c_gcc_attribute_unused=3Dyes
+lt_cv_deplibs_check_method=3Dpass_all
+lt_cv_file_magic_cmd=3D'$MAGIC_CMD'
+lt_cv_file_magic_test_file=3D
+lt_cv_ld_reload_flag=3D-r
+lt_cv_objdir=3D.libs
+lt_cv_path_LD=3D/usr/bin/ld
+lt_cv_path_LDCXX=3D'/usr/bin/ld -m elf_x86_64'
+lt_cv_path_NM=3D'/usr/bin/nm -B'
+lt_cv_path_SED=3D/bin/sed
+lt_cv_prog_compiler_c_o=3Dyes
+lt_cv_prog_compiler_c_o_CXX=3Dyes
+lt_cv_prog_compiler_c_o_F77=3Dyes
+lt_cv_prog_compiler_pic_works=3Dyes
+lt_cv_prog_compiler_pic_works_CXX=3Dyes
+lt_cv_prog_compiler_pic_works_F77=3Dyes
+lt_cv_prog_compiler_rtti_exceptions=3Dno
+lt_cv_prog_compiler_static_works=3Dyes
+lt_cv_prog_compiler_static_works_CXX=3Dyes
+lt_cv_prog_compiler_static_works_F77=3Dyes
+lt_cv_prog_gnu_ld=3Dyes
+lt_cv_prog_gnu_ldcxx=3Dyes
+lt_cv_sys_global_symbol_pipe=3D'sed -n -e '\''s/^.*[ 	]\([ABCDGIRSTW][ABCD=
GIRSTW]*\)[ 	][ 	]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p'\'''
+lt_cv_sys_global_symbol_to_c_name_address=3D'sed -n -e '\''s/^: \([^ ]*\) =
$/  {\"\1\", (lt_ptr) 0},/p'\'' -e '\''s/^[BCDEGRST] \([^ ]*\) \([^ ]*\)$/ =
 {"\2", (lt_ptr) \&\2},/p'\'''
+lt_cv_sys_global_symbol_to_cdecl=3D'sed -n -e '\''s/^. .* \(.*\)$/extern i=
nt \1;/p'\'''
+lt_cv_sys_lib_dlsearch_path_spec=3D'/lib /usr/lib /lib/i386-linux-gnu /usr=
/lib/i386-linux-gnu /lib/i486-linux-gnu /usr/lib/i486-linux-gnu /usr/local/=
lib /lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu /lib32 /usr/lib32 /libx=
32 /usr/libx32 '
+lt_cv_sys_lib_search_path_spec=3D'/usr/lib/gcc/x86_64-linux-gnu/4.8 /usr/l=
ib/x86_64-linux-gnu /usr/lib /lib/x86_64-linux-gnu /lib'
+lt_cv_sys_max_cmd_len=3D1572864
+lt_lt_cv_prog_compiler_c_o=3D'"yes"'
+lt_lt_cv_prog_compiler_c_o_CXX=3D'"yes"'
+lt_lt_cv_prog_compiler_c_o_F77=3D'"yes"'
+lt_lt_cv_sys_global_symbol_pipe=3D'"sed -n -e '\''s/^.*[ 	]\\([ABCDGIRSTW]=
[ABCDGIRSTW]*\\)[ 	][ 	]*\\([_A-Za-z][_A-Za-z0-9]*\\)\$/\\1 \\2 \\2/p'\''"'
+lt_lt_cv_sys_global_symbol_to_c_name_address=3D'"sed -n -e '\''s/^: \\([^ =
]*\\) \$/  {\\\"\\1\\\", (lt_ptr) 0},/p'\'' -e '\''s/^[BCDEGRST] \\([^ ]*\\=
) \\([^ ]*\\)\$/  {\"\\2\", (lt_ptr) \\&\\2},/p'\''"'
+lt_lt_cv_sys_global_symbol_to_cdecl=3D'"sed -n -e '\''s/^. .* \\(.*\\)\$/e=
xtern int \\1;/p'\''"'
+
+## ----------------- ##
+## Output variables. ##
+## ----------------- ##
+
+ACLOCAL=3D'${SHELL} /home/afong/foo/classpath-0.98/missing --run aclocal-1=
=2E10'
+AMDEPBACKSLASH=3D'\'
+AMDEP_FALSE=3D'#'
+AMDEP_TRUE=3D''
+AMTAR=3D'${SHELL} /home/afong/foo/classpath-0.98/missing --run tar'
+ANTLR=3D'gij -classpath /usr/share/java/antlr.jar antlr.Tool'
+ANTLR_JAR=3D'/usr/share/java/antlr.jar'
+AR=3D'ar'
+AUTOCONF=3D'${SHELL} /home/afong/foo/classpath-0.98/missing --run autoconf'
+AUTOHEADER=3D'${SHELL} /home/afong/foo/classpath-0.98/missing --run autohe=
ader'
+AUTOMAKE=3D'${SHELL} /home/afong/foo/classpath-0.98/missing --run automake=
-1.10'
+AWK=3D'gawk'
+BUILD_CLASS_FILES_FALSE=3D''
+BUILD_CLASS_FILES_TRUE=3D'#'
+CAIRO_CFLAGS=3D'-I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x8=
6_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/free=
type2 -I/usr/include/libpng12 -I/usr/include/libdrm  '
+CAIRO_LIBS=3D'-lcairo  '
+CC=3D'gcc'
+CCDEPMODE=3D'depmode=3Dgcc3'
+CFLAGS=3D'-g -O2'
+CLASSPATH_CONVENIENCE=3D'-no-undefined'
+CLASSPATH_INCLUDES=3D'-I$(top_srcdir)/include -I$(top_srcdir)/native/jni/c=
lasspath -I$(top_srcdir)/native/jni/native-lib'
+CLASSPATH_MODULE=3D'-module -version-info 0:0:0 -no-undefined'
+COLLECTIONS_PREFIX=3D''
+CP=3D'/bin/cp'
+CPP=3D'gcc -E'
+CPPFLAGS=3D''
+CREATE_ALSA_LIBRARIES_FALSE=3D'#'
+CREATE_ALSA_LIBRARIES_TRUE=3D''
+CREATE_API_DOCS_FALSE=3D''
+CREATE_API_DOCS_TRUE=3D'#'
+CREATE_COLLECTIONS_FALSE=3D''
+CREATE_COLLECTIONS_TRUE=3D'#'
+CREATE_CORE_JNI_LIBRARIES_FALSE=3D'#'
+CREATE_CORE_JNI_LIBRARIES_TRUE=3D''
+CREATE_DSSI_LIBRARIES_FALSE=3D''
+CREATE_DSSI_LIBRARIES_TRUE=3D'#'
+CREATE_GCONF_PEER_LIBRARIES_FALSE=3D'#'
+CREATE_GCONF_PEER_LIBRARIES_TRUE=3D''
+CREATE_GJDOC_FALSE=3D'#'
+CREATE_GJDOC_PARSER_FALSE=3D'#'
+CREATE_GJDOC_PARSER_TRUE=3D''
+CREATE_GJDOC_TRUE=3D''
+CREATE_GMPBI_LIBRARY_FALSE=3D'#'
+CREATE_GMPBI_LIBRARY_TRUE=3D''
+CREATE_GSTREAMER_PEER_LIBRARIES_FALSE=3D''
+CREATE_GSTREAMER_PEER_LIBRARIES_TRUE=3D'#'
+CREATE_GTK_PEER_LIBRARIES_FALSE=3D'#'
+CREATE_GTK_PEER_LIBRARIES_TRUE=3D''
+CREATE_JNI_HEADERS_FALSE=3D''
+CREATE_JNI_HEADERS_TRUE=3D'#'
+CREATE_JNI_LIBRARIES_FALSE=3D'#'
+CREATE_JNI_LIBRARIES_TRUE=3D''
+CREATE_PLUGIN_FALSE=3D''
+CREATE_PLUGIN_TRUE=3D'#'
+CREATE_QT_PEER_LIBRARIES_FALSE=3D''
+CREATE_QT_PEER_LIBRARIES_TRUE=3D'#'
+CREATE_WRAPPERS_FALSE=3D''
+CREATE_WRAPPERS_TRUE=3D'#'
+CREATE_XMLJ_LIBRARY_FALSE=3D''
+CREATE_XMLJ_LIBRARY_TRUE=3D'#'
+CXX=3D'g++'
+CXXCPP=3D'g++ -E'
+CXXDEPMODE=3D'depmode=3Dgcc3'
+CXXFLAGS=3D'-g -O2'
+CYGPATH_W=3D'echo'
+DATE=3D'/bin/date'
+DEFAULT_PREFS_PEER=3D'gnu.java.util.prefs.GConfBasedFactory'
+DEFS=3D'-DHAVE_CONFIG_H'
+DEPDIR=3D'.deps'
+DSYMUTIL=3D''
+ECHO=3D'echo'
+ECHO_C=3D''
+ECHO_N=3D'-n'
+ECHO_T=3D''
+ECJ_JAR=3D''
+EGREP=3D'/bin/grep -E'
+ENABLE_LOCAL_SOCKETS_FALSE=3D''
+ENABLE_LOCAL_SOCKETS_TRUE=3D'#'
+ERROR_CFLAGS=3D''
+EXAMPLESDIR=3D'examples'
+EXEEXT=3D''
+EXTRA_CFLAGS=3D'-fexceptions -fasynchronous-unwind-tables'
+F77=3D'gfortran'
+FFLAGS=3D'-g -O2'
+FIND=3D'/usr/bin/find'
+FREETYPE2_CFLAGS=3D'-I/usr/include/freetype2  '
+FREETYPE2_LIBS=3D'-lfreetype  '
+GCJ_JAVAC_FALSE=3D''
+GCJ_JAVAC_TRUE=3D'#'
+GCONF_CFLAGS=3D'-pthread -I/usr/include/gconf/2 -I/usr/include/dbus-1.0 -I=
/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/glib-2.0 -I/usr/l=
ib/x86_64-linux-gnu/glib-2.0/include  '
+GCONF_LIBS=3D'-lgconf-2 -lglib-2.0  '
+GDK_CFLAGS=3D'-pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/=
gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/freetype2 -I/us=
r/include/cairo -I/usr/include/pango-1.0 -I/usr/include/gdk-pixbuf-2.0 -I/u=
sr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/inc=
lude/pixman-1 -I/usr/include/libpng12 -I/usr/include/libdrm  '
+GDK_LIBS=3D'-lgdk-x11-2.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lpango-1.0 -l=
cairo -lgobject-2.0 -lglib-2.0  '
+GJDOC=3D''
+GLIB_CFLAGS=3D''
+GLIB_LIBS=3D''
+GMP_CFLAGS=3D'-I/usr/include'
+GMP_LIBS=3D'-lgmp'
+GREP=3D'/bin/grep'
+GSTREAMER_BASE_CFLAGS=3D''
+GSTREAMER_BASE_LIBS=3D''
+GSTREAMER_CFLAGS=3D''
+GSTREAMER_FILE_READER=3D''
+GSTREAMER_LIBS=3D''
+GSTREAMER_MIXER_PROVIDER=3D''
+GSTREAMER_PLUGINS_BASE_CFLAGS=3D''
+GSTREAMER_PLUGINS_BASE_LIBS=3D''
+GST_PLUGIN_LDFLAGS=3D''
+GTK_CFLAGS=3D'-pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/=
gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/=
gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr=
/include/freetype2 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib=
-2.0/include -I/usr/include/pixman-1 -I/usr/include/libpng12 -I/usr/include=
/libdrm -I/usr/include/harfbuzz  '
+GTK_LIBS=3D'-pthread -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpan=
goft2-1.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfontconfig -lfreetype -lgt=
hread-2.0 -lgdk_pixbuf-2.0 -lgobject-2.0 -lglib-2.0  '
+INIT_LOAD_LIBRARY=3D'true'
+INSTALL_CLASS_FILES_FALSE=3D''
+INSTALL_CLASS_FILES_TRUE=3D'#'
+INSTALL_DATA=3D'${INSTALL} -m 644'
+INSTALL_GLIBJ_ZIP_FALSE=3D'#'
+INSTALL_GLIBJ_ZIP_TRUE=3D''
+INSTALL_PROGRAM=3D'${INSTALL}'
+INSTALL_SCRIPT=3D'${INSTALL}'
+INSTALL_STRIP_PROGRAM=3D'$(install_sh) -c -s'
+JAR=3D'/usr/bin/fastjar'
+JAVA=3D'gij'
+JAVAC=3D'ecj -warn:-deprecation,serial,unusedImport'
+JAVAC_IS_GCJ=3D''
+JAVAC_MEM_OPT=3D'-J-Xmx768M'
+JAVA_LANG_SYSTEM_EXPLICIT_INITIALIZATION=3D'false'
+JAY=3D''
+JAY_SKELETON=3D''
+LDFLAGS=3D''
+LIBDEBUG=3D'false'
+LIBICONV=3D''
+LIBMAGIC=3D''
+LIBOBJS=3D''
+LIBS=3D''
+LIBTOOL=3D'$(SHELL) $(top_builddir)/libtool'
+LIBVERSION=3D'0:0:0'
+LN_S=3D'ln -s'
+LTLIBICONV=3D''
+LTLIBOBJS=3D''
+MAINT=3D'#'
+MAINTAINER_MODE_FALSE=3D''
+MAINTAINER_MODE_TRUE=3D'#'
+MAKEINFO=3D'${SHELL} /home/afong/foo/classpath-0.98/missing --run makeinfo'
+MKDIR=3D'/bin/mkdir'
+MKDIR_P=3D'/bin/mkdir -p'
+MOC=3D''
+MOZILLA_CFLAGS=3D''
+MOZILLA_LIBS=3D''
+NMEDIT=3D''
+OBJEXT=3D'o'
+PACKAGE=3D'classpath'
+PACKAGE_BUGREPORT=3D'classpath@gnu.org'
+PACKAGE_NAME=3D'GNU Classpath'
+PACKAGE_STRING=3D'GNU Classpath 0.98'
+PACKAGE_TARNAME=3D'classpath'
+PACKAGE_VERSION=3D'0.98'
+PANGOFT2_CFLAGS=3D'-pthread -I/usr/include/pango-1.0 -I/usr/include/harfbu=
zz -I/usr/include/freetype2 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux=
-gnu/glib-2.0/include  '
+PANGOFT2_LIBS=3D'-lpangoft2-1.0 -lpango-1.0 -lfontconfig -lgobject-2.0 -lg=
lib-2.0 -lfreetype  '
+PATH_SEPARATOR=3D':'
+PATH_TO_ESCHER=3D''
+PATH_TO_GLIBJ_ZIP=3D''
+PERL=3D''
+PKG_CONFIG=3D'/usr/bin/pkg-config'
+PLUGIN_DIR=3D''
+QT_CFLAGS=3D''
+QT_LIBS=3D''
+RANLIB=3D'ranlib'
+REGEN_PARSERS_FALSE=3D''
+REGEN_PARSERS_TRUE=3D'#'
+REMOVE=3D''
+SED=3D'/bin/sed'
+SET_MAKE=3D''
+SHELL=3D'/bin/sh'
+STRICT_WARNING_CFLAGS=3D'-Wstrict-prototypes -pedantic'
+STRIP=3D'strip'
+TOOLSDIR=3D'tools'
+USER_JAVAH=3D''
+USE_ESCHER_FALSE=3D''
+USE_ESCHER_TRUE=3D'#'
+USE_PREBUILT_GLIBJ_ZIP_FALSE=3D''
+USE_PREBUILT_GLIBJ_ZIP_TRUE=3D'#'
+VERSION=3D'0.98'
+WANT_NATIVE_BIG_INTEGER=3D'true'
+WARNING_CFLAGS=3D'-W -Wall -Wmissing-declarations -Wwrite-strings -Wmissin=
g-prototypes -Wno-long-long'
+WITH_JAR_FALSE=3D'#'
+WITH_JAR_TRUE=3D''
+XMKMF=3D''
+XML_CFLAGS=3D''
+XML_LIBS=3D''
+XSLT_CFLAGS=3D''
+XSLT_LIBS=3D''
+XTEST_LIBS=3D''
+X_CFLAGS=3D''
+X_EXTRA_LIBS=3D' -lXrender -lXrandr'
+X_LIBS=3D''
+X_PRE_LIBS=3D' -lSM -lICE'
+ZIP=3D'/usr/bin/zip'
+ac_ct_ANTLR=3D''
+ac_ct_CC=3D'gcc'
+ac_ct_CXX=3D'g++'
+ac_ct_F77=3D'gfortran'
+am__fastdepCC_FALSE=3D'#'
+am__fastdepCC_TRUE=3D''
+am__fastdepCXX_FALSE=3D'#'
+am__fastdepCXX_TRUE=3D''
+am__include=3D'include'
+am__isrc=3D''
+am__leading_dot=3D'.'
+am__quote=3D''
+am__tar=3D'tar --format=3Dustar -chf - "$$tardir"'
+am__untar=3D'tar -xf -'
+bindir=3D'${exec_prefix}/bin'
+build=3D'x86_64-unknown-linux-gnu'
+build_alias=3D''
+build_cpu=3D'x86_64'
+build_os=3D'linux-gnu'
+build_vendor=3D'unknown'
+datadir=3D'${datarootdir}'
+datarootdir=3D'${prefix}/share'
+default_toolkit=3D'gnu.java.awt.peer.gtk.GtkToolkit'
+docdir=3D'${datarootdir}/doc/${PACKAGE_TARNAME}'
+dvidir=3D'${docdir}'
+exec_prefix=3D'${prefix}'
+glibjdir=3D'${datadir}/${PACKAGE}'
+host=3D'x86_64-unknown-linux-gnu'
+host_alias=3D''
+host_cpu=3D'x86_64'
+host_os=3D'linux-gnu'
+host_vendor=3D'unknown'
+htmldir=3D'${docdir}'
+includedir=3D'${prefix}/include'
+infodir=3D'${datarootdir}/info'
+install_sh=3D'$(SHELL) /home/afong/foo/classpath-0.98/install-sh'
+libdir=3D'${exec_prefix}/lib'
+libexecdir=3D'${exec_prefix}/libexec'
+localedir=3D'${datarootdir}/locale'
+localstatedir=3D'${prefix}/var'
+mandir=3D'${datarootdir}/man'
+mkdir_p=3D'/bin/mkdir -p'
+nativeexeclibdir=3D'${libdir}/${PACKAGE}'
+oldincludedir=3D'/usr/include'
+pdfdir=3D'${docdir}'
+prefix=3D'/usr/local/classpath'
+program_transform_name=3D's,x,x,'
+psdir=3D'${docdir}'
+sbindir=3D'${exec_prefix}/sbin'
+sharedstatedir=3D'${prefix}/com'
+sysconfdir=3D'${prefix}/etc'
+target=3D'x86_64-unknown-linux-gnu'
+target_alias=3D''
+target_cpu=3D'x86'
+target_os=3D'linux-gnu'
+target_vendor=3D'unknown'
+uudecode=3D'yes'
+vm_classes=3D'${top_srcdir}/vm/reference'
+
+## ----------- ##
+## confdefs.h. ##
+## ----------- ##
+
+#define PACKAGE_NAME "GNU Classpath"
+#define PACKAGE_TARNAME "classpath"
+#define PACKAGE_VERSION "0.98"
+#define PACKAGE_STRING "GNU Classpath 0.98"
+#define PACKAGE_BUGREPORT "classpath@gnu.org"
+#define PACKAGE "classpath"
+#define VERSION "0.98"
+#define STDC_HEADERS 1
+#define HAVE_SYS_TYPES_H 1
+#define HAVE_SYS_STAT_H 1
+#define HAVE_STDLIB_H 1
+#define HAVE_STRING_H 1
+#define HAVE_MEMORY_H 1
+#define HAVE_STRINGS_H 1
+#define HAVE_INTTYPES_H 1
+#define HAVE_STDINT_H 1
+#define HAVE_UNISTD_H 1
+#define HAVE_ALSA_ASOUNDLIB_H 1
+#define HAVE_DLFCN_H 1
+#define HAVE_GNUC25_ATTRIB /**/
+#define HAVE_GNUC25_UNUSED /**/
+#define STDC_HEADERS 1
+#define SIZEOF_VOID_P 8
+#define BYTEORDER 1234
+#define HAVE_UNISTD_H 1
+#define HAVE_SYS_TYPES_H 1
+#define HAVE_SYS_IOCTL_H 1
+#define HAVE_ASM_IOCTLS_H 1
+#define HAVE_INTTYPES_H 1
+#define HAVE_STDINT_H 1
+#define HAVE_UTIME_H 1
+#define HAVE_SYS_TIME_H 1
+#define HAVE_SYS_SELECT_H 1
+#define HAVE_FCNTL_H 1
+#define HAVE_SYS_MMAN_H 1
+#define HAVE_SYS_EPOLL_H 1
+#define HAVE_IFADDRS_H 1
+#define HAVE_NETINET_IN_SYSTM_H 1
+#define HAVE_NETINET_IP_H 1
+#define HAVE_NET_IF_H 1
+#define HAVE_INT32_DEFINED 1
+#define HAVE_INT32_DEFINED 1
+#define HAVE_BSD_INT32_DEFINED 1
+#define HAVE_FTRUNCATE 1
+#define HAVE_FSYNC 1
+#define HAVE_SELECT 1
+#define HAVE_GETHOSTNAME 1
+#define HAVE_SOCKET 1
+#define HAVE_STRERROR 1
+#define HAVE_FORK 1
+#define HAVE_PIPE 1
+#define HAVE_EXECVE 1
+#define HAVE_OPEN 1
+#define HAVE_CLOSE 1
+#define HAVE_LSEEK 1
+#define HAVE_FSTAT 1
+#define HAVE_READ 1
+#define HAVE_READV 1
+#define HAVE_WRITE 1
+#define HAVE_WRITEV 1
+#define HAVE_HTONL 1
+#define HAVE_MEMSET 1
+#define HAVE_HTONS 1
+#define HAVE_CONNECT 1
+#define HAVE_GETSOCKNAME 1
+#define HAVE_GETPEERNAME 1
+#define HAVE_BIND 1
+#define HAVE_LISTEN 1
+#define HAVE_ACCEPT 1
+#define HAVE_RECVFROM 1
+#define HAVE_SEND 1
+#define HAVE_SENDTO 1
+#define HAVE_SETSOCKOPT 1
+#define HAVE_GETSOCKOPT 1
+#define HAVE_TIME 1
+#define HAVE_MKTIME 1
+#define HAVE_GETHOSTBYNAME_R 1
+#define HAVE_LOCALTIME_R 1
+#define HAVE_STRERROR_R 1
+#define HAVE_FCNTL 1
+#define HAVE_STATVFS 1
+#define HAVE_MMAP 1
+#define HAVE_MUNMAP 1
+#define HAVE_MINCORE 1
+#define HAVE_MSYNC 1
+#define HAVE_MADVISE 1
+#define HAVE_GETPAGESIZE 1
+#define HAVE_SYSCONF 1
+#define HAVE_LSTAT 1
+#define HAVE_READLINK 1
+#define HAVE_INET_ATON 1
+#define HAVE_INET_ADDR 1
+#define HAVE_INET_PTON 1
+#define HAVE_GETIFADDRS 1
+#define HAVE_EPOLL_CREATE 1
+#define HAVE_GETLOADAVG 1
+#define HAVE_INET6 1
+#define TIME_WITH_SYS_TIME 1
+#define HAVE_STRUCT_TM_TM_ZONE 1
+#define HAVE_TM_ZONE 1
+#define STRUCT_TM_HAS_GMTOFF 1
+#define HAVE_FUNC_GETHOSTBYNAME_R_6 1
+#define HAVE_ICONV 1
+#define ICONV_CONST=20
+#define HAVE_XRENDER 1
+#define HAVE_XRANDR 1
+#define HAVE_MSG_NOSIGNAL 1
+#define HAVE_MSG_WAITALL 1
+#define HAVE_GMP_H 1
+#define WITH_GNU_MP 1
+
+configure: exit 0
diff --git a/recipes-core/classpath/classpath-0.98/fix-gmp.patch b/recipes-=
core/classpath/classpath-0.98/fix-gmp.patch
new file mode 100644
index 0000000..83da24c
--- a/dev/null
+++ b/recipes-core/classpath/classpath-0.98/fix-gmp.patch
@@ -0,0 +1,23 @@
+Backported from classpath-native uprev to 0.99 commit=20
+ea76b80108b4c292379e37e01cdbb9d984d74759
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- classpath-0.98.orig/configure.ac
++++ classpath-0.98/configure.ac
+@@ -766,11 +766,11 @@ if test "x${COMPILE_JNI}" =3D xyes; then
+   dnl __gmpz_mul_si for earlier versions (>=3D 3.1).
+   dnl IMPORTANT: if you decide to look for __gmpz_combit, don't forget to
+   dnl change the name of the corresponding ac_ variable on lines 860...
+   if test "x${COMPILE_GMP}" =3D xyes; then
+     AC_CHECK_LIB(gmp, __gmpz_mul_si,
+-      [GMP_CFLAGS=3D-I/usr/include
++      [GMP_CFLAGS=3D
+        GMP_LIBS=3D-lgmp ],
+       [GMP_CFLAGS=3D
+        GMP_LIBS=3D ])
+     AC_SUBST(GMP_CFLAGS)
+     AC_SUBST(GMP_LIBS)
diff --git a/recipes-core/classpath/classpath-0.98/glibj.zip b/recipes-core=
/classpath/classpath-0.98/glibj.zip
new file mode 100644
index 0000000..6bf816c
--- a/dev/null
+++ b/recipes-core/classpath/classpath-0.98/glibj.zip
Binary files differ
diff --git a/recipes-core/classpath/classpath-0.98/miscompilation.patch b/r=
ecipes-core/classpath/classpath-0.98/miscompilation.patch
new file mode 100644
index 0000000..7086de3
--- a/dev/null
+++ b/recipes-core/classpath/classpath-0.98/miscompilation.patch
@@ -0,0 +1,19 @@
+Backported from classpath-native uprev to 0.99 commit
+ea76b80108b4c292379e37e01cdbb9d984d74759
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+---
+ native/jni/java-io/java_io_VMFile.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/native/jni/java-io/java_io_VMFile.c
++++ b/native/jni/java-io/java_io_VMFile.c
+@@ -442,7 +442,7 @@
+ {
+ #ifndef WITHOUT_FILESYSTEM
+   const char *filename;
+-  int result;
++  volatile int result;
+=20
+   /* Don't use the JCL convert function because it throws an exception
+      on failure */
diff --git a/recipes-core/classpath/classpath-0.98/use_libdir.patch b/recip=
es-core/classpath/classpath-0.98/use_libdir.patch
new file mode 100644
index 0000000..b8ac3c9
--- a/dev/null
+++ b/recipes-core/classpath/classpath-0.98/use_libdir.patch
@@ -0,0 +1,22 @@
+Backported from classpath-native fix commit id
+bcd5a1f3e83f9fffacdd72bc54424d5b7d62bf56
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+--
+ Makefile.am |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: classpath-0.98/resource/Makefile.am
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- classpath-0.98.orig/resource/Makefile.am
++++ classpath-0.98/resource/Makefile.am
+@@ -1,7 +1,7 @@
+ ## used by automake to generate Makefile.in
+=20
+ logging_DATA =3D java/util/logging/logging.properties
+-loggingdir =3D $(prefix)/lib
++loggingdir =3D $(libdir)
+=20
+ security_DATA =3D java/security/classpath.security
+-securitydir =3D $(prefix)/lib/security
++securitydir =3D $(libdir)/security
diff --git a/recipes-core/classpath/classpath-initial_0.98.bb b/recipes-cor=
e/classpath/classpath-initial_0.98.bb
new file mode 100644
index 0000000..db1e101
--- a/dev/null
+++ b/recipes-core/classpath/classpath-initial_0.98.bb
@@ -0,0 +1,47 @@
+DESCRIPTION=3D"GNU Classpath using a prebuilt glibj.zip that is used as bo=
otclasspath for jamvm."
+HOMEPAGE =3D "http://www.gnu.org/software/classpath/"
+
+LICENSE =3D "GPL-2.0 & SAX-PD"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Daf0004801732bc4b20d90f351cf8051=
0"
+
+SRC_URI =3D "${GNU_MIRROR}/classpath/classpath-${PV}.tar.gz"
+
+inherit autotools native gettext
+
+PR =3D "r0"
+
+SRC_URI +=3D " \
+	    file://glibj.zip;unpack=3Dno \
+	    file://autotools.patch \
+	    file://fix-gmp.patch \
+	    file://miscompilation.patch \
+	    file://use_libdir.patch \
+	   "
+
+EXTRA_OECONF =3D " \
+                --with-glibj-zip=3D${WORKDIR}/glibj.zip \
+		GCJ_JAVAC_FALSE=3D"yes" \
+		--disable-tools \
+                --disable-Werror \
+                --disable-local-sockets \
+                --disable-alsa \
+                --disable-gconf-peer \
+                --disable-gtk-peer \
+                --disable-plugin \
+                --disable-dssi \
+                --disable-examples \
+                --with-glibj-dir=3D${STAGING_DATADIR_NATIVE}/classpath-ini=
tial \
+                --with-native-libdir=3D${STAGING_LIBDIR_NATIVE}/classpath-=
initial \
+                --includedir=3D${STAGING_INCDIR_NATIVE}/classpath-initial \
+                --with-vm=3Djava \
+              "
+
+# remove files clashing with classpath-native in sysroot
+do_install_append() {
+	rm ${D}${libdir}/logging.properties
+	rm ${D}${libdir}/security/classpath.security
+	rm -rf ${D}/${datadir}/man ${D}/${datadir}/info
+}
+SRC_URI[md5sum] =3D "90c6571b8b0309e372faa0f9f6255ea9"
+SRC_URI[sha256sum] =3D "501b5acd4dff79b6100da22cef15080f31071821ce3cea6f1b=
739bc1b56fac3f"
+
diff --git a/recipes-core/jamvm/files/jamvm_1.5.4-initial.patch b/recipes-c=
ore/jamvm/files/jamvm_1.5.4-initial.patch
new file mode 100644
index 0000000..c73f042
--- a/dev/null
+++ b/recipes-core/jamvm/files/jamvm_1.5.4-initial.patch
@@ -0,0 +1,79 @@
+---
+ configure.ac    |    2 +-
+ java-initial    |    5 +++++
+ lib/Makefile.am |    2 +-
+ src/Makefile.am |    2 +-
+ src/class.h     |    8 ++++----
+ src/dll.c       |    2 +-
+ 6 files changed, 13 insertions(+), 8 deletions(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,7 +22,7 @@
+ dnl Process this file with autoconf to produce a configure script.
+=20
+ AC_INIT(src/jam.c)
+-AM_INIT_AUTOMAKE(jamvm, 1.5.4)
++AM_INIT_AUTOMAKE(jamvm-initial, 1.5.4)
+ AC_CONFIG_HEADERS([src/config.h])
+ AC_PREFIX_DEFAULT(/usr/local/jamvm)
+=20
+--- /dev/null
++++ b/java-initial
+@@ -0,0 +1,5 @@
++#!/bin/sh
++#
++# Wrapper script inspired by the one provided by cacao.
++
++exec jamvm-initial ${1+"$@"}
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -19,7 +19,7 @@
+ ## Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, US=
A.
+ ##
+=20
+-CP_LIB_DIR =3D ${with_classpath_install_dir}/share/classpath
++CP_LIB_DIR =3D ${with_classpath_install_dir}/share/classpath-initial
+ GLIBJ_ZIP  =3D ${CP_LIB_DIR}/glibj.zip
+=20
+ SUBDIRS =3D jamvm java gnu sun
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -23,7 +23,7 @@
+ DIST_SUBDIRS =3D os arch interp
+=20
+ bin_PROGRAMS =3D jamvm
+-include_HEADERS =3D jni.h
++noinst_HEADERS =3D jni.h
+=20
+ lib_LTLIBRARIES =3D libjvm.la
+ noinst_LTLIBRARIES =3D libcore.la
+--- a/src/class.h
++++ b/src/class.h
+@@ -39,11 +39,11 @@
+    separate class files in a directory structure */
+=20
+ #ifdef USE_ZIP
+-#define JAMVM_CLASSES INSTALL_DIR"/share/jamvm/classes.zip"
+-#define CLASSPATH_CLASSES CLASSPATH_INSTALL_DIR"/share/classpath/glibj.zi=
p"
++#define JAMVM_CLASSES CLASSPATH_INSTALL_DIR"/share/jamvm-initial/classes.=
zip"
++#define CLASSPATH_CLASSES CLASSPATH_INSTALL_DIR"/share/classpath-initial/=
glibj.zip"
+ #else
+-#define JAMVM_CLASSES INSTALL_DIR"/share/jamvm/classes"
+-#define CLASSPATH_CLASSES CLASSPATH_INSTALL_DIR"/share/classpath"
++#define JAMVM_CLASSES CLASSPATH_INSTALL_DIR"/share/jamvm-initial/classes"
++#define CLASSPATH_CLASSES CLASSPATH_INSTALL_DIR"/share/classpath-initial"
+ #endif
+=20
+ #define DFLT_BCP JAMVM_CLASSES":"CLASSPATH_CLASSES
+--- a/src/dll.c
++++ b/src/dll.c
+@@ -330,7 +330,7 @@
+ }
+=20
+ char *getBootDllPath() {
+-    return CLASSPATH_INSTALL_DIR"/lib/classpath";
++    return CLASSPATH_INSTALL_DIR"/lib/classpath-initial";
+ }
+=20
+ char *getDllName(char *name) {
diff --git a/recipes-core/jamvm/jamvm-initial_1.5.4.bb b/recipes-core/jamvm=
/jamvm-initial_1.5.4.bb
new file mode 100644
index 0000000..d662781
--- a/dev/null
+++ b/recipes-core/jamvm/jamvm-initial_1.5.4.bb
@@ -0,0 +1,39 @@
+SUMMARY =3D "A compact Java Virtual Machine which conforms to the JVM spec=
ification version 2."
+HOMEPAGE =3D "http://jamvm.sourceforge.net/"
+LICENSE =3D "GPL-2.0"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb=
3"
+
+
+SRC_URI[md5sum] =3D "7654e9657691f5f09c4f481ed4686176"
+SRC_URI[sha256sum] =3D "7865693698bc4322cabe1014a4b7ebdec1bc1daf45f1a4457b=
6e908a4446b124"
+
+DEPENDS =3D "zlib-native classpath-initial libffi-native"
+
+PR =3D "r0"
+
+PROVIDES =3D "virtual/java-initial"
+
+S =3D "${WORKDIR}/jamvm-${PV}"
+
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.tar.gz \
+          file://jamvm_${PV}-initial.patch;patch=3D1;pnum=3D1 \
+          "
+
+# This uses 32 bit arm, so force the instruction set to arm, not thumb
+ARM_INSTRUCTION_SET =3D "arm"
+
+inherit native autotools
+
+# libdir must be modified so that jamvm-initial and -native
+# do not interfere
+EXTRA_OECONF =3D "\
+  --with-classpath-install-dir=3D${prefix} \
+  --program-suffix=3D-initial \
+  --libdir=3D${STAGING_LIBDIR}/jamvm-initial \
+  "
+
+do_install_append() {
+  install -d ${D}/${STAGING_BINDIR}
+  install -m 0755 java-initial ${D}/${STAGING_BINDIR}
+}
--
cgit v0.8.3.5

