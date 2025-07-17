Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F42C83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 23:20:47 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.8760.1752794445043331255
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 16:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bWi2uqyl;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235ea292956so14586465ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 16:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752794444; x=1753399244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9n1mHxQBy5HDgajQ1t7VWg5sUGGieWGV6InVpBxiekU=;
        b=bWi2uqylpSYFWw8aFsFur8m3u5GnHnSMYvzTDC7D//6O/lMojsL21l+E2VXg0DJVOI
         shWCz2Tte0kLFp9S2ke+dtkTnoP3rI2BuZZ7kB6h0/yqtBSop3E1tyTEuPkINzTs8ayM
         c4zM99Xq/Fi9yhOmdIWj58JeStbMKVXJwCVEuSav3f+RNyP9Es+I3N08a6Y6agGdy5dN
         bDjp7LeeBXLD5sFx/5uN7Ca/HKVEyAur8WH2zODDl2KMKrmVg46I1H85Z8zMlFR7MPE7
         Ov7laUcPuNTE5KwCGCWrW7tpq7jW+xMI0kNiE1kV1gw06el8d16d5C7tXoYSU2/UQDku
         nXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752794444; x=1753399244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9n1mHxQBy5HDgajQ1t7VWg5sUGGieWGV6InVpBxiekU=;
        b=sdi98Fz2+OLrvlgnqWa5XYc5T9gC7MM7FKAuswRDlewRNrz430vOFS/qVdtGyieEEU
         hDKJ0tlhTou+Y8iQjLG8UzZ27OhPf81F+s0p7EarkEEKL5ROHRVFElede9qf1AT1D4CP
         GeNTJ4rAObIpqhRE9zuVrTZ7LbwTr8Cvt1fp2JbUYwjSqNY2Z3UwqDsLDYFxxg5Bc6uG
         VZaZgqd2YEHcNfR71f4CgEesSzJUK1X+RCuf+JYWzN3+cR4z+BhxLUD+vkGupuDsC+Fc
         BgGDrFiaD7Yzp/toPI2RoAQ6IIScZHNEfF2mcMAMNwNRROaDElGAACLG1cBB7j3Qblwz
         JpaA==
X-Gm-Message-State: AOJu0YzUCtnRFwBJi/A0w9KTgxwBmbJJUQ4mxkMxiSrVlaEv7jHPCUhc
	xJPzIXs7JcY9YdDGr+vo7odIinrF22KsdMGiZn8IYG1mFL4vPvzymD1wwwGDmmkUjgQ=
X-Gm-Gg: ASbGnctZv6yLx5D5N/56ZSa+8c25zbuTmBNW+IDY9AAKELhnit2nVSDxndpZ21qKbza
	q2J2Kf+gp9jAmBVsEm9akNoupS+BwwY/lU4whfBm91AudOvqnabJ6QtoZEpfuxrRUN0vTPDPAVq
	rHMS9ZJUi4EznxNRAZaViQaqNL+OoZYSfMCU2phdzGZ4mIKe32LSvA3i4j6iliQ44QZvnEE1lGN
	mXgqw50P282O175B9wS2My9LHhV4YKddHBraBqxJbj5SM3BZH77jwdLTbTRcntCp3Juz9BjF+SM
	UFYEvcmIeUJaXrXMJ/hn4TTYgy7G22Y0IWvjwswZZFbtcqzFkaRcHX1PLg1so6hOoVLA679hTwY
	aNsYq9EWmbSiKBA==
X-Google-Smtp-Source: AGHT+IEbh7MoGbZcEdMH2DOrfz9y8r1IMa+RXxkzP0TdCUDGZB3KdQwvY30wvDz/WV1V/G3O4JLM9A==
X-Received: by 2002:a17:902:ceca:b0:235:2375:7eaa with SMTP id d9443c01a7336-23e256c99bemr126853805ad.22.1752794444008;
        Thu, 17 Jul 2025 16:20:44 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c357])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60e8e2sm1922775ad.52.2025.07.17.16.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 16:20:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nss: Fix build when using clang toolchain
Date: Thu, 17 Jul 2025 16:20:41 -0700
Message-ID: <20250717232041.2532258-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 23:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118620

When using clang cross compiler, nss make system adds
some clang specific options e.g. Qunused-options to CFLAGS
which is fine for cross/target compile but some portions e.g.
nsinstall is build natively so it uses NATIVE_CC to compile this
utility, its is set to BUILD_CC rightly but when using clang for CC
and gcc for BUILD_CC, nss build system is confused because its
trying to use the computed set of warnings for both native and cross
compile and they may not match between clang and gcc. So here we
explicitly use clang for NATIVE_CC when TOOLCHAIN is clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.112.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/nss/nss_3.112.bb b/meta-oe/recipes-support/nss/nss_3.112.bb
index cf0b20d48b..804f4c8e07 100644
--- a/meta-oe/recipes-support/nss/nss_3.112.bb
+++ b/meta-oe/recipes-support/nss/nss_3.112.bb
@@ -73,11 +73,14 @@ do_compile:prepend:class-native() {
     RPATH="-Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}"
 }
 
+NATIVE_CC:toolchain-clang = "clang"
+NATIVE_CC ?= "${BUILD_CC}"
+
 do_compile() {
     export NSPR_INCLUDE_DIR=${STAGING_INCDIR}/nspr
 
     export CROSS_COMPILE=1
-    export NATIVE_CC="${BUILD_CC}"
+    export NATIVE_CC="${NATIVE_CC}"
     # Additional defines needed on Centos 7
     export NATIVE_FLAGS="${BUILD_CFLAGS} -DLINUX -Dlinux"
     export BUILD_OPT=1
@@ -91,7 +94,6 @@ do_compile() {
 
     export LIBDIR=${libdir}
     export MOZILLA_CLIENT=1
-    export NS_USE_GCC=1
     export NSS_USE_SYSTEM_SQLITE=1
     export NSS_ENABLE_ECC=1
     export NSS_ENABLE_WERROR=0
@@ -144,14 +146,13 @@ do_install:prepend:class-nativesdk() {
 
 do_install() {
     export CROSS_COMPILE=1
-    export NATIVE_CC="${BUILD_CC}"
+    export NATIVE_CC="${NATIVE_CC}"
     export BUILD_OPT=1
 
     export FREEBL_NO_DEPEND=1
 
     export LIBDIR=${libdir}
     export MOZILLA_CLIENT=1
-    export NS_USE_GCC=1
     export NSS_USE_SYSTEM_SQLITE=1
     export NSS_ENABLE_ECC=1
 

