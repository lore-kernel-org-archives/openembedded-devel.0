Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.41742.1585532882599423840
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 18:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,322,1580745600"; 
   d="scan'208";a="87783499"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Mar 2020 09:48:01 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 950304BCC8A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 09:37:44 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 30 Mar 2020 09:47:36 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 30 Mar 2020 09:47:42 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gperftools: upgrade 2.7 -> 2.7.90
Date: Mon, 30 Mar 2020 02:26:59 -0700
Message-ID: <1585560419-98714-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585560419-98714-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585560419-98714-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 950304BCC8A0.A1A75
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

refresh 0001-fix-build-with-musl-libc.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../0001-fix-build-with-musl-libc.patch       | 34 ++++---------------
 ...gperftools_2.7.bb => gperftools_2.7.90.bb} |  2 +-
 2 files changed, 8 insertions(+), 28 deletions(-)
 rename meta-oe/recipes-support/gperftools/{gperftools_2.7.bb => gperftools_2.7.90.bb} (97%)

diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
index 49d5c2167..cb4ead317 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
@@ -6,26 +6,12 @@ Subject: [PATCH] fix build with musl libc
 Patch from https://github.com/gperftools/gperftools/pull/765/
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
- configure.ac                 | 1 +
- src/malloc_hook_mmap_linux.h | 8 ++++++--
- 2 files changed, 7 insertions(+), 2 deletions(-)
+ src/malloc_hook_mmap_linux.h | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index 497103e..f9efc3e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -188,6 +188,7 @@ AC_HEADER_STDC
- AC_CHECK_TYPES([__int64])       # defined in some windows platforms
- AC_CHECK_TYPES([struct mallinfo],,, [#include <malloc.h>])
- AC_CHECK_TYPES([Elf32_Versym],,, [#include <elf.h>])   # for vdso_support.h
-+AC_CHECK_FUNCS(__sbrk)          # for intercepting glibc memory allocator
- AC_CHECK_FUNCS(sbrk)            # for tcmalloc to get memory
- AC_CHECK_FUNCS(geteuid)         # for turning off services when run as root
- AC_CHECK_FUNCS(fork)            # for the pthread_atfork setup
 diff --git a/src/malloc_hook_mmap_linux.h b/src/malloc_hook_mmap_linux.h
-index 2f6116f..0605855 100755
+index e2efb05..66b3110 100644
 --- a/src/malloc_hook_mmap_linux.h
 +++ b/src/malloc_hook_mmap_linux.h
 @@ -46,6 +46,10 @@
@@ -39,7 +25,7 @@ index 2f6116f..0605855 100755
  // The x86-32 case and the x86-64 case differ:
  // 32b has a mmap2() syscall, 64b does not.
  // 64b and 32b have different calling conventions for mmap().
-@@ -168,7 +172,7 @@ extern "C" void* mmap64(void *start, size_t length, int prot, int flags,
+@@ -175,7 +179,7 @@ extern "C" void* mmap64(void *start, size_t length, int prot, int flags,
    return result;
  }
  
@@ -48,12 +34,6 @@ index 2f6116f..0605855 100755
  
  extern "C" void* mmap(void *start, size_t length, int prot, int flags,
                        int fd, off_t offset) __THROW {
-@@ -206,7 +210,7 @@ extern "C" void* mremap(void* old_addr, size_t old_size, size_t new_size,
-   return result;
- }
- 
--#ifndef __UCLIBC__
-+#if HAVE___SBRK
- // libc's version:
- extern "C" void* __sbrk(intptr_t increment);
- 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb b/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb
similarity index 97%
rename from meta-oe/recipes-support/gperftools/gperftools_2.7.bb
rename to meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb
index ee34acec2..9dfb0d974 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gperftools/gperftools"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
 
-SRCREV = "9608fa3bcf8020d35f59fbf70cd3cbe4b015b972"
+SRCREV = "db7aa547abb5abdd558587a15502584cbc825438"
 SRC_URI = "git://github.com/gperftools/gperftools \
            file://0001-Support-Atomic-ops-on-clang.patch \
            file://0001-fix-build-with-musl-libc.patch \
-- 
2.17.1



