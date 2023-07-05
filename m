Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F79EB64DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 17:26:04 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.1040.1688577955104663034
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jul 2023 10:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AedySfX8;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-55b66ca1c80so2568328a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 10:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688577954; x=1691169954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDrp5hxKeEMso1/L5ribax1tC2oe6PBhT9wrqanr5+4=;
        b=AedySfX81WIC1R6FDdvYVobwV9YLpGBy9n+EmVMsAME7wSbLprnmXRg0dlQo841YU/
         VD7pwNnoGHbeAUzc4f7hqAYURGPb72vJ5WVkqbOlGQjhw3wBlZYk6tjVmC1EHkPYFJY0
         L12K7wgKZeMwmk0mHQ831XvxtCEPKtO41PoXI9jqLRIFhjM5wgXVtEArVFJJ1zbIro1b
         nlQAJUsNpfrEGd+30Mo4r4nUGnrZBHsQUXfmR1UPeSHL/VFeG5C3cVnSaQZH7BrfzHzV
         EMI4DnoCALMjOuHPFCI/N9xwjL+WRcYEDhqIICEeNaKyNhp2H/HKl/x9bL2l/Wu2Wico
         pt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688577954; x=1691169954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDrp5hxKeEMso1/L5ribax1tC2oe6PBhT9wrqanr5+4=;
        b=SI/LM1Gqsm9lk+Oru+LbOQiSqdnfHNNZ0TbuPAoqvmcjItrH3bKS4b6Ag1DY7JoXGX
         AkgvHFOACM3e2tjWaDzx7dQq4IgCeNcSFoQg9Ldj9UHx3ocW6ENfgmFht+lxWyCOabgD
         OCllU4/gx57yxepRXBQMiARTklwDMWHvk2lnDkNE4PL5+D/MtJllp2Tu/6BhGkramIFN
         l4V0YZU3UqYBtJ6c6XKvBzbIA3Igxr8hAmdgZEwZdtFqZhgWVfYbjx1/79vz0SLGQP8Z
         nbyAX5XdpGt3NZ6DqFlAt3MUw8iDmG01/jEuV25SO8lAOz5RMbSpIxscHJ7a65BTYUBd
         2CDQ==
X-Gm-Message-State: ABy/qLaWj48rtwGTr293jAjq/pEC/PfDba0isL4ZNZLTYVENbGtMs+H2
	PCtQsdjEFV7fzffWlPl+hPL5/d3CDTY=
X-Google-Smtp-Source: APBJJlGfIcW0p9bYHtsv6WFrFLX2j8byp1GPfKvEWH1EuUsMZkIprZW5foMW22rdKfppg0BSkisrfA==
X-Received: by 2002:a05:6a20:7f92:b0:12f:8bf8:69e1 with SMTP id d18-20020a056a207f9200b0012f8bf869e1mr2695083pzj.41.1688577954083;
        Wed, 05 Jul 2023 10:25:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::81d4])
        by smtp.gmail.com with ESMTPSA id w6-20020aa78586000000b0067b384d5955sm13869174pfn.26.2023.07.05.10.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 10:25:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-grpcio: Upgrade to 1.56.0
Date: Wed,  5 Jul 2023 10:25:48 -0700
Message-ID: <20230705172550.3371930-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705172550.3371930-1-raj.khem@gmail.com>
References: <20230705172550.3371930-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 17:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103669

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-grpcio-tools_1.51.1.bb     | 19 -------
 ...-Do-not-mix-C-and-C-compiler-options.patch | 16 ++----
 .../python3-grpcio/abseil-ppc-fixes.patch     | 37 +++++---------
 .../python/python3-grpcio/boring_ssl.patch    | 50 -------------------
 .../ppc-boringssl-support.patch               |  8 +--
 ...cio_1.51.1.bb => python3-grpcio_1.56.0.bb} |  8 +--
 6 files changed, 27 insertions(+), 111 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/boring_ssl.patch
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.51.1.bb => python3-grpcio_1.56.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.1.bb
deleted file mode 100644
index c1dbde1c9a..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Google gRPC tools"
-HOMEPAGE = "http://www.grpc.io/"
-SECTION = "devel/python"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
-
-inherit pypi setuptools3
-
-DEPENDS += "${PYTHON_PN}-grpcio"
-
-SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
-            file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
-            "
-SRC_URI[sha256sum] = "8e62d23d3fed9d4f81738f98dd193dbd2e21aed4a8f0dd715e75b5439e649727"
-
-RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index 1f465dbb6e..13911ddcf3 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -29,11 +29,9 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  src/python/grpcio/commands.py |  5 ++++-
  2 files changed, 11 insertions(+), 5 deletions(-)
 
-diff --git a/setup.py b/setup.py
-index 3a50c97..bb2386d 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -205,8 +205,11 @@ def check_linker_need_libatomic():
+@@ -206,8 +206,11 @@ def check_linker_need_libatomic():
      """Test if linker on system needs libatomic."""
      code_test = (b'#include <atomic>\n' +
                   b'int main() { return std::atomic<int64_t>{}; }')
@@ -47,7 +45,7 @@ index 3a50c97..bb2386d 100644
                                  stdin=PIPE,
                                  stdout=PIPE,
                                  stderr=PIPE)
-@@ -215,8 +218,8 @@ def check_linker_need_libatomic():
+@@ -216,8 +219,8 @@ def check_linker_need_libatomic():
          return False
      # Double-check to see if -latomic actually can solve the problem.
      # https://github.com/grpc/grpc/issues/22491
@@ -58,15 +56,14 @@ index 3a50c97..bb2386d 100644
                                  stdin=PIPE,
                                  stdout=PIPE,
                                  stderr=PIPE)
-diff --git a/src/python/grpcio/commands.py b/src/python/grpcio/commands.py
-index d93b6c7..a8c4a51 100644
 --- a/src/python/grpcio/commands.py
 +++ b/src/python/grpcio/commands.py
-@@ -228,7 +228,10 @@ class BuildExt(build_ext.build_ext):
+@@ -228,8 +228,10 @@ class BuildExt(build_ext.build_ext):
              """
              try:
                  # TODO(lidiz) Remove the generated a.out for success tests.
--                cc_test = subprocess.Popen(['cc', '-x', 'c', '-std=c++14', '-'],
+-                cc = os.environ.get('CC', 'cc')
+-                cc_test = subprocess.Popen([cc, '-x', 'c', '-std=c++14', '-'],
 +                cc_test, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
 +                if not cc_args:
 +                    cc_args = "-g"
@@ -74,6 +71,3 @@ index d93b6c7..a8c4a51 100644
                                             stdin=subprocess.PIPE,
                                             stdout=subprocess.PIPE,
                                             stderr=subprocess.PIPE)
--- 
-2.25.1
-
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
index 3de3d0f083..4100cf63f7 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
@@ -18,8 +18,6 @@ Upstream-Status: Pending
  absl/debugging/internal/stacktrace_config.h | 2 +-
  4 files changed, 12 insertions(+), 5 deletions(-)
 
-diff --git a/absl/base/internal/unscaledcycleclock.cc b/absl/base/internal/unscaledcycleclock.cc
-index b1c396c..d62bfd6 100644
 --- a/absl/base/internal/unscaledcycleclock.cc
 +++ b/absl/base/internal/unscaledcycleclock.cc
 @@ -20,7 +20,7 @@
@@ -40,22 +38,6 @@ index b1c396c..d62bfd6 100644
  
  int64_t UnscaledCycleClock::Now() {
  #ifdef __GLIBC__
-diff --git a/absl/base/internal/unscaledcycleclock.h b/absl/base/internal/unscaledcycleclock.h
-index 2cbeae3..683a5ef 100644
---- a/absl/base/internal/unscaledcycleclock.h
-+++ b/absl/base/internal/unscaledcycleclock.h
-@@ -46,7 +46,8 @@
- 
- // The following platforms have an implementation of a hardware counter.
- #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
--    defined(__powerpc__) || defined(__ppc__) || defined(__riscv) ||     \
-+    ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
-+    defined(__riscv) ||     \
-     defined(_M_IX86) || (defined(_M_X64) && !defined(_M_ARM64EC))
- #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
- #else
-diff --git a/absl/debugging/internal/examine_stack.cc b/absl/debugging/internal/examine_stack.cc
-index 5bdd341..a784e0d 100644
 --- a/absl/debugging/internal/examine_stack.cc
 +++ b/absl/debugging/internal/examine_stack.cc
 @@ -33,6 +33,10 @@
@@ -69,7 +51,7 @@ index 5bdd341..a784e0d 100644
  #include "absl/base/attributes.h"
  #include "absl/base/internal/raw_logging.h"
  #include "absl/base/macros.h"
-@@ -174,8 +178,10 @@ void* GetProgramCounter(void* const vuc) {
+@@ -174,8 +178,10 @@ void* GetProgramCounter(void* const vuc)
      return reinterpret_cast<void*>(context->uc_mcontext.pc);
  #elif defined(__powerpc64__)
      return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
@@ -81,8 +63,6 @@ index 5bdd341..a784e0d 100644
  #elif defined(__riscv)
      return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
  #elif defined(__s390__) && !defined(__s390x__)
-diff --git a/absl/debugging/internal/stacktrace_config.h b/absl/debugging/internal/stacktrace_config.h
-index 3929b1b..23d5e50 100644
 --- a/absl/debugging/internal/stacktrace_config.h
 +++ b/absl/debugging/internal/stacktrace_config.h
 @@ -60,7 +60,7 @@
@@ -94,6 +74,15 @@ index 3929b1b..23d5e50 100644
  #define ABSL_STACKTRACE_INL_HEADER \
    "absl/debugging/internal/stacktrace_powerpc-inl.inc"
  #elif defined(__aarch64__)
--- 
-2.25.1
-
+--- a/absl/base/internal/unscaledcycleclock_config.h
++++ b/absl/base/internal/unscaledcycleclock_config.h
+@@ -21,7 +21,8 @@
+ 
+ // The following platforms have an implementation of a hardware counter.
+ #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
+-    defined(__powerpc__) || defined(__ppc__) || defined(__riscv) ||     \
++    ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
++    defined(__riscv) ||     \
+     defined(_M_IX86) || (defined(_M_X64) && !defined(_M_ARM64EC))
+ #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
+ #else
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/boring_ssl.patch b/meta-python/recipes-devtools/python/python3-grpcio/boring_ssl.patch
deleted file mode 100644
index d12e35a993..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/boring_ssl.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From f71b32eb8a5c173fc5733847437b9485d75bb2e5 Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Fri, 9 Apr 2021 14:06:36 +0300
-Subject: [PATCH] setup.py: Fix determining target platform
-
-Do not poke at the build machine to determine target platform or architecture
-pass it from environment instead for cross compiling to work
-
-Upstream-Status: Inappropriate [OE-Specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- setup.py | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index c93d419f32..71a944a9d0 100644
---- a/setup.py
-+++ b/setup.py
-@@ -116,6 +116,9 @@ def _env_bool_value(env_name, default):
- BUILD_WITH_BORING_SSL_ASM = _env_bool_value('GRPC_BUILD_WITH_BORING_SSL_ASM',
-                                             'True')
- 
-+BORING_SSL_PLATFORM = os.environ.get('GRPC_BORING_SSL_PLATFORM',
-+                                           'True')
-+
- # Export this environment variable to override the platform variant that will
- # be chosen for boringssl assembly optimizations. This option is useful when
- # crosscompiling and the host platform as obtained by distutils.utils.get_platform()
-@@ -336,13 +339,13 @@ if BUILD_WITH_BORING_SSL_ASM and not BUILD_WITH_SYSTEM_OPENSSL:
-     LINUX_X86_64 = 'linux-x86_64'
-     LINUX_ARM = 'linux-arm'
-     LINUX_AARCH64 = 'linux-aarch64'
--    if LINUX_X86_64 == boringssl_asm_platform:
-+    if LINUX_X86_64 == BORING_SSL_PLATFORM:
-         asm_key = 'crypto_linux_x86_64'
--    elif LINUX_ARM == boringssl_asm_platform:
-+    elif LINUX_ARM == BORING_SSL_PLATFORM:
-         asm_key = 'crypto_linux_arm'
--    elif LINUX_AARCH64 == boringssl_asm_platform:
-+    elif LINUX_AARCH64 == BORING_SSL_PLATFORM:
-         asm_key = 'crypto_linux_aarch64'
--    elif "mac" in boringssl_asm_platform and "x86_64" in boringssl_asm_platform:
-+    elif "mac" in boringssl_asm_platform and "x86_64" in BORING_SSL_PLATFORM:
-         asm_key = 'crypto_mac_x86_64'
-     else:
-         print("ASM Builds for BoringSSL currently not supported on:",
--- 
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch b/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
index 5c9be443d8..5dacc689fc 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
@@ -5,10 +5,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
 +++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
-@@ -99,6 +99,9 @@ extern "C" {
- #elif (defined(__PPC64__) || defined(__powerpc64__)) && defined(_LITTLE_ENDIAN)
- #define OPENSSL_64_BIT
- #define OPENSSL_PPC64LE
+@@ -96,6 +96,9 @@ extern "C" {
+ #elif defined(__ARMEL__) || defined(_M_ARM)
+ #define OPENSSL_32_BIT
+ #define OPENSSL_ARM
 +#elif (defined(__PPC__) || defined(__powerpc__))
 +#define OPENSSL_32_BIT
 +#define OPENSSL_PPC
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb
index 7a9b7d8018..33c13b0a01 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb
@@ -8,13 +8,12 @@ DEPENDS += "${PYTHON_PN}-protobuf"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
-                                file://boring_ssl.patch \
                                 file://mips_bigendian.patch \
                                 file://0001-Include-missing-cstdint-header.patch \
                                 file://abseil-ppc-fixes.patch;patchdir=third_party/abseil-cpp \
                                 file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
 "
-SRC_URI[sha256sum] = "e6dfc2b6567b1c261739b43d9c59d201c1b89e017afd9e684d85aa7a186c9f7a"
+SRC_URI[sha256sum] = "4c08ee21b3d10315b8dc26f6c13917b20ed574cdbed2d2d80c53d5508fdcc0f2"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
@@ -30,11 +29,14 @@ export GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY = "1"
 
 BORING_SSL_PLATFORM:arm = "linux-arm"
 BORING_SSL_PLATFORM:x86-64 = "linux-x86_64"
+BORING_SSL_PLATFORM:aarch64 = "linux-aarch64"
 BORING_SSL_PLATFORM ?= "unsupported"
 export GRPC_BORING_SSL_PLATFORM = "${BORING_SSL_PLATFORM}"
+export GRPC_BUILD_OVERRIDE_BORING_SSL_ASM_PLATFORM = "${BORING_SSL_PLATFORM}"
 
-BORING_SSL:x86-64 = "1"
 BORING_SSL:arm = "1"
+BORING_SSL:x86-64 = "1"
+BORING_SSL:aarch64 = "1"
 BORING_SSL ?= "0"
 export GRPC_BUILD_WITH_BORING_SSL_ASM = "${BORING_SSL}"
 
-- 
2.41.0


