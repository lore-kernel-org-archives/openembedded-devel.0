Return-Path: <iillyyaa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF79C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 21:06:04 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.2002.1704229564130275907
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 13:06:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KRx1iNrh;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: iillyyaa@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-781251ed685so780823185a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 13:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704229562; x=1704834362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=djZ911EcJ5LvMrmUWT3s26Dsq/2U0lagmVSLeRsSQUs=;
        b=KRx1iNrhnzgvb7ouDDPU9t0cMPSc7G0M+7R6BVKu2uQz5ErHpqkyBBzrBiNUihi58y
         226HZZQUOkTsHTLiFa0CvxRD2EkgrSozmuvim15JNeVLjZq0JlgDC/SL0/zE+zUmdM2Q
         vJS0+nZXT+m6qbReKGr1jgB9WNtE2BJCJV2mOT+UUQ4w8QiSoL3QPkdXYlERBd7WhD3C
         5MgRuQZjG7nOCm+A71z4FQN8tCaDcap/lj/QqY8l6aC4SV7ZDOTpFqS6cVqGbo9cZ/Yy
         VngwG3rrbOUq0DdLYc3nh2cKnf8EMl8ooBKgaFJofNqRfCOhd3ekpvK3H6d7gh6aqlJV
         3iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704229562; x=1704834362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djZ911EcJ5LvMrmUWT3s26Dsq/2U0lagmVSLeRsSQUs=;
        b=YhGJMWdBh2i5CqlShmFURXSZLTcFt6mj1pbRB59I2qxkhFhzQnFqDdSgoAQ4r94R/I
         0qj/OCuffrWALv0tZV2lz5HbS5fJLT1M1ZyvypRWjRAOax3aY2jlSwKPhyN0P35/K4SL
         Yc7Qe7Cu/be4ZPpK4tiirlwXUz0VLOssyopSM/wdQn7kMGkvu278dkoalF5yht32vspZ
         CT9yucIa2oAXseSH90nceUm6QW9dqioW3hXYt6j9BX3L3DVHhLjB2u30bDxE6Hnr+Pmi
         AkapW8c5YchNEiNWEtrNLmdKo4YOdIp1PhIChgBmVfCaF4I/SaB4xVszBMvli2+gFqNq
         DxrA==
X-Gm-Message-State: AOJu0YwwNqOmAQV1rzOpaNdUBsPARB+4Q67aVurya40GpoXZg/GtbZW1
	rY8HThR1YO8jaN1RU2PPaqEcl0V2PZQ=
X-Google-Smtp-Source: AGHT+IENuEoIGWz7VjPFfuC1qDl6Hhu+K40paqO9VRk2gCOjMIunyOioU+vSxi+XHLL9J+bqsh27rA==
X-Received: by 2002:a05:620a:2886:b0:781:792d:6565 with SMTP id j6-20020a05620a288600b00781792d6565mr10669584qkp.146.1704229562373;
        Tue, 02 Jan 2024 13:06:02 -0800 (PST)
Received: from palpot.eng.veobot.io ([50.239.151.2])
        by smtp.gmail.com with ESMTPSA id l8-20020ae9f008000000b00781b8f4c89asm2111428qkg.43.2024.01.02.13.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 13:06:01 -0800 (PST)
From: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
Subject: [meta-oe][PATCH] srecord: fix install prefix
Date: Tue,  2 Jan 2024 16:05:54 -0500
Message-Id: <20240102210554.843148-1-iillyyaa@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 21:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108019

srecord's CMakeLists.txt was unconditionally setting CMAKE_INSTALL_PREFIX
for non-WIN32 builds, which caused it to ignore OE-supplied prefix
that contained the sysroot portion of the path.  Fixed by setting
the prefix only if it wasn't explicitly provided.

Signed-off-by: Ilya A. Kriveshko <iillyyaa@gmail.com>
---
 ...make-respect-explicit-install-prefix.patch | 31 +++++++++++++++++++
 .../recipes-support/srecord/srecord_1.65.0.bb |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/srecord/files/0001-cmake-respect-explicit-install-prefix.patch

diff --git a/meta-oe/recipes-support/srecord/files/0001-cmake-respect-explicit-install-prefix.patch b/meta-oe/recipes-support/srecord/files/0001-cmake-respect-explicit-install-prefix.patch
new file mode 100644
index 000000000..d310d0410
--- /dev/null
+++ b/meta-oe/recipes-support/srecord/files/0001-cmake-respect-explicit-install-prefix.patch
@@ -0,0 +1,31 @@
+From 4aa8cf8c93e1fa6ffeb40fc3473f32b1b83af141 Mon Sep 17 00:00:00 2001
+From: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
+Date: Tue, 2 Jan 2024 15:37:10 -0500
+Subject: [PATCH] cmake: respect explicit install prefix
+
+If CMAKE_INSTALL_PREFIX was supplied externally, use it.  This follows
+the pattern suggested by cmake documentation in:
+https://cmake.org/cmake/help/latest/variable/CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT.html
+
+Upstream-status: Submitted
+---
+ CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 74b8108c..ac9f464e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -30,9 +30,9 @@ include(InstallRequiredSystemLibraries)
+ include(GNUInstallDirs)
+ 
+ # FHS compliant paths for Linux installation
+-if(NOT WIN32 AND CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
+-#  set(CMAKE_INSTALL_PREFIX "/opt/${PROJECT_NAME}")
+-  set(CMAKE_INSTALL_PREFIX "/usr")
++if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT
++        AND NOT WIN32 AND CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
++  set(CMAKE_INSTALL_PREFIX "/usr" CACHE PATH "Install prefix" FORCE)
+ endif()
+ 
+ # Pull in the rest of the pieces
diff --git a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
index 06ce48e65..3e8a87d07 100644
--- a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
+++ b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
@@ -4,11 +4,12 @@ LICENSE = "GPL-3.0-or-later & LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = " \
     https://sourceforge.net/projects/${BPN}/files/srecord/${@oe.utils.trim_version('${PV}', 2)}/${BP}-Source.tar.gz \
     file://0001-Disable-doxygen.patch \
-    file://0001-cmake-Do-not-try-to-compute-library-dependencies-dur.patch"
+    file://0001-cmake-Do-not-try-to-compute-library-dependencies-dur.patch \
+    file://0001-cmake-respect-explicit-install-prefix.patch"
 SRC_URI[sha256sum] = "81c3d07cf15ce50441f43a82cefd0ac32767c535b5291bcc41bd2311d1337644"
 S = "${WORKDIR}/${BP}-Source"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/srecord/files/releases"
 
-- 
2.39.0


