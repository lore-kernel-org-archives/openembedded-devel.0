Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE50BD3E77B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 19:31:54 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4622.1765395105898543808
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 11:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YT4DlTMP;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo181813b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 11:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765395105; x=1765999905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kHgdQL1DDaRUnt21cNzixWlMMG4SwPzu2KzJIQMFyi0=;
        b=YT4DlTMP1Vq+DwH6B+p9jNV8GRCCyeyKQ3vGOgMPcC1ZQwObkQwmr2wiZEodGUxxHI
         3phuOJm6I1ScvGecb1eB1TckShhybNAwHu47jMmqytiuKWsLnjUtSCIo5mHf8Z+wGJaF
         p7HGOKVi6kepCRPGQDnu37F77X3/HGsqI+tKVtGqo7zq/0ZX1vK22g4CN0wuhjtyLzjy
         dnSwQGYCP0fY/eRTNWtOE+VFVDzDYT1TETjlxXJCDK8o6ZkSLDktm+47KD7Gon2uYNVy
         sFj9jLcoqSc80P1lFWDDJbS6ZbVOVc/m+B7TQPZ3OAv4jzpxQ51lrCENgkojcT4T4LUG
         giEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765395105; x=1765999905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHgdQL1DDaRUnt21cNzixWlMMG4SwPzu2KzJIQMFyi0=;
        b=rv6XS19LHw1Q80mTGqdAU+qb87GAnczmpZuoalBApcHMcm1qD7sLyDI6iIkLnQYz5P
         tEjq6f2Wr9AS43sEI30pLJ2RA/vfWyLgZaeRkLs6Hs9iEuYM+gwfXDfjWet6GZgcbRXO
         pm3ydjvlVv2d8XbBvFS+TlrbxyoReoH7DcCIdp5Kv4IYuL+z+i0kRsn325/hYnGiiE7A
         cA8N6+0KKoLhy6e1yLPzscQNwzK/i/M0fkZMBZdmeOWzRRJuisF9387qNoqMUNDBLmla
         atsJ1U47+14/gTbC7XpX/KUilBJ23dprmgfYw6FZKN2izJwhkNA4TFz9akyKNjU120lz
         gkTw==
X-Gm-Message-State: AOJu0YzcwhVYSrgTUBQ/mTQ7EETSopMu3Mm343bfzNkmfZlqseSmzoW7
	A4ZwoOEMkgqpsaIKKxju0IGSaHRmv/RjG68FkGS97M1id33pEMkKYOJsH/OmH7gG
X-Gm-Gg: ASbGnctH5WTMrbgwII+JFGxu1Wg+QoeOCjxxjV7tFebaMjFoWWeHYQ1kAunYtRvkCJq
	z109SHWZccXcNxgXyzycn4//ZFNSp1gXbaUtQsSgGracmtWvJU/aBGo/aigTCuNfKO9aoXJd/KH
	XjVbXdS2Lb5AliLbaoL7nJwIbkigdw8DMHdnIIcpBmprfP0oPT6v9Q2pTrF0XUvuOhp0CdPyISK
	C+sgQ8gOnwNZWspIpEIVPCojK5+ImZJ0TKBYyYbU8ifMwYsY7DNYF3uSHXt6u+wLMaASuu2WjQx
	cdvS7cBBi9L5ua1wR8EoY5jI+ku7PTvV9sOexIvfYWCIeJt3gFhbO0SNOuqh1m3NOP8LgIYHCr1
	AQyyzfStmaeT3z3IP5T1CHTjFlidxdQc3twW2aTuOU29sjouiFAZId+N6avhAML/S7DMVnoCLuC
	WIFPB8mKfNzj38+6cwqTVYWLSrR6XY0Znnmh5jjfbCepfcvN56qd9vcmuyRPNsigScMshReo6vE
	wV70R00D17G8r2UxlfsqEsfie9CsuK7
X-Google-Smtp-Source: AGHT+IFl5B2qKX3mZ9JO40C9yPG5xa+a+8MPWkYLjuHq7brw3lPTCP3u6adwTRT2zJl1f9iy7GoTVg==
X-Received: by 2002:a05:7022:f91:b0:119:e569:f26d with SMTP id a92af1059eb24-11f29699af9mr2715301c88.22.1765395104782;
        Wed, 10 Dec 2025 11:31:44 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff110sm997534c88.10.2025.12.10.11.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 11:31:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] aom: Upgrade to 3.13.1
Date: Wed, 10 Dec 2025 11:31:41 -0800
Message-ID: <20251210193141.471298-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 19:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122578

* Fix build with nasm 3.01
* Improved VOD encoding and RTC encoding performance

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-cmake-fix-nasm-detection-w-3.0.patch | 40 +++++++++++++++++++
 .../aom/{aom_3.12.1.bb => aom_3.13.1.bb}      |  8 ++--
 2 files changed, 44 insertions(+), 4 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/aom/aom/0001-cmake-fix-nasm-detection-w-3.0.patch
 rename meta-multimedia/recipes-multimedia/aom/{aom_3.12.1.bb => aom_3.13.1.bb} (88%)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom/0001-cmake-fix-nasm-detection-w-3.0.patch b/meta-multimedia/recipes-multimedia/aom/aom/0001-cmake-fix-nasm-detection-w-3.0.patch
new file mode 100644
index 0000000000..105e4d9d70
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/aom/aom/0001-cmake-fix-nasm-detection-w-3.0.patch
@@ -0,0 +1,40 @@
+From 83c37c8bc1f4cd7e604c34df7888c425a8cb6b26 Mon Sep 17 00:00:00 2001
+From: James Zern <jzern@google.com>
+Date: Tue, 7 Oct 2025 14:08:44 -0700
+Subject: [PATCH] cmake: fix nasm detection w/3.0
+
+nasm 3.0 separated Oflags (-Ox) output to `-hO` which is used to
+validate the nasm binary. This change is compatible with older versions
+(tested with NASM version 2.16.03 & 2.13.02).
+
+Upstream-Status: Backport [https://aomedia-review.googlesource.com/c/aom/+/203481]
+Bug: aomedia:448994065
+Fixed: aomedia:448994065
+Change-Id: I704dcfe39ac6e68bc4d5b9e409fb59a0d277170e
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ build/cmake/aom_optimization.cmake | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/build/cmake/aom_optimization.cmake b/build/cmake/aom_optimization.cmake
+index 9cc34de..2750a0b 100644
+--- a/build/cmake/aom_optimization.cmake
++++ b/build/cmake/aom_optimization.cmake
+@@ -212,7 +212,7 @@ endfunction()
+ # Currently checks only for presence of required object formats and support for
+ # the -Ox argument (multipass optimization).
+ function(test_nasm)
+-  execute_process(COMMAND ${CMAKE_ASM_NASM_COMPILER} -hf
++  execute_process(COMMAND ${CMAKE_ASM_NASM_COMPILER} -hO
+                   OUTPUT_VARIABLE nasm_helptext)
+
+   if(NOT "${nasm_helptext}" MATCHES "-Ox")
+@@ -220,6 +220,8 @@ function(test_nasm)
+       FATAL_ERROR "Unsupported nasm: multipass optimization not supported.")
+   endif()
+
++  execute_process(COMMAND ${CMAKE_ASM_NASM_COMPILER} -hf
++                  OUTPUT_VARIABLE nasm_helptext)
+   if("${AOM_TARGET_CPU}" STREQUAL "x86")
+     if("${AOM_TARGET_SYSTEM}" STREQUAL "Darwin")
+       if(NOT "${nasm_helptext}" MATCHES "macho32")
diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb
similarity index 88%
rename from meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
rename to meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb
index 72baf58cf0..141b02306d 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb
@@ -5,11 +5,11 @@ LICENSE = "BSD-2-Clause & AOM-Patent-License-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5 \
                     file://PATENTS;md5=a111d47497d3bb49e04eef71377eb8ba \
                    "
-SRCREV = "10aece4157eb79315da205f39e19bf6ab3ee30d0"
+SRCREV = "d772e334cc724105040382a977ebb10dfd393293"
 SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=main;tag=v${PV} \
-           file://0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch"
-
-
+           file://0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch \
+		   file://0001-cmake-fix-nasm-detection-w-3.0.patch \
+		  "
 inherit cmake pkgconfig

 DEPENDS = " nasm-native"

