Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.5016.1614160602569250907
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 01:56:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i83//wYn;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: peron.clem@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id lr13so1977620ejb.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Feb 2021 01:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TJCzTAc074Duo39ZX8ESKMZDvNL6XDeXv/meKMaJPoI=;
        b=i83//wYnD9vpysXpJQ4fu3djfUxzOg6dgAxTN/woFfsuHOh9+88Xp9W9oPxH0WEwv+
         m89w3D2phWjX+3OGJVNdNOnuEi9a36XfS1QwrNOlL5+mfdoGcZR539cFiX0w263oH4Ts
         A87gxGiVTt3H6mOjKO/0DiD6c/0odkHtss0ubgIwHsTNbf5xc/mtYpSr/18tHDEhHlwU
         ZQ6EE34ugc8qeH3DK9UUL7hYqtYKuRXFTZlem70BwbqhPRiw5nvg2/08fJ7l4dP/lu6i
         PHkz8OBeodEr4V+T+GU6UlNIQlSXrv79TjXeCxPd5jPx8wz0nSeyhCCsLTrHXxfMtrjD
         5ZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TJCzTAc074Duo39ZX8ESKMZDvNL6XDeXv/meKMaJPoI=;
        b=tRZcwYuw4xSXb7TaoGHQWGTvDr4cRih7NdxSIi2029RurzC5LEp0pqwK9KtB8fHYLG
         tYBODU1EezgzKjTPUpl49x7ZXz/5s+TFVoK/GEuPs/7z810+kr8GMMRGzcrLkL6AI3pm
         TOWUn1w0B7zQmVwTGPwVi1bvpvv4OyhpDM9XwCrhNTSnJPhbhc5ceKVE+/ylwA9ODTG6
         j1evWcpYhGRfRXTggpHbAB27umpy3xipQgSGObc5L8lRweKCfyg4pftG7HWaZuDakcWn
         nI3DjVkxeDl1/UZmpFcR8jrgF5Nwwa5Wsg+A2UNMGGppaHK4AIdN3VtgtMpWMKZQD+0F
         guFg==
X-Gm-Message-State: AOAM531mibQmc004Eaxb+Ukjqqs/zxmJvt/86JrFZ9gxUBh9lwcytNyj
	NP2IAdM0pEXHsAKXJ1r+fdIArgunc2cLtMuQiWY=
X-Google-Smtp-Source: ABdhPJyBUlHc/vhCzDjBW9MQnazW3Ufs1T99FigTvZgoN+OOKOmCA6Rm2R01cZMOGokITDmBk2dUCp4Y05NuCKvGIfE=
X-Received: by 2002:a17:906:70d4:: with SMTP id g20mr30759714ejk.361.1614160600741;
 Wed, 24 Feb 2021 01:56:40 -0800 (PST)
MIME-Version: 1.0
References: <20210218193235.2329864-1-raj.khem@gmail.com> <CAJiuCcfbRUjtzNzTzrw6EUEo3SOscrkunFTGESp11pspfY8Yjw@mail.gmail.com>
 <CAMKF1soynA+3Mf5hNQtq3YzPr073nL-yo+Z8swRxi5E3-+EpsA@mail.gmail.com>
In-Reply-To: <CAMKF1soynA+3Mf5hNQtq3YzPr073nL-yo+Z8swRxi5E3-+EpsA@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 24 Feb 2021 10:56:29 +0100
Message-ID: <CAJiuCceVQ4gLJJ7WQBXDiwKLh3q_A33ypTp33o0XWa_j4_-qDQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2] python3-grpcio: Upgrade to 1.35.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Tue, 23 Feb 2021 at 16:56, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Feb 23, 2021 at 2:59 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmai=
l.com> wrote:
> >
> > Hi Khem,
> >
> > On Thu, 18 Feb 2021 at 20:32, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Drop 0001-Fix-build-on-riscv32.patch, its upstreamed
> > > Forward port rest of the patches
> > > Use OPENSSL_NO_ASM only for armv7+/aarch64
> >
> > Should we not also enable these flags?:
> > GRPC_PYTHON_BUILD_SYSTEM_RE2
> > GRPC_PYTHON_BUILD_SYSTEM_CARES
> > GRPC_PYTHON_BUILD_SYSTEM_ZLIB
> >
> > To avoid building a different version of RE2/C-Ares of Zlib than the
> > one built by the system ?
> >
>
> perhaps we should  please test such a change and submit if it works

Ok I will test and send a patch if it works.

But actually i'm stuck with the gRPC bump to 1.35.0 that trig an error due=
 to :
The imported target "gRPC::grpc_cpp_plugin" references the file
|
|      "/xxxx/recipe-sysroot/usr/bin/grpc_cpp_plugin"
|
|   but this file does not exist.  Possible reasons include:
|
|   * The file was deleted, renamed, or moved to another location.
|
|   * An install or uninstall procedure did not complete successfully.
|
|   * The installation package was faulty and contained

I would also like to add a grpc-helloworld app example but I don't
know how to fix this issue :(

This error is coming from the
find_package(gRPC CONFIG REQUIRED)
https://github.com/grpc/grpc/blob/master/examples/cpp/cmake/common.cmake#L=
114

Regards,
Clement


>
> > Regards,
> > Clement
> >
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > v2: Fix wrong detection of platform
> > >
> > >  .../0001-Fix-build-on-riscv32.patch           | 65 --------------
> > >  ...-Do-not-mix-C-and-C-compiler-options.patch | 86 ++++++++++------=
---
> > >  .../python/python3-grpcio/boring_ssl.patch    | 36 ++++++++
> > >  .../ppc-boringssl-support.patch               |  4 +-
> > >  .../python3-grpcio/riscv64_support.patch      |  4 +-
> > >  ...cio_1.27.1.bb =3D> python3-grpcio_1.35.0.bb} | 20 +++--
> > >  6 files changed, 98 insertions(+), 117 deletions(-)
> > >  delete mode 100644 meta-python/recipes-devtools/python/python3-grpc=
io/0001-Fix-build-on-riscv32.patch
> > >  create mode 100644 meta-python/recipes-devtools/python/python3-grpc=
io/boring_ssl.patch
> > >  rename meta-python/recipes-devtools/python/{python3-grpcio_1.27.1.b=
b =3D> python3-grpcio_1.35.0.bb} (55%)
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001=
-Fix-build-on-riscv32.patch b/meta-python/recipes-devtools/python/python3-g=
rpcio/0001-Fix-build-on-riscv32.patch
> > > deleted file mode 100644
> > > index 920fc1169d..0000000000
> > > --- a/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-bu=
ild-on-riscv32.patch
> > > +++ /dev/null
> > > @@ -1,65 +0,0 @@
> > > -From 04e28fdda03b545a0f7b446a784ec2fa7249cbb8 Mon Sep 17 00:00:00 2=
001
> > > -From: Khem Raj <raj.khem@gmail.com>
> > > -Date: Wed, 29 Apr 2020 15:37:40 -0700
> > > -Subject: [PATCH] Fix build on riscv32
> > > -
> > > -Define __NR_mmap in terms of __NR_mmap2 and __NR_futex interms of
> > > -__NR_futex_time64 for rv32, since there calls dont exist for rv32
> > > -
> > > -Also recognise rv32 as a new 32bit platform
> > > -
> > > -Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pu=
ll/675]
> > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ----
> > > - absl/base/internal/direct_mmap.h        | 5 +++++
> > > - absl/base/internal/spinlock_linux.inc   | 4 ++++
> > > - absl/synchronization/internal/waiter.cc | 4 ++++
> > > - 3 files changed, 13 insertions(+)
> > > -
> > > ---- a/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
> > > -+++ b/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
> > > -@@ -26,6 +26,10 @@
> > > -
> > > - #ifdef __linux__
> > > -
> > > -+#if !defined(__NR_mmap) && defined(__riscv) && __riscv_xlen =3D=3D=
 32
> > > -+# define __NR_mmap __NR_mmap2
> > > -+#endif
> > > -+
> > > - #include <sys/types.h>
> > > - #ifdef __BIONIC__
> > > - #include <sys/syscall.h>
> > > -@@ -72,6 +76,7 @@ inline void* DirectMmap(void* start, siz
> > > - #if defined(__i386__) || defined(__ARM_ARCH_3__) || defined(__ARM_=
EABI__) || \
> > > -     (defined(__mips__) && _MIPS_SIM =3D=3D _MIPS_SIM_ABI32) ||    =
               \
> > > -     (defined(__PPC__) && !defined(__PPC64__)) ||                  =
           \
> > > -+    (defined(__riscv) && __riscv_xlen =3D=3D 32)  ||              =
               \
> > > -     (defined(__s390__) && !defined(__s390x__))
> > > -   // On these architectures, implement mmap with mmap2.
> > > -   static int pagesize =3D 0;
> > > ---- a/third_party/abseil-cpp/absl/base/internal/spinlock_linux.inc
> > > -+++ b/third_party/abseil-cpp/absl/base/internal/spinlock_linux.inc
> > > -@@ -14,6 +14,10 @@
> > > - //
> > > - // This file is a Linux-specific part of spinlock_wait.cc
> > > -
> > > -+#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen =3D=
=3D 32
> > > -+# define __NR_futex __NR_futex_time64
> > > -+#endif
> > > -+
> > > - #include <linux/futex.h>
> > > - #include <sys/syscall.h>
> > > - #include <unistd.h>
> > > ---- a/third_party/abseil-cpp/absl/synchronization/internal/waiter.c=
c
> > > -+++ b/third_party/abseil-cpp/absl/synchronization/internal/waiter.c=
c
> > > -@@ -24,6 +24,10 @@
> > > - #include <unistd.h>
> > > - #endif
> > > -
> > > -+#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen =3D=
=3D 32
> > > -+# define __NR_futex __NR_futex_time64
> > > -+#endif
> > > -+
> > > - #ifdef __linux__
> > > - #include <linux/futex.h>
> > > - #include <sys/syscall.h>
> > > diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001=
-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-d=
evtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-opt=
ions.patch
> > > index bff50a0a11..373669461b 100644
> > > --- a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.=
py-Do-not-mix-C-and-C-compiler-options.patch
> > > +++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.=
py-Do-not-mix-C-and-C-compiler-options.patch
> > > @@ -1,26 +1,18 @@
> > > -From 2ef8a85933f3ac36b289979ff9edd49dd12d0d16 Mon Sep 17 00:00:00 2=
001
> > > +From de10fbc2386dcac3ab810c49b6977b2ee01bf426 Mon Sep 17 00:00:00 2=
001
> > >  From: Khem Raj <raj.khem@gmail.com>
> > > -Date: Fri, 4 Aug 2017 09:04:07 -0700
> > > +Date: Wed, 17 Feb 2021 13:30:23 -0800
> > >  Subject: [PATCH] setup.py: Do not mix C and C++ compiler options
> > >
> > >  EXTRA_ENV_COMPILE_ARGS is used both with CC and CXX
> > >  so using -std=3Dc++11 or -std=3Dgnu99 together will cause
> > >  build time errors espcially with clang
> > >
> > > -error: invalid argument '-std=3Dgnu99' not allowed with 'C++'
> > > -
> > > -gcc7 ( defaults are -std=3Dgnu11 and -std=3Dgnu++14 )
> > > - as well clang default to these standards mode or newer
> > > -anyway
> > > -
> > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > -
> > > -1. Keep '-std=3Dc++11' and '-std=3Dgnu99' to fix native build error
> > > +Keep '-std=3Dc++11' to fix native build error
> > >  with old gcc (such as gcc 5.4.0 on ubuntu 16.04), for clang
> > >  we will remove them through GRPC_PYTHON_CFLAGS at do_compile
> > >  in bb recipe.
> > >
> > > -2. While export CC=3D"gcc ", cc_args is None, it will
> > > +While export CC=3D"gcc ", cc_args is None, it will
> > >  cause subprocess.Popen always return 1. On centos 8, if you don't
> > >  install package libatomic, there will be a native build error
> > >  `cannot find /usr/lib64/libatomic.so.1.2.0'.
> > > @@ -28,47 +20,57 @@ install package libatomic, there will be a nativ=
e build error
> > >  Add no harm '-g' to cc_args if cc_args is empty.
> > >
> > >  Upstream-Status: Inappropriate [oe specific]
> > > +
> > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > >  ---
> > > - setup.py                      | 6 +++++-
> > > + setup.py                      | 9 ++++++---
> > >   src/python/grpcio/commands.py | 5 ++++-
> > > - 2 files changed, 9 insertions(+), 2 deletions(-)
> > > + 2 files changed, 10 insertions(+), 4 deletions(-)
> > >
> > >  diff --git a/setup.py b/setup.py
> > > -index e950057..1b68221 100644
> > > +index 4b8c9d4..271b7b1 100644
> > >  --- a/setup.py
> > >  +++ b/setup.py
> > > -@@ -144,9 +144,13 @@ ENABLE_DOCUMENTATION_BUILD =3D os.environ.get(
> > > -
> > > - def check_linker_need_libatomic():
> > > -   """Test if linker on system needs libatomic."""
> > > -+  compiler, cc_args =3D os.environ.get('CC').split(' ', 1) or 'gcc=
'
> > > -+  if not cc_args:
> > > -+      cc_args =3D "-g"
> > > +@@ -172,8 +172,11 @@ def check_linker_need_libatomic():
> > > +     """Test if linker on system needs libatomic."""
> > > +     code_test =3D (b'#include <atomic>\n' +
> > > +                  b'int main() { return std::atomic<int64_t>{}; }')
> > > +-    cxx =3D os.environ.get('CXX', 'c++')
> > > +-    cpp_test =3D subprocess.Popen([cxx, '-x', 'c++', '-std=3Dc++11=
', '-'],
> > > ++    cxx, cxx_args =3D os.environ.get('CXX').split(' ', 1) or 'c++'
> > > ++    if not cxx_args:
> > > ++      cxx_args =3D "-g"
> > >  +
> > > -   code_test =3D (b'#include <atomic>\n' +
> > > -                b'int main() { return std::atomic<int64_t>{}; }')
> > > --  cc_test =3D subprocess.Popen(['cc', '-x', 'c++', '-std=3Dc++11',=
 '-'],
> > > -+  cc_test =3D subprocess.Popen([compiler, cc_args, '-x', 'c++', '-=
std=3Dc++11', '-'],
> > > -                              stdin=3DPIPE,
> > > -                              stdout=3DPIPE,
> > > -                              stderr=3DPIPE)
> > > ++    cpp_test =3D subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-s=
td=3Dc++11', '-'],
> > > +                                 stdin=3DPIPE,
> > > +                                 stdout=3DPIPE,
> > > +                                 stderr=3DPIPE)
> > > +@@ -183,7 +186,7 @@ def check_linker_need_libatomic():
> > > +     # Double-check to see if -latomic actually can solve the probl=
em.
> > > +     # https://github.com/grpc/grpc/issues/22491
> > > +     cpp_test =3D subprocess.Popen(
> > > +-        [cxx, '-x', 'c++', '-std=3Dc++11', '-latomic', '-'],
> > > ++        [cxx, cxx_args, '-x', 'c++', '-std=3Dc++11', '-latomic', '=
-'],
> > > +         stdin=3DPIPE,
> > > +         stdout=3DPIPE,
> > > +         stderr=3DPIPE)
> > >  diff --git a/src/python/grpcio/commands.py b/src/python/grpcio/comm=
ands.py
> > > -index 064dda9..a75d8b9 100644
> > > +index a8b2ff5..b928201 100644
> > >  --- a/src/python/grpcio/commands.py
> > >  +++ b/src/python/grpcio/commands.py
> > > -@@ -216,7 +216,10 @@ class BuildExt(build_ext.build_ext):
> > > -             when invoked in C mode. GCC is okay with this, while c=
lang is not.
> > > +@@ -219,7 +219,10 @@ class BuildExt(build_ext.build_ext):
> > >               """
> > > -             # TODO(lidiz) Remove the generated a.out for success t=
ests.
> > > --            cc_test =3D subprocess.Popen(['cc', '-x', 'c', '-std=
=3Dc++11', '-'],
> > > -+            compiler, cc_args =3D os.environ.get('CC').split(' ', =
1) or 'gcc'
> > > -+            if not cc_args:
> > > -+                cc_args =3D "-g"
> > > -+            cc_test =3D subprocess.Popen([compiler, cc_args, '-x',=
 'c', '-std=3Dc++11', '-'],
> > > -                                        stdin=3Dsubprocess.PIPE,
> > > -                                        stdout=3Dsubprocess.PIPE,
> > > -                                        stderr=3Dsubprocess.PIPE)
> > > +             try:
> > > +                 # TODO(lidiz) Remove the generated a.out for succe=
ss tests.
> > > +-                cc_test =3D subprocess.Popen(['cc', '-x', 'c', '-s=
td=3Dc++11', '-'],
> > > ++                cc_test, cc_args =3D os.environ.get('CC').split(' =
', 1) or 'gcc'
> > > ++                if not cc_args:
> > > ++                    cc_args =3D "-g"
> > > ++                cc_test =3D subprocess.Popen([cc_test, cc_args, '-=
x', 'c', '-std=3Dc++11', '-'],
> > > +                                            stdin=3Dsubprocess.PIPE=
,
> > > +                                            stdout=3Dsubprocess.PIP=
E,
> > > +                                            stderr=3Dsubprocess.PIP=
E)
> > >  --
> > > -2.7.4
> > > +2.30.1
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python3-grpcio/bori=
ng_ssl.patch b/meta-python/recipes-devtools/python/python3-grpcio/boring_ss=
l.patch
> > > new file mode 100644
> > > index 0000000000..65db4a6ed4
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python3-grpcio/boring_ssl.=
patch
> > > @@ -0,0 +1,36 @@
> > > +Do not poke at the build machine to determine target platform or ar=
chitecture
> > > +pass it from environment instead for cross compiling to work
> > > +
> > > +Upstream-Status: Inappropriate [OE-Specific]
> > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > +--- a/setup.py
> > > ++++ b/setup.py
> > > +@@ -109,6 +109,8 @@ CLASSIFIERS =3D [
> > > + BUILD_WITH_BORING_SSL_ASM =3D os.environ.get('GRPC_BUILD_WITH_BORI=
NG_SSL_ASM',
> > > +                                            True)
> > > +
> > > ++BORING_SSL_PLATFORM =3D os.environ.get('GRPC_BORING_SSL_PLATFORM',
> > > ++                                           True)
> > > + # Environment variable to determine whether or not the Cython exte=
nsion should
> > > + # *use* Cython or use the generated C files. Note that this requir=
es the C files
> > > + # to have been generated by building first *with* Cython support. =
Even if this
> > > +@@ -306,15 +308,15 @@ asm_key =3D ''
> > > + if BUILD_WITH_BORING_SSL_ASM and not BUILD_WITH_SYSTEM_OPENSSL:
> > > +     LINUX_X86_64 =3D 'linux-x86_64'
> > > +     LINUX_ARM =3D 'linux-arm'
> > > +-    if LINUX_X86_64 =3D=3D util.get_platform():
> > > ++    if LINUX_X86_64 =3D=3D BORING_SSL_PLATFORM:
> > > +         asm_key =3D 'crypto_linux_x86_64'
> > > +-    elif LINUX_ARM =3D=3D util.get_platform():
> > > ++    elif LINUX_ARM =3D=3D BORING_SSL_PLATFORM:
> > > +         asm_key =3D 'crypto_linux_arm'
> > > +-    elif "mac" in util.get_platform() and "x86_64" in util.get_pla=
tform():
> > > ++    elif "mac" in BORING_SSL_PLATFORM and "x86_64" in BORING_SSL_P=
LATFORM:
> > > +         asm_key =3D 'crypto_mac_x86_64'
> > > +     else:
> > > +         print("ASM Builds for BoringSSL currently not supported on=
:",
> > > +-              util.get_platform())
> > > ++              BORING_SSL_PLATFORM)
> > > + if asm_key:
> > > +     asm_files =3D grpc_core_dependencies.ASM_SOURCE_FILES[asm_key]
> > > + else:
> > > diff --git a/meta-python/recipes-devtools/python/python3-grpcio/ppc-=
boringssl-support.patch b/meta-python/recipes-devtools/python/python3-grpci=
o/ppc-boringssl-support.patch
> > > index 8ac2aef8c4..dadd3da85e 100644
> > > --- a/meta-python/recipes-devtools/python/python3-grpcio/ppc-borings=
sl-support.patch
> > > +++ b/meta-python/recipes-devtools/python/python3-grpcio/ppc-borings=
sl-support.patch
> > > @@ -3,8 +3,8 @@ Let boringSSL compile on ppc32 bit
> > >  Upstream-Status: Pending
> > >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >
> > > ---- a/third_party/boringssl/include/openssl/base.h
> > > -+++ b/third_party/boringssl/include/openssl/base.h
> > > +--- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
> > > ++++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
> > >  @@ -99,6 +99,9 @@ extern "C" {
> > >   #elif (defined(__PPC64__) || defined(__powerpc64__)) && defined(_L=
ITTLE_ENDIAN)
> > >   #define OPENSSL_64_BIT
> > > diff --git a/meta-python/recipes-devtools/python/python3-grpcio/risc=
v64_support.patch b/meta-python/recipes-devtools/python/python3-grpcio/risc=
v64_support.patch
> > > index 8c9ffa21b7..7e071ae1e6 100644
> > > --- a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_sup=
port.patch
> > > +++ b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_sup=
port.patch
> > > @@ -2,8 +2,8 @@ Add RISC-V 64bit support
> > >
> > >  Upstream-Status: Pending
> > >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---- a/third_party/boringssl/include/openssl/base.h
> > > -+++ b/third_party/boringssl/include/openssl/base.h
> > > +--- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
> > > ++++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
> > >  @@ -108,6 +108,14 @@ extern "C" {
> > >   #elif defined(__mips__) && defined(__LP64__)
> > >   #define OPENSSL_64_BIT
> > > diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.27=
.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
> > > similarity index 55%
> > > rename from meta-python/recipes-devtools/python/python3-grpcio_1.27.=
1.bb
> > > rename to meta-python/recipes-devtools/python/python3-grpcio_1.35.0.=
bb
> > > index 129bb35bcc..2c137f6ce7 100644
> > > --- a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
> > > +++ b/meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
> > > @@ -9,10 +9,9 @@ DEPENDS +=3D "${PYTHON_PN}-protobuf"
> > >  SRC_URI +=3D "file://0001-setup.py-Do-not-mix-C-and-C-compiler-opti=
ons.patch"
> > >  SRC_URI_append_class-target =3D " file://ppc-boringssl-support.patc=
h \
> > >                                  file://riscv64_support.patch \
> > > -                                file://0001-Fix-build-on-riscv32.pa=
tch \
> > > +                                file://boring_ssl.patch \
> > >  "
> > > -SRC_URI[md5sum] =3D "ccaf4e7eb4f031d926fb80035d193b98"
> > > -SRC_URI[sha256sum] =3D "a899725d34769a498ecd3be154021c4368dd22bdc69=
473f6ec46779696f626c4"
> > > +SRC_URI[sha256sum] =3D "7bd0ebbb14dde78bf66a1162efd29d3393e4e943952=
e2f339757aa48a184645c"
> > >
> > >  RDEPENDS_${PN} =3D "${PYTHON_PN}-protobuf \
> > >                    ${PYTHON_PN}-setuptools \
> > > @@ -24,9 +23,18 @@ inherit pypi
> > >
> > >  export GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY =3D "1"
> > >
> > > -do_compile_prepend_toolchain-clang() {
> > > -    export GRPC_PYTHON_CFLAGS=3D'-fvisibility=3Dhidden -fno-wrapv -=
fno-exceptions'
> > > -}
> > > +BORING_SSL_PLATFORM_arm =3D "linux-arm"
> > > +BORING_SSL_PLATFORM_x86-64 =3D "linux-x86_64"
> > > +BORING_SSL_PLATFORM ?=3D "unsupported"
> > > +export GRPC_BORING_SSL_PLATFORM =3D "${BORING_SSL_PLATFORM}"
> > > +
> > > +BORING_SSL_x86-64 =3D "1"
> > > +BORING_SSL_arm =3D "1"
> > > +BORING_SSL ?=3D "0"
> > > +export GRPC_BUILD_WITH_BORING_SSL_ASM =3D "${BORING_SSL}"
> > > +
> > > +GRPC_CFLAGS_append_toolchain-clang =3D " -fvisibility=3Dhidden -fno=
-wrapv -fno-exceptions"
> > > +export GRPC_PYTHON_CFLAGS =3D "${GRPC_CFLAGS}"
> > >
> > >  CLEANBROKEN =3D "1"
> > >
> > > --
> > > 2.30.1
> > >
> > >=20
> > >
