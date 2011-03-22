Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Q1waD-0003pf-WC
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 09:04:54 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 44C4311002F2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 09:03:06 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8559B11000B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 09:02:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=ALL_TRUSTED,BAYES_05
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225144151.adsl.alicedsl.de
	[92.225.144.151]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 09:02:55 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 1B01B3C0BE; Tue, 22 Mar 2011 09:02:01 +0100 (CET)
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 09:01:48 +0100
Message-Id: <1300780910-28866-2-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300780910-28866-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1300780910-28866-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 1/3] libatomic-ops: switch to own directroy and use cvs version
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
X-List-Received-Date: Tue, 22 Mar 2011 08:04:54 -0000

From: Henning Heinold <heinold@inf.fu-berlin.de>

* may fix build issuses seen with cairo
* fix recipe name

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/libatomic-ops/libatomic-ops_cvs.bb         |   15 +++
 .../libatomics-ops/dont.install.header.twice.patch |   19 ---
 .../fedora/libatomic_ops-1.2-ppclwzfix.patch       |   15 ---
 .../gentoo/libatomic_ops-1.2-mips.patch            |  121 --------------------
 recipes/pulseaudio/libatomics-ops_1.2.bb           |   23 ----
 5 files changed, 15 insertions(+), 178 deletions(-)
 create mode 100644 recipes/libatomic-ops/libatomic-ops_cvs.bb
 delete mode 100644 recipes/pulseaudio/libatomics-ops/dont.install.header.twice.patch
 delete mode 100644 recipes/pulseaudio/libatomics-ops/fedora/libatomic_ops-1.2-ppclwzfix.patch
 delete mode 100644 recipes/pulseaudio/libatomics-ops/gentoo/libatomic_ops-1.2-mips.patch
 delete mode 100644 recipes/pulseaudio/libatomics-ops_1.2.bb

diff --git a/recipes/libatomic-ops/libatomic-ops_cvs.bb b/recipes/libatomic-ops/libatomic-ops_cvs.bb
new file mode 100644
index 0000000..26f64b8
--- /dev/null
+++ b/recipes/libatomic-ops/libatomic-ops_cvs.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "A library for atomic integer operations"
+LICENSE = "MIT"
+
+PV = "4.0+cvs${SRCDATE}"
+
+SRC_URI = "cvs://anonymous@bdwgc.cvs.sourceforge.net/cvsroot/bdwgc;module=bdwgc"
+
+S = "${WORKDIR}/bdwgc/libatomic_ops/"
+
+inherit autotools pkgconfig
+
+# Allow empty package to fix SDK depchains
+ALLOW_EMPTY_${PN} = "1"
+
+FILES_${PN}-doc += "${datadir}/libatomic_ops/COPYING ${datadir}/libatomic_ops/*.txt"
diff --git a/recipes/pulseaudio/libatomics-ops/dont.install.header.twice.patch b/recipes/pulseaudio/libatomics-ops/dont.install.header.twice.patch
deleted file mode 100644
index 5884810..0000000
--- a/recipes/pulseaudio/libatomics-ops/dont.install.header.twice.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-diff -uNr libatomic_ops-1.2/src/atomic_ops/sysdeps/Makefile.am libatomic_ops-1.2.new/src/atomic_ops/sysdeps/Makefile.am
---- libatomic_ops-1.2/src/atomic_ops/sysdeps/Makefile.am	2010-03-26 09:30:32.000000000 +0100
-+++ libatomic_ops-1.2.new/src/atomic_ops/sysdeps/Makefile.am	2010-03-26 09:34:13.000000000 +0100
-@@ -25,7 +25,6 @@
- 	  README \
- 	\
- 	  gcc/alpha.h gcc/arm.h gcc/x86.h \
--	  gcc/hppa.h gcc/ia64.h \
- 	  gcc/powerpc.h gcc/sparc.h \
- 	  gcc/hppa.h gcc/m68k.h gcc/s390.h \
- 	  gcc/ia64.h gcc/x86_64.h gcc/cris.h \
-diff -uNr libatomic_ops-1.2/doc/Makefile.am libatomic_ops-1.2.new/doc/Makefile.am
---- libatomic_ops-1.2/doc/Makefile.am	2005-03-21 23:05:19.000000000 +0100
-+++ libatomic_ops-1.2.new/doc/Makefile.am	2010-03-26 09:38:18.000000000 +0100
-@@ -1,3 +1,3 @@
- # installed documentation
- #
--dist_pkgdata_DATA=COPYING LICENSING.txt README.txt COPYING README_stack.txt README_malloc.txt README_win32.txt
-+dist_pkgdata_DATA=COPYING LICENSING.txt README.txt README_stack.txt README_malloc.txt README_win32.txt
diff --git a/recipes/pulseaudio/libatomics-ops/fedora/libatomic_ops-1.2-ppclwzfix.patch b/recipes/pulseaudio/libatomics-ops/fedora/libatomic_ops-1.2-ppclwzfix.patch
deleted file mode 100644
index 51161db..0000000
--- a/recipes/pulseaudio/libatomics-ops/fedora/libatomic_ops-1.2-ppclwzfix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-http://cvs.fedoraproject.org/viewcvs/devel/libatomic_ops/libatomic_ops-1.2-ppclwzfix.patch
-
-* add fix for bad variable handling on PPC
-
---- libatomic_ops-1.2.orig/src/atomic_ops/sysdeps/gcc/powerpc.h	2007-05-29 19:29:52.000000000 +0200
-+++ libatomic_ops-1.2/src/atomic_ops/sysdeps/gcc/powerpc.h	2007-05-29 19:30:48.000000000 +0200
-@@ -72,7 +72,7 @@
-   /* registers.  I always got "impossible constraint" when I	*/
-   /* tried the "y" constraint.					*/
-   __asm__ __volatile__ (
--    "lwz %0,%1\n"
-+    "lwz%U1%X1 %0,%1\n"
-     "cmpw cr7,%0,%0\n"
-     "bne- cr7,1f\n"
-     "1: isync\n"
diff --git a/recipes/pulseaudio/libatomics-ops/gentoo/libatomic_ops-1.2-mips.patch b/recipes/pulseaudio/libatomics-ops/gentoo/libatomic_ops-1.2-mips.patch
deleted file mode 100644
index 79188ce..0000000
--- a/recipes/pulseaudio/libatomics-ops/gentoo/libatomic_ops-1.2-mips.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-diff --git a/src/atomic_ops.h b/src/atomic_ops.h
-index c23f30b..791b360 100755
---- a/src/atomic_ops.h
-+++ b/src/atomic_ops.h
-@@ -220,6 +220,9 @@
- # if defined(__cris__) || defined(CRIS)
- #   include "atomic_ops/sysdeps/gcc/cris.h"
- # endif
-+# if defined(__mips__) 
-+#   include "atomic_ops/sysdeps/gcc/mips.h"
-+# endif
- #endif /* __GNUC__ && !AO_USE_PTHREAD_DEFS */
- 
- #if defined(__INTEL_COMPILER) && !defined(AO_USE_PTHREAD_DEFS)
-diff --git a/src/atomic_ops/sysdeps/Makefile.am b/src/atomic_ops/sysdeps/Makefile.am
-index 74122b4..d6737c0 100644
---- a/src/atomic_ops/sysdeps/Makefile.am
-+++ b/src/atomic_ops/sysdeps/Makefile.am
-@@ -29,6 +29,7 @@ nobase_sysdep_HEADERS= generic_pthread.h \
- 	  gcc/powerpc.h gcc/sparc.h \
- 	  gcc/hppa.h gcc/m68k.h gcc/s390.h \
- 	  gcc/ia64.h gcc/x86_64.h gcc/cris.h \
-+	  gcc/mips.h \
- 	\
- 	  icc/ia64.h \
- 	\
-diff --git a/src/atomic_ops/sysdeps/gcc/mips.h b/src/atomic_ops/sysdeps/gcc/mips.h
-new file mode 100644
-index 0000000..e7f3a5d
---- /dev/null
-+++ b/src/atomic_ops/sysdeps/gcc/mips.h
-@@ -0,0 +1,89 @@
-+/* 
-+ * Copyright (c) 2005  Thiemo Seufer <ths@networkno.de>
-+ * Copyright (c) 2007  Zhang Le <r0bertz@gentoo.org>
-+ *
-+ * THIS MATERIAL IS PROVIDED AS IS, WITH ABSOLUTELY NO WARRANTY EXPRESSED
-+ * OR IMPLIED.  ANY USE IS AT YOUR OWN RISK.
-+ *
-+ * Permission is hereby granted to use or copy this program
-+ * for any purpose,  provided the above notices are retained on all copies.
-+ * Permission to modify the code and to distribute modified code is granted,
-+ * provided the above notices are retained, and a notice that the code was
-+ * modified is included with the above copyright notice.
-+ */
-+
-+#include "../all_aligned_atomic_load_store.h"
-+#include "../test_and_set_t_is_ao_t.h"
-+
-+/* Data dependence does not imply read ordering.  */
-+#define AO_NO_DD_ORDERING
-+
-+AO_INLINE void
-+AO_nop_full()
-+{
-+  __asm__ __volatile__(
-+      "       .set push           \n"
-+      "       .set mips3          \n"
-+      "       .set noreorder      \n"
-+      "       .set nomacro        \n"
-+      "       sync                \n"
-+      "       .set pop              "
-+      : : : "memory");
-+}
-+
-+#define AO_HAVE_nop_full
-+
-+AO_INLINE int
-+AO_compare_and_swap(volatile AO_t *addr, AO_t old, AO_t new_val)
-+{
-+  register int was_equal = 0;
-+  register int temp;
-+
-+  __asm__ __volatile__(
-+      "       .set push           \n"
-+      "       .set mips3          \n"
-+      "       .set noreorder      \n"
-+      "       .set nomacro        \n"
-+      "1:     ll      %0, %1      \n"
-+      "       bne     %0, %4, 2f  \n"
-+      "       move    %0, %3      \n"
-+      "       sc      %0, %1      \n"
-+      "       .set pop            \n"
-+      "       beqz    %0, 1b      \n"
-+      "       li      %2, 1       \n"
-+      "2:                           "
-+      : "=&r" (temp), "+R" (*addr), "+r" (was_equal)
-+      : "r" (new_val), "r" (old)
-+      : "memory");
-+  return was_equal;
-+}
-+
-+#define AO_HAVE_compare_and_swap
-+
-+AO_INLINE AO_t
-+AO_fetch_and_add_full (volatile AO_t *p, AO_t incr)
-+{
-+  AO_t result, temp;
-+  __asm__ __volatile__(
-+      "       .set push           \n"
-+      "       .set mips3          \n"
-+      "       .set noreorder      \n"
-+      "       .set nomacro        \n"
-+      "1:     ll      %1, %2      \n"
-+      "       addu    %0, %1, %3  \n"
-+      "       sc      %0, %2      \n"
-+      "       beqz    %0, 1b      \n"
-+      "       addu    %0, %1, %3  \n"
-+      "       sync                \n"
-+      "       .set pop            \n"
-+      : "=&r" (result), "=&r" (temp), "=m" (*p)
-+      : "r" (incr), "m" (*p)
-+      : "memory");
-+  return result;
-+}
-+
-+#define AO_HAVE_fetch_and_add_full
-+
-+/*
-+ * FIXME: fetch_and_add_full implemented, any others?
-+ */
diff --git a/recipes/pulseaudio/libatomics-ops_1.2.bb b/recipes/pulseaudio/libatomics-ops_1.2.bb
deleted file mode 100644
index a0e2d8f..0000000
--- a/recipes/pulseaudio/libatomics-ops_1.2.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "A library for atomic integer operations"
-LICENSE = "MIT"
-
-PR = "r3"
-
-SRC_URI = "http://www.hpl.hp.com/research/linux/atomic_ops/download/libatomic_ops-1.2.tar.gz \
-           file://fedora/libatomic_ops-1.2-ppclwzfix.patch \
-           file://gentoo/libatomic_ops-1.2-mips.patch \
-	   file://dont.install.header.twice.patch"
-
-S = "${WORKDIR}/libatomic_ops-${PV}"
-
-ARM_INSTRUCTION_SET = "arm"
-
-inherit autotools pkgconfig
-
-# Allow empty package to fix SDK depchains
-ALLOW_EMPTY_${PN} = "1"
-
-FILES_${PN}-doc += "${datadir}/libatomic_ops/COPYING ${datadir}/libatomic_ops/*.txt"
-
-SRC_URI[md5sum] = "1b65e48271c81e3fa2d7a9a69bab7504"
-SRC_URI[sha256sum] = "a3d8768aa8fd2f6ae79be2d756b3a6b48816b3889ae906be3d5ffb2de5a5c781"
-- 
1.7.4.1


