Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226EBC83F1B
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 17:39:00 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.1131.1752169136505964087
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 10:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jIMre/ZB;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55511c3e203so1171516e87.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 10:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752169134; x=1752773934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=efqe4zVXEXcxQSoF2wZfOCFxuFe2/KQkJYMnJQ+wUXw=;
        b=jIMre/ZBeQXNOxbWLQjdFAGU6PtLziRFtm1mj7bsYvh162ta8YOftpjgPvEVpN96Nq
         NcbDuFZKeR+b/bSxwjEXQgmi4U1qoYVugoGQel9fpcxEmSb18KWhc3lRj+lIzm69XMm/
         qRae/pm8pxzoBoXIO3JiHrhVWEb1jTWK8CiyybD7b6pAV0AGGCBGWl5bg9SfT8idUydz
         ZcHSIJq7kFX9B4QwnCo57GWJ6iSlAH/sL+wZN/teZRqTKNaCWVUU0D0W9/3qrZ3lsI5S
         af5478NgaANxUa/+c7t2EL+uz+gGMJ0IH2V+R0LBxELgdckADZISrIqscsr6+gHAYpdG
         OjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169134; x=1752773934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efqe4zVXEXcxQSoF2wZfOCFxuFe2/KQkJYMnJQ+wUXw=;
        b=O1oKi+WlGrFx1ciIF/NugUtbNP6BJKYZns8o1uG+1Ne7nq9TLSQU6Suhh+Gkq1kzWv
         +/Vshgts6V1bqctWeMP9mTz0xA65JYiI0VcwHY3H+cFxRnGDrPQoldv4PJwqyk+fvwFz
         yks1ePZpDmib+ReuAvmmtzDt/IUGHWMSZ7yJgUzPWGauOkmoTfKuJWL14u2wddYUWfPE
         UTBHn9WZIUia5/bCYhJn2rl4oqz2AUNbo1NKI8a4R2E9LnEGs0u3kNY2iuLqO97nAQmb
         h5qqqd3Ot51yHWsSoZriIqwpz/oax5BKWRwE94XxN5rl9RwnmPShdhqkdD1v/Sbq5/q9
         pQew==
X-Gm-Message-State: AOJu0YwRX77UpwKmX9cKRV0VVCHKKh0cPrMlyzrG2g5+PpumijeGqn0R
	OQm/+5SOWdRO5oydRo5xtA0+JnzvDJ650by1JnVqHEOaqw85iDIBaH/FamW+1g==
X-Gm-Gg: ASbGnctppP7FHO2V4967y9tjxpIC39G7lruCD5mmSlxlASyWcfIhCMTmnRmUmZiONwO
	Aid/YIMGjxO4M/oiWaSh5qsyByRpa8A+aJmd7V5Ci2Lvo/O9WoQEOZkg3mXHivNq52BvFc6gdqM
	K9FNORiAUsMGyetsiCEZ33SwaMdEpqrHM/Ie5xlv3BZS6PrLvVkTzqYQZN9Um2p9ZzRTc//iJ1I
	g5y6CAolMhu2XHVTP0D/doQ3il5OyF0+vdxPUEFANHU40l+u7ON2iHYHcoZhmpFWN73DTGAlNuZ
	uiDESXID7Nsq7JSmm9yMtMCkp62s5dkxRBgr/Q5vtEA5p7E9dwZE3UDEQoAs5syOAWLKuw1sM6z
	PF40=
X-Google-Smtp-Source: AGHT+IFKAjqnIQf4uZ2/bLNNpSUmrmDQ8aTUEvdvo2H9616EMpaVuN3Gyn6vUKktQ21oYt0kzTWn2g==
X-Received: by 2002:a05:6512:1104:b0:553:abe9:c321 with SMTP id 2adb3069b0e04-55935b35c7fmr1309473e87.44.1752169133735;
        Thu, 10 Jul 2025 10:38:53 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b8185csm431191e87.246.2025.07.10.10.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:38:53 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 1/5] physfs: Add patch for CMake 4+ compatibility
Date: Thu, 10 Jul 2025 20:38:23 +0300
Message-ID: <20250710173827.43239-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 17:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118416

Fix:

| CMake Error at CMakeLists.txt:12 (cmake_minimum_required):
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
 .../recipes-support/physfs/physfs_3.0.2.bb    |  3 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-support/physfs/physfs/0001-allow-build-with-cmake-4.patch

diff --git a/meta-filesystems/recipes-support/physfs/physfs/0001-allow-build-with-cmake-4.patch b/meta-filesystems/recipes-support/physfs/physfs/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..1584921e65
--- /dev/null
+++ b/meta-filesystems/recipes-support/physfs/physfs/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,43 @@
+From 09f8ca5776f5265571d95454b7307bbee56474da Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Thu, 10 Jul 2025 13:19:24 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:12 (cmake_minimum_required):
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
+Upstream-Status: Backport [https://github.com/icculus/physfs/commit/f7d24ce8486d9229207cca1ff98858fe60ffe583]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4a67c27..f0f0183 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -9,7 +9,7 @@
+ #  compile, using preprocessor checks for platform-specific bits instead of
+ #  testing in here.
+ 
+-cmake_minimum_required(VERSION 2.8.4)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(PhysicsFS)
+ set(PHYSFS_VERSION 3.0.2)
+-- 
+2.43.0
+
diff --git a/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb b/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
index 57cfdcdf82..2571d3f6a0 100644
--- a/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
+++ b/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
@@ -8,7 +8,8 @@ inherit cmake
 
 PE = "1"
 
-SRC_URI = "http://icculus.org/${BPN}/downloads/${BP}.tar.bz2"
+SRC_URI = "http://icculus.org/${BPN}/downloads/${BP}.tar.bz2 \
+        file://0001-allow-build-with-cmake-4.patch"
 SRC_URI[md5sum] = "dc751294aaf59d1359bbe34e693d1d87"
 SRC_URI[sha256sum] = "304df76206d633df5360e738b138c94e82ccf086e50ba84f456d3f8432f9f863"
 
-- 
2.43.0


