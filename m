Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QEg5q-0005u9-Mk
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 13:06:12 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p3QB3XdF004783
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 26 Apr 2011 13:03:34 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Tue, 26 Apr 2011 13:03:33 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2011 13:03:31 +0200
Message-Id: <1303815811-10323-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.4.4
X-Spam-Score: -1.3
X-Spam-Level: -
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] dietlibc: rewrote recipes
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
X-List-Received-Date: Tue, 26 Apr 2011 11:06:12 -0000

dietlibc was splitted into target and cross recipes.  These recipes
build now the latest stable version, from upstream CVS or from a github
repository with lot of fixes.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 recipes/dietlibc/dietlibc-0.32.inc             |   24 ++++++
 recipes/dietlibc/dietlibc-0.32/ccache.patch    |   74 -------------------
 recipes/dietlibc/dietlibc-0.32/diethome.patch  |   24 ------
 recipes/dietlibc/dietlibc-0.32/getrlimit.patch |   12 ---
 recipes/dietlibc/dietlibc-common.inc           |   81 +++++++++++++++++++++
 recipes/dietlibc/dietlibc-cross.inc            |   20 +++++
 recipes/dietlibc/dietlibc-cross_0.32.bb        |    2 +
 recipes/dietlibc/dietlibc-cross_cvs.bb         |    2 +
 recipes/dietlibc/dietlibc-cross_git.bb         |    2 +
 recipes/dietlibc/dietlibc-cvs.inc              |   27 +++++++
 recipes/dietlibc/dietlibc-git.inc              |   15 ++++
 recipes/dietlibc/dietlibc.inc                  |   79 ++++++++++++--------
 recipes/dietlibc/dietlibc_0.31.bb              |   11 ---
 recipes/dietlibc/dietlibc_0.32.bb              |   16 ++---
 recipes/dietlibc/dietlibc_cvs.bb               |    9 +++
 recipes/dietlibc/dietlibc_git.bb               |    8 ++
 recipes/dietlibc/files/ai_addrconfig.patch     |   13 ----
 recipes/dietlibc/files/ccache.patch            |   36 +++++-----
 recipes/dietlibc/files/getrlimit.patch         |   12 +++
 recipes/dietlibc/files/runtests-X.sh           |   93 ++++++++++++++++++++++++
 20 files changed, 367 insertions(+), 193 deletions(-)
 create mode 100644 recipes/dietlibc/dietlibc-0.32.inc
 delete mode 100644 recipes/dietlibc/dietlibc-0.32/ccache.patch
 delete mode 100644 recipes/dietlibc/dietlibc-0.32/diethome.patch
 delete mode 100644 recipes/dietlibc/dietlibc-0.32/getrlimit.patch
 create mode 100644 recipes/dietlibc/dietlibc-common.inc
 create mode 100644 recipes/dietlibc/dietlibc-cross.inc
 create mode 100644 recipes/dietlibc/dietlibc-cross_0.32.bb
 create mode 100644 recipes/dietlibc/dietlibc-cross_cvs.bb
 create mode 100644 recipes/dietlibc/dietlibc-cross_git.bb
 create mode 100644 recipes/dietlibc/dietlibc-cvs.inc
 create mode 100644 recipes/dietlibc/dietlibc-git.inc
 delete mode 100644 recipes/dietlibc/dietlibc_0.31.bb
 create mode 100644 recipes/dietlibc/dietlibc_cvs.bb
 create mode 100644 recipes/dietlibc/dietlibc_git.bb
 delete mode 100644 recipes/dietlibc/files/ai_addrconfig.patch
 create mode 100644 recipes/dietlibc/files/getrlimit.patch
 create mode 100644 recipes/dietlibc/files/runtests-X.sh

diff --git a/recipes/dietlibc/dietlibc-0.32.inc b/recipes/dietlibc/dietlibc-0.32.inc
new file mode 100644
index 0000000..df94324
--- /dev/null
+++ b/recipes/dietlibc/dietlibc-0.32.inc
@@ -0,0 +1,24 @@
+SRC_URI = " \
+        http://www.kernel.org/pub/linux/libs/dietlibc/dietlibc-${PV}.tar.bz2 \
+        file://ccache.patch \
+        file://ceil.patch \
+        file://getrlimit.patch \
+"
+SRC_URI[md5sum] = "0098761c17924c15e21d25acdda4a8b5"
+SRC_URI[sha256sum] = "6613a2cae3b39e340779735d7500d284f5a691c5ed67e59a6057e0888726e458"
+
+# SMP build is broken
+PARALLEL_MAKE = ""
+
+# prefer the 'git' version which fixes lot of issues
+DEFAULT_PREFERENCE = "-2"
+
+# ARM EABI not fixable without complex patches
+DEFAULT_PREFERENCE_arm = "-99"
+
+do_configure_append () {
+    install -d -m 0755 bin-${DIETLIBC_BUILD_ARCH}
+    install -d -m 0755 bin-${DIETLIBC_TARGET_ARCH}
+
+    sed -i -e 's!\$(CROSS)strip!$(STRIP)!g' Makefile
+}
diff --git a/recipes/dietlibc/dietlibc-0.32/ccache.patch b/recipes/dietlibc/dietlibc-0.32/ccache.patch
deleted file mode 100644
index fb067f0..0000000
--- a/recipes/dietlibc/dietlibc-0.32/ccache.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-Index: dietlibc-0.32/diet.c
-===================================================================
---- dietlibc-0.32.orig/diet.c	2009-03-17 00:17:58.000000000 +0100
-+++ dietlibc-0.32/diet.c	2009-10-02 14:12:14.306929201 +0200
-@@ -132,7 +132,12 @@
-     }
-   }
-   {
--    char *cc=argv[1];
-+    char *cc;
-+    if (!strcmp(argv[1],"ccache")) {
-+	cc=argv[2];
-+    } else {
-+   	cc=argv[1];
-+    }
-     char *tmp=strchr(cc,0)-2;
-     char *tmp2,*tmp3;
-     if (tmp<cc) goto donttouch;
-@@ -144,7 +149,7 @@
-       if (tmp3<tmp2) tmp2=tmp3;
-       if (tmp2-cc>90) error("platform name too long!\n");
-       shortplatform=platform+len;
--      memmove(shortplatform,argv[1],(size_t)(tmp2-cc));
-+      memmove(shortplatform,cc,(size_t)(tmp2-cc));
-       platform[tmp2-cc+len]=0;
-       if (shortplatform[0]=='i' && shortplatform[2]=='8' && shortplatform[3]=='6') shortplatform[1]='3';
-     } else {
-@@ -291,6 +296,9 @@
- 
-       dest=newargv;
-       *dest++=argv[1];
-+      if (strcmp(argv[1],"ccache") == 0) {
-+	 *dest++=argv[2];
-+      }
-       if (argv[2]) {
- 	if (!strcmp(argv[2],"-V")) {
- 	  *dest++=argv[2];
-@@ -300,9 +308,9 @@
- 	} else if (!memcmp(argv[2],"-V",2)) {
- 	  *dest++=argv[2];
- 	  ++argv;
--	  --argc;
- 	}
-       }
-+
- #ifndef __DYN_LIB
-       if (_link) { *dest++=(char*)nostdlib; *dest++=dashstatic; *dest++=dashL; }
- #else
-@@ -320,7 +328,15 @@
- #ifdef WANT_DYNAMIC
-       if (_link) { *dest++=d; }
- #endif
--      for (i=2; i<argc; ++i) {
-+      if (strcmp(argv[1],"ccache") == 0) {
-+          i=3;
-+      } else {
-+          i=2;
-+      }
-+      for (i; i<argc; ++i) {
-+        if (strstr(argv[i],"isystem") != NULL)
-+          continue;
-+
- 	if (!strcmp(argv[i],"-pthread")) {
- 	  *dest++="-D_REENTRANT";
- 	  if (_link) *dest++="-lpthread";
-@@ -333,6 +349,8 @@
- 	      continue;
- 	  }
- 	*dest++=argv[i];
-+	*dest--;
-+	*dest++;
-       }
- #ifndef __DYN_LIB
-       if (compile || _link) {
diff --git a/recipes/dietlibc/dietlibc-0.32/diethome.patch b/recipes/dietlibc/dietlibc-0.32/diethome.patch
deleted file mode 100644
index ee05b23..0000000
--- a/recipes/dietlibc/dietlibc-0.32/diethome.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Index: dietlibc-0.32/Makefile
-===================================================================
---- dietlibc-0.32.orig/Makefile	2008-05-09 06:36:56.000000000 +0200
-+++ dietlibc-0.32/Makefile	2009-10-02 14:39:58.059248076 +0200
-@@ -295,16 +295,16 @@
- $(SYSCALLOBJ): syscalls.h
- 
- $(OBJDIR)/elftrunc: $(OBJDIR)/diet contrib/elftrunc.c
--	bin-$(MYARCH)/diet $(CROSS)$(CC) $(CFLAGS) -o $@ contrib/elftrunc.c
-+	DIETHOME=$(PWD) bin-$(MYARCH)/diet $(CROSS)$(CC) $(CFLAGS) -o $@ contrib/elftrunc.c
- 
- $(OBJDIR)/dnsd: $(OBJDIR)/diet contrib/dnsd.c
--	bin-$(MYARCH)/diet $(CROSS)$(CC) $(CFLAGS) -o $@ contrib/dnsd.c
-+	DIETHOME=$(PWD) bin-$(MYARCH)/diet $(CROSS)$(CC) $(CFLAGS) -o $@ contrib/dnsd.c
- 
- VERSION=dietlibc-$(shell head -n 1 CHANGES|sed 's/://')
- CURNAME=$(notdir $(shell pwd))
- 
- $(OBJDIR)/diet: $(OBJDIR)/start.o $(OBJDIR)/dyn_start.o diet.c $(OBJDIR)/dietlibc.a $(OBJDIR)/dyn_stop.o
--	$(CROSS)$(CC) -isystem include $(CFLAGS) -nostdlib -o $@ $^ -DDIETHOME=\"$(HOME)\" -DVERSION=\"$(VERSION)\" -lgcc
-+	$(CROSS)$(CC) -isystem include $(CFLAGS) -nostdlib -o $@ $^ -DDIETHOME=\"$(prefix)\" -DVERSION=\"$(VERSION)\" -lgcc
- 	$(CROSS)strip -R .comment -R .note $@
- 
- $(OBJDIR)/diet-i: $(OBJDIR)/start.o $(OBJDIR)/dyn_start.o diet.c $(OBJDIR)/dietlibc.a $(OBJDIR)/dyn_stop.o
diff --git a/recipes/dietlibc/dietlibc-0.32/getrlimit.patch b/recipes/dietlibc/dietlibc-0.32/getrlimit.patch
deleted file mode 100644
index 1d9792e..0000000
--- a/recipes/dietlibc/dietlibc-0.32/getrlimit.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: dietlibc-0.32/syscalls.s/getrlimit.S
-===================================================================
---- dietlibc-0.32.orig/syscalls.s/getrlimit.S	2001-01-09 18:57:48.000000000 +0100
-+++ dietlibc-0.32/syscalls.s/getrlimit.S	2009-10-03 14:28:55.098309914 +0200
-@@ -1,3 +1,7 @@
- #include "syscalls.h"
- 
-+#if defined(__ARM_EABI__)
-+syscall(ugetrlimit,getrlimit)
-+#else
- syscall(getrlimit,getrlimit)
-+#endif
diff --git a/recipes/dietlibc/dietlibc-common.inc b/recipes/dietlibc/dietlibc-common.inc
new file mode 100644
index 0000000..02aaa02
--- /dev/null
+++ b/recipes/dietlibc/dietlibc-common.inc
@@ -0,0 +1,81 @@
+DESCRIPTION = "The diet libc is a libc that is optimized for small size. \
+It can be used to create small statically linked binaries"
+SECTION = "libs"
+LICENSE = "GPLv2"
+INC_PR = "r1"
+PR = "${INC_PR}.0"
+
+EXTRA_OEMAKE = "\
+        STRIP=: \
+        prefix=${pkglibdir} \
+        HOME=\"`pwd`\" \
+        MYARCH:='${DIETLIBC_BUILD_ARCH}' \
+"
+
+PACKAGES += "${PN}-headers"
+RDEPENDS_${PN}-dev += "${PN}-headers (= ${EXTENDPV})"
+
+FILES_${PN} = "${bindir}/*"
+FILES_${PN}-headers = "${pkglibdir}/include"
+FILES_${PN}-dev = "${pkgarchdir}/*"
+FILES_${PN}-dbg += "${pkgarchdir}/.debug"
+
+export DIETLIBC_BUILD_ARCH="${@re.sub('i[0-9]86','i386','${BUILD_ARCH}')}"
+export DIETLIBC_TARGET_ARCH="${@re.sub('i[0-9]86','i386','${TARGET_ARCH}')}"
+
+export QEMU = "${@qemu_target_binary(d)}"
+
+pkglibdir = "${libdir}/dietlibc"
+pkgarchdir = "${pkglibdir}/lib-${DIETLIBC_TARGET_ARCH}"
+
+do_configure () {
+    dietlibc_fix_features "${DIETLIBC_BUILD_ARCH}" dietfeatures-build.h
+    dietlibc_fix_features "${DIETLIBC_TARGET_ARCH}" dietfeatures-target.h
+
+    rm -f dietfeatures.h
+
+    # Initialize infrastructure for our tests
+    for i in `find test -name 'runtests.sh'`; do
+        ln -s ${WORKDIR}/runtests-X.sh `dirname $i`/runtests-X.sh
+    done
+}
+
+dietlibc_fix_features () {
+    arch=$1
+    dst=$2
+
+    # LARGEFILE_BACKCOMPAT is some linux 2.2 thing
+    set -- -e '/#define \(WANT_LARGEFILE_BACKCOMPAT\|WANT_VALGRIND_SUPPORT\)/d'
+
+    case $arch in
+    (x86_64|ppc|ppc64)
+    ;;
+
+    (*)
+    set -- \
+        -e '/#define WANT_DYN_PAGESIZE/{c\'     \
+        -e '#define WANT_ELFINFO'               \
+        -e '}'
+    esac
+
+    sed "$@" dietfeatures.h > "$dst"
+}
+
+dietlibc_install_dev () {
+    install -d -m 0755 ${D}${pkgarchdir}
+    install -d -m 0755 ${D}${pkglibdir}/include
+
+    for i in `find include -name \*.h`; do
+        install -D -p -m 0644 $i ${D}${pkglibdir}/$i
+    done
+
+    cd bin-${DIETLIBC_TARGET_ARCH}
+    install -p -m 0644 \
+        start.o libm.a libpthread.a librpc.a liblatin1.a libcompat.a libcrypt.a \
+        pstart.o libgmon.a \
+        ${D}${pkgarchdir}/
+
+    # extra step because 'dietlibc.a' must be renamed to 'libc.a'
+    install -D -p -m 0644 dietlibc.a ${D}${pkgarchdir}/libc.a
+    cd -
+}
diff --git a/recipes/dietlibc/dietlibc-cross.inc b/recipes/dietlibc/dietlibc-cross.inc
new file mode 100644
index 0000000..25319f3
--- /dev/null
+++ b/recipes/dietlibc/dietlibc-cross.inc
@@ -0,0 +1,20 @@
+require dietlibc-common.inc
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS += "dietlibc"
+RDEPENDS_${PN} += "dietlibc-dev dietlibc-headers"
+
+inherit cross
+
+libdir := "${STAGING_DIR_TARGET}${target_libdir}"
+
+do_compile () {
+    ln -sf dietfeatures-build.h dietfeatures.h
+    oe_runmake all ARCH="${DIETLIBC_BUILD_ARCH}"  \
+        CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" LDFLAGS="${BUILD_LDFLAGS}" \
+        WHAT='$(OBJDIR)/diet-i'
+}
+
+do_install() {
+    install -D -p -m 0755 bin-${DIETLIBC_BUILD_ARCH}/diet-i ${D}${bindir}/diet
+}
diff --git a/recipes/dietlibc/dietlibc-cross_0.32.bb b/recipes/dietlibc/dietlibc-cross_0.32.bb
new file mode 100644
index 0000000..2d8eee6
--- /dev/null
+++ b/recipes/dietlibc/dietlibc-cross_0.32.bb
@@ -0,0 +1,2 @@
+require dietlibc-${PV}.inc
+require dietlibc-cross.inc
diff --git a/recipes/dietlibc/dietlibc-cross_cvs.bb b/recipes/dietlibc/dietlibc-cross_cvs.bb
new file mode 100644
index 0000000..14ab2c1
--- /dev/null
+++ b/recipes/dietlibc/dietlibc-cross_cvs.bb
@@ -0,0 +1,2 @@
+require dietlibc-cvs.inc
+require dietlibc-cross.inc
diff --git a/recipes/dietlibc/dietlibc-cross_git.bb b/recipes/dietlibc/dietlibc-cross_git.bb
new file mode 100644
index 0000000..f478db6
--- /dev/null
+++ b/recipes/dietlibc/dietlibc-cross_git.bb
@@ -0,0 +1,2 @@
+require dietlibc-git.inc
+require dietlibc-cross.inc
diff --git a/recipes/dietlibc/dietlibc-cvs.inc b/recipes/dietlibc/dietlibc-cvs.inc
new file mode 100644
index 0000000..c83b223
--- /dev/null
+++ b/recipes/dietlibc/dietlibc-cvs.inc
@@ -0,0 +1,27 @@
+SRCDATE = "20110311"
+PV = "0.32+cvs${SRCDATE}"
+
+SRC_URI = " \
+        cvs://cvs@cvs.fefe.de/cvs;method=pserver;module=dietlibc;date=${SRCDATE} \
+        file://ccache.patch \
+        file://ceil.patch \
+        file://getrlimit.patch \
+"
+
+S = "${WORKDIR}/dietlibc"
+
+# SMP build is broken
+PARALLEL_MAKE = ""
+
+# prefer the 'git' version which fixes lot of issues
+DEFAULT_PREFERENCE = "-1"
+
+# ARM EABI not fixable without complex patches
+DEFAULT_PREFERENCE_arm = "-99"
+
+do_configure_append () {
+    install -d -m 0755 bin-${DIETLIBC_BUILD_ARCH}
+    install -d -m 0755 bin-${DIETLIBC_TARGET_ARCH}
+
+    sed -i -e 's!\$(CROSS)strip!$(STRIP)!g' Makefile
+}
diff --git a/recipes/dietlibc/dietlibc-git.inc b/recipes/dietlibc/dietlibc-git.inc
new file mode 100644
index 0000000..e2e4595
--- /dev/null
+++ b/recipes/dietlibc/dietlibc-git.inc
@@ -0,0 +1,15 @@
+SRCREV = "e1910c6289f754dcbf863d309ed8b72452a5de74"
+_pv = "0.32"
+PR = "r0"
+
+inherit gitpkgv
+
+PV = "${_pv}+gitr${SRCPV}"
+PKGV = "${_pv}+gitr${GITPKGV}"
+
+SRC_URI = " \
+        git://github.com/ensc/dietlibc.git;protocol=git;branch=master \
+        file://ccache.patch \
+        file://runtests-X.sh \
+"
+S = "${WORKDIR}/git"
diff --git a/recipes/dietlibc/dietlibc.inc b/recipes/dietlibc/dietlibc.inc
index 5532648..b1e3daf 100644
--- a/recipes/dietlibc/dietlibc.inc
+++ b/recipes/dietlibc/dietlibc.inc
@@ -1,42 +1,59 @@
-SECTION = "libs"
-DESCRIPTION = "The diet libc is a libc that is optimized for small size. \
-It can be used to create small statically linked binaries"
-LICENSE = "GPLv2"
+require dietlibc-common.inc
 
-INC_PR = "r3"
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS += "gcc-native virtual/${TARGET_PREFIX}gcc \
+            virtual/${TARGET_PREFIX}binutils"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/libs/dietlibc/dietlibc-${PV}.tar.bz2" 
+CFLAGS += "-fno-exceptions -std=gnu99 -Os -Wall -Wmissing-prototypes"
+_target_test_cflags = "${CFLAGS} -L ${S}/bin-${DIETLIBC_TARGET_ARCH} \
+    -fno-builtin"
 
-#otherwise the whole run scripts got broken
-do_configure () {
-:
+do_compile () {
+    ln -sf dietfeatures-build.h dietfeatures.h
+    oe_runmake all ARCH="${DIETLIBC_BUILD_ARCH}"  \
+        CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" LDFLAGS="${BUILD_LDFLAGS}" \
+        WHAT='$(OBJDIR)/diet'
+
+    ln -sf dietfeatures-target.h dietfeatures.h
+    oe_runmake all profiling ARCH="${DIETLIBC_TARGET_ARCH}" \
+        CC="${CC}" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
 }
 
-do_compile () {
-	oe_runmake all CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" prefix=${STAGING_DIR_TARGET}/lib/dietlibc
-	oe_runmake all ARCH="${TARGET_ARCH}" CC="${BUILD_CC}" CROSS="${HOST_PREFIX}" prefix=${STAGING_DIR_TARGET}/lib/dietlibc
+do_install () {
+    dietlibc_install_dev
+    install -D -p -m 0755 bin-${DIETLIBC_TARGET_ARCH}/diet-i ${D}${bindir}/diet
 }
 
-#no packages needed, all binaries will be compiled with -static
-PACKAGES = ""
+dietlibc_build_tests () {
+    rc=0
+    # Allow to build as much as possible and return an error code when
+    # something went wrong
+    ( oe_runmake -C test all test DIET=${S}/bin-${DIETLIBC_BUILD_ARCH}/diet \
+        CC="${CC}" CFLAGS="${_target_test_cflags}" LDFLAGS="${LDFLAGS}" \
+        "$@" ) || rc=$?
 
-#otherwise the whole run scripts got broken
+    ( oe_runmake -C test/inet all DIET=${S}/bin-${DIETLIBC_BUILD_ARCH}/diet \
+        CC="${CC}" CFLAGS="${_target_test_cflags}" LDFLAGS="${LDFLAGS}" \
+        "$@" ) || rc=$?
 
-do_install () {
-	DIETLIBC_BUILD_ARCH=`echo ${BUILD_ARCH} | sed -e s'/.86/386/'`
-	DIETLIBC_TARGET_ARCH=`echo ${TARGET_ARCH} | sed -e s'/.86/386/'`
-
-	install -d ${D}${libdir}/dietlibc/include
-        for i in `find include -name \*.h`; do install -m 644 -D $i ${D}${libdir}/dietlibc/$i; done
-
-        install -d ${D}${bindir} 
-        install -m755 bin-${DIETLIBC_BUILD_ARCH}/diet-i ${D}${bindir}/diet
-	
-	cd bin-${DIETLIBC_TARGET_ARCH}
-	install -d ${D}${libdir}/dietlibc/lib-${DIETLIBC_TARGET_ARCH}
-	install -m 644 start.o libm.a libpthread.a librpc.a \
-                       liblatin1.a libcompat.a libcrypt.a \
-		       ${D}${libdir}/dietlibc/lib-${DIETLIBC_TARGET_ARCH}
-        install -m 644 dietlibc.a ${D}${libdir}/dietlibc/lib-${DIETLIBC_TARGET_ARCH}/libc.a
+    return $rc
 }
 
+dietlibc_do_full_test () {
+    ## Check for references to __NR_ symbols which indicates missing
+    ## syscall implementations
+    if ${TARGET_PREFIX}nm bin-${DIETLIBC_TARGET_ARCH}/*.a | grep 'U __NR_' >&2; then
+        echo "ERROR: unimplemented syscalls found" >&2
+        exit 1
+    fi
+
+
+    ## Build and run the testsuite (when emulator is available)
+    dietlibc_build_tests
+
+    if type -p "$QEMU" && test x"$QEMU" != x"false"; then
+       cd test
+       env EMULATOR="${QEMU} ${QEMU_OPTIONS}" bash ${WORKDIR}/runtests-X.sh
+       cd -
+    fi
+}
diff --git a/recipes/dietlibc/dietlibc_0.31.bb b/recipes/dietlibc/dietlibc_0.31.bb
deleted file mode 100644
index b5da9ec..0000000
--- a/recipes/dietlibc/dietlibc_0.31.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require dietlibc.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI += "file://ccache.patch \
-            file://ceil.patch \
-            file://ai_addrconfig.patch \
-           "
-
-SRC_URI[md5sum] = "acb98d469ee932d902fdf6de07802b7c"
-SRC_URI[sha256sum] = "99613d6a67f747f52e4184c613f7cba5cbb76af237c9acd04742e3ca24cf56cd"
diff --git a/recipes/dietlibc/dietlibc_0.32.bb b/recipes/dietlibc/dietlibc_0.32.bb
index ce6c53f..5654085 100644
--- a/recipes/dietlibc/dietlibc_0.32.bb
+++ b/recipes/dietlibc/dietlibc_0.32.bb
@@ -1,13 +1,9 @@
+require dietlibc-${PV}.inc
 require dietlibc.inc
 
-PR = "${INC_PR}.2"
+inherit test
 
-SRC_URI += "file://ccache.patch \
-            file://ceil.patch \
-            file://diethome.patch \
-            file://getrlimit.patch \
-           " 
-
-
-SRC_URI[md5sum] = "0098761c17924c15e21d25acdda4a8b5"
-SRC_URI[sha256sum] = "6613a2cae3b39e340779735d7500d284f5a691c5ed67e59a6057e0888726e458"
+do_test() {
+    # Testsuite does not build for ARM; try it nevertheless but ignore errors
+    dietlibc_build_tests -k || :
+}
diff --git a/recipes/dietlibc/dietlibc_cvs.bb b/recipes/dietlibc/dietlibc_cvs.bb
new file mode 100644
index 0000000..2b9a817
--- /dev/null
+++ b/recipes/dietlibc/dietlibc_cvs.bb
@@ -0,0 +1,9 @@
+require dietlibc-cvs.inc
+require dietlibc.inc
+
+inherit test
+
+do_test() {
+    # Testsuite does not build for ARM; try it nevertheless but ignore errors
+    dietlibc_build_tests -k || :
+}
diff --git a/recipes/dietlibc/dietlibc_git.bb b/recipes/dietlibc/dietlibc_git.bb
new file mode 100644
index 0000000..1465729
--- /dev/null
+++ b/recipes/dietlibc/dietlibc_git.bb
@@ -0,0 +1,8 @@
+require dietlibc-git.inc
+require dietlibc.inc
+
+inherit qemu test
+
+do_test() {
+    dietlibc_do_full_test
+}
diff --git a/recipes/dietlibc/files/ai_addrconfig.patch b/recipes/dietlibc/files/ai_addrconfig.patch
deleted file mode 100644
index 5687e9f..0000000
--- a/recipes/dietlibc/files/ai_addrconfig.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: dietlibc-0.31/include/sys/socket.h
-===================================================================
---- dietlibc-0.31.orig/include/sys/socket.h	2009-02-03 13:39:38.475445568 +0100
-+++ dietlibc-0.31/include/sys/socket.h	2009-02-03 13:39:55.742105983 +0100
-@@ -439,6 +439,8 @@
- #define EAI_AGAIN -10
- #define EAI_SYSTEM -11
- 
-+#define AI_ADDRCONFIG 0
-+
- #define AI_NUMERICHOST 1
- #define AI_CANONNAME 2
- #define AI_PASSIVE 4
diff --git a/recipes/dietlibc/files/ccache.patch b/recipes/dietlibc/files/ccache.patch
index 839b5b9..fb067f0 100644
--- a/recipes/dietlibc/files/ccache.patch
+++ b/recipes/dietlibc/files/ccache.patch
@@ -1,8 +1,8 @@
-Index: dietlibc-0.31/diet.c
+Index: dietlibc-0.32/diet.c
 ===================================================================
---- dietlibc-0.31.orig/diet.c	2006-08-27 15:49:00.000000000 +0200
-+++ dietlibc-0.31/diet.c	2009-01-31 22:56:06.828080683 +0100
-@@ -127,7 +127,12 @@
+--- dietlibc-0.32.orig/diet.c	2009-03-17 00:17:58.000000000 +0100
++++ dietlibc-0.32/diet.c	2009-10-02 14:12:14.306929201 +0200
+@@ -132,7 +132,12 @@
      }
    }
    {
@@ -16,7 +16,7 @@ Index: dietlibc-0.31/diet.c
      char *tmp=strchr(cc,0)-2;
      char *tmp2,*tmp3;
      if (tmp<cc) goto donttouch;
-@@ -139,7 +144,7 @@
+@@ -144,7 +149,7 @@
        if (tmp3<tmp2) tmp2=tmp3;
        if (tmp2-cc>90) error("platform name too long!\n");
        shortplatform=platform+len;
@@ -25,8 +25,8 @@ Index: dietlibc-0.31/diet.c
        platform[tmp2-cc+len]=0;
        if (shortplatform[0]=='i' && shortplatform[2]=='8' && shortplatform[3]=='6') shortplatform[1]='3';
      } else {
-@@ -285,6 +290,9 @@
-
+@@ -291,6 +296,9 @@
+ 
        dest=newargv;
        *dest++=argv[1];
 +      if (strcmp(argv[1],"ccache") == 0) {
@@ -35,7 +35,7 @@ Index: dietlibc-0.31/diet.c
        if (argv[2]) {
  	if (!strcmp(argv[2],"-V")) {
  	  *dest++=argv[2];
-@@ -294,9 +302,9 @@
+@@ -300,9 +308,9 @@
  	} else if (!memcmp(argv[2],"-V",2)) {
  	  *dest++=argv[2];
  	  ++argv;
@@ -46,24 +46,24 @@ Index: dietlibc-0.31/diet.c
  #ifndef __DYN_LIB
        if (_link) { *dest++=(char*)nostdlib; *dest++=dashstatic; *dest++=dashL; }
  #else
-@@ -314,7 +322,15 @@
+@@ -320,7 +328,15 @@
  #ifdef WANT_DYNAMIC
        if (_link) { *dest++=d; }
  #endif
 -      for (i=2; i<argc; ++i) {
 +      if (strcmp(argv[1],"ccache") == 0) {
-+         i=3;
++          i=3;
 +      } else {
-+         i=2;
++          i=2;
 +      }
 +      for (i; i<argc; ++i) {
-+        if (strstr(argv[i],"isystem") != NULL) {
-+		continue;
-+	}
- 	if (mangleopts)
- 	  if (argv[i][0]=='-' && (argv[i][1]=='O' || argv[i][1]=='f' ||
- 				  (argv[i][1]=='m' && argv[i][2]!='3' && argv[i][2]!='6'))) {
-@@ -322,6 +338,8 @@
++        if (strstr(argv[i],"isystem") != NULL)
++          continue;
++
+ 	if (!strcmp(argv[i],"-pthread")) {
+ 	  *dest++="-D_REENTRANT";
+ 	  if (_link) *dest++="-lpthread";
+@@ -333,6 +349,8 @@
  	      continue;
  	  }
  	*dest++=argv[i];
diff --git a/recipes/dietlibc/files/getrlimit.patch b/recipes/dietlibc/files/getrlimit.patch
new file mode 100644
index 0000000..1d9792e
--- /dev/null
+++ b/recipes/dietlibc/files/getrlimit.patch
@@ -0,0 +1,12 @@
+Index: dietlibc-0.32/syscalls.s/getrlimit.S
+===================================================================
+--- dietlibc-0.32.orig/syscalls.s/getrlimit.S	2001-01-09 18:57:48.000000000 +0100
++++ dietlibc-0.32/syscalls.s/getrlimit.S	2009-10-03 14:28:55.098309914 +0200
+@@ -1,3 +1,7 @@
+ #include "syscalls.h"
+ 
++#if defined(__ARM_EABI__)
++syscall(ugetrlimit,getrlimit)
++#else
+ syscall(getrlimit,getrlimit)
++#endif
diff --git a/recipes/dietlibc/files/runtests-X.sh b/recipes/dietlibc/files/runtests-X.sh
new file mode 100644
index 0000000..ebc8932
--- /dev/null
+++ b/recipes/dietlibc/files/runtests-X.sh
@@ -0,0 +1,93 @@
+#! /bin/bash
+
+eval $(grep '^\(TESTPROGRAMS\|SUBDIRS\)=' runtests.sh)
+
+FAILURES_BOGUS=(
+  ":gethostbyname"		# network test; net might not be available in test environment
+  ":gethostbyname_r"		# network test; net might not be available in test environment
+
+  ":stdlib:tst-environ"		# test uses environ function in unsupported ways (dup keys)
+  ":stdlib:tst-rand48"		# platform dependent; does not give reliable results
+  ":stdlib:tst-strtod"		# infinite recursion in __dtostr()
+  ":time:tst-mktime"		# dietlibc does not support $TZ env
+  ":time:tst-posixtz"		# dietlibc does not support $TZ env
+  ":time:tst-strftime"		# dietlibc does not support glibc specific format specifications
+)
+
+FAILURES_BOGUS_emulator=(
+  ":adjtime"			# ajdtimex() not implement in qemu
+  ":if_nameindex"		# ioctls not implement in qemu
+  ":mmap_test"			# qemu does not pass back mmap(2) error codes
+  ":fadvise"			# bad translation of 64bit args in qemu
+  ":stdio:tst-fseek"		# !! unclear; must be investigated
+)
+
+FAILURES_KNOWN=(
+  ":sendfile"			# stdin/stdout not supported; test must be wrapped
+  ":stdio:tstdiomisc"		# scanf(3) fails on some constructs
+  ":stdio:tst-fphex"		# printf(3) does not support %a specifiers
+  ":stdio:tst-printf"		# printf(3) does not support some floating point ops
+  ":stdio:tst-sscanf"		# scanf(3) fails on double input
+  ":stdlib:test-canon"		# realpath(3) is broken...
+)
+
+function is_in() {
+    local	val=$1
+    local	i
+    shift
+
+    for i; do
+	test x"$i" != x"$val" || return 0
+    done
+    return 1
+}
+
+rc=0
+
+: ${EMULATOR:=}
+: ${RUNTEST_INDENT=0}
+export RUNTEST_INDENT
+export RUNTEST_NS
+
+test -z "$EMULATOR" || \
+    FAILURES_BOGUS=( "${FAILURES_BOGUS[@]}" "${FAILURES_BOGUS_emulator[@]}" )
+
+for p in $TESTPROGRAMS; do
+    ! tty -s || printf '%*s%-20s' $RUNTEST_INDENT '' "$p"
+
+    is_in "$RUNTEST_NS:$p" "${FAILURES_BOGUS[@]}" && fail_bogus=true || fail_bogus=false
+    is_in "$RUNTEST_NS:$p" "${FAILURES_KNOWN[@]}" && fail_known=true || fail_known=false
+    $EMULATOR ./$p >/dev/null && failed=false || failed=true
+
+    case $failed:$fail_known:$fail_bogus in
+      (false:false:*)		res='OK';;
+      (false:true:true)		res='OK (bogus)';;
+      (false:true:false)	res="OK (unexpected)"; let ++rc;;
+      (true:*:true)		res='FAIL (bogus)';;
+      (true:true:*)		res="FAIL (known)";;
+      (true:false:*)		res='FAIL'; let ++rc;;
+    esac
+
+    ! tty -s || printf '\r'
+
+    printf '%*s%-20s%s\n' $RUNTEST_INDENT '' "$p" "$res"
+done
+
+test $rc -eq 0 || \
+    printf "%*s--> %u tests failed\n" $RUNTEST_INDENT '' $rc
+
+for d in $SUBDIRS; do
+    echo "--- entering directory $d ---"
+    let RUNTEST_INDENT+=2
+    old_ns=$RUNTEST_NS
+    RUNTEST_NS=$RUNTEST_NS:$d
+
+    cd $d && bash ./runtests-X.sh || let ++rc
+
+    RUNTEST_NS=$old_ns
+    let RUNTEST_INDENT-=2
+
+    cd $OLDPWD || exit 1
+done
+
+test $rc -eq 0 && exit 0 || exit 1
-- 
1.7.4.4



