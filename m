Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.3765.1611614056378312392
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 14:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LaZRtDup;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id t63so1560457qkc.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Jan 2021 14:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/8AGD+KmVElDeADGUuoLkgSY7h3eFnqqv/9xwSH9hYc=;
        b=LaZRtDupwFKYIVmeFa7Jj6UHGFR1H1zOSYuCdZE00+79JqmfrIPFqYAh3qITDXiJKI
         d2qDebazCwW1sp3ZoC4TNYa/5qyJfq+rS7ySIuF+k5n2T9Vht0qBzfZPlyXN5Dbx8tMn
         +csrmW3vUV2F2ZPjti46jPrfOGfRWnxa+KXLAKOl/ig1rw3ZPLdNb3ENm2+7UHfRaFK9
         l6wJFKsA/S3k4mXjHPN2qUsznwD6XVIo8EuwnTuF3rHemYLmdvOTDxJEeGTMB1+PjqcG
         C5ZlRfK7bj6CJOyVW2sRL2i/PVE1OizQowjbTCuv39x92b9cyf1+h8e7Hg/b8WpWtBQz
         cL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/8AGD+KmVElDeADGUuoLkgSY7h3eFnqqv/9xwSH9hYc=;
        b=bBYSqnxVz+wgS7n69mHUCUf2YWOruykkpVzRIgl+JxkobpOhSgYz111N7/8KgB43DU
         D2vdGdT8ixNttS4dFX8+1vyiweuNWZnjnKaJ1Fo/M8+7Q0HRJ9kQyDYYSduQZCSk/CJZ
         pigfhEED60HXXF8eedx9YkGy1N7z9vxzyNk/BjoNx8UaS849r/MapCMSDYAENlR4eWf5
         AKVZRCW5GxtXAMEKdJfN880o67tlgmSIzuu5rpb/yF+uL9aDt8w4x+YqPT0HNEXdefGB
         +S5Tdbfrm8EtyeIJ2rXZSGN/d4KNSpgRv29WbvURMmy9DCIM+cZ1VbIkuLBVJ2a2ZEW4
         BYiA==
X-Gm-Message-State: AOAM530WhR14sKfg7XGSii22+HW/C361AbnDuSkNpE9H1+gYY32TP4ne
	wQIuuDRLWzPUiLgA6ZqQHw+hmKHnTHUjLkGPWEk=
X-Google-Smtp-Source: ABdhPJyG/O4eABYQCwNz7dDlWzINvyg8OjDPIDZYmgIJJCg4P8u9yBuZntHAaEcSEH+M/P6AkH9UAkwaOSug81UDHHU=
X-Received: by 2002:a37:9b8b:: with SMTP id d133mr2901746qke.71.1611614055303;
 Mon, 25 Jan 2021 14:34:15 -0800 (PST)
MIME-Version: 1.0
References: <20210122105651.3094011-1-peron.clem@gmail.com>
In-Reply-To: <20210122105651.3094011-1-peron.clem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 25 Jan 2021 14:33:49 -0800
Message-ID: <CAMKF1sqtgNZ9rBdJGJx90EusPU7uHYcfsRpP82NdiF4cimGfpg@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] abseil-cpp: bump to LTS 2020_09_23 Patch Release 3
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see packaging failures e.g.

https://errors.yoctoproject.org/Errors/Details/541790/

On Fri, Jan 22, 2021 at 2:57 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.=
com> wrote:
>
> Most patches have been upstreamed and accepted.
>
> We can drop the -fPIC patch and pass BUILD_SHARED_LIBS instead.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>
> Changes since v1:
>  - SRC_URI fix mixup between 0001 and 0002 patches name
>
>  ...d-RISCV-support-to-GetProgramCounter.patch | 29 --------
>  .../0001-Fix-build-on-riscv32.patch           | 74 -------------------
>  ...e-maes-option-from-cross-compilation.patch | 53 -------------
>  .../0001-absl-always-use-asm-sgidefs.h.patch  |  8 +-
>  ...n-ABSL_HAVE_VDSO_SUPPORT-conditional.patch | 35 ---------
>  ...e-maes-option-from-cross-compilation.patch | 37 ++++++++++
>  .../abseil-cpp/0003-Add-fPIC-option.patch     | 27 -------
>  .../abseil-cpp/abseil-cpp_git.bb              | 21 +++---
>  8 files changed, 51 insertions(+), 233 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-=
Add-RISCV-support-to-GetProgramCounter.patch
>  delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-=
Fix-build-on-riscv32.patch
>  delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-=
Remove-maes-option-from-cross-compilation.patch
>  delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-=
Add-forgotten-ABSL_HAVE_VDSO_SUPPORT-conditional.patch
>  create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-=
Remove-maes-option-from-cross-compilation.patch
>  delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-=
Add-fPIC-option.patch
>
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Add-RIS=
CV-support-to-GetProgramCounter.patch b/meta-oe/recipes-devtools/abseil-cpp=
/abseil-cpp/0001-Add-RISCV-support-to-GetProgramCounter.patch
> deleted file mode 100644
> index 95ec070f6c5a..000000000000
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Add-RISCV-supp=
ort-to-GetProgramCounter.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 983eeae0792946fe5c090f95164c892ec6db5cc4 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 16 Feb 2020 16:22:53 -0800
> -Subject: [PATCH] Add RISCV support to GetProgramCounter()
> -
> -Identify PC register from signal context
> -
> -Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pull/6=
21]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - absl/debugging/internal/examine_stack.cc | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/absl/debugging/internal/examine_stack.cc b/absl/debugging/=
internal/examine_stack.cc
> -index 4739fbc..fb77450 100644
> ---- a/absl/debugging/internal/examine_stack.cc
> -+++ b/absl/debugging/internal/examine_stack.cc
> -@@ -53,6 +53,8 @@ void* GetProgramCounter(void* vuc) {
> -     return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
> - #elif defined(__powerpc__)
> -     return reinterpret_cast<void*>(context->uc_mcontext.regs->nip);
> -+#elif defined(__riscv)
> -+    return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC=
]);
> - #elif defined(__s390__) && !defined(__s390x__)
> -     return reinterpret_cast<void*>(context->uc_mcontext.psw.addr & 0x7=
fffffff);
> - #elif defined(__s390__) && defined(__s390x__)
> ---
> -2.25.0
> -
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Fix-bui=
ld-on-riscv32.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-F=
ix-build-on-riscv32.patch
> deleted file mode 100644
> index e7c9b43c2994..000000000000
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Fix-build-on-r=
iscv32.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -From 04e28fdda03b545a0f7b446a784ec2fa7249cbb8 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 29 Apr 2020 15:37:40 -0700
> -Subject: [PATCH] Fix build on riscv32
> -
> -Define __NR_mmap in terms of __NR_mmap2 and __NR_futex interms of
> -__NR_futex_time64 for rv32, since there calls dont exist for rv32
> -
> -Also recognise rv32 as a new 32bit platform
> -
> -Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pull/6=
75]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - absl/base/internal/direct_mmap.h        | 5 +++++
> - absl/base/internal/spinlock_linux.inc   | 4 ++++
> - absl/synchronization/internal/waiter.cc | 4 ++++
> - 3 files changed, 13 insertions(+)
> -
> -diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/dire=
ct_mmap.h
> -index 5618867..90cfeca 100644
> ---- a/absl/base/internal/direct_mmap.h
> -+++ b/absl/base/internal/direct_mmap.h
> -@@ -26,6 +26,10 @@
> -
> - #ifdef __linux__
> -
> -+#if !defined(__NR_mmap) && defined(__riscv) && __riscv_xlen =3D=3D 32
> -+# define __NR_mmap __NR_mmap2
> -+#endif
> -+
> - #include <sys/types.h>
> - #ifdef __BIONIC__
> - #include <sys/syscall.h>
> -@@ -72,6 +76,7 @@ inline void* DirectMmap(void* start, size_t length, i=
nt prot, int flags, int fd,
> - #if defined(__i386__) || defined(__ARM_ARCH_3__) || defined(__ARM_EABI=
__) || \
> -     (defined(__mips__) && _MIPS_SIM =3D=3D _MIPS_SIM_ABI32) ||        =
           \
> -     (defined(__PPC__) && !defined(__PPC64__)) ||                      =
       \
> -+    (defined(__riscv) && __riscv_xlen =3D=3D 32)  ||                  =
           \
> -     (defined(__s390__) && !defined(__s390x__))
> -   // On these architectures, implement mmap with mmap2.
> -   static int pagesize =3D 0;
> -diff --git a/absl/base/internal/spinlock_linux.inc b/absl/base/internal=
/spinlock_linux.inc
> -index 323edd6..3dca444 100644
> ---- a/absl/base/internal/spinlock_linux.inc
> -+++ b/absl/base/internal/spinlock_linux.inc
> -@@ -14,6 +14,10 @@
> - //
> - // This file is a Linux-specific part of spinlock_wait.cc
> -
> -+#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen =3D=3D 32
> -+# define __NR_futex __NR_futex_time64
> -+#endif
> -+
> - #include <linux/futex.h>
> - #include <sys/syscall.h>
> - #include <unistd.h>
> -diff --git a/absl/synchronization/internal/waiter.cc b/absl/synchroniza=
tion/internal/waiter.cc
> -index 2949f5a..7411042 100644
> ---- a/absl/synchronization/internal/waiter.cc
> -+++ b/absl/synchronization/internal/waiter.cc
> -@@ -24,6 +24,10 @@
> - #include <unistd.h>
> - #endif
> -
> -+#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen =3D=3D 32
> -+# define __NR_futex __NR_futex_time64
> -+#endif
> -+
> - #ifdef __linux__
> - #include <linux/futex.h>
> - #include <sys/syscall.h>
> ---
> -2.26.2
> -
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-=
maes-option-from-cross-compilation.patch b/meta-oe/recipes-devtools/abseil-=
cpp/abseil-cpp/0001-Remove-maes-option-from-cross-compilation.patch
> deleted file mode 100644
> index 4c41cd890259..000000000000
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-maes-op=
tion-from-cross-compilation.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 70926666f7c5c35add363e3bcade6eaabace7206 Mon Sep 17 00:00:00 2001
> -From: Sinan Kaya <sinan.kaya@microsoft.com>
> -Date: Mon, 3 Feb 2020 03:25:57 +0000
> -Subject: [PATCH] Remove maes option from cross-compilation
> -
> ----
> - absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
> - absl/copts/GENERATED_copts.bzl         | 4 ----
> - absl/copts/copts.py                    | 4 ----
> - 3 files changed, 12 deletions(-)
> -
> -diff --git a/absl/copts/GENERATED_AbseilCopts.cmake b/absl/copts/GENERA=
TED_AbseilCopts.cmake
> -index 01bd40b..af99694 100644
> ---- a/absl/copts/GENERATED_AbseilCopts.cmake
> -+++ b/absl/copts/GENERATED_AbseilCopts.cmake
> -@@ -230,7 +230,3 @@ list(APPEND ABSL_RANDOM_HWAES_MSVC_X64_FLAGS
> -     "/Ob2"
> - )
> -
> --list(APPEND ABSL_RANDOM_HWAES_X64_FLAGS
> --    "-maes"
> --    "-msse4.1"
> --)
> -diff --git a/absl/copts/GENERATED_copts.bzl b/absl/copts/GENERATED_copt=
s.bzl
> -index 82f332f..9a548d1 100644
> ---- a/absl/copts/GENERATED_copts.bzl
> -+++ b/absl/copts/GENERATED_copts.bzl
> -@@ -231,7 +231,3 @@ ABSL_RANDOM_HWAES_MSVC_X64_FLAGS =3D [
> -     "/Ob2",
> - ]
> -
> --ABSL_RANDOM_HWAES_X64_FLAGS =3D [
> --    "-maes",
> --    "-msse4.1",
> --]
> -diff --git a/absl/copts/copts.py b/absl/copts/copts.py
> -index 068abce..c2f70fb 100644
> ---- a/absl/copts/copts.py
> -+++ b/absl/copts/copts.py
> -@@ -203,10 +203,6 @@ COPT_VARS =3D {
> -     # to improve performance of some random bit generators.
> -     "ABSL_RANDOM_HWAES_ARM64_FLAGS": ["-march=3Darmv8-a+crypto"],
> -     "ABSL_RANDOM_HWAES_ARM32_FLAGS": ["-mfpu=3Dneon"],
> --    "ABSL_RANDOM_HWAES_X64_FLAGS": [
> --        "-maes",
> --        "-msse4.1",
> --    ],
> -     "ABSL_RANDOM_HWAES_MSVC_X64_FLAGS": [
> -         "/O2",  # Maximize speed
> -         "/Ob2",  # Aggressive inlining
> ---
> -2.23.0
> -
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-al=
ways-use-asm-sgidefs.h.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-c=
pp/0001-absl-always-use-asm-sgidefs.h.patch
> index 6bb59d933694..2bafcc6b1305 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-us=
e-asm-sgidefs.h.patch
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-us=
e-asm-sgidefs.h.patch
> @@ -1,7 +1,7 @@
> -From 14229e8c6f42a96e4d725124193ceefa54e5e1a4 Mon Sep 17 00:00:00 2001
> +From 8f21fdfb83b0fa844a9f1f03a86a9ca46642d85e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 9 Apr 2020 13:06:27 -0700
> -Subject: [PATCH] absl: always use <asm/sgidefs.h>
> +Subject: [PATCH 1/2] absl: always use <asm/sgidefs.h>
>
>  Fixes mips/musl build, since sgidefs.h is not present on all C librarie=
s
>  but on linux asm/sgidefs.h is there and contains same definitions, usin=
g
> @@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
>  diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/dire=
ct_mmap.h
> -index 2e5e422..c515325 100644
> +index 16accf096604..ba7936cc934e 100644
>  --- a/absl/base/internal/direct_mmap.h
>  +++ b/absl/base/internal/direct_mmap.h
>  @@ -41,13 +41,9 @@
> @@ -34,5 +34,5 @@ index 2e5e422..c515325 100644
>
>   // SYS_mmap and SYS_munmap are not defined in Android.
>  --
> -2.26.0
> +2.25.1
>
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Add-for=
gotten-ABSL_HAVE_VDSO_SUPPORT-conditional.patch b/meta-oe/recipes-devtools/=
abseil-cpp/abseil-cpp/0002-Add-forgotten-ABSL_HAVE_VDSO_SUPPORT-conditional=
.patch
> deleted file mode 100644
> index fab4a738ea74..000000000000
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Add-forgotten-=
ABSL_HAVE_VDSO_SUPPORT-conditional.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 9384735383a0b8688e3f05ed23a53f18863eae20 Mon Sep 17 00:00:00 2001
> -From: Sinan Kaya <sinan.kaya@microsoft.com>
> -Date: Tue, 11 Feb 2020 11:36:00 -0500
> -Subject: [PATCH] Add forgotten ABSL_HAVE_VDSO_SUPPORT conditional
> -
> -Signed-off-by: Sinan Kaya <sinan.kaya@microsoft.com>
> ----
> - absl/debugging/internal/stacktrace_x86-inl.inc | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/absl/debugging/internal/stacktrace_x86-inl.inc b/absl/debu=
gging/internal/stacktrace_x86-inl.inc
> -index ff0fd31..28607c3 100644
> ---- a/absl/debugging/internal/stacktrace_x86-inl.inc
> -+++ b/absl/debugging/internal/stacktrace_x86-inl.inc
> -@@ -171,6 +171,7 @@ static void **NextStackFrame(void **old_fp, const v=
oid *uc) {
> -     static const unsigned char *kernel_rt_sigreturn_address =3D nullpt=
r;
> -     static const unsigned char *kernel_vsyscall_address =3D nullptr;
> -     if (num_push_instructions =3D=3D -1) {
> -+#ifdef ABSL_HAVE_VDSO_SUPPORT
> -       absl::debugging_internal::VDSOSupport vdso;
> -       if (vdso.IsPresent()) {
> -         absl::debugging_internal::VDSOSupport::SymbolInfo
> -@@ -199,6 +200,9 @@ static void **NextStackFrame(void **old_fp, const v=
oid *uc) {
> -       } else {
> -         num_push_instructions =3D 0;
> -       }
> -+#else
> -+      num_push_instructions =3D 0;
> -+#endif
> -     }
> -     if (num_push_instructions !=3D 0 && kernel_rt_sigreturn_address !=
=3D nullptr &&
> -         old_fp[1] =3D=3D kernel_rt_sigreturn_address) {
> ---
> -2.20.1.windows.1
> -
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-=
maes-option-from-cross-compilation.patch b/meta-oe/recipes-devtools/abseil-=
cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
> new file mode 100644
> index 000000000000..da9dbd936761
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-op=
tion-from-cross-compilation.patch
> @@ -0,0 +1,37 @@
> +From a9e15a4855c82eb948dedeecd83d5e17c3c8f767 Mon Sep 17 00:00:00 2001
> +From: Sinan Kaya <sinan.kaya@microsoft.com>
> +Date: Mon, 3 Feb 2020 03:25:57 +0000
> +Subject: [PATCH 2/2] Remove maes option from cross-compilation
> +
> +---
> + absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
> + absl/copts/GENERATED_copts.bzl         | 4 ----
> + 2 files changed, 8 deletions(-)
> +
> +diff --git a/absl/copts/GENERATED_AbseilCopts.cmake b/absl/copts/GENERA=
TED_AbseilCopts.cmake
> +index 97bd283eb739..ce29ac031b9c 100644
> +--- a/absl/copts/GENERATED_AbseilCopts.cmake
> ++++ b/absl/copts/GENERATED_AbseilCopts.cmake
> +@@ -210,7 +210,3 @@ list(APPEND ABSL_RANDOM_HWAES_ARM64_FLAGS
> + list(APPEND ABSL_RANDOM_HWAES_MSVC_X64_FLAGS
> + )
> +
> +-list(APPEND ABSL_RANDOM_HWAES_X64_FLAGS
> +-    "-maes"
> +-    "-msse4.1"
> +-)
> +diff --git a/absl/copts/GENERATED_copts.bzl b/absl/copts/GENERATED_copt=
s.bzl
> +index bcdd61ef8211..3e8eddd4bb08 100644
> +--- a/absl/copts/GENERATED_copts.bzl
> ++++ b/absl/copts/GENERATED_copts.bzl
> +@@ -211,7 +211,3 @@ ABSL_RANDOM_HWAES_ARM64_FLAGS =3D [
> + ABSL_RANDOM_HWAES_MSVC_X64_FLAGS =3D [
> + ]
> +
> +-ABSL_RANDOM_HWAES_X64_FLAGS =3D [
> +-    "-maes",
> +-    "-msse4.1",
> +-]
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Add-fPI=
C-option.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Add-fP=
IC-option.patch
> deleted file mode 100644
> index bb78813a7fae..000000000000
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Add-fPIC-optio=
n.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From d7160d647c8f8847f3ea8d7b0eb222936962c1af Mon Sep 17 00:00:00 2001
> -From: Sinan Kaya <sinan.kaya@microsoft.com>
> -Date: Tue, 11 Feb 2020 11:58:02 -0500
> -Subject: [PATCH] Add fPIC option
> -
> -Signed-off-by: Sinan Kaya <sinan.kaya@microsoft.com>
> ----
> - CMakeLists.txt | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 74a3a4c..4f837b3 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -79,6 +79,9 @@ option(ABSL_USE_GOOGLETEST_HEAD
> -
> - option(ABSL_RUN_TESTS "If ON, Abseil tests will be run." OFF)
> -
> -+# link fails on arm64 and x86-64 without this
> -+add_compile_options(-fPIC)
> -+
> - if(${ABSL_RUN_TESTS})
> -   # enable CTest.  This will set BUILD_TESTING to ON unless otherwise =
specified
> -   # on the command line
> ---
> -2.20.1.windows.1
> -
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/met=
a-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> index 8efa31e95311..4b8dfe250d48 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> @@ -7,16 +7,12 @@ SECTION =3D "libs"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddf52c6edb7adc22e533b2bacc3bd=
3915"
>
> -PV =3D "20190808+git${SRCPV}"
> -SRCREV =3D "aa844899c937bde5d2b24f276b59997e5b668bde"
> -BRANCH =3D "lts_2019_08_08"
> -SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D${BRANCH}     =
           \
> -           file://0001-Remove-maes-option-from-cross-compilation.patch =
       \
> -           file://0002-Add-forgotten-ABSL_HAVE_VDSO_SUPPORT-conditional=
.patch \
> -           file://0003-Add-fPIC-option.patch                           =
       \
> -           file://0001-Add-RISCV-support-to-GetProgramCounter.patch \
> -           file://0001-absl-always-use-asm-sgidefs.h.patch \
> -           file://0001-Fix-build-on-riscv32.patch \
> +PV =3D "20200923+git${SRCPV}"
> +SRCREV =3D "6f9d96a1f41439ac172ee2ef7ccd8edf0e5d068c"
> +BRANCH =3D "lts_2020_09_23"
> +SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D${BRANCH}     =
    \
> +           file://0001-absl-always-use-asm-sgidefs.h.patch             =
\
> +           file://0002-Remove-maes-option-from-cross-compilation.patch =
\
>            "
>
>  S =3D "${WORKDIR}/git"
> @@ -28,6 +24,10 @@ ASNEEDED_class-nativesdk =3D ""
>
>  inherit cmake
>
> +EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
> +                 -DBUILD_TESTING=3DOFF    \
> +                "
> +
>  BBCLASSEXTEND =3D "native nativesdk"
>  ALLOW_EMPTY_${PN} =3D "1"
>
> @@ -55,4 +55,3 @@ python () {
>              raise bb.parse.SkipRecipe("%s-%s Needs support for corei7 o=
n x86_64" % (pkgn, pkgv))
>
>  }
> -
> --
> 2.25.1
>
>
>=20
>
