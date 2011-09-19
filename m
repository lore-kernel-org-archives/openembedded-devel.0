Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R5UiL-0006ZV-VG
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 05:40:14 +0200
Received: by iadx2 with SMTP id x2so6491440iad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 20:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=forZy3RXOab9aCOWlhU/Q/1NMumQHRE0xh5T04t4sj0=;
	b=ekOM/k1qOITaQabY9Ceci2gWIiThhC4Sjow5cnt7R7qIaShn0luKp2oJSttLJubmXZ
	d4eoIx7HjR4d1BT7Be3h6AOsM7DjCh5izU9M5MCvIHsXhP+IznuGlfg9hLjBlUG9XFZp
	vrAKENE26PyuPs4jMJMa4aJ9UX22iH/WRwDwg=
Received: by 10.231.63.11 with SMTP id z11mr3328702ibh.23.1316403295605;
	Sun, 18 Sep 2011 20:34:55 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id by18sm11975823ibb.1.2011.09.18.20.34.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 20:34:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 20:34:49 -0700
Message-Id: <1316403289-5382-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] gcc-4.5: Upgrade to latest FSF 4.5 branch and bring in latest linaro patches
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
X-List-Received-Date: Mon, 19 Sep 2011 03:40:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc           |   15 +-
 .../gcc/gcc-4.5/fedora/gcc45-no-add-needed.patch   |   34 +-
 .../gcc/gcc-4.5/gcc-ppc-config-fix.patch           |   52 +--
 .../gcc-4.5/gcc-ppc-include-config-linux.h.patch   |   73 ----
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99530.patch |   27 ++
 ...-lp815435.patch => gcc-4.5-linaro-r99531.patch} |   12 +-
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99532.patch |  456 ++++++++++++++++++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99533.patch |   63 +++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99534.patch |   39 ++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99536.patch |   33 ++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99537.patch |  105 +++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99540.patch |   23 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99541.patch |   22 +
 13 files changed, 829 insertions(+), 125 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-include-config-linux.h.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99530.patch
 rename meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/{linaro-lp815435.patch => gcc-4.5-linaro-r99531.patch} (64%)
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99532.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99533.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99534.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99536.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99537.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99540.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99541.patch

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index aabc1cf..79ea99b 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 PV = "4.5"
-PR = "r40"
+PR = "r41"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
@@ -24,7 +24,7 @@ PR = "r40"
 
 BINV = "${PV}.4"
 
-SRCREV = 176640
+SRCREV = 178923
 BRANCH = "gcc-4_5-branch"
 PR_append = "+svnr${SRCPV}"
 
@@ -200,7 +200,15 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
        file://linaro/gcc-4.5-linaro-r99525.patch \
        file://linaro/gcc-4.5-linaro-r99528.patch \
        file://linaro/gcc-4.5-linaro-r99529.patch \
-       file://linaro/linaro-lp815435.patch \
+       file://linaro/gcc-4.5-linaro-r99530.patch \
+       file://linaro/gcc-4.5-linaro-r99531.patch \
+       file://linaro/gcc-4.5-linaro-r99532.patch \
+       file://linaro/gcc-4.5-linaro-r99533.patch \
+       file://linaro/gcc-4.5-linaro-r99534.patch \
+       file://linaro/gcc-4.5-linaro-r99536.patch \
+       file://linaro/gcc-4.5-linaro-r99537.patch \
+       file://linaro/gcc-4.5-linaro-r99540.patch \
+       file://linaro/gcc-4.5-linaro-r99541.patch \
 	\
        file://more-epilogues.patch \
        file://gcc-scalar-widening-pr45847.patch \
@@ -224,7 +232,6 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
        file://gcc-poison-dir-extend.patch \
        file://gcc-poison-parameters.patch \
        file://gcc-ppc-config-fix.patch \
-       file://gcc-ppc-include-config-linux.h.patch \
        file://use-defaults.h-and-t-oe-in-B.patch \
        "
 
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc45-no-add-needed.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc45-no-add-needed.patch
index 23704d3..bf03c27 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc45-no-add-needed.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc45-no-add-needed.patch
@@ -6,9 +6,11 @@
 	* config/alpha/elf.h (LINK_EH_SPEC): Likewise.
 	* config/ia64/linux.h (LINK_EH_SPEC): Likewise.
 
---- gcc/config/alpha/elf.h.~1~
-+++ gcc/config/alpha/elf.h
-@@ -421,7 +421,7 @@ extern int alpha_this_gpdisp_sequence_nu
+Index: gcc/config/alpha/elf.h
+===================================================================
+--- gcc/config/alpha/elf.h.orig	2011-06-16 17:58:47.000000000 -0700
++++ gcc/config/alpha/elf.h	2011-09-17 11:04:57.033298875 -0700
+@@ -441,7 +441,7 @@ extern int alpha_this_gpdisp_sequence_nu
     I imagine that other systems will catch up.  In the meantime, it
     doesn't harm to make sure that the data exists to be used later.  */
  #if defined(HAVE_LD_EH_FRAME_HDR)
@@ -17,9 +19,11 @@
  #endif
  
  /* A C statement (sans semicolon) to output to the stdio stream STREAM
---- gcc/config/ia64/linux.h.~1~
-+++ gcc/config/ia64/linux.h
-@@ -58,7 +58,7 @@ do {						\
+Index: gcc/config/ia64/linux.h
+===================================================================
+--- gcc/config/ia64/linux.h.orig	2011-09-17 11:03:19.000000000 -0700
++++ gcc/config/ia64/linux.h	2011-09-17 11:04:57.033298875 -0700
+@@ -80,7 +80,7 @@ do {						\
     Signalize that because we have fde-glibc, we don't need all C shared libs
     linked against -lgcc_s.  */
  #undef LINK_EH_SPEC
@@ -28,9 +32,11 @@
  
  #define MD_UNWIND_SUPPORT "config/ia64/linux-unwind.h"
  
---- gcc/config/linux.h.~1~
-+++ gcc/config/linux.h
-@@ -89,7 +89,7 @@ see the files COPYING3 and COPYING.RUNTI
+Index: gcc/config/linux.h
+===================================================================
+--- gcc/config/linux.h.orig	2011-09-17 11:03:38.000000000 -0700
++++ gcc/config/linux.h	2011-09-17 11:04:57.033298875 -0700
+@@ -101,7 +101,7 @@ see the files COPYING3 and COPYING.RUNTI
      } while (0)
  
  #if defined(HAVE_LD_EH_FRAME_HDR)
@@ -39,12 +45,14 @@
  #endif
  
  /* Define this so we can compile MS code for use with WINE.  */
---- gcc/config/rs6000/sysv4.h.~1~
-+++ gcc/config/rs6000/sysv4.h
-@@ -917,7 +917,7 @@ SVR4_ASM_SPEC \
-   %{!dynamic-linker:-dynamic-linker " LINUX_DYNAMIC_LINKER "}}}"
+Index: gcc/config/rs6000/sysv4.h
+===================================================================
+--- gcc/config/rs6000/sysv4.h.orig	2011-09-17 11:03:41.000000000 -0700
++++ gcc/config/rs6000/sysv4.h	2011-09-17 11:05:58.653298861 -0700
+@@ -908,7 +908,7 @@ SVR4_ASM_SPEC \
  
  #if defined(HAVE_LD_EH_FRAME_HDR)
+ # undef LINK_EH_SPEC
 -# define LINK_EH_SPEC "%{!static:--eh-frame-hdr} "
 +# define LINK_EH_SPEC "--no-add-needed %{!static:--eh-frame-hdr} "
  #endif
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch
index 9c2c298..6ae75a0 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch
@@ -20,11 +20,11 @@ Date:   Mon Dec 20 15:29:31 2010 +0000
     
     git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@168085 138bc75d-0d04-0410-961f-82ee72b054a4
 
-Index: gcc-4.5.3/gcc/config.gcc
+Index: gcc-4_5-branch/gcc/config.gcc
 ===================================================================
---- gcc-4.5.3.orig/gcc/config.gcc	2011-06-15 21:18:55.000000000 -0700
-+++ gcc-4.5.3/gcc/config.gcc	2011-06-16 15:01:07.945285352 -0700
-@@ -1989,53 +1989,53 @@
+--- gcc-4_5-branch.orig/gcc/config.gcc	2011-09-17 11:11:28.000000000 -0700
++++ gcc-4_5-branch/gcc/config.gcc	2011-09-17 11:16:32.543298716 -0700
+@@ -1989,48 +1989,48 @@ powerpc-*-netbsd*)
  	extra_options="${extra_options} rs6000/sysv4.opt"
  	;;
  powerpc-*-eabispe*)
@@ -81,13 +81,7 @@ Index: gcc-4.5.3/gcc/config.gcc
  	extra_options="${extra_options} rs6000/sysv4.opt"
  	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-rtems t-rtems rs6000/t-ppccomm"
  	;;
- powerpc-*-linux* | powerpc64-*-linux*)
--	tm_file="${tm_file} dbxelf.h elfos.h svr4.h freebsd-spec.h rs6000/sysv4.h"
-+	tm_file="${tm_file} dbxelf.h elfos.h freebsd-spec.h rs6000/sysv4.h"
- 	extra_options="${extra_options} rs6000/sysv4.opt"
- 	tmake_file="t-dfprules rs6000/t-fprules rs6000/t-ppcos ${tmake_file} rs6000/t-ppccomm"
- 	maybe_biarch=yes
-@@ -2079,12 +2079,12 @@
+@@ -2079,12 +2079,12 @@ powerpc-*-linux* | powerpc64-*-linux*)
  	fi
  	;;
  powerpc64-*-gnu*)
@@ -102,7 +96,7 @@ Index: gcc-4.5.3/gcc/config.gcc
  	extra_options="${extra_options} rs6000/sysv4.opt"
  	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppcos t-slibgcc-elf-ver t-slibgcc-libgcc t-gnu rs6000/t-ppccomm"
  	if test x$enable_threads = xyes; then
-@@ -2092,7 +2092,7 @@
+@@ -2092,7 +2092,7 @@ powerpc-*-gnu-gnualtivec*)
  	fi
  	;;
  powerpc-*-gnu*)
@@ -111,7 +105,7 @@ Index: gcc-4.5.3/gcc/config.gcc
  	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppcos t-slibgcc-elf-ver t-slibgcc-libgcc t-gnu rs6000/t-ppccomm"
  	extra_options="${extra_options} rs6000/sysv4.opt"
  	if test x$enable_threads = xyes; then
-@@ -2100,7 +2100,7 @@
+@@ -2100,7 +2100,7 @@ powerpc-*-gnu*)
  	fi
  	;;
  powerpc-wrs-vxworks|powerpc-wrs-vxworksae)
@@ -120,7 +114,7 @@ Index: gcc-4.5.3/gcc/config.gcc
  	tmake_file="${tmake_file} rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppccomm rs6000/t-vxworks"
  	extra_options="${extra_options} rs6000/sysv4.opt"
  	extra_headers=ppc-asm.h
-@@ -2126,18 +2126,18 @@
+@@ -2126,18 +2126,18 @@ powerpc-*-lynxos*)
  	gas=yes
  	;;
  powerpcle-*-elf*)
@@ -142,10 +136,10 @@ Index: gcc-4.5.3/gcc/config.gcc
  	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppcgas rs6000/t-ppccomm"
  	extra_options="${extra_options} rs6000/sysv4.opt"
  	use_gcc_stdint=wrap
-Index: gcc-4.5.3/gcc/config/rs6000/freebsd.h
+Index: gcc-4_5-branch/gcc/config/rs6000/freebsd.h
 ===================================================================
---- gcc-4.5.3.orig/gcc/config/rs6000/freebsd.h	2009-08-10 11:23:57.000000000 -0700
-+++ gcc-4.5.3/gcc/config/rs6000/freebsd.h	2011-06-16 15:02:02.775285339 -0700
+--- gcc-4_5-branch.orig/gcc/config/rs6000/freebsd.h	2011-06-16 17:58:58.000000000 -0700
++++ gcc-4_5-branch/gcc/config/rs6000/freebsd.h	2011-09-17 11:13:13.623298761 -0700
 @@ -69,6 +69,4 @@
  /* Override rs6000.h definition.  */
  #undef  ASM_APP_OFF
@@ -154,10 +148,10 @@ Index: gcc-4.5.3/gcc/config/rs6000/freebsd.h
 -#define SVR4_ASM_SPEC \
 -  "%{v:-V} %{Wa,*:%*}"
 +#define DBX_REGISTER_NUMBER(REGNO) rs6000_dbx_register_number (REGNO)
-Index: gcc-4.5.3/gcc/config/rs6000/lynx.h
+Index: gcc-4_5-branch/gcc/config/rs6000/lynx.h
 ===================================================================
---- gcc-4.5.3.orig/gcc/config/rs6000/lynx.h	2007-08-02 03:49:31.000000000 -0700
-+++ gcc-4.5.3/gcc/config/rs6000/lynx.h	2011-06-16 15:01:07.945285352 -0700
+--- gcc-4_5-branch.orig/gcc/config/rs6000/lynx.h	2011-06-16 17:58:58.000000000 -0700
++++ gcc-4_5-branch/gcc/config/rs6000/lynx.h	2011-09-17 11:13:13.623298761 -0700
 @@ -1,5 +1,5 @@
  /* Definitions for Rs6000 running LynxOS.
 -   Copyright (C) 1995, 1996, 2000, 2002, 2003, 2004, 2005, 2007
@@ -174,10 +168,10 @@ Index: gcc-4.5.3/gcc/config/rs6000/lynx.h
  #ifdef CRT_BEGIN
  /* This function is part of crtbegin*.o which is at the beginning of
     the link and is called from .fini which is usually toward the end
-Index: gcc-4.5.3/gcc/config/rs6000/netbsd.h
+Index: gcc-4_5-branch/gcc/config/rs6000/netbsd.h
 ===================================================================
---- gcc-4.5.3.orig/gcc/config/rs6000/netbsd.h	2009-02-20 07:20:38.000000000 -0800
-+++ gcc-4.5.3/gcc/config/rs6000/netbsd.h	2011-06-16 15:01:07.945285352 -0700
+--- gcc-4_5-branch.orig/gcc/config/rs6000/netbsd.h	2011-06-16 17:58:58.000000000 -0700
++++ gcc-4_5-branch/gcc/config/rs6000/netbsd.h	2011-09-17 11:13:13.623298761 -0700
 @@ -1,6 +1,6 @@
  /* Definitions of target machine for GNU compiler,
     for PowerPC NetBSD systems.
@@ -192,11 +186,11 @@ Index: gcc-4.5.3/gcc/config/rs6000/netbsd.h
  #define TARGET_VERSION fprintf (stderr, " (NetBSD/powerpc ELF)");
 +
 +#define DBX_REGISTER_NUMBER(REGNO) rs6000_dbx_register_number (REGNO)
-Index: gcc-4.5.3/gcc/config/rs6000/sysv4.h
+Index: gcc-4_5-branch/gcc/config/rs6000/sysv4.h
 ===================================================================
---- gcc-4.5.3.orig/gcc/config/rs6000/sysv4.h	2011-06-15 21:18:57.000000000 -0700
-+++ gcc-4.5.3/gcc/config/rs6000/sysv4.h	2011-06-16 15:01:07.945285352 -0700
-@@ -293,6 +293,10 @@
+--- gcc-4_5-branch.orig/gcc/config/rs6000/sysv4.h	2011-09-17 11:11:29.000000000 -0700
++++ gcc-4_5-branch/gcc/config/rs6000/sysv4.h	2011-09-17 11:13:13.623298761 -0700
+@@ -293,6 +293,10 @@ do {									\
  #define	RESTORE_FP_PREFIX "_restfpr_"
  #define RESTORE_FP_SUFFIX ""
  
@@ -207,7 +201,7 @@ Index: gcc-4.5.3/gcc/config/rs6000/sysv4.h
  /* Type used for ptrdiff_t, as a string used in a declaration.  */
  #define PTRDIFF_TYPE "int"
  
-@@ -588,9 +592,8 @@
+@@ -588,9 +592,8 @@ extern int fixuplabelno;
  /* Override svr4.h definition.  */
  #undef	ASM_SPEC
  #define	ASM_SPEC "%(asm_cpu) \
@@ -219,7 +213,7 @@ Index: gcc-4.5.3/gcc/config/rs6000/sysv4.h
  %{memb|msdata=eabi: -memb} \
  %{mlittle|mlittle-endian:-mlittle; \
    mbig|mbig-endian      :-mbig;    \
-@@ -1127,3 +1130,5 @@
+@@ -1120,3 +1123,5 @@ ncrtn.o%s"
  
  /* This target uses the sysv4.opt file.  */
  #define TARGET_USES_SYSV4_OPT 1
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-include-config-linux.h.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-include-config-linux.h.patch
deleted file mode 100644
index 97364d9..0000000
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-include-config-linux.h.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-The patch is a solution for https://bugs.launchpad.net/ubuntu/+source/gcc-4.5/+bug/768921
-
--Khem
-
-Index: gcc-4_5-branch/gcc/config.gcc
-===================================================================
---- gcc-4_5-branch.orig/gcc/config.gcc	2011-06-16 21:23:22.000000000 -0700
-+++ gcc-4_5-branch/gcc/config.gcc	2011-06-16 21:51:20.845279713 -0700
-@@ -2035,7 +2035,7 @@
- 	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-rtems t-rtems rs6000/t-ppccomm"
- 	;;
- powerpc-*-linux* | powerpc64-*-linux*)
--	tm_file="${tm_file} dbxelf.h elfos.h freebsd-spec.h rs6000/sysv4.h"
-+	tm_file="${tm_file} dbxelf.h elfos.h linux.h freebsd-spec.h rs6000/sysv4.h"
- 	extra_options="${extra_options} rs6000/sysv4.opt"
- 	tmake_file="t-dfprules rs6000/t-fprules rs6000/t-ppcos ${tmake_file} rs6000/t-ppccomm"
- 	maybe_biarch=yes
-Index: gcc-4_5-branch/gcc/config/rs6000/sysv4.h
-===================================================================
---- gcc-4_5-branch.orig/gcc/config/rs6000/sysv4.h	2011-06-16 21:23:22.000000000 -0700
-+++ gcc-4_5-branch/gcc/config/rs6000/sysv4.h	2011-06-16 22:08:49.425279473 -0700
-@@ -620,6 +620,7 @@
- #define CC1_SECURE_PLT_DEFAULT_SPEC ""
- #endif
- 
-+#undef CC1_SPEC
- /* Pass -G xxx to the compiler and set correct endian mode.  */
- #define	CC1_SPEC "%{G*} %(cc1_cpu) \
- %{mlittle|mlittle-endian: %(cc1_endian_little);           \
-@@ -903,22 +904,13 @@
- #define LINK_START_LINUX_SPEC ""
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
--#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
--#if DEFAULT_LIBC == LIBC_UCLIBC
--#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
--#elif DEFAULT_LIBC == LIBC_GLIBC
--#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
--#else
--#error "Unsupported DEFAULT_LIBC"
--#endif
--#define LINUX_DYNAMIC_LINKER \
--  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)
- 
- #define LINK_OS_LINUX_SPEC "-m elf32ppclinux %{!shared: %{!static: \
-   %{rdynamic:-export-dynamic} \
-   %{!dynamic-linker:-dynamic-linker " LINUX_DYNAMIC_LINKER "}}}"
- 
- #if defined(HAVE_LD_EH_FRAME_HDR)
-+# undef LINK_EH_SPEC
- # define LINK_EH_SPEC "--no-add-needed %{!static:--eh-frame-hdr} "
- #endif
- 
-@@ -1113,6 +1105,7 @@
-    be stacked, so that invocations of #pragma pack(pop)' will return
-    to the previous value.  */
- 
-+#undef HANDLE_PRAGMA_PACK_PUSH_POP
- #define HANDLE_PRAGMA_PACK_PUSH_POP 1
- 
- /* Select a format to encode pointers in exception handling data.  CODE
-Index: gcc-4_5-branch/gcc/config/freebsd-spec.h
-===================================================================
---- gcc-4_5-branch.orig/gcc/config/freebsd-spec.h	2011-06-16 17:59:03.000000000 -0700
-+++ gcc-4_5-branch/gcc/config/freebsd-spec.h	2011-06-16 22:11:34.145279435 -0700
-@@ -154,6 +154,7 @@
- #endif
- 
- #if defined(HAVE_LD_EH_FRAME_HDR)
-+#undef LINK_EH_SPEC
- #define LINK_EH_SPEC "%{!static:--eh-frame-hdr} "
- #endif
- 
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99530.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99530.patch
new file mode 100644
index 0000000..64d6262
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99530.patch
@@ -0,0 +1,27 @@
+2011-07-21  Richard Sandiford  <rdsandiford@googlemail.com>
+
+	gcc/
+	Backport from mainline:
+
+	2011-07-21  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	* regcprop.c (maybe_mode_change): Check HARD_REGNO_MODE_OK.
+
+=== modified file 'gcc/regcprop.c'
+--- old/gcc/regcprop.c	2010-08-05 15:28:47 +0000
++++ new/gcc/regcprop.c	2011-07-21 12:40:44 +0000
+@@ -418,10 +418,9 @@
+ 
+       offset = ((WORDS_BIG_ENDIAN ? wordoffset : 0)
+ 		+ (BYTES_BIG_ENDIAN ? byteoffset : 0));
+-      return gen_rtx_raw_REG (new_mode,
+-			      regno + subreg_regno_offset (regno, orig_mode,
+-							   offset,
+-							   new_mode));
++      regno += subreg_regno_offset (regno, orig_mode, offset, new_mode);
++      if (HARD_REGNO_MODE_OK (regno, new_mode))
++	return gen_rtx_raw_REG (new_mode, regno);
+     }
+   return NULL_RTX;
+ }
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/linaro-lp815435.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99531.patch
similarity index 64%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/linaro-lp815435.patch
rename to meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99531.patch
index be71a2f..5559dfe 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/linaro-lp815435.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99531.patch
@@ -2,17 +2,16 @@
 
 	gcc/
 	Backport only bits marked as [*] from mainline:
-	 2010-12-19  Chung-Lin Tang  <cltang@codesourcery.com>
+        2010-12-19  Chung-Lin Tang  <cltang@codesourcery.com>
 
 	* config/arm/arm.c ([*]arm_legitimate_index_p): Add VFP load/store
 	index range case. Change to SF/DFmode tests to avoid capturing HFmode.
 	(thumb2_legitimate_index_p): Same.
 
-Index: gcc-4_5-branch/gcc/config/arm/arm.c
-===================================================================
---- gcc-4_5-branch.orig/gcc/config/arm/arm.c	2011-07-22 17:56:51.000000000 -0700
-+++ gcc-4_5-branch/gcc/config/arm/arm.c	2011-07-29 14:43:42.171610966 -0700
-@@ -5631,8 +5631,8 @@ arm_legitimate_index_p (enum machine_mod
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-06-29 10:46:39 +0000
++++ new/gcc/config/arm/arm.c	2011-07-29 15:01:53 +0000
+@@ -5643,8 +5643,8 @@
  
    /* Standard coprocessor addressing modes.  */
    if (TARGET_HARD_FLOAT
@@ -23,3 +22,4 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  	  || (TARGET_MAVERICK && mode == DImode)))
      return (code == CONST_INT && INTVAL (index) < 1024
  	    && INTVAL (index) > -1024
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99532.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99532.patch
new file mode 100644
index 0000000..0c2c02b
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99532.patch
@@ -0,0 +1,456 @@
+2011-08-03  Revital Eres  <revital.eres@linaro.org>
+
+	* modulo-sched.c (calculate_stage_count,
+	calculate_must_precede_follow, get_sched_window,
+	try_scheduling_node_in_cycle, remove_node_from_ps): Add
+	declaration.
+	(update_node_sched_params, set_must_precede_follow, optimize_sc):
+	New functions.
+	(reset_sched_times): Call update_node_sched_params.
+	(sms_schedule): Call optimize_sc.
+	(get_sched_window): Change function arguments.
+	(sms_schedule_by_order): Update call to get_sched_window.
+	Call set_must_precede_follow.
+	(calculate_stage_count): Add function argument.
+
+=== modified file 'gcc/modulo-sched.c'
+--- old/gcc/modulo-sched.c	2011-07-04 11:39:09 +0000
++++ new/gcc/modulo-sched.c	2011-08-03 12:20:38 +0000
+@@ -202,7 +202,16 @@
+                                     rtx, rtx);
+ static void duplicate_insns_of_cycles (partial_schedule_ptr,
+ 				       int, int, int, rtx);
+-static int calculate_stage_count (partial_schedule_ptr ps);
++static int calculate_stage_count (partial_schedule_ptr, int);
++static void calculate_must_precede_follow (ddg_node_ptr, int, int,
++					   int, int, sbitmap, sbitmap, sbitmap);
++static int get_sched_window (partial_schedule_ptr, ddg_node_ptr, 
++			     sbitmap, int, int *, int *, int *);
++static bool try_scheduling_node_in_cycle (partial_schedule_ptr, ddg_node_ptr,
++					  int, int, sbitmap, int *, sbitmap,
++					  sbitmap);
++static bool remove_node_from_ps (partial_schedule_ptr, ps_insn_ptr);
++
+ #define SCHED_ASAP(x) (((node_sched_params_ptr)(x)->aux.info)->asap)
+ #define SCHED_TIME(x) (((node_sched_params_ptr)(x)->aux.info)->time)
+ #define SCHED_FIRST_REG_MOVE(x) \
+@@ -576,6 +585,36 @@
+     }
+ }
+ 
++/* Update the sched_params (time, row and stage) for node U using the II,
++   the CYCLE of U and MIN_CYCLE.  
++   We're not simply taking the following
++   SCHED_STAGE (u) = CALC_STAGE_COUNT (SCHED_TIME (u), min_cycle, ii);
++   because the stages may not be aligned on cycle 0.  */
++static void
++update_node_sched_params (ddg_node_ptr u, int ii, int cycle, int min_cycle)
++{
++  int sc_until_cycle_zero;
++  int stage;
++
++  SCHED_TIME (u) = cycle;
++  SCHED_ROW (u) = SMODULO (cycle, ii);
++
++  /* The calculation of stage count is done adding the number
++     of stages before cycle zero and after cycle zero.  */
++  sc_until_cycle_zero = CALC_STAGE_COUNT (-1, min_cycle, ii);
++
++  if (SCHED_TIME (u) < 0)
++    {
++      stage = CALC_STAGE_COUNT (-1, SCHED_TIME (u), ii);
++      SCHED_STAGE (u) = sc_until_cycle_zero - stage;
++    }
++  else
++    {
++      stage = CALC_STAGE_COUNT (SCHED_TIME (u), 0, ii);
++      SCHED_STAGE (u) = sc_until_cycle_zero + stage - 1;
++    }
++}
++
+ /* Bump the SCHED_TIMEs of all nodes by AMOUNT.  Set the values of
+    SCHED_ROW and SCHED_STAGE.  */
+ static void
+@@ -591,7 +630,6 @@
+ 	ddg_node_ptr u = crr_insn->node;
+ 	int normalized_time = SCHED_TIME (u) - amount;
+ 	int new_min_cycle = PS_MIN_CYCLE (ps) - amount;
+-        int sc_until_cycle_zero, stage;
+ 
+         if (dump_file)
+           {
+@@ -607,23 +645,9 @@
+ 	
+ 	gcc_assert (SCHED_TIME (u) >= ps->min_cycle);
+ 	gcc_assert (SCHED_TIME (u) <= ps->max_cycle);
+-	SCHED_TIME (u) = normalized_time;
+-	SCHED_ROW (u) = SMODULO (normalized_time, ii);
+-      
+-        /* The calculation of stage count is done adding the number
+-           of stages before cycle zero and after cycle zero.  */
+-	sc_until_cycle_zero = CALC_STAGE_COUNT (-1, new_min_cycle, ii);
+-	
+-	if (SCHED_TIME (u) < 0)
+-	  {
+-	    stage = CALC_STAGE_COUNT (-1, SCHED_TIME (u), ii);
+-	    SCHED_STAGE (u) = sc_until_cycle_zero - stage;
+-	  }
+-	else
+-	  {
+-	    stage = CALC_STAGE_COUNT (SCHED_TIME (u), 0, ii);
+-	    SCHED_STAGE (u) = sc_until_cycle_zero + stage - 1;
+-	  }
++
++	crr_insn->cycle = normalized_time;
++	update_node_sched_params (u, ii, normalized_time, new_min_cycle);
+       }
+ }
+  
+@@ -660,6 +684,206 @@
+ 			    PREV_INSN (last));
+ }
+ 
++/* Set bitmaps TMP_FOLLOW and TMP_PRECEDE to MUST_FOLLOW and MUST_PRECEDE
++   respectively only if cycle C falls on the border of the scheduling
++   window boundaries marked by START and END cycles.  STEP is the
++   direction of the window.  */
++static inline void
++set_must_precede_follow (sbitmap *tmp_follow, sbitmap must_follow,
++			 sbitmap *tmp_precede, sbitmap must_precede, int c,
++			 int start, int end, int step)
++{
++  *tmp_precede = NULL;
++  *tmp_follow = NULL;
++
++  if (c == start)
++    {
++      if (step == 1)
++	*tmp_precede = must_precede;
++      else			/* step == -1.  */
++	*tmp_follow = must_follow;
++    }
++  if (c == end - step)
++    {
++      if (step == 1)
++	*tmp_follow = must_follow;
++      else			/* step == -1.  */
++	*tmp_precede = must_precede;
++    }
++
++}
++
++/* Return True if the branch can be moved to row ii-1 while
++   normalizing the partial schedule PS to start from cycle zero and thus
++   optimize the SC.  Otherwise return False.  */
++static bool
++optimize_sc (partial_schedule_ptr ps, ddg_ptr g)
++{
++  int amount = PS_MIN_CYCLE (ps);
++  sbitmap sched_nodes = sbitmap_alloc (g->num_nodes);
++  int start, end, step;
++  int ii = ps->ii;
++  bool ok = false;
++  int stage_count, stage_count_curr;
++
++  /* Compare the SC after normalization and SC after bringing the branch
++     to row ii-1.  If they are equal just bail out.  */
++  stage_count = calculate_stage_count (ps, amount);
++  stage_count_curr =
++    calculate_stage_count (ps, SCHED_TIME (g->closing_branch) - (ii - 1));
++
++  if (stage_count == stage_count_curr)
++    {
++      if (dump_file)
++	fprintf (dump_file, "SMS SC already optimized.\n");
++
++      ok = false;
++      goto clear;
++    }
++
++  if (dump_file)
++    {
++      fprintf (dump_file, "SMS Trying to optimize branch location\n");
++      fprintf (dump_file, "SMS partial schedule before trial:\n");
++      print_partial_schedule (ps, dump_file);
++    }
++
++  /* First, normalize the partial scheduling.  */
++  reset_sched_times (ps, amount);
++  rotate_partial_schedule (ps, amount);
++  if (dump_file)
++    {
++      fprintf (dump_file,
++	       "SMS partial schedule after normalization (ii, %d, SC %d):\n",
++	       ii, stage_count);
++      print_partial_schedule (ps, dump_file);
++    }
++
++  if (SMODULO (SCHED_TIME (g->closing_branch), ii) == ii - 1)
++    {
++      ok = true;
++      goto clear;
++    }
++
++  sbitmap_ones (sched_nodes);
++
++  /* Calculate the new placement of the branch.  It should be in row
++     ii-1 and fall into it's scheduling window.  */
++  if (get_sched_window (ps, g->closing_branch, sched_nodes, ii, &start,
++			&step, &end) == 0)
++    {
++      bool success;
++      ps_insn_ptr next_ps_i;
++      int branch_cycle = SCHED_TIME (g->closing_branch);
++      int row = SMODULO (branch_cycle, ps->ii);
++      int num_splits = 0;
++      sbitmap must_precede, must_follow, tmp_precede, tmp_follow;
++      int c;
++
++      if (dump_file)
++	fprintf (dump_file, "\nTrying to schedule node %d "
++		 "INSN = %d  in (%d .. %d) step %d\n",
++		 g->closing_branch->cuid,
++		 (INSN_UID (g->closing_branch->insn)), start, end, step);
++
++      gcc_assert ((step > 0 && start < end) || (step < 0 && start > end));
++      if (step == 1)
++	{
++	  c = start + ii - SMODULO (start, ii) - 1;
++	  gcc_assert (c >= start);
++	  if (c >= end)
++	    {
++	      ok = false;
++	      if (dump_file)
++		fprintf (dump_file,
++			 "SMS failed to schedule branch at cycle: %d\n", c);
++	      goto clear;
++	    }
++	}
++      else
++	{
++	  c = start - SMODULO (start, ii) - 1;
++	  gcc_assert (c <= start);
++
++	  if (c <= end)
++	    {
++	      if (dump_file)
++		fprintf (dump_file,
++			 "SMS failed to schedule branch at cycle: %d\n", c);
++	      ok = false;
++	      goto clear;
++	    }
++	}
++
++      must_precede = sbitmap_alloc (g->num_nodes);
++      must_follow = sbitmap_alloc (g->num_nodes);
++
++      /* Try to schedule the branch is it's new cycle.  */
++      calculate_must_precede_follow (g->closing_branch, start, end,
++				     step, ii, sched_nodes,
++				     must_precede, must_follow);
++
++      set_must_precede_follow (&tmp_follow, must_follow, &tmp_precede,
++			       must_precede, c, start, end, step);
++
++      /* Find the element in the partial schedule related to the closing
++         branch so we can remove it from it's current cycle.  */
++      for (next_ps_i = ps->rows[row];
++	   next_ps_i; next_ps_i = next_ps_i->next_in_row)
++	if (next_ps_i->node->cuid == g->closing_branch->cuid)
++	  break;
++
++      gcc_assert (next_ps_i);
++      gcc_assert (remove_node_from_ps (ps, next_ps_i));
++      success =
++	try_scheduling_node_in_cycle (ps, g->closing_branch,
++				      g->closing_branch->cuid, c,
++				      sched_nodes, &num_splits,
++				      tmp_precede, tmp_follow);
++      gcc_assert (num_splits == 0);
++      if (!success)
++	{
++	  if (dump_file)
++	    fprintf (dump_file,
++		     "SMS failed to schedule branch at cycle: %d, "
++		     "bringing it back to cycle %d\n", c, branch_cycle);
++
++	  /* The branch was failed to be placed in row ii - 1.
++	     Put it back in it's original place in the partial
++	     schedualing.  */
++	  set_must_precede_follow (&tmp_follow, must_follow, &tmp_precede,
++				   must_precede, branch_cycle, start, end,
++				   step);
++	  success =
++	    try_scheduling_node_in_cycle (ps, g->closing_branch,
++					  g->closing_branch->cuid,
++					  branch_cycle, sched_nodes,
++					  &num_splits, tmp_precede,
++					  tmp_follow);
++	  gcc_assert (success && (num_splits == 0));
++	  ok = false;
++	}
++      else
++	{
++	  /* The branch is placed in row ii - 1.  */
++	  if (dump_file)
++	    fprintf (dump_file,
++		     "SMS success in moving branch to cycle %d\n", c);
++
++	  update_node_sched_params (g->closing_branch, ii, c,
++				    PS_MIN_CYCLE (ps));
++	  ok = true;
++	}
++
++      free (must_precede);
++      free (must_follow);
++    }
++
++clear:
++  free (sched_nodes);
++  return ok;
++}
++
+ static void
+ duplicate_insns_of_cycles (partial_schedule_ptr ps, int from_stage,
+ 			   int to_stage, int for_prolog, rtx count_reg)
+@@ -1115,6 +1339,7 @@
+       int mii, rec_mii;
+       unsigned stage_count = 0;
+       HOST_WIDEST_INT loop_count = 0;
++      bool opt_sc_p = false;
+ 
+       if (! (g = g_arr[loop->num]))
+         continue;
+@@ -1196,14 +1421,32 @@
+       set_node_sched_params (g);
+ 
+       ps = sms_schedule_by_order (g, mii, maxii, node_order);
+-
+-       if (ps)
+-       {
+-         stage_count = calculate_stage_count (ps);
+-         gcc_assert(stage_count >= 1);
+-         PS_STAGE_COUNT(ps) = stage_count;
+-       }
+-
++      
++      if (ps)
++	{
++	  /* Try to achieve optimized SC by normalizing the partial
++	     schedule (having the cycles start from cycle zero).
++	     The branch location must be placed in row ii-1 in the
++	     final scheduling.	If failed, shift all instructions to
++	     position the branch in row ii-1.  */
++	  opt_sc_p = optimize_sc (ps, g);
++	  if (opt_sc_p)
++	    stage_count = calculate_stage_count (ps, 0);
++	  else
++	    {
++	      /* Bring the branch to cycle ii-1.  */
++	      int amount = SCHED_TIME (g->closing_branch) - (ps->ii - 1);
++	      
++	      if (dump_file)
++		fprintf (dump_file, "SMS schedule branch at cycle ii-1\n");
++	      
++	      stage_count = calculate_stage_count (ps, amount);
++	    }
++	  
++	  gcc_assert (stage_count >= 1);
++	  PS_STAGE_COUNT (ps) = stage_count;
++	}
++      
+       /* The default value of PARAM_SMS_MIN_SC is 2 as stage count of
+          1 means that there is no interleaving between iterations thus
+          we let the scheduling passes do the job in this case.  */
+@@ -1224,12 +1467,16 @@
+       else
+ 	{
+ 	  struct undo_replace_buff_elem *reg_move_replaces;
+-          int amount = SCHED_TIME (g->closing_branch) + 1;
++
++          if (!opt_sc_p)
++            {
++	      /* Rotate the partial schedule to have the branch in row ii-1.  */
++              int amount = SCHED_TIME (g->closing_branch) - (ps->ii - 1);
++	      
++              reset_sched_times (ps, amount);
++              rotate_partial_schedule (ps, amount);
++            }
+ 	  
+-	  /* Set the stage boundaries.	The closing_branch was scheduled
+-	     and should appear in the last (ii-1) row.  */
+-	  reset_sched_times (ps, amount);
+-	  rotate_partial_schedule (ps, amount);
+ 	  set_columns_for_ps (ps);
+ 
+ 	  canon_loop (loop);
+@@ -1381,13 +1628,11 @@
+    scheduling window is empty and zero otherwise.  */
+ 
+ static int
+-get_sched_window (partial_schedule_ptr ps, int *nodes_order, int i,
++get_sched_window (partial_schedule_ptr ps, ddg_node_ptr u_node,
+ 		  sbitmap sched_nodes, int ii, int *start_p, int *step_p, int *end_p)
+ {
+   int start, step, end;
+   ddg_edge_ptr e;
+-  int u = nodes_order [i];
+-  ddg_node_ptr u_node = &ps->g->nodes[u];
+   sbitmap psp = sbitmap_alloc (ps->g->num_nodes);
+   sbitmap pss = sbitmap_alloc (ps->g->num_nodes);
+   sbitmap u_node_preds = NODE_PREDECESSORS (u_node);
+@@ -1799,7 +2044,7 @@
+ 
+ 	  /* Try to get non-empty scheduling window.  */
+ 	 success = 0;
+-         if (get_sched_window (ps, nodes_order, i, sched_nodes, ii, &start,
++         if (get_sched_window (ps, u_node, sched_nodes, ii, &start,
+                                 &step, &end) == 0)
+             {
+               if (dump_file)
+@@ -1816,24 +2061,11 @@
+ 
+               for (c = start; c != end; c += step)
+                 {
+-                  sbitmap tmp_precede = NULL;
+-                  sbitmap tmp_follow = NULL;
+-
+-                  if (c == start)
+-                    {
+-                      if (step == 1)
+-                        tmp_precede = must_precede;
+-                      else      /* step == -1.  */
+-                        tmp_follow = must_follow;
+-                    }
+-                  if (c == end - step)
+-                    {
+-                      if (step == 1)
+-                        tmp_follow = must_follow;
+-                      else      /* step == -1.  */
+-                        tmp_precede = must_precede;
+-                    }
+-
++		  sbitmap tmp_precede, tmp_follow;
++
++                  set_must_precede_follow (&tmp_follow, must_follow, 
++		                           &tmp_precede, must_precede, 
++                                           c, start, end, step);
+                   success =
+                     try_scheduling_node_in_cycle (ps, u_node, u, c,
+                                                   sched_nodes,
+@@ -2893,12 +3125,10 @@
+ }
+ 
+ /* Calculate the stage count of the partial schedule PS.  The calculation
+-   takes into account the rotation to bring the closing branch to row
+-   ii-1.  */
++   takes into account the rotation amount passed in ROTATION_AMOUNT.  */
+ int
+-calculate_stage_count (partial_schedule_ptr ps)
++calculate_stage_count (partial_schedule_ptr ps, int rotation_amount)
+ {
+-  int rotation_amount = (SCHED_TIME (ps->g->closing_branch)) + 1;
+   int new_min_cycle = PS_MIN_CYCLE (ps) - rotation_amount;
+   int new_max_cycle = PS_MAX_CYCLE (ps) - rotation_amount;
+   int stage_count = CALC_STAGE_COUNT (-1, new_min_cycle, ps->ii);
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99533.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99533.patch
new file mode 100644
index 0000000..196da9d
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99533.patch
@@ -0,0 +1,63 @@
+2011-08-09  Revital Eres  <revital.eres@linaro.org>
+
+	gcc/
+	Backport from trunk -r176970:
+
+	* modulo-sched.c: Change comment.
+	(reset_sched_times): Fix print message.
+	(print_partial_schedule): Add print
+	info.
+
+=== modified file 'gcc/modulo-sched.c'
+--- old/gcc/modulo-sched.c	2011-08-03 12:20:38 +0000
++++ new/gcc/modulo-sched.c	2011-08-09 04:31:10 +0000
+@@ -84,13 +84,14 @@
+       II cycles (i.e. use register copies to prevent a def from overwriting
+       itself before reaching the use).
+ 
+-    SMS works with countable loops whose loop count can be easily
+-    adjusted.  This is because we peel a constant number of iterations
+-    into a prologue and epilogue for which we want to avoid emitting
+-    the control part, and a kernel which is to iterate that constant
+-    number of iterations less than the original loop.  So the control
+-    part should be a set of insns clearly identified and having its
+-    own iv, not otherwise used in the loop (at-least for now), which
++    SMS works with countable loops (1) whose control part can be easily
++    decoupled from the rest of the loop and (2) whose loop count can
++    be easily adjusted.  This is because we peel a constant number of
++    iterations into a prologue and epilogue for which we want to avoid
++    emitting the control part, and a kernel which is to iterate that
++    constant number of iterations less than the original loop.  So the
++    control part should be a set of insns clearly identified and having
++    its own iv, not otherwise used in the loop (at-least for now), which
+     initializes a register before the loop to the number of iterations.
+     Currently SMS relies on the do-loop pattern to recognize such loops,
+     where (1) the control part comprises of all insns defining and/or
+@@ -636,8 +637,8 @@
+             /* Print the scheduling times after the rotation.  */
+             fprintf (dump_file, "crr_insn->node=%d (insn id %d), "
+                      "crr_insn->cycle=%d, min_cycle=%d", crr_insn->node->cuid,
+-                     INSN_UID (crr_insn->node->insn), SCHED_TIME (u),
+-                     normalized_time);
++                     INSN_UID (crr_insn->node->insn), normalized_time,
++                     new_min_cycle);
+             if (JUMP_P (crr_insn->node->insn))
+               fprintf (dump_file, " (branch)");
+             fprintf (dump_file, "\n");
+@@ -2782,8 +2783,13 @@
+       fprintf (dump, "\n[ROW %d ]: ", i);
+       while (ps_i)
+ 	{
+-	  fprintf (dump, "%d, ",
+-		   INSN_UID (ps_i->node->insn));
++	  if (JUMP_P (ps_i->node->insn))
++	    fprintf (dump, "%d (branch), ",
++		     INSN_UID (ps_i->node->insn));
++	  else
++	    fprintf (dump, "%d, ",
++		     INSN_UID (ps_i->node->insn));
++	
+ 	  ps_i = ps_i->next_in_row;
+ 	}
+     }
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99534.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99534.patch
new file mode 100644
index 0000000..9fa6cf2
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99534.patch
@@ -0,0 +1,39 @@
+2011-08-09  Revital Eres  <revital.eres@linaro.org>
+
+	gcc/
+	Backport from trunk -r176972:
+
+	* ddg.c (create_ddg_dep_from_intra_loop_link): Remove
+	the creation of anti-dep edge from a branch.
+	add_cross_iteration_register_deps):
+	Create anti-dep edge from a branch.
+
+=== modified file 'gcc/ddg.c'
+--- old/gcc/ddg.c	2011-07-05 09:02:18 +0000
++++ new/gcc/ddg.c	2011-07-31 13:13:38 +0000
+@@ -197,11 +197,6 @@
+         }
+     }
+ 
+-  /* If a true dep edge enters the branch create an anti edge in the
+-     opposite direction to prevent the creation of reg-moves.  */
+-  if ((DEP_TYPE (link) == REG_DEP_TRUE) && JUMP_P (dest_node->insn))
+-    create_ddg_dep_no_link (g, dest_node, src_node, ANTI_DEP, REG_DEP, 1);
+-
+    latency = dep_cost (link);
+    e = create_ddg_edge (src_node, dest_node, t, dt, latency, distance);
+    add_edge_to_ddg (g, e);
+@@ -305,8 +300,11 @@
+ 
+ 	  gcc_assert (first_def_node);
+ 
++         /* Always create the edge if the use node is a branch in
++            order to prevent the creation of reg-moves.  */
+           if (DF_REF_ID (last_def) != DF_REF_ID (first_def)
+-              || !flag_modulo_sched_allow_regmoves)
++              || !flag_modulo_sched_allow_regmoves
++	      || JUMP_P (use_node->insn))
+             create_ddg_dep_no_link (g, use_node, first_def_node, ANTI_DEP,
+                                     REG_DEP, 1);
+ 
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99536.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99536.patch
new file mode 100644
index 0000000..76798ec
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99536.patch
@@ -0,0 +1,33 @@
+2011-08-15  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	* config/rs6000/rs6000.c (paired_expand_vector_init): Don't create
+	CONST_VECTORs with symbolic elements.
+	(rs6000_expand_vector_init): Likewise.
+
+=== modified file 'gcc/config/rs6000/rs6000.c'
+--- old/gcc/config/rs6000/rs6000.c	2011-08-11 11:09:07 +0000
++++ new/gcc/config/rs6000/rs6000.c	2011-08-16 12:42:39 +0000
+@@ -4129,7 +4129,9 @@
+   for (i = 0; i < n_elts; ++i)
+     {
+       x = XVECEXP (vals, 0, i);
+-      if (!CONSTANT_P (x))
++      if (!(CONST_INT_P (x)
++	    || GET_CODE (x) == CONST_DOUBLE
++	    || GET_CODE (x) == CONST_FIXED))
+ 	++n_var;
+     }
+   if (n_var == 0)
+@@ -4281,7 +4283,9 @@
+   for (i = 0; i < n_elts; ++i)
+     {
+       x = XVECEXP (vals, 0, i);
+-      if (!CONSTANT_P (x))
++      if (!(CONST_INT_P (x)
++	    || GET_CODE (x) == CONST_DOUBLE
++	    || GET_CODE (x) == CONST_FIXED))
+ 	++n_var, one_var = i;
+       else if (x != CONST0_RTX (inner_mode))
+ 	all_const_zero = false;
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99537.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99537.patch
new file mode 100644
index 0000000..b858433
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99537.patch
@@ -0,0 +1,105 @@
+2011-08-16  Matthias Klose  <doko@ubuntu.com>
+
+	Backport from FSF:
+
+	2010-12-20  Joseph Myers  <joseph@codesourcery.com>
+
+	* config/rs6000/freebsd.h (SVR4_ASM_SPEC): Don't define.
+	(DBX_REGISTER_NUMBER): Define.
+	* config/rs6000/lynx.h (DBX_REGISTER_NUMBER): Define.
+	* config/rs6000/netbsd.h (DBX_REGISTER_NUMBER): Define.
+	* config/rs6000/sysv4.h (SIZE_TYPE): Define.
+	(ASM_SPEC): Define without using SVR4_ASM_SPEC.
+	(DBX_REGISTER_NUMBER): Undefine.
+	* config.gcc (powerpc-*-eabispe*, powerpc-*-eabisimaltivec*,
+	powerpc-*-eabisim*, powerpc-*-elf*, powerpc-*-eabialtivec*,
+	powerpc-xilinx-eabi*, powerpc-*-eabi*, powerpc-*-rtems*,
+	powerpc-*-linux* | powerpc64-*-linux*, powerpc64-*-gnu*,
+	powerpc-*-gnu-gnualtivec*, powerpc-*-gnu*,
+	powerpc-wrs-vxworks|powerpc-wrs-vxworksae, powerpcle-*-elf*,
+	powerpcle-*-eabisim*, powerpcle-*-eabi*): Don't use svr4.h.
+
+=== modified file 'gcc/config.gcc'
+Index: gcc-4_5-branch/gcc/config.gcc
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config.gcc	2011-09-16 23:01:43.000000000 -0700
++++ gcc-4_5-branch/gcc/config.gcc	2011-09-17 10:54:32.763299018 -0700
+@@ -2028,7 +2028,7 @@ powerpc-*-rtems*)
+ 	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-rtems t-rtems rs6000/t-ppccomm"
+ 	;;
+ powerpc-*-linux* | powerpc64-*-linux*)
+-	tm_file="${tm_file} dbxelf.h elfos.h svr4.h freebsd-spec.h rs6000/sysv4.h"
++	tm_file="${tm_file} dbxelf.h elfos.h linux.h freebsd-spec.h rs6000/sysv4.h"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	tmake_file="t-dfprules rs6000/t-fprules rs6000/t-ppcos ${tmake_file} rs6000/t-ppccomm"
+ 	maybe_biarch=yes
+Index: gcc-4_5-branch/gcc/config/freebsd-spec.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/freebsd-spec.h	2011-06-16 17:59:03.000000000 -0700
++++ gcc-4_5-branch/gcc/config/freebsd-spec.h	2011-09-17 10:54:32.763299018 -0700
+@@ -154,6 +154,7 @@ is built with the --enable-threads confi
+ #endif
+ 
+ #if defined(HAVE_LD_EH_FRAME_HDR)
++#undef LINK_EH_SPEC
+ #define LINK_EH_SPEC "%{!static:--eh-frame-hdr} "
+ #endif
+ 
+Index: gcc-4_5-branch/gcc/config/rs6000/linux64.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/rs6000/linux64.h	2011-09-16 23:01:43.000000000 -0700
++++ gcc-4_5-branch/gcc/config/rs6000/linux64.h	2011-09-17 10:56:01.043298999 -0700
+@@ -339,6 +339,9 @@ extern int dot_symbols;
+ 
+ #undef	LINK_OS_DEFAULT_SPEC
+ #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
++#undef LINUX_DYNAMIC_LINKER32
++#undef LINUX_DYNAMIC_LINKER64
++#undef CHOOSE_DYNAMIC_LINKER
+ 
+ #define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
+ #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64.so.1"
+Index: gcc-4_5-branch/gcc/config/rs6000/sysv4.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/rs6000/sysv4.h	2011-09-16 23:01:44.000000000 -0700
++++ gcc-4_5-branch/gcc/config/rs6000/sysv4.h	2011-09-17 10:54:32.773299018 -0700
+@@ -617,6 +617,7 @@ SVR4_ASM_SPEC \
+ #define CC1_SECURE_PLT_DEFAULT_SPEC ""
+ #endif
+ 
++#undef CC1_SPEC
+ /* Pass -G xxx to the compiler and set correct endian mode.  */
+ #define	CC1_SPEC "%{G*} %(cc1_cpu) \
+ %{mlittle|mlittle-endian: %(cc1_endian_little);           \
+@@ -900,22 +901,13 @@ SVR4_ASM_SPEC \
+ #define LINK_START_LINUX_SPEC ""
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
+-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
+-#if DEFAULT_LIBC == LIBC_UCLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
+-#elif DEFAULT_LIBC == LIBC_GLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
+-#else
+-#error "Unsupported DEFAULT_LIBC"
+-#endif
+-#define LINUX_DYNAMIC_LINKER \
+-  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)
+ 
+ #define LINK_OS_LINUX_SPEC "-m elf32ppclinux %{!shared: %{!static: \
+   %{rdynamic:-export-dynamic} \
+   %{!dynamic-linker:-dynamic-linker " LINUX_DYNAMIC_LINKER "}}}"
+ 
+ #if defined(HAVE_LD_EH_FRAME_HDR)
++# undef LINK_EH_SPEC
+ # define LINK_EH_SPEC "%{!static:--eh-frame-hdr} "
+ #endif
+ 
+@@ -1110,6 +1102,7 @@ ncrtn.o%s"
+    be stacked, so that invocations of #pragma pack(pop)' will return
+    to the previous value.  */
+ 
++#undef HANDLE_PRAGMA_PACK_PUSH_POP
+ #define HANDLE_PRAGMA_PACK_PUSH_POP 1
+ 
+ /* Select a format to encode pointers in exception handling data.  CODE
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99540.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99540.patch
new file mode 100644
index 0000000..b71f6cc
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99540.patch
@@ -0,0 +1,23 @@
+2011-08-26  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	Backport from mainline:
+
+	2011-08-26  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	* df-problems.c (df_note_bb_compute): Pass uses rather than defs
+	to df_set_dead_notes_for_mw.
+
+=== modified file 'gcc/df-problems.c'
+--- old/gcc/df-problems.c	2011-05-05 14:28:53 +0000
++++ new/gcc/df-problems.c	2011-08-26 14:39:38 +0000
+@@ -3562,7 +3562,7 @@
+       while (*mws_rec)
+ 	{
+ 	  struct df_mw_hardreg *mws = *mws_rec;
+-	  if ((DF_MWS_REG_DEF_P (mws))
++	  if (DF_MWS_REG_USE_P (mws)
+ 	      && !df_ignore_stack_reg (mws->start_regno))
+ 	    {
+ 	      bool really_add_notes = debug_insn != 0;
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99541.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99541.patch
new file mode 100644
index 0000000..ae0e4bc
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99541.patch
@@ -0,0 +1,22 @@
+2011-09-12  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	Backport from mainline:
+
+	2010-12-06  Jakub Jelinek  <jakub@redhat.com>
+
+	PR debug/46771
+	* reginfo.c (init_subregs_of_mode): Don't call find_subregs_of_mode
+	on DEBUG_INSNs.
+
+=== modified file 'gcc/reginfo.c'
+--- old/gcc/reginfo.c	2010-10-04 00:50:43 +0000
++++ new/gcc/reginfo.c	2011-09-12 10:54:51 +0000
+@@ -1350,7 +1350,7 @@
+ 
+   FOR_EACH_BB (bb)
+     FOR_BB_INSNS (bb, insn)
+-    if (INSN_P (insn))
++    if (NONDEBUG_INSN_P (insn))
+       find_subregs_of_mode (PATTERN (insn));
+ }
-- 
1.7.5.4



