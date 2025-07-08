Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA41C83F0F
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:48 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.5599.1752004664718088888
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LWne7Rag;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b2f5d91c8so41925121fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004662; x=1752609462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfjotVG5/jzifJmi5Mrry4XXpdF2FeuOE/fgcz2IYh4=;
        b=LWne7Ragdk6peGruM8L0GjcrXQoy7uQxL6mFBWYlUw4nhxMhYQrGbB2IqwQD8V0kTn
         JKytce09+GpKNQp8sr3SGU9bKwpcUz70gTSYVT6ry5V66VcsuAEpMl5C3ogbcgoqraDy
         KYd7gXqcVHJz7+kOrWLw5Kq5+Vtkd16poAUipgfDGQPkvvpRiPpnNmhW8RsgtsJ8oRCs
         jeTDzqeM3LFD2onKTnnE0qyVsQQ/i+Ws3xMgn8yaE9z95QEnmcxU7lJGA20dcRUT2Ytd
         1J8Xsiox4t3zUjExsjdZuJPAOWPQg/vXjp8/sa4d9bpvVWplr/r7ihOhp74UjsJi9RDK
         tixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004662; x=1752609462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfjotVG5/jzifJmi5Mrry4XXpdF2FeuOE/fgcz2IYh4=;
        b=VCuU9+3ikdq/g7Lt/lFYS8PeWmFBnWraNBWWeMMiR8gxqpS5jjsoAtuJMCZ1SwioXO
         9214M5/hfXHADeoGcfAeRVDpkiT660dYL10CcJLZAVQjVFJxA/gmXjk1DNVVPd7BTA+X
         SWtZVs0LaPVs0krWl3hhF03JjVI+Ci3/cjNwlZcJR8WlIpBfiGHXojdoK26ZF9A7LNLg
         Os+PQ1TL9VrGUMG8HD1LKH/a9WZQL+sxV/wDuIvzOvJKnMl9M/vy439M1kfCCPJjeRIv
         BD1juopflDsx2AuWLq8oz9DxybKMbKiJcX0LRjusxVVs26q9OZTlr02EnPM2A7DZkYGU
         NDjw==
X-Gm-Message-State: AOJu0Yz9uzmWl4yFjtu2E600CDpWIOtEQ0AQoEeyyD5kz9C0NiU7o/cj
	JV32IpCrxXJe97OTtZVOY5Q3gaJJlsosNJNgczy10Jq1+QIidHFiM+dVZCUBDw==
X-Gm-Gg: ASbGnctaIJUvmpjIttfCQ19kLBvVF0lv1oYkphemYgFFHwMxKULy7MUImn7skYj5vn5
	KdhI729bxG6Cpjli//HjWYfDlBwrWlaNAFymLfpljSLZLPJzVvZ7yqDcGmJ1eiEFB+NKEV/gHfp
	Gm99Lz7n+vyGwENe8BDOe/uLdInJm+FiZ9CC/T0nKW8Hj7T1XGFKwfVDR7FdW7DemTCQo/DYTxL
	FRE/m/Y3t5l0sXWxU1ZdjlreX3SlARIqiRDzg/vSTNh8BteU9JGG9IzouMlYHfO0baYOMMrJbvW
	4oIs15TFyrQjLk9WyeSBjPi1EUmMT8X7f2vzNNlMjLDTfpK50n9FGvtNF9e9A2TYYyG6OoQe298
	Wk7E=
X-Google-Smtp-Source: AGHT+IGl4pjsuOeKd4k0r4CcuwiPZqy69gLra6HF7Lhh6b8gO8P5JbtNkK5lOlhmLg3pI0a1Pvajtg==
X-Received: by 2002:a05:651c:b22:b0:32b:7413:503 with SMTP id 38308e7fff4ca-32f00ca77ddmr61927431fa.16.1752004662219;
        Tue, 08 Jul 2025 12:57:42 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:41 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 12/20] libfann: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:28 +0300
Message-ID: <20250708195636.1678606-12-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118334

Fix:

| CMake Error at CMakeLists.txt:41 (cmake_minimum_required):
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

| CMake Error at lib/googletest/CMakeLists.txt:48 (cmake_minimum_required):
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
 .../recipes-support/libfann/libfann_git.bb    |  3 +-
 2 files changed, 70 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/libfann/libfann/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-support/libfann/libfann/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-support/libfann/libfann/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..db1600f96c
--- /dev/null
+++ b/meta-oe/recipes-support/libfann/libfann/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,69 @@
+From a21c8455e2cfc5b19df1e42cd875c471d4e5cf63 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 19:40:46 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:41 (cmake_minimum_required):
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
+| CMake Error at lib/googletest/CMakeLists.txt:48 (cmake_minimum_required):
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
+Upstream-Status: Submitted [https://github.com/libfann/fann/pull/152]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt                | 2 +-
+ lib/googletest/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1b11d76..7e80be2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -38,7 +38,7 @@ IF(BIICODE)
+ 	  ENDIF()
+ 	ENDIF()
+ ELSE()
+-cmake_minimum_required (VERSION 2.8)
++cmake_minimum_required (VERSION 3.5)
+ 
+ if (NOT DEFINED CMAKE_BUILD_TYPE)
+     set (CMAKE_BUILD_TYPE Release CACHE STRING "Build type")
+diff --git a/lib/googletest/CMakeLists.txt b/lib/googletest/CMakeLists.txt
+index 961672a..3762d18 100644
+--- a/lib/googletest/CMakeLists.txt
++++ b/lib/googletest/CMakeLists.txt
+@@ -45,7 +45,7 @@ endif()
+ # ${gtest_BINARY_DIR}.
+ # Language "C" is required for find_package(Threads).
+ project(gtest CXX C)
+-cmake_minimum_required(VERSION 2.6.2)
++cmake_minimum_required(VERSION 3.5)
+ 
+ if (COMMAND set_up_hermetic_build)
+   set_up_hermetic_build()
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/libfann/libfann_git.bb b/meta-oe/recipes-support/libfann/libfann_git.bb
index 2f68ea95a8..00b2af3829 100644
--- a/meta-oe/recipes-support/libfann/libfann_git.bb
+++ b/meta-oe/recipes-support/libfann/libfann_git.bb
@@ -10,9 +10,8 @@ inherit cmake
 
 SRCREV ?= "7ec1fc7e5bd734f1d3c89b095e630e83c86b9be1"
 SRC_URI = "git://github.com/libfann/fann.git;branch=master;protocol=https \
-          "
+        file://0001-allow-build-with-cmake-4.patch"
 
 PV = "2.2.0+git"
 
-
 EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
-- 
2.43.0


