Return-Path: <raj.khem@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4CDC06FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 16:39:36 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id l192so3906176ybl.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 09:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jHstid8/QA+vAlK2RviQV3wDxXDU1AeJ6seGqFQs4Pw=;
	b=j7WQCYc3QWzO2V3EIl2J9Usfg6vp0ybdBvnpeKvp8KAQi1NjqpZmR2EIPR40yetd8e
	8O1y6odUQv6XKKhFFMZXT2MCC6wAPxx5KPnnRkY+DAHWfs91iRcJCjPdYS2pKEqbMOnK
	eJ13jWAUnAjXYRu0kuXUyQEZ9aKE/ff3m3I+000v/lLE6fvnrwuGLWUYWjmzwBsE0PH/
	9HTSD6XEPkxh6gR67MTwLCVDh1HmmBZgiu4hIKMB0lpquKioK1F64pv8fOEc0mxfrS+b
	rvOHTegjzyMKJEsjSIx6vXb4QQAzw+q4nHZ2igC+jMPT8OV+3Im1Uh4gbom7BbE8h1Ze
	wO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jHstid8/QA+vAlK2RviQV3wDxXDU1AeJ6seGqFQs4Pw=;
	b=m7xgWDwNoV+YXyc2Ais41HJGR0ZKKY29N12aXi0BaZOICysICm8yyqlZosY91t4ph2
	5N41IGoCepG+MPbFiUcDlMLn2AAEw/mwFZAR0ZTN5+IhHf06zH91G8sF8R4Wx23wxUwv
	Bu5/kewOIAT9pp7orO7UiqlxBAaq6y3cRH19ijKHKk1EDTtFMhcjbOGithhWBGaA26bB
	yaNLwoVD/LDH7rwSbmZ+gg8hZTv2jyiXD63kszWt5oXTW847ZGDSqvVQCpT25o826+y3
	Q5S/t/xOFVpibLhUXSRuoR0jIobnUTwF9oTVhXcxeYqN0S+zacJZiO02hzE5N8vl4qzv
	N5Pg==
X-Gm-Message-State: AN3rC/5hjuQTaGAh50/RAAW2wT2jTyocKBfsj5t2a+Conf5wjiSnPMTa
	Sz4gsYlzF6y7xQ==
X-Received: by 10.98.200.136 with SMTP id i8mr8667796pfk.154.1492706378111;
	Thu, 20 Apr 2017 09:39:38 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a21sm11501671pfc.60.2017.04.20.09.39.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Apr 2017 09:39:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Apr 2017 09:39:25 -0700
Message-Id: <20170420163926.20793-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [meta-oe][PATCH 1/2] ne10: Fix build errors on cortex-a7 cpus
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
X-List-Received-Date: Thu, 20 Apr 2017 16:39:38 -0000

GCC7 warns and errors about incompatible cmdline switches
for mcpu and march

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ne10/0001-Dont-specify-march-explicitly.patch  | 38 ++++++++++++++++++++++
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb         |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/ne10/ne10/0001-Dont-specify-march-explicitly.patch

diff --git a/meta-oe/recipes-support/ne10/ne10/0001-Dont-specify-march-explicitly.patch b/meta-oe/recipes-support/ne10/ne10/0001-Dont-specify-march-explicitly.patch
new file mode 100644
index 000000000..a8fea82dc
--- /dev/null
+++ b/meta-oe/recipes-support/ne10/ne10/0001-Dont-specify-march-explicitly.patch
@@ -0,0 +1,38 @@
+From 66d332e4b631eef800c6f62cd347b164ee3b59d4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Apr 2017 10:11:21 -0700
+Subject: [PATCH] Dont specify -march explicitly
+
+it assumes armv7-a for all armv7 based machines but that may
+not be true e.g. machines based on armv7ve and cortexa-7
+it causes conflicts in OE builds because it specifies -march
+in recipes anyway so this is redundant in CMakeLists.txt
+
+Fixes
+
+| cc1: warning: switch -mcpu=cortex-a7 conflicts with -march=armv7-a switch
+| cc1: warning: switch -mcpu=cortex-a7 conflicts with -march=armv7-a switch
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 68da920..a4b94b9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -138,8 +138,8 @@ if(ANDROID_PLATFORM)
+     ${CMAKE_C_FLAGS}")
+ elseif(GNULINUX_PLATFORM)
+     if("${NE10_TARGET_ARCH}" STREQUAL "armv7")
+-      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb -march=armv7-a -mfpu=vfp3 -funsafe-math-optimizations")
+-      set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS} -mthumb -march=armv7-a -mfpu=neon")
++      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb -mfpu=vfp3 -funsafe-math-optimizations")
++      set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS} -mthumb -mfpu=neon")
+       # Turn on asm optimization for Linux on ARM v7.
+       set(NE10_ASM_OPTIMIZATION on)
+     endif()
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
index 951086f77..e5b50ce75 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -6,7 +6,8 @@ SECTION = "libs"
 
 SRC_URI = "git://github.com/projectNe10/Ne10.git \
            file://0001-CMakeLists.txt-Remove-mthumb-interwork.patch \
-"
+           file://0001-Dont-specify-march-explicitly.patch \
+           "
 SRCREV = "18c4c982a595dad069cd8df4932aefb1d257591f"
 
 S = "${WORKDIR}/git"
-- 
2.12.2


