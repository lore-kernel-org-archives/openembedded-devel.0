Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.1827.1615249450810666243
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 16:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AL0fbk8U;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so4142349pjb.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Mar 2021 16:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hXqvNx2VFpxPtzottROAGcc4gRXJNp6Hpr3yMlBXyoo=;
        b=AL0fbk8UrG463GKkjvL4r826ICc/yRo5sN3VDepODgbHqVKORTi+v1DpA2wT9anfDo
         /x8EvYAtp7+kEVGRXXvN2i4ne8sghX6nW1YimNXiPz8XEHJLjyZRY/d41mfZcLNkECrx
         3gDg2z2F7g6aGSrl1qSpH8I19GVUCWZ1yITeYvGE1gOm+HscPegqCRBneaZfxHRbbU3v
         mBy4oMBm1R+D6gTGYFYm231mBlMA1Mn1hsrKMBEKZIjPDIwouJZfQ701GPZYi+qiDRw2
         nY7jlcjHCQaaFKcNPYBE6k8Tu5btjh51lp5FjNmIrDqEN7d/zpuwj5cX/jKA+Tv8C3MM
         sMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hXqvNx2VFpxPtzottROAGcc4gRXJNp6Hpr3yMlBXyoo=;
        b=g9IcUGckNGVVyKKJ2PyZihsRrzKInH2DNCFtgTiyBE92u77Q7x9dBO5IXwWaJUm17f
         k1o48T576PAvfjE2OIetlR06XpTcBTeZtnzY1l+avKnq0DbpUVnJwKS7qDPSPS01H01F
         gKIkCMp1CtLF00s4FRx0YI/eHEhZKgUyBfAvVeHc4TF2Yh5Q7p2ZmApnmk8pi7GpN5Bz
         wUwryGVkaJtO8fL9vpGhSFN88dCfpcoid7drnu5LctVeoouC952QgTRLseiAHlVUFhHz
         lO1iUmIMqh3uUtfEY5d8GL9F+pUgL/p2He0Ucc6MDZEIAiv8wo4CZ5x5924yPPamQa+H
         1gFw==
X-Gm-Message-State: AOAM531b7zFYHbewBvPNpsAw+pSoZWTPrxQanp0jygiWuvTkEsyFVhCZ
	c3VzZT7TiSTtpoq3yDwgKBAbwBJdwTg/YQ==
X-Google-Smtp-Source: ABdhPJxZo90TweklOdIJG9BGmTzvWea+Hpcep6FVC3f2is7s9oWHWJofT/OdHDwNt9H2Gp/8jmpNyQ==
X-Received: by 2002:a17:902:8ec9:b029:e6:f8c:c3d1 with SMTP id x9-20020a1709028ec9b02900e60f8cc3d1mr10918760plo.42.1615249450090;
        Mon, 08 Mar 2021 16:24:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id s200sm11316618pfs.53.2021.03.08.16.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 16:24:09 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] glog: Link with libexecinfo on musl
Date: Mon,  8 Mar 2021 16:24:06 -0800
Message-Id: <20210309002406.2947396-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309002406.2947396-1-raj.khem@gmail.com>
References: <20210309002406.2947396-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

some platforms e.g. riscv do not yet have libunwind ported so use
libexecinfo instead

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glog/glog/libexecinfo.patch               | 29 +++++++++++++++++++
 meta-oe/recipes-support/glog/glog_0.4.0.bb    |  4 +++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/glog/glog/libexecinfo.patch

diff --git a/meta-oe/recipes-support/glog/glog/libexecinfo.patch b/meta-oe/recipes-support/glog/glog/libexecinfo.patch
new file mode 100644
index 0000000000..ae46d3274f
--- /dev/null
+++ b/meta-oe/recipes-support/glog/glog/libexecinfo.patch
@@ -0,0 +1,29 @@
+Link libexecinfo if its found, this is needed for musl based systems
+
+Fixes
+ld: libglog.so.0.4.0: undefined reference to `backtrace'
+| collect2: error: ld returned 1 exit status
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -115,6 +115,7 @@ check_cxx_compiler_flag (-Wunnamed-type-
+ check_symbol_exists (snprintf stdio.h HAVE_SNPRINTF)
+ 
+ check_library_exists (dbghelp UnDecorateSymbolName "" HAVE_DBGHELP)
++check_library_exists (execinfo backtrace "" HAVE_EXECINFO)
+ 
+ find_package(Libunwind)
+ 
+@@ -471,6 +472,10 @@ if (Libunwind_FOUND)
+   target_link_libraries (glog PUBLIC unwind)
+ endif (Libunwind_FOUND)
+ 
++if (HAVE_EXECINFO)
++  target_link_libraries (glog PUBLIC execinfo)
++endif (HAVE_EXECINFO)
++
+ if (HAVE_DBGHELP)
+    target_link_libraries (glog PUBLIC dbghelp)
+ endif (HAVE_DBGHELP)
diff --git a/meta-oe/recipes-support/glog/glog_0.4.0.bb b/meta-oe/recipes-support/glog/glog_0.4.0.bb
index 8dc84e4125..6b101ef676 100644
--- a/meta-oe/recipes-support/glog/glog_0.4.0.bb
+++ b/meta-oe/recipes-support/glog/glog_0.4.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
 SRC_URI = " \
     git://github.com/google/glog.git;nobranch=1 \
     file://0001-Find-Libunwind-during-configure.patch \
+    file://libexecinfo.patch \
 "
 
 SRCREV = "96a2f23dca4cc7180821ca5f32e526314395d26a"
@@ -20,8 +21,11 @@ inherit cmake
 PACKAGECONFIG ?= "shared unwind"
 PACKAGECONFIG_remove_riscv64 = "unwind"
 PACKAGECONFIG_remove_riscv32 = "unwind"
+PACKAGECONFIG_append_libc-musl_riscv64 = " execinfo"
+PACKAGECONFIG_append_libc-musl_riscv32 = " execinfo"
 
 PACKAGECONFIG[unwind] = "-DWITH_UNWIND=ON,-DWITH_UNWIND=OFF,libunwind,libunwind"
+PACKAGECONFIG[execinfo] = ",,libexecinfo"
 PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF,,"
 
 do_configure_append() {
-- 
2.30.1

