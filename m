Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <iwamatsu@nigauri.org>) id 1Ow2sR-0004ZN-Gd
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 03:03:18 +0200
Received: by pzk37 with SMTP id 37so229009pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 18:02:13 -0700 (PDT)
Received: by 10.142.247.21 with SMTP id u21mr2104831wfh.348.1284598933121;
	Wed, 15 Sep 2010 18:02:13 -0700 (PDT)
MIME-Version: 1.0
Sender: iwamatsu@nigauri.org
Received: by 10.142.188.10 with HTTP; Wed, 15 Sep 2010 18:01:53 -0700 (PDT)
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Date: Thu, 16 Sep 2010 10:01:53 +0900
X-Google-Sender-Auth: EdxQndLrn5XfUdqWvFtLF_Peiu8
Message-ID: <AANLkTindv19CnnhD_L80Q+RUoQBUDTu_3YXVvxu0MK4p@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: iwamatsu@nigauri.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2 v2] sh: provide patch of __set_fpscr prototype
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
X-List-Received-Date: Thu, 16 Sep 2010 01:03:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

When we compile a program that used _FPU_SETCW in sh4 in C++,
become the error.
his provides a patch revising this problem.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
---
 recipes/eglibc/eglibc_2.10.bb                 |    3 +-
 recipes/eglibc/eglibc_2.11.bb                 |    3 +-
 recipes/eglibc/eglibc_2.12.bb                 |    3 +-
 recipes/eglibc/eglibc_2.9.bb                  |    7 +++--
 recipes/eglibc/eglibc_svn.bb                  |    5 ++-
 recipes/eglibc/files/sh4_set_fpscr.patch      |   23 +++++++++++++++++++
 recipes/eglibc/files/sh4_set_fpscr_2.12.patch |   29 +++++++++++++++++++++++++
 7 files changed, 65 insertions(+), 8 deletions(-)
 create mode 100644 recipes/eglibc/files/sh4_set_fpscr.patch
 create mode 100644 recipes/eglibc/files/sh4_set_fpscr_2.12.patch

diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.bb
index c10db7d..94835b6 100644
--- a/recipes/eglibc/eglibc_2.10.bb
+++ b/recipes/eglibc/eglibc_2.10.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.10"
-PR = "${INC_PR}.9"
+PR = "${INC_PR}.10"
 PR_append = "+svnr${SRCPV}"
 SRCREV="10152"
 EGLIBC_BRANCH="eglibc-2_10"
@@ -12,6 +12,7 @@ SRC_URI =
"svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://armv4t-interworking.patch \
            file://IO-acquire-lock-fix.patch \
            file://shorten-build-commands.patch \
+           file://sh4_set_fpscr.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/eglibc_2.11.bb b/recipes/eglibc/eglibc_2.11.bb
index bece90f..dafc301 100644
--- a/recipes/eglibc/eglibc_2.11.bb
+++ b/recipes/eglibc/eglibc_2.11.bb
@@ -4,7 +4,7 @@ DEFAULT_PREFERENCE = "-1"
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.11"
-PR = "${INC_PR}.6"
+PR = "${INC_PR}.7"
 PR_append = "+svnr${SRCPV}"
 SRCREV="10690"
 EGLIBC_BRANCH="eglibc-2_11"
@@ -12,6 +12,7 @@ SRC_URI =
"svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://shorten-build-commands.patch \
+           file://sh4_set_fpscr.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.bb
index 0d08c56..e0a0ebe 100644
--- a/recipes/eglibc/eglibc_2.12.bb
+++ b/recipes/eglibc/eglibc_2.12.bb
@@ -4,7 +4,7 @@ DEFAULT_PREFERENCE = "-1"
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.12"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 PR_append = "+svnr${SRCPV}"
 SRCREV="11306"
 EGLIBC_BRANCH="eglibc-2_12"
@@ -12,6 +12,7 @@ SRC_URI =
"svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://shorten-build-commands.patch \
+           file://sh4_set_fpscr_2.12.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
index f83861e..39ee76d 100644
--- a/recipes/eglibc/eglibc_2.9.bb
+++ b/recipes/eglibc/eglibc_2.9.bb
@@ -3,15 +3,16 @@ require eglibc.inc
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.9"
-PR = "${INC_PR}.9"
+PR = "${INC_PR}.10"
 PR_append = "+svnr${SRCPV}"
 SRCREV="10153"
 EGLIBC_BRANCH="eglibc-2_9"
 SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
-	   file://armv4t-interworking.patch \
-	   file://IO-acquire-lock-fix.patch \
+           file://armv4t-interworking.patch \
+           file://IO-acquire-lock-fix.patch \
            file://shorten-build-commands.patch \
+           file://sh4_set_fpscr.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/eglibc_svn.bb b/recipes/eglibc/eglibc_svn.bb
index 3b7fb84..a37c3ed 100644
--- a/recipes/eglibc/eglibc_svn.bb
+++ b/recipes/eglibc/eglibc_svn.bb
@@ -5,11 +5,12 @@ SRCREV = "11461"
 DEFAULT_PREFERENCE = "-1"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.12+svnr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 EGLIBC_BRANCH="trunk"
 SRC_URI = "svn://svn.eglibc.org;module=${EGLIBC_BRANCH} \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
-	   file://IO-acquire-lock-fix.patch \
+           file://IO-acquire-lock-fix.patch \
+           file://sh4_set_fpscr_2.12.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/files/sh4_set_fpscr.patch
b/recipes/eglibc/files/sh4_set_fpscr.patch
new file mode 100644
index 0000000..f3fd5c1
--- /dev/null
+++ b/recipes/eglibc/files/sh4_set_fpscr.patch
@@ -0,0 +1,23 @@
+# http://sourceware.org/ml/libc-alpha/2009-12/msg00009.html
+# http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=565369
+---
+ sysdeps/sh/sh4/fpu/fpu_control.h |    8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+--- a/sysdeps/sh/sh4/fpu/fpu_control.h
++++ b/sysdeps/sh/sh4/fpu/fpu_control.h
+@@ -45,6 +45,14 @@
+ #define _FPU_GETCW(cw) __asm__ ("sts fpscr,%0" : "=r" (cw))
+
+ #if defined __GNUC__
++/* Allow the use in C++ code.  */
++#ifdef __cplusplus
++extern "C" {
++#endif
++extern void __set_fpscr (unsigned long);
++#ifdef __cplusplus
++}
++#endif  /* C++ */
+ #define _FPU_SETCW(cw) __set_fpscr ((cw))
+ #else
+ #define _FPU_SETCW(cw) __asm__ ("lds %0,fpscr" : : "r" (cw))
diff --git a/recipes/eglibc/files/sh4_set_fpscr_2.12.patch
b/recipes/eglibc/files/sh4_set_fpscr_2.12.patch
new file mode 100644
index 0000000..19cccc0
--- /dev/null
+++ b/recipes/eglibc/files/sh4_set_fpscr_2.12.patch
@@ -0,0 +1,29 @@
+diff --git a/sysdeps/sh/sh4/fpu/fpu_control.h
b/sysdeps/sh/sh4/fpu/fpu_control.h
+index d1be46d..3ea37d3 100644
+--- a/sysdeps/sh/sh4/fpu/fpu_control.h
++++ b/sysdeps/sh/sh4/fpu/fpu_control.h
+@@ -1,5 +1,5 @@
+ /* FPU control word definitions.  SH version.
+-   Copyright (C) 1999, 2000, 2009 Free Software Foundation, Inc.
++   Copyright (C) 1999, 2000, 2009, 2010 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -46,7 +46,14 @@ typedef unsigned int fpu_control_t;
+
+ #if defined __GNUC__
+ /* GCC provides this function.  */
++/* Allow the use in C++ code.  */
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern void __set_fpscr (unsigned long);
++#ifdef __cplusplus
++}
++#endif  /* C++ */
+ #define _FPU_SETCW(cw) __set_fpscr ((cw))
+ #else
+ #define _FPU_SETCW(cw) __asm__ ("lds %0,fpscr" : : "r" (cw))
+--
+1.7.1
+
-- 
1.7.1


