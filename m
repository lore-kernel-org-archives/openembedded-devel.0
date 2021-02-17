Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.992.1613599103972040324
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Feb 2021 13:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o7+6arBS;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id t26so9380594pgv.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Feb 2021 13:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+UEkhoxRK1yEetqIrNEDyfG3aMr7IFXhCiEmZdW8sbs=;
        b=o7+6arBS7/27CC7kYjXStnnv/DITxZ8TV4lS8NMlj86tCuVS0DB8wWPK6AveWNpnwv
         Bd3DNKBodbUSDKyPJbUMMM/FZs9RTL/+oRWzThJgUlCH+777N+yf5rkxREaCVHyOajbR
         twvfMnHwIwX1PVeBk68XTyuRiIVyhQyZa18frbuQnZwQCrCRtJdzCLogctAzz5IxyhFZ
         4ry/9DeDMGsgH4A34RCio7A1P8jjcydpt51OPs0C3PKXDLsxJcrB9n0/mCVdogOjvz1M
         xZHb9qbgFr5rjlcQuhv+0VDdwuP3UckHGfpI7NAKmPlLhQmH3ez51PM7b65jgn3dvOuB
         07ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+UEkhoxRK1yEetqIrNEDyfG3aMr7IFXhCiEmZdW8sbs=;
        b=nXHPL3rxIO99PelaFbSbs91Ztac0QXpYPJGssmDS+VIjazMIx2t4saIgtomJPZ2Ru9
         /+RIgFcdsyIF+bwH3sJg5zn4bIeNyAgHFzBAfgb59TUoAEdnisLf8B3z46BhSNdxAnAv
         G0CiFv2iQu6eMGSkiP/hePoQ7KV67nmS//vjiU1zpL4Y9nBNWtNBFwX/WOLl7kDkuypj
         7vdlbBWPSobAMmdyqywYns4XcMBqF5jgaGD+zECEzv9OQQDufjAwWqDNANW4kjt30vLf
         C2jdfer8Yagrr4W6n3p+s1STK4qjtDzSSORodf+AopnrPEUvQWLGWSkt8YssdVYS6+zi
         wefg==
X-Gm-Message-State: AOAM532jE+znw9Gc2V8IZdjdrtvj8oG94Ib+ZSI3jbfGNa70YfopPFGg
	0RJhnbY/31hiUyrTMf8ToPYB+wD7j45QIQ==
X-Google-Smtp-Source: ABdhPJxnzMZcTJln8fWXvEaeTEK6DeYnKFJI8KmNfda6bBjhajEgwqy6bW37peLL2BsZPUMpZIM+0A==
X-Received: by 2002:a05:6a00:1507:b029:1e4:d81:5586 with SMTP id q7-20020a056a001507b02901e40d815586mr1234577pfu.53.1613599102804;
        Wed, 17 Feb 2021 13:58:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id q13sm3443474pfg.155.2021.02.17.13.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 13:58:22 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-grpcio: Upgrade to 1.35.0
Date: Wed, 17 Feb 2021 13:58:19 -0800
Message-Id: <20210217215820.3761256-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0001-Fix-build-on-riscv32.patch, its upstreamed
Forward port rest of the patches
Use OPENSSL_NO_ASM with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-build-on-riscv32.patch           | 65 --------------
 ...-Do-not-mix-C-and-C-compiler-options.patch | 86 ++++++++++---------
 .../ppc-boringssl-support.patch               |  4 +-
 .../python3-grpcio/riscv64_support.patch      |  4 +-
 ...cio_1.27.1.bb => python3-grpcio_1.35.0.bb} |  9 +-
 5 files changed, 53 insertions(+), 115 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.27.1.bb => python3-grpcio_1.35.0.bb} (75%)

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
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
index 129bb35bcc..198f548fa7 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
@@ -9,10 +9,8 @@ DEPENDS += "${PYTHON_PN}-protobuf"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 SRC_URI_append_class-target = " file://ppc-boringssl-support.patch \
                                 file://riscv64_support.patch \
-                                file://0001-Fix-build-on-riscv32.patch \
 "
-SRC_URI[md5sum] = "ccaf4e7eb4f031d926fb80035d193b98"
-SRC_URI[sha256sum] = "a899725d34769a498ecd3be154021c4368dd22bdc69473f6ec46779696f626c4"
+SRC_URI[sha256sum] = "7bd0ebbb14dde78bf66a1162efd29d3393e4e943952e2f339757aa48a184645c"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
@@ -24,8 +22,11 @@ inherit pypi
 
 export GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY = "1"
 
+# Disable asm in openssl due to use of gnu asm see
+# third_party/boringssl-with-bazel/src/crypto/hrss/asm/poly_rq_mul.S
+# this can only compile with gcc
 do_compile_prepend_toolchain-clang() {
-    export GRPC_PYTHON_CFLAGS='-fvisibility=hidden -fno-wrapv -fno-exceptions'
+    export GRPC_PYTHON_CFLAGS='-fvisibility=hidden -fno-wrapv -fno-exceptions -DOPENSSL_NO_ASM'
 }
 
 CLEANBROKEN = "1"
-- 
2.30.1

