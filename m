Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A18C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 02:52:17 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.65706.1744080731497625278
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 19:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kYTnsr9s;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2240b4de12bso67216225ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 19:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744080730; x=1744685530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMuSwuWsuk3Y1s6CmMZi/LH2LCEXqiKbVgVo6z9522s=;
        b=kYTnsr9sp/9bq6LlXhVPdBKeYqLJOmAZz+sERU0xeL0fRrEdd5O6YJDHjZtcoDujRI
         zOlF4pLWUE4GtWSj2AtzrDfgwt/f5lZL2We12CBkw5p8q2ZWvWZMOMW1YVrAiOe+dBa9
         T9+sn8DNSlLNeJs8MrBi1rd71xaiASDnrDlGtsxyMdrAw9AbVlaFnpo1+HphG4px/P8i
         XV9xn6JwUSM4DlXx1TDa2+3eS8rSZbunGdohb/ucrlTHGoENKyv07LwXc80qVmm00okx
         zhHq0vV928xyf7136wnWDX1NMqD3VAyo3piZeHx43vYH9iuk7awNTmgBonHvf+d4RjDG
         fL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744080730; x=1744685530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMuSwuWsuk3Y1s6CmMZi/LH2LCEXqiKbVgVo6z9522s=;
        b=m1NzZUWWbDg0M6yQfGfJ+nqu6J/Qf7QE9RPkiJ0Aa0gFRAcWKHW3DAhREKyLzHTPIn
         lK9u22WMzpFkLXMRdBHSZsynIL4HwH43k8eJ4j7fM47R6ipO3JVasydevzHI+2JXe5Y3
         QkX2se3hyCXR0bzKco+8hh40Jh2m8whh6ieEpnl9NfvHLmXebjyaVmi7XsU2sEX0XfjI
         7dYMpJRleHa7V/zDRqWBiCvuPZ00W4oK+C+QDwjlShyS5WT1WwjHN/V+wV8ikLLrieAZ
         26CW1zKTONRcbY0atYnHMrBOGCR6m8W96AJWQHoeWda1CgmSsAk4P5+HrrwOayhhpi9v
         DknQ==
X-Gm-Message-State: AOJu0Yx5lalraQEpLCd2Girnl3sC+n0R3ng4yNiHnyfFFQwg1GB+YJ53
	k/6sJawRNQu/xJoik/PxRBddhTZGGy4uo1wT24TGSi/PL+O8BYPOrwS084X6
X-Gm-Gg: ASbGncs6ftBFEM4sVotriQv/XirMFLbvNS3Xkp6EmnznKig7wHB6rUCSk44tSoOtyzO
	URIkPU/fUy+fntuWH7zOTwRwBy6DrR28lrDPgPcpUA5EV+8bSnudfEUefKJhb9sG42Ern3g52WG
	xNiW6eh+c3nT+ra8aw8rQZRBuQ80btOkzGy3tJ9FVh0eC9yA7r9tbmuPQjK+vetJrC6H+QB4Lno
	Tmip/OqBdzDLH0P6K/0sugySQkXWVFMVLIxrW7ci4xkEfXWmdrgKdpWVwfucW4bktHjGzgxkm9L
	pX7DTYdkO0A6AroSKm06z57/JUxBUmYR1KhZTvkZtyKbVjw=
X-Google-Smtp-Source: AGHT+IFP2sTWDB7m1OfyW2PNn088RgSV2+0Fpoise0kJUpaN3msGGdbby5WEW1Gp7m3DMbyGaCMW7g==
X-Received: by 2002:a17:902:fc4e:b0:223:5c33:56a8 with SMTP id d9443c01a7336-22a8a0a37c0mr239045075ad.35.1744080730458;
        Mon, 07 Apr 2025 19:52:10 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787728cfsm89057245ad.228.2025.04.07.19.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 19:52:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] webkitgtk3: Fix build break due to a typo
Date: Mon,  7 Apr 2025 19:52:06 -0700
Message-ID: <20250408025206.548418-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408025206.548418-1-raj.khem@gmail.com>
References: <20250408025206.548418-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 02:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116684

Also fix building on riscv64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkitgtk3/fix-ftbfs-riscv64.patch        | 39 +++++++++++++++++++
 .../fix-typo-denormaldisabler.patch           | 18 +++++++++
 .../webkitgtk/webkitgtk3_2.48.1.bb            |  2 +
 3 files changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-ftbfs-riscv64.patch
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-typo-denormaldisabler.patch

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-ftbfs-riscv64.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-ftbfs-riscv64.patch
new file mode 100644
index 0000000000..00347ef3e1
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-ftbfs-riscv64.patch
@@ -0,0 +1,39 @@
+From: Alberto Garcia <berto@igalia.com>
+Description: Use WTF_CPU_UNKNOWN when building for riscv64
+ WebKitGTK doesn't build on riscv64 even with the JIT disabled.
+ Treating the CPU as unknown is perhaps a bit severe, but it allows us
+ to get the build done until someone steps up to maintain this
+ properly.
+Bug: https://bugs.webkit.org/show_bug.cgi?id=271371
+Forwarded: no
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/Source/WTF/wtf/PlatformCPU.h
++++ b/Source/WTF/wtf/PlatformCPU.h
+@@ -286,14 +286,6 @@
+ 
+ #endif /* ARM */
+ 
+-/* CPU(RISCV64) - RISC-V 64-bit */
+-#if    defined(__riscv) \
+-    && defined(__riscv_xlen) \
+-    && (__riscv_xlen == 64)
+-#define WTF_CPU_RISCV64 1
+-#define WTF_CPU_KNOWN 1
+-#endif
+-
+ #if !CPU(KNOWN)
+ #define WTF_CPU_UNKNOWN 1
+ #endif
+--- a/Source/cmake/WebKitCommon.cmake
++++ b/Source/cmake/WebKitCommon.cmake
+@@ -125,8 +125,6 @@ if (NOT HAS_RUN_WEBKIT_COMMON)
+         set(WTF_CPU_PPC64 1)
+     elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64le")
+         set(WTF_CPU_PPC64LE 1)
+-    elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^riscv64")
+-        set(WTF_CPU_RISCV64 1)
+     elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^loongarch64")
+         set(WTF_CPU_LOONGARCH64 1)
+     else ()
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-typo-denormaldisabler.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-typo-denormaldisabler.patch
new file mode 100644
index 0000000000..c3383fcd41
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-typo-denormaldisabler.patch
@@ -0,0 +1,18 @@
+From: Alberto Garcia <berto@igalia.com>
+Subject: Fix build failure due to missing semicolon
+
+Source: https://sources.debian.org/data/main/w/webkit2gtk/2.48.1-2/debian/patches/fix-typo-denormaldisabler.patch
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/Source/WebCore/platform/audio/DenormalDisabler.cpp
++++ b/Source/WebCore/platform/audio/DenormalDisabler.cpp
+@@ -91,7 +91,7 @@ DenormalDisabler::~DenormalDisabler()
+     }
+ }
+ #else
+-DenormalDisabler::DenormalDisabler() = default
++DenormalDisabler::DenormalDisabler() = default;
+ DenormalDisabler::~DenormalDisabler() = default;
+ #endif
+ 
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
index 14dc3a841d..b03ed3cbb9 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
@@ -19,6 +19,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://sys_futex.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
+           file://fix-typo-denormaldisabler.patch \
+           file://fix-ftbfs-riscv64.patch \
            "
 SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
 

