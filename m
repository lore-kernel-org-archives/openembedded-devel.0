Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id C3A4377DBE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 21:09:56 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u36so14067742pgn.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 14:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+kDiu7orUdNxlALC8zd5jThbhMVAr+MFFr/qesIKNEw=;
	b=I8b+sjF5WwZxyVGFtaWwTpR/iYzaVElKa7XB+JdaqgM8Z/rBaRrrSBGoL14dUfz6y+
	nFdnvvjPoNap00HTWvpxP4klG9W9nhAaI2d1DrTOyR9legNeMtXcPyvfvjL/Lsn0M+L0
	tb27wVeEd1tsMFx0tV8piHM9w3hokC2Zgv3/A6ecSCQXGVYkVjcrZ9xD+31LI73JsbN8
	kcM+gSe3KYnYKNMciyIDJRM/PZO2anV97ctgc4DqC88Unl7G0rysUWiQxQURSscPCgJu
	62s52em0Ga+5pRK1C7qUCeYXYaZqKsXwvozd0+R9XKIE2nyfmNte5sgNiLxod0NFRcb4
	7zCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+kDiu7orUdNxlALC8zd5jThbhMVAr+MFFr/qesIKNEw=;
	b=Tie+IQrueEZZyRi87RHy54I1z3sY88Vz9+Txv1+62+JTNl1aEuzMPgwDR4uTUUxlW1
	M/YiMtg+DrFt+mYf7aH0ybQRGJbhhaJZi3R634y+Xk6PVgCgSALYAY2ovz/b0emqqgVk
	UglUYZz4b+6ZD5CSRBMqwp7cDfEgmk+TH5JQKOad6zlD5cFYQzV3cXESkeM2InUfxmWU
	f9Kvl0fRJHOz79QByVnCvsjOjMzIKLscRY5geXNtgqCALvobl64JxBofuNirjKkjJHLP
	kmPQxpO8FFdB5grgokxuWSR8ieGhLq6SHDGcRYfxedd1JY3oCMvSiGnGd/DrWi+6FKj/
	rJtQ==
X-Gm-Message-State: AIVw112HiT5xVd0FvsbJzZeSnVLeCb0aKDXSV3wPSNHud5gFARXDToCi
	vCu1qNS8/G3FExEs
X-Received: by 10.99.44.8 with SMTP id s8mr16881255pgs.84.1499720997021;
	Mon, 10 Jul 2017 14:09:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z82sm29136904pfk.1.2017.07.10.14.09.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 14:09:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jul 2017 14:09:45 -0700
Message-Id: <20170710210947.24353-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-browser][PATCH 1/3] firefox: Fix build with x86_64/musl
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
X-List-Received-Date: Mon, 10 Jul 2017 21:09:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0005-original-patch-fix_off64_t.patch.patch    | 63 +++++++++++++++
 .../0006-original-patch-getcontext.patch.patch     | 30 ++++++++
 .../0007-original-patch-basename.patch.patch       | 51 ++++++++++++
 ...original-patch-musl-missing-headers.patch.patch | 32 ++++++++
 .../firefox/0009-original-patch-stab.h.patch.patch | 90 ++++++++++++++++++++++
 .../firefox/firefox/0010-Define-N_UNDF.patch       | 31 ++++++++
 ...-libav-with-sysctl-on-Unix-it-s-not-used-.patch | 30 ++++++++
 ...alls-siginfo_t-member-__si_fields-instead.patch | 30 ++++++++
 recipes-mozilla/firefox/firefox_45.9.0esr.bb       |  8 ++
 9 files changed, 365 insertions(+)
 create mode 100644 recipes-mozilla/firefox/firefox/0005-original-patch-fix_off64_t.patch.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0006-original-patch-getcontext.patch.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0007-original-patch-basename.patch.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0008-original-patch-musl-missing-headers.patch.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0009-original-patch-stab.h.patch.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0010-Define-N_UNDF.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0011-Don-t-build-libav-with-sysctl-on-Unix-it-s-not-used-.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0012-musl-libc-calls-siginfo_t-member-__si_fields-instead.patch

diff --git a/recipes-mozilla/firefox/firefox/0005-original-patch-fix_off64_t.patch.patch b/recipes-mozilla/firefox/firefox/0005-original-patch-fix_off64_t.patch.patch
new file mode 100644
index 0000000..ea6ff87
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/0005-original-patch-fix_off64_t.patch.patch
@@ -0,0 +1,63 @@
+From b1a3d3332e74b5a1bcf2a4fb7e08f3dece08318c Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Sat, 8 Jul 2017 15:57:20 -0700
+Subject: [PATCH 05/12] %% original patch: fix_off64_t.patch
+
+---
+ toolkit/crashreporter/google-breakpad/src/common/moz.build           | 5 +++--
+ .../google-breakpad/src/third_party/lss/linux_syscall_support.h      | 2 +-
+ tools/profiler/core/platform.h                                       | 2 +-
+ 3 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/toolkit/crashreporter/google-breakpad/src/common/moz.build b/toolkit/crashreporter/google-breakpad/src/common/moz.build
+index 6456e2864..9aec5afd3 100644
+--- a/toolkit/crashreporter/google-breakpad/src/common/moz.build
++++ b/toolkit/crashreporter/google-breakpad/src/common/moz.build
+@@ -35,8 +35,8 @@ if CONFIG['OS_ARCH'] == 'Linux':
+         'linux/dump_symbols.cc',
+         'linux/elf_symbols_to_module.cc',
+     ]
+-    HOST_DEFINES['HAVE_A_OUT_H'] = True
+-    DEFINES['HAVE_A_OUT_H'] = True
++    HOST_DEFINES['HAVE_A_OUT_H'] = False
++    DEFINES['HAVE_A_OUT_H'] = False
+ 
+ if CONFIG['OS_ARCH'] == 'Darwin' and CONFIG['HOST_OS_ARCH'] != 'Darwin':
+     HOST_CXXFLAGS += [
+@@ -98,6 +98,7 @@ if CONFIG['MOZ_WIDGET_TOOLKIT'] == 'gonk':
+ 
+ if CONFIG['OS_TARGET'] == 'Android':
+     DEFINES['NO_STABS_SUPPORT'] = True
++DEFINES['NO_STABS_SUPPORT'] = True
+ 
+ DEFINES['BP_LOGGING_INCLUDE'] = '"BreakpadLogging.h"'
+ 
+diff --git a/toolkit/crashreporter/google-breakpad/src/third_party/lss/linux_syscall_support.h b/toolkit/crashreporter/google-breakpad/src/third_party/lss/linux_syscall_support.h
+index 18277490f..b67d3a92d 100644
+--- a/toolkit/crashreporter/google-breakpad/src/third_party/lss/linux_syscall_support.h
++++ b/toolkit/crashreporter/google-breakpad/src/third_party/lss/linux_syscall_support.h
+@@ -2814,7 +2814,7 @@ struct kernel_statfs {
+     LSS_INLINE _syscall6(void*, mmap,              void*, s,
+                          size_t,                   l, int,               p,
+                          int,                      f, int,               d,
+-                         __off64_t,                o)
++                         off64_t,                o)
+ 
+     LSS_INLINE _syscall4(int, newfstatat,         int,   d,
+                          const char *,            p,
+diff --git a/tools/profiler/core/platform.h b/tools/profiler/core/platform.h
+index 5d2e25c8e..4917e5b8e 100644
+--- a/tools/profiler/core/platform.h
++++ b/tools/profiler/core/platform.h
+@@ -61,7 +61,7 @@
+ 
+ // We need a definition of gettid(), but glibc doesn't provide a
+ // wrapper for it.
+-#if defined(__GLIBC__)
++#if defined(__linux__)
+ #include <unistd.h>
+ #include <sys/syscall.h>
+ static inline pid_t gettid()
+-- 
+2.13.2
+
diff --git a/recipes-mozilla/firefox/firefox/0006-original-patch-getcontext.patch.patch b/recipes-mozilla/firefox/firefox/0006-original-patch-getcontext.patch.patch
new file mode 100644
index 0000000..c8b101e
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/0006-original-patch-getcontext.patch.patch
@@ -0,0 +1,30 @@
+From ba081ed6eb612d72e0d9deb5cf40aa6f8ff5380a Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Sat, 8 Jul 2017 15:57:22 -0700
+Subject: [PATCH 06/12] %% original patch: getcontext.patch
+
+---
+ tools/profiler/core/platform-linux.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/profiler/core/platform-linux.cc b/tools/profiler/core/platform-linux.cc
+index 0df1e8f08..d8688959d 100644
+--- a/tools/profiler/core/platform-linux.cc
++++ b/tools/profiler/core/platform-linux.cc
+@@ -711,11 +711,13 @@ void OS::Startup() {
+ void TickSample::PopulateContext(void* aContext)
+ {
+   MOZ_ASSERT(aContext);
++#if defined(__GLIBC__)
+   ucontext_t* pContext = reinterpret_cast<ucontext_t*>(aContext);
+   if (!getcontext(pContext)) {
+     context = pContext;
+     SetSampleContext(this, aContext);
+   }
++#endif
+ }
+ 
+ void OS::SleepMicro(int microseconds)
+-- 
+2.13.2
+
diff --git a/recipes-mozilla/firefox/firefox/0007-original-patch-basename.patch.patch b/recipes-mozilla/firefox/firefox/0007-original-patch-basename.patch.patch
new file mode 100644
index 0000000..7b50fa3
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/0007-original-patch-basename.patch.patch
@@ -0,0 +1,51 @@
+From 66661ee35dabc01ee712c2ad23f93f999c61787d Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Sat, 8 Jul 2017 15:57:25 -0700
+Subject: [PATCH 07/12] %% original patch: basename.patch
+
+---
+ .../google-breakpad/src/common/linux/dump_symbols.cc              | 8 ++++----
+ tools/profiler/lul/LulElf.cpp                                     | 8 ++++----
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/toolkit/crashreporter/google-breakpad/src/common/linux/dump_symbols.cc b/toolkit/crashreporter/google-breakpad/src/common/linux/dump_symbols.cc
+index 8e379a7ec..3eecc78cf 100644
+--- a/toolkit/crashreporter/google-breakpad/src/common/linux/dump_symbols.cc
++++ b/toolkit/crashreporter/google-breakpad/src/common/linux/dump_symbols.cc
+@@ -828,10 +828,10 @@ string FormatIdentifier(unsigned char identifier[16]) {
+ // Return the non-directory portion of FILENAME: the portion after the
+ // last slash, or the whole filename if there are no slashes.
+ string BaseFileName(const string &filename) {
+-  // Lots of copies!  basename's behavior is less than ideal.
+-  char *c_filename = strdup(filename.c_str());
+-  string base = basename(c_filename);
+-  free(c_filename);
++  // basename's behavior is less than ideal so avoid it
++  const char *c_filename = filename.c_str();
++  const char *p = strrchr(c_filename, '/');
++  string base = p ? p+1 : c_filename;
+   return base;
+ }
+ 
+diff --git a/tools/profiler/lul/LulElf.cpp b/tools/profiler/lul/LulElf.cpp
+index a9221370d..d01dde10e 100644
+--- a/tools/profiler/lul/LulElf.cpp
++++ b/tools/profiler/lul/LulElf.cpp
+@@ -483,10 +483,10 @@ string FormatIdentifier(unsigned char identifier[16]) {
+ // Return the non-directory portion of FILENAME: the portion after the
+ // last slash, or the whole filename if there are no slashes.
+ string BaseFileName(const string &filename) {
+-  // Lots of copies!  basename's behavior is less than ideal.
+-  char *c_filename = strdup(filename.c_str());
+-  string base = basename(c_filename);
+-  free(c_filename);
++  // basename's behavior is less than ideal so avoid it
++  const char *c_filename = filename.c_str();
++  const char *p = strrchr(c_filename, '/');
++  string base = p ? p+1 : c_filename;
+   return base;
+ }
+ 
+-- 
+2.13.2
+
diff --git a/recipes-mozilla/firefox/firefox/0008-original-patch-musl-missing-headers.patch.patch b/recipes-mozilla/firefox/firefox/0008-original-patch-musl-missing-headers.patch.patch
new file mode 100644
index 0000000..8198863
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/0008-original-patch-musl-missing-headers.patch.patch
@@ -0,0 +1,32 @@
+From 68aa10845658bd4493e35e37d636002f87b57486 Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Sat, 8 Jul 2017 15:57:27 -0700
+Subject: [PATCH 08/12] %% original patch: musl-missing-headers.patch
+
+---
+ config/system-headers | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/config/system-headers b/config/system-headers
+index 403fa8d95..0fc063530 100644
+--- a/config/system-headers
++++ b/config/system-headers
+@@ -420,7 +420,6 @@ execinfo.h
+ extras.h
+ fabdef.h
+ fcntl.h
+-features.h
+ fibdef.h
+ File.h
+ filehdr.h
+@@ -1065,7 +1064,6 @@ sys/statfs.h
+ sys/stat.h
+ sys/statvfs.h
+ sys/syscall.h
+-sys/sysctl.h
+ sys/sysinfo.h
+ sys/sysmp.h
+ sys/syssgi.h
+-- 
+2.13.2
+
diff --git a/recipes-mozilla/firefox/firefox/0009-original-patch-stab.h.patch.patch b/recipes-mozilla/firefox/firefox/0009-original-patch-stab.h.patch.patch
new file mode 100644
index 0000000..b21cedc
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/0009-original-patch-stab.h.patch.patch
@@ -0,0 +1,90 @@
+From ce9582578067a34d419e4e3bb615c7485f98ca8e Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Sat, 8 Jul 2017 15:57:30 -0700
+Subject: [PATCH 09/12] %% original patch: stab.h.patch
+
+---
+ toolkit/crashreporter/google-breakpad/src/stab.h | 71 ++++++++++++++++++++++++
+ 1 file changed, 71 insertions(+)
+ create mode 100644 toolkit/crashreporter/google-breakpad/src/stab.h
+
+diff --git a/toolkit/crashreporter/google-breakpad/src/stab.h b/toolkit/crashreporter/google-breakpad/src/stab.h
+new file mode 100644
+index 000000000..6f70af398
+--- /dev/null
++++ b/toolkit/crashreporter/google-breakpad/src/stab.h
+@@ -0,0 +1,71 @@
++/*	$OpenBSD: stab.h,v 1.3 2003/06/02 19:34:12 millert Exp $	*/
++/*	$NetBSD: stab.h,v 1.4 1994/10/26 00:56:25 cgd Exp $	*/
++
++/*-
++ * Copyright (c) 1991 The Regents of the University of California.
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ * 3. Neither the name of the University nor the names of its contributors
++ *    may be used to endorse or promote products derived from this software
++ *    without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
++ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
++ * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
++ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
++ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
++ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
++ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
++ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
++ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
++ * SUCH DAMAGE.
++ *
++ *	@(#)stab.h	5.2 (Berkeley) 4/4/91
++ */
++
++#ifndef _STAB_H_
++#define _STAB_H_
++
++/*
++ * The following are symbols used by various debuggers and by the Pascal
++ * compiler.  Each of them must have one (or more) of the bits defined by
++ * the N_STAB mask set.
++ */
++
++#define	N_GSYM		0x20	/* global symbol */
++#define	N_FNAME		0x22	/* F77 function name */
++#define	N_FUN		0x24	/* procedure name */
++#define	N_STSYM		0x26	/* data segment variable */
++#define	N_LCSYM		0x28	/* bss segment variable */
++#define	N_MAIN		0x2a	/* main function name */
++#define	N_PC		0x30	/* global Pascal symbol */
++#define	N_RSYM		0x40	/* register variable */
++#define	N_SLINE		0x44	/* text segment line number */
++#define	N_DSLINE	0x46	/* data segment line number */
++#define	N_BSLINE	0x48	/* bss segment line number */
++#define	N_SSYM		0x60	/* structure/union element */
++#define	N_SO		0x64	/* main source file name */
++#define	N_LSYM		0x80	/* stack variable */
++#define	N_BINCL		0x82	/* include file beginning */
++#define	N_SOL		0x84	/* included source file name */
++#define	N_PSYM		0xa0	/* parameter variable */
++#define	N_EINCL		0xa2	/* include file end */
++#define	N_ENTRY		0xa4	/* alternate entry point */
++#define	N_LBRAC		0xc0	/* left bracket */
++#define	N_EXCL		0xc2	/* deleted include file */
++#define	N_RBRAC		0xe0	/* right bracket */
++#define	N_BCOMM		0xe2	/* begin common */
++#define	N_ECOMM		0xe4	/* end common */
++#define	N_ECOML		0xe8	/* end common (local name) */
++#define	N_LENG		0xfe	/* length of preceding entry */
++
++#endif /* !_STAB_H_ */
+-- 
+2.13.2
+
diff --git a/recipes-mozilla/firefox/firefox/0010-Define-N_UNDF.patch b/recipes-mozilla/firefox/firefox/0010-Define-N_UNDF.patch
new file mode 100644
index 0000000..7baae8f
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/0010-Define-N_UNDF.patch
@@ -0,0 +1,31 @@
+From 86544a22d8f241b3ba2545f470831edc019c6638 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Jul 2017 16:08:43 -0700
+Subject: [PATCH 10/12] Define N_UNDF
+
+Fixes
+error: 'N_UNDF' was not declared in this scope
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ toolkit/crashreporter/google-breakpad/src/stab.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/toolkit/crashreporter/google-breakpad/src/stab.h b/toolkit/crashreporter/google-breakpad/src/stab.h
+index 6f70af398..8fb2ffc97 100644
+--- a/toolkit/crashreporter/google-breakpad/src/stab.h
++++ b/toolkit/crashreporter/google-breakpad/src/stab.h
+@@ -41,6 +41,10 @@
+  * the N_STAB mask set.
+  */
+ 
++#if !defined (N_UNDF)
++#define N_UNDF 0
++#endif
++
+ #define	N_GSYM		0x20	/* global symbol */
+ #define	N_FNAME		0x22	/* F77 function name */
+ #define	N_FUN		0x24	/* procedure name */
+-- 
+2.13.2
+
diff --git a/recipes-mozilla/firefox/firefox/0011-Don-t-build-libav-with-sysctl-on-Unix-it-s-not-used-.patch b/recipes-mozilla/firefox/firefox/0011-Don-t-build-libav-with-sysctl-on-Unix-it-s-not-used-.patch
new file mode 100644
index 0000000..4afb804
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/0011-Don-t-build-libav-with-sysctl-on-Unix-it-s-not-used-.patch
@@ -0,0 +1,30 @@
+From b31468e975212556f1d8c7d5d2cf8f3313496803 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Jul 2017 16:27:06 -0700
+Subject: [PATCH 11/12] Don't build libav with sysctl on Unix (it's not used
+ anyway)
+
+backported from
+https://hg.mozilla.org/integration/mozilla-inbound/rev/081c52bae5e7
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ media/libav/config_unix.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/media/libav/config_unix.h b/media/libav/config_unix.h
+index 3921293a0..b3c44d62b 100644
+--- a/media/libav/config_unix.h
++++ b/media/libav/config_unix.h
+@@ -219,7 +219,7 @@
+ #define HAVE_STRERROR_R 1
+ #define HAVE_STRPTIME 1
+ #define HAVE_SYSCONF 1
+-#define HAVE_SYSCTL 1
++#define HAVE_SYSCTL 0
+ #define HAVE_USLEEP 1
+ #define HAVE_VIRTUALALLOC 0
+ #define HAVE_PTHREADS 0
+-- 
+2.13.2
+
diff --git a/recipes-mozilla/firefox/firefox/0012-musl-libc-calls-siginfo_t-member-__si_fields-instead.patch b/recipes-mozilla/firefox/firefox/0012-musl-libc-calls-siginfo_t-member-__si_fields-instead.patch
new file mode 100644
index 0000000..9b9af86
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/0012-musl-libc-calls-siginfo_t-member-__si_fields-instead.patch
@@ -0,0 +1,30 @@
+From 92e6fdcc84c69ae25e9d4ed9e1e9c3203afeeaea Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Jul 2017 16:37:03 -0700
+Subject: [PATCH 12/12] musl libc calls siginfo_t member __si_fields instead of
+ _sifields
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ security/sandbox/chromium/sandbox/linux/seccomp-bpf/trap.cc | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/security/sandbox/chromium/sandbox/linux/seccomp-bpf/trap.cc b/security/sandbox/chromium/sandbox/linux/seccomp-bpf/trap.cc
+index dce6b7b85..5b2e2cc02 100644
+--- a/security/sandbox/chromium/sandbox/linux/seccomp-bpf/trap.cc
++++ b/security/sandbox/chromium/sandbox/linux/seccomp-bpf/trap.cc
+@@ -23,6 +23,11 @@
+ #include "sandbox/linux/services/android_ucontext.h"
+ #endif
+ 
++// musl libc defines siginfo_t __si_fields instead of _sifields
++#if defined(OS_LINUX) && !defined(__GLIBC__)
++#define _sifields __si_fields
++#endif
++
+ namespace {
+ 
+ struct arch_sigsys {
+-- 
+2.13.2
+
diff --git a/recipes-mozilla/firefox/firefox_45.9.0esr.bb b/recipes-mozilla/firefox/firefox_45.9.0esr.bb
index 5087df0..55b2f3c 100644
--- a/recipes-mozilla/firefox/firefox_45.9.0esr.bb
+++ b/recipes-mozilla/firefox/firefox_45.9.0esr.bb
@@ -50,6 +50,14 @@ SRC_URI_append_libc-musl = "\
            file://0002-disable-hunspell-hooks.patch \
            file://0003-define-TEMP_FAILURE_RETRY.patch \
            file://0004-Fix-mozilla-arm-builds.patch \
+           file://0005-original-patch-fix_off64_t.patch.patch \
+           file://0006-original-patch-getcontext.patch.patch \
+           file://0007-original-patch-basename.patch.patch \
+           file://0008-original-patch-musl-missing-headers.patch.patch \
+           file://0009-original-patch-stab.h.patch.patch \
+           file://0010-Define-N_UNDF.patch \
+           file://0011-Don-t-build-libav-with-sysctl-on-Unix-it-s-not-used-.patch \
+           file://0012-musl-libc-calls-siginfo_t-member-__si_fields-instead.patch \
 "
 
 SRC_URI[archive.md5sum] = "f4d83c5150fc5085db20d71862497eb8"
-- 
2.13.2


