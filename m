Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06634C83F0F
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:26 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.3046.1752082275887571428
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dQtXAIcc;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54d98aa5981so106750e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082274; x=1752687074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vx6RtbPochu3fDxcoEWmGnp5l0glyURQgYGL4l4IEeo=;
        b=dQtXAIcchZMmkYo0rHEvKH8/t92j/FcLUF2b9AEgYZ8AAUQyN2jP+AXmC9Vjhs0oIF
         GHo62gTttYgMWDdk9p9U+Mz2WdP0BQ21hPvJhQAHpraSJ9RqQUWIH/qPgvEH+TT0vANr
         Qrg0KoCcBgSa4+F+c6GSP+s3QgwP2y5CT9al/NfJkf5DTPFMv53bf2zOrIifDG7qkdsT
         Q+7pJ0veT7+ivjXGGxy9oZYHoW6l7bMIJtH8xjFiC4Gxn6l9qnTjuRrHYo9b5L/3X86d
         pwQD9JgsHYakYgCyRUdePtHTD5Zg9t3Hoj5FDS8+2Itvg7v+90xhTDyoOe8seJDmlY2w
         onkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082274; x=1752687074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vx6RtbPochu3fDxcoEWmGnp5l0glyURQgYGL4l4IEeo=;
        b=u+A1fzU5L3+a6QJAa2KPVu/XeUM8FdGcqycnDDdNo2+3qm48x35P/pd88JI8iT2m2O
         wPGZ5gvfxA6mpVHFFOF8UdOmux6T6T452uGM4a2wLbQTM9j/Jh+AZoAsFabKD5rew/1j
         6ZOyPauHcADSuPOQo28qeU1Svq12IUeMo9i1gkuGVz3LN7uWOIBdlgt+j0D36k0FxJk1
         mFWqQ7EQHxZ2L8JZCDk6jROFak7LYmAjFk4IceN8rUtmb+7j0xWnoMONNKJLshpGmtt/
         CSNIeldXuKOyi3w7aLuWr6vSVZ4aHr1KVfmTcxwj2zVidNxo93hwml/X0t2meZYibZSo
         KsUQ==
X-Gm-Message-State: AOJu0YzDX09tPc8FjE5Ebux8wiXXcMrs+OVrq7B+mbHg5yhAIv8yc48v
	OuGKAcOQpMiFlKcv3ctCfWEUT7YNZGeUgwSzj1vtGzOzL604Bj/eJ/bCgt5mVg==
X-Gm-Gg: ASbGncvmxeiJ35RiuTsK+no8VTHJ99i+pJJAk4pm2z6D1d8N7vT6elooNcyNu2wL5Ey
	Hsst6yRwFftjD6rVp8LIpu6GwbV1K3Xa1fjhF0dd44hcVeh6TxyS+EA+Nmj8Ibj5tKJkC/Nt4oZ
	YUQtLLWiFm4toxmzPxJKyeCIaWSmAil9TmrB00RQpVPfCARvGVVZ1GBDFFDNZcv/U/LzyB1wquc
	2+2c7J4jXZWAA8pvAepsYMKZ1mhMINXjR4a09MK+gkt+7Q7vDOcoMxLIwZHvUkSZIisgu7HHj77
	lNSYvLr08dqllo9JptiJEip2UCWIunC7X29jeN0NQ4WM/Qd/s+sPbLy4PXNFRBElDPCUofQcgeH
	zih4=
X-Google-Smtp-Source: AGHT+IHMCpFf3za/2zga9wzYWUXOD8EqX8q/IGQQEoB/vBNYMqt0kT2fJkpzPxEdYrtE0w5XtKL2mQ==
X-Received: by 2002:a05:6512:acc:b0:553:263d:ab97 with SMTP id 2adb3069b0e04-558fa876adamr1237993e87.1.1752082273452;
        Wed, 09 Jul 2025 10:31:13 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:12 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 06/20] p8platform: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:40 +0300
Message-ID: <20250709173054.605430-6-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118360

Fix:

| CMake Error at CMakeLists.txt:3 (cmake_minimum_required):
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
 .../0001-allow-build-with-cmake-4.patch       | 42 +++++++++++++++++++
 .../p8platform/p8platform_git.bb              |  5 ++-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/p8platform/p8platform/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-extended/p8platform/p8platform/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-extended/p8platform/p8platform/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..cb49cf3624
--- /dev/null
+++ b/meta-oe/recipes-extended/p8platform/p8platform/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,42 @@
+From 0cfe5772f35d067cb10daf3c66b7fe5f3901f260 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 11:47:58 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:3 (cmake_minimum_required):
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
+Upstream-Status: Backport [https://github.com/Pulse-Eight/platform/commit/d7faed1c696b1a6a67f114a63a0f4c085f0f9195]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f5b2ff8..b7cf077 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ project(p8-platform)
+ 
+-cmake_minimum_required(VERSION 2.8.9)
++cmake_minimum_required(VERSION 3.5)
+ enable_language(CXX)
+ 
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
index e69d544b66..e7af1c7298 100644
--- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
+++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
@@ -6,9 +6,10 @@ LIC_FILES_CHKSUM = "file://src/os.h;md5=752555fa94e82005d45fd201fee5bd33"
 
 PV = "2.1.0.1+git"
 
-SRC_URI = "git://github.com/Pulse-Eight/platform.git;branch=master;protocol=https"
-SRCREV = "a7cd0d5780ed80a4e70480d1650749f29e8a1fb2"
+SRC_URI = "git://github.com/Pulse-Eight/platform.git;branch=master;protocol=https \
+        file://0001-allow-build-with-cmake-4.patch"
 
+SRCREV = "a7cd0d5780ed80a4e70480d1650749f29e8a1fb2"
 
 inherit cmake pkgconfig
 
-- 
2.43.0


