Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9136C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:48 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.5598.1752004663257301506
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BXQAOItE;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b50f357ecso40790281fa.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004661; x=1752609461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B55YJxedTuAMAmfaCQX9pTd04MRCXfTzS4tnzdpea04=;
        b=BXQAOItEfkq0dKENhFgHeH3FFdGlnajJ95UcC8zy/B3LyaLlFAtOjula0r1xCnRZ4M
         LsRreR+szf+wRzZ1uMY4XAcDsYxfmFofzvl35CEQ0CH23i/0Sd09Au/HnoZBihlXdERx
         8nOBP7DE7JBjoKpR9TJSbk9FFIw3/H9OEcqo2v6o2P10uRjPnlfmCWkIXV75GAOEgAis
         egP4D2Nyxt9CzAK2CNC52+T+W+59kkpa73jRkHq8CizM/BFILF3UzUpaapfGcXBZ9Tlq
         7QLEslPgfRLQtiGz7vVsK1wDsp4VrrgtFZwKbQPuUmL7yMJ3IX1Atm1g/KZLgSPg/O65
         s2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004661; x=1752609461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B55YJxedTuAMAmfaCQX9pTd04MRCXfTzS4tnzdpea04=;
        b=O6O3X/Cw54wSCpjtQ//HHAglHM521pwXN5NIB+UcDhMaDawKhb6ye15V43sly4g6Jt
         MqH4As7KTWL7wcMAg3OFJeBu4qpWm7PumQ1bWryZzCPhkdt8fhIInZOF9o147xPIzjYR
         yA6FVa2IlvR9lIAxap8cTgKiHGQMtxGhsZ0VnCtNPP7TKZ4pUwWMJ74XLNEDit90Wku2
         TGjY8aYSap/5Izg2QBjvsiCQ3KIwRVlKPMluj51bqEkjO3BZU/BZpdtUypNfmeYV0RZA
         pIyoVGAWFQ/1RsZGz/H/Vp1ZD1ARkZYc7qAeU5vf+htMN6Tm/BUJjnYiyVKrcZrQr36S
         /UsQ==
X-Gm-Message-State: AOJu0Yyd+apVbMS62HZvDD+6In8t01wus63IsJUHsPuFEAYxTKbyHkyr
	cgUEL4KX64BlSu+vz4Xe189qGznlmY/XLQ4ofatwNsGUW8C8Dby2CnTQHJ8p8w==
X-Gm-Gg: ASbGncvKQ2vjV8b8FYp9nIzVwf/4pWCngaSdialvHivWHcWrA5gS6xlYg2uRkvUxGJV
	T1jioomSOyQXsfM4Wj5bt6K2WGp5juKfeaL/VQ2Uawl7xRmP9GBwP5AaILiJyv9fue6JaN2nrag
	chIzLu5J2YuYmuAB6TmgO5H+FWM/Ys8BEaasi77rvb+Owesjg/RBplp4KtoXyk5hRmnhYuFKao4
	prbQUHSpWdrZAoWEIyrCf229BUCBH6Te8PAEE4XyU3QvYFMjI/LeIL7vBEMrm6MVH83eGRKghrW
	IhbXDE5oTOd7eRcpRqLE7I7k1rMYW7rCG3TtGsppFonTts4Yg7vX8L1FORxqsd2QtB6RJyMgd+j
	2xRI=
X-Google-Smtp-Source: AGHT+IGLXiLYTIjwVeFyqfdf+bG8VnmEu+fqGw+t6rIWChANg0X4Ks3EYlo+JHST0ZKKThhLhYhfRg==
X-Received: by 2002:a2e:be11:0:b0:32b:3c94:9964 with SMTP id 38308e7fff4ca-32f00cf6d6amr56818771fa.18.1752004660792;
        Tue, 08 Jul 2025 12:57:40 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:40 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 11/20] gflags: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:27 +0300
Message-ID: <20250708195636.1678606-11-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118333

Fix:

| CMake Error at CMakeLists.txt:73 (cmake_minimum_required):
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
 .../0001-allow-build-with-cmake-4.patch       | 69 +++++++++++++++++++
 .../recipes-support/gflags/gflags_2.2.2.bb    |  4 +-
 2 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/gflags/gflags/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-support/gflags/gflags/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-support/gflags/gflags/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..bc3ca94de8
--- /dev/null
+++ b/meta-oe/recipes-support/gflags/gflags/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,69 @@
+From b533cf275db99b1d37ba20d96497cafcedc9ace0 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 18:57:26 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:73 (cmake_minimum_required):
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
+Upstream-Status: Backport [https://github.com/gflags/gflags/commit/70c01a642f08734b7bddc9687884844ca117e080]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt             | 2 +-
+ test/config/CMakeLists.txt | 2 +-
+ test/nc/CMakeLists.txt     | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 657a1f4..a5440bb 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -70,7 +70,7 @@
+ ## - GFLAGS_INSTALL_SHARED_LIBS
+ ## - GFLAGS_INSTALL_STATIC_LIBS
+ 
+-cmake_minimum_required (VERSION 3.0.2 FATAL_ERROR)
++cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
+ 
+ if (POLICY CMP0042)
+   cmake_policy (SET CMP0042 NEW)
+diff --git a/test/config/CMakeLists.txt b/test/config/CMakeLists.txt
+index 6190b25..205121e 100644
+--- a/test/config/CMakeLists.txt
++++ b/test/config/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ ## gflags package configuration tests
+ 
+-cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)
++cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
+ 
+ project (gflags_${TEST_NAME})
+ 
+diff --git a/test/nc/CMakeLists.txt b/test/nc/CMakeLists.txt
+index d00b07d..1b4d511 100644
+--- a/test/nc/CMakeLists.txt
++++ b/test/nc/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ ## gflags negative compilation tests
+ 
+-cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)
++cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
+ 
+ if (NOT TEST_NAME)
+   message (FATAL_ERROR "Missing TEST_NAME CMake flag")
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb b/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
index 8ea158eab3..925aa6d6e6 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "https://github.com/gflags/gflags"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
 
-SRC_URI = "git://github.com/gflags/gflags.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/gflags/gflags.git;branch=master;protocol=https \
+        file://0001-allow-build-with-cmake-4.patch"
 SRCREV = "e171aa2d15ed9eb17054558e0b3a6a413bb01067"
 
-
 inherit cmake
 
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF -DLIB_INSTALL_DIR=${baselib}"
-- 
2.43.0


