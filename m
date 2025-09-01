Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A375CA1002
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 22:42:53 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.64473.1756766568985574652
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Sep 2025 15:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yf4/jR3z;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77256200f1bso1144568b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 15:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756766568; x=1757371368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VaeYK5HKqqU4d2beDHEIyqOSnOdOXNfkgEHNSlM5+z4=;
        b=Yf4/jR3zIh1I/4cHqMX0e4ehwx7Xx5CXMp1iFIVF3C6KfNkw45jE454Umc/C4qezUW
         3hOHd3shHgTUcx8aKtPxvAx67ueCPbusz2zw4S9y8UcDt6fLMPIfclnzzVLld3OfNjOg
         Pnqi6mbWhUIqi0ktB+qnauf/80ZtLutMpqqqt5cLChm6sGCnTDFI1mk0La3P5ChRyidl
         Z8IOVY5iptAeVKvT3hQsIQbtfgMwhROLk8CIcacS1C0IYEGbZohxmWT640nIXdOS1c6N
         lyoBV/UNQMyb/Gwzx7Qkhwe3g2VBPdAOnkK1Rh7B8ke3bwJ3UJJW+ZOPk77kg6fPkoJ9
         UeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766568; x=1757371368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaeYK5HKqqU4d2beDHEIyqOSnOdOXNfkgEHNSlM5+z4=;
        b=GyKYdayK5NfKLSa2BX/YzEMoA2durpvk07sjiQpTwxOdCRqQ32DXNkHT2NWD8gz2DZ
         BFN/rgtjxEUNFzK+bIMhCrC+UJ2znBOzfXdlRL6yN5gIHGBpErry1Z/4e44U4mCZSUU3
         FAoFFnhvWEVikR0KXCjcxJTr0hj/QG6xXlId4m2n/M7gK0io9fyIdfrqGVBt04immmmf
         G5GrSdtAYJy9eHsCWkX6qHpRxum8vp84I0SKTSxxi07GXgEmdUynvm/vt43qjbrWDw/Z
         D+bSpDe4znQZeh7hdvubbzRJ7EtyKmNwR+Zd4tisY/uDXDqSWnC23xLXZNpUS4BdhxP4
         zT4Q==
X-Gm-Message-State: AOJu0Yxpsw/8Hvzkb2yaunJ2fJJHH3FRGg1xkEi+URJRH1nFLOZU4y+i
	JNA+BtnUqJ2PVEOBjLX18pL8Y0C3lfnQApRq4sCNxIST63E7iholV5r7vYhj7lFE
X-Gm-Gg: ASbGncu2vp0REh7Db8RJCqC3uUAsyx8YF57QU3yUl9rWyFbE/8sDNz0Xvp4A7aCuq2/
	TwcOwCUhofqXGE/VPfG6BTNX/M7TX6eGwlpE3551X9hzf3Cjg6wbVRz5Cl8jIKhsSFA5kBLCNOG
	wH2r/kFNHM0VF7//wFXtoikSR0lpyPMH4KpuUIlbWaRVXkfr5NcjMSZeP97kB6cTXjZp6ccs+wq
	709pHU1MmdkvIhhkWcZ9A2JhR1IhB/o/Gg4qyrEvje/q8VS76EfkayWleV5ykOMYrzKN/g+e+He
	C9Yan/8I0gTy3KHJV16Au6RLoH4X+tFA1XYgLTyeyQSYSm7h5TlC+ygCmoCJ4MEFaT4pOCq3SJ/
	y70ljaf9Qlyek1hda0N03/PCRR4JuacB5xfxwiNctXPcZ+vEyTUQ2bqMOtPU7/FrW0zr4ASfy/Q
	qcnZruPkH3upaHyOxYtlpWvi5kFFzZjYQvqJsQEOHWS2XK0nfk/y8=
X-Google-Smtp-Source: AGHT+IHDknU1j1u1kAohFZpiYtAxjEx0bSr3BCljjwFHVovfOYfoVPimwXGgRSNqYLH0POX5x9W4Nw==
X-Received: by 2002:a05:6a00:bd90:b0:771:ead8:dcdb with SMTP id d2e1a72fcca58-7723e258689mr10020807b3a.8.1756766567972;
        Mon, 01 Sep 2025 15:42:47 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::c2de])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4beb72sm11648240b3a.61.2025.09.01.15.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:42:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/5] bpftrace: Upgrade to 0.23.5 release
Date: Mon,  1 Sep 2025 15:42:39 -0700
Message-ID: <20250901224244.1913647-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 22:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119162

Drop backported patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-failures-due-to-missing-location.hh.patch | 54 -------------------
 ...{bpftrace_0.23.0.bb => bpftrace_0.23.5.bb} |  5 +-
 2 files changed, 1 insertion(+), 58 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Fix-build-failures-due-to-missing-location.hh.patch
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/{bpftrace_0.23.0.bb => bpftrace_0.23.5.bb} (94%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Fix-build-failures-due-to-missing-location.hh.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Fix-build-failures-due-to-missing-location.hh.patch
deleted file mode 100644
index 1c2ae33238..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Fix-build-failures-due-to-missing-location.hh.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 24421ba92c69f1abaadaff01270621917616a2b8 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 17 Apr 2025 10:38:50 +0800
-Subject: [PATCH] Fix build failures due to missing location.hh
-
-ast/location.h does `#include "location.hh"` and location.hh is
-generated by the parser so any CMake target whose source includes
-ast/location.h needs to have a dependency on the `parser` target,
-otherwise the compilation may fail due to incorrect ordering of build
-targets. This also applies to targets which include ast/location.h
-transitively via other headers.
-
-To avoid such errors, do 2 things:
-- drop includes of ast/location.h where unused
-- for CMake targets including ast/location.h, add an explicit dependency
-  on the `parser` target
-
-Signed-off-by: Viktor Malik <viktor.malik@gmail.com>
-
-Upstream-Status: Backport [https://github.com/bpftrace/bpftrace/commit/743cb9c88c25fb9737d714f4d4ac853f05bb6481]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/CMakeLists.txt     | 1 +
- src/ast/CMakeLists.txt | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index e04ee429..13a51040 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -21,6 +21,7 @@ add_library(compiler_core STATIC
-   struct.cpp
-   types.cpp
- )
-+add_dependencies(compiler_core parser)
- 
- add_library(runtime STATIC
-   attached_probe.cpp
-diff --git a/src/ast/CMakeLists.txt b/src/ast/CMakeLists.txt
-index 92231f85..7230cf71 100644
---- a/src/ast/CMakeLists.txt
-+++ b/src/ast/CMakeLists.txt
-@@ -22,6 +22,7 @@ add_library(ast STATIC
-   passes/return_path_analyser.cpp
- )
- 
-+add_dependencies(ast parser)
- target_compile_definitions(ast PRIVATE ${BPFTRACE_FLAGS})
- target_link_libraries(ast PUBLIC ast_defs arch compiler_core parser)
- 
--- 
-2.34.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.5.bb
similarity index 94%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.0.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.5.bb
index c8ccf4c83f..1b2f8ab0e4 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.5.bb
@@ -16,14 +16,11 @@ DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'pahole-native llvm-nativ
 
 RDEPENDS:${PN} += "bash python3 xz"
 
-PV .= "+git"
-
 SRC_URI = "git://github.com/iovisor/bpftrace;branch=release/0.23.x;protocol=https \
            file://run-ptest \
            file://0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch \
-           file://0001-Fix-build-failures-due-to-missing-location.hh.patch \
 "
-SRCREV = "01e806d24c61f996f1809e1e991646311499db4f"
+SRCREV = "e48ccc66c9971515648b63699bc4b1490c388d85"
 
 inherit bash-completion cmake ptest pkgconfig
 

