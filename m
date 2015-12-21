Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8BBD46FFCE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 09:42:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBL9g4s1010029
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 01:42:04 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 21 Dec 2015 01:42:04 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Dec 2015 17:29:15 +0800
Message-ID: <1450690155-14637-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] crash: 7.1.2 -> 7.1.3
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
X-List-Received-Date: Mon, 21 Dec 2015 09:42:05 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade crash from 7.1.2 to 7.1.3.

Add gdb source tarball and don't fetch and extract it during do_compile.
And do some format tweaks.

Exclude mips64 from COMPATIBLE_HOST which is not supported. And update
ARCH setting for arm64, ppc64 and mips32.

Add patch to enable parallel make for gdb. And don't write crash.target
which causes rebuild fails.

Backport patches to fix compile failures.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../donnot-extract-gdb-during-do-compile.patch     | 32 +++++++++
 ...gdb_build_jobs_and_not_write_crash_target.patch | 26 +++++++
 ...move-unrecognized-gcc-option-m32-for-mips.patch | 33 +++++++++
 ...mon-sim-arange-fix-extern-inline-handling.patch | 79 ++++++++++++++++++++++
 .../sim-ppc-drop-LIBS-from-psim-dependency.patch   | 37 ++++++++++
 .../crash/{crash_7.1.2.bb => crash_7.1.3.bb}       | 43 ++++++++----
 6 files changed, 238 insertions(+), 12 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash/sim-common-sim-arange-fix-extern-inline-handling.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash/sim-ppc-drop-LIBS-from-psim-dependency.patch
 rename meta-oe/recipes-kernel/crash/{crash_7.1.2.bb => crash_7.1.3.bb} (70%)

diff --git a/meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch b/meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch
new file mode 100644
index 0000000..e254fe8
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch
@@ -0,0 +1,32 @@
+Put gdb source tarball in SRC_URI and don't fetch and extract it during
+do_compile.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/Makefile b/Makefile
+index bb0a34e..5eb7604 100644
+--- a/Makefile
++++ b/Makefile
+@@ -226,7 +226,7 @@ all: make_configure
+ #	@make --no-print-directory extensions
+ 
+ gdb_merge: force
+-	@if [ ! -f ${GDB}/README ]; then \
++	@if [ ! -f ${GDB}/${GDB}.patch ]; then \
+ 	  make --no-print-directory gdb_unzip; fi
+ 	@echo "${LDFLAGS} -lz -ldl -rdynamic" > ${GDB}/gdb/mergelibs
+ 	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > ${GDB}/gdb/mergeobj
+@@ -253,11 +253,6 @@ gdb_unzip:
+ 	@rm -f gdb.files
+ 	@for FILE in ${GDB_FILES} dummy; do\
+ 	  echo $$FILE >> gdb.files; done
+-	@if [ ! -f ${GDB}.tar.gz ] && [ ! -f /usr/bin/wget ]; then \
+-	  echo /usr/bin/wget is required to download ${GDB}.tar.gz; echo; exit 1; fi
+-	@if [ ! -f ${GDB}.tar.gz ] && [ -f /usr/bin/wget ]; then \
+-	  wget http://ftp.gnu.org/gnu/gdb/${GDB}.tar.gz; fi
+-	@tar --exclude-from gdb.files -xvzmf ${GDB}.tar.gz
+ 	@make --no-print-directory gdb_patch
+ 
+ gdb_patch:
diff --git a/meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch b/meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch
new file mode 100644
index 0000000..3f4d1bc
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch
@@ -0,0 +1,26 @@
+This enables parallel building (multiple jobs in gdb) by reading the
+value from GDB_MAKE_JOBS.
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+
+Upstream-Status: Pending
+
+Don't write ${TARGET} to crash.target which causes rebuild fails.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+--
+diff --git a/Makefile b/Makefile
+index 27a1d47..bcf2d2f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -232,8 +232,8 @@ gdb_merge: force
+ 	@if [ ! -f ${GDB}/config.status ]; then \
+ 	  (cd ${GDB}; ./configure --host=${GDB_TARGET} --build=${GDB_HOST} --with-separate-debug-dir=/usr/lib/debug \
+ 	    --with-bugurl="" --with-expat=no --with-python=no; \
+-	  make --no-print-directory CRASH_TARGET=${TARGET}; echo ${TARGET} > crash.target) \
+-	else make --no-print-directory rebuild; fi
++	  make --no-print-directory CRASH_TARGET=${TARGET} ${GDB_MAKE_JOBS}; ) \
++	else make --no-print-directory ${GDB_MAKE_JOBS} rebuild; fi
+ 	@if [ ! -f ${PROGRAM} ]; then \
+ 	  echo; echo "${PROGRAM} build failed"; \
+ 	  echo; exit 1; fi
diff --git a/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch b/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch
new file mode 100644
index 0000000..c24db10
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Pending
+
+It fails to build crash for mips with error:
+
+| mips-wrs-linux-gcc: error: unrecognized command line option '-m32'
+| Makefile:291: recipe for target 'make_build_data' failed
+
+So remove the unrecognized option '-m32' for mips.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/configure.c b/configure.c
+index cf1973b..71e97b3 100644
+--- a/configure.c
++++ b/configure.c
+@@ -148,7 +148,7 @@ void add_extra_lib(char *);
+ #define TARGET_CFLAGS_PPC64_ON_X86_64  "TARGET_CFLAGS="
+ #define TARGET_CFLAGS_MIPS            "TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64"
+ #define TARGET_CFLAGS_MIPS_ON_X86     "TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64"
+-#define TARGET_CFLAGS_MIPS_ON_X86_64  "TARGET_CFLAGS=-m32 -D_FILE_OFFSET_BITS=64"
++#define TARGET_CFLAGS_MIPS_ON_X86_64  "TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64"
+ 
+ #define GDB_TARGET_DEFAULT        "GDB_CONF_FLAGS="
+ #define GDB_TARGET_ARM_ON_X86     "GDB_CONF_FLAGS=--target=arm-elf-linux"
+@@ -158,7 +158,7 @@ void add_extra_lib(char *);
+ #define GDB_TARGET_ARM64_ON_X86_64  "GDB_CONF_FLAGS=--target=aarch64-elf-linux"   /* TBD */
+ #define GDB_TARGET_PPC64_ON_X86_64  "GDB_CONF_FLAGS=--target=powerpc64le-unknown-linux-gnu"
+ #define GDB_TARGET_MIPS_ON_X86     "GDB_CONF_FLAGS=--target=mipsel-elf-linux"
+-#define GDB_TARGET_MIPS_ON_X86_64  "GDB_CONF_FLAGS=--target=mipsel-elf-linux CFLAGS=-m32"
++#define GDB_TARGET_MIPS_ON_X86_64  "GDB_CONF_FLAGS=--target=mipsel-elf-linux"
+      
+ /*
+  *  The original plan was to allow the use of a particular version
diff --git a/meta-oe/recipes-kernel/crash/crash/sim-common-sim-arange-fix-extern-inline-handling.patch b/meta-oe/recipes-kernel/crash/crash/sim-common-sim-arange-fix-extern-inline-handling.patch
new file mode 100644
index 0000000..0185b57
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/sim-common-sim-arange-fix-extern-inline-handling.patch
@@ -0,0 +1,79 @@
+Upstream-Status: Backport
+
+https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=92fc615
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+--
+From 92fc6153a6fdf2a027d9780f5945712aafad4a9e Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Sun, 29 Mar 2015 15:59:01 -0400
+Subject: [PATCH] sim: common: sim-arange: fix extern inline handling
+
+With newer versions of gcc (5.x), the extern inline we're using with the
+sim-arange module no longer works.  Since this code really wants the gnu
+inline semantics, use that attribute explicitly.
+
+Reported-by: DJ Delorie <dj@redhat.com>
+Reported-by: Joel Sherrill <joel.sherrill@oarcorp.com>
+---
+ gdb-7.6/sim/common/sim-arange.h | 20 ++++++++++++--------
+ gdb-7.6/sim/common/sim-inline.h |  4 +++-
+ 2 files changed, 15 insertions(+), 9 deletions(-)
+
+diff --git a/gdb-7.6/sim/common/sim-arange.h b/gdb-7.6/sim/common/sim-arange.h
+index 73117f3..de842c9 100644
+--- a/gdb-7.6/sim/common/sim-arange.h
++++ b/gdb-7.6/sim/common/sim-arange.h
+@@ -60,22 +60,26 @@ extern void sim_addr_range_delete (ADDR_RANGE * /*ar*/,
+ 				   address_word /*start*/,
+ 				   address_word /*end*/);
+ 
++/* TODO: This should get moved into sim-inline.h.  */
++#ifdef HAVE_INLINE
++#ifdef SIM_ARANGE_C
++#define SIM_ARANGE_INLINE INLINE
++#else
++#define SIM_ARANGE_INLINE EXTERN_INLINE
++#endif
++#else
++#define SIM_ARANGE_INLINE EXTERN
++#endif
++
+ /* Return non-zero if ADDR is in range AR, traversing the entire tree.
+    If no range is specified, that is defined to mean "everything".  */
+-extern INLINE int
++SIM_ARANGE_INLINE int
+ sim_addr_range_hit_p (ADDR_RANGE * /*ar*/, address_word /*addr*/);
+ #define ADDR_RANGE_HIT_P(ar, addr) \
+   ((ar)->range_tree == NULL || sim_addr_range_hit_p ((ar), (addr)))
+ 
+ #ifdef HAVE_INLINE
+-#ifdef SIM_ARANGE_C
+-#define SIM_ARANGE_INLINE INLINE
+-#else
+-#define SIM_ARANGE_INLINE EXTERN_INLINE
+-#endif
+ #include "sim-arange.c"
+-#else
+-#define SIM_ARANGE_INLINE
+ #endif
+ #define SIM_ARANGE_C_INCLUDED
+ 
+diff --git a/gdb-7.6/sim/common/sim-inline.h b/gdb-7.6/sim/common/sim-inline.h
+index af75562..8a9c286 100644
+--- a/gdb-7.6/sim/common/sim-inline.h
++++ b/gdb-7.6/sim/common/sim-inline.h
+@@ -303,7 +303,9 @@
+ /* ??? Temporary, pending decision to always use extern inline and do a vast
+    cleanup of inline support.  */
+ #ifndef INLINE2
+-#if defined (__GNUC__)
++#if defined (__GNUC_GNU_INLINE__) || defined (__GNUC_STDC_INLINE__)
++#define INLINE2 __inline__ __attribute__ ((__gnu_inline__))
++#elif defined (__GNUC__)
+ #define INLINE2 __inline__
+ #else
+ #define INLINE2 /*inline*/
+-- 
+2.6.1
+
diff --git a/meta-oe/recipes-kernel/crash/crash/sim-ppc-drop-LIBS-from-psim-dependency.patch b/meta-oe/recipes-kernel/crash/crash/sim-ppc-drop-LIBS-from-psim-dependency.patch
new file mode 100644
index 0000000..77a287f
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/sim-ppc-drop-LIBS-from-psim-dependency.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Backport
+
+https://sourceware.org/git/?p=binutils-gdb.git;h=0d8a6ab
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From 0d8a6ab7d39d28fb1557e2a62e9e4b336341ab34 Mon Sep 17 00:00:00 2001
+From: Aaro Koskinen <aaro.koskinen@iki.fi>
+Date: Mon, 17 Feb 2014 17:12:59 -0500
+Subject: [PATCH] sim: ppc: drop $(LIBS) from psim dependency
+
+When cross-compiling GDB for PPC, there's a prerequisite "-lz" for psim
+that results in a build failure. With such prerequisite, GNU Make will
+try to search the library from build machine's /usr/lib which is wrong.
+On 64-bit Linux build machines the compilation will fail because of this.
+
+URL: https://sourceware.org/bugzilla/show_bug.cgi?id=12202
+---
+ sim/ppc/Makefile.in | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/gdb-7.6/sim/ppc/Makefile.in b/gdb-7.6/sim/ppc/Makefile.in
+index b811f6f..740bdb0 100644
+--- a/gdb-7.6/sim/ppc/Makefile.in
++++ b/gdb-7.6/sim/ppc/Makefile.in
+@@ -552,7 +552,7 @@ PACKAGE_SRC = @sim_pk_src@
+ PACKAGE_OBJ = @sim_pk_obj@
+ 
+ 
+-psim: $(TARGETLIB) main.o $(LIBIBERTY_LIB) $(BFD_LIB) $(LIBS) $(LIBINTL_DEP)
++psim: $(TARGETLIB) main.o $(LIBIBERTY_LIB) $(BFD_LIB) $(LIBINTL_DEP)
+ 	$(CC) $(CFLAGS) $(SIM_CFLAGS) $(LDFLAGS) -o psim$(EXEEXT) main.o $(TARGETLIB) $(BFD_LIB) $(LIBINTL) $(LIBIBERTY_LIB) $(LIBS)
+ 
+ run: psim
+-- 
+1.9.4
+
diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.2.bb b/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
similarity index 70%
rename from meta-oe/recipes-kernel/crash/crash_7.1.2.bb
rename to meta-oe/recipes-kernel/crash/crash_7.1.3.bb
index f1e02e9..f6934f7 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.1.2.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
@@ -7,42 +7,60 @@ offered by Mission Critical Linux, or the LKCD kernel patch."
 HOMEPAGE = "http://people.redhat.com/anderson"
 SECTION = "devel"
 
-inherit gettext
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "zlib readline"
 
-SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz \
+SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
+           http://ftp.gnu.org/gnu/gdb/gdb-7.6.tar.gz;name=gdb;subdir=${BP} \
            file://7001force_define_architecture.patch \ 
            file://7003cross_ranlib.patch \
            file://0001-cross_add_configure_option.patch \
+           file://sim-ppc-drop-LIBS-from-psim-dependency.patch \
+           file://sim-common-sim-arange-fix-extern-inline-handling.patch \
+           file://donnot-extract-gdb-during-do-compile.patch \
+           file://gdb_build_jobs_and_not_write_crash_target.patch \
+           file://remove-unrecognized-gcc-option-m32-for-mips.patch \
            "
 
-SRC_URI[md5sum] = "04db2dde0d5e1dacbe3b820df3957742"
-SRC_URI[sha256sum] = "630664a00cbf5d7357f8dcdfc45e73ea62a2a517bd349ab73f0d704d10b01c55"
+SRC_URI[md5sum] = "155889a233c5230ef1d387858091d294"
+SRC_URI[sha256sum] = "ae98529d42b843f07d795b86b8f8529f64cc607ee3c58affc5a8aa8a506e183d"
 
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
+SRC_URI[gdb.md5sum] = "a9836707337e5f7bf76a009a8904f470"
+SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
+
+inherit gettext
+
+# crash 7.1.3 and before don't support mips64
+COMPATIBLE_HOST = "^(?!mips64).*"
 
 EXTRA_OEMAKE = 'RPMPKG="${PV}" \
                 GDB_TARGET="${TARGET_SYS}" \
                 GDB_HOST="${BUILD_SYS}" \
+                GDB_MAKE_JOBS="${PARALLEL_MAKE}" \
                 '
+
 do_configure() {
     :
 }
 
 do_compile_prepend() {
-   case ${TARGET_ARCH} in
-                arm*)     ARCH=ARM ;;
-                i*86*)    ARCH=X86 ;;
-                powerpc*) ARCH=PPC ;;
-                x86_64*)  ARCH=X86_64 ;;
-        esac
+    case ${TARGET_ARCH} in
+        aarch64*)    ARCH=ARM64 ;;
+        arm*)        ARCH=ARM ;;
+        i*86*)       ARCH=X86 ;;
+        x86_64*)     ARCH=X86_64 ;;
+        powerpc64*)  ARCH=PPC64 ;;
+        powerpc*)    ARCH=PPC ;;
+        mips*)       ARCH=MIPS ;;
+    esac
 
     sed -i s/FORCE_DEFINE_ARCH/"${ARCH}"/g ${S}/configure.c
     sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define TARGET_CFLAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c
     sed -i 's/&gt;/>/g' ${S}/Makefile
 }
+
 do_compile() {
     oe_runmake ${EXTRA_OEMAKE}
 }
@@ -56,6 +74,7 @@ do_install () {
     install -m 0644 ${S}/crash.8 ${D}/${mandir}/man8/
     install -m 0644 ${S}/defs.h ${D}${includedir}/crash
 }   
+
 RDEPENDS_${PN} += "liblzma"
 
 # Causes gcc to get stuck and eat all available memory in qemuarm builds
-- 
2.6.1


