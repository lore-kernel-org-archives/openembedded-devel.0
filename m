Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SpSwg-0002GV-PQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 01:37:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2012 16:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="171188829"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.24])
	by orsmga002.jf.intel.com with ESMTP; 12 Jul 2012 16:26:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 00:25:59 +0100
Message-Id: <1342135559-5532-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-multimedia][PATCH] xbmc: move from meta-oe to meta-multimedia
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
X-List-Received-Date: Thu, 12 Jul 2012 23:37:20 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...on-t-run-python-distutils-to-find-STAGING.patch |   31 +++++++
 ...d-ios-Add-memory-barriers-to-atomic-Add-S.patch |   97 ++++++++++++++++++++
 ...d-ios-Add-memory-barriers-to-cas-assembly.patch |   69 ++++++++++++++
 .../recipes-mediacentre/xbmc/xbmc_git.bb           |   77 ++++++++++++++++
 ...on-t-run-python-distutils-to-find-STAGING.patch |   31 -------
 ...d-ios-Add-memory-barriers-to-atomic-Add-S.patch |   97 --------------------
 ...d-ios-Add-memory-barriers-to-cas-assembly.patch |   69 --------------
 meta-oe/recipes-multimedia/xbmc/xbmc_git.bb        |   77 ----------------
 8 files changed, 274 insertions(+), 274 deletions(-)
 create mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/0001-configure-don-t-run-python-distutils-to-find-STAGING.patch
 create mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
 create mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
 create mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
 delete mode 100644 meta-oe/recipes-multimedia/xbmc/xbmc/0001-configure-don-t-run-python-distutils-to-find-STAGING.patch
 delete mode 100644 meta-oe/recipes-multimedia/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
 delete mode 100644 meta-oe/recipes-multimedia/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
 delete mode 100644 meta-oe/recipes-multimedia/xbmc/xbmc_git.bb

diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0001-configure-don-t-run-python-distutils-to-find-STAGING.patch b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0001-configure-don-t-run-python-distutils-to-find-STAGING.patch
new file mode 100644
index 0000000..dfc3959
--- /dev/null
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0001-configure-don-t-run-python-distutils-to-find-STAGING.patch
@@ -0,0 +1,31 @@
+From 0dce5a2abd9f42876616c35772a4d71c5399543c Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Sat, 17 Dec 2011 11:38:15 +0100
+Subject: [PATCH 1/4] configure: don't run python distutils to find STAGING_INCDIR/python, it is not safe for per-machine sysroots
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ m4/ax_python_devel.m4 |    7 +------
+ 1 files changed, 1 insertions(+), 6 deletions(-)
+
+diff --git a/m4/ax_python_devel.m4 b/m4/ax_python_devel.m4
+index adbd207..dee70f6 100644
+--- a/m4/ax_python_devel.m4
++++ b/m4/ax_python_devel.m4
+@@ -151,12 +151,7 @@ $ac_distutils_result])
+ 	#
+ 	AC_MSG_CHECKING([for Python include path])
+ 	if test -z "$PYTHON_CPPFLAGS"; then
+-		python_path=`$PYTHON -c "import distutils.sysconfig; \
+-			print (distutils.sysconfig.get_python_inc ());"`
+-		if test -n "${python_path}"; then
+-			python_path="-I$python_path"
+-		fi
+-		PYTHON_CPPFLAGS=$python_path
++		PYTHON_CPPFLAGS="-I${STAGING_INCDIR}/${PYTHON_DIR}"
+ 	fi
+ 	AC_MSG_RESULT([$PYTHON_CPPFLAGS])
+ 	AC_SUBST([PYTHON_CPPFLAGS])
+-- 
+1.7.2.5
+
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
new file mode 100644
index 0000000..e0a4037
--- /dev/null
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
@@ -0,0 +1,97 @@
+From 7b2a8a7869d257cba35f53f6d877877c29cdac27 Mon Sep 17 00:00:00 2001
+From: Paul Menzel <paulepanter@users.sourceforge.net>
+Date: Sun, 14 Aug 2011 21:53:47 +0200
+Subject: [PATCH 2/4] Revert "fixed:[ios] Add memory barriers to atomic Add/Subtract and Increment/Decrement functions to ensure synchronized accesses."
+
+This reverts commit 9a10c48710df79118e39e9b3bb0a15bf1fe694d1.
+
+The build (OpenEmbedded `angstrom-2010.x` for `MACHINE = "beagleboard") fails with the following error.
+
+        make -C xbmc/threads
+        make[1]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+9a10c48710df79118e39e9b3bb0a15bf1fe694d1/git/xbmc/threads'
+        CPP     Atomics.o
+        /tmp/ccIzTm3L.s: Assembler messages:
+        /tmp/ccIzTm3L.s:40: Error: garbage following instruction -- `dmb ish'
+        /tmp/ccIzTm3L.s:48: Error: garbage following instruction -- `dmb ish'
+        /tmp/ccIzTm3L.s:76: Error: garbage following instruction -- `dmb ish'
+        /tmp/ccIzTm3L.s:83: Error: garbage following instruction -- `dmb ish'
+        /tmp/ccIzTm3L.s:111: Error: garbage following instruction -- `dmb ish'
+        /tmp/ccIzTm3L.s:118: Error: garbage following instruction -- `dmb ish'
+        /tmp/ccIzTm3L.s:145: Error: garbage following instruction -- `dmb ish'
+        /tmp/ccIzTm3L.s:152: Error: garbage following instruction -- `dmb ish'
+        /tmp/ccIzTm3L.s:180: Error: garbage following instruction -- `dmb ish'
+        /tmp/ccIzTm3L.s:187: Error: garbage following instruction -- `dmb ish'
+        make[1]: *** [Atomics.o] Error 1
+        make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+9a10c48710df79118e39e9b3bb0a15bf1fe694d1/git/xbmc/threads'
+        make: *** [xbmc/threads/threads.a] Error 2
+---
+ xbmc/threads/Atomics.cpp |    8 --------
+ 1 files changed, 0 insertions(+), 8 deletions(-)
+
+diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
+index 5b09f18..0a98a7e 100644
+--- a/xbmc/threads/Atomics.cpp
++++ b/xbmc/threads/Atomics.cpp
+@@ -194,14 +194,12 @@ long AtomicIncrement(volatile long* pAddr)
+ {
+   register long val;
+   asm volatile (
+-                "dmb      ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
+                 "1:                     \n" 
+                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
+                 "add     %0,  #1        \n" // (val += 1)
+                 "strex   r1,  %0, [%1]	\n"
+                 "cmp     r1,   #0       \n"
+                 "bne     1b             \n"
+-                "dmb     ish            \n" // Memory barrier.
+                 : "=&r" (val)
+                 : "r"(pAddr)
+                 : "r1"
+@@ -273,14 +271,12 @@ long AtomicAdd(volatile long* pAddr, long amount)
+ {
+   register long val;
+   asm volatile (
+-                "dmb      ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
+                 "1:                     \n" 
+                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
+                 "add     %0,  %2        \n" // (val += amount)
+                 "strex   r1,  %0, [%1]	\n"
+                 "cmp     r1,   #0       \n"
+                 "bne     1b             \n"
+-                "dmb     ish            \n" // Memory barrier.
+                 : "=&r" (val)
+                 : "r"(pAddr), "r"(amount)
+                 : "r1"
+@@ -351,14 +347,12 @@ long AtomicDecrement(volatile long* pAddr)
+ {
+   register long val;
+   asm volatile (
+-                "dmb      ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
+                 "1:                     \n" 
+                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
+                 "sub     %0,  #1        \n" // (val -= 1)
+                 "strex   r1,  %0, [%1]	\n"
+                 "cmp     r1,   #0       \n"
+                 "bne     1b             \n"
+-                "dmb     ish            \n" // Memory barrier.
+                 : "=&r" (val)
+                 : "r"(pAddr)
+                 : "r1"
+@@ -431,14 +425,12 @@ long AtomicSubtract(volatile long* pAddr, long amount)
+ {
+   register long val;
+   asm volatile (
+-                "dmb     ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
+                 "1:                     \n" 
+                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
+                 "sub     %0,  %2        \n" // (val -= amount)
+                 "strex   r1,  %0, [%1]	\n"
+                 "cmp     r1,   #0       \n"
+                 "bne     1b             \n"
+-                "dmb     ish            \n" // Memory barrier.
+                 : "=&r" (val)
+                 : "r"(pAddr), "r"(amount)
+                 : "r1"
+-- 
+1.7.2.5
+
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
new file mode 100644
index 0000000..629017b
--- /dev/null
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
@@ -0,0 +1,69 @@
+From aaae1616a09d359b52e929f944ca0ceb4bb7f831 Mon Sep 17 00:00:00 2001
+From: Paul Menzel <paulepanter@users.sourceforge.net>
+Date: Sun, 14 Aug 2011 21:55:09 +0200
+Subject: [PATCH 3/4] Revert "fixed:[ios] Add memory barriers to cas() assembly to ensure alignment of memory accesses."
+
+This reverts commit 92bab651e2253d172879995b50985645b77fecd2.
+
+The build (OpenEmbedded `angstrom-2010.x` for `MACHINE = "beagleboard") fails with the following error.
+
+        CPP     Atomics.o
+        make[1]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+92bab651e2253d172879995b50985645b77fecd2/git/xbmc/windows'
+        CPP     GUIMediaWindow.o
+        /tmp/ccrsywuV.s: Assembler messages:
+        /tmp/ccrsywuV.s:40: Error: garbage following instruction -- `dmb ish'
+        /tmp/ccrsywuV.s:48: Error: garbage following instruction -- `dmb ish'
+        make[1]: *** [Atomics.o] Error 1
+        make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+92bab651e2253d172879995b50985645b77fecd2/git/xbmc/threads'
+        make: *** [xbmc/threads/threads.a] Error 2
+---
+ xbmc/threads/Atomics.cpp |   33 ++++++++++++++++-----------------
+ 1 files changed, 16 insertions(+), 17 deletions(-)
+
+diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
+index 0a98a7e..0967eb2 100644
+--- a/xbmc/threads/Atomics.cpp
++++ b/xbmc/threads/Atomics.cpp
+@@ -49,23 +49,22 @@ long cas(volatile long *pAddr, long expectedVal, long swapVal)
+ #elif defined(__arm__)
+ long cas(volatile long* pAddr, long expectedVal, long swapVal)
+ {
+-  register long prev;
+-  asm volatile (
+-                "dmb      ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
+-                "1:                      \n"
+-                "ldrex    %0, [%1]       \n" // Load the current value of *pAddr(%1) into prev (%0) and lock pAddr,
+-                "cmp      %0,  %2        \n" // Verify that the current value (%0) == old value (%2)
+-                "bne      2f             \n" // Bail if the two values are not equal [not as expected]
+-                "strex    r1,  %3, [%1]  \n"
+-                "cmp      r1,  #0        \n"
+-                "bne      1b             \n"
+-                "dmb      ish            \n" // Memory barrier.
+-                "2:                      \n"
+-                : "=&r" (prev)
+-                : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
+-                : "r1"
+-                );
+-  return prev;
++  return(__sync_val_compare_and_swap(pAddr, expectedVal, swapVal));
++//  register long prev;
++//  asm volatile (
++//                "1:                      \n"
++//                "ldrex    %0, [%1]       \n" /* Load the current value of *pAddr(%1) into prev (%0) and lock pAddr,  */
++//                "cmp      %0,  %2        \n" /* Verify that the current value (%0) == old value (%2) */
++//                "bne      2f             \n" /* Bail if the two values are not equal [not as expected] */
++//                "strex    r1,  %3, [%1]  \n"
++//                "cmp      r1,  #0        \n"                
++//                "bne      1b             \n"
++//                "2:                        "
++//                : "=&r" (prev)
++//                : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
++//                : "r1"
++//                );
++//  return prev;
+ }
+ 
+ #elif defined(__mips__)
+-- 
+1.7.2.5
+
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
new file mode 100644
index 0000000..f0ce7cf
--- /dev/null
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -0,0 +1,77 @@
+DESCRIPTION = "XBMC Media Center"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=6eb631b6da7fdb01508a80213ffc35ff"
+
+DEPENDS = "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib"
+#require recipes/egl/egl.inc
+
+SRCREV = "82388d55dae79cbb2e486e307e23202e76a43efa"
+
+PV = "11.0"
+PR = "r14"
+PR_append = "+gitr${SRCPV}"
+SRC_URI = "git://github.com/xbmc/xbmc.git;branch=eden;protocol=git \
+           file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
+           file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch \
+           file://0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch \
+          "
+
+inherit autotools gettext python-dir
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF = " \
+ --disable-rpath \
+ --enable-gles \
+ --enable-libusb \
+ --enable-airplay \
+ --disable-optical-drive \
+ --enable-external-libraries \
+"
+
+# for python modules
+export HOST_SYS
+export BUILD_SYS
+export STAGING_LIBDIR
+export STAGING_INCDIR
+export PYTHON_DIR
+
+do_configure() {
+	sh bootstrap
+	oe_runconf
+}
+
+PARALLEL_MAKE = ""
+
+do_compile_prepend() {
+
+	sed -i -e 's:-rpath \$(libdir)::g' lib/libid3tag/libid3tag/Makefile
+
+	for i in $(find . -name "Makefile") ; do
+		sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir):-rpath ${STAGING_LIBDIR}:g' $i
+	done
+
+	for i in $(find . -name "*.mak*") ; do
+		sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir)::g' $i
+	done
+	sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir)::g' ${S}/Makefile	
+}
+
+# on ARM architectures xbmc will use GLES which will make the regular wrapper fail, so start it directly
+do_install_append_arm() {
+	sed -i -e 's:Exec=xbmc:Exec=${libdir}/xbmc/xbmc.bin:g' ${D}${datadir}/applications/xbmc.desktop
+}
+
+FILES_${PN} += "${datadir}/xsessions ${datadir}/icons"
+FILES_${PN}-dbg += "${libdir}/xbmc/.debug ${libdir}/xbmc/*/.debug ${libdir}/xbmc/*/*/.debug ${libdir}/xbmc/*/*/*/.debug"
+
+# xbmc uses some kind of dlopen() method for libcec so we need to add it manually
+RRECOMMENDS_${PN}_append = " libcec \
+                             python \
+                             python-lang \
+                             python-re \
+                             "
+RRECOMMENDS_${PN}_append_libc-glibc = " glibc-charmap-ibm850 glibc-gconv-ibm850"
+
+
diff --git a/meta-oe/recipes-multimedia/xbmc/xbmc/0001-configure-don-t-run-python-distutils-to-find-STAGING.patch b/meta-oe/recipes-multimedia/xbmc/xbmc/0001-configure-don-t-run-python-distutils-to-find-STAGING.patch
deleted file mode 100644
index dfc3959..0000000
--- a/meta-oe/recipes-multimedia/xbmc/xbmc/0001-configure-don-t-run-python-distutils-to-find-STAGING.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0dce5a2abd9f42876616c35772a4d71c5399543c Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sat, 17 Dec 2011 11:38:15 +0100
-Subject: [PATCH 1/4] configure: don't run python distutils to find STAGING_INCDIR/python, it is not safe for per-machine sysroots
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- m4/ax_python_devel.m4 |    7 +------
- 1 files changed, 1 insertions(+), 6 deletions(-)
-
-diff --git a/m4/ax_python_devel.m4 b/m4/ax_python_devel.m4
-index adbd207..dee70f6 100644
---- a/m4/ax_python_devel.m4
-+++ b/m4/ax_python_devel.m4
-@@ -151,12 +151,7 @@ $ac_distutils_result])
- 	#
- 	AC_MSG_CHECKING([for Python include path])
- 	if test -z "$PYTHON_CPPFLAGS"; then
--		python_path=`$PYTHON -c "import distutils.sysconfig; \
--			print (distutils.sysconfig.get_python_inc ());"`
--		if test -n "${python_path}"; then
--			python_path="-I$python_path"
--		fi
--		PYTHON_CPPFLAGS=$python_path
-+		PYTHON_CPPFLAGS="-I${STAGING_INCDIR}/${PYTHON_DIR}"
- 	fi
- 	AC_MSG_RESULT([$PYTHON_CPPFLAGS])
- 	AC_SUBST([PYTHON_CPPFLAGS])
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-multimedia/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch b/meta-oe/recipes-multimedia/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
deleted file mode 100644
index e0a4037..0000000
--- a/meta-oe/recipes-multimedia/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 7b2a8a7869d257cba35f53f6d877877c29cdac27 Mon Sep 17 00:00:00 2001
-From: Paul Menzel <paulepanter@users.sourceforge.net>
-Date: Sun, 14 Aug 2011 21:53:47 +0200
-Subject: [PATCH 2/4] Revert "fixed:[ios] Add memory barriers to atomic Add/Subtract and Increment/Decrement functions to ensure synchronized accesses."
-
-This reverts commit 9a10c48710df79118e39e9b3bb0a15bf1fe694d1.
-
-The build (OpenEmbedded `angstrom-2010.x` for `MACHINE = "beagleboard") fails with the following error.
-
-        make -C xbmc/threads
-        make[1]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+9a10c48710df79118e39e9b3bb0a15bf1fe694d1/git/xbmc/threads'
-        CPP     Atomics.o
-        /tmp/ccIzTm3L.s: Assembler messages:
-        /tmp/ccIzTm3L.s:40: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:48: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:76: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:83: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:111: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:118: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:145: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:152: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:180: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:187: Error: garbage following instruction -- `dmb ish'
-        make[1]: *** [Atomics.o] Error 1
-        make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+9a10c48710df79118e39e9b3bb0a15bf1fe694d1/git/xbmc/threads'
-        make: *** [xbmc/threads/threads.a] Error 2
----
- xbmc/threads/Atomics.cpp |    8 --------
- 1 files changed, 0 insertions(+), 8 deletions(-)
-
-diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
-index 5b09f18..0a98a7e 100644
---- a/xbmc/threads/Atomics.cpp
-+++ b/xbmc/threads/Atomics.cpp
-@@ -194,14 +194,12 @@ long AtomicIncrement(volatile long* pAddr)
- {
-   register long val;
-   asm volatile (
--                "dmb      ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
-                 "1:                     \n" 
-                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
-                 "add     %0,  #1        \n" // (val += 1)
-                 "strex   r1,  %0, [%1]	\n"
-                 "cmp     r1,   #0       \n"
-                 "bne     1b             \n"
--                "dmb     ish            \n" // Memory barrier.
-                 : "=&r" (val)
-                 : "r"(pAddr)
-                 : "r1"
-@@ -273,14 +271,12 @@ long AtomicAdd(volatile long* pAddr, long amount)
- {
-   register long val;
-   asm volatile (
--                "dmb      ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
-                 "1:                     \n" 
-                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
-                 "add     %0,  %2        \n" // (val += amount)
-                 "strex   r1,  %0, [%1]	\n"
-                 "cmp     r1,   #0       \n"
-                 "bne     1b             \n"
--                "dmb     ish            \n" // Memory barrier.
-                 : "=&r" (val)
-                 : "r"(pAddr), "r"(amount)
-                 : "r1"
-@@ -351,14 +347,12 @@ long AtomicDecrement(volatile long* pAddr)
- {
-   register long val;
-   asm volatile (
--                "dmb      ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
-                 "1:                     \n" 
-                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
-                 "sub     %0,  #1        \n" // (val -= 1)
-                 "strex   r1,  %0, [%1]	\n"
-                 "cmp     r1,   #0       \n"
-                 "bne     1b             \n"
--                "dmb     ish            \n" // Memory barrier.
-                 : "=&r" (val)
-                 : "r"(pAddr)
-                 : "r1"
-@@ -431,14 +425,12 @@ long AtomicSubtract(volatile long* pAddr, long amount)
- {
-   register long val;
-   asm volatile (
--                "dmb     ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
-                 "1:                     \n" 
-                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
-                 "sub     %0,  %2        \n" // (val -= amount)
-                 "strex   r1,  %0, [%1]	\n"
-                 "cmp     r1,   #0       \n"
-                 "bne     1b             \n"
--                "dmb     ish            \n" // Memory barrier.
-                 : "=&r" (val)
-                 : "r"(pAddr), "r"(amount)
-                 : "r1"
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-multimedia/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch b/meta-oe/recipes-multimedia/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
deleted file mode 100644
index 629017b..0000000
--- a/meta-oe/recipes-multimedia/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From aaae1616a09d359b52e929f944ca0ceb4bb7f831 Mon Sep 17 00:00:00 2001
-From: Paul Menzel <paulepanter@users.sourceforge.net>
-Date: Sun, 14 Aug 2011 21:55:09 +0200
-Subject: [PATCH 3/4] Revert "fixed:[ios] Add memory barriers to cas() assembly to ensure alignment of memory accesses."
-
-This reverts commit 92bab651e2253d172879995b50985645b77fecd2.
-
-The build (OpenEmbedded `angstrom-2010.x` for `MACHINE = "beagleboard") fails with the following error.
-
-        CPP     Atomics.o
-        make[1]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+92bab651e2253d172879995b50985645b77fecd2/git/xbmc/windows'
-        CPP     GUIMediaWindow.o
-        /tmp/ccrsywuV.s: Assembler messages:
-        /tmp/ccrsywuV.s:40: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccrsywuV.s:48: Error: garbage following instruction -- `dmb ish'
-        make[1]: *** [Atomics.o] Error 1
-        make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+92bab651e2253d172879995b50985645b77fecd2/git/xbmc/threads'
-        make: *** [xbmc/threads/threads.a] Error 2
----
- xbmc/threads/Atomics.cpp |   33 ++++++++++++++++-----------------
- 1 files changed, 16 insertions(+), 17 deletions(-)
-
-diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
-index 0a98a7e..0967eb2 100644
---- a/xbmc/threads/Atomics.cpp
-+++ b/xbmc/threads/Atomics.cpp
-@@ -49,23 +49,22 @@ long cas(volatile long *pAddr, long expectedVal, long swapVal)
- #elif defined(__arm__)
- long cas(volatile long* pAddr, long expectedVal, long swapVal)
- {
--  register long prev;
--  asm volatile (
--                "dmb      ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
--                "1:                      \n"
--                "ldrex    %0, [%1]       \n" // Load the current value of *pAddr(%1) into prev (%0) and lock pAddr,
--                "cmp      %0,  %2        \n" // Verify that the current value (%0) == old value (%2)
--                "bne      2f             \n" // Bail if the two values are not equal [not as expected]
--                "strex    r1,  %3, [%1]  \n"
--                "cmp      r1,  #0        \n"
--                "bne      1b             \n"
--                "dmb      ish            \n" // Memory barrier.
--                "2:                      \n"
--                : "=&r" (prev)
--                : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
--                : "r1"
--                );
--  return prev;
-+  return(__sync_val_compare_and_swap(pAddr, expectedVal, swapVal));
-+//  register long prev;
-+//  asm volatile (
-+//                "1:                      \n"
-+//                "ldrex    %0, [%1]       \n" /* Load the current value of *pAddr(%1) into prev (%0) and lock pAddr,  */
-+//                "cmp      %0,  %2        \n" /* Verify that the current value (%0) == old value (%2) */
-+//                "bne      2f             \n" /* Bail if the two values are not equal [not as expected] */
-+//                "strex    r1,  %3, [%1]  \n"
-+//                "cmp      r1,  #0        \n"                
-+//                "bne      1b             \n"
-+//                "2:                        "
-+//                : "=&r" (prev)
-+//                : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
-+//                : "r1"
-+//                );
-+//  return prev;
- }
- 
- #elif defined(__mips__)
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb b/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb
deleted file mode 100644
index f0ce7cf..0000000
--- a/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb
+++ /dev/null
@@ -1,77 +0,0 @@
-DESCRIPTION = "XBMC Media Center"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=6eb631b6da7fdb01508a80213ffc35ff"
-
-DEPENDS = "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib"
-#require recipes/egl/egl.inc
-
-SRCREV = "82388d55dae79cbb2e486e307e23202e76a43efa"
-
-PV = "11.0"
-PR = "r14"
-PR_append = "+gitr${SRCPV}"
-SRC_URI = "git://github.com/xbmc/xbmc.git;branch=eden;protocol=git \
-           file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
-           file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch \
-           file://0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch \
-          "
-
-inherit autotools gettext python-dir
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF = " \
- --disable-rpath \
- --enable-gles \
- --enable-libusb \
- --enable-airplay \
- --disable-optical-drive \
- --enable-external-libraries \
-"
-
-# for python modules
-export HOST_SYS
-export BUILD_SYS
-export STAGING_LIBDIR
-export STAGING_INCDIR
-export PYTHON_DIR
-
-do_configure() {
-	sh bootstrap
-	oe_runconf
-}
-
-PARALLEL_MAKE = ""
-
-do_compile_prepend() {
-
-	sed -i -e 's:-rpath \$(libdir)::g' lib/libid3tag/libid3tag/Makefile
-
-	for i in $(find . -name "Makefile") ; do
-		sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir):-rpath ${STAGING_LIBDIR}:g' $i
-	done
-
-	for i in $(find . -name "*.mak*") ; do
-		sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir)::g' $i
-	done
-	sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir)::g' ${S}/Makefile	
-}
-
-# on ARM architectures xbmc will use GLES which will make the regular wrapper fail, so start it directly
-do_install_append_arm() {
-	sed -i -e 's:Exec=xbmc:Exec=${libdir}/xbmc/xbmc.bin:g' ${D}${datadir}/applications/xbmc.desktop
-}
-
-FILES_${PN} += "${datadir}/xsessions ${datadir}/icons"
-FILES_${PN}-dbg += "${libdir}/xbmc/.debug ${libdir}/xbmc/*/.debug ${libdir}/xbmc/*/*/.debug ${libdir}/xbmc/*/*/*/.debug"
-
-# xbmc uses some kind of dlopen() method for libcec so we need to add it manually
-RRECOMMENDS_${PN}_append = " libcec \
-                             python \
-                             python-lang \
-                             python-re \
-                             "
-RRECOMMENDS_${PN}_append_libc-glibc = " glibc-charmap-ibm850 glibc-gconv-ibm850"
-
-
-- 
1.7.9.5



