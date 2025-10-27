Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9CACCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 02:56:30 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.23989.1761533776220756666
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Oct 2025 19:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UhHUox2a;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so214859b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 19:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761533775; x=1762138575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=He6RZbreq2r+iq4JziJof4NeO4bt3i/V5mA8ih/W1w0=;
        b=UhHUox2aKtHiFWBlW7LpXbyqQaM48C97OxgeKKCtSLgYwE5WZbDrGFvbEFYreNiIi3
         AK3qCgwoNCJcXhdrsnoYgi9tm7SvwwSkRHTkBPzqeatew7n8m98h4h+5hdJtxdCRDvXU
         Ze56zDLwgT+39mYLgpkCKFFiaZLv/CjPHdRNRjCsLfkq56ys1hqfXVpwJTtpu6ZpJtsY
         PGFcj4tjjs7CuzjPJAeiqt4D9ln0u59gL2cxHof2W7lRHnYr0asM3Xa2xJdstTshoirO
         +dPjrNk3nf98S8rn6GyoAn5p6ptYPylIMkyqc1emHvVJ7MX5NSkzqLogl9ZI2oyiaDCs
         mxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761533775; x=1762138575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=He6RZbreq2r+iq4JziJof4NeO4bt3i/V5mA8ih/W1w0=;
        b=WL9g8t0BER9Vi7JJtn7CbGCa41YT0foM+Z/dQw2NzbkslMIRLdKNwXLyF1YilxS13Q
         yf3Q3m35V5XO0FX01X4ydKyAIbI9daePGIZQ6b2S+Sinnu0oz9zAjEIFfZ0FLSLffsFG
         2cmVjRCMqSZ6npR+e4/SiFICVCbnthl3JDw4BCTUGAXcYP5u62u72pXyEQUtpWcylG6n
         rTq1zWRS/9xRF0PhCXYLnZ5BmzYYKjuVFgLSM5TMN8o/vrH9T+KLJydGh9vuWVg7N/Ck
         s9ow4KMO1cu7ubmQl7kEhyiAvwiWnkHDvvyoHzFWW0sOYBEDDlgnoLlf9daiEVOr0rLV
         LOxQ==
X-Gm-Message-State: AOJu0Yy30uiHtieSkmS7XSnRIxDyJT6p68KLsdid4KUAPY80EXZ7qzIW
	rqWYNzx1J7M7FDwoYY4R7McPNGDCgXHA9ZO4bFV378qLn1/BPQkP5CjITSphon3w
X-Gm-Gg: ASbGncswZbBI2v+7RDUXmKprY4No1jxG8V0Dx6dY5bg3tGH4FigKmh/L9pJhVsSfx2h
	k+cd7U3N18I17qK3Zmb/doS3GkY5fNS63SoStw1zJ82rUOBWxDacHbjyxTXik7rKMzGT1OSlZyQ
	xtt+b6rwxPq/7rIpJKpbOvzZy/JNMipNu7M58ReQInYL9yymzWrQSBTahSYb/OBdB39cb9tMOxT
	aqt7e3gxvq4fcV6AkZg5WBnhPG52FqD7I7Iy5YTjJuH7PDMz8yqdMAWid2XH/WbkhjLmxnZUY2l
	fgUC399/f+cNT15F90G8n8X/7WgMHyvAcl0FXEiONseahQkHG19r78uXX7YL8oEMwqsmS+9hevH
	ksVAF+/NgY/MVwqT2/IOQDJ5PaPQQnH1Ze1pnnjiq2gS8RV6ftsC3SXS6K0wvW1fs+h1AAr6fwN
	SJ6HheXqSzQmFIc2WYQ7V2/sJyAG86kkgfPeX2CmAIIiNZe1tPJO/pbuU7WOc52w==
X-Google-Smtp-Source: AGHT+IFFTBdKf2zChvTsjyEn4Y8rTDs8EBSGsCaScmIgM0h19u+PNcgzOThirACnPaU2ubr2xNtfFg==
X-Received: by 2002:a17:903:1c9:b0:278:9051:8ea9 with SMTP id d9443c01a7336-2946e117e69mr168883105ad.40.1761533775102;
        Sun, 26 Oct 2025 19:56:15 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf358fsm63081095ad.20.2025.10.26.19.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 19:56:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] bpftrace: Upgrade to 0.24.1 release
Date: Sun, 26 Oct 2025 19:56:10 -0700
Message-ID: <20251027025612.2575320-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 02:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121021

Drop upstreamed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Include-missing-c-runtime-headers.patch | 39 ----------
 ...-supported-clang-version-to-clang-21.patch | 24 ------
 ...-when-using-libc-casting-ns-to-syste.patch | 54 -------------
 ...-Clang-LLVM-21-DiagnosticOptions-API.patch | 78 -------------------
 ...{bpftrace_0.24.0.bb => bpftrace_0.24.1.bb} |  8 +-
 5 files changed, 2 insertions(+), 201 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Include-missing-c-runtime-headers.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-Raise-max-supported-clang-version-to-clang-21.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-chrono-Fix-build-when-using-libc-casting-ns-to-syste.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-ast-Adapt-to-Clang-LLVM-21-DiagnosticOptions-API.patch
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/{bpftrace_0.24.0.bb => bpftrace_0.24.1.bb} (83%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Include-missing-c-runtime-headers.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Include-missing-c-runtime-headers.patch
deleted file mode 100644
index d3009fa295..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Include-missing-c-runtime-headers.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From ead4dc45e35fc6c3770ef4021720e0e6a5b60674 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 31 Aug 2025 15:23:27 -0700
-Subject: [PATCH 1/3] Include missing c++ runtime headers
-
-These headers are required and found to fail builds
-when using llvm/libc++ instead of libstdc++ on linux
-
-Upstream-Status: Submitted [https://github.com/bpftrace/bpftrace/pull/4526]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/util/bpf_names.cpp | 1 +
- tests/opaque.cpp       | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/util/bpf_names.cpp b/src/util/bpf_names.cpp
-index 68525bfc..ab8f6f2f 100644
---- a/src/util/bpf_names.cpp
-+++ b/src/util/bpf_names.cpp
-@@ -1,6 +1,7 @@
- #include <algorithm>
- #include <iomanip>
- #include <iostream>
-+#include <sstream>   // for std::ostringstream
-
- #include "util/bpf_names.h"
-
-diff --git a/tests/opaque.cpp b/tests/opaque.cpp
-index a030a05d..034888d3 100644
---- a/tests/opaque.cpp
-+++ b/tests/opaque.cpp
-@@ -1,6 +1,7 @@
- #include "util/opaque.h"
- #include "gtest/gtest.h"
- #include <cstring>
-+#include <numbers> // for std::numbers
- #include <string>
- #include <vector>
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-Raise-max-supported-clang-version-to-clang-21.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-Raise-max-supported-clang-version-to-clang-21.patch
deleted file mode 100644
index 3fb8d131b6..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-cmake-Raise-max-supported-clang-version-to-clang-21.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 7bd8ec690ad587e7f180bcd061a6205b28d86260 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 31 Aug 2025 09:50:35 -0700
-Subject: [PATCH] cmake: Raise max supported clang version to clang-21
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 025fa738..a0f16dd1 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -172,7 +172,7 @@ if(CMAKE_BUILD_TYPE STREQUAL "Debug")
-   # releases.
-   set(MAX_LLVM_MAJOR 999)
- else()
--  set(MAX_LLVM_MAJOR 20)
-+  set(MAX_LLVM_MAJOR 21)
- endif()
-
- if((${LLVM_VERSION_MAJOR} VERSION_LESS ${MIN_LLVM_MAJOR}) OR (${LLVM_VERSION_MAJOR} VERSION_GREATER ${MAX_LLVM_MAJOR}))
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-chrono-Fix-build-when-using-libc-casting-ns-to-syste.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-chrono-Fix-build-when-using-libc-casting-ns-to-syste.patch
deleted file mode 100644
index 140cc12add..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-chrono-Fix-build-when-using-libc-casting-ns-to-syste.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 381047c14dfbc3b89a5e87404cb7cf886f10c119 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 31 Aug 2025 15:26:36 -0700
-Subject: [PATCH 2/3] chrono: Fix build when using libc++ casting ns to
- system_clock::duration
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-libc++ from LLVM/Clang 21 release requires that time_point::operator+=
-receive the exact duration type of the time_point. On many Linux configs,
-system_clock::duration is microseconds, so doing:
-
-  t += std::chrono::nanoseconds(...);
-
-fails with:
-  error: no viable overloaded '+='
-  note: candidate function not viable: no known conversion from
-        'duration<..., nano>' to 'const duration<..., micro>' for 1st argument
-
-Cast the nanoseconds to system_clock::duration via duration_cast before
-adding them. This builds with Clang 21 + libc++ and remains compatible
-with libstdc++. Semantics are unchanged except for truncation to the
-clock’s native resolution (which already applies).
-
-No functional change intended.
-
-Upstream-Status: Submitted [https://github.com/bpftrace/bpftrace/pull/4526]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/bpftrace.cpp | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/bpftrace.cpp b/src/bpftrace.cpp
-index a49a3efe..485267e0 100644
---- a/src/bpftrace.cpp
-+++ b/src/bpftrace.cpp
-@@ -992,11 +992,13 @@ std::chrono::time_point<std::chrono::system_clock> BPFtrace::resolve_timestamp(
-           << "Cannot resolve timestamp due to failed boot time calculation";
-     } else {
-       t += std::chrono::seconds(boottime_->tv_sec);
--      t += std::chrono::nanoseconds(boottime_->tv_nsec);
-+      t += std::chrono::duration_cast<std::chrono::system_clock::duration>(
-+               std::chrono::nanoseconds(boottime_->tv_nsec));
-     }
-   }
-
--  t += std::chrono::nanoseconds(nsecs);
-+  t += std::chrono::duration_cast<std::chrono::system_clock::duration>(
-+           std::chrono::nanoseconds(nsecs));
-   return t;
- }
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-ast-Adapt-to-Clang-LLVM-21-DiagnosticOptions-API.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-ast-Adapt-to-Clang-LLVM-21-DiagnosticOptions-API.patch
deleted file mode 100644
index e5ae0219f7..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-ast-Adapt-to-Clang-LLVM-21-DiagnosticOptions-API.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 9771348249981680c2b893a435099673e79997c4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 31 Aug 2025 15:29:26 -0700
-Subject: [PATCH 3/3] ast: Adapt to Clang/LLVM 21 DiagnosticOptions API
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Clang 21 removed intrusive ref-counting from DiagnosticOptions and
-switched consumers to take a DiagnosticOptions&. Building bpftrace
-with clang-21/libc++ failed with errors like:
-
-  IntrusiveRefCntPtr.h:163: error: no member named 'Retain' in
-    'clang::DiagnosticOptions'
-  Diagnostic.h:578: no known conversion from
-    'IntrusiveRefCntPtr<clang::DiagnosticOptions>' to
-    'DiagnosticOptions&'
-
-Update the frontend glue:
-- For LLVM >= 21, construct a real DiagnosticOptions object and pass
-  it by reference to TextDiagnosticPrinter and DiagnosticsEngine
-  (no IntrusiveRefCntPtr). Keep it alive via shared_ptr to satisfy
-  DiagnosticsEngine’s reference lifetime.
-- Replace ci.setInvocation(inv) with
-  ci.getInvocation() = *inv; which is stable across modern Clang.
-
-Retain the old code path for LLVM < 21 via #if guards.
-
-This fixes builds with clang-21/libc++ while keeping compatibility
-with older LLVM releases.
-
-No functional change intended.
-
-Upstream-Status: Submitted [https://github.com/bpftrace/bpftrace/pull/4526]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/ast/passes/clang_build.cpp | 15 +++++++++++++--
- 1 file changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/src/ast/passes/clang_build.cpp b/src/ast/passes/clang_build.cpp
-index fa5b2add..3debc350 100644
---- a/src/ast/passes/clang_build.cpp
-+++ b/src/ast/passes/clang_build.cpp
-@@ -78,12 +78,21 @@ static Result<> build(CompileContext &ctx,
-   // a string, which we can then capture and associate with the import.
-   std::string errstr;
-   llvm::raw_string_ostream err(errstr);
-+#if LLVM_VERSION_MAJOR < 21
-   auto diagOpts = llvm::makeIntrusiveRefCnt<clang::DiagnosticOptions>();
-   auto diags = std::make_unique<clang::DiagnosticsEngine>(
-       llvm::makeIntrusiveRefCnt<clang::DiagnosticIDs>(),
-       diagOpts,
-       new clang::TextDiagnosticPrinter(err, diagOpts.get()));
--
-+#else
-+  // Clang 21: DiagnosticOptions is NOT intrusive-refcounted anymore.
-+  // Keep it alive for the program lifetime (or store it on a longer-lived object).
-+  static std::shared_ptr<clang::DiagnosticOptions> diagOpts =
-+      std::make_shared<clang::DiagnosticOptions>();
-+  llvm::IntrusiveRefCntPtr<clang::DiagnosticIDs> diagID(new clang::DiagnosticIDs());
-+  auto client = std::make_unique<clang::TextDiagnosticPrinter>(err, *diagOpts);
-+  auto diags = std::make_unique<clang::DiagnosticsEngine>(diagID, *diagOpts, client.release());
-+#endif
-   // We create a temporary memfd that we can use to store the output,
-   // since the ClangDriver API is framed in terms of filenames. Perhaps
-   // we could use the internals here, but that carries other risks.
-@@ -122,7 +131,9 @@ static Result<> build(CompileContext &ctx,
-   inv->getCodeGenOpts().DebugColumnInfo = true;
-
-   clang::CompilerInstance ci;
--  ci.setInvocation(inv);
-+  // Cross-version friendly: assign into the existing invocation
-+  // (works across modern Clang majors, including 21)
-+  ci.getInvocation() = *inv;
-   ci.setDiagnostics(diags.release());
-   ci.setFileManager(new clang::FileManager(clang::FileSystemOptions(), vfs));
-   ci.createSourceManager(ci.getFileManager());
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.1.bb
similarity index 83%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.1.bb
index 50fada36bf..add2ff01a8 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.1.bb
@@ -18,15 +18,11 @@ DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'pahole-native llvm-nativ
 RDEPENDS:${PN} += "bash python3 xz"
 RDEPENDS:${PN}-ptest += "bpftool"

-SRC_URI = "git://github.com/iovisor/bpftrace;branch=master;protocol=https \
+SRC_URI = "git://github.com/iovisor/bpftrace;branch=release/0.24.x;protocol=https;tag=v${PV} \
            file://run-ptest \
-           file://0001-cmake-Raise-max-supported-clang-version-to-clang-21.patch \
            file://0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch \
-           file://0001-Include-missing-c-runtime-headers.patch \
-           file://0002-chrono-Fix-build-when-using-libc-casting-ns-to-syste.patch \
-           file://0003-ast-Adapt-to-Clang-LLVM-21-DiagnosticOptions-API.patch \
 "
-SRCREV = "3b78184eed28501ab4bbb55e45c4172538999da1"
+SRCREV = "4c1f02a43f993758d445952ccd96e552752defec"

 inherit bash-completion cmake ptest pkgconfig


