Received: from 29.mail-out.ovh.net ([87.98.216.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PQr88-0006XW-D2
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Dec 2010 01:46:38 +0100
Received: (qmail 26177 invoked by uid 503); 10 Dec 2010 01:00:15 -0000
Received: from b6.ovh.net (HELO mail645.ha.ovh.net) (213.186.33.56)
	by 29.mail-out.ovh.net with SMTP; 10 Dec 2010 01:00:14 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 10 Dec 2010 02:49:10 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 10 Dec 2010 02:49:09 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Dec 2010 01:44:19 +0100
Message-Id: <1291941859-29257-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8720376254316064073
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 87.98.216.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gcc: introduce version 4.5.2
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
X-List-Received-Date: Fri, 10 Dec 2010 00:46:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

- based on gcc-4.5.2-RC-20101208 (svn 167585)
- without linaro patches (which seem to be the root of
problems when compiling at least on armv4 and armv5) :
	- samba 3.2.15 or 3.3.9 : http://tinderbox.openembedded.net/public/logs/task/8666826.txt
	- samba 3.5.6 : http://pastebin.com/yuiYX2CM

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/gcc/gcc-4.5.2.inc                          |   65 +++++++
 recipes/gcc/gcc-4.5.2/100-uclibc-conf.patch        |   37 ++++
 recipes/gcc/gcc-4.5.2/Makefile.in.patch            |   30 ++++
 recipes/gcc/gcc-4.5.2/arm-bswapsi2.patch           |   13 ++
 recipes/gcc/gcc-4.5.2/cache-amnesia.patch          |   31 ++++
 .../gcc/gcc-4.5.2/fortran-cross-compile-hack.patch |   30 ++++
 .../gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch          |   31 ++++
 .../gcc-4.5.2/gcc-armv4-pass-fix-v4bx-to-ld.patch  |   29 ++++
 recipes/gcc/gcc-4.5.2/gcc-flags-for-build.patch    |  178 ++++++++++++++++++++
 .../gcc-4.5.2/gcc-scalar-widening-pr45847.patch    |   63 +++++++
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |   67 ++++++++
 .../libstdc++-emit-__cxa_end_cleanup-in-text.patch |   40 +++++
 recipes/gcc/gcc-4.5.2/mips64-nomultilib.patch      |   52 ++++++
 recipes/gcc/gcc-4.5.2/zecke-no-host-includes.patch |   31 ++++
 recipes/gcc/gcc-4.5.2/zecke-xgcc-cpp.patch         |   28 +++
 recipes/gcc/gcc-cross-initial_4.5.2.bb             |    2 +
 recipes/gcc/gcc-cross-intermediate_4.5.2.bb        |    2 +
 recipes/gcc/gcc-cross-sdk_4.5.2.bb                 |    8 +
 recipes/gcc/gcc-cross_4.5.2.bb                     |   12 ++
 recipes/gcc/gcc_4.5.2.bb                           |   15 ++
 20 files changed, 764 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gcc/gcc-4.5.2.inc
 create mode 100644 recipes/gcc/gcc-4.5.2/100-uclibc-conf.patch
 create mode 100644 recipes/gcc/gcc-4.5.2/Makefile.in.patch
 create mode 100644 recipes/gcc/gcc-4.5.2/arm-bswapsi2.patch
 create mode 100644 recipes/gcc/gcc-4.5.2/cache-amnesia.patch
 create mode 100644 recipes/gcc/gcc-4.5.2/fortran-cross-compile-hack.patch
 create mode 100644 recipes/gcc/gcc-4.5.2/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 recipes/gcc/gcc-4.5.2/gcc-armv4-pass-fix-v4bx-to-ld.patch
 create mode 100644 recipes/gcc/gcc-4.5.2/gcc-flags-for-build.patch
 create mode 100644 recipes/gcc/gcc-4.5.2/gcc-scalar-widening-pr45847.patch
 create mode 100644 recipes/gcc/gcc-4.5.2/gcc-uclibc-locale-ctype_touplow_t.patch
 create mode 100644 recipes/gcc/gcc-4.5.2/libstdc++-emit-__cxa_end_cleanup-in-text.patch
 create mode 100644 recipes/gcc/gcc-4.5.2/mips64-nomultilib.patch
 create mode 100644 recipes/gcc/gcc-4.5.2/zecke-no-host-includes.patch
 create mode 100644 recipes/gcc/gcc-4.5.2/zecke-xgcc-cpp.patch
 create mode 100644 recipes/gcc/gcc-cross-initial_4.5.2.bb
 create mode 100644 recipes/gcc/gcc-cross-intermediate_4.5.2.bb
 create mode 100644 recipes/gcc/gcc-cross-sdk_4.5.2.bb
 create mode 100644 recipes/gcc/gcc-cross_4.5.2.bb
 create mode 100644 recipes/gcc/gcc_4.5.2.bb

diff --git a/recipes/gcc/gcc-4.5.2.inc b/recipes/gcc/gcc-4.5.2.inc
new file mode 100644
index 0000000..6efa98b
--- /dev/null
+++ b/recipes/gcc/gcc-4.5.2.inc
@@ -0,0 +1,65 @@
+DEFAULT_PREFERENCE = "-999"
+ARM_INSTRUCTION_SET = "arm"
+
+require gcc-common.inc
+LICENSE = "GPLv3"
+
+DEPENDS = "mpfr gmp libmpc libelf"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
+
+
+INC_PR = "r1"
+
+SRCREV = "167585"
+PV = "4.5.2"
+# BINV should be incremented after updating to a revision
+# after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
+# the value will be minor-release+1 e.g. if minor release was
+# 4.5.1 then the value below will be 2 which will mean 4.5.2
+# which will be next minor release and so on.
+
+BINV = "${PV}.2"
+BRANCH = "gcc-4_5-branch"
+PR_append = "+svnr${SRCPV}"
+
+SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH} \
+	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
+	   file://100-uclibc-conf.patch \
+           file://gcc-uclibc-locale-ctype_touplow_t.patch \
+	   file://cache-amnesia.patch \
+	   file://gcc-flags-for-build.patch \
+	   file://libstdc++-emit-__cxa_end_cleanup-in-text.patch \
+	   file://arm-bswapsi2.patch \
+	   file://Makefile.in.patch \
+	   file://gcc-armv4-pass-fix-v4bx-to-ld.patch \
+	   file://gcc-scalar-widening-pr45847.patch \
+	  "
+
+SRC_URI_append_mips64 = " file://mips64-nomultilib.patch "
+SRC_URI_append_mips64el = " file://mips64-nomultilib.patch "
+
+# Language Overrides
+FORTRAN = ""
+JAVA = ""
+rename_srcdir (){
+        mv ${WORKDIR}/${BRANCH} ${WORKDIR}/gcc-${PV}
+}
+
+do_unpack_append() {
+        bb.build.exec_func('rename_srcdir', d)
+}
+
+EXTRA_OECONF_BASE = " --enable-lto \
+		      --enable-libssp \
+		      --disable-bootstrap --disable-libgomp \
+		      --disable-libmudflap"
+
+EXTRA_OECONF_INITIAL = "--disable-libmudflap --disable-libgomp --disable-libssp --enable-decimal-float=no"
+EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap --disable-libgomp --disable-libssp"
+
+EXTRA_OECONF_append_linux-uclibc = " --disable-decimal-float "
+EXTRA_OECONF_append_linux-uclibceabi = " --disable-decimal-float "
+EXTRA_OECONF_append_linux-uclibcspe = " --disable-decimal-float "
+
+EXTRA_OECONF_append_mips64 = " --with-arch-64=mips64 --with-tune-64=mips64"
+EXTRA_OECONF_append_mips64el = " --with-arch-64=mips64 --with-tune-64=mips64"
diff --git a/recipes/gcc/gcc-4.5.2/100-uclibc-conf.patch b/recipes/gcc/gcc-4.5.2/100-uclibc-conf.patch
new file mode 100644
index 0000000..0b79960
--- /dev/null
+++ b/recipes/gcc/gcc-4.5.2/100-uclibc-conf.patch
@@ -0,0 +1,37 @@
+Index: gcc-4.3.1/contrib/regression/objs-gcc.sh
+===================================================================
+--- gcc-4.3.1.orig/contrib/regression/objs-gcc.sh	2007-12-24 15:18:57.000000000 -0800
++++ gcc-4.3.1/contrib/regression/objs-gcc.sh	2008-08-16 01:15:12.000000000 -0700
+@@ -105,6 +105,10 @@
+  then
+   make all-gdb all-dejagnu all-ld || exit 1
+   make install-gdb install-dejagnu install-ld || exit 1
++elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
++ then
++  make all-gdb all-dejagnu all-ld || exit 1
++  make install-gdb install-dejagnu install-ld || exit 1
+ elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
+   make bootstrap || exit 1
+   make install || exit 1
+Index: gcc-4.3.1/libjava/classpath/ltconfig
+===================================================================
+--- gcc-4.3.1.orig/libjava/classpath/ltconfig	2007-06-03 16:18:43.000000000 -0700
++++ gcc-4.3.1/libjava/classpath/ltconfig	2008-08-16 01:15:12.000000000 -0700
+@@ -603,7 +603,7 @@
+ 
+ # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
+ case $host_os in
+-linux-gnu*) ;;
++linux-gnu*|linux-uclibc*) ;;
+ linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
+ esac
+ 
+@@ -1251,7 +1251,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux*)
+   version_type=linux
+   need_lib_prefix=no
+   need_version=no
diff --git a/recipes/gcc/gcc-4.5.2/Makefile.in.patch b/recipes/gcc/gcc-4.5.2/Makefile.in.patch
new file mode 100644
index 0000000..45df47c
--- /dev/null
+++ b/recipes/gcc/gcc-4.5.2/Makefile.in.patch
@@ -0,0 +1,30 @@
+Index: gcc-4.5/gcc/Makefile.in
+===================================================================
+--- gcc-4.5.orig/gcc/Makefile.in
++++ gcc-4.5/gcc/Makefile.in
+@@ -656,7 +656,7 @@ LIBGCC2_INCLUDES =
+ TARGET_LIBGCC2_CFLAGS =
+ 
+ # Options to use when compiling crtbegin/end.
+-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0 \
++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFLAGS) -g0 \
+   -finhibit-size-directive -fno-inline -fno-exceptions \
+   -fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize \
+   $(INHIBIT_LIBC_CFLAGS)
+@@ -1038,10 +1038,14 @@ BUILD_ERRORS = build/errors.o
+ # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
+ # currently being compiled, in both source trees, to be examined as well.
+ # libintl.h will be found in ../intl if we are using the included libintl.
+-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
++#
++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the host
++# include dir) is used for compiling libgcc.a
++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
+ 	   -I$(srcdir)/../include @INCINTL@ \
+-	   $(CPPINC) $(GMPINC) $(DECNUMINC) \
++	   $(CPPINC) $(DECNUMINC) \
+ 	   $(PPLINC) $(CLOOGINC) $(LIBELFINC)
++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
+ 
+ .c.o:
+ 	$(COMPILER) -c $(ALL_COMPILERFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
diff --git a/recipes/gcc/gcc-4.5.2/arm-bswapsi2.patch b/recipes/gcc/gcc-4.5.2/arm-bswapsi2.patch
new file mode 100644
index 0000000..7ac61a6
--- /dev/null
+++ b/recipes/gcc/gcc-4.5.2/arm-bswapsi2.patch
@@ -0,0 +1,13 @@
+Index: gcc-4.5/gcc/config/arm/arm.md
+===================================================================
+--- gcc-4.5.orig/gcc/config/arm/arm.md	2010-06-17 09:13:07.000000000 -0700
++++ gcc-4.5/gcc/config/arm/arm.md	2010-06-22 08:08:45.397212002 -0700
+@@ -11267,7 +11267,7 @@
+ (define_expand "bswapsi2"
+   [(set (match_operand:SI 0 "s_register_operand" "=r")
+   	(bswap:SI (match_operand:SI 1 "s_register_operand" "r")))]
+-"TARGET_EITHER"
++"TARGET_EITHER && (arm_arch6 && !optimize_size)"
+ "
+   if (!arm_arch6)
+     {
diff --git a/recipes/gcc/gcc-4.5.2/cache-amnesia.patch b/recipes/gcc/gcc-4.5.2/cache-amnesia.patch
new file mode 100644
index 0000000..b889f9b
--- /dev/null
+++ b/recipes/gcc/gcc-4.5.2/cache-amnesia.patch
@@ -0,0 +1,31 @@
+---
+ gcc/configure    |    2 +-
+ gcc/configure.ac |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: gcc-4.5+svnr155514/gcc/configure
+===================================================================
+--- gcc-4.5+svnr155514.orig/gcc/configure	2009-12-29 22:00:40.000000000 -0800
++++ gcc-4.5+svnr155514/gcc/configure	2009-12-29 23:52:43.381592113 -0800
+@@ -10467,7 +10467,7 @@ else
+ 	saved_CFLAGS="${CFLAGS}"
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
+ 	LDFLAGS="${LDFLAGS_FOR_BUILD}" \
+-	${realsrcdir}/configure \
++	CONFIG_SITE= ${realsrcdir}/configure --cache-file=./other.cache \
+ 		--enable-languages=${enable_languages-all} \
+ 		--target=$target_alias --host=$build_alias --build=$build_alias
+ 	CFLAGS="${saved_CFLAGS}"
+Index: gcc-4.5+svnr155514/gcc/configure.ac
+===================================================================
+--- gcc-4.5+svnr155514.orig/gcc/configure.ac	2009-12-29 22:00:40.000000000 -0800
++++ gcc-4.5+svnr155514/gcc/configure.ac	2009-12-29 23:51:54.589091778 -0800
+@@ -1458,7 +1458,7 @@ else
+ 	saved_CFLAGS="${CFLAGS}"
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
+ 	LDFLAGS="${LDFLAGS_FOR_BUILD}" \
+-	${realsrcdir}/configure \
++	CONFIG_SITE= ${realsrcdir}/configure --cache-file=./other.cache \
+ 		--enable-languages=${enable_languages-all} \
+ 		--target=$target_alias --host=$build_alias --build=$build_alias
+ 	CFLAGS="${saved_CFLAGS}"
diff --git a/recipes/gcc/gcc-4.5.2/fortran-cross-compile-hack.patch b/recipes/gcc/gcc-4.5.2/fortran-cross-compile-hack.patch
new file mode 100644
index 0000000..348c770
--- /dev/null
+++ b/recipes/gcc/gcc-4.5.2/fortran-cross-compile-hack.patch
@@ -0,0 +1,30 @@
+* Fortran would have searched for arm-angstrom-gnueabi-gfortran but would have used
+  used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler from our cross
+  directory.
+
+Index: gcc-4.5+svnr155514/libgfortran/configure
+===================================================================
+--- gcc-4.5+svnr155514.orig/libgfortran/configure	2009-12-29 22:02:01.000000000 -0800
++++ gcc-4.5+svnr155514/libgfortran/configure	2009-12-30 08:12:40.889091657 -0800
+@@ -11655,7 +11655,7 @@ CC="$lt_save_CC"
+ 
+ # We need gfortran to compile parts of the library
+ #AC_PROG_FC(gfortran)
+-FC="$GFORTRAN"
++#FC="$GFORTRAN"
+ ac_ext=${ac_fc_srcext-f}
+ ac_compile='$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5'
+ ac_link='$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_srcext conftest.$ac_ext $LIBS >&5'
+Index: gcc-4.5+svnr155514/libgfortran/configure.ac
+===================================================================
+--- gcc-4.5+svnr155514.orig/libgfortran/configure.ac	2009-12-29 22:02:01.000000000 -0800
++++ gcc-4.5+svnr155514/libgfortran/configure.ac	2009-12-30 08:12:13.453094218 -0800
+@@ -187,7 +187,7 @@ AC_SUBST(enable_static)
+ 
+ # We need gfortran to compile parts of the library
+ #AC_PROG_FC(gfortran)
+-FC="$GFORTRAN"
++#FC="$GFORTRAN"
+ AC_PROG_FC(gfortran)
+ 
+ # extra LD Flags which are required for targets
diff --git a/recipes/gcc/gcc-4.5.2/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/recipes/gcc/gcc-4.5.2/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
new file mode 100644
index 0000000..f33e6c1
--- /dev/null
+++ b/recipes/gcc/gcc-4.5.2/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -0,0 +1,31 @@
+---
+ configure    |    2 +-
+ configure.ac |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: gcc-4.3.1/configure.ac
+===================================================================
+--- gcc-4.3.1.orig/configure.ac	2008-07-21 12:29:18.000000000 -0700
++++ gcc-4.3.1/configure.ac	2008-07-21 12:29:35.000000000 -0700
+@@ -2352,7 +2352,7 @@ fi
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs="--cache-file=./config.cache ${target_configargs}"
+ 
+-FLAGS_FOR_TARGET=
++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
+Index: gcc-4.3.1/configure
+===================================================================
+--- gcc-4.3.1.orig/configure	2008-07-21 12:29:48.000000000 -0700
++++ gcc-4.3.1/configure	2008-07-21 12:29:59.000000000 -0700
+@@ -5841,7 +5841,7 @@ fi
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs="--cache-file=./config.cache ${target_configargs}"
+ 
+-FLAGS_FOR_TARGET=
++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
diff --git a/recipes/gcc/gcc-4.5.2/gcc-armv4-pass-fix-v4bx-to-ld.patch b/recipes/gcc/gcc-4.5.2/gcc-armv4-pass-fix-v4bx-to-ld.patch
new file mode 100644
index 0000000..5d1a033
--- /dev/null
+++ b/recipes/gcc/gcc-4.5.2/gcc-armv4-pass-fix-v4bx-to-ld.patch
@@ -0,0 +1,29 @@
+The LINK_SPEC for linux gets overwritten by linux-eabi.h which
+means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
+the option is not passed to linker when chosing march=armv4
+This patch redefines this in linux-eabi.h and reinserts it
+for eabi defaulting toolchains.
+
+We might want to send it upstream
+
+-Khem
+Index: gcc-4.5/gcc/config/arm/linux-eabi.h
+===================================================================
+--- gcc-4.5.orig/gcc/config/arm/linux-eabi.h
++++ gcc-4.5/gcc/config/arm/linux-eabi.h
+@@ -63,10 +63,14 @@
+ #undef  GLIBC_DYNAMIC_LINKER
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.3"
+ 
++/* For armv4 we pass --fix-v4bx to linker to support EABI */
++#undef TARGET_FIX_V4BX_SPEC
++#define TARGET_FIX_V4BX_SPEC " %{mcpu=arm8|mcpu=arm810|mcpu=strongarm*|march=armv4:--fix-v4bx}"
++
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
+    use the GNU/Linux version, not the generic BPABI version.  */
+ #undef  LINK_SPEC
+-#define LINK_SPEC LINUX_TARGET_LINK_SPEC BE8_LINK_SPEC
++#define LINK_SPEC LINUX_TARGET_LINK_SPEC BE8_LINK_SPEC TARGET_FIX_V4BX_SPEC
+ 
+ /* Use the default LIBGCC_SPEC, not the version in linux-elf.h, as we
+    do not use -lfloat.  */
diff --git a/recipes/gcc/gcc-4.5.2/gcc-flags-for-build.patch b/recipes/gcc/gcc-4.5.2/gcc-flags-for-build.patch
new file mode 100644
index 0000000..5189285
--- /dev/null
+++ b/recipes/gcc/gcc-4.5.2/gcc-flags-for-build.patch
@@ -0,0 +1,178 @@
+Index: gcc-4.5/Makefile.def
+===================================================================
+--- gcc-4.5.orig/Makefile.def
++++ gcc-4.5/Makefile.def
+@@ -240,6 +240,7 @@ flags_to_pass = { flag= AWK ; };
+ flags_to_pass = { flag= BISON ; };
+ flags_to_pass = { flag= CC_FOR_BUILD ; };
+ flags_to_pass = { flag= CFLAGS_FOR_BUILD ; };
++flags_to_pass = { flag= CPPFLAGS_FOR_BUILD ; };
+ flags_to_pass = { flag= CXX_FOR_BUILD ; };
+ flags_to_pass = { flag= EXPECT ; };
+ flags_to_pass = { flag= FLEX ; };
+Index: gcc-4.5/gcc/Makefile.in
+===================================================================
+--- gcc-4.5.orig/gcc/Makefile.in
++++ gcc-4.5/gcc/Makefile.in
+@@ -766,7 +766,7 @@ BUILD_LINKERFLAGS = $(BUILD_CFLAGS)
+ 
+ # Native linker and preprocessor flags.  For x-fragment overrides.
+ BUILD_LDFLAGS=@BUILD_LDFLAGS@
+-BUILD_CPPFLAGS=$(ALL_CPPFLAGS)
++BUILD_CPPFLAGS=$(INCLUDES) @BUILD_CPPFLAGS@ $(X_CPPFLAGS)
+ 
+ # Actual name to use when installing a native compiler.
+ GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
+Index: gcc-4.5/gcc/configure.ac
+===================================================================
+--- gcc-4.5.orig/gcc/configure.ac
++++ gcc-4.5/gcc/configure.ac
+@@ -1798,16 +1798,18 @@ AC_SUBST(inhibit_libc)
+ # Also, we cannot run fixincludes.
+ 
+ # These are the normal (build=host) settings:
+-CC_FOR_BUILD='$(CC)'		AC_SUBST(CC_FOR_BUILD)
+-BUILD_CFLAGS='$(ALL_CFLAGS)'	AC_SUBST(BUILD_CFLAGS)
+-BUILD_LDFLAGS='$(LDFLAGS)'	AC_SUBST(BUILD_LDFLAGS)
+-STMP_FIXINC=stmp-fixinc		AC_SUBST(STMP_FIXINC)
++CC_FOR_BUILD='$(CC)'			AC_SUBST(CC_FOR_BUILD)
++BUILD_CFLAGS='$(ALL_CFLAGS)'		AC_SUBST(BUILD_CFLAGS)
++BUILD_LDFLAGS='$(LDFLAGS)'		AC_SUBST(BUILD_LDFLAGS)
++BUILD_CPPFLAGS='$(ALL_CPPFLAGS)'	AC_SUBST(BUILD_CPPFLAGS)
++STMP_FIXINC=stmp-fixinc			AC_SUBST(STMP_FIXINC)
+ 
+ # And these apply if build != host, or we are generating coverage data
+ if test x$build != x$host || test "x$coverage_flags" != x
+ then
+     BUILD_CFLAGS='$(INTERNAL_CFLAGS) $(T_CFLAGS) $(CFLAGS_FOR_BUILD)'
+     BUILD_LDFLAGS='$(LDFLAGS_FOR_BUILD)'
++    BUILD_CPPFLAGS='$(CPPFLAGS_FOR_BUILD)'
+ fi
+ 
+ # Expand extra_headers to include complete path.
+Index: gcc-4.5/Makefile.in
+===================================================================
+--- gcc-4.5.orig/Makefile.in
++++ gcc-4.5/Makefile.in
+@@ -333,6 +333,7 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
+ AS_FOR_BUILD = @AS_FOR_BUILD@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
+ CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
++CPPFLAGS_FOR_BUILD = @CPPFLAGS_FOR_BUILD@
+ CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
+ CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
+@@ -662,6 +663,7 @@ BASE_FLAGS_TO_PASS = \
+ 	"BISON=$(BISON)" \
+ 	"CC_FOR_BUILD=$(CC_FOR_BUILD)" \
+ 	"CFLAGS_FOR_BUILD=$(CFLAGS_FOR_BUILD)" \
++	"CPPFLAGS_FOR_BUILD=$(CPPFLAGS_FOR_BUILD)" \
+ 	"CXX_FOR_BUILD=$(CXX_FOR_BUILD)" \
+ 	"EXPECT=$(EXPECT)" \
+ 	"FLEX=$(FLEX)" \
+Index: gcc-4.5/gcc/configure
+===================================================================
+--- gcc-4.5.orig/gcc/configure
++++ gcc-4.5/gcc/configure
+@@ -707,6 +707,7 @@ SED
+ LIBTOOL
+ collect2
+ STMP_FIXINC
++BUILD_CPPFLAGS
+ BUILD_LDFLAGS
+ BUILD_CFLAGS
+ CC_FOR_BUILD
+@@ -10982,6 +10983,7 @@ fi
+ CC_FOR_BUILD='$(CC)'
+ BUILD_CFLAGS='$(ALL_CFLAGS)'
+ BUILD_LDFLAGS='$(LDFLAGS)'
++BUILD_CPPFLAGS='$(ALL_CPPFLAGS)'
+ STMP_FIXINC=stmp-fixinc
+ 
+ # And these apply if build != host, or we are generating coverage data
+@@ -10989,6 +10991,7 @@ if test x$build != x$host || test "x$cov
+ then
+     BUILD_CFLAGS='$(INTERNAL_CFLAGS) $(T_CFLAGS) $(CFLAGS_FOR_BUILD)'
+     BUILD_LDFLAGS='$(LDFLAGS_FOR_BUILD)'
++    BUILD_CPPFLAGS='$(CPPFLAGS_FOR_BUILD)'
+ fi
+ 
+ # Expand extra_headers to include complete path.
+@@ -17108,7 +17111,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 17111 "configure"
++#line 17114 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -17214,7 +17217,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 17217 "configure"
++#line 17220 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+Index: gcc-4.5/Makefile.tpl
+===================================================================
+--- gcc-4.5.orig/Makefile.tpl
++++ gcc-4.5/Makefile.tpl
+@@ -336,6 +336,7 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
+ AS_FOR_BUILD = @AS_FOR_BUILD@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
+ CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
++CPPFLAGS_FOR_BUILD = @CPPFLAGS_FOR_BUILD@
+ CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
+ CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
+Index: gcc-4.5/configure
+===================================================================
+--- gcc-4.5.orig/configure
++++ gcc-4.5/configure
+@@ -651,6 +651,7 @@ GCJ_FOR_BUILD
+ DLLTOOL_FOR_BUILD
+ CXX_FOR_BUILD
+ CXXFLAGS_FOR_BUILD
++CPPFLAGS_FOR_BUILD
+ CFLAGS_FOR_BUILD
+ CC_FOR_BUILD
+ AS_FOR_BUILD
+@@ -8036,6 +8037,7 @@ esac
+ # our build compiler if desired.
+ if test x"${build}" = x"${host}" ; then
+   CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
++  CPPFLAGS_FOR_BUILD=${CPPFLAGS_FOR_BUILD-${CPPFLAGS}}
+   CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
+   LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
+ fi
+@@ -8101,6 +8103,7 @@ done
+ 
+ 
+ 
++
+ 
+ 
+ 
+Index: gcc-4.5/configure.ac
+===================================================================
+--- gcc-4.5.orig/configure.ac
++++ gcc-4.5/configure.ac
+@@ -3089,6 +3089,7 @@ esac
+ # our build compiler if desired.
+ if test x"${build}" = x"${host}" ; then
+   CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
++  CPPFLAGS_FOR_BUILD=${CPPFLAGS_FOR_BUILD-${CPPFLAGS}}
+   CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
+   LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
+ fi
+@@ -3155,6 +3156,7 @@ AC_SUBST(AR_FOR_BUILD)
+ AC_SUBST(AS_FOR_BUILD)
+ AC_SUBST(CC_FOR_BUILD)
+ AC_SUBST(CFLAGS_FOR_BUILD)
++AC_SUBST(CPPFLAGS_FOR_BUILD)
+ AC_SUBST(CXXFLAGS_FOR_BUILD)
+ AC_SUBST(CXX_FOR_BUILD)
+ AC_SUBST(DLLTOOL_FOR_BUILD)
diff --git a/recipes/gcc/gcc-4.5.2/gcc-scalar-widening-pr45847.patch b/recipes/gcc/gcc-4.5.2/gcc-scalar-widening-pr45847.patch
new file mode 100644
index 0000000..cbe1230
--- /dev/null
+++ b/recipes/gcc/gcc-4.5.2/gcc-scalar-widening-pr45847.patch
@@ -0,0 +1,63 @@
+Hi,
+
+The attached patch fixes Bugzilla 45847
+(http://gcc.gnu.org/bugzilla/show_bug.cgi?id=45847). When compiling
+without -mvectorize-with-neon-quad and vectorizing scalar widening
+operations that widen words to double words, there are no corresponding
+vector types for DI scalar types. For this scenario, a call to
+get_vect_type_for_scalar_type() returns NULL and an absent NULL-check
+caused this segfault. The attached patch adds this NULL-check. Also,
+this is consistent with all the other places where a NULL-check follows
+a call to get_vect_type_for_scalar_type() in tree-vect-patterns.c. 
+
+Regression tested with arm-linux-gnueabi. OK?
+
+--
+Tejas Belagod
+ARM.
+
+gcc/
+
+2010-10-05  Tejas Belagod  <tejas.belagod@arm.com>
+
+	* tree-vect-patterns.c (vect_recog_widen_mult_pattern): Add NULL
+	check for vectype_out returned by get_vectype_for_scalar_type().
+
+testsuite/
+
+2010-10-05  Tejas Belagod  <tejas.belagod@arm.com>
+
+	* gcc.dg/vect/pr45847.c: New test.
+
+Index: gcc-4.5/gcc/testsuite/gcc.dg/vect/pr45847.c
+===================================================================
+--- /dev/null
++++ gcc-4.5/gcc/testsuite/gcc.dg/vect/pr45847.c
+@@ -0,0 +1,15 @@
++/* { dg-do compile } */
++
++
++long long foo (long long *__restrict a,  int *__restrict b, int *__restrict c )
++{
++  int i;
++  long long sum=0;
++  for (i=0;i<256;i++)
++   sum += (long long)b[i] * c[i];
++
++  return sum;
++}
++
++/* { dg-final { cleanup-tree-dump "vect" } } */
++
+Index: gcc-4.5/gcc/tree-vect-patterns.c
+===================================================================
+--- gcc-4.5.orig/gcc/tree-vect-patterns.c
++++ gcc-4.5/gcc/tree-vect-patterns.c
+@@ -411,6 +411,7 @@ vect_recog_widen_mult_pattern (gimple la
+   /* Check target support  */
+   vectype = get_vectype_for_scalar_type (half_type0);
+   if (!vectype
++      || !get_vectype_for_scalar_type (type)
+       || !supportable_widening_operation (WIDEN_MULT_EXPR, last_stmt, vectype,
+ 					  &dummy, &dummy, &dummy_code,
+ 					  &dummy_code, &dummy_int, &dummy_vec))
diff --git a/recipes/gcc/gcc-4.5.2/gcc-uclibc-locale-ctype_touplow_t.patch b/recipes/gcc/gcc-4.5.2/gcc-uclibc-locale-ctype_touplow_t.patch
new file mode 100644
index 0000000..4f94fc9
--- /dev/null
+++ b/recipes/gcc/gcc-4.5.2/gcc-uclibc-locale-ctype_touplow_t.patch
@@ -0,0 +1,67 @@
+Index: gcc-4.5/libstdc++-v3/config/locale/generic/c_locale.h
+===================================================================
+--- gcc-4.5.orig/libstdc++-v3/config/locale/generic/c_locale.h	2010-06-30 22:30:53.993316002 -0700
++++ gcc-4.5/libstdc++-v3/config/locale/generic/c_locale.h	2010-06-30 22:31:26.043316001 -0700
+@@ -41,12 +41,17 @@
+ 
+ #include <clocale>
+ #include <cstddef>
++#include <features.h>
++#include <ctype.h>
+ 
+ #define _GLIBCXX_NUM_CATEGORIES 0
+ 
+ _GLIBCXX_BEGIN_NAMESPACE(std)
+-
+-  typedef int*			__c_locale;
++#ifdef __UCLIBC__
++   typedef __ctype_touplow_t*   __c_locale;
++#else
++   typedef int*         __c_locale;
++#endif
+ 
+   // Convert numeric value of type double and long double to string and
+   // return length of string.  If vsnprintf is available use it, otherwise
+Index: gcc-4.5/libstdc++-v3/config/os/gnu-linux/ctype_base.h
+===================================================================
+--- gcc-4.5.orig/libstdc++-v3/config/os/gnu-linux/ctype_base.h	2010-06-30 22:30:54.013316002 -0700
++++ gcc-4.5/libstdc++-v3/config/os/gnu-linux/ctype_base.h	2010-06-30 22:31:26.053316001 -0700
+@@ -33,14 +33,21 @@
+  */
+ 
+ // Information as gleaned from /usr/include/ctype.h
+-  
++
++#include <features.h>
++#include <ctype.h>
++
+ _GLIBCXX_BEGIN_NAMESPACE(std)
+ 
+   /// @brief  Base class for ctype.
+   struct ctype_base
+   {
+     // Non-standard typedefs.
+-    typedef const int* 		__to_type;
++#ifdef __UCLIBC__
++    typedef const __ctype_touplow_t*   __to_type;
++#else
++    typedef const int*         __to_type;
++#endif
+ 
+     // NB: Offsets into ctype<char>::_M_table force a particular size
+     // on the mask type. Because of this, we don't use an enum.
+Index: gcc-4.5/libstdc++-v3/config/locale/generic/c_locale.cc
+===================================================================
+--- gcc-4.5.orig/libstdc++-v3/config/locale/generic/c_locale.cc	2010-06-28 12:12:42.000000000 -0700
++++ gcc-4.5/libstdc++-v3/config/locale/generic/c_locale.cc	2010-06-30 22:31:26.063316001 -0700
+@@ -256,5 +256,10 @@ _GLIBCXX_END_NAMESPACE
+ #ifdef _GLIBCXX_LONG_DOUBLE_COMPAT
+ #define _GLIBCXX_LDBL_COMPAT(dbl, ldbl) \
+   extern "C" void ldbl (void) __attribute__ ((alias (#dbl)))
++#ifdef __UCLIBC__
++// This is because __c_locale is of type __ctype_touplow_t* which is short on uclibc. for glibc its int*
++_GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKPs, _ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPs);
++#else
+ _GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKPi, _ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPi);
++#endif
+ #endif // _GLIBCXX_LONG_DOUBLE_COMPAT
diff --git a/recipes/gcc/gcc-4.5.2/libstdc++-emit-__cxa_end_cleanup-in-text.patch b/recipes/gcc/gcc-4.5.2/libstdc++-emit-__cxa_end_cleanup-in-text.patch
new file mode 100644
index 0000000..ada36a5
--- /dev/null
+++ b/recipes/gcc/gcc-4.5.2/libstdc++-emit-__cxa_end_cleanup-in-text.patch
@@ -0,0 +1,40 @@
+2010-06-07  Khem Raj  <raj.khem@gmail.com>
+
+	* libsupc++/eh_arm.cc (__cxa_end_cleanup): Use .pushsection/.popsection
+	to emit inline assembly into .text section.
+
+Index: gcc-4.5/libstdc++-v3/libsupc++/eh_arm.cc
+===================================================================
+--- gcc-4.5.orig/libstdc++-v3/libsupc++/eh_arm.cc	2010-06-04 23:20:18.000000000 -0700
++++ gcc-4.5/libstdc++-v3/libsupc++/eh_arm.cc	2010-06-08 11:27:34.247541722 -0700
+@@ -157,22 +157,26 @@ __gnu_end_cleanup(void)
+ // Assembly wrapper to call __gnu_end_cleanup without clobbering r1-r3.
+ // Also push r4 to preserve stack alignment.
+ #ifdef __thumb__
+-asm (".global __cxa_end_cleanup\n"
++asm ("  .pushsection .text.__cxa_end_cleanup\n"
++"	.global __cxa_end_cleanup\n"
+ "	.type __cxa_end_cleanup, \"function\"\n"
+ "	.thumb_func\n"
+ "__cxa_end_cleanup:\n"
+ "	push\t{r1, r2, r3, r4}\n"
+ "	bl\t__gnu_end_cleanup\n"
+ "	pop\t{r1, r2, r3, r4}\n"
+-"	bl\t_Unwind_Resume @ Never returns\n");
++"	bl\t_Unwind_Resume @ Never returns\n"
++"	.popsection\n");
+ #else
+-asm (".global __cxa_end_cleanup\n"
++asm ("  .pushsection .text.__cxa_end_cleanup\n"
++"	.global __cxa_end_cleanup\n"
+ "	.type __cxa_end_cleanup, \"function\"\n"
+ "__cxa_end_cleanup:\n"
+ "	stmfd\tsp!, {r1, r2, r3, r4}\n"
+ "	bl\t__gnu_end_cleanup\n"
+ "	ldmfd\tsp!, {r1, r2, r3, r4}\n"
+-"	bl\t_Unwind_Resume @ Never returns\n");
++"	bl\t_Unwind_Resume @ Never returns\n"
++"	.popsection\n");
+ #endif
+ 
+ #endif
diff --git a/recipes/gcc/gcc-4.5.2/mips64-nomultilib.patch b/recipes/gcc/gcc-4.5.2/mips64-nomultilib.patch
new file mode 100644
index 0000000..1ef69f8
--- /dev/null
+++ b/recipes/gcc/gcc-4.5.2/mips64-nomultilib.patch
@@ -0,0 +1,52 @@
+Index: gcc-4.5/gcc/config/mips/linux64.h
+===================================================================
+--- gcc-4.5.orig/gcc/config/mips/linux64.h	2010-09-25 02:05:05.484423095 -0700
++++ gcc-4.5/gcc/config/mips/linux64.h	2010-09-25 02:31:18.524931014 -0700
+@@ -26,7 +26,7 @@
+   BASE_DRIVER_SELF_SPECS, \
+   LINUX_DRIVER_SELF_SPECS \
+   " %{!EB:%{!EL:%(endian_spec)}}" \
+-  " %{!mabi=*: -mabi=n32}"
++  " %{!mabi=*: -mabi=64}"
+ 
+ #undef LIB_SPEC
+ #define LIB_SPEC "\
+@@ -35,9 +35,9 @@
+ %{!shared: \
+   %{profile:-lc_p} %{!profile:-lc}}"
+ 
+-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
+-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld.so.1"
+-#define GLIBC_DYNAMIC_LINKERN32 "/lib32/ld.so.1"
++#define GLIBC_DYNAMIC_LINKER32 "/lib32/ld.so.1"
++#define GLIBC_DYNAMIC_LINKER64 "/lib/ld.so.1"
++#define GLIBC_DYNAMIC_LINKERN32 "/lib64/ld.so.1"
+ #define UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"
+ #define LINUX_DYNAMIC_LINKERN32 \
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKERN32)
+Index: gcc-4.5/gcc/config.gcc
+===================================================================
+--- gcc-4.5.orig/gcc/config.gcc	2010-07-22 16:37:17.000000000 -0700
++++ gcc-4.5/gcc/config.gcc	2010-09-25 02:25:41.412414136 -0700
+@@ -1707,7 +1707,7 @@
+ 	*-*-irix6*)
+ 		tm_file="${tm_file} mips/iris6.h"
+ 		tmake_file="${tmake_file} mips/t-iris6"
+-		tm_defines="${tm_defines} MIPS_ISA_DEFAULT=3 MIPS_ABI_DEFAULT=ABI_N32"
++		tm_defines="${tm_defines} MIPS_ISA_DEFAULT=3 MIPS_ABI_DEFAULT=ABI_64"
+ 		case ${target} in
+ 		*-*-irix6.[0-4]*)
+ 			use_gcc_stdint=provide
+Index: gcc-4.5/gcc/config/mips/t-linux64
+===================================================================
+--- gcc-4.5.orig/gcc/config/mips/t-linux64	2010-07-11 16:14:42.000000000 -0700
++++ gcc-4.5/gcc/config/mips/t-linux64	2010-09-25 02:29:52.758708250 -0700
+@@ -18,7 +18,7 @@
+ 
+ MULTILIB_OPTIONS = mabi=n32/mabi=32/mabi=64
+ MULTILIB_DIRNAMES = n32 32 64
+-MULTILIB_OSDIRNAMES = ../lib32 ../lib ../lib64
++MULTILIB_OSDIRNAMES = ../lib64 ../lib32 ../lib
+ 
+ EXTRA_MULTILIB_PARTS=crtbegin.o crtend.o crtbeginS.o crtendS.o crtbeginT.o
+ 
diff --git a/recipes/gcc/gcc-4.5.2/zecke-no-host-includes.patch b/recipes/gcc/gcc-4.5.2/zecke-no-host-includes.patch
new file mode 100644
index 0000000..4ccf35f
--- /dev/null
+++ b/recipes/gcc/gcc-4.5.2/zecke-no-host-includes.patch
@@ -0,0 +1,31 @@
+Index: gcc-4.4+svnr145550/gcc/incpath.c
+===================================================================
+--- gcc-4.4+svnr145550.orig/gcc/incpath.c	2009-04-04 13:48:31.000000000 -0700
++++ gcc-4.4+svnr145550/gcc/incpath.c	2009-04-04 14:49:29.000000000 -0700
+@@ -417,6 +417,26 @@
+   p->construct = 0;
+   p->user_supplied_p = user_supplied_p;
+ 
++#ifdef CROSS_COMPILE
++    /* A common error when cross compiling is including
++    host headers. This code below will try to fail fast
++    for cross compiling. Currently we consider /usr/include,
++    /opt/include and /sw/include as harmful.  */
++	{
++		/* printf("Adding Path: %s\n", p->name ); */
++		if( strstr(p->name, "/usr/include" ) == p->name ) {
++			fprintf(stderr, _("CROSS COMPILE Badness: /usr/include in INCLUDEPATH: %s\n"), p->name);
++			abort();
++		} else if( strstr(p->name, "/sw/include") == p->name ) {
++			fprintf(stderr, _("CROSS COMPILE Badness: /sw/include in INCLUDEPATH: %s\n"), p->name);
++			abort();
++		} else if( strstr(p->name, "/opt/include") == p->name ) {
++			fprintf(stderr, _("CROSS COMPILE Badness: /opt/include in INCLUDEPATH: %s\n"), p->name);
++			abort();
++		 }
++	}
++#endif
++
+   add_cpp_dir_path (p, chain);
+ }
+ 
diff --git a/recipes/gcc/gcc-4.5.2/zecke-xgcc-cpp.patch b/recipes/gcc/gcc-4.5.2/zecke-xgcc-cpp.patch
new file mode 100644
index 0000000..a7722cb
--- /dev/null
+++ b/recipes/gcc/gcc-4.5.2/zecke-xgcc-cpp.patch
@@ -0,0 +1,28 @@
+upstream: n/a
+comment: Use the preprocessor we have just compiled instead the one of
+the system. There might be incompabilities between us and them.
+
+Index: gcc-4.3.1/Makefile.in
+===================================================================
+--- gcc-4.3.1.orig/Makefile.in	2008-08-19 01:09:56.000000000 -0700
++++ gcc-4.3.1/Makefile.in	2008-08-19 01:13:27.000000000 -0700
+@@ -204,6 +204,7 @@
+ 	AR="$(AR_FOR_TARGET)"; export AR; \
+ 	AS="$(COMPILER_AS_FOR_TARGET)"; export AS; \
+ 	CC="$(CC_FOR_TARGET)"; export CC; \
++	CPP="$(CC_FOR_TARGET) -E"; export CPP; \
+ 	CFLAGS="$(CFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PREFIX_CFLAGS_FOR_TARGET)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+ 	CPPFLAGS="$(CPPFLAGS_FOR_TARGET)"; export CPPFLAGS; \
+Index: gcc-4.3.1/Makefile.tpl
+===================================================================
+--- gcc-4.3.1.orig/Makefile.tpl	2008-08-21 00:07:58.000000000 -0700
++++ gcc-4.3.1/Makefile.tpl	2008-08-21 00:09:52.000000000 -0700
+@@ -223,6 +223,7 @@
+ 	AR="$(AR_FOR_TARGET)"; export AR; \
+ 	AS="$(COMPILER_AS_FOR_TARGET)"; export AS; \
+ 	CC="$(CC_FOR_TARGET)"; export CC; \
++	CPP="$(CC_FOR_TARGET) -E"; export CPP; \
+ 	CFLAGS="$(CFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PREFIX_CFLAGS_FOR_TARGET)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+ 	CPPFLAGS="$(CPPFLAGS_FOR_TARGET)"; export CPPFLAGS; \
diff --git a/recipes/gcc/gcc-cross-initial_4.5.2.bb b/recipes/gcc/gcc-cross-initial_4.5.2.bb
new file mode 100644
index 0000000..1639511
--- /dev/null
+++ b/recipes/gcc/gcc-cross-initial_4.5.2.bb
@@ -0,0 +1,2 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-initial.inc
diff --git a/recipes/gcc/gcc-cross-intermediate_4.5.2.bb b/recipes/gcc/gcc-cross-intermediate_4.5.2.bb
new file mode 100644
index 0000000..eb59de9
--- /dev/null
+++ b/recipes/gcc/gcc-cross-intermediate_4.5.2.bb
@@ -0,0 +1,2 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
diff --git a/recipes/gcc/gcc-cross-sdk_4.5.2.bb b/recipes/gcc/gcc-cross-sdk_4.5.2.bb
new file mode 100644
index 0000000..d1e13d4
--- /dev/null
+++ b/recipes/gcc/gcc-cross-sdk_4.5.2.bb
@@ -0,0 +1,8 @@
+inherit sdk
+
+require gcc-${PV}.inc
+require gcc-cross-sdk.inc
+PR = "${INC_PR}.1"
+
+EXTRA_OECONF += " --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} --with-system-zlib"
+
diff --git a/recipes/gcc/gcc-cross_4.5.2.bb b/recipes/gcc/gcc-cross_4.5.2.bb
new file mode 100644
index 0000000..87fe194
--- /dev/null
+++ b/recipes/gcc/gcc-cross_4.5.2.bb
@@ -0,0 +1,12 @@
+require gcc-${PV}.inc
+require gcc-cross4.inc
+
+PR = "${INC_PR}.0"
+
+NATIVEDEPS += "libmpc-native libelf-native"
+SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+
+EXTRA_OECONF += " --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} \
+                 -with-libelf=${STAGING_DIR_NATIVE}${prefix_native} --with-system-zlib"
+
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/recipes/gcc/gcc_4.5.2.bb b/recipes/gcc/gcc_4.5.2.bb
new file mode 100644
index 0000000..ad71ada
--- /dev/null
+++ b/recipes/gcc/gcc_4.5.2.bb
@@ -0,0 +1,15 @@
+PR = "${INC_PR}.1"
+require gcc-${PV}.inc
+require gcc-configure-target.inc
+require gcc-package-target.inc
+
+# Gcc 4.3.3 installs crt* in a '4.3.1' dir....
+FILES_${PN} += "\
+        ${gcclibdir}/${TARGET_SYS}/*/*.o \
+	${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto1 \
+	${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto-wrapper \
+"
+
+SRC_URI_append = "file://fortran-cross-compile-hack.patch"
+
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
-- 
1.6.3.3



