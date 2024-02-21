Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AA3C5478A
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 16:21:08 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.17343.1708532461518680319
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 08:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eeQ+PyWu;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5e152c757a5so556966a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 08:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708532460; x=1709137260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JGLrv9KxOPnCPsuYZnPnrGdCewJwu75t9Ud1Uei5WU=;
        b=eeQ+PyWuia84XqB9HOWj0uMG/DmUKEOS552/ygsmhQnjdkG4fyaM+UyOS9R+QF9Os/
         T1iSwoMiLPWt4/V5s6xcqDjw+h/i9752orrVFYyVZ0OQXjC8l7twooexfgZHdoF6yhON
         ruDYozRFUaakhQzygKTgwvubUeMZTXssaJenmwKJUo0OPk4vmqVC25OEE8k9sqloI0I0
         rFecnlvIecACsaxrVsWa+cp48eUFsPruKt/EjE4q2S5nQLNfBlsUFUFrCOUQKwsGFPtF
         tY27hzcREBLnXAgEcOrn6N7caLiBCCBqu3D0Cnjs0bOH+KZ0xlgohNqw5rDADOj+f2Z9
         ujKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708532460; x=1709137260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JGLrv9KxOPnCPsuYZnPnrGdCewJwu75t9Ud1Uei5WU=;
        b=bXZ3sb96OXQGGKK8easRc/iyYLkaRPTYo63ldqfr+pSZns5MxaqxyJy7/GsFZAXAvj
         EcQFG6iABLC/YF4fklesA1VDYKPUzi/g75yRYkmCnUlos4ZYMo3pzrmUyQ6cA1asgFb+
         5sxJK/vDYZULcXz7L11LOhIKdQhIWqurOr8nWqDBpULjnxaWI4TghakH31sB5xtbNX+W
         3lTeKwbrm+hWuXMAqj3yGcFWmi0QvAOAryk4nRUFQ/Ws6Q7+jlYLcevih406OC9raUYH
         lqhylOQH6OZJSZcHq9zghBLW/DCV2FxslFqw5xNPTv0Zr91Dwvngmssj59Oz32ycBMua
         PBow==
X-Gm-Message-State: AOJu0Yyce18vvpoAi46d/Tb6fCoLFCSmJsaL/LEpk7r0/cPKAhMGcyed
	0OiVSD7+gZOkkh9USLY8rLFpz71VhETTTdXaH/gASOOIzcVGJv8qY3IXUJcQMDI=
X-Google-Smtp-Source: AGHT+IGSVGx59OO0NsbY9uXKfKvUcLlTQ1HNml9efVN/F8AfWo1htnMbsZSYzpIIhi7PLuA1tQ6Kkw==
X-Received: by 2002:a17:90a:2dce:b0:299:63fe:3a27 with SMTP id q14-20020a17090a2dce00b0029963fe3a27mr8547554pjm.19.1708532460506;
        Wed, 21 Feb 2024 08:21:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::67c2])
        by smtp.gmail.com with ESMTPSA id nv13-20020a17090b1b4d00b00298e639d17esm9753550pjb.22.2024.02.21.08.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 08:21:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/4] snort: Do not use llvm libunwind
Date: Wed, 21 Feb 2024 08:20:56 -0800
Message-ID: <20240221162057.4154660-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240221162057.4154660-1-raj.khem@gmail.com>
References: <20240221162057.4154660-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 16:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108966

If llvm unwind is present then disable unwinding support since it will
not have all unw_* functions eg. unw_strerror

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-cmake-Check-for-HP-libunwind.patch   | 33 +++++++++++++++++++
 .../recipes-connectivity/snort/snort3_git.bb  |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/snort/snort3/0001-cmake-Check-for-HP-libunwind.patch

diff --git a/meta-networking/recipes-connectivity/snort/snort3/0001-cmake-Check-for-HP-libunwind.patch b/meta-networking/recipes-connectivity/snort/snort3/0001-cmake-Check-for-HP-libunwind.patch
new file mode 100644
index 0000000000..7b7a0d098f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort3/0001-cmake-Check-for-HP-libunwind.patch
@@ -0,0 +1,33 @@
+From 433a412fad2ab0383ac3c625d183a71684f2b97b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 20 Feb 2024 15:35:14 -0800
+Subject: [PATCH] cmake: Check for HP libunwind
+
+This is to ensure that cmake does not detect LLVM unwinder, which
+can provide the support for some HP unwinder functionality but not all
+e.g. unw_strerror goes missing. By checking for libunwind-common.h in
+tests we ensure that this test passes only with HP libunwind.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cmake/FindLibunwind.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
+index f66800a18..1ad66fc83 100644
+--- a/cmake/FindLibunwind.cmake
++++ b/cmake/FindLibunwind.cmake
+@@ -22,7 +22,7 @@ find_package(PkgConfig QUIET)
+ pkg_check_modules(PC_LIBUNWIND libunwind)
+ 
+ find_path(LIBUNWIND_INCLUDE_DIRS
+-    NAMES libunwind.h
++    NAMES libunwind-common.h
+     HINTS ${PC_LIBUNWIND_INCLUDE_DIRS}
+ )
+ 
+-- 
+2.43.2
+
diff --git a/meta-networking/recipes-connectivity/snort/snort3_git.bb b/meta-networking/recipes-connectivity/snort/snort3_git.bb
index f40a1d7d6f..0f4a86f61e 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_git.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_git.bb
@@ -9,7 +9,8 @@ PV = "3+git${SRCPV}"
 
 DEPENDS = "flex hwloc libdaq libdnet libpcap libpcre libtirpc libunwind luajit zlib"
 
-SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master \
+           file://0001-cmake-Check-for-HP-libunwind.patch"
 SRCREV = "e1760a8dbb829bb3fcf1a340ab6cc4bb80a47ecd"
 
 S = "${WORKDIR}/git"
-- 
2.43.2


