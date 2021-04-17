Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.1703.1618683583297399848
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 11:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HgIokXlg;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id 20so11673418pll.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 11:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AbNzNjoS0pFK6eTda4aeTdGcTO3Xg+j03Ljt7LHbfdI=;
        b=HgIokXlg58TARHHEJ95ed/P2Z5hrNEOu3tVGDwhuIdtJKBc/ZbhCoBT6cEaXh6mKAg
         eochkT7UfFTf+aHAl6lc5r5GhWmEXPEm4nSE6sqUUI8664Pnp1TLQNR1h5PEMX7NmUDx
         1RD/qTigGMKpJy2PVkV88QqghhDIkfSAYy1G+73HQ8HRzv2iaUM81hlQUiYUgPJoXJ/G
         aGzsDit6XiY7clMmeuKMKptSIMqqX/YduC7vO95RaWCvxAQ18egvxWYvrq9nHDUvE3hy
         N7TCrqWqb1yfL03SjjWVU4aNGcYdrI1jp6ZRUAyNQW5AEi0yRs9XLA+mJoZQfNhUMzzD
         CE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AbNzNjoS0pFK6eTda4aeTdGcTO3Xg+j03Ljt7LHbfdI=;
        b=iupkbJSvzCDa8jcrGTQ+jxFZAMWIaCvKVvMF7rR0NQPtlQerNt2LPDu6C7DbeGhU7n
         D769JdrhMCo2ngDxcEeez3U0H3uvjCPLJcH1rjz7UVv2iV9pdnlKT1/vGH6XPo77U5WK
         cSn077c4QVCpg1Jle8j6ZT80H3bvJ90QLvn0g0/gzQA51VhjyJpPLAoSPcCvfAhmXP5f
         uQmFlS/mJYjOCWb9aYJPHMGUhRtHqJR4UmiWmPwftXCbOiQBXbQmPTni2jlIbomx7ZkS
         jOuCzp9k4IRYcWpuUA1bPtVwmL/VqmKvHtIWAKPziwqFXOBsPfQfmWhuBSoJXc27LvUU
         gkoA==
X-Gm-Message-State: AOAM533DnmW7SQ/CkiMf2FSVvkonKcN7A5MHYw7KRdtnAZFd4e7eEOA7
	3EXOPdCN+l7q9NtsL6mtxrLYJMr6+Qd6YA==
X-Google-Smtp-Source: ABdhPJzoBt9X+CGZq/xhlIu9gHaizlSO/xvjVGPa4bhtNWd1vY9TL2V0oOGqHBJcmtPgmHmbn6mQGg==
X-Received: by 2002:a17:902:c94f:b029:ec:85bd:1f24 with SMTP id i15-20020a170902c94fb02900ec85bd1f24mr6518165pla.4.1618683582454;
        Sat, 17 Apr 2021 11:19:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id t19sm8393225pjs.1.2021.04.17.11.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 11:19:42 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 1/3] nodejs: Update to 14.16.1
Date: Sat, 17 Apr 2021 11:19:36 -0700
Message-Id: <20210417181938.3824401-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is latest maintained LTS release
Forward patches and drop backported patch

License-Update: Update  copyright year and drop license of
deps/http_parser as this component is  removed in this version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 ...e-running-gyp-files-for-bundled-deps.patch | 15 +++---
 ...gister-r7-because-llvm-now-issues-an.patch | 53 -------------------
 ...Install-both-binaries-and-use-libdir.patch | 37 ++++++-------
 .../{nodejs_12.21.0.bb => nodejs_14.16.1.bb}  |  5 +-
 4 files changed, 25 insertions(+), 85 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.21.0.bb => nodejs_14.16.1.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
index 4dd121f485..d6e439ba22 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
@@ -1,4 +1,4 @@
-From c2aff16cc196a61f4ab1cdae4a91c7926123c239 Mon Sep 17 00:00:00 2001
+From 7d94bfe53beeb2d25eb5f2ff6b1d509df7e6ab80 Mon Sep 17 00:00:00 2001
 From: Zuzana Svetlikova <zsvetlik@redhat.com>
 Date: Thu, 27 Apr 2017 14:25:42 +0200
 Subject: [PATCH] Disable running gyp on shared deps
@@ -8,18 +8,15 @@ Subject: [PATCH] Disable running gyp on shared deps
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 0947300f24..6c98691984 100644
+index 93d63110..79caaec2 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -141,7 +141,7 @@ test-code-cache: with-code-cache
- 	echo "'test-code-cache' target is a noop"
+@@ -138,7 +138,7 @@ with-code-cache test-code-cache:
+ 	$(warning '$@' target is a noop)
  
  out/Makefile: config.gypi common.gypi node.gyp \
--	deps/uv/uv.gyp deps/http_parser/http_parser.gyp deps/zlib/zlib.gyp \
-+	deps/http_parser/http_parser.gyp \
+-	deps/uv/uv.gyp deps/llhttp/llhttp.gyp deps/zlib/zlib.gyp \
++	deps/llhttp/llhttp.gyp \
  	tools/v8_gypfiles/toolchain.gypi tools/v8_gypfiles/features.gypi \
  	tools/v8_gypfiles/inspector.gypi tools/v8_gypfiles/v8.gyp
  	$(PYTHON) tools/gyp_node.py -f make
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch
deleted file mode 100644
index a23f1c243e..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From be8d3cd6eab4b8f9849133060abb1aba4400276b Mon Sep 17 00:00:00 2001
-From: Amy Huang <akhuang@google.com>
-Date: Thu, 23 Apr 2020 11:25:53 -0700
-Subject: [PATCH] Remove use of register r7 because llvm now issues an error
- when "r7" is used (starting in commit d85b3877)
-
-Bug: chromium:1073270
-Change-Id: I7ec8112f170b98d2edaf92bc9341e738f8de07a3
-Reviewed-on: https://chromium-review.googlesource.com/c/v8/v8/+/2163435
-Reviewed-by: Nico Weber <thakis@chromium.org>
-Reviewed-by: Ross McIlroy <rmcilroy@chromium.org>
-Commit-Queue: Nico Weber <thakis@chromium.org>
-Cr-Commit-Position: refs/heads/master@{#67371}
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Backport [https://chromium.googlesource.com/v8/v8/+/00604cd2806b5d26bef592dd19989a234bd07a4b%5E%21/]
- deps/v8/src/codegen/arm/cpu-arm.cc | 13 -------------
- 1 file changed, 13 deletions(-)
-
-diff --git a/deps/v8/src/codegen/arm/cpu-arm.cc b/deps/v8/src/codegen/arm/cpu-arm.cc
-index 868f360..654d68f 100644
---- a/deps/v8/src/codegen/arm/cpu-arm.cc
-+++ b/deps/v8/src/codegen/arm/cpu-arm.cc
-@@ -30,18 +30,6 @@ V8_NOINLINE void CpuFeatures::FlushICache(void* start, size_t size) {
-   register uint32_t end asm("r1") = beg + size;
-   register uint32_t flg asm("r2") = 0;
- 
--#ifdef __clang__
--  // This variant of the asm avoids a constant pool entry, which can be
--  // problematic when LTO'ing. It is also slightly shorter.
--  register uint32_t scno asm("r7") = __ARM_NR_cacheflush;
--
--  asm volatile("svc 0\n"
--               :
--               : "r"(beg), "r"(end), "r"(flg), "r"(scno)
--               : "memory");
--#else
--  // Use a different variant of the asm with GCC because some versions doesn't
--  // support r7 as an asm input.
-   asm volatile(
-       // This assembly works for both ARM and Thumb targets.
- 
-@@ -59,7 +47,6 @@ V8_NOINLINE void CpuFeatures::FlushICache(void* start, size_t size) {
-       : "r"(beg), "r"(end), "r"(flg), [scno] "i"(__ARM_NR_cacheflush)
-       : "memory");
- #endif
--#endif
- #endif  // !USE_SIMULATOR
- }
- 
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir.patch
index 92386fa779..6223920990 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir.patch
@@ -1,28 +1,31 @@
-From 5bfeffdf4b5de1c60a2ff0d1ddf65db2bb9a1533 Mon Sep 17 00:00:00 2001
+From 5b22fac923d1ca3e9fefb97f5a171124a88f5e22 Mon Sep 17 00:00:00 2001
 From: Elliott Sales de Andrade <quantum.analyst@gmail.com>
 Date: Tue, 19 Mar 2019 23:22:40 -0400
-Subject: [PATCH 3/3] Install both binaries and use libdir.
+Subject: [PATCH] Install both binaries and use libdir.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 This allows us to build with a shared library for other users while
 still providing the normal executable.
 
-Signed-off-by: Elliott Sales de Andrade <quantum.analyst@gmail.com>
-
-Stolen from [1]
-
-[1] https://src.fedoraproject.org/rpms/nodejs/raw/master/f/0003-Install-both-binaries-and-use-libdir.patch
+Taken from - https://src.fedoraproject.org/rpms/nodejs/raw/rawhide/f/0002-Install-both-binaries-and-use-libdir.patch
 
 Upstream-Status: Pending
 
+Signed-off-by: Elliott Sales de Andrade <quantum.analyst@gmail.com>
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  configure.py     |  7 +++++++
- tools/install.py | 31 ++++++++++++++-----------------
- 2 files changed, 21 insertions(+), 17 deletions(-)
+ tools/install.py | 21 +++++++++------------
+ 2 files changed, 16 insertions(+), 12 deletions(-)
 
+diff --git a/configure.py b/configure.py
+index e6f7e4db..6cf5c45d 100755
 --- a/configure.py
 +++ b/configure.py
-@@ -602,6 +602,12 @@ parser.add_option('--shared',
+@@ -626,6 +626,12 @@ parser.add_option('--shared',
      help='compile shared library for embedding node in another project. ' +
           '(This mode is not officially supported for regular applications)')
  
@@ -35,7 +38,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  parser.add_option('--without-v8-platform',
      action='store_true',
      dest='without_v8_platform',
-@@ -1168,6 +1174,7 @@ def configure_node(o):
+@@ -1202,6 +1208,7 @@ def configure_node(o):
    o['variables']['node_no_browser_globals'] = b(options.no_browser_globals)
  
    o['variables']['node_shared'] = b(options.shared)
@@ -43,9 +46,11 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
    node_module_version = getmoduleversion.get_version()
  
    if options.dest_os == 'android':
+diff --git a/tools/install.py b/tools/install.py
+index 729b416f..9bfc6234 100755
 --- a/tools/install.py
 +++ b/tools/install.py
-@@ -121,26 +121,23 @@ def subdir_files(path, dest, action):
+@@ -121,22 +121,19 @@ def subdir_files(path, dest, action):
  
  def files(action):
    is_windows = sys.platform == 'win32'
@@ -64,16 +69,8 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 -      output_file += '.dll'
 -    else:
 -      output_file = 'lib' + output_file + '.' + variables.get('shlib_suffix')
--      # GYP will output to lib.target except on OS X, this is hardcoded
--      # in its source - see the _InstallableTargetInstallPath function.
--      if sys.platform != 'darwin':
--        output_prefix += 'lib.target/'
 +    output_bin = 'node'
 +    output_lib = 'libnode.' + variables.get('shlib_suffix')
-+    # GYP will output to lib.target except on OS X, this is hardcoded
-+    # in its source - see the _InstallableTargetInstallPath function.
-+    if sys.platform != 'darwin':
-+      output_libprefix += 'lib.target/'
  
 -  if 'false' == variables.get('node_shared'):
 -    action([output_prefix + output_file], 'bin/' + output_file)
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
index 9b86bf3373..b24a6d6567 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8c66ff8861d9f96076a7cb61e3d75f54"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=85bf260d8b6de1588f57abc5dc66587c"
 
 DEPENDS = "openssl"
 DEPENDS_append_class-target = " nodejs-native"
@@ -21,12 +21,11 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
            file://big-endian.patch \
            file://mips-warnings.patch \
-           file://0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "052f37ace6f569b513b5a1154b2a45d3c4d8b07d7d7c807b79f1566db61e979d"
+SRC_URI[sha256sum] = "e44adbbed6756c2c1a01258383e9f00df30c147b36e438f6369b5ef1069abac3"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.31.1

