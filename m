Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <iwamatsu@nigauri.org>) id 1OvQAg-0003NO-2z
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 09:43:20 +0200
Received: by pzk37 with SMTP id 37so1996047pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Sep 2010 00:42:26 -0700 (PDT)
Received: by 10.142.12.4 with SMTP id 4mr317816wfl.14.1284450146214; Tue, 14
	Sep 2010 00:42:26 -0700 (PDT)
MIME-Version: 1.0
Sender: iwamatsu@nigauri.org
Received: by 10.142.188.10 with HTTP; Tue, 14 Sep 2010 00:42:05 -0700 (PDT)
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Date: Tue, 14 Sep 2010 16:42:05 +0900
X-Google-Sender-Auth: OZiWFP8cnYYbEHVSY8bptzKcRhY
Message-ID: <AANLkTima-2dyRZXqV-mzaeUM0wgk7ptnEjXjO0VPSZnk@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: iwamatsu@nigauri.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sh: provide patch of __set_fpscr prototype
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
X-List-Received-Date: Tue, 14 Sep 2010 07:43:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

When we compile a program that used _FPU_SETCW in sh4 in C++,
become the error.
his provides a patch revising this problem.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
---
 recipes/eglibc/eglibc_2.10.bb                 |    1 +
 recipes/eglibc/eglibc_2.11.bb                 |    1 +
 recipes/eglibc/eglibc_2.12.bb                 |    1 +
 recipes/eglibc/eglibc_2.9.bb                  |    5 ++-
 recipes/eglibc/files/sh4_set_fpscr.patch      |   23 +++++++++++++++++++
 recipes/eglibc/files/sh4_set_fpscr_2.12.patch |   29 +++++++++++++++++++++++++
 6 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 recipes/eglibc/files/sh4_set_fpscr.patch
 create mode 100644 recipes/eglibc/files/sh4_set_fpscr_2.12.patch

diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.bb
index c2ed435..1f7ec02 100644
--- a/recipes/eglibc/eglibc_2.10.bb
+++ b/recipes/eglibc/eglibc_2.10.bb
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
index 5d9b8e2..c65bf22 100644
--- a/recipes/eglibc/eglibc_2.11.bb
+++ b/recipes/eglibc/eglibc_2.11.bb
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
index c6b0131..8dbcde0 100644
--- a/recipes/eglibc/eglibc_2.12.bb
+++ b/recipes/eglibc/eglibc_2.12.bb
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
index a7d9aed..5df7eb8 100644
--- a/recipes/eglibc/eglibc_2.9.bb
+++ b/recipes/eglibc/eglibc_2.9.bb
@@ -9,9 +9,10 @@ SRCREV="10153"
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


