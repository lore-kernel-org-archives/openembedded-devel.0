Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C511CA1007
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 22:42:53 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.64705.1756766570249515517
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Sep 2025 15:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PX4eSja0;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7723cf6e4b6so1706366b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 15:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756766569; x=1757371369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0aI6V8tH7pbzgvY2x6qHCxOSN2OREofmhrWugsWlMY=;
        b=PX4eSja0mv3eaS7yJxGw6mK44n4CKKvL9VcRucMxkqDiAbnDYduKKWaZbm9IjiuuD2
         6ObmCM0wwCEGnDGu3upK546fxn9krbPB6VVhcz9t07PGtASdWkOYLHketA4SoUiC7/Jv
         c/bXyjy7ZYBvh6+hUgUqSz5r0S4Q4ZlkHONucTaoGjgZPjU3joQyLQXkij5RRaFBA7nM
         6SgoXzZocTpC/zGQYPxMu3TGeS/ncIHA6XiwV1SEIwSepFxrVyGD+KUbMlo+0GD5X4fM
         kjAKLX/2PsyvZ+qSDTu3m0Oq8SbeXdbxhnhWTQWL1l13q9QS0fbdbpC76I7ePBULofSa
         fT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766569; x=1757371369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0aI6V8tH7pbzgvY2x6qHCxOSN2OREofmhrWugsWlMY=;
        b=KvoRc9HYtIHjRAYC8uJIp2zGi1T0zcqfUWgetMi5XtRxGRq9q+Eb+95FwZ2AcI8YAl
         QhWIDc9Rk4xo5+bs8riskhPgibYLo1/A6bhVBGt1OXK/nEPwOwZvmtYJes6uRCEloXNM
         eQ52uAW+mM4vrTtSiH9R5FgK6iekjfWjn8iomr5ce3zdeR/I+bac54UKjwlLHwJygZEL
         AoaScH3FMuSGtuHiIfk1gsRgzrzIIeZSZKxyTX8EOPkOEd5+4UY6yLaVZECMohx0PaMh
         mRlJ+8yVDOvQsBOswVKs5gZvXCTrV0uWvN3FEKrPw7HiKb67oNCTsZS6t2u+UsE0lAH7
         0KTQ==
X-Gm-Message-State: AOJu0Yz8ycirh141bm9ROdKI0LQoKJ7uUBq2D8M+wUF9JW5fjvxuii24
	FN2mMKo6ARIOwSlLLY84QsHxGUTUnUGSU2zVgTRCZ3TuTSBxctWHpgHH4/Wm0xFy
X-Gm-Gg: ASbGncuR6gP3KVNm8e6omed5vMixXbcT/Fo+eA9hBNI7MDlFeGG9XYvkg6Vg1+VRxK9
	LaZKPCabI3+sNf4I1OboNB8AL5YkFU7hWjnW3qbvZ8ycSH4a2lqriCsqu1uJwjOoVz5T2iShsJm
	CYjzEuzhjFqSyyIJ9ebVGdA8jqJ+tyJkNK8T9+uIhpFgcstPWqyL9W4xzGxCsxM2bhEyWviYJ6n
	UQqsldjpcyOHBZUmPH9ULkiqrBD/JJWK9jV8xg0IGXmvRTeA+eJu1Crj5A/usr3Kj6Gb8ESKOql
	8laMkA6tjlxxnKRd2OCm397iDBxS1v5ha5/RMQsdwfezu3AnLAylSPUER4EwcQ7QK6DXHual+yf
	eVR/iBgu+SQjE+syvBpEOIjXEfgIHllOU/U5ijJ//aC4ZQhnVu9LZITaUJ0GTqHEilO4QnNcptT
	ZwmP2/WGYpa7gCnV1tVRa8nzdvl53oBpq+z28JL/U5GmHLJZ6Wr4c=
X-Google-Smtp-Source: AGHT+IG2gQaa4qWodr4UABNOOS94X6XKl/tNf9qhZHBlRkTxwU+1YHxpZsTIRmTwUlutwLZ8JAPYZA==
X-Received: by 2002:a05:6a21:7988:b0:243:f86b:3856 with SMTP id adf61e73a8af0-243f87ac36bmr2949667637.38.1756766569269;
        Mon, 01 Sep 2025 15:42:49 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::c2de])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4beb72sm11648240b3a.61.2025.09.01.15.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:42:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] bpftrace: Upgrade to 0.24.0
Date: Mon,  1 Sep 2025 15:42:40 -0700
Message-ID: <20250901224244.1913647-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901224244.1913647-1-raj.khem@gmail.com>
References: <20250901224244.1913647-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 22:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119163

Fix build with clang-21 and libc++

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Include-missing-c-runtime-headers.patch | 39 ++++++++++
 ...-supported-clang-version-to-clang-21.patch | 24 ++++++
 ....txt-allow-to-set-BISON_FLAGS-like-l.patch | 11 +--
 ...-when-using-libc-casting-ns-to-syste.patch | 54 +++++++++++++
 ...-Clang-LLVM-21-DiagnosticOptions-API.patch | 78 +++++++++++++++++++
 ...{bpftrace_0.23.5.bb => bpftrace_0.24.0.bb} |  9 ++-
 6 files changed, 208 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Include-missing-c-runtime-headers.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-Raise-max-supported-clang-version-to-clang-21.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-chrono-Fix-build-when-using-libc-casting-ns-to-syste.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-ast-Adapt-to-Clang-LLVM-21-DiagnosticOptions-API.patch
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/{bpftrace_0.23.5.bb => bpftrace_0.24.0.bb} (82%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Include-missing-c-runtime-headers.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Include-missing-c-runtime-headers.patch
new file mode 100644
index 0000000000..d3009fa295
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Include-missing-c-runtime-headers.patch
@@ -0,0 +1,39 @@
+From ead4dc45e35fc6c3770ef4021720e0e6a5b60674 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 31 Aug 2025 15:23:27 -0700
+Subject: [PATCH 1/3] Include missing c++ runtime headers
+
+These headers are required and found to fail builds
+when using llvm/libc++ instead of libstdc++ on linux
+
+Upstream-Status: Submitted [https://github.com/bpftrace/bpftrace/pull/4526]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/util/bpf_names.cpp | 1 +
+ tests/opaque.cpp       | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/util/bpf_names.cpp b/src/util/bpf_names.cpp
+index 68525bfc..ab8f6f2f 100644
+--- a/src/util/bpf_names.cpp
++++ b/src/util/bpf_names.cpp
+@@ -1,6 +1,7 @@
+ #include <algorithm>
+ #include <iomanip>
+ #include <iostream>
++#include <sstream>   // for std::ostringstream
+
+ #include "util/bpf_names.h"
+
+diff --git a/tests/opaque.cpp b/tests/opaque.cpp
+index a030a05d..034888d3 100644
+--- a/tests/opaque.cpp
++++ b/tests/opaque.cpp
+@@ -1,6 +1,7 @@
+ #include "util/opaque.h"
+ #include "gtest/gtest.h"
+ #include <cstring>
++#include <numbers> // for std::numbers
+ #include <string>
+ #include <vector>
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-Raise-max-supported-clang-version-to-clang-21.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-Raise-max-supported-clang-version-to-clang-21.patch
new file mode 100644
index 0000000000..3fb8d131b6
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-Raise-max-supported-clang-version-to-clang-21.patch
@@ -0,0 +1,24 @@
+From 7bd8ec690ad587e7f180bcd061a6205b28d86260 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 31 Aug 2025 09:50:35 -0700
+Subject: [PATCH] cmake: Raise max supported clang version to clang-21
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 025fa738..a0f16dd1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -172,7 +172,7 @@ if(CMAKE_BUILD_TYPE STREQUAL "Debug")
+   # releases.
+   set(MAX_LLVM_MAJOR 999)
+ else()
+-  set(MAX_LLVM_MAJOR 20)
++  set(MAX_LLVM_MAJOR 21)
+ endif()
+ 
+ if((${LLVM_VERSION_MAJOR} VERSION_LESS ${MIN_LLVM_MAJOR}) OR (${LLVM_VERSION_MAJOR} VERSION_GREATER ${MAX_LLVM_MAJOR}))
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch
index 4f0ebbf564..c9e1749dd5 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch
@@ -12,7 +12,7 @@ Upstream-Status: Pending
 
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -100,16 +100,20 @@ include_directories(SYSTEM ${LIBCEREAL_I
+@@ -108,16 +108,21 @@ include_directories(SYSTEM ${LIBCEREAL_I
  
  find_package(BISON REQUIRED)
  find_package(FLEX REQUIRED)
@@ -20,15 +20,16 @@ Upstream-Status: Pending
 +# avoid buildpaths in generated #line statements and allow to pass --file-prefix-map=OLD=NEW
 +set(BISON_FLAGS "${BISON_FLAGS} -l")
 +set(FLEX_FLAGS "${FLEX_FLAGS} -L")
++
  # `parser_class_name` is deprecated and generates warnings in bison >= 3.3.
  # But `api.parser.class` is not supported in bison < 3.3. So we must inject
  # the %define based on the bison version here.
  if(${BISON_VERSION} VERSION_GREATER_EQUAL 3.3)
--  set(BISON_FLAGS "-Dapi.parser.class={Parser}")
-+  set(BISON_FLAGS "${BISON_FLAGS} -Dapi.parser.class={Parser}")
+-  set(BISON_FLAGS "-Dapi.parser.class={Parser} -Wcounterexamples")
++  set(BISON_FLAGS "${BISON_FLAGS} -Dapi.parser.class={Parser} -Wcounterexamples")
  else()
--  set(BISON_FLAGS "-Dparser_class_name={Parser}")
-+  set(BISON_FLAGS "${BISON_FLAGS} -Dparser_class_name={Parser}")
+-  set(BISON_FLAGS "-Dparser_class_name={Parser} -Wcounterexamples")
++  set(BISON_FLAGS "${BISON_FLAGS} -Dparser_class_name={Parser} -Wcounterexamples")
  endif()
  bison_target(bison_parser src/parser.yy ${CMAKE_BINARY_DIR}/parser.tab.cc COMPILE_FLAGS ${BISON_FLAGS} VERBOSE)
 -flex_target(flex_lexer src/lexer.l ${CMAKE_BINARY_DIR}/lex.yy.cc)
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-chrono-Fix-build-when-using-libc-casting-ns-to-syste.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-chrono-Fix-build-when-using-libc-casting-ns-to-syste.patch
new file mode 100644
index 0000000000..140cc12add
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-chrono-Fix-build-when-using-libc-casting-ns-to-syste.patch
@@ -0,0 +1,54 @@
+From 381047c14dfbc3b89a5e87404cb7cf886f10c119 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 31 Aug 2025 15:26:36 -0700
+Subject: [PATCH 2/3] chrono: Fix build when using libc++ casting ns to
+ system_clock::duration
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+libc++ from LLVM/Clang 21 release requires that time_point::operator+=
+receive the exact duration type of the time_point. On many Linux configs,
+system_clock::duration is microseconds, so doing:
+
+  t += std::chrono::nanoseconds(...);
+
+fails with:
+  error: no viable overloaded '+='
+  note: candidate function not viable: no known conversion from
+        'duration<..., nano>' to 'const duration<..., micro>' for 1st argument
+
+Cast the nanoseconds to system_clock::duration via duration_cast before
+adding them. This builds with Clang 21 + libc++ and remains compatible
+with libstdc++. Semantics are unchanged except for truncation to the
+clock’s native resolution (which already applies).
+
+No functional change intended.
+
+Upstream-Status: Submitted [https://github.com/bpftrace/bpftrace/pull/4526]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/bpftrace.cpp | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/bpftrace.cpp b/src/bpftrace.cpp
+index a49a3efe..485267e0 100644
+--- a/src/bpftrace.cpp
++++ b/src/bpftrace.cpp
+@@ -992,11 +992,13 @@ std::chrono::time_point<std::chrono::system_clock> BPFtrace::resolve_timestamp(
+           << "Cannot resolve timestamp due to failed boot time calculation";
+     } else {
+       t += std::chrono::seconds(boottime_->tv_sec);
+-      t += std::chrono::nanoseconds(boottime_->tv_nsec);
++      t += std::chrono::duration_cast<std::chrono::system_clock::duration>(
++               std::chrono::nanoseconds(boottime_->tv_nsec));
+     }
+   }
+
+-  t += std::chrono::nanoseconds(nsecs);
++  t += std::chrono::duration_cast<std::chrono::system_clock::duration>(
++           std::chrono::nanoseconds(nsecs));
+   return t;
+ }
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-ast-Adapt-to-Clang-LLVM-21-DiagnosticOptions-API.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-ast-Adapt-to-Clang-LLVM-21-DiagnosticOptions-API.patch
new file mode 100644
index 0000000000..e5ae0219f7
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-ast-Adapt-to-Clang-LLVM-21-DiagnosticOptions-API.patch
@@ -0,0 +1,78 @@
+From 9771348249981680c2b893a435099673e79997c4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 31 Aug 2025 15:29:26 -0700
+Subject: [PATCH 3/3] ast: Adapt to Clang/LLVM 21 DiagnosticOptions API
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Clang 21 removed intrusive ref-counting from DiagnosticOptions and
+switched consumers to take a DiagnosticOptions&. Building bpftrace
+with clang-21/libc++ failed with errors like:
+
+  IntrusiveRefCntPtr.h:163: error: no member named 'Retain' in
+    'clang::DiagnosticOptions'
+  Diagnostic.h:578: no known conversion from
+    'IntrusiveRefCntPtr<clang::DiagnosticOptions>' to
+    'DiagnosticOptions&'
+
+Update the frontend glue:
+- For LLVM >= 21, construct a real DiagnosticOptions object and pass
+  it by reference to TextDiagnosticPrinter and DiagnosticsEngine
+  (no IntrusiveRefCntPtr). Keep it alive via shared_ptr to satisfy
+  DiagnosticsEngine’s reference lifetime.
+- Replace ci.setInvocation(inv) with
+  ci.getInvocation() = *inv; which is stable across modern Clang.
+
+Retain the old code path for LLVM < 21 via #if guards.
+
+This fixes builds with clang-21/libc++ while keeping compatibility
+with older LLVM releases.
+
+No functional change intended.
+
+Upstream-Status: Submitted [https://github.com/bpftrace/bpftrace/pull/4526]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ast/passes/clang_build.cpp | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/src/ast/passes/clang_build.cpp b/src/ast/passes/clang_build.cpp
+index fa5b2add..3debc350 100644
+--- a/src/ast/passes/clang_build.cpp
++++ b/src/ast/passes/clang_build.cpp
+@@ -78,12 +78,21 @@ static Result<> build(CompileContext &ctx,
+   // a string, which we can then capture and associate with the import.
+   std::string errstr;
+   llvm::raw_string_ostream err(errstr);
++#if LLVM_VERSION_MAJOR < 21
+   auto diagOpts = llvm::makeIntrusiveRefCnt<clang::DiagnosticOptions>();
+   auto diags = std::make_unique<clang::DiagnosticsEngine>(
+       llvm::makeIntrusiveRefCnt<clang::DiagnosticIDs>(),
+       diagOpts,
+       new clang::TextDiagnosticPrinter(err, diagOpts.get()));
+-
++#else
++  // Clang 21: DiagnosticOptions is NOT intrusive-refcounted anymore.
++  // Keep it alive for the program lifetime (or store it on a longer-lived object).
++  static std::shared_ptr<clang::DiagnosticOptions> diagOpts =
++      std::make_shared<clang::DiagnosticOptions>();
++  llvm::IntrusiveRefCntPtr<clang::DiagnosticIDs> diagID(new clang::DiagnosticIDs());
++  auto client = std::make_unique<clang::TextDiagnosticPrinter>(err, *diagOpts);
++  auto diags = std::make_unique<clang::DiagnosticsEngine>(diagID, *diagOpts, client.release());
++#endif
+   // We create a temporary memfd that we can use to store the output,
+   // since the ClangDriver API is framed in terms of filenames. Perhaps
+   // we could use the internals here, but that carries other risks.
+@@ -122,7 +131,9 @@ static Result<> build(CompileContext &ctx,
+   inv->getCodeGenOpts().DebugColumnInfo = true;
+
+   clang::CompilerInstance ci;
+-  ci.setInvocation(inv);
++  // Cross-version friendly: assign into the existing invocation
++  // (works across modern Clang majors, including 21)
++  ci.getInvocation() = *inv;
+   ci.setDiagnostics(diags.release());
+   ci.setFileManager(new clang::FileManager(clang::FileSystemOptions(), vfs));
+   ci.createSourceManager(ci.getFileManager());
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.5.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb
similarity index 82%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.5.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb
index 1b2f8ab0e4..7e9cbf485e 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.5.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb
@@ -7,6 +7,7 @@ DEPENDS += "bison-native \
             flex-native \
             gzip-native \
             elfutils \
+            bpftool-native \
             bcc \
             systemtap \
             libcereal \
@@ -16,11 +17,15 @@ DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'pahole-native llvm-nativ
 
 RDEPENDS:${PN} += "bash python3 xz"
 
-SRC_URI = "git://github.com/iovisor/bpftrace;branch=release/0.23.x;protocol=https \
+SRC_URI = "git://github.com/iovisor/bpftrace;branch=master;protocol=https \
            file://run-ptest \
+           file://0001-cmake-Raise-max-supported-clang-version-to-clang-21.patch \
            file://0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch \
+           file://0001-Include-missing-c-runtime-headers.patch \
+           file://0002-chrono-Fix-build-when-using-libc-casting-ns-to-syste.patch \
+           file://0003-ast-Adapt-to-Clang-LLVM-21-DiagnosticOptions-API.patch \
 "
-SRCREV = "e48ccc66c9971515648b63699bc4b1490c388d85"
+SRCREV = "3b78184eed28501ab4bbb55e45c4172538999da1"
 
 inherit bash-completion cmake ptest pkgconfig
 

