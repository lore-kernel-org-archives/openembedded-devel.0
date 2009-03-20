Received: from [209.85.200.169] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lkkwd-0004Fv-5r
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Mar 2009 21:03:55 +0100
Received: by wf-out-1314.google.com with SMTP id 25so1485505wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2009 13:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=e8ilpqtUmcLm/IISk4UT75mVQy4uH8hf/XIspExHbdQ=;
	b=GdEIrlTFbDaI2BA3TK1ZVv3rtQyTsEp4FW7dp0IFviCeWDR8oM9xg5ZSJoXUvL6RUr
	cSEpbphOGNGNsRrknV7OExZ/Hj0C68KWKI5AR6xPIc/qrigGc3fbAtJIIY3hu0s5gZ7C
	NrVmoQsxMwFvK5Y9Umngs80Xovqs1nR0MVN8o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PfNWl1hwHfkjSKy4k0R28B0zh4u1MNBpGjYjejRmXSkhHVw7mKI1zdGXqciNW5GrF7
	3qHnxZlsm/0HvpBphgbjBRnwD+bmb7cWpsytV4erekYAM/i4G6WN7aP0uRC/k86+ugOK
	HV4Pk8huYRJnUK55/7Iczho29q57ZkqTDYES8=
Received: by 10.142.14.18 with SMTP id 18mr1618693wfn.215.1237579369792;
	Fri, 20 Mar 2009 13:02:49 -0700 (PDT)
Received: from localhost (adsl-71-146-12-154.dsl.pltn13.sbcglobal.net
	[71.146.12.154])
	by mx.google.com with ESMTPS id 28sm4667439wfg.51.2009.03.20.13.02.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 20 Mar 2009 13:02:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Mar 2009 13:02:46 -0700
Message-Id: <1237579366-8930-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
Subject: [PATCH] uclibc: Get uclibc working in thumb mode.
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
X-List-Received-Date: Fri, 20 Mar 2009 20:03:56 -0000

	* WARNING!! Do not use bintils 2.19 or 2.19.1
          when compiling in thumb mode. The veneer generation
          does not work as expected. Use binutils 2.18 or binutils_cvs

	* Move LEAD_SONAME into uclibc.inc

	* Use no optimizations while compiling ldso.c
	  to over come a gcc ICE

	* Use ARM mode resolver for thumb mode. The
	  resolver depends on ip register and if we
	  use thumb function for _dl_linux_resolve then
	  it adds a veneer which corrupts ip.
---
 recipes/uclibc/bfin-uclibc_svn.bb                  |    4 +--
 ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |   21 ++++++++++++++++++++
 recipes/uclibc/files/uclibc_ldso_use_O0.patch      |   13 ++++++++++++
 recipes/uclibc/uclibc.inc                          |    7 +----
 recipes/uclibc/uclibc_0.9.29.bb                    |    4 +--
 recipes/uclibc/uclibc_0.9.30.1.bb                  |    6 ++--
 recipes/uclibc/uclibc_0.9.30.bb                    |    6 ++--
 recipes/uclibc/uclibc_nptl.bb                      |    3 +-
 recipes/uclibc/uclibc_svn.bb                       |    5 +--
 9 files changed, 48 insertions(+), 21 deletions(-)
 create mode 100644 recipes/uclibc/files/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
 create mode 100644 recipes/uclibc/files/uclibc_ldso_use_O0.patch

diff --git a/recipes/uclibc/bfin-uclibc_svn.bb b/recipes/uclibc/bfin-uclibc_svn.bb
index 7ab3e8a..9b438a2 100644
--- a/recipes/uclibc/bfin-uclibc_svn.bb
+++ b/recipes/uclibc/bfin-uclibc_svn.bb
@@ -7,7 +7,7 @@
 # on whether the base patches apply to the selected (SRCDATE) svn release.
 #
 UCLIBC_BASE ?= "0.9.29"
-PR = "r4"
+PR = "r5"
 PV = "${UCLIBC_BASE}+svnr${SRCREV}"
 
 require uclibc.inc
@@ -30,5 +30,3 @@ FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${UCLIBC_BASE}', '$
 
 S = "${WORKDIR}/uClibc"
 
-LEAD_SONAME = "libc.so"
-
diff --git a/recipes/uclibc/files/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch b/recipes/uclibc/files/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
new file mode 100644
index 0000000..cfa68ce
--- /dev/null
+++ b/recipes/uclibc/files/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
@@ -0,0 +1,21 @@
+Index: uClibc/ldso/ldso/arm/resolve.S
+===================================================================
+--- uClibc.orig/ldso/ldso/arm/resolve.S	2009-03-20 12:03:32.000000000 -0700
++++ uClibc/ldso/ldso/arm/resolve.S	2009-03-20 12:04:23.000000000 -0700
+@@ -97,7 +97,6 @@
+ 
+  .text
+  .align 4      @ 16 byte boundary and there are 32 bytes below (arm case)
+- #if !defined(__thumb__) || defined(__thumb2__)
+  .arm
+  .globl _dl_linux_resolve
+  .type _dl_linux_resolve,%function
+@@ -129,7 +128,7 @@
+ #else
+ 	mov pc,ip
+ #endif
+-#else
++#if 0
+        @ In the thumb case _dl_linux_resolver is thumb.  If a bl is used
+        @ from arm code the linker will insert a stub call which, with
+        @ binutils 2.16, is not PIC.  Since this code is accessed by an
diff --git a/recipes/uclibc/files/uclibc_ldso_use_O0.patch b/recipes/uclibc/files/uclibc_ldso_use_O0.patch
new file mode 100644
index 0000000..7a89e66
--- /dev/null
+++ b/recipes/uclibc/files/uclibc_ldso_use_O0.patch
@@ -0,0 +1,13 @@
+Index: uClibc/ldso/ldso/Makefile.in
+===================================================================
+--- uClibc.orig/ldso/ldso/Makefile.in	2009-02-03 17:27:55.000000000 -0800
++++ uClibc/ldso/ldso/Makefile.in	2009-02-03 17:28:11.000000000 -0800
+@@ -8,7 +8,7 @@
+ CFLAGS-ldso := -DNOT_IN_libc -DIS_IN_rtld $(SSP_DISABLE_FLAGS)
+ 
+ # This stuff will not work with -fomit-frame-pointer
+-CFLAGS-ldso += -fno-omit-frame-pointer
++CFLAGS-ldso += -O0 -fno-omit-frame-pointer
+ 
+ CFLAGS-ldso += -I$(top_srcdir)ldso/ldso/$(TARGET_ARCH) -I$(top_srcdir)ldso/include -I$(top_srcdir)ldso/ldso
+ CFLAGS-ldso += -DUCLIBC_RUNTIME_PREFIX=\"$(RUNTIME_PREFIX)\" -DUCLIBC_LDSO=\"$(UCLIBC_LDSO)\"
diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
index 7470ec1..be085ab 100644
--- a/recipes/uclibc/uclibc.inc
+++ b/recipes/uclibc/uclibc.inc
@@ -2,11 +2,6 @@ DESCRIPTION = "C library for embedded systems"
 LICENSE = "LGPL"
 SECTION = "libs"
 PRIORITY = "required"
-
-# I added the line below before and someone removed, but without fixing thumb support
-# So please leave this in till thumb support has REALLY been fixed. ktnxbye, koen
-ARM_INSTRUCTION_SET = "arm"
-
 #
 # For now, we will skip building of a gcc package if it is a uclibc one
 # and our build is not a uclibc one, and we skip a glibc one if our build
@@ -37,6 +32,8 @@ PARALLEL_MAKE = ""
 
 PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db"
 
+LEAD_SONAME = "libc.so"
+
 # The last line (gdb and lib1) is for uclinux-uclibc builds 
 uclibc_baselibs = "/lib/libcrypt*.so* /lib/libdl*.so \
 		   /lib/libintl*.so* /lib/libm*.so \
diff --git a/recipes/uclibc/uclibc_0.9.29.bb b/recipes/uclibc/uclibc_0.9.29.bb
index 256196c..aba1830 100644
--- a/recipes/uclibc/uclibc_0.9.29.bb
+++ b/recipes/uclibc/uclibc_0.9.29.bb
@@ -7,7 +7,7 @@
 # on whether the base patches apply to the selected (SRCDATE) svn release.
 #
 UCLIBC_BASE ?= "0.9.29"
-PR = "r29"
+PR = "r30"
 
 require uclibc.inc
 
@@ -42,5 +42,3 @@ KERNEL_SOURCE = "${STAGING_DIR_HOST}/${exec_prefix}"
 SRC_URI += "http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2"
 
 S = "${WORKDIR}/uClibc-${UCLIBC_BASE}"
-
-LEAD_SONAME = "libc.so"
diff --git a/recipes/uclibc/uclibc_0.9.30.1.bb b/recipes/uclibc/uclibc_0.9.30.1.bb
index ca01476..d159ab3 100644
--- a/recipes/uclibc/uclibc_0.9.30.1.bb
+++ b/recipes/uclibc/uclibc_0.9.30.1.bb
@@ -7,7 +7,7 @@
 # on whether the base patches apply to the selected (SRCDATE) svn release.
 #
 UCLIBC_BASE ?= "0.9.30.1"
-PR = "r0"
+PR = "r1"
 DEFAULT_PREFERENCE = "1"
 
 require uclibc.inc
@@ -18,6 +18,8 @@ SRC_URI += "file://uClibc.machine file://uClibc.distro \
             file://arm-linuxthreads.patch;patch=1 \
             file://linuxthreads-changes.patch;patch=1 \
 	    file://pthread_atfork.patch;patch=1 \
+	    file://uclibc_ldso_use_O0.patch;patch=1 \
+	    file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch;patch=1 \
 	   "
 #recent versions uclibc require real kernel headers
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -29,5 +31,3 @@ KERNEL_SOURCE = "${STAGING_DIR_HOST}/${exec_prefix}"
 SRC_URI += "http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2"
 
 S = "${WORKDIR}/uClibc-${UCLIBC_BASE}"
-
-LEAD_SONAME = "libc.so"
diff --git a/recipes/uclibc/uclibc_0.9.30.bb b/recipes/uclibc/uclibc_0.9.30.bb
index b3e3c15..bbe809f 100644
--- a/recipes/uclibc/uclibc_0.9.30.bb
+++ b/recipes/uclibc/uclibc_0.9.30.bb
@@ -7,7 +7,7 @@
 # on whether the base patches apply to the selected (SRCDATE) svn release.
 #
 UCLIBC_BASE ?= "0.9.30"
-PR = "r5"
+PR = "r6"
 DEFAULT_PREFERENCE = "1"
 
 require uclibc.inc
@@ -18,6 +18,8 @@ SRC_URI += "file://uClibc.machine file://uClibc.distro \
             file://arm-linuxthreads.patch;patch=1 \
             file://linuxthreads-changes.patch;patch=1 \
 	    file://pthread_atfork.patch;patch=1 \
+	    file://uclibc_ldso_use_O0.patch;patch=1 \
+	    file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch;patch=1 \
 	   "
 #recent versions uclibc require real kernel headers
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -29,5 +31,3 @@ KERNEL_SOURCE = "${STAGING_DIR_HOST}/${exec_prefix}"
 SRC_URI += "http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2"
 
 S = "${WORKDIR}/uClibc-${UCLIBC_BASE}"
-
-LEAD_SONAME = "libc.so"
diff --git a/recipes/uclibc/uclibc_nptl.bb b/recipes/uclibc/uclibc_nptl.bb
index a43a3df..7b3ef15 100644
--- a/recipes/uclibc/uclibc_nptl.bb
+++ b/recipes/uclibc/uclibc_nptl.bb
@@ -29,7 +29,8 @@ SRC_URI += "svn://uclibc.org/branches/;module=uClibc-nptl;rev=${SRCREV} \
             file://uClibc.machine \
             file://uClibc.distro \
             file://uclibc-arm-ftruncate64.patch;patch=1 \
-            file://arm_fix_alignment.patch;patch=1 \
+            file://uclibc_ldso_use_O0.patch;patch=1 \
+	    file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch;patch=1 \
             "
 
 S = "${WORKDIR}/uClibc-nptl"
diff --git a/recipes/uclibc/uclibc_svn.bb b/recipes/uclibc/uclibc_svn.bb
index 893c97d..654cb6e 100644
--- a/recipes/uclibc/uclibc_svn.bb
+++ b/recipes/uclibc/uclibc_svn.bb
@@ -29,9 +29,8 @@ SRC_URI += "svn://uclibc.org/trunk;module=uClibc \
 	file://uClibc.machine \
 	file://uClibc.distro \
 	file://uclibc-arm-ftruncate64.patch;patch=1 \
-	file://arm_fix_alignment.patch;patch=1 \
-	file://arm-linuxthreads.patch;patch=1 \
-	file://linuxthreads-changes.patch;patch=1 \
 	file://uclibc_enable_log2_test.patch;patch=1 \
+	file://uclibc_ldso_use_O0.patch;patch=1 \
+	file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch;patch=1 \
 	"
 S = "${WORKDIR}/uClibc"
-- 
1.5.4.3



