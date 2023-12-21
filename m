Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4F9C46CCD
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 16:44:41 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.55750.1703177077587518005
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 08:44:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7b7fe0ae57bso42130539f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 08:44:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703177076; x=1703781876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEDanVuttrC1zRk8zgTd2O6ZjkBL+NjQrbbcK0/WFKs=;
        b=n5+eGJ71h5CA6ODiqzZ+VaSFZ4PvlLl1sJWQq6r9JCl7zN3CttfIy9l9y972iZkrKs
         tEQUwaH/p/YsHn7URAiJykocozbnUeXSiEsv12SRfmEiYMbRs7Fv4TsgYSv8Tb/Oz284
         yOQKn/AYib6mseppMA9FXpttITODlSdUJyUUZqpDU2wqGGETIj+fI3PAP02b51A+kKZi
         MptWnOoDUnEcZjuX5hjIIQ8kKubQBXKZTBgRdG5ikssWrVCn3UdgWOcKEJw4E3sIXkvA
         GPSVOsBRgCNVhMzmuwOXO0QrWlTBaLhOyc9/2e3OqEwuNGt2mP4sllZpKy1wYCVwgWZG
         bX+g==
X-Gm-Message-State: AOJu0Yy7+oAZ/RT3k8zVKFz1VBawr2XBwsZl9f6FaQQAz+KltWfTQLxi
	beZnCF5Hr1ITh8X0saM7QNBEo8+MKK9xpw==
X-Google-Smtp-Source: AGHT+IEimuuug3M8WckwqzcW5xpmVxDvEObWlLqEBgF68659O6txKUeXIoJ/aQs81rPqtXr3U6PyMQ==
X-Received: by 2002:a6b:7b47:0:b0:7b7:c8cd:7552 with SMTP id m7-20020a6b7b47000000b007b7c8cd7552mr3590iop.36.1703177075849;
        Thu, 21 Dec 2023 08:44:35 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id o4-20020a5eda44000000b007ba81a6cb52sm559510iop.44.2023.12.21.08.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 08:44:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python3-grpcio-tools: update to version 1.60.0
Date: Thu, 21 Dec 2023 16:44:25 +0000
Message-Id: <20231221164425.3890796-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221164425.3890796-1-derek@asterius.io>
References: <20231221164425.3890796-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 16:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107721

Delete upstreamed patch for off_t
Rebase the other patches on the latest version

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../0001-direct_mmap-Use-off_t-on-linux.patch | 37 -------------------
 ...f-Disable-musttail-attribute-on-mips.patch | 10 ++---
 ...-Do-not-mix-C-and-C-compiler-options.patch | 25 +++++++------
 ...56.0.bb => python3-grpcio-tools_1.60.0.bb} |  3 +-
 4 files changed, 19 insertions(+), 56 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio-tools/0001-direct_mmap-Use-off_t-on-linux.patch
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.56.0.bb => python3-grpcio-tools_1.60.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-direct_mmap-Use-off_t-on-linux.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-direct_mmap-Use-off_t-on-linux.patch
deleted file mode 100644
index 9b3e5d4a5..000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-direct_mmap-Use-off_t-on-linux.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 45fdade6c0415ec5af3f9312e6311a4ccc682a7b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 28 Dec 2022 18:24:21 -0800
-Subject: [PATCH] direct_mmap: Use off_t on linux
-
-off64_t is not provided without defining _LARGEFILE64_SOURCE on musl
-this define is not defined automatically like glibc where it gets
-defined when _GNU_SOURCE is defined. Using off_t makes it portable
-across musl/glibc and for using 64bit off_t on glibc 32bit systems
--D_FILE_OFFSET_BITS=64 can be defined during build via CXXFLAGS
-
-Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pull/1349]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- absl/base/internal/direct_mmap.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
-+++ b/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
-@@ -72,7 +72,7 @@ namespace base_internal {
- // Platform specific logic extracted from
- // https://chromium.googlesource.com/linux-syscall-support/+/master/linux_syscall_support.h
- inline void* DirectMmap(void* start, size_t length, int prot, int flags, int fd,
--                        off64_t offset) noexcept {
-+                        off_t offset) noexcept {
- #if defined(__i386__) || defined(__ARM_ARCH_3__) || defined(__ARM_EABI__) || \
-     defined(__m68k__) || defined(__sh__) ||                                  \
-     (defined(__hppa__) && !defined(__LP64__)) ||                             \
-@@ -102,7 +102,7 @@ inline void* DirectMmap(void* start, siz
- #else
-   return reinterpret_cast<void*>(
-       syscall(SYS_mmap2, start, length, prot, flags, fd,
--              static_cast<off_t>(offset / pagesize)));
-+              offset / pagesize));
- #endif
- #elif defined(__s390x__)
-   // On s390x, mmap() arguments are passed in memory.
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
index 8c70b2b6a..67505d0ce 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
@@ -14,11 +14,11 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 
 --- a/third_party/protobuf/src/google/protobuf/port_def.inc
 +++ b/third_party/protobuf/src/google/protobuf/port_def.inc
-@@ -338,6 +338,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125
+@@ -298,6 +298,7 @@
  #error PROTOBUF_TAILCALL was previously defined
  #endif
- #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) &&      \
-+    !defined(__mips__) &&                                        \
+ #if ABSL_HAVE_CPP_ATTRIBUTE(clang::musttail) && !defined(__arm__) &&  \
++    !defined(__mips__) &&                                             \
      !defined(_ARCH_PPC) && !defined(__wasm__) &&                      \
-     !(defined(_MSC_VER) && defined(_M_IX86)) && !defined(__i386__) && \
-     !(defined(__NDK_MAJOR__) && __NDK_MAJOR <= 24)
+     !(defined(_MSC_VER) && defined(_M_IX86)) && !defined(__i386__)
+ // Compilation fails on ARM32: b/195943306
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index 4aa11bd57..07276c17f 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -30,29 +30,30 @@ diff --git a/setup.py b/setup.py
 index cc53e79..be3bc78 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -87,8 +87,11 @@ def check_linker_need_libatomic():
-     """Test if linker on system needs libatomic."""
-     code_test = (b'#include <atomic>\n' +
-                  b'int main() { return std::atomic<int64_t>{}; }')
--    cxx = os.environ.get('CXX', 'c++')
--    cpp_test = subprocess.Popen([cxx, '-x', 'c++', '-std=c++14', '-'],
+@@ -88,9 +88,11 @@
+         b"#include <atomic>\n"
+         + b"int main() { return std::atomic<int64_t>{}; }"
+     )
+-    cxx = os.environ.get("CXX", "c++")
+-    cpp_test = subprocess.Popen(
+-        [cxx, "-x", "c++", "-std=c++14", "-"],
 +    cxx, cxx_args = os.environ.get('CXX').split(' ', 1) or 'c++'
 +    if not cxx_args:
 +      cxx_args = "-g"
 +
 +    cpp_test = subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-std=c++14', '-'],
-                                 stdin=PIPE,
-                                 stdout=PIPE,
-                                 stderr=PIPE)
-@@ -98,7 +101,7 @@ def check_linker_need_libatomic():
+         stdin=PIPE,
+         stdout=PIPE,
+         stderr=PIPE,
+@@ -101,7 +103,7 @@
      # Double-check to see if -latomic actually can solve the problem.
      # https://github.com/grpc/grpc/issues/22491
      cpp_test = subprocess.Popen(
--        [cxx, '-x', 'c++', '-std=c++14', '-', '-latomic'],
+-        [cxx, "-x", "c++", "-std=c++14", "-", "-latomic"],
 +        [cxx, cxx_args, '-x', 'c++', '-std=c++14', '-', '-latomic'],
          stdin=PIPE,
          stdout=PIPE,
-         stderr=PIPE)
+         stderr=PIPE,
 -- 
 2.25.1
 
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.0.bb
index 8fbe1fa91..8e5c7d48f 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.0.bb
@@ -11,9 +11,8 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
-            file://0001-direct_mmap-Use-off_t-on-linux.patch \
             "
-SRC_URI[sha256sum] = "39f5877cea514b3da9f2683dfb3ffb45ef47b05f4ff39c287d7d61c5057f48b8"
+SRC_URI[sha256sum] = "ed30499340228d733ff69fcf4a66590ed7921f94eb5a2bf692258b1280b9dac7"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.34.1


