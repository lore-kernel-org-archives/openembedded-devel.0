Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web08.11886.1620510432121413579
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 May 2021 14:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d+roVMJg;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id h11so11190415pfn.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 May 2021 14:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mKn/ip+mUr6n2wUokbigxB3XMLOWX9VIrzVE6qw2hGk=;
        b=d+roVMJgU+tVF0Wh3AoYCgwNlCbdf8vMWwnpQmXdGPiFAoiGtJx6n526P8t9qwjq7+
         /m8YkLKj5885BKm1icBf3aALZzsiIBgvhdivzGYvYIpak41V7c5YtvO709U6PnmBWEcR
         twDqyjUPMp3fCBLnNZa4TdPA3fzH1/L4reWMYEy17U5RBsXXFMqUSCSgVryEr3NeHrVN
         QVY45Y32dR8vORYsF0s0BOspGaivQRRCflKt1sBhdhubyFHJNQZx0otu3GuocdF66xKJ
         ZgEneg9SuyvXk7vERlbYYROuzopkWPqzga1sF1hqFCXpmwz5NLqhAukWN4Zom560jC5T
         5Irw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mKn/ip+mUr6n2wUokbigxB3XMLOWX9VIrzVE6qw2hGk=;
        b=Ys8fRlLT43UYl5dwR+0Uu/SF0v+ET8gMpJmz6RrbcsOKxM3boEargL6bc+Obqy/nQq
         cH87vP6mDz8EVM8twBCa2fvBmE+BewQIKoHd2XbGmAVjHt3rkaDx/wiLDNEnkzzJPZpb
         htru/gf5w/itCTp6eqyRAAIOa2EJz3kyzeK/F2VglNH1TVxKiPtcRbeg1TA8daSY/Ksn
         qvFu28SPDA1XqKatzLajvdWRIvxWLoGiwWTl6vfalryXS+8EKzsINzqXk7Thz0gO3AKs
         now31SqfH7VckH1ivA9mF8jEgmfzOxc7nvYE4Vate3AA+ha1txApVcgAT/lIw92Hau27
         NUAw==
X-Gm-Message-State: AOAM533hP7fKG5Dg5bEDasKXCzyIovZEnqwd7Zawhd7AwHP3rSVku3KQ
	29+tq+cyBrlCOOoDDuwv021wLIxWF7NwGA==
X-Google-Smtp-Source: ABdhPJwYg0DvIfq+4ZiGAkfj/s4BcUBopcmobrU/onrUMqgpcfneE9mDAWB4Ki41c8bh90579ME02A==
X-Received: by 2002:a05:6a00:1687:b029:253:f417:4dba with SMTP id k7-20020a056a001687b0290253f4174dbamr17422534pfc.5.1620510431143;
        Sat, 08 May 2021 14:47:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id x26sm7763525pfm.134.2021.05.08.14.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 14:47:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] abseil-cpp: Upgrade to lts_2021_03_24
Date: Sat,  8 May 2021 14:47:08 -0700
Message-Id: <20210508214708.3435201-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix build with glibc 2.34 while here
Forward patches to this version
Let system package the libraries
No need to ask for c++14 anymore, gcc11 and  clang12 already default to
it or newer std

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Export-of-internal-Abseil-changes.patch | 100 ++++++++++++++++++
 .../abseil-cpp/abseil-ppc-fixes.patch         |  24 +----
 .../abseil-cpp/abseil-cpp_git.bb              |  11 +-
 3 files changed, 109 insertions(+), 26 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-internal-Abseil-changes.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-internal-Abseil-changes.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-internal-Abseil-changes.patch
new file mode 100644
index 0000000000..52d4f42d52
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-internal-Abseil-changes.patch
@@ -0,0 +1,100 @@
+From a9831f1cbf93fb18dd951453635f488037454ce9 Mon Sep 17 00:00:00 2001
+From: Abseil Team <absl-team@google.com>
+Date: Mon, 3 May 2021 07:37:39 -0700
+Subject: [PATCH] Export of internal Abseil changes
+
+--
+cf88f9cf40eab54c06bca7f20795352ec23bb583 by Derek Mauro <dmauro@google.com>:
+
+Fixes build with latest glibc
+Fixes #952
+
+PiperOrigin-RevId: 371693908
+
+--
+99bcd0f4a747ce7a401e23c745adf34d0ec5131b by Samuel Benzaquen <sbenza@google.com>:
+
+Add support for std::string_view in StrFormat even when
+absl::string_view != std::string_view.
+
+PiperOrigin-RevId: 371693633
+
+--
+e35463572149a6c2d4a0d439b9300ce03fd6b96d by Abseil Team <absl-team@google.com>:
+
+Cmake builds should only install pkg-config when explicitly requested.
+
+PiperOrigin-RevId: 371403419
+GitOrigin-RevId: cf88f9cf40eab54c06bca7f20795352ec23bb583
+Change-Id: I4360a18c638a4d901ff44ab1e0a9d8f321c302ea
+---
+ CMake/AbseilHelpers.cmake                        | 3 ++-
+ absl/debugging/failure_signal_handler.cc         | 3 ++-
+ absl/strings/internal/str_format/arg.h           | 8 ++++++++
+ absl/strings/internal/str_format/convert_test.cc | 3 +++
+ 4 files changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/CMake/AbseilHelpers.cmake b/CMake/AbseilHelpers.cmake
+index 1f754392..1a80b5b4 100644
+--- a/CMake/AbseilHelpers.cmake
++++ b/CMake/AbseilHelpers.cmake
+@@ -141,7 +141,8 @@ function(absl_cc_library)
+   endif()
+ 
+   # Generate a pkg-config file for every library:
+-  if(_build_type STREQUAL "static" OR _build_type STREQUAL "shared")
++  if((_build_type STREQUAL "static" OR _build_type STREQUAL "shared")
++     AND ABSL_ENABLE_INSTALL)
+     if(NOT ABSL_CC_LIB_TESTONLY)
+       if(absl_VERSION)
+         set(PC_VERSION "${absl_VERSION}")
+diff --git a/absl/debugging/failure_signal_handler.cc b/absl/debugging/failure_signal_handler.cc
+index e458a795..689e5979 100644
+--- a/absl/debugging/failure_signal_handler.cc
++++ b/absl/debugging/failure_signal_handler.cc
+@@ -136,7 +136,8 @@ static bool SetupAlternateStackOnce() {
+ #else
+   const size_t page_mask = sysconf(_SC_PAGESIZE) - 1;
+ #endif
+-  size_t stack_size = (std::max(SIGSTKSZ, 65536) + page_mask) & ~page_mask;
++  size_t stack_size =
++      (std::max<size_t>(SIGSTKSZ, 65536) + page_mask) & ~page_mask;
+ #if defined(ABSL_HAVE_ADDRESS_SANITIZER) || \
+     defined(ABSL_HAVE_MEMORY_SANITIZER) || defined(ABSL_HAVE_THREAD_SANITIZER)
+   // Account for sanitizer instrumentation requiring additional stack space.
+diff --git a/absl/strings/internal/str_format/arg.h b/absl/strings/internal/str_format/arg.h
+index 7040c866..3c91be70 100644
+--- a/absl/strings/internal/str_format/arg.h
++++ b/absl/strings/internal/str_format/arg.h
+@@ -122,6 +122,14 @@ StringConvertResult FormatConvertImpl(const std::string& v,
+ StringConvertResult FormatConvertImpl(string_view v,
+                                       FormatConversionSpecImpl conv,
+                                       FormatSinkImpl* sink);
++#if defined(ABSL_HAVE_STD_STRING_VIEW) && !defined(ABSL_USES_STD_STRING_VIEW)
++inline StringConvertResult FormatConvertImpl(std::string_view v,
++                                             FormatConversionSpecImpl conv,
++                                             FormatSinkImpl* sink) {
++  return FormatConvertImpl(absl::string_view(v.data(), v.size()), conv, sink);
++}
++#endif  // ABSL_HAVE_STD_STRING_VIEW && !ABSL_USES_STD_STRING_VIEW
++
+ ArgConvertResult<FormatConversionCharSetUnion(
+     FormatConversionCharSetInternal::s, FormatConversionCharSetInternal::p)>
+ FormatConvertImpl(const char* v, const FormatConversionSpecImpl conv,
+diff --git a/absl/strings/internal/str_format/convert_test.cc b/absl/strings/internal/str_format/convert_test.cc
+index 926283cf..91e03609 100644
+--- a/absl/strings/internal/str_format/convert_test.cc
++++ b/absl/strings/internal/str_format/convert_test.cc
+@@ -229,6 +229,9 @@ TEST_F(FormatConvertTest, BasicString) {
+   TestStringConvert(static_cast<const char*>("hello"));
+   TestStringConvert(std::string("hello"));
+   TestStringConvert(string_view("hello"));
++#if defined(ABSL_HAVE_STD_STRING_VIEW)
++  TestStringConvert(std::string_view("hello"));
++#endif  // ABSL_HAVE_STD_STRING_VIEW
+ }
+ 
+ TEST_F(FormatConvertTest, NullString) {
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
index ee0c25473b..a4937e1b33 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
@@ -53,21 +53,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "absl/base/attributes.h"
  #include "absl/base/internal/raw_logging.h"
  #include "absl/base/macros.h"
-@@ -55,8 +59,10 @@ void* GetProgramCounter(void* vuc) {
+@@ -63,8 +67,10 @@ void* GetProgramCounter(void* vuc) {
      return reinterpret_cast<void*>(context->uc_mcontext.pc);
  #elif defined(__powerpc64__)
      return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
 -#elif defined(__powerpc__)
 +#elif defined(__powerpc__) && defined(__GLIBC__)
-     return reinterpret_cast<void*>(context->uc_mcontext.regs->nip);
+     return reinterpret_cast<void*>(context->uc_mcontext.uc_regs->gregs[32]);
 +#elif defined(__powerpc__)
-+    return reinterpret_cast<void*>(((struct pt_regs *)context->uc_regs)->nip);
++    return reinterpret_cast<void*>(((struct pt_regs *)context->uc_regs)->gregs[32]);
  #elif defined(__riscv)
      return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
  #elif defined(__s390__) && !defined(__s390x__)
 --- a/absl/debugging/internal/stacktrace_config.h
 +++ b/absl/debugging/internal/stacktrace_config.h
-@@ -64,7 +64,7 @@
+@@ -55,7 +55,7 @@
  #elif defined(__i386__) || defined(__x86_64__)
  #define ABSL_STACKTRACE_INL_HEADER \
    "absl/debugging/internal/stacktrace_x86-inl.inc"
@@ -76,19 +76,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #define ABSL_STACKTRACE_INL_HEADER \
    "absl/debugging/internal/stacktrace_powerpc-inl.inc"
  #elif defined(__aarch64__)
---- a/absl/debugging/internal/stacktrace_powerpc-inl.inc
-+++ b/absl/debugging/internal/stacktrace_powerpc-inl.inc
-@@ -130,8 +130,13 @@ static void **NextStackFrame(void **old_
-         StacktracePowerPCGetLR(new_sp) == kernel_sigtramp_rt64_address) {
-       const ucontext_t* signal_context =
-           reinterpret_cast<const ucontext_t*>(uc);
-+#if defined(__powerpc64__)
-       void **const sp_before_signal =
-           reinterpret_cast<void**>(signal_context->uc_mcontext.gp_regs[PT_R1]);
-+#else
-+      void **const sp_before_signal =
-+          reinterpret_cast<void**>(signal_context->uc_mcontext.uc_regs->gregs[PT_R1]);
-+#endif
-       // Check that alleged sp before signal is nonnull and is reasonably
-       // aligned.
-       if (sp_before_signal != nullptr &&
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 903b7b4b82..5275fa3093 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -7,13 +7,14 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-PV = "20200923+git${SRCPV}"
-SRCREV = "6f9d96a1f41439ac172ee2ef7ccd8edf0e5d068c"
-BRANCH = "lts_2020_09_23"
+PV = "20210324+git${SRCPV}"
+SRCREV = "e1d388e7e74803050423d035e4374131b9b57919"
+BRANCH = "lts_2021_03_24"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH}         \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
+           file://0001-Export-of-internal-Abseil-changes.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -25,10 +26,8 @@ inherit cmake
 
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
                  -DBUILD_TESTING=OFF    \
-                 -DCMAKE_CXX_STANDARD=14 \
                 "
 
 BBCLASSEXTEND = "native nativesdk"
 
-FILES_${PN} = "${libdir}/libabsl_*.so"
-FILES_${PN}-dev = "${includedir} ${libdir}/cmake"
+FILES_${PN}-dev += "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
-- 
2.31.1

