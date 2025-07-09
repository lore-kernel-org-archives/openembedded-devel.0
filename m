Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4754AC83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:36 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.3057.1752082291343264957
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jiLtbtq+;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-555024588b1so79392e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082289; x=1752687089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUB8N4WXrg+XkwXzifByJ9OL09RByS6k3nCdhE6XPdA=;
        b=jiLtbtq+c9rSW0X7vsMK78Zk8ABC0gd1sCtUnYUbhKWvqWYu5MvpcC1hUvI2nKLOsw
         f9KaF2DjQYyPhsmYJmUnfUbT08PYjgaabHxFgFO42NwhGm3LuE6eQW+tiIjpwhE9zNw1
         2YYVmFQx5GYxVZsOQ6IGSr/5OUlNoOq64JeKzoqMeq56kQuvPt5TucB2eUy9hTIR2ZZh
         RSuLSdLUwUeejYzmK4XANwPHLrC7HztLt9f52e68OL267LcHGOnEKLxSktY107jlSAtr
         AYEEiW2fvnRQLk6nWzjDqI3z+h/u1cFFqVgraWiodAwsLmWv2Is5jpQCZCZxClRoxkAS
         lDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082289; x=1752687089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUB8N4WXrg+XkwXzifByJ9OL09RByS6k3nCdhE6XPdA=;
        b=MaAhRmLZ+9TMJ9HZ1sxYe0PPkBxpEUSzzN7pCniaSO/pN3PBKOLGsQdH6H+hIruyxX
         o7yar6ik5a1wc8rWdyvrd6FmM+E0jqaUiyIceiDkzsCepwfWO6FloRJ1b0ZfyxEaHuLO
         PchzCZXzpesZF+QBjkn67rNrOyV6nSQE3uwSfSA3sqoPT3bF52Kz+pWZ6KZrht3DAw0g
         rVpE3zFx6LLwPQb8GXZylNRFWXjTi1ITYikUFXN6I0rTVRgSMtVLr2QqyuQAdhEPvH/t
         9I9ooUAb5dXGFSaHjH5Dx5o5oSoPbIqXqjOrg5XaDEh+haKC4SOgBMbP8qD4zud4o+nD
         DW1w==
X-Gm-Message-State: AOJu0Ywfcs9/mi+inY8nRAlzVns0vh7eLNevxsg3+DG1ZYoEHWLzO5W3
	3jOdV/PbiyD58hW+OYPYLoh23qdmHP9DAEArASNpzOrZiKSqGEdmHAuuyYZQxA==
X-Gm-Gg: ASbGncv49l2mskbChT1GYX4YAXwObHB+nB9/DKusssF6qgmfo6i3ZKqZqZxwmlINYvi
	p/DAMwUcvkbQkfJuFW/sVsQCbja9s/cupvB11EpWPeojOftwLMiCWWO2TbXE05CMd6WeTfH1VEs
	mi/fAHYHkD8FuxkLOBaqCMGFZOveMSUhaIhYWCLitonmDUWHDxmAsLgsMAw3pwp13l3dUu5zwmS
	Glu5UJIlHBXFqK+RZ1MgcQp5ztcW8xXDqMlu6KcGjjn9zYvXXbr4JEasbTPTqJ4Zz9bdrmvbfft
	rRmCMmCK2teh+4c4eSHD8bGwVreY6on0MRCBAdTQX0lZgKF9Oyiwq/W5if4lQhLKAncQK5o/zM6
	aeUo=
X-Google-Smtp-Source: AGHT+IFAWNyICQxo2xgJ9IQnzToSytdGY9lDLr0YpA32vGltjXM14Vn3lLrWU/5H/WsQuC6JRu0wsw==
X-Received: by 2002:a05:6512:159b:b0:553:2868:6362 with SMTP id 2adb3069b0e04-558fa90285emr1095340e87.26.1752082288879;
        Wed, 09 Jul 2025 10:31:28 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:28 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 16/20] cpputest: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:50 +0300
Message-ID: <20250709173054.605430-16-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118370

Fix:

| CMake Error at CMakeLists.txt:8 (cmake_minimum_required):
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
 meta-oe/recipes-test/cpputest/cpputest_4.0.bb |  5 ++-
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-test/cpputest/cpputest/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-test/cpputest/cpputest/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-test/cpputest/cpputest/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..cb12fe5f63
--- /dev/null
+++ b/meta-oe/recipes-test/cpputest/cpputest/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,43 @@
+From 2f264a05a1b0be02a8889427ff1e917f851097ea Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 18:50:25 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:8 (cmake_minimum_required):
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
+Upstream-Status: Backport [https://github.com/cpputest/cpputest/commit/fbb8526750aa370e642da7c21a98d6efdf7a3f37]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 88e0cfb5..1fa3f27e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -5,7 +5,7 @@ set(CppUTest_version_minor 0)
+ 
+ # 2.6.3 is needed for ctest support
+ # 3.1 is needed for target_sources
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ 
+ ###############
+ # Conan support
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
index 5710585b6c..bdc954c1e9 100644
--- a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
+++ b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
@@ -5,9 +5,10 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ce5d5f1fe02bcd1343ced64a06fd4177"
 
-SRC_URI = "git://github.com/cpputest/cpputest.git;protocol=https;branch=master"
-SRCREV = "67d2dfd41e13f09ff218aa08e2d35f1c32f032a1"
+SRC_URI = "git://github.com/cpputest/cpputest.git;protocol=https;branch=master \
+        file://0001-allow-build-with-cmake-4.patch"
 
+SRCREV = "67d2dfd41e13f09ff218aa08e2d35f1c32f032a1"
 
 inherit cmake
 
-- 
2.43.0


