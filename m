Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6FFC41535
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 11:18:03 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.49886.1699701473062999541
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 03:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kvg0EXG/;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-32fb1c35fe0so1607991f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 03:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699701471; x=1700306271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3fl6cWA/ZDnS6OfI+A49z9vWwMkSqyG/Xv7ZUdTcLwM=;
        b=Kvg0EXG/Q+ViYTgZReS3cV5kdbZ33uDkK8wcIOT+RkD9GBgzGVCP9pT9E6ftPWqmpT
         z7YIwMPImMctUW3IQ1o0jmgiIgWD7Ym+ihi3QDJijI+jecasM+7rVD/xZmtzrIE12fN9
         MUEP6N9DrPiPXkG4PCmqF4Q0iuz1HguX80+K3cbnMY0s5vcZ6J/QE20z1dQ4tOpfZBYN
         kq9nEZUJUXNWf3Z4E2twc+KNJd6INBoEt13l1ajAnPTt8Brm2tQiNiqlYo2d4PALNSfG
         2ghbO5NHhCcXIrmvAmXKiuJLJfqZA09ueJ8GL7WnmjpMgA73ZBPaTxlUTCHe6WvwXOPD
         MXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699701471; x=1700306271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fl6cWA/ZDnS6OfI+A49z9vWwMkSqyG/Xv7ZUdTcLwM=;
        b=fMmRj34o9CgJO7oaRu43VO5NNN1wxh/QV4Pipi+ns0sxuck50hefQEazG4KKfDUSzM
         MRLg/fOX12MSw2uvNJrsz/u6iOWAi/6anMPexMEXRrAkVYM9g2ZoT9pDn0gfz6GcOzXr
         94Kg1bcLGcBxI1ZARwilJXbtxg2phX9HR1x4ljRKWLAx7pxfdP+iDN2s9K3BLMuH7eC+
         VDEWe1JtFCLEnUBNtNIdjJgeKdVpYHY6/MK1mKxaHcw1/Z2jh/YHwgHWDLz12AMZOt21
         3jteCet3LAd4bYSpRww3OFvNo10TWS6/2jdS63LoxRSGH0u4dKsUQ7tohxcCPIqynryC
         QyUQ==
X-Gm-Message-State: AOJu0YwUsZBGhHoetOQE0sprt6nxUzyZ6qQEqn5yBLvM4nkNdri3qQEX
	i33Y7IyHtY9VbetSNs2J+bLZXH9doDrhdQ==
X-Google-Smtp-Source: AGHT+IE7XyddyAzR6miJz1AaILmX6wKKp/BjpK9wWwcxTvfbMcA83GtUvi8VMk1e88V+JDKW5/c7/A==
X-Received: by 2002:a5d:64af:0:b0:32f:7cba:9624 with SMTP id m15-20020a5d64af000000b0032f7cba9624mr1352421wrp.54.1699701470434;
        Sat, 11 Nov 2023 03:17:50 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id i20-20020a5d5234000000b0032f7cfac0fesm1285684wra.51.2023.11.11.03.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 03:17:49 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-filesystems][PATCH] unionfs-fuse: upgrade 2.2 --> 3.4
Date: Sat, 11 Nov 2023 14:17:39 +0300
Message-Id: <20231111111739.13432-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 11:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106551

- DEPENDS fuse --> fuse3 because CMake throwing "No package 'fuse3' found" error.

- Updated patch because CMakeLists.txt path has been changed.

- Bash added to RDEPENDS, accordingly this error --> ERROR: unionfs-fuse-3.4-r0 do_package_qa: QA Issue: /usr/sbin/mount.unionfs contained in package unionfs-fuse requires /bin/bash, but no providers found in RDEPENDS:unionfs-fuse? [file-rdeps]

Changelog:

3.4
- default to fuse2 api on macos when compiling

3.3
- fixed fortified compilation
- disabled logging to file since it had some unresolved locking issues
- add support for direct_io

3.2
- various nfs fixes
- various race condition fixes

3.1
- just fixes version mess (in manual file, cmake, etc.)

3.0
- libfuse3 support (and use is as new default)
- add branch-preserving logic
- make it compile under MacOS again
- minor fixes

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../files/0001-support-cross-compiling.patch  | 33 +++++++++----------
 ...nionfs-fuse_2.2.bb => unionfs-fuse_3.4.bb} |  5 +--
 2 files changed, 18 insertions(+), 20 deletions(-)
 rename meta-filesystems/recipes-filesystems/unionfs-fuse/{unionfs-fuse_2.2.bb => unionfs-fuse_3.4.bb} (84%)

diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch
index bf363ca1b..13e782fa7 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch
@@ -1,32 +1,29 @@
-From 449cec34c123b86b792627553c6ec7471d2ee7ed Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 30 Jun 2017 14:46:51 +0800
+From 6e794a36564a2639a07d8720260e33d7c9435aa4 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Fri, 10 Nov 2023 20:50:48 +0300
 Subject: [PATCH] support cross compiling
 
 Do not override OE CMAKE variables
 
-Upstream-Status: Pending
-
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
 ---
- CMakeLists.txt | 4 ++--
+ src/CMakeLists.txt | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -10,9 +10,9 @@ IF(NOT CMAKE_CONFIGURATION_TYPES AND NOT CMAKE_BUILD_TYPE)
- ENDIF(NOT CMAKE_CONFIGURATION_TYPES AND NOT CMAKE_BUILD_TYPE)
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index f549496..ab71fb2 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -4,9 +4,9 @@ set(UNIONFS_SRCS unionfs.c opts.c debug.c findbranch.c readdir.c
+     fuse_ops.c)
+ set(UNIONFSCTL_SRCS unionfsctl.c)
  
- # Select flags.
--SET(CMAKE_C_FLAGS "-pipe -W -Wall -DFORTIFY_SOURCE=2")
-+SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pipe -W -Wall -DFORTIFY_SOURCE=2")
+-SET(CMAKE_C_FLAGS "-pipe -W -Wall -D_FORTIFY_SOURCE=2")
++SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pipe -W -Wall -D_FORTIFY_SOURCE=2")
  SET(CMAKE_C_FLAGS_RELWITHDEBINFO "-O2 -g")
 -SET(CMAKE_C_FLAGS_RELEASE "-O2")
 +SET(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2")
  SET(CMAKE_C_FLAGS_DEBUG "-O0 -g -DDEBUG")
  
- if (UNIX AND APPLE)
--- 
-2.8.1
-
+ add_executable(unionfs ${UNIONFS_SRCS} ${HASHTABLE_SRCS})
diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.2.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb
similarity index 84%
rename from meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.2.bb
rename to meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb
index 03ae418a4..e8fda0536 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.2.bb
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb
@@ -9,9 +9,10 @@ LIC_FILES_CHKSUM = "file://src/unionfs.c;beginline=3;endline=8;md5=30fa8de70fd8a
 SRC_URI = "git://github.com/rpodgorny/${BPN}.git;branch=master;protocol=https \
            file://0001-support-cross-compiling.patch \
            "
-SRCREV = "b0e3805d3d84d44ddf3e4e5238ae0332145d8157"
+SRCREV = "773f1853b043eeb64b7459f903a2c65bd096f9d9"
 
-DEPENDS = "fuse"
+DEPENDS = "fuse3"
+RDEPENDS:${PN} = "bash"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


