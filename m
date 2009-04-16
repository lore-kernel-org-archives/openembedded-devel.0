Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LuMxP-0003mM-P7
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 10:29:58 +0200
Received: by wa-out-1112.google.com with SMTP id n7so145811wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2009 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=UDwFS0ho2KyQtVPR12YXae2jZ7rD75hr56G+hkuAkPQ=;
	b=gIiqCfn4s9dFRvdS9yOsTsZVJSP/VaktMPYHowJEBhPeOyrSv2SL2GC3o1QUNbEjfW
	6M4HoBkeK5yKvOqyaD50S4yPVaCjB5rMDTYUGvhoYebb27t/YI7k+x9kPzTApMVyNutg
	tP8CthOz083fKG4kZ5MbvyvFytVJbovIlP0v0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=fnNhoUlZJnTSOdIF8oIwvmC1/3++f7q7aq4eulxLB5bUfUq/+IUgoq/Jz3CoxSIaUy
	XaeCHPim3NrGmC4CZP1UFFBrzWtAfLDyjYzBESSIb/IzyKNCM52itZdw6A5eEZv+eLf8
	b2vbS8A+JYHemnSn6rAsiDrMAxKYDHZG7GxmY=
Received: by 10.114.200.2 with SMTP id x2mr601376waf.187.1239870275291;
	Thu, 16 Apr 2009 01:24:35 -0700 (PDT)
Received: from localhost (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id t1sm4134968poh.4.2009.04.16.01.24.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Apr 2009 01:24:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2009 01:24:32 -0700
Message-Id: <1239870272-29508-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.146.176
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS,URIBL_SBL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] binutils-2.19.51.0.3: Add the latest HJ Lu's binutils release 2.19.51.0.3 recipes.
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
X-List-Received-Date: Thu, 16 Apr 2009 08:30:05 -0000

	* With these binutils we can build uclibc in thumb mode correctly.

Signed-off-by: Khem Raj  <raj.khem@gmail.com>
---
 conf/checksums.ini                                 |    4 ++
 .../binutils-2.19.51.0.3/110-arm-eabi-conf.patch   |   22 +++++++++
 .../binutils-2.16.1-e300c2c3.patch                 |   18 +++++++
 ...tils-2.16.91.0.6-objcopy-rename-errorcode.patch |   39 +++++++++++++++
 .../binutils-2.19.51.0.3/binutils-arm-pr7093.patch |   19 +++++++
 .../binutils-uclibc-100-uclibc-conf.patch          |   34 +++++++++++++
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |   50 ++++++++++++++++++++
 ...binutils-uclibc-300-006_better_file_error.patch |   43 +++++++++++++++++
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |   47 ++++++++++++++++++
 .../binutils-uclibc-gas-needs-libm.patch           |   38 +++++++++++++++
 recipes/binutils/binutils-cross-sdk_2.19.51.0.3.bb |    3 +
 recipes/binutils/binutils-cross_2.19.51.0.3.bb     |    4 ++
 recipes/binutils/binutils_2.19.51.0.3.bb           |   19 +++++++
 13 files changed, 340 insertions(+), 0 deletions(-)
 create mode 100644 recipes/binutils/binutils-2.19.51.0.3/110-arm-eabi-conf.patch
 create mode 100644 recipes/binutils/binutils-2.19.51.0.3/binutils-2.16.1-e300c2c3.patch
 create mode 100644 recipes/binutils/binutils-2.19.51.0.3/binutils-2.16.91.0.6-objcopy-rename-errorcode.patch
 create mode 100644 recipes/binutils/binutils-2.19.51.0.3/binutils-arm-pr7093.patch
 create mode 100644 recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-100-uclibc-conf.patch
 create mode 100644 recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-300-001_ld_makefile_patch.patch
 create mode 100644 recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-300-006_better_file_error.patch
 create mode 100644 recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-300-012_check_ldrunpath_length.patch
 create mode 100644 recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-gas-needs-libm.patch
 create mode 100644 recipes/binutils/binutils-cross-sdk_2.19.51.0.3.bb
 create mode 100644 recipes/binutils/binutils-cross_2.19.51.0.3.bb
 create mode 100644 recipes/binutils/binutils_2.19.51.0.3.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 948a4bf..38afb49 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -2586,6 +2586,10 @@ sha256=2df529b1ac0a621efb87b5b53dbc0167c566f8bebbd6a8ce19964b05845fd2e7
 md5=09a8c5821a2dfdbb20665bc0bd680791
 sha256=3e8225b4d7ace0a2039de752e11fd6922d3b89a7259a292c347391c4788739f6
 
+[http://kernel.org/pub/linux/devel/binutils/binutils-2.19.51.0.3.tar.bz2]
+md5=c55a2b1eadf818d38e963060412fadca
+sha256=11a53d332d2295f447ab49402a34d82875bbf5da8dc239ebb909eafdf3c26a36
+
 [ftp://ftp.gnu.org/gnu/binutils/binutils-2.19.tar.bz2]
 md5=17a52219dee5a76c1a9d9b0bfd337d66
 sha256=bd2ea10ffc2bf62a917b05f4fbe3d02212589c2bc177fa0c51a9c874d3da528a
diff --git a/recipes/binutils/binutils-2.19.51.0.3/110-arm-eabi-conf.patch b/recipes/binutils/binutils-2.19.51.0.3/110-arm-eabi-conf.patch
new file mode 100644
index 0000000..2623301
--- /dev/null
+++ b/recipes/binutils/binutils-2.19.51.0.3/110-arm-eabi-conf.patch
@@ -0,0 +1,22 @@
+--- /tmp/configure.ac	2008-06-22 14:14:59.000000000 +0200
++++ binutils-2.18.50.0.7/configure.ac	2008-06-22 14:15:30.000000000 +0200
+@@ -561,7 +561,7 @@
+     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
+     libgloss_dir=arm
+     ;;
+-  arm*-*-linux-gnueabi)
++  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
+     noconfigdirs="$noconfigdirs target-qthreads"
+     noconfigdirs="$noconfigdirs target-libobjc"
+     case ${with_newlib} in
+--- /tmp/configure	2008-06-22 14:17:11.000000000 +0200
++++ binutils-2.18.50.0.7/configure	2008-06-22 14:17:56.000000000 +0200
+@@ -2307,7 +2307,7 @@
+     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
+     libgloss_dir=arm
+     ;;
+-  arm*-*-linux-gnueabi)
++  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
+     noconfigdirs="$noconfigdirs target-qthreads"
+     noconfigdirs="$noconfigdirs target-libobjc"
+     case ${with_newlib} in
diff --git a/recipes/binutils/binutils-2.19.51.0.3/binutils-2.16.1-e300c2c3.patch b/recipes/binutils/binutils-2.19.51.0.3/binutils-2.16.1-e300c2c3.patch
new file mode 100644
index 0000000..dfe9b18
--- /dev/null
+++ b/recipes/binutils/binutils-2.19.51.0.3/binutils-2.16.1-e300c2c3.patch
@@ -0,0 +1,18 @@
+Adds support for Freescale Power architecture e300c2 and e300c3 cores.
+http://www.bitshrine.org/gpp/tc-fsl-x86lnx-e300c3-nptl-4.0.2-2.src.rpm
+
+Leon Woestenberg <leonw@mailcan.com>
+
+Index: binutils-2.19.51.0.3/opcodes/ppc-dis.c
+===================================================================
+--- binutils-2.19.51.0.3.orig/opcodes/ppc-dis.c	2009-04-16 00:38:45.000000000 -0700
++++ binutils-2.19.51.0.3/opcodes/ppc-dis.c	2009-04-16 00:43:56.000000000 -0700
+@@ -132,6 +132,8 @@
+ 		| PPC_OPCODE_POWER6 | PPC_OPCODE_POWER7 | PPC_OPCODE_ALTIVEC
+ 		| PPC_OPCODE_VSX),
+     0 },
++  { "pmr",     (PPC_OPCODE_PMR),
++    0 },
+   { "ppc",     (PPC_OPCODE_PPC | PPC_OPCODE_CLASSIC | PPC_OPCODE_32),
+     0 },
+   { "ppc32",   (PPC_OPCODE_PPC | PPC_OPCODE_CLASSIC | PPC_OPCODE_32),
diff --git a/recipes/binutils/binutils-2.19.51.0.3/binutils-2.16.91.0.6-objcopy-rename-errorcode.patch b/recipes/binutils/binutils-2.19.51.0.3/binutils-2.16.91.0.6-objcopy-rename-errorcode.patch
new file mode 100644
index 0000000..8df5b1f
--- /dev/null
+++ b/recipes/binutils/binutils-2.19.51.0.3/binutils-2.16.91.0.6-objcopy-rename-errorcode.patch
@@ -0,0 +1,39 @@
+# strip (and objcopy) fail to set the error code if there is no
+# output file name and the rename of the stripped (or copied) file
+# fails, yet the command fails to do anything.  This fixes both
+# objcopy and strip.
+#
+# modification by bero: Ported to 2.16.91.0.6
+#
+#Signed-off-by: John Bowler <jbowler@acm.org>
+#Signed-off-by: Bernhard Rosenkraenzer <bero@arklinux.org>
+---
+# binutils/objcopy.c |    8 +++++---
+# 1 file changed, 5 insertions(+), 3 deletions(-)
+#
+Index: src/binutils/objcopy.c
+===================================================================
+--- src.orig/binutils/objcopy.c	2007-08-09 13:26:03.000000000 +0100
++++ src/binutils/objcopy.c	2007-08-09 16:36:12.000000000 +0100
+@@ -2787,8 +2787,9 @@ strip_main (int argc, char *argv[])
+ 	  if (preserve_dates)
+ 	    set_times (tmpname, &statbuf);
+ 	  if (output_file != tmpname)
+-	    smart_rename (tmpname, output_file ? output_file : argv[i],
+-			  preserve_dates);
++	    if (smart_rename (tmpname, output_file ? output_file : argv[i],
++			  preserve_dates))
++	      hold_status = 1;
+ 	  status = hold_status;
+ 	}
+       else
+@@ -3411,7 +3412,8 @@ copy_main (int argc, char *argv[])
+       if (preserve_dates)
+ 	set_times (tmpname, &statbuf);
+       if (tmpname != output_filename)
+-	smart_rename (tmpname, input_filename, preserve_dates);
++	if (smart_rename (tmpname, input_filename, preserve_dates))
++	  status = 1;
+     }
+   else
+     unlink_if_ordinary (tmpname);
diff --git a/recipes/binutils/binutils-2.19.51.0.3/binutils-arm-pr7093.patch b/recipes/binutils/binutils-2.19.51.0.3/binutils-arm-pr7093.patch
new file mode 100644
index 0000000..ad4a556
--- /dev/null
+++ b/recipes/binutils/binutils-2.19.51.0.3/binutils-arm-pr7093.patch
@@ -0,0 +1,19 @@
+Index: binutils/bfd/elf32-arm.c
+===================================================================
+RCS file: /cvs/src/src/bfd/elf32-arm.c,v
+retrieving revision 1.162
+retrieving revision 1.163
+diff -u -r1.162 -r1.163
+--- binutils/bfd/elf32-arm.c	23 Dec 2008 09:01:45 -0000	1.162
++++ binutils/bfd/elf32-arm.c	23 Dec 2008 11:46:17 -0000	1.163
+@@ -4608,6 +4608,10 @@
+   Elf_Internal_Shdr *hdr;
+   unsigned int i, localsyms;
+ 
++  /* PR 7093: Make sure that we are dealing with an arm elf binary.  */
++  if (! is_arm_elf (abfd))
++    return;
++
+   if ((abfd->flags & DYNAMIC) != 0)
+     return;
+ 
diff --git a/recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-100-uclibc-conf.patch b/recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-100-uclibc-conf.patch
new file mode 100644
index 0000000..8de04e0
--- /dev/null
+++ b/recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-100-uclibc-conf.patch
@@ -0,0 +1,34 @@
+--- binutils-2.18.orig/configure
++++ binutils-2.18/configure
+@@ -2206,7 +2206,7 @@
+   am33_2.0-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;
+-  sh-*-linux*)
++  sh*-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;
+   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
+@@ -2504,7 +2504,7 @@
+   romp-*-*)
+     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${host}" in
+       i[3456789]86-*-vsta) ;; # don't add gprof back in
+       i[3456789]86-*-go32*) ;; # don't add gprof back in
+--- binutils-2.18.orig/gprof/configure
++++ binutils-2.18/gprof/configure
+@@ -4124,6 +4124,11 @@
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 
++linux-uclibc*)
++  lt_cv_deplibs_check_method=pass_all
++  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
++  ;;
++
+ netbsd*)
+   if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
+     lt_cv_deplibs_check_method='match_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
diff --git a/recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-300-001_ld_makefile_patch.patch b/recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-300-001_ld_makefile_patch.patch
new file mode 100644
index 0000000..04a7e61
--- /dev/null
+++ b/recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-300-001_ld_makefile_patch.patch
@@ -0,0 +1,50 @@
+#!/bin/sh -e
+## 001_ld_makefile_patch.dpatch
+##
+## All lines beginning with `## DP:' are a description of the patch.
+## DP: Description: correct where ld scripts are installed
+## DP: Author: Chris Chimelis <chris@debian.org>
+## DP: Upstream status: N/A
+## DP: Date: ??
+
+if [ $# -ne 1 ]; then
+    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+    exit 1
+fi
+
+[ -f debian/patches/00patch-opts ] && . debian/patches/00patch-opts
+patch_opts="${patch_opts:--f --no-backup-if-mismatch}"
+
+case "$1" in
+       -patch) patch $patch_opts -p1 < $0;;
+       -unpatch) patch $patch_opts -p1 -R < $0;;
+        *)
+                echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+                exit 1;;
+esac
+
+exit 0
+
+@DPATCH@
+--- binutils-2.16.91.0.1/ld/Makefile.am
++++ binutils-2.16.91.0.1/ld/Makefile.am
+@@ -20,7 +20,7 @@
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ 
+ EMUL = @EMUL@
+ EMULATION_OFILES = @EMULATION_OFILES@
+--- binutils-2.16.91.0.1/ld/Makefile.in
++++ binutils-2.16.91.0.1/ld/Makefile.in
+@@ -268,7 +268,7 @@
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ BASEDIR = $(srcdir)/..
+ BFDDIR = $(BASEDIR)/bfd
+ INCDIR = $(BASEDIR)/include
diff --git a/recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-300-006_better_file_error.patch b/recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-300-006_better_file_error.patch
new file mode 100644
index 0000000..f337611
--- /dev/null
+++ b/recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-300-006_better_file_error.patch
@@ -0,0 +1,43 @@
+#!/bin/sh -e
+## 006_better_file_error.dpatch by David Kimdon <dwhedon@gordian.com>
+##
+## All lines beginning with `## DP:' are a description of the patch.
+## DP: Specify which filename is causing an error if the filename is a
+## DP: directory. (#45832)
+
+if [ $# -ne 1 ]; then
+    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+    exit 1
+fi
+
+[ -f debian/patches/00patch-opts ] && . debian/patches/00patch-opts
+patch_opts="${patch_opts:--f --no-backup-if-mismatch}"
+
+case "$1" in
+       -patch) patch $patch_opts -p1 < $0;;
+       -unpatch) patch $patch_opts -p1 -R < $0;;
+        *)
+                echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+                exit 1;;
+esac
+
+exit 0
+
+@DPATCH@
+diff -urNad /home/james/debian/packages/binutils/binutils-2.14.90.0.6/bfd/opncls.c binutils-2.14.90.0.6/bfd/opncls.c
+--- /home/james/debian/packages/binutils/binutils-2.14.90.0.6/bfd/opncls.c	2003-07-23 16:08:09.000000000 +0100
++++ binutils-2.14.90.0.6/bfd/opncls.c	2003-09-10 22:35:00.000000000 +0100
+@@ -150,6 +150,13 @@
+ {
+   bfd *nbfd;
+   const bfd_target *target_vec;
++  struct stat s;
++
++  if (stat (filename, &s) == 0)
++    if (S_ISDIR(s.st_mode)) {
++      bfd_set_error (bfd_error_file_not_recognized);
++      return NULL;
++    }
+ 
+   nbfd = _bfd_new_bfd ();
+   if (nbfd == NULL)
diff --git a/recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-300-012_check_ldrunpath_length.patch b/recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-300-012_check_ldrunpath_length.patch
new file mode 100644
index 0000000..498651a
--- /dev/null
+++ b/recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-300-012_check_ldrunpath_length.patch
@@ -0,0 +1,47 @@
+#!/bin/sh -e
+## 012_check_ldrunpath_length.dpatch by Chris Chimelis <chris@debian.org>
+##
+## All lines beginning with `## DP:' are a description of the patch.
+## DP: Only generate an RPATH entry if LD_RUN_PATH is not empty, for
+## DP: cases where -rpath isn't specified. (#151024)
+
+if [ $# -ne 1 ]; then
+    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+    exit 1
+fi
+
+[ -f debian/patches/00patch-opts ] && . debian/patches/00patch-opts
+patch_opts="${patch_opts:--f --no-backup-if-mismatch}"
+
+case "$1" in
+       -patch) patch $patch_opts -p1 < $0;;
+       -unpatch) patch $patch_opts -p1 -R < $0;;
+        *)
+                echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+                exit 1;;
+esac
+
+exit 0
+
+@DPATCH@
+diff -urNad /home/james/debian/packages/binutils/new/binutils-2.15/ld/emultempl/elf32.em binutils-2.15/ld/emultempl/elf32.em
+--- /home/james/debian/packages/binutils/new/binutils-2.15/ld/emultempl/elf32.em	2004-05-21 23:12:58.000000000 +0100
++++ binutils-2.15/ld/emultempl/elf32.em	2004-05-21 23:12:59.000000000 +0100
+@@ -692,6 +692,8 @@
+ 	      && command_line.rpath == NULL)
+ 	    {
+ 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
++	      if ((lib_path) && (strlen (lib_path) == 0))
++		  lib_path = NULL;
+ 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
+ 						      force))
+ 		break;
+@@ -871,6 +873,8 @@
+   rpath = command_line.rpath;
+   if (rpath == NULL)
+     rpath = (const char *) getenv ("LD_RUN_PATH");
++  if ((rpath) && (strlen (rpath) == 0))
++      rpath = NULL;
+   if (! (bfd_elf_size_dynamic_sections
+ 	 (output_bfd, command_line.soname, rpath,
+ 	  command_line.filter_shlib,
diff --git a/recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-gas-needs-libm.patch b/recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-gas-needs-libm.patch
new file mode 100644
index 0000000..db838cf
--- /dev/null
+++ b/recipes/binutils/binutils-2.19.51.0.3/binutils-uclibc-gas-needs-libm.patch
@@ -0,0 +1,38 @@
+Source: Khem Raj <raj.khem@gmail.com>
+Disposition: submit upstream.
+
+Description:
+
+We do not need to have the libtool patch anymore for binutils after
+libtool has been updated upstream it include support for it. However
+for building gas natively on uclibc systems we have to link it with
+-lm so that it picks up missing symbols.
+
+/local/build_area/BUILD/arm_v5t_le_uclibc/binutils-2.17.50/objdir/libiberty/pic/libiberty.a(floatformat.o): In function `floatformat_from_double':
+floatformat.c:(.text+0x1ec): undefined reference to `frexp'
+floatformat.c:(.text+0x2f8): undefined reference to `ldexp'
+/local/build_area/BUILD/arm_v5t_le_uclibc/binutils-2.17.50/objdir/libiberty/pic/libiberty.a(floatformat.o): In function `floatformat_to_double':
+floatformat.c:(.text+0x38a): undefined reference to `ldexp'
+floatformat.c:(.text+0x3d2): undefined reference to `ldexp'
+floatformat.c:(.text+0x43e): undefined reference to `ldexp'                     floatformat.c:(.text+0x4e2): undefined reference to `ldexp'
+collect2: ld returned 1 exit status
+make[4]: *** [as-new] Error 1
+
+Index: binutils-2.17.50/gas/configure.tgt
+===================================================================
+--- binutils-2.17.50.orig/gas/configure.tgt
++++ binutils-2.17.50/gas/configure.tgt
+@@ -408,6 +408,12 @@ case ${generic_target} in
+   *-*-netware)				fmt=elf em=netware ;;
+ esac
+ 
++case ${generic_target} in
++  arm-*-*uclibc*)
++    need_libm=yes
++    ;;
++esac
++
+ case ${cpu_type} in
+   alpha | arm | i386 | ia64 | mips | ns32k | pdp11 | ppc | sparc | z80 | z8k)
+     bfd_gas=yes
+
diff --git a/recipes/binutils/binutils-cross-sdk_2.19.51.0.3.bb b/recipes/binutils/binutils-cross-sdk_2.19.51.0.3.bb
new file mode 100644
index 0000000..76dff54
--- /dev/null
+++ b/recipes/binutils/binutils-cross-sdk_2.19.51.0.3.bb
@@ -0,0 +1,3 @@
+require binutils_${PV}.bb
+require binutils-cross-sdk.inc
+PR = "r0"
diff --git a/recipes/binutils/binutils-cross_2.19.51.0.3.bb b/recipes/binutils/binutils-cross_2.19.51.0.3.bb
new file mode 100644
index 0000000..b78a30a
--- /dev/null
+++ b/recipes/binutils/binutils-cross_2.19.51.0.3.bb
@@ -0,0 +1,4 @@
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-${PV}"
+require binutils_${PV}.bb
+require binutils-cross.inc
+
diff --git a/recipes/binutils/binutils_2.19.51.0.3.bb b/recipes/binutils/binutils_2.19.51.0.3.bb
new file mode 100644
index 0000000..7808d3b
--- /dev/null
+++ b/recipes/binutils/binutils_2.19.51.0.3.bb
@@ -0,0 +1,19 @@
+PR = "r0"
+
+require binutils.inc
+
+SRC_URI = "\
+     ${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.tar.bz2 \
+     file://binutils-2.16.91.0.6-objcopy-rename-errorcode.patch;patch=1 \
+     file://binutils-uclibc-100-uclibc-conf.patch;patch=1 \
+     file://110-arm-eabi-conf.patch;patch=1 \
+     file://binutils-uclibc-300-001_ld_makefile_patch.patch;patch=1 \
+     file://binutils-uclibc-300-006_better_file_error.patch;patch=1 \
+     file://binutils-uclibc-300-012_check_ldrunpath_length.patch;patch=1 \
+     file://binutils-uclibc-gas-needs-libm.patch;patch=1 \
+     file://binutils-arm-pr7093.patch;patch=1 \
+     "
+
+# powerpc patches
+SRC_URI += "file://binutils-2.16.1-e300c2c3.patch;patch=1"
+
-- 
1.5.4.3



