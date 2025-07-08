Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29900C83F16
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:59 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.5757.1752004670731045436
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nPEvD6bn;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so5531503e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004669; x=1752609469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lv7Qjm1Zj4tobdNpB8Ft7QInhBBYEYuaPMoeASjXbbI=;
        b=nPEvD6bn7gHwfYG/mQzIsWy+VGgb23zuv8vTW4ADadSGPiSqZ8N4FimBvJ2l6k2mQA
         J6zgJACPMhig0fK6LMtXzpSTN7tzgowwsinVFbVLN70JO6+qW3BoLkVPWeUNP/CqhPR4
         ZGVRTrGoApQDU2EOodU9Zt54jAzo8Verl+9mCsWt7cSdGQFdDhshywiM45tnNBqUS46O
         Rl+uBt1UC7/9RGS+m0piXlBzVqVEBpQoozd8DjjObyUr9ZHsYjtnsvkr1QZpDO5UUpTR
         lelPQj7xl62+lZJmahCyjx35F+SKiW+J3tQcPbZoFzkk8awlucjUjlAqZ+GC03T6OFKp
         gaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004669; x=1752609469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lv7Qjm1Zj4tobdNpB8Ft7QInhBBYEYuaPMoeASjXbbI=;
        b=KYyj2pbKr5wTmsKOpkOLQiTGj6L7S/eCT1iM7sn6cSxFu4n0lOK/A51Gsp/tfKJkBC
         5Y3O8AfdmQbw13IUayvTyeETU9m06Ncd2gU1ZEzzfCD/kmyez977Xp2hm1IZ6Lk+vh0a
         O7cDNgODwefHSTkYyDazrj1jj9gKyvDQEszQbuNN17HXkS1ROWC/5v4o9w7gQ5fCbf+u
         YqFvWGUaN2pvFKuJb+87Cj0vpbyNKBm7N9VdX8fLh10M1Xd0bau3nGr23zXua8eJb15E
         GFxw5BHlUWa6Eua+XAuJXiPkp95UJakuYpkrpkVCfss+vi+MRv38O/va8WW7ixwTx8T6
         rg8g==
X-Gm-Message-State: AOJu0YwNdv/f/8txU1LrQsN36V9Gyxqg2GUtQJzL3AcoJqvJGaJrvlat
	DOHnHqyRww6wZWJphu9QvxFsHdrvQ1t9Z3Jb70oOAq3n5lmR/o++PgiGO880vw==
X-Gm-Gg: ASbGncuU86m632lrsKKAn1SnAiK1uD1FFPJJDLZPDATh/ki0Z6uX0l366kANiD+japC
	J7XE9q82s3uR0D2E7x/PcOAF7lObzj+GKIjCYq3yeRStBxAyXDQP7J/OmD5iYhazzliOhR4+/pW
	hFs+JuKUD8vhrzHcTbRqgafg4mfLrm/829bRAab0AuRo5j8FUn6DIYXMs7N4njuULetxyN4T7Mm
	eYCWYHtE6oSCuUSZtFVmjk0OY5gsO0CAk2XVo+beXFVZp88gp6SqJiY61zJa3BuvYUvjnW9hyS6
	uK95aM380DXEaa6AFqEpHd/KFYyG/434bMOWnZ1SDr7V4VB76PHrWZHrGa1oEZv0Ux2wZoZGtdu
	o774=
X-Google-Smtp-Source: AGHT+IGzayexguix2OGpY+CO+DlofIzcqHfe4/cRy7R32GmM9HnyQLj/APEXXmDrCKuegj3zit07PQ==
X-Received: by 2002:a05:6512:1324:b0:553:ac4c:2177 with SMTP id 2adb3069b0e04-558fa89e705mr3425e87.20.1752004668502;
        Tue, 08 Jul 2025 12:57:48 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:48 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 17/20] freediameter: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:33 +0300
Message-ID: <20250708195636.1678606-17-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118339

Fix:

| CMake Error at CMakeLists.txt:24 (CMAKE_MINIMUM_REQUIRED):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../files/0002-allow-build-with-cmake-4.patch | 81 +++++++++++++++++++
 .../freediameter/freediameter_1.5.0.bb        |  2 +-
 2 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/0002-allow-build-with-cmake-4.patch

diff --git a/meta-networking/recipes-protocols/freediameter/files/0002-allow-build-with-cmake-4.patch b/meta-networking/recipes-protocols/freediameter/files/0002-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..89a215d975
--- /dev/null
+++ b/meta-networking/recipes-protocols/freediameter/files/0002-allow-build-with-cmake-4.patch
@@ -0,0 +1,81 @@
+From a96a8f8debb457fd5bdcd34f005670678870ec70 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 20:58:10 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:24 (CMAKE_MINIMUM_REQUIRED):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Backport [https://github.com/freeDiameter/freeDiameter/commit/45106adf3bf4192b274ef6c5536200a0e19c84f2]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt            | 6 +++---
+ libfdcore/CMakeLists.txt  | 2 +-
+ libfdproto/CMakeLists.txt | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 870e1ef..f1e6dc5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,8 @@
+ # This file is the source for generating the Makefile for the project, using cmake tool (cmake.org)
+ 
++# CMake version
++CMAKE_MINIMUM_REQUIRED(VERSION 3.10)
++
+ # Name of the project
+ PROJECT("freeDiameter")
+ 
+@@ -20,9 +23,6 @@ SET(FD_PROJECT_VERSION_API 7)
+ # The test framework, using CTest and CDash.
+ INCLUDE(CTest)
+ 
+-# CMake version
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12)
+-
+ # Location of additional CMake modules
+ SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")
+ 
+diff --git a/libfdcore/CMakeLists.txt b/libfdcore/CMakeLists.txt
+index b1bc0f1..4fefcb7 100644
+--- a/libfdcore/CMakeLists.txt
++++ b/libfdcore/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ Project("freeDiameter core library" C)
+ 
+ # Configuration for newer cmake
+-cmake_policy(VERSION 2.8.12)
++cmake_policy(VERSION 3.10)
+ 
+ # Configuration parser
+ BISON_FILE(fdd.y)
+diff --git a/libfdproto/CMakeLists.txt b/libfdproto/CMakeLists.txt
+index c7164fb..4cedf65 100644
+--- a/libfdproto/CMakeLists.txt
++++ b/libfdproto/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ Project("libfdproto" C)
+ 
+ # Configuration for newer cmake
+-cmake_policy(VERSION 2.8.12)
++cmake_policy(VERSION 3.10)
+ 
+ # List of source files for the library
+ SET(LFDPROTO_SRC
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
index 89b2572c04..31ac1fb9b7 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
@@ -25,9 +25,9 @@ SRC_URI = "git://github.com/freeDiameter/freeDiameter;protocol=https;branch=mast
     file://0001-tests-use-EXTENSIONS_DIR.patch \
     file://0001-bison-flex-Add-flags-for-carrying-user-specified-par.patch \
     file://0001-fixes-for-gcc-15.patch \
+    file://0002-allow-build-with-cmake-4.patch \
     "
 
-
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=868c059b6147748b1d621e500feeac4f"
 
-- 
2.43.0


