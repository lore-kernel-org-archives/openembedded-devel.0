Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BF0A474700
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 09:49:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5R9nqYd027183
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 02:49:52 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 27 Jun 2018 02:49:51 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jun 2018 02:49:15 -0700
Message-ID: <20180627094922.109996-5-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627094922.109996-1-mingli.yu@windriver.com>
References: <20180627094922.109996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 05/13] gperftools: Upgrade to 2.7
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
X-List-Received-Date: Wed, 27 Jun 2018 09:49:50 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Update gperftools to 2.7
* Remove two backported patches:
  0001-Use-ucontext_t-instead-of-struct-ucontext.patch
  0001-include-fcntl.h-for-loff_t-definition.patch
* Rework the patch 0001-fix-build-with-musl-libc.patch

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...context_t-instead-of-struct-ucontext.patch | 34 -------------------
 .../0001-fix-build-with-musl-libc.patch       |  8 ++---
 ...nclude-fcntl.h-for-loff_t-definition.patch | 26 --------------
 ...{gperftools_2.6.1.bb => gperftools_2.7.bb} |  4 +--
 4 files changed, 5 insertions(+), 67 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-Use-ucontext_t-instead-of-struct-ucontext.patch
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch
 rename meta-oe/recipes-support/gperftools/{gperftools_2.6.1.bb => gperftools_2.7.bb} (84%)

diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-Use-ucontext_t-instead-of-struct-ucontext.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-Use-ucontext_t-instead-of-struct-ucontext.patch
deleted file mode 100644
index b3033621b..000000000
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-Use-ucontext_t-instead-of-struct-ucontext.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 230cd84486145c5bb1d69d4c9a544e00adbcc9b5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 1 Jul 2017 13:21:21 -0700
-Subject: [PATCH] Use ucontext_t instead of struct ucontext
-
-Newer glibc has dropped the ucontext tag from exposing
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/stacktrace_powerpc-linux-inl.h | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/stacktrace_powerpc-linux-inl.h b/src/stacktrace_powerpc-linux-inl.h
-index 3b3843b..a301a46 100644
---- a/src/stacktrace_powerpc-linux-inl.h
-+++ b/src/stacktrace_powerpc-linux-inl.h
-@@ -53,7 +53,6 @@
- #elif defined(HAVE_UCONTEXT_H)
- #include <ucontext.h>  // for ucontext_t
- #endif
--typedef ucontext ucontext_t;
- 
- // PowerPC64 Little Endian follows BE wrt. backchain, condition register,
- // and LR save area, so no need to adjust the reading struct.
-@@ -202,7 +201,7 @@ static int GET_STACK_TRACE_OR_FRAMES {
-         struct rt_signal_frame_32 {
-           char dummy[64 + 16];
-           siginfo_t info;
--          struct ucontext uc;
-+          ucontext_t uc;
-           // We don't care about the rest, since IP value is at 'uc' field.A
-         } *sigframe = reinterpret_cast<rt_signal_frame_32*>(current);
-         result[n] = (void*) sigframe->uc.uc_mcontext.uc_regs->gregs[PT_NIP];
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
index 0a72ff27c..49d5c2167 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
@@ -1,4 +1,4 @@
-From 034e7da08c3fbffcba8cf8d4e24a71a16558db5a Mon Sep 17 00:00:00 2001
+From 696674a800cb6d2070897a565b92d7e63022a8f1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 16 Jul 2017 15:51:28 -0700
 Subject: [PATCH] fix build with musl libc
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index b42fea3..70b49a3 100644
+index 497103e..f9efc3e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -188,6 +188,7 @@ AC_HEADER_STDC
@@ -25,7 +25,7 @@ index b42fea3..70b49a3 100644
  AC_CHECK_FUNCS(geteuid)         # for turning off services when run as root
  AC_CHECK_FUNCS(fork)            # for the pthread_atfork setup
 diff --git a/src/malloc_hook_mmap_linux.h b/src/malloc_hook_mmap_linux.h
-index 79ac4e3..d444635 100755
+index 2f6116f..0605855 100755
 --- a/src/malloc_hook_mmap_linux.h
 +++ b/src/malloc_hook_mmap_linux.h
 @@ -46,6 +46,10 @@
@@ -55,5 +55,5 @@ index 79ac4e3..d444635 100755
 -#ifndef __UCLIBC__
 +#if HAVE___SBRK
  // libc's version:
- extern "C" void* __sbrk(ptrdiff_t increment);
+ extern "C" void* __sbrk(intptr_t increment);
  
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch
deleted file mode 100644
index 4c63e73b3..000000000
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a16a73f0819d26219ee83cd98eea82786d7c1755 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 16 Jul 2017 19:28:17 -0700
-Subject: [PATCH] include fcntl.h for loff_t definition
-
-Fixes
-linux_syscall_support.h:2641:26: error: 'loff_t' has not been declared
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/base/linux_syscall_support.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/base/linux_syscall_support.h b/src/base/linux_syscall_support.h
-index 85347a2..70431ca 100644
---- a/src/base/linux_syscall_support.h
-+++ b/src/base/linux_syscall_support.h
-@@ -162,6 +162,7 @@ extern "C" {
- #include <unistd.h>
- #include <linux/unistd.h>
- #include <endian.h>
-+#include <fcntl.h>
- 
- #ifdef __mips__
- /* Include definitions of the ABI currently in use.                          */
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
similarity index 84%
rename from meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
rename to meta-oe/recipes-support/gperftools/gperftools_2.7.bb
index e475663f2..e9fcc4cc9 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
@@ -4,12 +4,10 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
 DEPENDS += "libunwind"
 
-SRCREV = "bf840dec0495e17f5c8403e68e10b9d6bf05c559"
+SRCREV = "9608fa3bcf8020d35f59fbf70cd3cbe4b015b972"
 SRC_URI = "git://github.com/gperftools/gperftools \
            file://0001-Support-Atomic-ops-on-clang.patch \
-           file://0001-Use-ucontext_t-instead-of-struct-ucontext.patch \
            file://0001-fix-build-with-musl-libc.patch \
-           file://0001-include-fcntl.h-for-loff_t-definition.patch \
            file://0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch \
            file://disable_libunwind_aarch64.patch \
            file://sgidef.patch \
-- 
2.17.1


