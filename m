Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC58D2C105
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.19616.1730817419109498075
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CeQpspun;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ea7c9226bbso32042757b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817418; x=1731422218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9H1mef9aEO6/yBIqz+CqrHBsRtk+G8461HyNIztsOT8=;
        b=CeQpspun/+mv7SLTELp4jBmQOzqMvLVVaJmBzX7LFjbNsNxRZNKUOBc2D7i4ogqjYu
         /XBbI3gPw9iBFTH1bG2kqIXlHZ9jxcMXukywryQMA0RwyiDbcZASZyMC7Vl4xdyBNwMh
         1yw7tH7S1BksIGEddPoj0i3BMafUwIWOlE9rCnDershynwLGkYfRTvTNoJR7Yp1mG3Z7
         CVhdWH1l47U6IX2qfK8Pdis9n/zHjQs1VlS+hZLrDWBVSpT6Bv+zG3Oy+Kp0Ed/JomGa
         m+nHOiVN/dzDlHYes6qnTQuBhUwDFXncP0hkwLYGEMf/Ul7VFC/IykqhZlzhueRjuQDv
         vciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817418; x=1731422218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9H1mef9aEO6/yBIqz+CqrHBsRtk+G8461HyNIztsOT8=;
        b=lwyyLVAldeKEWNpYwNij0hMsmFMAhMIBf2VbHmXRrn6StUnwrpZpHBQ1KOsiiicXv7
         ijqQ3acyqJnTTw2pVXle4JKh4Oo55Ao0GokkyjOJb2GigKQ42ool3BrN0Gm8e1Jggsoe
         iE1fAAH77y3BRctWegQ+l1hc8ANv6L/e58GPbds6MTTYZc5s85L4bcriYNwxXm+UFUXq
         fi46PcofNqzN8KFioC8L0PLm4wq8lHLsyLl+sc2w5OfLra9HEAPWbut2IJccoO83Dncs
         0+eIkdgg2OEMhYMl2jwYrUjhvIg99oB4HXMf2/kFzPlyoMKWXHNqWxkxsdD9jkyJ9izO
         b/Lw==
X-Gm-Message-State: AOJu0Ywj/ogpeWEPsCtjN2P1JmpPjsBkG0WeqiUnY3dpRX8THb9gMJ4t
	/BjrDEEZSRMIPI0ef9ajHXXzWp4rMXsCZBeDd+qLeHrwR2g8+F0ulHcvxw==
X-Google-Smtp-Source: AGHT+IFLkAZgV8rHFN1sG+NrNX1SnQz+iFpFZi7tIKfu3QDDUsSTtfTz1S431nuYKEvKKOV07TIHZA==
X-Received: by 2002:a05:690c:883:b0:6ea:8132:4081 with SMTP id 00721157ae682-6ea81324270mr109767737b3.3.1730817418100;
        Tue, 05 Nov 2024 06:36:58 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 41/90] perfetto: upgrade 31.0 -> 47.0
Date: Tue,  5 Nov 2024 09:35:06 -0500
Message-ID: <20241105143638.2301245-42-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113459

From: Etienne Cordonnier <ecordonnier@snap.com>

Release Notes: https://github.com/google/perfetto/releases/tag/v47.0

Test procedure:
Tested with TOOLCHAIN="clang" and MACHINE="qemux86-64" (using ARGS="is_debug=false enable_perfetto_x64_cpu_opt=false" in perfetto.bb because of missing SSE4.2,BMI2,AVX2 inside qemu):

```
root@qemux86-64:~# tracebox --out /tmp/perfetto dmesg sched freq idle am wm gfx view binder_driver hal dalvik camera input res memory
[100.634]          service.cc:232 Started traced, listening on @traced-p-310 @traced-c-310
[100.804]           probes.cc:104 Starting traced_probes service
[100.852]  probes_producer.cc:332 Connected to the service
[100.957]   perf_producer.cc:1201 Connected to the service
[100.979]    perfetto_cmd.cc:1100 Connected to the Perfetto traced service, TTL: 10s
[101.029] ng_service_impl.cc:1125 Configured tracing session 1, #sources:4, duration:10000 ms, #buffers:1, total buffer size:32768 KB, total sessions:1, uid:0 session name: ""
[101.571]  probes_producer.cc:132 Ftrace setup (target_buf=1)
[101.574]    ftrace_procfs.cc:441 disabled ftrace in /sys/kernel/tracing/
[101.679]    ftrace_procfs.cc:295 Failed to setup event triggers for synthetic:rss_stat_throttled (errno: 22, Invalid argument)
[101.682]   atrace_wrapper.cc:196 Atrace only supported on Android.
[101.757]    ftrace_procfs.cc:438 enabled ftrace in /sys/kernel/tracing/
[111.091] ng_service_impl.cc:2103 FlushAndDisableTracing(1) done, success=1
[111.097]  probes_producer.cc:445 Producer stop (id=1)
[111.168]    ftrace_procfs.cc:441 disabled ftrace in /sys/kernel/tracing/
[111.181]    ftrace_procfs.cc:441 disabled ftrace in /sys/kernel/tracing/
[111.194]  probes_producer.cc:445 Producer stop (id=2)
[111.200]  probes_producer.cc:445 Producer stop (id=3)
[111.308]    perfetto_cmd.cc:1263 Wrote 390764 bytes into /tmp/perfetto

root@qemux86-64:~# ls -l /tmp/perfetto
-rw------- 1 root root 390764 Sep 24 09:25 /tmp/perfetto
```
I then manually verified the file using https://ui.perfetto.dev/

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../perfetto/common/0001-fix-musl-build.patch | 40 +++++++++++++
 ...ng-header-cstdint-for-uintXX_t-types.patch | 58 -------------------
 .../recipes-devtools/perfetto/libperfetto.bb  |  2 +-
 ...1-meson-add-pc-file-for-lib_perfetto.patch | 20 ++++---
 meta-oe/recipes-devtools/perfetto/perfetto.bb | 30 +++++-----
 .../recipes-devtools/perfetto/perfetto.inc    | 11 +++-
 ...-Remove-check_build_deps-build-steps.patch | 18 +++---
 .../0002-traced-fix-missing-include.patch     | 28 +++++++++
 8 files changed, 114 insertions(+), 93 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/perfetto/common/0001-fix-musl-build.patch
 delete mode 100644 meta-oe/recipes-devtools/perfetto/files/0001-Add-missing-header-cstdint-for-uintXX_t-types.patch
 rename meta-oe/recipes-devtools/perfetto/{files => libperfetto}/0001-meson-add-pc-file-for-lib_perfetto.patch (69%)
 rename meta-oe/recipes-devtools/perfetto/{files => perfetto}/0001-Remove-check_build_deps-build-steps.patch (85%)
 create mode 100644 meta-oe/recipes-devtools/perfetto/perfetto/0002-traced-fix-missing-include.patch

diff --git a/meta-oe/recipes-devtools/perfetto/common/0001-fix-musl-build.patch b/meta-oe/recipes-devtools/perfetto/common/0001-fix-musl-build.patch
new file mode 100644
index 0000000000..3b7ca951ae
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/common/0001-fix-musl-build.patch
@@ -0,0 +1,40 @@
+From 485c21940eb0100a33b7efea40a83e7f79e765f8 Mon Sep 17 00:00:00 2001
+From: Etienne Cordonnier <ecordonnier@snap.com>
+Date: Sun, 22 Sep 2024 20:17:52 +0200
+Subject: [PATCH] fix musl build
+
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
+---
+Upstream-Status: Pending
+
+ sdk/perfetto.cc   | 1 -
+ src/base/utils.cc | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/sdk/perfetto.cc b/sdk/perfetto.cc
+index b10dd5aa92..2eb90f0d15 100644
+--- a/sdk/perfetto.cc
++++ b/sdk/perfetto.cc
+@@ -6558,7 +6558,6 @@ std::optional<int32_t> GetTimezoneOffsetMins() {
+ 
+ #if PERFETTO_BUILDFLAG(PERFETTO_OS_LINUX) || \
+     PERFETTO_BUILDFLAG(PERFETTO_OS_ANDROID)
+-#include <linux/prctl.h>
+ #include <sys/prctl.h>
+ 
+ #ifndef PR_GET_TAGGED_ADDR_CTRL
+diff --git a/src/base/utils.cc b/src/base/utils.cc
+index 0d9318c136..419c7dbc1a 100644
+--- a/src/base/utils.cc
++++ b/src/base/utils.cc
+@@ -40,7 +40,6 @@
+ 
+ #if PERFETTO_BUILDFLAG(PERFETTO_OS_LINUX) || \
+     PERFETTO_BUILDFLAG(PERFETTO_OS_ANDROID)
+-#include <linux/prctl.h>
+ #include <sys/prctl.h>
+ 
+ #ifndef PR_GET_TAGGED_ADDR_CTRL
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/perfetto/files/0001-Add-missing-header-cstdint-for-uintXX_t-types.patch b/meta-oe/recipes-devtools/perfetto/files/0001-Add-missing-header-cstdint-for-uintXX_t-types.patch
deleted file mode 100644
index d08721ae65..0000000000
--- a/meta-oe/recipes-devtools/perfetto/files/0001-Add-missing-header-cstdint-for-uintXX_t-types.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From e63949205682bbd2a0e33e256119472d704a2549 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 29 Jan 2023 22:03:01 -0800
-Subject: [PATCH] Add missing header <cstdint> for uintXX_t types
-
-This is detected by gcc-13
-gcc 13 moved some includes around and as a result <cstdint> is no
-longer transitively included [1]. Explicitly include it for uintXX_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Upstream-Status: Submitted [https://android-review.googlesource.com/c/platform/external/perfetto/+/2399128]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/perfetto/ext/base/http/sha1.h    | 1 +
- include/perfetto/ext/base/uuid.h         | 1 +
- src/traced/probes/common/cpu_freq_info.h | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/include/perfetto/ext/base/http/sha1.h b/include/perfetto/ext/base/http/sha1.h
-index c583d69d4..7e3a48c83 100644
---- a/include/perfetto/ext/base/http/sha1.h
-+++ b/include/perfetto/ext/base/http/sha1.h
-@@ -20,6 +20,7 @@
- #include <stddef.h>
- 
- #include <array>
-+#include <cstdint>
- #include <string>
- 
- namespace perfetto {
-diff --git a/include/perfetto/ext/base/uuid.h b/include/perfetto/ext/base/uuid.h
-index 1b4c53815..472042fab 100644
---- a/include/perfetto/ext/base/uuid.h
-+++ b/include/perfetto/ext/base/uuid.h
-@@ -18,6 +18,7 @@
- #define INCLUDE_PERFETTO_EXT_BASE_UUID_H_
- 
- #include <array>
-+#include <cstdint>
- #include <string>
- 
- #include "perfetto/ext/base/optional.h"
-diff --git a/src/traced/probes/common/cpu_freq_info.h b/src/traced/probes/common/cpu_freq_info.h
-index 36f7f9c09..8232cbf64 100644
---- a/src/traced/probes/common/cpu_freq_info.h
-+++ b/src/traced/probes/common/cpu_freq_info.h
-@@ -17,6 +17,7 @@
- #ifndef SRC_TRACED_PROBES_COMMON_CPU_FREQ_INFO_H_
- #define SRC_TRACED_PROBES_COMMON_CPU_FREQ_INFO_H_
- 
-+#include <cstdint>
- #include <map>
- #include <string>
- #include <vector>
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-devtools/perfetto/libperfetto.bb b/meta-oe/recipes-devtools/perfetto/libperfetto.bb
index c8f56fd527..8383db3cc0 100644
--- a/meta-oe/recipes-devtools/perfetto/libperfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/libperfetto.bb
@@ -1,5 +1,5 @@
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f87516e0b698007e9e75a1fe1012b390"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2572d98547d43906b53615f856a8c2d"
 
 require perfetto.inc
 
diff --git a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch b/meta-oe/recipes-devtools/perfetto/libperfetto/0001-meson-add-pc-file-for-lib_perfetto.patch
similarity index 69%
rename from meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
rename to meta-oe/recipes-devtools/perfetto/libperfetto/0001-meson-add-pc-file-for-lib_perfetto.patch
index ae644747c1..719663a802 100644
--- a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
+++ b/meta-oe/recipes-devtools/perfetto/libperfetto/0001-meson-add-pc-file-for-lib_perfetto.patch
@@ -3,21 +3,22 @@ From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 17 Oct 2022 19:20:53 +0200
 Subject: [PATCH] meson: add PC file for lib_perfetto
 
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
 ---
 Upstream-Status: Pending
 
- meson.build | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
+ meson.build | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
 
+diff --git a/meson.build b/meson.build
+index 8fb1e26275..3ef3ebf27d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -19,9 +19,12 @@
+@@ -19,8 +19,11 @@
  project(
      'perfetto',
      ['cpp'],
--    default_options: ['cpp_std=c++17']
-+    default_options: ['cpp_std=c++17'],
-+    version: '31.0'
++    version: '47.0'
  )
  
 +soversion = meson.project_version()
@@ -25,7 +26,7 @@ Upstream-Status: Pending
  fs = import('fs')
  
  if not fs.is_dir('sdk')
-@@ -36,8 +39,9 @@ if host_machine.system() == 'android'
+@@ -35,8 +38,9 @@ if host_machine.system() == 'android'
    deps_perfetto += cpp.find_library('log')
  endif
  
@@ -36,7 +37,7 @@ Upstream-Status: Pending
      sources: 'sdk/perfetto.cc',
      dependencies: deps_perfetto,
      install: true,
-@@ -50,6 +54,10 @@ dir_perfetto_trace = join_paths(meson.cu
+@@ -50,6 +54,10 @@ dir_perfetto_trace = join_paths(meson.current_source_dir(),
  
  install_data(dir_perfetto_trace / 'perfetto_trace.proto')
  
@@ -47,3 +48,6 @@ Upstream-Status: Pending
  dep_perfetto = declare_dependency(
      link_with: lib_perfetto,
      include_directories: inc_perfetto,
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 884e0a024b..d2a6fbe654 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -1,16 +1,17 @@
 LICENSE = "Apache-2.0 & BSD-3-Clause & MIT & Zlib"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f87516e0b698007e9e75a1fe1012b390 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2572d98547d43906b53615f856a8c2d \
                     file://buildtools/libcxx/LICENSE.TXT;md5=55d89dd7eec8d3b4204b680e27da3953 \
                     file://buildtools/libcxxabi/LICENSE.TXT;md5=7b9334635b542c56868400a46b272b1e \
                     file://buildtools/libunwind/LICENSE.TXT;md5=f66970035d12f196030658b11725e1a1 \
                     file://buildtools/protobuf/LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b \
-                    file://buildtools/zlib/LICENSE;md5=f09575dbfb09420642318b413159496f \
+                    file://buildtools/zlib/LICENSE;md5=8c75f2b4df47a77f9445315a9500cd1c \
                     file://debian/copyright;md5=4e08364c82141f181de69d0a2b89d612 \
                     file://python/LICENSE;md5=c602a632c34ade9c78a976734077bce7"
 
+# Dependencies from perfetto/tools/install-build-deps
 SRC_URI:append = " \
-           git://github.com/protocolbuffers/protobuf.git;branch=3.9.x;protocol=https;destsuffix=git/buildtools/protobuf;name=protobuf \
+           git://github.com/protocolbuffers/protobuf.git;branch=main;protocol=https;destsuffix=git/buildtools/protobuf;name=protobuf \
            git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git;protocol=https;destsuffix=git/buildtools/libcxx;branch=main;name=libcxx \
            git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git;protocol=https;destsuffix=git/buildtools/libcxxabi;branch=main;name=libcxxabi \
            git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git;protocol=https;destsuffix=git/buildtools/libunwind;branch=main;name=libunwind \
@@ -22,25 +23,28 @@ SRC_URI:append = " \
            git://android.googlesource.com/platform/bionic.git;branch=master;protocol=https;destsuffix=git/buildtools/bionic;name=bionic \
            git://android.googlesource.com/platform/external/zlib.git;branch=master;protocol=https;destsuffix=git/buildtools/zlib;name=zlib \
            git://android.googlesource.com/platform/external/lzma.git;branch=master;protocol=https;destsuffix=git/buildtools/lzma;name=lzma \
+           git://android.googlesource.com/platform/external/zstd.git;branch=master;protocol=https;destsuffix=git/buildtools/zstd;name=zstd \
            https://storage.googleapis.com/perfetto/gn-linux64-1968-0725d782;subdir=git/buildtools/;name=gn \
            \
            file://0001-Remove-check_build_deps-build-steps.patch \
-           file://0001-Add-missing-header-cstdint-for-uintXX_t-types.patch"
+           file://0002-traced-fix-missing-include.patch \
+           "
 
-SRCREV_bionic = "4b0e16bc72a82a63c699977376a7d6eadca1b206"
+SRCREV_bionic = "a0d0355105cb9d4a4b5384897448676133d7b8e2"
 SRCREV_core = "9e6cef7f07d8c11b3ea820938aeb7ff2e9dbaa52"
 SRCREV_lzma = "7851dce6f4ca17f5caa1c93a4e0a45686b1d56c3"
 SRCREV_libprocinfo = "fd214c13ededecae97a3b15b5fccc8925a749a84"
 SRCREV_logging = "7b36b566c9113fc703d68f76e8f40c0c2432481c"
-SRCREV_unwinding = "d66882575ebe3700d6a6b10185f3aee28acc1051"
-SRCREV_protobuf = "6a59a2ad1f61d9696092f79b6d74368b4d7970a3"
+SRCREV_unwinding = "4b59ea8471e89d01300481a92de3230b79b6d7c7"
+SRCREV_protobuf = "f0dc78d7e6e331b8c6bb2d5283e06aa26883ca7c"
 SRCREV_libbase = "78f1c2f83e625bdf66d55b48bdb3a301c20d2fb3"
-SRCREV_libcxx = "f8571eaba606bde2eb8cd34b30104ca33e7c207e"
-SRCREV_libcxxabi = "8dd405113a4f3694e910b79785dd7fb7535a888a"
-SRCREV_libunwind = "aabcd8753678f1536e15eb6385a948470debdae4"
-SRCREV_zlib = "5c85a2da4c13eda07f69d81a1579a5afddd35f59"
+SRCREV_libcxx = "852bc6746f45add53fec19f3a29280e69e358d44"
+SRCREV_libcxxabi = "a37a3aa431f132b02a58656f13984d51098330a2"
+SRCREV_libunwind = "419b03c0b8f20d6da9ddcb0d661a94a97cdd7dad"
+SRCREV_zlib = "6d3f6aa0f87c9791ca7724c279ef61384f331dfd"
+SRCREV_zstd = "77211fcc5e08c781734a386402ada93d0d18d093"
 
-SRCREV_FORMAT .="_bionic_core_lzma_libprocinfo_logging_unwinding_protobuf_libbase_libcxx_libcxxabi_libunwind_zlib"
+SRCREV_FORMAT .="_bionic_core_lzma_libprocinfo_logging_unwinding_protobuf_libbase_libcxx_libcxxabi_libunwind_zlib_zstd"
 
 SRC_URI[gn.sha256sum] = "f706aaa0676e3e22f5fc9ca482295d7caee8535d1869f99efa2358177b64f5cd"
 
@@ -97,7 +101,7 @@ do_configure () {
     ARGS=$ARGS" target_os=\"linux\""
     ARGS=$ARGS" target_cpu=\"$arch\""
     ARGS=$ARGS" target_cc=\"$CC_BIN ${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}\""
-    ARGS=$ARGS" target_cxx=\"$CXX_BIN -std=c++11 ${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}\""
+    ARGS=$ARGS" target_cxx=\"$CXX_BIN ${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}\""
     ARGS=$ARGS" target_strip=\"$STRIP_BIN\"" #
     ARGS=$ARGS" target_sysroot=\"${RECIPE_SYSROOT}\""
     ARGS=$ARGS" target_linker=\"$CC_BIN ${TUNE_CCARGS} ${LDFLAGS}\""
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc b/meta-oe/recipes-devtools/perfetto/perfetto.inc
index 4b06c5bf04..e0e4f04a23 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.inc
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc
@@ -1,10 +1,15 @@
 SUMMARY = "Perfetto - System profiling, app tracing and trace analysis."
 HOMEPAGE = "https://github.com/google/perfetto"
 
-SRC_URI = "git://github.com/google/perfetto.git;protocol=https;name=perfetto;nobranch=1"
+FILESEXTRAPATHS:prepend := "${THISDIR}/common:"
 
-SRCREV_perfetto = "b8da07095979310818f0efde2ef3c69ea70d62c5"
+# Add only patches here which are used by both perfetto and libperfetto
+SRC_URI = "git://github.com/google/perfetto.git;protocol=https;name=perfetto;nobranch=1 \
+	   file://0001-fix-musl-build.patch \
+	"
+
+SRCREV_perfetto = "c74251226a8caa0b43377902ee06d2570faa0c15"
 SRCREV_FORMAT = "perfetto"
-PV = "31.0"
+PV = "47.0"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-devtools/perfetto/files/0001-Remove-check_build_deps-build-steps.patch b/meta-oe/recipes-devtools/perfetto/perfetto/0001-Remove-check_build_deps-build-steps.patch
similarity index 85%
rename from meta-oe/recipes-devtools/perfetto/files/0001-Remove-check_build_deps-build-steps.patch
rename to meta-oe/recipes-devtools/perfetto/perfetto/0001-Remove-check_build_deps-build-steps.patch
index c10400aef4..118c3aed4a 100644
--- a/meta-oe/recipes-devtools/perfetto/files/0001-Remove-check_build_deps-build-steps.patch
+++ b/meta-oe/recipes-devtools/perfetto/perfetto/0001-Remove-check_build_deps-build-steps.patch
@@ -1,4 +1,4 @@
-From 3b7091243ec03054ca8800b51b85a1c09e7e3075 Mon Sep 17 00:00:00 2001
+From 07ddc4b9b7a6fec73cdc295baba353944857212e Mon Sep 17 00:00:00 2001
 From: Sui Chen <suichen6@gmail.com>
 Date: Mon, 13 Jun 2022 17:46:49 +0000
 Subject: [PATCH] Remove "check_build_deps" build steps
@@ -11,6 +11,7 @@ Also setting "is_cross_compiling" to true, so that the host-side tools
 rather than the Bitbake-generated one.
 
 Signed-off-by: Sui Chen <suichen6@gmail.com>
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
 ---
 Upstream-Status: Pending
 
@@ -20,10 +21,10 @@ Upstream-Status: Pending
  3 files changed, 9 insertions(+), 9 deletions(-)
 
 diff --git a/gn/BUILD.gn b/gn/BUILD.gn
-index 8a7ca72a8..e4a2d39f0 100644
+index ed055ee700..ea79979ec5 100644
 --- a/gn/BUILD.gn
 +++ b/gn/BUILD.gn
-@@ -111,7 +111,6 @@ group("default_deps") {
+@@ -117,7 +117,6 @@ group("default_deps") {
    deps = [ ":gen_buildflags" ]
    if (perfetto_build_standalone) {
      public_deps = [
@@ -32,10 +33,10 @@ index 8a7ca72a8..e4a2d39f0 100644
        "//gn/standalone/sanitizers:deps",
      ]
 diff --git a/gn/standalone/BUILD.gn b/gn/standalone/BUILD.gn
-index 582e9b867..9c77ac64c 100644
+index 36fb6371a5..f7bc97b1a6 100644
 --- a/gn/standalone/BUILD.gn
 +++ b/gn/standalone/BUILD.gn
-@@ -441,10 +441,10 @@ config("android_liblog") {
+@@ -469,10 +469,10 @@ config("android_liblog") {
  }
  
  # Checks that tools/install-build-deps has been run since it last changed.
@@ -53,7 +54,7 @@ index 582e9b867..9c77ac64c 100644
 +#  args = [ "--android" ]
 +#}
 diff --git a/gn/standalone/BUILDCONFIG.gn b/gn/standalone/BUILDCONFIG.gn
-index 6f32686c1..c041989b0 100644
+index 05ed548f9d..94db724b2b 100644
 --- a/gn/standalone/BUILDCONFIG.gn
 +++ b/gn/standalone/BUILDCONFIG.gn
 @@ -59,8 +59,9 @@ declare_args() {
@@ -67,7 +68,4 @@ index 6f32686c1..c041989b0 100644
 +  is_cross_compiling = true
  }
  default_configs = [
-   "//gn/standalone:debug_symbols",
--- 
-2.37.1
-
+   "//gn/standalone:default",
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto/0002-traced-fix-missing-include.patch b/meta-oe/recipes-devtools/perfetto/perfetto/0002-traced-fix-missing-include.patch
new file mode 100644
index 0000000000..49b7989359
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/perfetto/0002-traced-fix-missing-include.patch
@@ -0,0 +1,28 @@
+From d005c0123b2f929b918359a53ffe61d7ca2212a0 Mon Sep 17 00:00:00 2001
+From: Lalit Maganti <lalitm@google.com>
+Date: Wed, 14 Aug 2024 11:56:47 +0100
+Subject: [PATCH] traced: fix missing include
+
+Change-Id: Ib9ce8ce5b057e89fa451ccef228228d607b36793
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
+---
+Upstream-Status: Backport [https://github.com/google/perfetto/commit/d005c0123b2f929b918359a53ffe61d7ca2212a0]
+
+ src/traced/probes/sys_stats/sys_stats_data_source.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/traced/probes/sys_stats/sys_stats_data_source.h b/src/traced/probes/sys_stats/sys_stats_data_source.h
+index e09cd8a2ca..7e4749bdcd 100644
+--- a/src/traced/probes/sys_stats/sys_stats_data_source.h
++++ b/src/traced/probes/sys_stats/sys_stats_data_source.h
+@@ -21,6 +21,7 @@
+ 
+ #include <map>
+ #include <memory>
++#include <optional>
+ #include <string>
+ 
+ #include "perfetto/ext/base/paged_memory.h"
+-- 
+2.43.0
+
-- 
2.43.0


