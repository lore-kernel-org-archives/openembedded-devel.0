Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web08.153.1611265335344361618
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 13:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Phw5LeWt;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 2so1713772qvd.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 13:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/zp5xChYJzQojSFbVxfZcIdtiMmaSCpvgTix8P6wl2k=;
        b=Phw5LeWt1mF7/um8pVg57ExE7E+XdYcAFdkKeHOMRB0uD7oi0LXDhFjBgOPfOH8+vY
         GTgKEStLa1ZwpOPLVsLZDITPmooMx6q77yCmcBcmnB3ETn1veUJjgU26KdAiSVBytM63
         TxmrPHtVepTHlAi89rsFx6CGSFIH0HY0uta+aWEl/yXjF4SW3Q/6YBhRHPAZehSogll/
         XQ5BlUiQLXNKbOe0r8Sqm7a2f+y/mCS45ikNSqX5OljVWTZOe1XOOzDQ7waF0i5Ge8oH
         iA9E7wvSA5uUky6i+agUjLx6Zyc63bTwoBusUqJZj1Z6oME6x3VDtJDME7x3cawfqlEt
         nb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/zp5xChYJzQojSFbVxfZcIdtiMmaSCpvgTix8P6wl2k=;
        b=sDOV9ITP2XlTf7yp9O0qeAPiEhJ1ksLRICONes9XyYJpOR/hHsHTebStoq4uXBvWwR
         6tPQkhooUdrIVhQFVOck7R9YaoW8L1cMy7nT9rQCqNVjpf1GQI4m/solT3Yd+Qnq83ju
         tpYF2jXrksgSfibTxShlHJIqi7A5bAbFTaQ6ayg+UgQOWA7lEbp+EbtBEw0LXZVJ4KHu
         1MkGE8U7Vrmyy1iCqOhO8+iC1b8YnOp7SaUzvtXzUqqjkbYMoOqZhPPWrlz9ICYS9Ub2
         TIq90oG0OajqZuFijQuVqJ2X3/XggddAeiBgVAbwpcKLB7n/1Ruc58R+7kPmy+JZdjjI
         WAAQ==
X-Gm-Message-State: AOAM530AKkCsUiLpIYFrmPlJ/2H31Ecd3NqGlmOa+L9uEznbtbyhojNg
	tjJOB9fgifG5tAHog0E9vUuse6TBG4S35AHoBoQ=
X-Google-Smtp-Source: ABdhPJwlAAAOCEF4Cz3FlwNmSCQGSXiwrHf9WxuNBxTs1Z2+mEyQfX080IJ8UDnFIMjYYi+qjFkzVSDr9P1ynP+n1wc=
X-Received: by 2002:a05:6214:28f:: with SMTP id l15mr1484786qvv.38.1611265334348;
 Thu, 21 Jan 2021 13:42:14 -0800 (PST)
MIME-Version: 1.0
References: <20210121171036.3019430-1-peron.clem@gmail.com>
In-Reply-To: <20210121171036.3019430-1-peron.clem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 21 Jan 2021 13:41:48 -0800
Message-ID: <CAMKF1sq5ZGpUbJJ_ZPC4hz8wQ8cZMS6C65Ypn1mLQt91Lw61kw@mail.gmail.com>
Subject: Re: [PATCH] abseil-cpp: bump to LTS 2020_09_23 Patch Release 3
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

it seems to add 0002-absl-always-use-asm-sgidefs.h.patch but the patch
file itself it missing.

On Thu, Jan 21, 2021 at 9:10 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
>
> Most patches have been upstreamed and accepted.
>
> We can drop the -fPIC patch and pass BUILD_SHARED_LIBS instead.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>
> Hi,
>
> I'm looking to bump gRPC that now use abseil-cpp.
>
> When building i got some strange error that have been fixed in recent rel=
ease.
>
> Instead of backporting all the fixes required I prefer to bump the packag=
e.
>
> Regards,
> Clement
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
>  delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-A=
dd-RISCV-support-to-GetProgramCounter.patch
>  delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-F=
ix-build-on-riscv32.patch
>  delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-R=
emove-maes-option-from-cross-compilation.patch
>  delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-A=
dd-forgotten-ABSL_HAVE_VDSO_SUPPORT-conditional.patch
>  create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-R=
emove-maes-option-from-cross-compilation.patch
>  delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-A=
dd-fPIC-option.patch
>
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Add-RISC=
V-support-to-GetProgramCounter.patch b/meta-oe/recipes-devtools/abseil-cpp/=
abseil-cpp/0001-Add-RISCV-support-to-GetProgramCounter.patch
> deleted file mode 100644
> index 95ec070f6c5a..000000000000
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Add-RISCV-suppo=
rt-to-GetProgramCounter.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 983eeae0792946fe5c090f95164c892ec6db5cc4 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 16 Feb 2020 16:22:53 -0800
> -Subject: [PATCH] Add RISCV support to GetProgramCounter()
> -
> -Identify PC register from signal context
> -
> -Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pull/62=
1]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - absl/debugging/internal/examine_stack.cc | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/absl/debugging/internal/examine_stack.cc b/absl/debugging/i=
nternal/examine_stack.cc
> -index 4739fbc..fb77450 100644
> ---- a/absl/debugging/internal/examine_stack.cc
> -+++ b/absl/debugging/internal/examine_stack.cc
> -@@ -53,6 +53,8 @@ void* GetProgramCounter(void* vuc) {
> -     return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
> - #elif defined(__powerpc__)
> -     return reinterpret_cast<void*>(context->uc_mcontext.regs->nip);
> -+#elif defined(__riscv)
> -+    return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]=
);
> - #elif defined(__s390__) && !defined(__s390x__)
> -     return reinterpret_cast<void*>(context->uc_mcontext.psw.addr & 0x7f=
ffffff);
> - #elif defined(__s390__) && defined(__s390x__)
> ---
> -2.25.0
> -
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Fix-buil=
d-on-riscv32.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Fi=
x-build-on-riscv32.patch
> deleted file mode 100644
> index e7c9b43c2994..000000000000
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Fix-build-on-ri=
scv32.patch
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
> -Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pull/67=
5]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - absl/base/internal/direct_mmap.h        | 5 +++++
> - absl/base/internal/spinlock_linux.inc   | 4 ++++
> - absl/synchronization/internal/waiter.cc | 4 ++++
> - 3 files changed, 13 insertions(+)
> -
> -diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/direc=
t_mmap.h
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
> -@@ -72,6 +76,7 @@ inline void* DirectMmap(void* start, size_t length, in=
t prot, int flags, int fd,
> - #if defined(__i386__) || defined(__ARM_ARCH_3__) || defined(__ARM_EABI_=
_) || \
> -     (defined(__mips__) && _MIPS_SIM =3D=3D _MIPS_SIM_ABI32) ||         =
          \
> -     (defined(__PPC__) && !defined(__PPC64__)) ||                       =
      \
> -+    (defined(__riscv) && __riscv_xlen =3D=3D 32)  ||                   =
          \
> -     (defined(__s390__) && !defined(__s390x__))
> -   // On these architectures, implement mmap with mmap2.
> -   static int pagesize =3D 0;
> -diff --git a/absl/base/internal/spinlock_linux.inc b/absl/base/internal/=
spinlock_linux.inc
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
> -diff --git a/absl/synchronization/internal/waiter.cc b/absl/synchronizat=
ion/internal/waiter.cc
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
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-m=
aes-option-from-cross-compilation.patch b/meta-oe/recipes-devtools/abseil-c=
pp/abseil-cpp/0001-Remove-maes-option-from-cross-compilation.patch
> deleted file mode 100644
> index 4c41cd890259..000000000000
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-maes-opt=
ion-from-cross-compilation.patch
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
> -diff --git a/absl/copts/GENERATED_AbseilCopts.cmake b/absl/copts/GENERAT=
ED_AbseilCopts.cmake
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
> -diff --git a/absl/copts/GENERATED_copts.bzl b/absl/copts/GENERATED_copts=
.bzl
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
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-alw=
ays-use-asm-sgidefs.h.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cp=
p/0001-absl-always-use-asm-sgidefs.h.patch
> index 6bb59d933694..2bafcc6b1305 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use=
-asm-sgidefs.h.patch
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use=
-asm-sgidefs.h.patch
> @@ -1,7 +1,7 @@
> -From 14229e8c6f42a96e4d725124193ceefa54e5e1a4 Mon Sep 17 00:00:00 2001
> +From 8f21fdfb83b0fa844a9f1f03a86a9ca46642d85e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 9 Apr 2020 13:06:27 -0700
> -Subject: [PATCH] absl: always use <asm/sgidefs.h>
> +Subject: [PATCH 1/2] absl: always use <asm/sgidefs.h>
>
>  Fixes mips/musl build, since sgidefs.h is not present on all C libraries
>  but on linux asm/sgidefs.h is there and contains same definitions, using
> @@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
>  diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/direc=
t_mmap.h
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
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Add-forg=
otten-ABSL_HAVE_VDSO_SUPPORT-conditional.patch b/meta-oe/recipes-devtools/a=
bseil-cpp/abseil-cpp/0002-Add-forgotten-ABSL_HAVE_VDSO_SUPPORT-conditional.=
patch
> deleted file mode 100644
> index fab4a738ea74..000000000000
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Add-forgotten-A=
BSL_HAVE_VDSO_SUPPORT-conditional.patch
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
> -diff --git a/absl/debugging/internal/stacktrace_x86-inl.inc b/absl/debug=
ging/internal/stacktrace_x86-inl.inc
> -index ff0fd31..28607c3 100644
> ---- a/absl/debugging/internal/stacktrace_x86-inl.inc
> -+++ b/absl/debugging/internal/stacktrace_x86-inl.inc
> -@@ -171,6 +171,7 @@ static void **NextStackFrame(void **old_fp, const vo=
id *uc) {
> -     static const unsigned char *kernel_rt_sigreturn_address =3D nullptr=
;
> -     static const unsigned char *kernel_vsyscall_address =3D nullptr;
> -     if (num_push_instructions =3D=3D -1) {
> -+#ifdef ABSL_HAVE_VDSO_SUPPORT
> -       absl::debugging_internal::VDSOSupport vdso;
> -       if (vdso.IsPresent()) {
> -         absl::debugging_internal::VDSOSupport::SymbolInfo
> -@@ -199,6 +200,9 @@ static void **NextStackFrame(void **old_fp, const vo=
id *uc) {
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
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-m=
aes-option-from-cross-compilation.patch b/meta-oe/recipes-devtools/abseil-c=
pp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
> new file mode 100644
> index 000000000000..da9dbd936761
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-opt=
ion-from-cross-compilation.patch
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
> +diff --git a/absl/copts/GENERATED_AbseilCopts.cmake b/absl/copts/GENERAT=
ED_AbseilCopts.cmake
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
> +diff --git a/absl/copts/GENERATED_copts.bzl b/absl/copts/GENERATED_copts=
.bzl
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
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Add-fPIC=
-option.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Add-fPI=
C-option.patch
> deleted file mode 100644
> index bb78813a7fae..000000000000
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Add-fPIC-option=
.patch
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
> -   # enable CTest.  This will set BUILD_TESTING to ON unless otherwise s=
pecified
> -   # on the command line
> ---
> -2.20.1.windows.1
> -
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta=
-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> index 8efa31e95311..eb2ed9e478e1 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> @@ -7,16 +7,12 @@ SECTION =3D "libs"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddf52c6edb7adc22e533b2bacc3bd3=
915"
>
> -PV =3D "20190808+git${SRCPV}"
> -SRCREV =3D "aa844899c937bde5d2b24f276b59997e5b668bde"
> -BRANCH =3D "lts_2019_08_08"
> -SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D${BRANCH}      =
          \
> -           file://0001-Remove-maes-option-from-cross-compilation.patch  =
      \
> -           file://0002-Add-forgotten-ABSL_HAVE_VDSO_SUPPORT-conditional.=
patch \
> -           file://0003-Add-fPIC-option.patch                            =
      \
> -           file://0001-Add-RISCV-support-to-GetProgramCounter.patch \
> -           file://0001-absl-always-use-asm-sgidefs.h.patch \
> -           file://0001-Fix-build-on-riscv32.patch \
> +PV =3D "20200923+git${SRCPV}"
> +SRCREV =3D "6f9d96a1f41439ac172ee2ef7ccd8edf0e5d068c"
> +BRANCH =3D "lts_2020_09_23"
> +SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D${BRANCH}      =
   \
> +           file://0001-Remove-maes-option-from-cross-compilation.patch \
> +           file://0002-absl-always-use-asm-sgidefs.h.patch             \
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
>              raise bb.parse.SkipRecipe("%s-%s Needs support for corei7 on=
 x86_64" % (pkgn, pkgv))
>
>  }
> -
> --
> 2.25.1
>
