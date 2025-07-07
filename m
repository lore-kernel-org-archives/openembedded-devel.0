Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AC8C71130
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 22:54:29 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.5691.1751928861492690444
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 15:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kV0IKcnq;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553dceb342aso3289258e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 15:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751928859; x=1752533659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nUe/3aVKM44uSzvcsbAxYuayfTCIQX81GyVf/lYp34=;
        b=kV0IKcnq0Bxj7bpMLUlQDalpzJRLkpNtnKxD73jvbdMidvtKPOEWHN40I423XyoT9l
         5SpBOAs5wjvkX2aH7xBTJg/hD42+TwuYcVr5n97cEQxCVtZmfNZY84SVWYiDOQ6PVnHA
         wnDK7//BKknHFlw9mLyyTBJxd+i5XxHfcYwRoHngPtXbbVKZRJ/LC32YHRG3JSVpVimo
         +GQxo6URxis3l751uzvDXrKzx6u+Y690NUAoH3ENIgWErOvKZgmaI4JiGAagpfrPYAED
         Ag9BSqPka4x3TnEfWt7+9uAmc3QcgZlRL5Fo00OTcvziSJqnO+kZalIQYGFSOPyElS5a
         o6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751928859; x=1752533659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nUe/3aVKM44uSzvcsbAxYuayfTCIQX81GyVf/lYp34=;
        b=hF81Necull3CjvqLbRsWwSE2zGcO7z5xzWr0RVQI+H6vFJ5RUEeIRe60m0puOkuv5n
         B2prke+JXHgM3ysFyeEhPrnovFW4mozy1n1qmJzhrFFr2ec2lAzvSFaoagJhCc3rz0PY
         uteaEDHO9/RKAYCYxK05kBWn5EJPoYkm+7zzsN4+S6rulhSgYofQouz9+BgZ9oFjeVdR
         jffsejrUCLnY7Ce2EHbVqpuWfBqYPH236pLsPQhNMbCvvr0mr20d5GxESNsv1bEQ0DHT
         bmLJsKYPeN+YrJeTESQhPhbvAVXYHGZhjkqQE9ZN1QI7RfvUd7Z67Gm6WgxUsg4Sw1i+
         tM9w==
X-Gm-Message-State: AOJu0YxNmxf48DyZUMpb9UMqm68CUsUhbCsWJaRLUVpws3D3CwViU2R9
	GR+jh9RlovjShP24EMzPiI2e6pKusOWdRagOlqXFp94e504nbumrQOLeadaQjA==
X-Gm-Gg: ASbGncvmewBxg80YZ5VW7afjQ2bONhWTOUehIRTSn1MdvVv0LRxQ6kjDOFlNqkI30HD
	OrL1qF3hUhZZ2LUCsIsmwIOuTMVvoYZym3iUFzYbfe4m95WMHoxhMQFrwIlOqohMKJCh/xLrHqI
	/q4ATUG96AJC7kobKy6fAdDw7su/cgjCEnCmRCBhu7Ib720djm5D8neRsIS8rI8+PsdSsXhSbCm
	viwoyCn7KqjnGrDWMU8sevtWwH7BsRIhrEClIqmTCVpjQpwUC4s/SPbBxBnBM+iLOpnzxoxwAt3
	iAs0tuEOfT1ECdEPXODk3KyKCEORlB4442twQGYzhRIAvnHQfCddbzh7JdwLwWnSKsc5BfYF88F
	/Aus=
X-Google-Smtp-Source: AGHT+IE4GNlSt7aymxrMumg82sBeT4r8dAniYy4Z/P2S3pi7SNWtPeoaqaHqQ+KBVeXoapBnHRScnA==
X-Received: by 2002:a05:6512:31c5:b0:54f:bce6:63bd with SMTP id 2adb3069b0e04-556f2759a02mr4478577e87.54.1751928859030;
        Mon, 07 Jul 2025 15:54:19 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b836dsm1476347e87.197.2025.07.07.15.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:54:17 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 3/9] mbpoll: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 01:54:01 +0300
Message-ID: <20250707225407.1558421-3-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707225407.1558421-1-alperyasinak1@gmail.com>
References: <20250707225407.1558421-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 22:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118291

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
 .../recipes-devtools/mbpoll/mbpoll_1.5.2.bb   |  4 +-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/mbpoll/mbpoll/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-devtools/mbpoll/mbpoll/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-devtools/mbpoll/mbpoll/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..25f4692856
--- /dev/null
+++ b/meta-oe/recipes-devtools/mbpoll/mbpoll/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,42 @@
+From 765fbaea85b723893c0c27d5527df479ab6abc46 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Mon, 7 Jul 2025 20:09:45 +0300
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
+Upstream-Status: Submitted [https://github.com/epsilonrt/mbpoll/pull/95]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6daa039..af32354 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ # -*- CMakeLists.txt generated by CodeLite IDE. Do not edit by hand -*-
+ 
+-cmake_minimum_required(VERSION 2.9)
++cmake_minimum_required(VERSION 3.5)
+ 
+ # Workspace name
+ project(mbpoll)
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb b/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
index 4590b49955..82afe632fd 100644
--- a/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
+++ b/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
@@ -8,8 +8,8 @@ HOMEPAGE = "https://github.com/epsilonrt/mbpoll"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 DEPENDS = "libmodbus (>=3.1.4)"
 
-SRC_URI = "git://github.com/epsilonrt/mbpoll;protocol=https;branch=master"
+SRC_URI = "git://github.com/epsilonrt/mbpoll;protocol=https;branch=master \
+        file://0001-allow-build-with-cmake-4.patch"
 SRCREV = "a0bd6c08d3d15b086f2104477295c0705aed366a"
 
-
 inherit pkgconfig cmake
-- 
2.43.0


