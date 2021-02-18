Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.1846.1613676758821713168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Feb 2021 11:32:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QhtLOGoJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id lw17so3293269pjb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Feb 2021 11:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YQcfS8Gr6zmo18RqOpS1a15C9Txq3tKxPCItHja/7zU=;
        b=QhtLOGoJ1l/7VPF/MWUFjAhz+4Kg6vCD0KcDfBhVrx8kpPLWvgA4Dtb/AAvhNhJ5Yw
         s0Eu8BpfIM52p/XuwiqNnyl1G6YDe+DNXqHpGaS+as0fzqlFGLcO5nbyGgIapkGKfqay
         yPe5Z0AHjj0o7SAtDULSeiKgeAto3ydBwTMRziavA1F+/tP1lK90YWEkLkEtUD3hctGK
         gvElLy0hQoEIsHcl5QqnI/ZNks2/YnAJHc12YFxPnbc9U0SLaQNqnRFzUiggqyJyWbML
         v9EEgg5aLvruW57riRKZ8LX4MlYJGsqKKrbc3SR0RRyJcTKRhxXpRYDKrwk/Mi9sVRVC
         AJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YQcfS8Gr6zmo18RqOpS1a15C9Txq3tKxPCItHja/7zU=;
        b=FmQJVYXRRnw8a/RbE1x+Fh2lo24p7dTjHmb5sgfX5tZhEa+4ZPQuWBPohsekUCP/j4
         idWea1H4UnUE+S1aGLKFVvhN44wbTrFhcoZtJ460n2i2+CXW0qtxy2QHEp3uN12uX8Le
         fTUBMVkoxkNnZp615SMOnuLdgJE4Mh7qyMfgSV5tY4WeOAWpOpn4yzuHCueSWLead/v1
         nqPRyIRFusA9WAhsey0r/65uNUPiIFha5FThkksla6SyNVvzhn5M6AznL8bYEAumxbCR
         aB/fBIUCuQgEbfLLFcSvxu9WHg1F7O0mD7HCe7F8N5uRXokEnModlDpx+u+GMAGaZ95Y
         Kjhw==
X-Gm-Message-State: AOAM530/+yxRrb5GXyoE77lUkA8fcSzDdcpGGdbmBhErF47RKNPXZQ8e
	DpWR+auGmTEPu5V15PFvzQQxGDUx6vwoDw==
X-Google-Smtp-Source: ABdhPJwfNxniiP5jjPKlA3w8Lk5WrbtzalBIXFZ9kvBf3Qr24vf2I1Jajw9GKpMBiNBGkqKD1QZTHg==
X-Received: by 2002:a17:90a:5501:: with SMTP id b1mr5473523pji.57.1613676757724;
        Thu, 18 Feb 2021 11:32:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id a19sm6713675pff.186.2021.02.18.11.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 11:32:37 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v2] python3-grpcio: Upgrade to 1.35.0
Date: Thu, 18 Feb 2021 11:32:34 -0800
Message-Id: <20210218193235.2329864-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0001-Fix-build-on-riscv32.patch, its upstreamed
Forward port rest of the patches
Use OPENSSL_NO_ASM only for armv7+/aarch64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix wrong detection of platform

 .../0001-Fix-build-on-riscv32.patch           | 65 --------------
 ...-Do-not-mix-C-and-C-compiler-options.patch | 86 ++++++++++---------
 .../python/python3-grpcio/boring_ssl.patch    | 36 ++++++++
 .../ppc-boringssl-support.patch               |  4 +-
 .../python3-grpcio/riscv64_support.patch      |  4 +-
 ...cio_1.27.1.bb => python3-grpcio_1.35.0.bb} | 20 +++--
 6 files changed, 98 insertions(+), 117 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/boring_ssl.patch
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.27.1.bb => python3-grpcio_1.35.0.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch
deleted file mode 100644
index 920fc1169d..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 04e28fdda03b545a0f7b446a784ec2fa7249cbb8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 29 Apr 2020 15:37:40 -0700
-Subject: [PATCH] Fix build on riscv32
-
-Define __NR_mmap in terms of __NR_mmap2 and __NR_futex interms of
-__NR_futex_time64 for rv32, since there calls dont exist for rv32
-
-Also recognise rv32 as a new 32bit platform
-
-Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pull/675]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- absl/base/internal/direct_mmap.h        | 5 +++++
- absl/base/internal/spinlock_linux.inc   | 4 ++++
- absl/synchronization/internal/waiter.cc | 4 ++++
- 3 files changed, 13 insertions(+)
-
---- a/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
-+++ b/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
-@@ -26,6 +26,10 @@
-
- #ifdef __linux__
-
-+#if !defined(__NR_mmap) && defined(__riscv) && __riscv_xlen == 32
-+# define __NR_mmap __NR_mmap2
-+#endif
-+
- #include <sys/types.h>
- #ifdef __BIONIC__
- #include <sys/syscall.h>
-@@ -72,6 +76,7 @@ inline void* DirectMmap(void* start, siz
- #if defined(__i386__) || defined(__ARM_ARCH_3__) || defined(__ARM_EABI__) || \
-     (defined(__mips__) && _MIPS_SIM == _MIPS_SIM_ABI32) ||                   \
-     (defined(__PPC__) && !defined(__PPC64__)) ||                             \
-+    (defined(__riscv) && __riscv_xlen == 32)  ||                             \
-     (defined(__s390__) && !defined(__s390x__))
-   // On these architectures, implement mmap with mmap2.
-   static int pagesize = 0;
---- a/third_party/abseil-cpp/absl/base/internal/spinlock_linux.inc
-+++ b/third_party/abseil-cpp/absl/base/internal/spinlock_linux.inc
-@@ -14,6 +14,10 @@
- //
- // This file is a Linux-specific part of spinlock_wait.cc
-
-+#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen == 32
-+# define __NR_futex __NR_futex_time64
-+#endif
-+
- #include <linux/futex.h>
- #include <sys/syscall.h>
- #include <unistd.h>
---- a/third_party/abseil-cpp/absl/synchronization/internal/waiter.cc
-+++ b/third_party/abseil-cpp/absl/synchronization/internal/waiter.cc
-@@ -24,6 +24,10 @@
- #include <unistd.h>
- #endif
-
-+#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen == 32
-+# define __NR_futex __NR_futex_time64
-+#endif
-+
- #ifdef __linux__
- #include <linux/futex.h>
- #include <sys/syscall.h>
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index bff50a0a11..373669461b 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -1,26 +1,18 @@
-From 2ef8a85933f3ac36b289979ff9edd49dd12d0d16 Mon Sep 17 00:00:00 2001
+From de10fbc2386dcac3ab810c49b6977b2ee01bf426 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 4 Aug 2017 09:04:07 -0700
+Date: Wed, 17 Feb 2021 13:30:23 -0800
 Subject: [PATCH] setup.py: Do not mix C and C++ compiler options

 EXTRA_ENV_COMPILE_ARGS is used both with CC and CXX
 so using -std=c++11 or -std=gnu99 together will cause
 build time errors espcially with clang

-error: invalid argument '-std=gnu99' not allowed with 'C++'
-
-gcc7 ( defaults are -std=gnu11 and -std=gnu++14 )
- as well clang default to these standards mode or newer
-anyway
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-1. Keep '-std=c++11' and '-std=gnu99' to fix native build error
+Keep '-std=c++11' to fix native build error
 with old gcc (such as gcc 5.4.0 on ubuntu 16.04), for clang
 we will remove them through GRPC_PYTHON_CFLAGS at do_compile
 in bb recipe.

-2. While export CC="gcc ", cc_args is None, it will
+While export CC="gcc ", cc_args is None, it will
 cause subprocess.Popen always return 1. On centos 8, if you don't
 install package libatomic, there will be a native build error
 `cannot find /usr/lib64/libatomic.so.1.2.0'.
@@ -28,47 +20,57 @@ install package libatomic, there will be a native build error
 Add no harm '-g' to cc_args if cc_args is empty.

 Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- setup.py                      | 6 +++++-
+ setup.py                      | 9 ++++++---
  src/python/grpcio/commands.py | 5 ++++-
- 2 files changed, 9 insertions(+), 2 deletions(-)
+ 2 files changed, 10 insertions(+), 4 deletions(-)

 diff --git a/setup.py b/setup.py
-index e950057..1b68221 100644
+index 4b8c9d4..271b7b1 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -144,9 +144,13 @@ ENABLE_DOCUMENTATION_BUILD = os.environ.get(
-
- def check_linker_need_libatomic():
-   """Test if linker on system needs libatomic."""
-+  compiler, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
-+  if not cc_args:
-+      cc_args = "-g"
+@@ -172,8 +172,11 @@ def check_linker_need_libatomic():
+     """Test if linker on system needs libatomic."""
+     code_test = (b'#include <atomic>\n' +
+                  b'int main() { return std::atomic<int64_t>{}; }')
+-    cxx = os.environ.get('CXX', 'c++')
+-    cpp_test = subprocess.Popen([cxx, '-x', 'c++', '-std=c++11', '-'],
++    cxx, cxx_args = os.environ.get('CXX').split(' ', 1) or 'c++'
++    if not cxx_args:
++      cxx_args = "-g"
 +
-   code_test = (b'#include <atomic>\n' +
-                b'int main() { return std::atomic<int64_t>{}; }')
--  cc_test = subprocess.Popen(['cc', '-x', 'c++', '-std=c++11', '-'],
-+  cc_test = subprocess.Popen([compiler, cc_args, '-x', 'c++', '-std=c++11', '-'],
-                              stdin=PIPE,
-                              stdout=PIPE,
-                              stderr=PIPE)
++    cpp_test = subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-std=c++11', '-'],
+                                 stdin=PIPE,
+                                 stdout=PIPE,
+                                 stderr=PIPE)
+@@ -183,7 +186,7 @@ def check_linker_need_libatomic():
+     # Double-check to see if -latomic actually can solve the problem.
+     # https://github.com/grpc/grpc/issues/22491
+     cpp_test = subprocess.Popen(
+-        [cxx, '-x', 'c++', '-std=c++11', '-latomic', '-'],
++        [cxx, cxx_args, '-x', 'c++', '-std=c++11', '-latomic', '-'],
+         stdin=PIPE,
+         stdout=PIPE,
+         stderr=PIPE)
 diff --git a/src/python/grpcio/commands.py b/src/python/grpcio/commands.py
-index 064dda9..a75d8b9 100644
+index a8b2ff5..b928201 100644
 --- a/src/python/grpcio/commands.py
 +++ b/src/python/grpcio/commands.py
-@@ -216,7 +216,10 @@ class BuildExt(build_ext.build_ext):
-             when invoked in C mode. GCC is okay with this, while clang is not.
+@@ -219,7 +219,10 @@ class BuildExt(build_ext.build_ext):
              """
-             # TODO(lidiz) Remove the generated a.out for success tests.
--            cc_test = subprocess.Popen(['cc', '-x', 'c', '-std=c++11', '-'],
-+            compiler, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
-+            if not cc_args:
-+                cc_args = "-g"
-+            cc_test = subprocess.Popen([compiler, cc_args, '-x', 'c', '-std=c++11', '-'],
-                                        stdin=subprocess.PIPE,
-                                        stdout=subprocess.PIPE,
-                                        stderr=subprocess.PIPE)
+             try:
+                 # TODO(lidiz) Remove the generated a.out for success tests.
+-                cc_test = subprocess.Popen(['cc', '-x', 'c', '-std=c++11', '-'],
++                cc_test, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
++                if not cc_args:
++                    cc_args = "-g"
++                cc_test = subprocess.Popen([cc_test, cc_args, '-x', 'c', '-std=c++11', '-'],
+                                            stdin=subprocess.PIPE,
+                                            stdout=subprocess.PIPE,
+                                            stderr=subprocess.PIPE)
 --
-2.7.4
+2.30.1

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/boring_ssl.patch b/meta-python/recipes-devtools/python/python3-grpcio/boring_ssl.patch
new file mode 100644
index 0000000000..65db4a6ed4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/boring_ssl.patch
@@ -0,0 +1,36 @@
+Do not poke at the build machine to determine target platform or architecture
+pass it from environment instead for cross compiling to work
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/setup.py
++++ b/setup.py
+@@ -109,6 +109,8 @@ CLASSIFIERS = [
+ BUILD_WITH_BORING_SSL_ASM = os.environ.get('GRPC_BUILD_WITH_BORING_SSL_ASM',
+                                            True)
+
++BORING_SSL_PLATFORM = os.environ.get('GRPC_BORING_SSL_PLATFORM',
++                                           True)
+ # Environment variable to determine whether or not the Cython extension should
+ # *use* Cython or use the generated C files. Note that this requires the C files
+ # to have been generated by building first *with* Cython support. Even if this
+@@ -306,15 +308,15 @@ asm_key = ''
+ if BUILD_WITH_BORING_SSL_ASM and not BUILD_WITH_SYSTEM_OPENSSL:
+     LINUX_X86_64 = 'linux-x86_64'
+     LINUX_ARM = 'linux-arm'
+-    if LINUX_X86_64 == util.get_platform():
++    if LINUX_X86_64 == BORING_SSL_PLATFORM:
+         asm_key = 'crypto_linux_x86_64'
+-    elif LINUX_ARM == util.get_platform():
++    elif LINUX_ARM == BORING_SSL_PLATFORM:
+         asm_key = 'crypto_linux_arm'
+-    elif "mac" in util.get_platform() and "x86_64" in util.get_platform():
++    elif "mac" in BORING_SSL_PLATFORM and "x86_64" in BORING_SSL_PLATFORM:
+         asm_key = 'crypto_mac_x86_64'
+     else:
+         print("ASM Builds for BoringSSL currently not supported on:",
+-              util.get_platform())
++              BORING_SSL_PLATFORM)
+ if asm_key:
+     asm_files = grpc_core_dependencies.ASM_SOURCE_FILES[asm_key]
+ else:
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch b/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
index 8ac2aef8c4..dadd3da85e 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
@@ -3,8 +3,8 @@ Let boringSSL compile on ppc32 bit
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>

---- a/third_party/boringssl/include/openssl/base.h
-+++ b/third_party/boringssl/include/openssl/base.h
+--- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
++++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
 @@ -99,6 +99,9 @@ extern "C" {
  #elif (defined(__PPC64__) || defined(__powerpc64__)) && defined(_LITTLE_ENDIAN)
  #define OPENSSL_64_BIT
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
index 8c9ffa21b7..7e071ae1e6 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
@@ -2,8 +2,8 @@ Add RISC-V 64bit support

 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/third_party/boringssl/include/openssl/base.h
-+++ b/third_party/boringssl/include/openssl/base.h
+--- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
++++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
 @@ -108,6 +108,14 @@ extern "C" {
  #elif defined(__mips__) && defined(__LP64__)
  #define OPENSSL_64_BIT
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
index 129bb35bcc..2c137f6ce7 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
@@ -9,10 +9,9 @@ DEPENDS += "${PYTHON_PN}-protobuf"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 SRC_URI_append_class-target = " file://ppc-boringssl-support.patch \
                                 file://riscv64_support.patch \
-                                file://0001-Fix-build-on-riscv32.patch \
+                                file://boring_ssl.patch \
 "
-SRC_URI[md5sum] = "ccaf4e7eb4f031d926fb80035d193b98"
-SRC_URI[sha256sum] = "a899725d34769a498ecd3be154021c4368dd22bdc69473f6ec46779696f626c4"
+SRC_URI[sha256sum] = "7bd0ebbb14dde78bf66a1162efd29d3393e4e943952e2f339757aa48a184645c"

 RDEPENDS_${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
@@ -24,9 +23,18 @@ inherit pypi

 export GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY = "1"

-do_compile_prepend_toolchain-clang() {
-    export GRPC_PYTHON_CFLAGS='-fvisibility=hidden -fno-wrapv -fno-exceptions'
-}
+BORING_SSL_PLATFORM_arm = "linux-arm"
+BORING_SSL_PLATFORM_x86-64 = "linux-x86_64"
+BORING_SSL_PLATFORM ?= "unsupported"
+export GRPC_BORING_SSL_PLATFORM = "${BORING_SSL_PLATFORM}"
+
+BORING_SSL_x86-64 = "1"
+BORING_SSL_arm = "1"
+BORING_SSL ?= "0"
+export GRPC_BUILD_WITH_BORING_SSL_ASM = "${BORING_SSL}"
+
+GRPC_CFLAGS_append_toolchain-clang = " -fvisibility=hidden -fno-wrapv -fno-exceptions"
+export GRPC_PYTHON_CFLAGS = "${GRPC_CFLAGS}"

 CLEANBROKEN = "1"

--
2.30.1
