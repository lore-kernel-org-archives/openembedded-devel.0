Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD47C83F18
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:38 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.5748.1752004653082783351
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hVKgRAMp;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b43c5c04fso2600341fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004651; x=1752609451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcIdOAJRTWqSr8t4XkPghij38qkEgwdenSVyFyRoAVY=;
        b=hVKgRAMpSjdQHruUC87wIiIA2Jqt7DBJFnvJgb2kYt4MbDM6Wcp5+Mjv0+lGISMVLV
         n8SbqpokYjEPaPjPkGdBS8xz3fE5gS/oNt1i/xAOFr211/RRKah87fFMswUFg2JKv8sA
         0fjmT5QFj8bCh/xhNJKc5F0BIFF0N7oLnjZuKN4OQ9XO66dl1JEjJXBxSckNoQRF6xqK
         p0qhG4p1d9jh/drtk7ZXUbonqgXf4IA578I4S2BaSo5jD6f86ZBFhcciIWBcd1jKbvb1
         6aPNQ07acZXcPGT6NxIVhULKmIJrXyczuXZtTvO1nR7gQlFFRtoEgDJHq+ZehMzF9sR0
         SC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004651; x=1752609451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcIdOAJRTWqSr8t4XkPghij38qkEgwdenSVyFyRoAVY=;
        b=Z6w1wHHVfOw7Sv7Pc3NVcK/aMQm0ijwbo6S+PYxztU7gPi6YArqek6sfFjpLU9td+K
         /JmED13x9KdhvcyzzXUI/LaV5Hd8gvOCbZsliBtJ5BMmz43CUz/rkSeDPko2kosibHEv
         6mdVzMtZIboSmUqw48VX/QNiqi5nu19NSM+dBDXarG//Fo/nlSSIdY8PED5yFLEyzkLp
         PUSfBil8q6noIVWUy9naRRG+m0CC8LMMjR9tx0iQB2Jx1wSnK9zOjqZG2aQCFk6iSHVE
         AAoRQGlVYgIiakbRGF57ADgVlKX9WA0sQVvPHeaJqeBEF18F+IBAC0AGKScsLjaFO1WD
         IuKg==
X-Gm-Message-State: AOJu0Yy6US2y6D49T3O7zbSGGqsZ5sPGdQnc+nu/DVY3pdzZ46HPMNk0
	bUCEHN3vCuJzL5VkVauogYfCfjHFOVY98Zxok9WwQqXWTt22DHJyK9xYwsBqhA==
X-Gm-Gg: ASbGncsPX1WdpuXa+KJhoWyhUB9085W5kMN97JUWpf9oGOPVQypKDwuLnC2Og6PTuJ2
	T1MbGiGUfSgDxQY291kGYXqb6KLNvoGsV3myBcfbIfJf07XxVtPoytwmNxaou0rMKcQVvyGWqUO
	DqP03kEZBYzQpXQ9OYTDvaxUJX8Hg9tbJNahgp8KVuBwV15nGdMD44RMhmCBlCr3FrDX7UxBjDh
	6vQX+s1J2ljrcDRYd7wWeYVg914A8G/DCcaAJ7a8H8rViu/EZDgmdRJBRxNHl3DmsD9HFE/Vb5j
	8USsyXDAtCnK0lAp53zoKCfPPC3Azo08SL+5N6PI7WEQ1Z+tvHs9mzP32hvBLhR1woF94GVV9Ks
	R6eM=
X-Google-Smtp-Source: AGHT+IH3NENcIrGmHNeQSsTLnFf9Zq9MbsyGOWY/cEXp+eAdc8U/vS3+gTeHjlgH2Hm7LjWa7Kvljw==
X-Received: by 2002:a2e:a58d:0:b0:32b:7974:5c9b with SMTP id 38308e7fff4ca-32f39aa564fmr17924311fa.4.1752004650416;
        Tue, 08 Jul 2025 12:57:30 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:29 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 03/20] cjson: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:19 +0300
Message-ID: <20250708195636.1678606-3-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118325

Fix:

| CMake Error at CMakeLists.txt:2 (cmake_minimum_required):
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
 .../cjson/0001-allow-build-with-cmake-4.patch | 41 +++++++++++++++++++
 .../recipes-devtools/cjson/cjson_1.7.18.bb    |  2 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-devtools/cjson/cjson/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-devtools/cjson/cjson/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..7bd608ca0a
--- /dev/null
+++ b/meta-oe/recipes-devtools/cjson/cjson/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,41 @@
+From 8622490d650ba4d107561a0e8f3cf881fa0247c7 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 15:09:11 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:2 (cmake_minimum_required):
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
+Upstream-Status: Submitted [https://github.com/DaveGamble/cJSON/pull/935]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 36a6cb5..9428da5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ set(CMAKE_LEGACY_CYGWIN_WIN32 0)
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(cJSON
+     VERSION 1.7.18
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
index 33c8c28531..7ece0065ba 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
 SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
            file://run-ptest \
+           file://0001-allow-build-with-cmake-4.patch \
          "
 SRCREV = "acc76239bee01d8e9c858ae2cab296704e52d916"
 
-
 inherit cmake pkgconfig ptest
 
 RDEPENDS:${PN}-ptest += "cmake"
-- 
2.43.0


