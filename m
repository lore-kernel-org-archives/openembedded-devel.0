Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE8AC5DF6E
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:32 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24543.1786747643276331813
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L3li+g/K;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf50c6f235so19297175ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747643; x=1787352443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiFQRMBg9UYcUoqA7KroG5phHmN2JQR40D6XMeN5FmY=;
        b=L3li+g/KQchaSi82dunwbyqqTLgGwfEkNgaWCjg2iCTLwn4ngjjo13O0apNDfyyz/T
         MRgH1arAyubS7DSvVS3LNDO1kKcyh2AyxsnDHxTmVfE6NQOLv0z7hpmx9PXLPpugn107
         Tj4/kzS1DSerRDeoocA5NNCTXw/Dj+1QQa2l0gIVvgvu1duXF3+10gInd3AMkFFKB7lC
         9Fl1trpUXyJHNM9uicicoxCBe8XtwbtRvXF5ZFTmTZ6UZyaCPsgqxBG47WianGA463T5
         8KSH3O4ZGuKGB7iLunFjXrwMmE+uOKRD9fgbm53mJoAs2gsBH6fqqrdwMn87fDiCb453
         /MyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747643; x=1787352443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OiFQRMBg9UYcUoqA7KroG5phHmN2JQR40D6XMeN5FmY=;
        b=MbXKoaYJNqqow4CSuCKiaoaYK+yJU1fn/Pjj5TfevuXbH7YhtnWitpWFrkjc3UJAw3
         0NQBTFgYdU53ZO4v2HBJyamw1oXJP/Tj8Cu3zQdxJSwAdCYiQBeJiITcV2edLoEwjNTm
         jLINI8tyAiOTt1/52w4AhdsbjJIvaxrNNoNNCRzxpDe5Uiwk1gexdefe0A50UYRgqEpd
         vOCW+FYiZic2EK/PI6Qv0gYxMi1w9pS21gzP0NQe5Z1rrrRZg1O1ClJX+kL/ekYWE4rG
         1Tkpv2Gfv8qLKgv1PWYhhdIYycXE2o4BamNDB8scGYjnuSkD1qq2rbSSqPmyZxUjmuu6
         C29A==
X-Gm-Message-State: AOJu0Yxtr5oWtOGAOFrqQ5aHYYChUxCYqM4QkSji2yCq2jEJR/dLcZbW
	HRvsMEnu4Nw6oUnjcM5MIissk/07ZL3eOautwQhwbpFf6LbvRthMPcJlUmOL5oWV
X-Gm-Gg: AR+sD10yVG1rTP4wfvs7QZ/WEKY1+TL1eQMirk9lzHLISDM0Yb2ayi2NLFyZDA1+M4C
	glG4JkYY8CmRd6KfYptu6zjy1s+va3YHuMjs7Sdu4j9i08xNaQzKe+XQBe3hQ2y15L/X9eyKRcM
	KrPBa9JmUM0P8oFXDlj57DWuPwSYuE+Vr1sYJDGDyKp78J2I2H+5KCsZ17d/F4iUHWBToHkCljr
	YYWJOuD5NTSt3wozEFbVRG2O/w67g7eTGLfvZvKj+TOHyaeDZxaK2hD1L+1eC6OMYiYdnOUSm8d
	T4p2ubd/OuAkEGEu4ldxSZSWXcfvbbG3dkFaQhLGoAfQn3qHdgukGYRjtCxwTkoi4hu0D/sgR07
	E6O6S1yHJiWka1uULrm667rCi7Fmejomt+jJnhN594hcP9gWO4AtSndGbvJNhnPpWbYGxG6n/fN
	dJwDARdlbfilbHs9lYoDaW3BZSvMFNUNKBaWTVAk8+44m4bg6R2+UCyZkCQKXUssd6Q9qV22NsS
	CNWaYuJnuS5r68pZc1FQlzHqjms6hWsdMHfNnrL9JxIKqY5M/1y0PbMw8FF6K2Y/5J5Mjc+qU+X
	Siof/xp8UQrHSwJn3LQWqQg9qTGekYrw6SfE+34vrpvDMj2EVtYlGJyUY657iiJmi9rWQGm9nfD
	tau/A9PB2IMomXcYZgYLgQOacCrUPM4SFtXtKGbzWwG5gHQ==
X-Received: by 2002:a05:6a21:3a47:b0:3c3:9993:d5c3 with SMTP id adf61e73a8af0-3cc71aae5admr12551275637.9.1786747642476;
        Fri, 14 Aug 2026 15:47:22 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 085/109] perfetto/libperfetto: upgrade 51.2 -> 57.2
Date: Fri, 14 Aug 2026 15:45:11 -0700
Message-ID: <20260814224539.1523174-85-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129149

Release Notes: https://github.com/google/perfetto/releases/tag/v57.2

perfetto 57.2 added a new build-time dependency on RE2 (via
enable_perfetto_re2, unconditionally true for standalone builds) for trace
processor regex support, so a matching buildtools/re2 git fetch/SRCREV was
added to perfetto.bb, mirroring the existing buildtools/* pattern from
tools/install-build-deps. abseil-cpp is now fetched the same way for the
same reason.

Upstream also dropped the amalgamated sdk/perfetto.{h,cc} from the git
release branches (now shipped only as a GitHub release .zip asset), so
libperfetto.bb now fetches perfetto-cpp-sdk-src.zip and unpacks it into
sdk/, which the meson build requires.

Build-verified for qemux86-64: both perfetto and libperfetto build
through do_package_qa cleanly.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/perfetto/libperfetto.bb  | 10 +++++++--
 ...1-meson-add-pc-file-for-lib_perfetto.patch |  2 +-
 meta-oe/recipes-devtools/perfetto/perfetto.bb | 17 ++++++++-------
 .../recipes-devtools/perfetto/perfetto.inc    |  4 ++--
 ...-Remove-check_build_deps-build-steps.patch | 21 ++++++++-----------
 5 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/meta-oe/recipes-devtools/perfetto/libperfetto.bb b/meta-oe/recipes-devtools/perfetto/libperfetto.bb
index 368d333145..0693c18166 100644
--- a/meta-oe/recipes-devtools/perfetto/libperfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/libperfetto.bb
@@ -1,11 +1,17 @@
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c0c9924c5c63b4834b8b1959816c8e3b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b06e43f2e368eb8663632d529232353"
 
 require perfetto.inc
 
 inherit meson
 
-SRC_URI:append = " file://0001-meson-add-pc-file-for-lib_perfetto.patch"
+# The amalgamated C++ SDK (sdk/perfetto.{h,cc}) is no longer part of the git
+# release branches as of v52 - it now ships only as a GitHub release asset.
+SRC_URI:append = " \
+    file://0001-meson-add-pc-file-for-lib_perfetto.patch \
+    https://github.com/google/perfetto/releases/download/v${PV}/perfetto-cpp-sdk-src.zip;subdir=${BP}/sdk;name=sdk \
+    "
+SRC_URI[sdk.sha256sum] = "c6fa3d89aee30f7da39402c9cd178c9f2e344544fda5c2109fd8457e319c3a2f"
 
 LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
 
diff --git a/meta-oe/recipes-devtools/perfetto/libperfetto/0001-meson-add-pc-file-for-lib_perfetto.patch b/meta-oe/recipes-devtools/perfetto/libperfetto/0001-meson-add-pc-file-for-lib_perfetto.patch
index 9cfe636152..2c74228759 100644
--- a/meta-oe/recipes-devtools/perfetto/libperfetto/0001-meson-add-pc-file-for-lib_perfetto.patch
+++ b/meta-oe/recipes-devtools/perfetto/libperfetto/0001-meson-add-pc-file-for-lib_perfetto.patch
@@ -18,7 +18,7 @@ index 8fb1e26275..3ef3ebf27d 100644
  project(
      'perfetto',
      ['cpp'],
-+    version: '51.2'
++    version: '57.2'
  )
  
 +soversion = meson.project_version()
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 0c5a3959d5..978a8611cc 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -1,17 +1,17 @@
 LICENSE = "Apache-2.0 AND BSD-3-Clause AND MIT AND Zlib"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c0c9924c5c63b4834b8b1959816c8e3b \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b06e43f2e368eb8663632d529232353 \
                     file://buildtools/libcxx/LICENSE.TXT;md5=55d89dd7eec8d3b4204b680e27da3953 \
                     file://buildtools/libcxxabi/LICENSE.TXT;md5=7b9334635b542c56868400a46b272b1e \
                     file://buildtools/libunwind/LICENSE.TXT;md5=f66970035d12f196030658b11725e1a1 \
                     file://buildtools/protobuf/LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b \
                     file://buildtools/zlib/LICENSE;md5=8c75f2b4df47a77f9445315a9500cd1c \
-                    file://debian/copyright;md5=55b18749ff89714316c007d06f305c4a \
                     file://python/LICENSE;md5=c602a632c34ade9c78a976734077bce7"
 
 # Dependencies from perfetto/tools/install-build-deps
 SRC_URI:append = " \
-           git://github.com/protocolbuffers/protobuf.git;branch=main;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/protobuf;name=protobuf \
+           git://github.com/protocolbuffers/protobuf.git;branch=31.x;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/protobuf;name=protobuf \
+           git://github.com/abseil/abseil-cpp.git;branch=lts_2025_05_12;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/abseil-cpp;name=abseil \
            git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/libcxx;branch=main;name=libcxx \
            git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/libcxxabi;branch=main;name=libcxxabi \
            git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/libunwind;branch=main;name=libunwind \
@@ -24,6 +24,7 @@ SRC_URI:append = " \
            git://chromium.googlesource.com/chromium/src/third_party/zlib.git;nobranch=1;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/zlib;name=zlib \
            git://android.googlesource.com/platform/external/lzma.git;branch=master;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/lzma;name=lzma \
            git://android.googlesource.com/platform/external/zstd.git;branch=master;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/zstd;name=zstd \
+           git://chromium.googlesource.com/external/github.com/google/re2.git;nobranch=1;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/re2;name=re2 \
            \
            file://0001-Remove-check_build_deps-build-steps.patch \
            "
@@ -32,17 +33,19 @@ SRCREV_bionic = "a0d0355105cb9d4a4b5384897448676133d7b8e2"
 SRCREV_core = "9e6cef7f07d8c11b3ea820938aeb7ff2e9dbaa52"
 SRCREV_lzma = "7851dce6f4ca17f5caa1c93a4e0a45686b1d56c3"
 SRCREV_libprocinfo = "fd214c13ededecae97a3b15b5fccc8925a749a84"
-SRCREV_logging = "7b36b566c9113fc703d68f76e8f40c0c2432481c"
+SRCREV_logging = "da4d6df49d1d6c971be508dcde18e8b00bb74581"
 SRCREV_unwinding = "4b59ea8471e89d01300481a92de3230b79b6d7c7"
-SRCREV_protobuf = "f0dc78d7e6e331b8c6bb2d5283e06aa26883ca7c"
-SRCREV_libbase = "78f1c2f83e625bdf66d55b48bdb3a301c20d2fb3"
+SRCREV_protobuf = "74211c0dfc2777318ab53c2cd2c317a2ef9012de"
+SRCREV_abseil = "76bb24329e8bf5f39704eb10d21b9a80befa7c81"
+SRCREV_libbase = "18c2bd4f3607cb300bb96e543df91dfdda6a9655"
 SRCREV_libcxx = "852bc6746f45add53fec19f3a29280e69e358d44"
 SRCREV_libcxxabi = "a37a3aa431f132b02a58656f13984d51098330a2"
 SRCREV_libunwind = "419b03c0b8f20d6da9ddcb0d661a94a97cdd7dad"
 SRCREV_zlib = "6f9b4e61924021237d474569027cfb8ac7933ee6"
 SRCREV_zstd = "77211fcc5e08c781734a386402ada93d0d18d093"
+SRCREV_re2 = "927f5d53caf8111721e734cf24724686bb745f55"
 
-SRCREV_FORMAT .= "_bionic_core_lzma_libprocinfo_logging_unwinding_protobuf_libbase_libcxx_libcxxabi_libunwind_zlib_zstd"
+SRCREV_FORMAT .= "_bionic_core_lzma_libprocinfo_logging_unwinding_protobuf_abseil_libbase_libcxx_libcxxabi_libunwind_zlib_zstd_re2"
 
 require perfetto.inc
 
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc b/meta-oe/recipes-devtools/perfetto/perfetto.inc
index 5b4a942526..188472b27d 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.inc
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc
@@ -5,6 +5,6 @@ HOMEPAGE = "https://github.com/google/perfetto"
 SRC_URI = "git://github.com/google/perfetto.git;protocol=https;name=perfetto;nobranch=1 \
 	"
 
-SRCREV_perfetto = "7a9a6a0587348bffd1796b66a1da33cc1ea421d8"
+SRCREV_perfetto = "da1d152cff27890903d158fe96751de3aab883cc"
 SRCREV_FORMAT = "perfetto"
-PV = "51.2"
+PV = "57.2"
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto/0001-Remove-check_build_deps-build-steps.patch b/meta-oe/recipes-devtools/perfetto/perfetto/0001-Remove-check_build_deps-build-steps.patch
index 3a046f3d2a..67720ea227 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto/0001-Remove-check_build_deps-build-steps.patch
+++ b/meta-oe/recipes-devtools/perfetto/perfetto/0001-Remove-check_build_deps-build-steps.patch
@@ -15,16 +15,11 @@ Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
 ---
 Upstream-Status: Pending
 
- gn/BUILD.gn                  |  1 -
- gn/standalone/BUILD.gn       | 20 ++++++++++----------
- gn/standalone/BUILDCONFIG.gn |  5 +++--
- 3 files changed, 13 insertions(+), 13 deletions(-)
-
 diff --git a/gn/BUILD.gn b/gn/BUILD.gn
-index 9ce3145cac..67656b6648 100644
+index 6f2ad9fd..05e4030b 100644
 --- a/gn/BUILD.gn
 +++ b/gn/BUILD.gn
-@@ -127,7 +127,6 @@ group("default_deps") {
+@@ -137,7 +137,6 @@ group("default_deps") {
    deps = [ ":gen_buildflags" ]
    if (perfetto_build_standalone) {
      public_deps = [
@@ -33,10 +28,10 @@ index 9ce3145cac..67656b6648 100644
        "//gn/standalone/sanitizers:deps",
      ]
 diff --git a/gn/standalone/BUILD.gn b/gn/standalone/BUILD.gn
-index 2d0a4b2916..740266a964 100644
+index 7ecaae60..3edb470b 100644
 --- a/gn/standalone/BUILD.gn
 +++ b/gn/standalone/BUILD.gn
-@@ -514,13 +514,13 @@ config("android_liblog") {
+@@ -541,16 +541,16 @@ config("android_liblog") {
  }
  
  # Checks that tools/install-build-deps has been run since it last changed.
@@ -60,11 +55,14 @@ index 2d0a4b2916..740266a964 100644
 +#    "--android",
 +#  ]
 +#}
+ 
+ # TODO(https://github.com/google/perfetto/issues/5353): Remove this after
+ # updating emscripten.
 diff --git a/gn/standalone/BUILDCONFIG.gn b/gn/standalone/BUILDCONFIG.gn
-index 8e2be2ae1b..0faff46e50 100644
+index 2e27f2f1..7037d35e 100644
 --- a/gn/standalone/BUILDCONFIG.gn
 +++ b/gn/standalone/BUILDCONFIG.gn
-@@ -62,8 +62,9 @@ declare_args() {
+@@ -64,8 +64,9 @@ declare_args() {
    # the ossfuzz sanitizer overrides this to true. In that config the
    # host/target cpu and arch are identical, but we want to build only the
    # targets with the sanitizer/fuzzer flags
@@ -78,4 +76,3 @@ index 8e2be2ae1b..0faff46e50 100644
    "//gn/standalone:default",
 -- 
 2.43.0
-

