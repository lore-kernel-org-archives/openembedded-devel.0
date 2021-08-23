Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.30399.1629752731193799240
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Aug 2021 14:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AE7Aqtbu;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id t1so17798082pgv.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Aug 2021 14:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7IMpgorbQeT7Fp6d9L2m8NspIKSRfFAR9Vuc6e5Umg4=;
        b=AE7Aqtbuum4REBXKj9rQ8gTCjMVFygRTmMTKGClT5Mnpd+Gyrx3ooaqfV1Oxhl0IlP
         8KQ9q3mmx4QT+XQfUQaZUaELoWPfIFNarZlZUUHYpTLe7ndknCL4avdguN8k2pQbMb/Q
         2yNAxwRLjYtY5IuSl/oSIjpPrXWNh/oaM5srRSSP1rlRrEmhg7v5rYMxB71xIjKX+yuv
         MsZqh4mTzaX7MPAiEaT4FqHHG3LVQSag2syudPP3XSNocVVY+tIsWYDEJXaL0WR+dEMr
         rbcNFByfbj7PvmAFKNt0HZ8ZBKY/F8lB0Toj/RmRE3u67z6c4gseuJQSCV+EZ9wKa0dh
         iDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7IMpgorbQeT7Fp6d9L2m8NspIKSRfFAR9Vuc6e5Umg4=;
        b=Ud7Euwk2REdNaySgF/neNZg2xsUeFyKrHr6K/imKb5TvklEkLhgU5SQAabraRABMWD
         vkyezezwImQZQuNAywEisFZbf5gjO0NctVWUghcPOalQq3fKbM3OcEWNgive+GTRG5Ni
         uNQdPpNdW9/pac33eduuFItG6hm5AOTp7zobvbk/JCmPXmIRqB7dk8R/zmr7CcaqsLh7
         5kMb9fcNxinSPZQpSHcEdPaCeP9xyTAyZUW90BuU90VOvZ9VZH1UjGlosDcUXsuggL1O
         C/LI90byFzGdURr+iIdSYURdpVCzN+U1zlpcJDQfNQik4wTNfAxjcS1RYoBb8ATgJW4N
         IKHQ==
X-Gm-Message-State: AOAM533W99ra7djg00/OmVly3wOt3Gx5AldqEYPU8prrzg91tSropojS
	I6nphY4KF9S/NjK0CwxW2CSvHp5D81zCOA==
X-Google-Smtp-Source: ABdhPJw22wRAK57KxF8cm58biOrXeeQegf06lbQF2CSe2oV7jqptjmVdd8hP/F0abipUQ4q0Oe/W8Q==
X-Received: by 2002:a63:4b60:: with SMTP id k32mr33778979pgl.198.1629752730195;
        Mon, 23 Aug 2021 14:05:30 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id o10sm144940pjg.34.2021.08.23.14.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 14:05:29 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] mariadb: Upgrade to 10.6.4
Date: Mon, 23 Aug 2021 14:05:27 -0700
Message-Id: <20210823210527.1799447-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

Drop patches such as 0001-disable-ucontext-on-musl.patch is used to
patch include/my_context.h which is deleted in 10.6.x [1] and rebase one
patch to avoid fuzz warnings.

[1] https://github.com/MariaDB/server/commit/32a29afea777d8bbfcea7a2b5e6e5ee674013cb5

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix rv32 build failures

 ...ve_10.5.11.bb => mariadb-native_10.6.4.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  6 ++--
 ...ck-if-syscall-exists-before-using-it.patch | 14 ++++----
 .../0001-disable-ucontext-on-musl.patch       | 26 ---------------
 .../clang_version_header_conflict.patch       | 32 -------------------
 .../mysql/mariadb/ppc-remove-glibc-dep.patch  | 19 +++--------
 .../recipes-dbs/mysql/mariadb/sys_futex.patch | 27 ++++++++--------
 .../{mariadb_10.5.11.bb => mariadb_10.6.4.bb} |  0
 8 files changed, 28 insertions(+), 96 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.11.bb => mariadb-native_10.6.4.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-disable-ucontext-on-musl.patch
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/clang_version_header_conflict.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.11.bb => mariadb_10.6.4.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.11.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.6.4.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.11.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.6.4.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 2496ac8fdc..81a7859323 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -12,20 +12,18 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://mysql-systemd-start \
            file://configure.cmake-fix-valgrind.patch \
            file://support-files-CMakeLists.txt-fix-do_populate_sysroot.patch \
-           file://0001-disable-ucontext-on-musl.patch \
            file://c11_atomics.patch \
-           file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
            file://0001-Fix-library-LZ4-lookup.patch \
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
-           file://sys_futex.patch \
            file://ssize_t.patch \
            file://mm_malloc.patch \
+           file://sys_futex.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"

-SRC_URI[sha256sum] = "761053605fe30ce393f324852117990350840a93b3e6305ef4d2f8c8305cc47a"
+SRC_URI[sha256sum] = "75bf9b147a95d38160d01a73b098d50a1960563b46d16a235971fff64d99643c"

 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"

diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
index a2f7812c50..6ed174113b 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
@@ -1,6 +1,6 @@
-From 5d9a869a72420cf0bb08b6aa93e980df90bdcf2e Mon Sep 17 00:00:00 2001
+From 0a3222338efc108c831fbdd719a47d35f4b0adcd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 3 Apr 2021 12:02:36 -0700
+Date: Wed, 18 Aug 2021 06:49:25 +0000
 Subject: [PATCH] aio_linux: Check if syscall exists before using it

 Return -ENOSYS if not implememented, fixes build on arches like RISCV32
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)

 diff --git a/tpool/aio_linux.cc b/tpool/aio_linux.cc
-index d9aa8be2..d8a87a8f 100644
+index 4abc213..da75411 100644
 --- a/tpool/aio_linux.cc
 +++ b/tpool/aio_linux.cc
-@@ -59,6 +59,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
+@@ -58,6 +58,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
  */
  static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
  {
@@ -28,7 +28,7 @@ index d9aa8be2..d8a87a8f 100644
    int saved_errno= errno;
    int ret= syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
                     min_nr, nr, ev, 0);
-@@ -68,6 +69,9 @@ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
+@@ -67,6 +68,9 @@ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
      errno= saved_errno;
    }
    return ret;
@@ -36,8 +36,8 @@ index d9aa8be2..d8a87a8f 100644
 +  return -ENOSYS;
 +#endif
  }
- #endif
+

 --
-2.31.1
+2.29.2

diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-disable-ucontext-on-musl.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-disable-ucontext-on-musl.patch
deleted file mode 100644
index daf2432a54..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-disable-ucontext-on-musl.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b658bdb38b7ff6a78915fd0ac390fc224e4006cb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 26 Mar 2017 14:30:33 -0700
-Subject: [PATCH] disable ucontext on musl
-
-musl does not have *contex() APIs even though it has ucontext.h header
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- include/my_context.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/my_context.h b/include/my_context.h
-index ea0e3496..4c9b37dc 100644
---- a/include/my_context.h
-+++ b/include/my_context.h
-@@ -31,7 +31,7 @@
- #define MY_CONTEXT_USE_X86_64_GCC_ASM
- #elif defined(__GNUC__) && __GNUC__ >= 3 && defined(__i386__)
- #define MY_CONTEXT_USE_I386_GCC_ASM
--#elif defined(HAVE_UCONTEXT_H)
-+#elif defined(__GLIBC__) && defined(HAVE_UCONTEXT_H)
- #define MY_CONTEXT_USE_UCONTEXT
- #else
- #define MY_CONTEXT_DISABLE
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/clang_version_header_conflict.patch b/meta-oe/recipes-dbs/mysql/mariadb/clang_version_header_conflict.patch
deleted file mode 100644
index c77a869441..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/clang_version_header_conflict.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-libc++ also has a file called version and this file and how cflags are specified
-it ends up including this file and resulting in compile errors
-
-fixes errors like
-storage/mroonga/version:1:1: error: expected unqualified-id
-7.07
-^
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/storage/mroonga/CMakeLists.txt
-+++ b/storage/mroonga/CMakeLists.txt
-@@ -80,7 +80,7 @@ else()
-   set(MRN_SOURCE_DIR ${CMAKE_SOURCE_DIR})
- endif()
-
--file(READ ${MRN_SOURCE_DIR}/version        MRN_VERSION)
-+file(READ ${MRN_SOURCE_DIR}/ver            MRN_VERSION)
- file(READ ${MRN_SOURCE_DIR}/version_major  MRN_VERSION_MAJOR)
- file(READ ${MRN_SOURCE_DIR}/version_minor  MRN_VERSION_MINOR)
- file(READ ${MRN_SOURCE_DIR}/version_micro  MRN_VERSION_MICRO)
---- /dev/null
-+++ b/storage/mroonga/ver
-@@ -0,0 +1 @@
-+7.07
-\ No newline at end of file
---- a/storage/mroonga/version
-+++ /dev/null
-@@ -1 +0,0 @@
--7.07
-\ No newline at end of file
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
index d6e53c29e1..a4deee6070 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
@@ -3,11 +3,13 @@ Remove glibc specific function dependencies
 Sourced from: https://git.alpinelinux.org/aports/tree/main/mariadb/ppc-remove-glibc-dep.patch
 Signed-off-by: Khem Raj <raj.khem@gmail.com>

+diff --git a/include/my_cpu.h b/include/my_cpu.h
+index f2e26fca..94599b74 100644
 --- a/include/my_cpu.h
 +++ b/include/my_cpu.h
 @@ -24,17 +24,16 @@
  */
-
+
  #ifdef _ARCH_PWR8
 -#include <sys/platform/ppc.h>
  /* Very low priority */
@@ -28,7 +30,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  /* High priority */
  #define HMT_high() asm volatile("or 3,3,3")
  #else
-@@ -81,7 +80,7 @@ static inline void MY_RELAX_CPU(void)
+@@ -72,7 +71,7 @@ static inline void MY_RELAX_CPU(void)
    __asm__ __volatile__ ("pause");
  #endif
  #elif defined(_ARCH_PWR8)
@@ -36,15 +38,4 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +  __builtin_ppc_get_timebase();
  #elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
    /* Mainly, prevent the compiler from optimizing away delay loops */
- #ifdef _aarch64_
---- a/storage/tokudb/PerconaFT/portability/toku_time.h
-+++ b/storage/tokudb/PerconaFT/portability/toku_time.h
-@@ -124,7 +124,7 @@ static inline tokutime_t toku_time_now(v
-     __asm __volatile__ ("mrs %[rt], cntvct_el0" : [rt] "=r" (result));
-     return result;
- #elif defined(__powerpc__)
--    return __ppc_get_timebase();
-+    return __builtin_ppc_get_timebase();
- #else
- #error No timer implementation for this platform
- #endif
+   __asm__ __volatile__ ("":::"memory");
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch b/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
index 3277a3eee1..3244ab8da2 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
@@ -1,22 +1,23 @@
- Use SYS_futex for syscall
+Use SYS_futex for syscall

 glibc defines SYS_futex and on newer 32bit CPUs like RISCV-32, arc there
 is no 32bit time_t therefore define SYS_futex in terms of SYS_futex_time64

 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/storage/innobase/include/ib0mutex.h
-+++ b/storage/innobase/include/ib0mutex.h
-@@ -150,6 +150,12 @@ private:
- #include <linux/futex.h>
- #include <sys/syscall.h>
-
+
+--- a/storage/innobase/sync/srw_lock.cc
++++ b/storage/innobase/sync/srw_lock.cc
+@@ -210,6 +210,12 @@ void ssux_lock_low::wake() { WakeByAddre
+ #  ifdef __linux__
+ #   include <linux/futex.h>
+ #   include <sys/syscall.h>
 +/** Newer 32bit CPUs eg. RISCV-32 are defaulting to 64bit time_t from get go and
 + therefore do not define __NR_futex */
-+#if !defined(SYS_futex) && defined(SYS_futex_time64)
-+# define SYS_futex SYS_futex_time64
-+#endif
++#   if !defined(SYS_futex) && defined(SYS_futex_time64)
++#    define SYS_futex SYS_futex_time64
++#   endif
 +
- /** Mutex implementation that used the Linux futex. */
- template <template <typename> class Policy>
- struct TTASFutexMutex {
+ #   define SRW_FUTEX(a,op,n) \
+     syscall(SYS_futex, a, FUTEX_ ## op ## _PRIVATE, n, nullptr, nullptr, 0)
+ #  elif defined __OpenBSD__
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.11.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.6.4.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.11.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.6.4.bb
--
2.33.0
