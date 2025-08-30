Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E63BCA1001
	for <webhook@archiver.kernel.org>; Sat, 30 Aug 2025 18:43:27 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.15654.1756579394635761708
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Aug 2025 11:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TWewdoTR;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-324e6daaa39so2970184a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 11:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756579394; x=1757184194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WCA/4EXPdZD9qom71IAqMCUos3r+ZSq1DkhVLxCcZbU=;
        b=TWewdoTRVdw0aLCbWcx69rHlN7b+odr9oYJ6n9DjjLUtd7owhjR9nmsXUwSCVQK9Bw
         gplT2qnjGdNtN13UtQJHas5p3W/uL3ZX7787y2EEZPiDLbTdHjSUWq28eDw3WGXV89QR
         YHwyI8UH1x1Du52wxLW9+Jan+wXcY1KR9aoE5ox9sOoGsUBUOBa4d3/Ra8mLxgYePGJ1
         5SYLoh7mnvTBGSYxZkv1gFTuNYqN4NwZl35al4QMIVThtWkx0X9uzlu+fA3rSFa4N4Wd
         mXIm8IZ5fDcDl23aExiz1jvuqRlYQHTgNSIkoRYXXd6iP8grh6oNsMIVeFwmtMXaq6Vg
         f2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756579394; x=1757184194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCA/4EXPdZD9qom71IAqMCUos3r+ZSq1DkhVLxCcZbU=;
        b=mRVr1LcplSfCYMcheOqCE/jlJLgW+L3XodXzTzNsJv93ZdmasLqaN6P9qg49PDI0JG
         MxpER8IizbZQq23bg65/ePsElmqGcVI5hV7wUpvUjK4RaMbcZip+vLq5w7hpRm4FCjca
         5UE1DoDIEHRH4jE4JZZKZbWiUu5lFpi1zITi0P2Wa8Q8CsXTSYoDCHqoXOWcq65mm11d
         HEBQ2bZiM+htuMhpKcZFRu25V0AQ2Qx5Tk7kqyYY996klQ+oAuAHKsC9KGBUwNQ6l/Xb
         4aw7iwqTH9gYFHKipgnaA+49l5swwL+eFdmsOgbpHIcSXP/ryTItT5btKcc7qrr3JVDv
         blKw==
X-Gm-Message-State: AOJu0YxYVVtDGC8uMmpucOHTF+zhjJvYDfFPSgeQmD4Gxh6bNXiqKXoi
	x1Fo4T5Mzx83lm+gaOGb1gZeGv9WcNQHDqafIeTL2mwHvFRhVwRBEQiibUgRli/9
X-Gm-Gg: ASbGncvsXXsveKPbrYhmr/113op+djL+eSbefc8hJUI9keQZUM1NXN3Yn1vW1q2ygLd
	qwrnkqfuzEaFSZtWUOvG25gc2bQO/yp1E2AylqW4i914Ds2oSfpCJfrR24NxoPeehnJJyhpL+lE
	UDjyK+VeHVQQi4GVrzklC+qKwW6S2uVCRyljYICtc/CEIbspwdQXksHLV0k8PIrilPsio0UT2Zk
	f2yla67yGWh5mn3L7PdT/JA0OQg/b6A4rWeygMDLni1oQiF9g7JMV9gwdgTOPuBhm4fch0Z3YtK
	TkSb3HdKYWcrAy3mkYL8llpM+u5xXHO5lmcuV7UHJ2IPqvu3gK6I0ogfmbAYk5qlZLMhTK10CGN
	CWK8G8c7XLMIODxori42B4ClMA8bCIVjxXawj5Zd+soY5fDqhcgh3Arq9ylre1vD5DmWMNdCPXS
	fOEWKheGCBFEXW1++7v3YI8PbErmwHd3fDatzoXQ6Q
X-Google-Smtp-Source: AGHT+IGsu9Js/8T/3iaqxgxVFUzucZFfSsLw1t7qq7fWxs/Uhs4NzF7YkLEPIZhCoMPIfeDYPYe3vA==
X-Received: by 2002:a17:90a:d646:b0:31f:762c:bc25 with SMTP id 98e67ed59e1d1-328156e29f5mr3697963a91.25.1756579393555;
        Sat, 30 Aug 2025 11:43:13 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::c2de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d9330b73sm6462091a91.4.2025.08.30.11.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 11:43:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/8] 7zip: Disable Werror
Date: Sat, 30 Aug 2025 11:43:02 -0700
Message-ID: <20250830184311.1018374-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 18:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119142

Clang-21 finds more warnings, its a constant fight, lets disable
warning as errors and let upstream handle it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/7zip/7zip_25.01.bb   |  8 +----
 ...01-Remove-treating-warning-as-errors.patch | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-extended/7zip/files/0001-Remove-treating-warning-as-errors.patch

diff --git a/meta-oe/recipes-extended/7zip/7zip_25.01.bb b/meta-oe/recipes-extended/7zip/7zip_25.01.bb
index 779b708eee..f4ea6506e1 100644
--- a/meta-oe/recipes-extended/7zip/7zip_25.01.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_25.01.bb
@@ -9,19 +9,13 @@ LIC_FILES_CHKSUM = "file://DOC/copying.txt;md5=4fbd65380cdd255951079008b364516c
 CVE_PRODUCT = "7-zip 7zip"
 SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main \
            file://0001-support-yocto-cross-compiling.patch \
+           file://0001-Remove-treating-warning-as-errors.patch \
            file://7z_wrapper.sh \
            "
 SRCREV = "5e96a8279489832924056b1fa82f29d5837c9469"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 
-
-# Support Yocto cross compiling
-CXXFLAGS:append:toolchain-clang = " -Wno-error=cast-qual -Wno-error=sign-conversion \
-                                    -Wno-error=disabled-macro-expansion \
-                                    -Wno-error=shorten-64-to-32 \
-                                    -Wno-error=cast-function-type-strict"
-
 EXTRA_OEMAKE += " \
     CXXFLAGS_EXTRA='${CXXFLAGS}' \
     CFLAGS_BASE2='${CFLAGS}' \
diff --git a/meta-oe/recipes-extended/7zip/files/0001-Remove-treating-warning-as-errors.patch b/meta-oe/recipes-extended/7zip/files/0001-Remove-treating-warning-as-errors.patch
new file mode 100644
index 0000000000..c2bef9616a
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/files/0001-Remove-treating-warning-as-errors.patch
@@ -0,0 +1,31 @@
+From 4d12624e7d6f09d07816d3d0007465c8533af192 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Aug 2025 15:29:13 -0700
+Subject: [PATCH] Remove treating warning as errors
+
+clang finds additional warnings with new versions e.g.
+Clang 21 added a new warning, -Wimplicit-void-ptr-cast
+(grouped under -Wc++-compat), which fires whenever a
+void* is implicitly converted to another pointer
+type (or returned as such).
+
+Upstream-Status: Inappropriate [Distro-specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CPP/7zip/7zip_gcc.mak | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CPP/7zip/7zip_gcc.mak b/CPP/7zip/7zip_gcc.mak
+index 2722c93..b7db06a 100644
+--- a/CPP/7zip/7zip_gcc.mak
++++ b/CPP/7zip/7zip_gcc.mak
+@@ -24,7 +24,7 @@ PROGPATH_STATIC = $(O)/$(PROG)s
+ 
+ 
+ ifneq ($(CC), xlc)
+-CFLAGS_WARN_WALL = -Werror -Wall -Wextra
++CFLAGS_WARN_WALL = -Wall -Wextra
+ endif
+ 
+ # for object file

