Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3269E65E12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 09:14:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3B9Ekvm023392
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 02:14:47 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 11 Apr 2014 02:14:46 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Apr 2014 17:14:45 +0800
Message-ID: <1397207685-2414-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ltrace: update to version 0.7.90
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
X-List-Received-Date: Fri, 11 Apr 2014 09:14:48 -0000
Content-Type: text/plain

Upgrade ltrace to 0.7.90.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../recipes-devtools/ltrace/files/add-sysdep.patch |   13 ----
 .../ltrace/files/ltrace-compile.patch              |   80 -------------------
 .../files/ltrace-fix-sysdep_h-dependency.patch     |   33 --------
 .../ltrace/files/ltrace-mips-remove-CP.patch       |   12 ---
 .../ltrace/files/ltrace-mips.patch                 |   36 ---------
 .../recipes-devtools/ltrace/files/ltrace-ppc.patch |   11 ---
 .../ltrace-git/ltrace-0.7.2-unused-typedef.patch   |   49 ++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb    |   81 --------------------
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |   25 ++++++
 9 files changed, 74 insertions(+), 266 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/ltrace/files/add-sysdep.patch
 delete mode 100644 meta-oe/recipes-devtools/ltrace/files/ltrace-compile.patch
 delete mode 100644 meta-oe/recipes-devtools/ltrace/files/ltrace-fix-sysdep_h-dependency.patch
 delete mode 100644 meta-oe/recipes-devtools/ltrace/files/ltrace-mips-remove-CP.patch
 delete mode 100644 meta-oe/recipes-devtools/ltrace/files/ltrace-mips.patch
 delete mode 100644 meta-oe/recipes-devtools/ltrace/files/ltrace-ppc.patch
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unused-typedef.patch
 delete mode 100644 meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace_git.bb

diff --git a/meta-oe/recipes-devtools/ltrace/files/add-sysdep.patch b/meta-oe/recipes-devtools/ltrace/files/add-sysdep.patch
deleted file mode 100644
index 1d0432f..0000000
--- a/meta-oe/recipes-devtools/ltrace/files/add-sysdep.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: ltrace-0.5.3/Makefile.in
-===================================================================
---- ltrace-0.5.3.orig/Makefile.in	2009-10-23 22:06:08.130304691 -0700
-+++ ltrace-0.5.3/Makefile.in	2009-10-23 22:06:53.160369614 -0700
-@@ -39,6 +39,8 @@ ltrace:		main.o libltrace.a
- libltrace.a: 	sysdeps/sysdep.o $(OBJ)
- 		$(AR) rcv $@ $^
- 
-+$(OBJ):		sysdeps/sysdep.o
-+
- sysdeps/sysdep.o: dummy
- 		$(MAKE) -C sysdeps/$(OS)
- 
diff --git a/meta-oe/recipes-devtools/ltrace/files/ltrace-compile.patch b/meta-oe/recipes-devtools/ltrace/files/ltrace-compile.patch
deleted file mode 100644
index 4784deb..0000000
--- a/meta-oe/recipes-devtools/ltrace/files/ltrace-compile.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-Index: ltrace-0.5.3/common.h
-===================================================================
---- ltrace-0.5.3.orig/common.h	2009-10-23 23:13:45.700282578 -0700
-+++ ltrace-0.5.3/common.h	2009-10-23 23:14:13.550371553 -0700
-@@ -1,3 +1,5 @@
-+#ifndef COMMON_H
-+#define COMMON_H
- #include <sys/types.h>
- #include <sys/time.h>
- #include <stdio.h>
-@@ -251,3 +253,5 @@ extern void * sym2addr(Process *, struct
- #if 0				/* not yet */
- extern int umoven(Process * proc, void * addr, int len, void * laddr);
- #endif
-+#endif
-+
-Index: ltrace-0.5.3/configure
-===================================================================
---- ltrace-0.5.3.orig/configure	2009-10-23 23:13:45.630316494 -0700
-+++ ltrace-0.5.3/configure	2009-10-23 23:13:59.672869527 -0700
-@@ -30,7 +30,7 @@ int main () {
-   return cplus_demangle();
- }
- EOF
--if gcc conftest.c -liberty 2>/dev/null
-+if $CC conftest.c -liberty 2>/dev/null
- then
-   HAVE_LIBIBERTY=1
-   echo "yes"
-@@ -48,7 +48,7 @@ int main () {
-   return __cxa_demangle();
- }
- EOF
--if gcc conftest.c -lsupc++ 2>/dev/null
-+if $CC conftest.c -lsupc++ 2>/dev/null
- then
-   HAVE_LIBSUPC__=1
-   echo "yes"
-@@ -67,7 +67,7 @@ int main () {
-   return 0;
- }
- EOF
--if gcc conftest.c 2>/dev/null
-+if $CC conftest.c 2>/dev/null
- then
-   HAVE_ELF_C_READ_MMAP=1
-   echo "yes"
-@@ -77,15 +77,12 @@ else
- fi
- rm -f conftest.c a.out
- 
--CC=gcc
--CPPFLAGS=' -I /usr/include/libelf'
- CFLAGS='-g -O2'
- LIBS='-lelf -lsupc++ -liberty '
--INSTALL='/usr/bin/install -c'
-+INSTALL='install -c'
- iquote='-iquote '
- iquoteend=''
- 
--prefix=/usr/local
- sysconfdir='${prefix}/etc'
- bindir='${prefix}/bin'
- mandir='${prefix}/share/man'
-Index: ltrace-0.5.3/debug.h
-===================================================================
---- ltrace-0.5.3.orig/debug.h	2009-10-23 23:13:45.670276809 -0700
-+++ ltrace-0.5.3/debug.h	2009-10-23 23:14:26.440319785 -0700
-@@ -1,3 +1,5 @@
-+#ifndef DEBUG_H
-+#define DEBUG_H
- #include <features.h>
- 
- /* debug levels:
-@@ -14,4 +16,4 @@ void debug_(int level, const char *file,
- int xinfdump(long, void *, int);
- 
- # define debug(level, expr...) debug_(level, __FILE__, __LINE__, expr)
--
-+#endif
diff --git a/meta-oe/recipes-devtools/ltrace/files/ltrace-fix-sysdep_h-dependency.patch b/meta-oe/recipes-devtools/ltrace/files/ltrace-fix-sysdep_h-dependency.patch
deleted file mode 100644
index b9e5f7f..0000000
--- a/meta-oe/recipes-devtools/ltrace/files/ltrace-fix-sysdep_h-dependency.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Index: ltrace-0.5.3/sysdeps/linux-gnu/Makefile
-===================================================================
---- ltrace-0.5.3.orig/sysdeps/linux-gnu/Makefile
-+++ ltrace-0.5.3/sysdeps/linux-gnu/Makefile
-@@ -12,7 +12,10 @@ CPPFLAGS	+=	-I$(TOPDIR)/sysdeps/linux-gn
- 
- OBJ		=	events.o trace.o proc.o breakpoint.o
- 
--all:		sysdep.h signalent.h syscallent.h arch_syscallent.h signalent1.h syscallent1.h ../sysdep.o
-+HDRS		=	sysdep.h signalent.h syscallent.h arch_syscallent.h \
-+			signalent1.h syscallent1.h
-+
-+all:		../sysdep.o
- 
- sysdep.h:	$(ARCH)/arch.h
- 		cat $(ARCH)/arch.h > sysdep.h
-@@ -49,12 +52,14 @@ arch_syscallent.h:
- os.o:		$(OBJ)
- 		$(CC) -nostdlib -r -o os.o $(OBJ)
- 
-+$(OBJ):		$(HDRS)
-+
- $(ARCH)/arch.o:	dummy
- 		$(MAKE) -C $(ARCH)
- 
- clean:
- 		$(MAKE) -C $(ARCH) clean
--		rm -f $(OBJ) sysdep.h signalent.h signalent1.h syscallent.h arch_syscallent.h
--		rm -f syscallent1.h os.o sysdep.o ../sysdep.o
-+		rm -f $(HDRS)
-+		rm -f $(OBJ) os.o sysdep.o ../sysdep.o
- 
- dummy:
diff --git a/meta-oe/recipes-devtools/ltrace/files/ltrace-mips-remove-CP.patch b/meta-oe/recipes-devtools/ltrace/files/ltrace-mips-remove-CP.patch
deleted file mode 100644
index 2af193d..0000000
--- a/meta-oe/recipes-devtools/ltrace/files/ltrace-mips-remove-CP.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: ltrace-0.5.3/sysdeps/linux-gnu/mipsel/trace.c
-===================================================================
---- ltrace-0.5.3.orig/sysdeps/linux-gnu/mipsel/trace.c	2009-10-23 23:15:59.822783128 -0700
-+++ ltrace-0.5.3/sysdeps/linux-gnu/mipsel/trace.c	2009-10-23 23:16:10.441268788 -0700
-@@ -127,7 +127,6 @@ gimme_arg(enum tof type, Process *proc, 
- 			return ret;
- 		} else {
- 			// If we need this, I think we can look at [sp+16] for arg_num==4.
--			CP;
- 			return 0;
- 		}
- 	}
diff --git a/meta-oe/recipes-devtools/ltrace/files/ltrace-mips.patch b/meta-oe/recipes-devtools/ltrace/files/ltrace-mips.patch
deleted file mode 100644
index 6df5e21..0000000
--- a/meta-oe/recipes-devtools/ltrace/files/ltrace-mips.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Index: ltrace-0.5.3/sysdeps/linux-gnu/mipsel/plt.c
-===================================================================
---- ltrace-0.5.3.orig/sysdeps/linux-gnu/mipsel/plt.c	2009-10-23 23:25:59.292780574 -0700
-+++ ltrace-0.5.3/sysdeps/linux-gnu/mipsel/plt.c	2009-10-23 23:26:22.671522220 -0700
-@@ -1,4 +1,4 @@
--#include <debug.h>
-+#include "debug.h"
- #include <gelf.h>
- #include <sys/ptrace.h>
- #include "common.h"
-Index: ltrace-0.5.3/sysdeps/linux-gnu/mipsel/regs.c
-===================================================================
---- ltrace-0.5.3.orig/sysdeps/linux-gnu/mipsel/regs.c	2009-10-23 23:25:59.312777529 -0700
-+++ ltrace-0.5.3/sysdeps/linux-gnu/mipsel/regs.c	2009-10-23 23:26:08.190311896 -0700
-@@ -4,7 +4,6 @@
- #include <sys/types.h>
- #include <sys/ptrace.h>
- #include <asm/ptrace.h>
--#include <linux/user.h>
- 
- #include "common.h"
- #include "mipsel.h"
-Index: ltrace-0.5.3/handle_event.c
-===================================================================
---- ltrace-0.5.3.orig/handle_event.c	2009-10-23 23:29:48.780274445 -0700
-+++ ltrace-0.5.3/handle_event.c	2009-10-23 23:37:32.260284055 -0700
-@@ -573,7 +573,8 @@ handle_breakpoint(Event *event) {
- 			void *old_addr;
- 			struct library_symbol *sym= event->proc->callstack[i].c_un.libfunc;
- 			assert(sym);
--			old_addr = dict_find_entry(event->proc->breakpoints, sym2addr(event->proc, sym))->addr;
-+			struct Breakpoint *tbp = dict_find_entry(event->proc->breakpoints, sym2addr(event->proc, sym));
-+			old_addr = tbp->addr;
- 			addr=sym2addr(event->proc,sym);
- 			assert(old_addr !=0 && addr !=0);
- 			if(addr != old_addr){
diff --git a/meta-oe/recipes-devtools/ltrace/files/ltrace-ppc.patch b/meta-oe/recipes-devtools/ltrace/files/ltrace-ppc.patch
deleted file mode 100644
index d5ea0f0..0000000
--- a/meta-oe/recipes-devtools/ltrace/files/ltrace-ppc.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-Index: ltrace-0.5.3/sysdeps/linux-gnu/ppc/plt.c
-===================================================================
---- ltrace-0.5.3.orig/sysdeps/linux-gnu/ppc/plt.c	2009-11-15 03:46:14.459233772 +0300
-+++ ltrace-0.5.3/sysdeps/linux-gnu/ppc/plt.c	2009-11-15 03:46:25.299232646 +0300
-@@ -1,5 +1,6 @@
- #include <gelf.h>
- #include "common.h"
-+#include "ptrace.h"
- 
- GElf_Addr
- arch_plt_sym_val(struct ltelf *lte, size_t ndx, GElf_Rela * rela) {
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unused-typedef.patch b/meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unused-typedef.patch
new file mode 100644
index 0000000..8f3c0ec
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unused-typedef.patch
@@ -0,0 +1,49 @@
+diff --git a/value.c b/value.c
+index d18db17..b98298e 100644
+--- a/value.c
++++ b/value.c
+@@ -1,6 +1,6 @@
+ /*
+  * This file is part of ltrace.
+- * Copyright (C) 2011,2012 Petr Machata, Red Hat Inc.
++ * Copyright (C) 2011,2012,2013 Petr Machata, Red Hat Inc.
+  *
+  * This program is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU General Public License as
+@@ -282,9 +282,9 @@ value_init_deref(struct value *ret_val, struct value *valp)
+ 	if (value_extract_word(valp, &l, NULL) < 0)
+ 		return -1;
+ 
+-	/* We need "long" to be long enough to hold platform
++	/* We need "long" to be long enough to hold target
+ 	 * pointers.  */
+-	typedef char assert__long_enough_long[-(sizeof(l) < sizeof(void *))];
++	assert(sizeof(l) >= sizeof(arch_addr_t));
+ 
+ 	value_common_init(ret_val, valp->inferior, valp,
+ 			  valp->type->u.ptr_info.info, 0);
+diff --git a/lens_default.c b/lens_default.c
+index ed3d0e1..5d00814 100644
+--- a/lens_default.c
++++ b/lens_default.c
+@@ -1,6 +1,6 @@
+ /*
+  * This file is part of ltrace.
+- * Copyright (C) 2011,2012 Petr Machata, Red Hat Inc.
++ * Copyright (C) 2011,2012,2013 Petr Machata, Red Hat Inc.
+  * Copyright (C) 1998,2004,2007,2008,2009 Juan Cespedes
+  * Copyright (C) 2006 Ian Wienand
+  * Copyright (C) 2006 Steve Fink
+@@ -342,9 +342,9 @@ format_array(FILE *stream, struct value *value, struct value_dict *arguments,
+ 	     struct expr_node *length, size_t maxlen, int before,
+ 	     const char *open, const char *close, const char *delim)
+ {
+-	/* We need "long" to be long enough to cover the whole address
+-	 * space.  */
+-	typedef char assert__long_enough_long[-(sizeof(long) < sizeof(void *))];
++	/* We need "long" to be long enough to cover the whole target
++	 * address space.  */
++	assert(sizeof(long) >= sizeof(arch_addr_t));
+ 	long l;
+ 	if (expr_eval_word(length, value, arguments, &l) < 0)
+ 		return -1;
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb b/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
deleted file mode 100644
index 7cefa76..0000000
--- a/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
+++ /dev/null
@@ -1,81 +0,0 @@
-DESCRIPTION = "ltrace shows runtime library call information for dynamically linked executables."
-HOMEPAGE = "http://ltrace.alioth.debian.org"
-SECTION = "devel"
-DEPENDS = "elfutils binutils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
-
-PR = "r5"
-
-# ltrace is not ported to sh3/sh4 targets at this time
-COMPATIBLE_TARGET_SYS = "(?!sh[34])"
-
-SRC_URI = "\
-    ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz;name=archive \
-    ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}-2.1.diff.gz;name=patch \
-    file://add-sysdep.patch \
-    file://ltrace-compile.patch \
-    file://ltrace-mips-remove-CP.patch \
-    file://ltrace-mips.patch \
-    file://ltrace-ppc.patch \
-    file://ltrace-fix-sysdep_h-dependency.patch \
-"
-inherit autotools
-
-export TARGET_CFLAGS = "${SELECTED_OPTIMIZATION} -isystem ${STAGING_INCDIR}"
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_configure_prepend() {
-    case ${TARGET_ARCH} in
-        arm*)  ln -sf ./linux-gnu sysdeps/linux-gnueabi ;;
-        mips*)  ln -sf ./mipsel sysdeps/linux-gnu/mips ;;
-    esac
-    sed -e 's:uname -m:echo @HOST_CPU@:' \
-        sysdeps/linux-gnu/Makefile > sysdeps/linux-gnu/Makefile.in
-
-}
-
-do_compile() {
-    case ${TARGET_ARCH} in
-        alpha*)   LTRACE_ARCH=alpha ;;
-        arm*)     LTRACE_ARCH=arm ;;
-        cris*)    LTRACE_ARCH=cris ;;
-        hppa*)    LTRACE_ARCH=parisc ;;
-        i*86*)    LTRACE_ARCH=i386 ;;
-        ia64*)    LTRACE_ARCH=ia64 ;;
-        mips*)    LTRACE_ARCH=mips ;;
-        m68k*)    LTRACE_ARCH=m68k ;;
-        powerpc*) LTRACE_ARCH=ppc ;;
-        s390*)    LTRACE_ARCH=s390 ;;
-        sh*)      LTRACE_ARCH=sh ;;
-        sparc64*) LTRACE_ARCH=sparc64 ;;
-        sparc*)   LTRACE_ARCH=sparc ;;
-        x86_64*)  LTRACE_ARCH=x86_64 ;;
-    esac
-    oe_runmake LDFLAGS="${TARGET_LDFLAGS}" LIBS="-lsupc++ -liberty -Wl,-Bstatic -lelf -Wl,-Bdynamic" ${EXTRA_OEMAKE} ARCH=${LTRACE_ARCH}
-}
-
-do_install() {
-    case ${TARGET_ARCH} in
-        alpha*)   LTRACE_ARCH=alpha ;;
-        arm*)     LTRACE_ARCH=arm ;;
-        cris*)    LTRACE_ARCH=cris ;;
-        hppa*)    LTRACE_ARCH=parisc ;;
-        i*86*)    LTRACE_ARCH=i386 ;;
-        ia64*)    LTRACE_ARCH=ia64 ;;
-        mips*)    LTRACE_ARCH=mips ;;
-        m68k*)    LTRACE_ARCH=m68k ;;
-        powerpc*) LTRACE_ARCH=ppc ;;
-        s390*)    LTRACE_ARCH=s390 ;;
-        sh*)      LTRACE_ARCH=sh ;;
-        sparc64*) LTRACE_ARCH=sparc64 ;;
-        sparc*)   LTRACE_ARCH=sparc ;;
-        x86_64*)  LTRACE_ARCH=x86_64 ;;
-    esac
-    oe_runmake install ${EXTRA_OEMAKE} ARCH=${LTRACE_ARCH} DESTDIR=${D}
-}
-
-SRC_URI[archive.md5sum] = "3fa7fe715ab879db08bd06d1d59fd90f"
-SRC_URI[archive.sha256sum] = "5c6627d6d5a98a92ca4661cfc16378b182cc46a9ec479ebf7e6121ee3fe2be32"
-SRC_URI[patch.md5sum] = "38bc944c53ab602a7854aa4fa71c1f46"
-SRC_URI[patch.sha256sum] = "4c57df94020f2bed90d948f757ca7786796ca9218274764b24f61c502d9ef4f6"
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
new file mode 100644
index 0000000..149af52
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "ltrace intercepts and records dynamic library calls"
+
+DESCRIPTION = "ltrace intercepts and records dynamic library calls \
+which are called by an executed process and the signals received by that process. \
+It can also intercept and print the system calls executed by the program.\
+"
+HOMEPAGE = "http://ltrace.org/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
+
+SRCREV = "f44b28421979cec88d6d6a778fc27a8cd514f508"
+
+DEPENDS = "elfutils"
+RDEPENDS_${PN} = "elfutils"
+SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git \
+           file://ltrace-0.7.2-unused-typedef.patch \
+          "
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+do_configure_prepend () {
+	./autogen.sh
+}
-- 
1.7.9.5


