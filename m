Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 066BF7808D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:47 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id q85so1026161pfq.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o41Unc1g7ve7vJe5xPuV1iuujzTFdjvHEuBkwUMmxQc=;
	b=qboxhTtC7bKJHRmopn1oyaTpbjl9QjxcuBEVuCQrkeTCiSymlK7F74hNy1tTcKkbnz
	Uo50EfNrv4VX81DtKgPBqvlhs4msU30FddvOtsueZIbhn1Ls9khATrg28Lqw8MbZpxJd
	5rgwawgsG0Wv8/RTqo6nYsRRDJXlWpvIA6qBkk1vDbKwLirQU1RM9yQrs1DgX+Bw+OwA
	JvEkq7N8ueHLDxDlUZIlZy4e7dQfd6dIDGRJcvsAtUDWvD8g8k5Qzb4z7JXvcVgcEAiT
	4V8hY4s6RCPYTvKTtHIYWb3tcxtXkwedlldeh+h9DDdRp7xkIR61/xq8lciX6sdtz0Eh
	0ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=o41Unc1g7ve7vJe5xPuV1iuujzTFdjvHEuBkwUMmxQc=;
	b=ohuAbfr2I+zm8feeJSd9150wtfuzIYaOLPGei+HcOy3hNg97LpIkPbhNLsYamJ+tMY
	3I3UIIwuodOZLwbHLv/EWG6a538f7ypPr54MX0I1Q9LzPiM5dhs7i4u4xGX6ZwUysoXJ
	a1NpJIRD+BBVZTXlD9behg6qFTtWlMVPsBhqju5va5N50KhnjeeipKjR41AY1riiRrDV
	/YfMNXa8tJ8YnXsOW6KONhEaUe5HuA1bCzQa6Bj6a4q7nKbycxUVImZK5PQrDgkch6ry
	qH+/U2ei/MR7zPDRIYMGWD/cR72mUN8QaAdTFGGZIGOsb82xZsFdZ65V4/9OMdb4q0qG
	9y/g==
X-Gm-Message-State: AIVw113FKaCHN10NnAMkv716n+9XBLL8u20ZxZxvE4v9ABGSGN43Qatx
	3kWh/n7SuZq2JrDf
X-Received: by 10.84.197.3 with SMTP id m3mr834552pld.47.1500347448227;
	Mon, 17 Jul 2017 20:10:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:10:13 -0700
Message-Id: <20170718031013.44536-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170718031013.44536-1-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 17/17] gperftools: Upgrade to 2.6.1
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:47 -0000

Fix build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-build-failure-for-ppc.patch           | 28 ----------
 .../gperftools/0001-fix-build-with-musl-libc.patch | 61 ++++++++++++++++++++++
 ...001-include-fcntl.h-for-loff_t-definition.patch | 28 ++++++++++
 .../{gperftools_2.5.bb => gperftools_2.6.1.bb}     | 13 ++---
 4 files changed, 96 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-Fix-build-failure-for-ppc.patch
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch
 rename meta-oe/recipes-support/gperftools/{gperftools_2.5.bb => gperftools_2.6.1.bb} (67%)

diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-Fix-build-failure-for-ppc.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-Fix-build-failure-for-ppc.patch
deleted file mode 100644
index 27f855d1e..000000000
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-Fix-build-failure-for-ppc.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Subject: Fix build failure for ppc
-
-Upstream-Status: Pending
-
-Fix the following build failure.
-
-  error: 'siginfo_t' does not name a type
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/stacktrace_powerpc-linux-inl.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/stacktrace_powerpc-linux-inl.h b/src/stacktrace_powerpc-linux-inl.h
-index 5d16fa1..a9bf775 100644
---- a/src/stacktrace_powerpc-linux-inl.h
-+++ b/src/stacktrace_powerpc-linux-inl.h
-@@ -44,6 +44,7 @@
- 
- #include <stdint.h>   // for uintptr_t
- #include <stdlib.h>   // for NULL
-+#include <signal.h>   // for siginfo_t
- #include <gperftools/stacktrace.h>
- #include <base/vdso_support.h>
- 
--- 
-2.8.3
-
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
new file mode 100644
index 000000000..78621c7fe
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
@@ -0,0 +1,61 @@
+From 157914941bd38f1a38bb6bd7294ca6c2bc1b8dcb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Jul 2017 15:51:28 -0700
+Subject: [PATCH] fix build with musl libc
+
+Patch from https://github.com/gperftools/gperftools/pull/765/
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                 | 1 +
+ src/malloc_hook_mmap_linux.h | 8 ++++++--
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b42fea3..70b49a3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -188,6 +188,7 @@ AC_HEADER_STDC
+ AC_CHECK_TYPES([__int64])       # defined in some windows platforms
+ AC_CHECK_TYPES([struct mallinfo],,, [#include <malloc.h>])
+ AC_CHECK_TYPES([Elf32_Versym],,, [#include <elf.h>])   # for vdso_support.h
++AC_CHECK_FUNCS(__sbrk)          # for intercepting glibc memory allocator
+ AC_CHECK_FUNCS(sbrk)            # for tcmalloc to get memory
+ AC_CHECK_FUNCS(geteuid)         # for turning off services when run as root
+ AC_CHECK_FUNCS(fork)            # for the pthread_atfork setup
+diff --git a/src/malloc_hook_mmap_linux.h b/src/malloc_hook_mmap_linux.h
+index 79ac4e3..d444635 100755
+--- a/src/malloc_hook_mmap_linux.h
++++ b/src/malloc_hook_mmap_linux.h
+@@ -46,6 +46,10 @@
+ #include <errno.h>
+ #include "base/linux_syscall_support.h"
+ 
++#ifndef __GLIBC__
++typedef off64_t   __off64_t;
++#endif
++
+ // The x86-32 case and the x86-64 case differ:
+ // 32b has a mmap2() syscall, 64b does not.
+ // 64b and 32b have different calling conventions for mmap().
+@@ -168,7 +172,7 @@ extern "C" void* mmap64(void *start, size_t length, int prot, int flags,
+   return result;
+ }
+ 
+-# if !defined(__USE_FILE_OFFSET64) || !defined(__REDIRECT_NTH)
++# if defined(__GLIBC__) && (!defined(__USE_FILE_OFFSET64) || !defined(__REDIRECT_NTH))
+ 
+ extern "C" void* mmap(void *start, size_t length, int prot, int flags,
+                       int fd, off_t offset) __THROW {
+@@ -206,7 +210,7 @@ extern "C" void* mremap(void* old_addr, size_t old_size, size_t new_size,
+   return result;
+ }
+ 
+-#ifndef __UCLIBC__
++#if HAVE___SBRK
+ // libc's version:
+ extern "C" void* __sbrk(ptrdiff_t increment);
+ 
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch
new file mode 100644
index 000000000..667008a5b
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch
@@ -0,0 +1,28 @@
+From 04ea8e001501931f4dbf20288aca78469617b08a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Jul 2017 19:28:17 -0700
+Subject: [PATCH] include fcntl.h for loff_t definition
+
+Fixes
+linux_syscall_support.h:2641:26: error: 'loff_t' has not been declared
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/base/linux_syscall_support.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/base/linux_syscall_support.h b/src/base/linux_syscall_support.h
+index 85347a2..70431ca 100644
+--- a/src/base/linux_syscall_support.h
++++ b/src/base/linux_syscall_support.h
+@@ -162,6 +162,7 @@ extern "C" {
+ #include <unistd.h>
+ #include <linux/unistd.h>
+ #include <endian.h>
++#include <fcntl.h>
+ 
+ #ifdef __mips__
+ /* Include definitions of the ABI currently in use.                          */
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
similarity index 67%
rename from meta-oe/recipes-support/gperftools/gperftools_2.5.bb
rename to meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
index 43780a5ee..946463805 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
@@ -2,19 +2,20 @@ SUMMARY = "Fast, multi-threaded malloc() and nifty performance analysis tools"
 HOMEPAGE = "http://code.google.com/p/gperftools/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
-DEPENDS = "libunwind"
+DEPENDS += "libunwind"
 
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/gperftools/gperftools-2.5.tar.gz/aa1eaf95dbe2c9828d0bd3a00f770f50/gperftools-2.5.tar.gz \
+SRCREV = "bf840dec0495e17f5c8403e68e10b9d6bf05c559"
+SRC_URI = "git://github.com/gperftools/gperftools \
            file://0001-Support-Atomic-ops-on-clang.patch \
-           file://0001-Fix-build-failure-for-ppc.patch \
            file://0001-Use-ucontext_t-instead-of-struct-ucontext.patch \
+           file://0001-fix-build-with-musl-libc.patch \
+           file://0001-include-fcntl.h-for-loff_t-definition.patch \
            "
 
-SRC_URI[md5sum] = "aa1eaf95dbe2c9828d0bd3a00f770f50"
-SRC_URI[sha256sum] = "6fa2748f1acdf44d750253e160cf6e2e72571329b42e563b455bde09e9e85173"
-
 inherit autotools
 
+S = "${WORKDIR}/git"
+
 # On mips, we have the following error.
 #   do_page_fault(): sending SIGSEGV to ls for invalid read access from 00000008
 #   Segmentation fault (core dumped)
-- 
2.13.3


