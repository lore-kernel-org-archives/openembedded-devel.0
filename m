Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web08.30.1629476639115322078
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Aug 2021 09:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ET6BNC3A;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id 14so11433166qkc.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 09:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=raQlaL8xKdOZ0fccNaeLhO8piEKnUJGpEAxCcI94T4w=;
        b=ET6BNC3A9iB+xU5Drs9ZKewQLRaQ45xKAufSNhe2SO+o/eRVjD4IF8xB0ELmRuNa4f
         JuQUBchKdFNS0BGRCNgOlvE880+DMMtWQhARJh8eo9ea1jEs63qvxGxRgY5W22vyJpTo
         9VjnaibDMpjvmi2QuIXD/QQ91cDI/hiqYWDiQLv8FB4yRxDFMohqQ/+VMvOFjivp1pIV
         PNiWAzZowFTqlwu2MVbgIT96c+PUwFsN3ZWchPzfajcwNR8syJZS8FbaRM9EEMShst5Q
         40DKQJQsNuHmtTwCL1DO2Pb/UlaM1RoC5lZiLMNv06cLKX28ZrCL7PUfnbxnU4aFbCb1
         DSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=raQlaL8xKdOZ0fccNaeLhO8piEKnUJGpEAxCcI94T4w=;
        b=LF6IWMugnOxDWeU4AaxwjXmRx5iELLyePiUCCSbJXi8ZNo8HK8G0xBDLvdHrenULw6
         aSxQcLABCWybhCEjf9tqEjKU4LWdNJnS5rzx4/m/UO1twsjPPRfjnB1t6jd84jI/8sYZ
         AfvkBo/doaql/uXucleHnPGL4dY63d/a8T70ujU/RJG+r11omNzvs/fYdlwmvYmFS3TA
         7HDsDXzhH0p8nz20/qwaY50E1MvzSKuyGiDTQ/qTTH/4xJakrx08MI+btpM0sShbUOOU
         7ct4pEIgVR1DdTS0sDOauwr/0j8Yjc3/a8r0OYQa0dQmZYuIb3IDTqmG5HHU1NAul0R6
         Lgzg==
X-Gm-Message-State: AOAM532lKATpbZz6KONCoQzcZDjrDwxt7gBzW8GAAefx/Jong/ln3lfZ
	3Ky7xW49/w8g+zlEb5owWk9AsDCk+7mxrhWJ9+0=
X-Google-Smtp-Source: ABdhPJybG8TJoAmMkePR2uwRI4jBARzx8sBhMqq2rMS2MRKyXJc/N4pkAHrHGAXy96gd4ma1QoQd+1LHwlLx4sfXD14=
X-Received: by 2002:ae9:f201:: with SMTP id m1mr9306859qkg.381.1629476638165;
 Fri, 20 Aug 2021 09:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210818093220.18684-1-mingli.yu@windriver.com>
In-Reply-To: <20210818093220.18684-1-mingli.yu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 20 Aug 2021 09:23:32 -0700
Message-ID: <CAMKF1soa+R0zMUr6_HjVpKkkN8zU65h-r7zU99wf8KL-Ny-wxg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: Upgrade to 10.6.4
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I am seeing failures in qemuriscv32

https://errors.yoctoproject.org/Errors/Details/601921/

On Wed, Aug 18, 2021 at 2:35 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Drop 3 patches such as 0001-disable-ucontext-on-musl.patch is used to
> patch include/my_context.h which is deleted in 10.6.x [1] and rebase one
> patch to avoid fuzz warnings.
>
> [1] https://github.com/MariaDB/server/commit/32a29afea777d8bbfcea7a2b5e6e5ee674013cb5
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...ve_10.5.11.bb => mariadb-native_10.6.4.bb} |  0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |  5 +--
>  ...ck-if-syscall-exists-before-using-it.patch | 14 ++++----
>  .../0001-disable-ucontext-on-musl.patch       | 26 ---------------
>  .../clang_version_header_conflict.patch       | 32 -------------------
>  .../recipes-dbs/mysql/mariadb/sys_futex.patch | 22 -------------
>  .../{mariadb_10.5.11.bb => mariadb_10.6.4.bb} |  0
>  7 files changed, 8 insertions(+), 91 deletions(-)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.11.bb => mariadb-native_10.6.4.bb} (100%)
>  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-disable-ucontext-on-musl.patch
>  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/clang_version_header_conflict.patch
>  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.11.bb => mariadb_10.6.4.bb} (100%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.11.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.6.4.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.11.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.6.4.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 2496ac8fd..6bcf9940c 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -12,20 +12,17 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>             file://mysql-systemd-start \
>             file://configure.cmake-fix-valgrind.patch \
>             file://support-files-CMakeLists.txt-fix-do_populate_sysroot.patch \
> -           file://0001-disable-ucontext-on-musl.patch \
>             file://c11_atomics.patch \
> -           file://clang_version_header_conflict.patch \
>             file://fix-arm-atomic.patch \
>             file://0001-Fix-library-LZ4-lookup.patch \
>             file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
>             file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
> -           file://sys_futex.patch \
>             file://ssize_t.patch \
>             file://mm_malloc.patch \
>            "
>  SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
>
> -SRC_URI[sha256sum] = "761053605fe30ce393f324852117990350840a93b3e6305ef4d2f8c8305cc47a"
> +SRC_URI[sha256sum] = "75bf9b147a95d38160d01a73b098d50a1960563b46d16a235971fff64d99643c"
>
>  UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
> index a2f7812c5..6ed174113 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
> @@ -1,6 +1,6 @@
> -From 5d9a869a72420cf0bb08b6aa93e980df90bdcf2e Mon Sep 17 00:00:00 2001
> +From 0a3222338efc108c831fbdd719a47d35f4b0adcd Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 3 Apr 2021 12:02:36 -0700
> +Date: Wed, 18 Aug 2021 06:49:25 +0000
>  Subject: [PATCH] aio_linux: Check if syscall exists before using it
>
>  Return -ENOSYS if not implememented, fixes build on arches like RISCV32
> @@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 4 insertions(+)
>
>  diff --git a/tpool/aio_linux.cc b/tpool/aio_linux.cc
> -index d9aa8be2..d8a87a8f 100644
> +index 4abc213..da75411 100644
>  --- a/tpool/aio_linux.cc
>  +++ b/tpool/aio_linux.cc
> -@@ -59,6 +59,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
> +@@ -58,6 +58,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
>   */
>   static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
>   {
> @@ -28,7 +28,7 @@ index d9aa8be2..d8a87a8f 100644
>     int saved_errno= errno;
>     int ret= syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
>                      min_nr, nr, ev, 0);
> -@@ -68,6 +69,9 @@ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
> +@@ -67,6 +68,9 @@ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
>       errno= saved_errno;
>     }
>     return ret;
> @@ -36,8 +36,8 @@ index d9aa8be2..d8a87a8f 100644
>  +  return -ENOSYS;
>  +#endif
>   }
> - #endif
> +
>
>  --
> -2.31.1
> +2.29.2
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-disable-ucontext-on-musl.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-disable-ucontext-on-musl.patch
> deleted file mode 100644
> index daf2432a5..000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-disable-ucontext-on-musl.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From b658bdb38b7ff6a78915fd0ac390fc224e4006cb Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 26 Mar 2017 14:30:33 -0700
> -Subject: [PATCH] disable ucontext on musl
> -
> -musl does not have *contex() APIs even though it has ucontext.h header
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - include/my_context.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/include/my_context.h b/include/my_context.h
> -index ea0e3496..4c9b37dc 100644
> ---- a/include/my_context.h
> -+++ b/include/my_context.h
> -@@ -31,7 +31,7 @@
> - #define MY_CONTEXT_USE_X86_64_GCC_ASM
> - #elif defined(__GNUC__) && __GNUC__ >= 3 && defined(__i386__)
> - #define MY_CONTEXT_USE_I386_GCC_ASM
> --#elif defined(HAVE_UCONTEXT_H)
> -+#elif defined(__GLIBC__) && defined(HAVE_UCONTEXT_H)
> - #define MY_CONTEXT_USE_UCONTEXT
> - #else
> - #define MY_CONTEXT_DISABLE
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/clang_version_header_conflict.patch b/meta-oe/recipes-dbs/mysql/mariadb/clang_version_header_conflict.patch
> deleted file mode 100644
> index c77a86944..000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/clang_version_header_conflict.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -libc++ also has a file called version and this file and how cflags are specified
> -it ends up including this file and resulting in compile errors
> -
> -fixes errors like
> -storage/mroonga/version:1:1: error: expected unqualified-id
> -7.07
> -^
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ---- a/storage/mroonga/CMakeLists.txt
> -+++ b/storage/mroonga/CMakeLists.txt
> -@@ -80,7 +80,7 @@ else()
> -   set(MRN_SOURCE_DIR ${CMAKE_SOURCE_DIR})
> - endif()
> -
> --file(READ ${MRN_SOURCE_DIR}/version        MRN_VERSION)
> -+file(READ ${MRN_SOURCE_DIR}/ver            MRN_VERSION)
> - file(READ ${MRN_SOURCE_DIR}/version_major  MRN_VERSION_MAJOR)
> - file(READ ${MRN_SOURCE_DIR}/version_minor  MRN_VERSION_MINOR)
> - file(READ ${MRN_SOURCE_DIR}/version_micro  MRN_VERSION_MICRO)
> ---- /dev/null
> -+++ b/storage/mroonga/ver
> -@@ -0,0 +1 @@
> -+7.07
> -\ No newline at end of file
> ---- a/storage/mroonga/version
> -+++ /dev/null
> -@@ -1 +0,0 @@
> --7.07
> -\ No newline at end of file
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch b/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
> deleted file mode 100644
> index 3277a3eee..000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> - Use SYS_futex for syscall
> -
> -glibc defines SYS_futex and on newer 32bit CPUs like RISCV-32, arc there
> -is no 32bit time_t therefore define SYS_futex in terms of SYS_futex_time64
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---- a/storage/innobase/include/ib0mutex.h
> -+++ b/storage/innobase/include/ib0mutex.h
> -@@ -150,6 +150,12 @@ private:
> - #include <linux/futex.h>
> - #include <sys/syscall.h>
> -
> -+/** Newer 32bit CPUs eg. RISCV-32 are defaulting to 64bit time_t from get go and
> -+ therefore do not define __NR_futex */
> -+#if !defined(SYS_futex) && defined(SYS_futex_time64)
> -+# define SYS_futex SYS_futex_time64
> -+#endif
> -+
> - /** Mutex implementation that used the Linux futex. */
> - template <template <typename> class Policy>
> - struct TTASFutexMutex {
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.11.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.6.4.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.11.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.6.4.bb
> --
> 2.17.1
>
>
> 
>
