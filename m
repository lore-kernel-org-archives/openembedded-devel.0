Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4F9C83F1A
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:49 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.5756.1752004668500914620
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ns7Dfd6O;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32ac42bb4e4so39283841fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004666; x=1752609466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/yM9UrERi9oRjJ8N7WfrYvk/OMan8ahq6GaSsmMRYo=;
        b=Ns7Dfd6O2q07Wlr36bL2iBPhmF4zZNGRDCVBF5uKh1zisXvNLHXeTq4H8a13uZR/89
         1+k9OTlOBxAQImZg72sXWlVBRj05EHwjcVEn5tXUYFGXX5hM+0ovWrXR9mjZ/ypbeFh2
         0Lz/VJjUZ2gYIZjMq1DybNJgukkZs5L2A3F0hRDzDEe4TOkN2QLXUV2KpmItnp8Tmsai
         7wE2jz21UwaOVnfjxkojc20WV7EkjAOS64P5Co+7CLjsDgz9r8BimzscMDKGrdxK5QZj
         gTld0eYUi1+ZaW7EpTFRDc5i/QtuU8Gxb2IYwJRF0T17qpCbHKWQm3k4Rt80Q2kYygVZ
         Ixvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004666; x=1752609466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/yM9UrERi9oRjJ8N7WfrYvk/OMan8ahq6GaSsmMRYo=;
        b=lJ3viv3Em5OmFLGALPT6DAJuER4XIBPzUOC5h8I+oMK0I35XbU3gzl4ndC0Vc5TtZY
         kFOYceA12I8Z3Fr0a4n6Sf55PUlbxl7Np+5xqrIH0eOThqCaWMCxacU0V2EKULoOmdLk
         jnlMPCnQ0+lYcD0WmBxMw8eXT8F1TLdC+DDiOupZ9sPaAMjrkTVAG4+t0yDrTMwyJVDb
         CS/ni8Ucqmyqbkn2Sd+c6MSwvNLk5bz6Zn1E7leFudFy43OJPUjv5xp0oJF128aiV/D+
         FmBHvMEHqRKYJqQ/awnMLZKiXL3w3RQ5yiUJsZTEH1AcZ0fU6EtI/SyQUX1DmmJh7TnT
         e4YA==
X-Gm-Message-State: AOJu0Yzd24L9yXDNlzKt0G9ObwTKCgVMGbeKad9bOIN2XNsUFnOhHfLk
	9GDfX1NzMSqrVkPfX/XGbjRMkOlfLaxlXHkMkl0ZUuJhwiVKz2hE8EMEaSWAvw==
X-Gm-Gg: ASbGncs9VimTzQa4lFk5e9a8N4s+Do53ug756Zw7Eqy1LcYqEBV1oT2eb3Rz0OpcThy
	IOJdqvhDQcNQjmHIMIrFwmv2Nw6IQ2QIFguZYT71gfo7UIyKUnbznoZNAUJ2c0J7FoAcmQ70shG
	a77s6t3KjJ0M1GMktKcnqdn+TJLJAwG2Idrsj0aW66Hb0NNEKjOVf4IjWZap89Ga5AiP/BM/Gy8
	R6VuOlgDE9YDkK8Maoy1SVGdAUyruWsQkj/t+LNYIhaXlhQAbkh4yhNMCq23d9iZHCJYP2sGM5Z
	w/+QtWzyG+OjuzISwjvS+IHDNbmgr4FKaviQRgUUI2ker3SvN+YMk9k5fmhZCmvxKIJKdHr6VLK
	ZBCk=
X-Google-Smtp-Source: AGHT+IHDiJ+e2PbhDCJA1jakA408MWG7xHW7hsZQRuqYv94+Rbw8Q1z7IjuS8pVwfzNYjgvkVCN7ZQ==
X-Received: by 2002:a2e:bea5:0:b0:32b:8045:7264 with SMTP id 38308e7fff4ca-32f00cb64a9mr53333801fa.12.1752004666065;
        Tue, 08 Jul 2025 12:57:46 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:45 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 15/20] spirv-shader-generator: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:31 +0300
Message-ID: <20250708195636.1678606-15-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118337

Fix:

| CMake Error at CMakeLists.txt:22 (cmake_minimum_required):
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
 .../0001-allow-build-with-cmake-4.patch       | 43 +++++++++++++++++++
 .../spir/spirv-shader-generator_git.bb        |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/spir/spirv-shader-generator/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-graphics/spir/spirv-shader-generator/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-graphics/spir/spirv-shader-generator/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..31b3ef81fa
--- /dev/null
+++ b/meta-oe/recipes-graphics/spir/spirv-shader-generator/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,43 @@
+From ba72528b21e024fe4f5464466976a8234d7c330c Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 20:27:11 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:22 (cmake_minimum_required):
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
+Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Cross/commit/82331a2ca9f2ea90d05901e931aa8c21e70dc40c]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cf14c8d5..ef9695a9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -19,7 +19,7 @@
+ #  2. The MIT License, found at <http://opensource.org/licenses/MIT>.
+ #
+ 
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ set(CMAKE_CXX_STANDARD 11)
+ set(CMAKE_CXX_EXTENSIONS OFF)
+ 
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
index 567f7a55e8..1ecd315a2e 100644
--- a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
+++ b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "graphics"
 
 SRCREV = "f09ba2777714871bddb70d049878af34b94fa54d"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Cross.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Cross.git;branch=master;protocol=https \
+        file://0001-allow-build-with-cmake-4.patch"
+
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE = "-DSPIRV_CROSS_SHARED=ON"
-- 
2.43.0


