Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id C33D271E4C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 13:00:38 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id y15-v6so29445960wrg.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2GS5rtrwK+gphq1GmK+eoZdsv1L0PBDVe4saqs1e9KY=;
	b=OPxnvvOfZAdlishmndX4UT95p7RYqgFwNpqnlk2t+dWHBK7ZzvEz1uabs+1FONwebd
	YD+V9LodSe0K6+XArhnupoK4Io1qnk6Y3NVfvm2c3rL9qmYNQmHIpwMTdnjIkJGjkUco
	Yh0iUySARnP89P2UWER4aqZE+V89QMgz9p6z3jo3wjGep6IGMrbqjFQyl/eo2C8M1bVa
	MbmA+X0FiRH2XW81fLqCK2bsoPKvEsnztNpVTcGqdWnUAKiZm8aZmnRGPC6DceKO937r
	dnlIsu9CobD11Hg2JwqqXJm8hvGW5tb04PeqJaZx7Csg5qo42nfcx6muMMJ8Efqxjove
	mywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2GS5rtrwK+gphq1GmK+eoZdsv1L0PBDVe4saqs1e9KY=;
	b=CaIx11HZLUK+Gp5YdjTn3hzyx4HZv0eeHNzBWUw5yh5RZvuBd7KHBggZ8JcdtwD+2A
	ru61dWz2WWMCnbLWC+HwfhXogvc6Xixk16LDm7jKUCqxJFzaoC4J8u2IJJEagOMKFX5G
	ghL7hNZfsgzqRcxgr5/cDrP5AJ/sH764dCNa6Nj08OF0pK3McGR2SLMPj8+mYUGoRkXN
	xkWgpU6g22IGWgL7RwkJQqJ4Uo8u5Vf5a0De9ms33gIbhjMmBJrdQ2WzsqkkRtv97bjK
	SeSMlXCm3z1XelvzQeH4XHiWeI4dV7CbAI4TdHEEl/ALJdy0u2T3eEhAuKRNgEBCRBu5
	mNTg==
X-Gm-Message-State: ALKqPwc9HVI+8mUTvJAuiLHAzJ/xxQrbJXti81s2KC5aXjhMnzUG5O/G
	4O9gwJAqO5g+kDaC5Ug7F/1yeQ==
X-Google-Smtp-Source: ADUXVKJXDPKicHnfzZOxCGKZIAqMQfSWO3/Ocfb52dmjqVCb1yf/47SMcX5gEN5JvvAr9ncwfugo3g==
X-Received: by 2002:adf:afe4:: with SMTP id
	y36-v6mr2038364wrd.107.1527685239056; 
	Wed, 30 May 2018 06:00:39 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host254-202-dynamic.51-79-r.retail.telecomitalia.it.
	[79.51.202.254]) by smtp.gmail.com with ESMTPSA id
	j9-v6sm15155304wmh.28.2018.05.30.06.00.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 May 2018 06:00:38 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 May 2018 14:59:57 +0200
Message-Id: <1527685197-20008-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] ubi-utils-klibc_2.0.2: upgrade to git rev 64f61a9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2018 13:00:39 -0000

 -Incorporate 3 small after-relase fixes
 -Fix typos in patch comments (Upstream-Status)
 -Remove patch enumeration from Subject line

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch   | 2 +-
 .../0002-Instead-of-doing-preprocessor-magic-just-output-off_.patch   | 2 +-
 .../ubi-utils-klibc-2.0.2/0003-Makefile.am-only-build-ubi-utils.patch | 2 +-
 .../0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch      | 2 +-
 .../0005-common.h-replace-getline-with-fgets.patch                    | 4 ++--
 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb          | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch
index 6ed167f..4ee9bd9 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch
@@ -12,7 +12,7 @@ Fix build error:
 | ../git/include/libmissing.h:7:10: fatal error: execinfo.h: 
  No such file or directory
 
-Status: Inappropriate [klibc specific]
+Upstream-Status: Inappropriate [klibc specific]
 
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 ---
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Instead-of-doing-preprocessor-magic-just-output-off_.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Instead-of-doing-preprocessor-magic-just-output-off_.patch
index bb675a7..5c6e097 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Instead-of-doing-preprocessor-magic-just-output-off_.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Instead-of-doing-preprocessor-magic-just-output-off_.patch
@@ -1,7 +1,7 @@
 From 01c98d5d5d044d9a125abcdbb2f3d771966365b0 Mon Sep 17 00:00:00 2001
 From: mirabilos <m@mirbsd.org>
 Date: Thu, 1 Feb 2018 15:34:07 +0100
-Subject: [PATCH 2/4] Instead of doing preprocessor magic, just output off_t as
+Subject: [PATCH] Instead of doing preprocessor magic, just output off_t as
  long long
 
 Fix warnings abot PRIdoff_t in libmtd.c, in mtd_read (and mtd_write):
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003-Makefile.am-only-build-ubi-utils.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003-Makefile.am-only-build-ubi-utils.patch
index 08c53d1..38ab7a9 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003-Makefile.am-only-build-ubi-utils.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003-Makefile.am-only-build-ubi-utils.patch
@@ -1,7 +1,7 @@
 From 139d93bc405272a3261d57be26da842e737fe4d0 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Sun, 28 Jan 2018 23:10:34 +0100
-Subject: [PATCH 3/4] Makefile.am: only build ubi-utils
+Subject: [PATCH] Makefile.am: only build ubi-utils
 
 We only target the ubi-utils, static, small.
 
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch
index 5da05fa..2844a50 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch
@@ -1,7 +1,7 @@
 From ae1cf6d0eb1833e46549328a4473222c259723d7 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Thu, 1 Feb 2018 00:25:00 +0100
-Subject: [PATCH 4/4] mtd-utils: common.h: no features.h for klibc builds
+Subject: [PATCH] mtd-utils: common.h: no features.h for klibc builds
 
 Add guard around features.h to fix missing include (here first error):
 
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0005-common.h-replace-getline-with-fgets.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0005-common.h-replace-getline-with-fgets.patch
index adef377..a556ed3 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0005-common.h-replace-getline-with-fgets.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0005-common.h-replace-getline-with-fgets.patch
@@ -1,7 +1,7 @@
 From 2137eb1a6cd0326510bd3b9faf8037d9bf34ca3d Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Wed, 23 May 2018 15:52:34 +0200
-Subject: [PATCH 5/5] common.h: replace getline() with fgets
+Subject: [PATCH] common.h: replace getline() with fgets
 
 There is an unofficial upstream patch adding a simple getline()
 to libmissing.h. Unfortunately the patch creates issues if the
@@ -13,7 +13,7 @@ Fix:
 | ubi-utils/ubiformat.o: In function `prompt.constprop.4':
 | ubiformat.c:(.text+0x70): undefined reference to `getline'
 
-Upstrea-Status: Inappropriate [klibc specific]
+Upstream-Status: Inappropriate [klibc specific]
 
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 ---
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
index 8b00981..0475cbe 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 inherit autotools pkgconfig klibc
 
-SRCREV = "bc63d36e39f389c8c17f6a8e9db47f2acc884659"
+SRCREV = "64f61a9dc71b158c7084006cbce4ea23886f0b47"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
              file://0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch \
              file://0002-Instead-of-doing-preprocessor-magic-just-output-off_.patch \
-- 
2.7.4


