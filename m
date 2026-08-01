Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7F9C55175
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:34 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13723.1785620731169571926
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kki2mIFK;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cace91f112so23428495ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620730; x=1786225530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iG3SjvXjT6BHKNorhVxIjQ0/lF3Em9zAkKbb6A5vU2I=;
        b=kki2mIFKM0TWze2sVVYAnw4zwsAd168aBjsDkBZvbdE21H1g5qaJ1rFH1iWdOReFTs
         /G/LQfaWiiHQ3EQPnkGxfqI87CnaKpBdYLyIaYogmgJHx2ZcQYCR76Ew/0F0FXyNmyhP
         FU/5lJeroDlU2RPd0aUFm9tFojbQkrPgmUOw8BR+lsORKE+nMF3w8agRgHwfd4VZL84g
         F+lc2uAm0dRxEv7Hp5j2GbJWyEZlCTNKUiU5Fp5qhbwSgXSONVbzr7lvGJkRAXG0LByb
         nvibF8zWF408j5OdO6eRYFd00xG1IM6+o+F2u2NWAAC7PoUyTeX1xtWalDauGPitShgC
         nI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620730; x=1786225530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iG3SjvXjT6BHKNorhVxIjQ0/lF3Em9zAkKbb6A5vU2I=;
        b=UgygBOtSQFRznJffLnE7KLoBlzba4RowcXoAi22utgYHe+1x4FCBsnkAJUU7WMZXMp
         U7D/atqaDGze70DdIhIHVUEOZWL2ETraLqj4DVYZo3yqfS/05EDxnQsfAqiY3USa7Agq
         t1N5+Sd0pkIw/n0vICg39KGIvge/7kr9py0goLcJVsDIEgCxpjv7vlIqvDGa1pQjMa7n
         ErrJBS8MG6XIYOORvqVMN/osZL0Xh30yWq+/6rTz1QTvMs0VOtcTSJCnGjRrD9Cl8I/i
         VTks/tWVqIslU5kdWQC+Hjj1FNCNQfb7FFJ2VqI32j0IhUKoS+IdUunhEKTIkcdhMked
         L3JA==
X-Gm-Message-State: AOJu0Yzht4ORpAK8hf2yqJBee9mvu9z3n4rZiJbTbgvE0dncHUSfSnro
	yj276l4bnNupqjTEGAE94/SJZNLoUxn6SuASYWJAWl3+zerh3bWfVWzuqPHzZ4o6
X-Gm-Gg: AR+sD1228d5tqIpPj2zoufUnsf1nMrjkXSHj2BgQ0aY8WTFwwMUtOYXuS7kfwH0UqnA
	ERLFhZUjCR75EjBOz6DLiuAiJIRsUDy+xWdWs+76wf1DaZdmqIhZmVuYr8Cf6r2SqhKhy4NLr+1
	FDsp+/mW6KKVEYfUCBqTNQquCuFEL6/92CstBK9GnV/xnaAUoeLhraML8Hx6Q8hRpAl3y017NsS
	Lh9T2QXiMmPeUWazf3vmrpeJuH7Kt0SIJj4zmefpZziXI1bYz7HOjo8/eYOGU+RXQkRbEx1urhl
	Abtsz3yIrIFFW/8Qmfo4wkEJzYZz4xXjaUycuTZSu20SwrJlQmaT4xxfq67nT/gg2ChOvnlO/Hg
	QnTqsVv8YFlk4QvooAP5Ec74busZ5LtR5CWMI/53cdfCeAixU06Pgknh/6EIEYG6q4HgmDpD3s0
	hO1chuguVO5Z7hgoRQOt2lEzotvTPro9mWVp4YM3VZ5sOcTWSY/uNqRWCiJZgFsnmtVArAfxV2a
	obWxYKuMN37ZeW1jIZNZB9B3VdiGExdwnDls54sqyxiT17My7IoAdiQtuxngcfB++zMcma52ZIT
	LYjCNLy+ZCkPkeN7ux6jVThCkLbmxUPbzL/uR2F7BgHyp9h9AkiWS3r4h7+rngw6t+s/I/2bfhI
	JFA==
X-Received: by 2002:a05:6a20:a110:b0:3b3:1b38:d9c3 with SMTP id adf61e73a8af0-3c92a5151c6mr4576707637.4.1785620730357;
        Sat, 01 Aug 2026 14:45:30 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 02/31] libmodule: upgrade 5.0.1 -> 5.0.2
Date: Sat,  1 Aug 2026 14:44:57 -0700
Message-ID: <20260801214526.788343-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128619

The only upstream change between 5.0.1 and 5.0.2 is a single commit,
"chore: bump min cmake version to 3.5.", needed for CMake 4+.

Drop 0001-Update-cmake_minimum_required-to-3.5.patch, which backported
exactly that change and is now redundant.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...Update-cmake_minimum_required-to-3.5.patch | 66 -------------------
 ...{libmodule_5.0.1.bb => libmodule_5.0.2.bb} |  6 +-
 2 files changed, 2 insertions(+), 70 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/clight/libmodule/0001-Update-cmake_minimum_required-to-3.5.patch
 rename meta-multimedia/recipes-multimedia/clight/{libmodule_5.0.1.bb => libmodule_5.0.2.bb} (73%)

diff --git a/meta-multimedia/recipes-multimedia/clight/libmodule/0001-Update-cmake_minimum_required-to-3.5.patch b/meta-multimedia/recipes-multimedia/clight/libmodule/0001-Update-cmake_minimum_required-to-3.5.patch
deleted file mode 100644
index 5e01864643..0000000000
--- a/meta-multimedia/recipes-multimedia/clight/libmodule/0001-Update-cmake_minimum_required-to-3.5.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 858aa0dcd8cba8288db3f10b1e6622ac79ae63e3 Mon Sep 17 00:00:00 2001
-From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
-Date: Thu, 14 Aug 2025 14:51:55 +0800
-Subject: [PATCH] Update cmake_minimum_required to 3.5
-
-This supports compilation with cmake-4.0.0.
-
-Fixes:
-
-Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-to tell CMake that the project requires at least <min> but has been updated
-to work with policies introduced by <max> or earlier.
-Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-
-Upstream-Status: Submitted [https://github.com/FedeDP/libmodule/pull/21]
-Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
----
- CMakeLists.txt         | 2 +-
- Samples/CMakeLists.txt | 2 +-
- docs/CMakeLists.txt    | 2 +-
- tests/CMakeLists.txt   | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 349c2be..a3301ba 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required (VERSION 3.3.2)
-+cmake_minimum_required (VERSION 3.5)
- 
- project(libmodule VERSION 5.0.1 LANGUAGES C CXX)
- 
-diff --git a/Samples/CMakeLists.txt b/Samples/CMakeLists.txt
-index 9b369e3..2bc32c0 100644
---- a/Samples/CMakeLists.txt
-+++ b/Samples/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5)
- 
- file(GLOB EASY_SRC Easy/*.c)
- file(GLOB MULTICTX_SRC MultiCtx/*.c)
-diff --git a/docs/CMakeLists.txt b/docs/CMakeLists.txt
-index b39f0e8..2e26c94 100644
---- a/docs/CMakeLists.txt
-+++ b/docs/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5)
- 
- set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
- 
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index e5ffbf4..225a3a8 100644
---- a/tests/CMakeLists.txt
-+++ b/tests/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5)
- 
- set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
- 
--- 
-2.43.0
-
diff --git a/meta-multimedia/recipes-multimedia/clight/libmodule_5.0.1.bb b/meta-multimedia/recipes-multimedia/clight/libmodule_5.0.2.bb
similarity index 73%
rename from meta-multimedia/recipes-multimedia/clight/libmodule_5.0.1.bb
rename to meta-multimedia/recipes-multimedia/clight/libmodule_5.0.2.bb
index 7fed48f2f7..1124e972b8 100644
--- a/meta-multimedia/recipes-multimedia/clight/libmodule_5.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/clight/libmodule_5.0.2.bb
@@ -5,10 +5,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4f3c068505fd5a09e90662bfca90ad04"
 
-SRCREV = "3f60063e98631ce3fd25f70428b67ef15025597f"
-SRC_URI = "git://github.com/FedeDP/${BPN};protocol=https;branch=master;tag=${PV} \
-    file://0001-Update-cmake_minimum_required-to-3.5.patch \
-"
+SRCREV = "b373482a43482459b37bcf601e21846e9c9563d1"
+SRC_URI = "git://github.com/FedeDP/${BPN};protocol=https;branch=master;tag=${PV}"
 
 inherit cmake pkgconfig
 

