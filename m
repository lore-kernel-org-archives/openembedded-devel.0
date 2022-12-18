Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA83C4332F
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 21:08:01 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.6202.1671397672197400162
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Dec 2022 13:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BbKX0MFW;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id n4so7276696plp.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Dec 2022 13:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bLKi6cRO0A41mHXBY3WJDXWcObpAPpPE4cRSJWOXK9c=;
        b=BbKX0MFWKms8dr50Vnq/5c5U+1eqtuyQtBKxFx7/fMHxnkXCZgHKwBqhq855qqUbCU
         57uasKO3a0VgjeK6owaRGbioW22nxmgXSDaEbnd/m4C/W9cLxvgWKY5XJwL2J3gbijdi
         4Hl6SDCC3mAUqQjxy2jad2l1flLHCCcrzlC+KZdPbto3yT9ckoMjnppRvNTHZtrqzLD9
         54o9mUBaojQWuHEcwKEXAr4PEj4xv5ISt6XVaO/bv/7PkHpDHJNN6+RBs1PPNekEDhst
         LklQHiaPpGIYwCyo3aOCtdDMnnImKZvD259U+PhxTu5unnzt9zsPNlJDjoC5wiecUmcC
         7deA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLKi6cRO0A41mHXBY3WJDXWcObpAPpPE4cRSJWOXK9c=;
        b=YA26p7TqFDNuhHYljmeAXub0UVP4eJou7BGHvEBe8WCrg7BMK0uGdPFVarxoLQv/Pr
         ApP70raFOtHQjSqiI9iw03DqLlp69lpt0x27H+UaHiBlh8VwHuzoHVQi1eycXn2QEOC2
         PszMSUVRbS8y0vj1JK8hswAzyCUKiP8dsgdbsKw11QBM40yipkaokxTGkwiFFElb3uyU
         oau/3zesUxgZY21/wjhGIF7FikQMPsNvUafY5ACuZu5GT4p0IwmG5/qHAWUJE7LmoAzd
         y5/ojxb6hm5WGTEyKolWWzPmvUZqgnM/o4oRIjXu6nCc1DO9lCwCnAjV3N63wVDXw4uT
         navw==
X-Gm-Message-State: ANoB5pl+XW71qLe7qVhuYCfordI8WvV59pTUFzROTeQ4vO2EBj4i5e8m
	ZKzwJLxxPJ3YTPS1uPLfSOcgNJWTJlE=
X-Google-Smtp-Source: AA0mqf5b5vZYuwV45zfNHrR5PF/tX/IzaIUBUNgNF7hcUGhEOCWJgJoFFvJcNZjSFJA6FtzbxcXuEQ==
X-Received: by 2002:a05:6a20:a012:b0:a2:405b:6769 with SMTP id p18-20020a056a20a01200b000a2405b6769mr44008363pzj.2.1671397671179;
        Sun, 18 Dec 2022 13:07:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id e64-20020a621e43000000b005770fd365d8sm5120928pfe.97.2022.12.18.13.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 13:07:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 1/3] fatcat: Enable 64bit off_t
Date: Sun, 18 Dec 2022 13:07:46 -0800
Message-Id: <20221218210748.225122-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Dec 2022 21:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100086

Replace lseek64 with lseek
Update patch status accordingly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d.h-not-argp.h-for-all-POSIX-systems.patch |  2 +-
 .../fatcat/0002-Enable-64bit-off_t.patch      | 71 +++++++++++++++++++
 .../recipes-utils/fatcat/fatcat_1.1.1.bb      |  1 +
 3 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-utils/fatcat/fatcat/0002-Enable-64bit-off_t.patch

diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat/0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch b/meta-filesystems/recipes-utils/fatcat/fatcat/0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch
index fd8e22abca..7e215e3080 100644
--- a/meta-filesystems/recipes-utils/fatcat/fatcat/0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat/0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch
@@ -8,8 +8,8 @@ of any of the GNU specific argp extensions. Include unistd.h directly to
 allow building with musl on linux, whilst retaining compatibility with
 glibc and other unices.
 
+Upstream-status: Submitted [https://github.com/Gregwar/fatcat/pull/34]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Upstream-status: Pending
 ---
  src/fatcat.cpp | 8 ++------
  1 file changed, 2 insertions(+), 6 deletions(-)
diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat/0002-Enable-64bit-off_t.patch b/meta-filesystems/recipes-utils/fatcat/fatcat/0002-Enable-64bit-off_t.patch
new file mode 100644
index 0000000000..caaf105eea
--- /dev/null
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat/0002-Enable-64bit-off_t.patch
@@ -0,0 +1,71 @@
+From 0383fff94471278c92ef2ad5edc14abbb40a9acd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Dec 2022 18:54:55 -0800
+Subject: [PATCH] Enable 64bit off_t
+
+Ensure that off_t is always 64-bit by specifying -D_LARGEFILE_SOURCE
+-D_FILE_OFFSET_BITS=64 this will ensure that normal lseek() function is
+same as lseek64
+
+This helps compiling on latest musl where lseek64 and friends are not
+available
+
+Upstream-status: Submitted [https://github.com/Gregwar/fatcat/pull/34]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt         | 2 ++
+ src/core/FatSystem.cpp | 4 ++--
+ src/core/FatSystem.h   | 2 --
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d6a2649..4cdd1fb 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -34,6 +34,8 @@ IF(DEFINE_WIN)
+ 	add_definitions(-D__WIN__)
+ ENDIF(DEFINE_WIN)
+ 
++add_definitions(-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64)
++
+ include_directories("${CMAKE_SOURCE_DIR}/src")
+ 
+ add_executable(fatcat "src/fatcat.cpp" ${ALL_SOURCES})
+diff --git a/src/core/FatSystem.cpp b/src/core/FatSystem.cpp
+index 79cda8c..1f52e82 100644
+--- a/src/core/FatSystem.cpp
++++ b/src/core/FatSystem.cpp
+@@ -90,7 +90,7 @@ int FatSystem::readData(unsigned long long address, char *buffer, int size)
+         cerr << "! Trying to read outside the disk" << endl;
+     }
+ 
+-    lseek64(fd, globalOffset+address, SEEK_SET);
++    lseek(fd, globalOffset+address, SEEK_SET);
+ 
+     int n;
+     int pos = 0;
+@@ -112,7 +112,7 @@ int FatSystem::writeData(unsigned long long address, const char *buffer, int siz
+         throw string("Trying to write data while write mode is disabled");
+     }
+ 
+-    lseek64(fd, globalOffset+address, SEEK_SET);
++    lseek(fd, globalOffset+address, SEEK_SET);
+ 
+     int n;
+     int pos = 0;
+diff --git a/src/core/FatSystem.h b/src/core/FatSystem.h
+index cd3c914..f9f2ca3 100644
+--- a/src/core/FatSystem.h
++++ b/src/core/FatSystem.h
+@@ -11,11 +11,9 @@
+ 
+ #ifdef __APPLE__
+ #define O_LARGEFILE 0
+-#define lseek64 lseek
+ #endif
+ #ifdef __WIN__
+ #define O_LARGEFILE 0
+-#define lseek64 lseek
+ #endif
+ using namespace std;
+ 
diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
index e344eda154..982a52d62f 100644
--- a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=57fbbfebd0dd1d6ff21b8cecb552a03f"
 
 SRC_URI = "git://github.com/Gregwar/fatcat.git;branch=master;protocol=https \
            file://0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch \
+           file://0002-Enable-64bit-off_t.patch \
            "
 
 SRCREV = "99cb99fc86eb1601ac7ae27f5bba23add04d2543"
-- 
2.39.0


