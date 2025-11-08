Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5D7CD1288
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 15:08:38 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7233.1762614516380872684
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 07:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mc3tpa3q;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3108f41fso140450f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 07:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762614515; x=1763219315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J8P1jKomtYnra5EYaNT+PeULMGjZ2eINyk4Ey+6RX2s=;
        b=mc3tpa3quw5Z3FEidlIyrLBlSKEgBSreREl+UL2c9BNTM9S8U1VbhiJgWp+AdzGMDh
         s+IRA0B4L5DnIjjyzGNfUnK6oN3ZOeuJEbgm6c77aMz+9OkNp15e2Gf10ENFvoFs1uke
         Kvydpm7uG4L9q5EutwCAxxmV+zj6LApz/REMlpQOpYfgijoz8tZjVeaeys9vEKxgKqYx
         ne5XHvROPfSvhDGNbqDAoj23z2fOwJu9iFGApprWuMtOcFo3kJu7O10U+tMEHa3Zz09P
         rDZO5uRNzrp/3mcslJDnUtyINjaKjW8GLk13DkF/50vQKXt6jbKWQNJu6ml4nznmIsqA
         t2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762614515; x=1763219315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8P1jKomtYnra5EYaNT+PeULMGjZ2eINyk4Ey+6RX2s=;
        b=adJPFvegxK1DlJ8b6t0b/CcgoDCkg/5bwHhVjK79u5AUfCYWe135EgAzpO/SvK3StM
         OWd8/Yn1flXFTSuAlylwSk113UVyui8VpqTF0/1C844ZNkQX8qivk4zLHZJbLHLMPIW7
         wpEATSqwXakcbUC5WtqRYwJzr4Y2KesxOPPhclDlVA8lgC6Afi6OxyOMe+hBsb+nJSyi
         7XACEp5ilrVZ8xrZ0+dsXz7znsedWJEVmmiJMz9Q1Lw1itjdRCr0W2hnmrw6hMsSu0Ia
         9593KBVHlqqPPY599AzzZsXOSd1OU3UQYzQEiEhctci1cBom+6yDXQC7iJQAkOvyDUs9
         Y32w==
X-Gm-Message-State: AOJu0YxP/LjAjmf62O9fjdzGPuNXs3U0a+UP/2UAN+QguJ/Mpe8HLAkQ
	rIOzTcJQ6166FvBDwGqePPk1q0XQVbapr3lnjw3RSyI1BTt3tXUKG0umbUrGh3/m
X-Gm-Gg: ASbGncvHtpThljRvJSZuvwO8lq72iebbQZBqeMD+y+ibyLiRUYomnTWtFAYiDE2t027
	osYeml0ipgS9xK1PdE0asepw51cKTL4nzOXhK8CiWBfBBDi5Yhej1y/L7lN28kAQblQtyBOxSIg
	aXQyV7iHTU4VCEkoywrdA0qpaI5NhVCP8DtupyVnY4REB80h/CeRaQThFAIjx8rMUetu4jpo2W1
	lR1MJIeV5rl6w5LqrzzUQxj/UE8SK1+uT9EiaxwXMP7AyLsOpsB7M/KJlVcYxhzHw11omL4xAUR
	aVqnOMIYQ7jRRi3OGCupIFzBQ0QnFhWpLG/viL6ynraCeVnLkkrCNWGbsdEuLTXG27LHegXj8sL
	RFnim26E/nohcSvNXLhADz/tH2DdPHtsrf+NGjN3QWDnYXvfSCzddt2bwTr2NEN+SoAhdHOxEHg
	==
X-Google-Smtp-Source: AGHT+IEqKk0bkgztFlJyjiixY24gU+3xY4WvHElIDQM11+/wc/+y9nV/K1mywjPEjIJL6Z4X2bZtgQ==
X-Received: by 2002:a05:6000:3104:b0:429:b2ad:f31e with SMTP id ffacd0b85a97d-42b2dc32037mr2329703f8f.35.1762614514449;
        Sat, 08 Nov 2025 07:08:34 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e13csm11869284f8f.19.2025.11.08.07.08.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 07:08:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/5] spirv-shader-generator: update to 1.4.328.1
Date: Sat,  8 Nov 2025 16:08:29 +0100
Message-ID: <20251108150833.3299165-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 15:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121394

Update to latest tagged release - the recipe was using a 3 years old
commit, however the project is under active development.

Drop 0001-allow-build-with-cmake-4.patch patch, because it is included
in this version.

Also, correct the branch name, which was renamed from master to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 43 -------------------
 ...bb => spirv-shader-generator_1.4.328.1.bb} |  5 +--
 2 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/spir/spirv-shader-generator/0001-allow-build-with-cmake-4.patch
 rename meta-oe/recipes-graphics/spir/{spirv-shader-generator_git.bb => spirv-shader-generator_1.4.328.1.bb} (75%)

diff --git a/meta-oe/recipes-graphics/spir/spirv-shader-generator/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-graphics/spir/spirv-shader-generator/0001-allow-build-with-cmake-4.patch
deleted file mode 100644
index 31b3ef81fa..0000000000
--- a/meta-oe/recipes-graphics/spir/spirv-shader-generator/0001-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ba72528b21e024fe4f5464466976a8234d7c330c Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Tue, 8 Jul 2025 20:27:11 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:22 (cmake_minimum_required):
-|   Compatibility with CMake < 3.5 has been removed from CMake.
-|
-|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-|   to tell CMake that the project requires at least <min> but has been updated
-|   to work with policies introduced by <max> or earlier.
-|
-|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Cross/commit/82331a2ca9f2ea90d05901e931aa8c21e70dc40c]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index cf14c8d5..ef9695a9 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -19,7 +19,7 @@
- #  2. The MIT License, found at <http://opensource.org/licenses/MIT>.
- #
- 
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5)
- set(CMAKE_CXX_STANDARD 11)
- set(CMAKE_CXX_EXTENSIONS OFF)
- 
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb b/meta-oe/recipes-graphics/spir/spirv-shader-generator_1.4.328.1.bb
similarity index 75%
rename from meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
rename to meta-oe/recipes-graphics/spir/spirv-shader-generator_1.4.328.1.bb
index 1ecd315a2e..b5f22f08fc 100644
--- a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
+++ b/meta-oe/recipes-graphics/spir/spirv-shader-generator_1.4.328.1.bb
@@ -4,9 +4,8 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "graphics"
 
-SRCREV = "f09ba2777714871bddb70d049878af34b94fa54d"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Cross.git;branch=master;protocol=https \
-        file://0001-allow-build-with-cmake-4.patch"
+SRCREV = "7affe74d77f93a622bb5002789d5332d32e512ee"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Cross.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
 
 inherit cmake pkgconfig
 

