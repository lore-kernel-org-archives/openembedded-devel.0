Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74896C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 16:43:23 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1610.1784565037673268806
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 09:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o/nZ1UQi;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca965de53baso3753848a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 09:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784565037; x=1785169837; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l8V3oc6D0XR9+Flc251ZOZVV6ApzxFWuTVqnncjY4XI=;
        b=o/nZ1UQi6HvYfbVf/SfgZyz/FIOJGX1tUgqQmw1DOJice4duDrPqkN42p+mPAzUbC7
         ldH+xY9zhUHF3rE+7TP0i2VRbbUashhgyBdLdaqqGOwAsdxDtiO5+3pqTJhuyKjUO/hm
         xZuoXJujS4km5jyUccl7gyZtX6PJcK30JdinCPf44Wp2wYKuAQryL/ASTYxGP6Huzunf
         OLTZ9qGuRKLPz7a4ZIAH8xDQzyRjGXyPswHZH3ZCth8lCGNfGcRzIGxVe2S+uxW+K60i
         5+IraWh6RHGCkJDpKdulFbVliw51luT4p+/13TKd8GxgLQnlh1KeULgMMQ24BtrBh+Yn
         ZmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784565037; x=1785169837;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l8V3oc6D0XR9+Flc251ZOZVV6ApzxFWuTVqnncjY4XI=;
        b=enFScUSPF8JKo4Tl8TTHb0tn7iQTjWymFcWwC1moG+rx/sBMGECrnbeiDFJo4HSeAf
         G8TTkfij5Vvoutr4id6HXZJh3JMaVHpmv0RP1Feua5ZGpexRjzoh0cKwNrVLKm+sFhpC
         GOSzHnGywrTubPigUn5eu4ofAAmpAiGqLV+Zdk9Y5qTXy42L+iEVWxYbOnzg+SiswxjJ
         ohxNdojxwGIOv/7nF0kSgi58QpbDacTxJHnXQeHuB1D3xH201frZ0arSZPzu0cuuE4hO
         /4HNFifqr0ZyAAaMZgMmtNZxe3k7daNG8FwBJ4Na9cc6yQ3d2mCjf+IgjZ2hG8tema3I
         7snQ==
X-Gm-Message-State: AOJu0YyDqE1jY21PT1gvN/oa4FJT+yfdvjIAhOWbh4sZ6YfakkRILN9M
	0+88mQLidod8cqmB39Jazbfs4CuJElEM/YsQOw/v/Yu7az3s9+NIXLKWnA7+rA==
X-Gm-Gg: AfdE7cmUOG3AuXh0fUDyDWRM7VMaVcJh/5ll6JInHbFSJ6oRViaPg2oFr0Icant8vMK
	KJ+aXAUQfR5wjUfXdfq48N2ycr1myGNr1CERrcKd/wMDFBKJBYYtljxLgzutiZj2I1JhiZyLMFt
	ae5mwfzcpuJ9uDI3QsIne0FGgqpXm9T8tvwwE2VUh/j5NhjevKL07ZgpE3rP2ueHBS9S35Mcauo
	WlEpRg47Kvu+ubWkyyvms99zTSPviQ8zKBr0xzKMAgW5AZXPnZufZ+lG8H00xjn6k7HU73DK3wQ
	I9geez+l+zHFu8EQxCZCHvMSA5K5BoFUieNSWiSCSx8vMxcLowH49GognqjShnYjPyRIc75LY8t
	sWvQ1/PJtQyjGXWzfEMxCDOsa7Djquau2zra9aKzHtkejS+rh0DZoKvfHttUEgr4F7OhBky6lSX
	LLlwjhHqVTf1eUXApti6u/47k=
X-Received: by 2002:a05:6a21:a60e:b0:3c3:bd7f:ed3d with SMTP id adf61e73a8af0-3c3bd7feeffmr9082327637.31.1784565036747;
        Mon, 20 Jul 2026 09:30:36 -0700 (PDT)
Received: from thuannt-Z87M-D3H.. ([42.113.218.129])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bcccsm43364429eec.4.2026.07.20.09.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:30:36 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Thu=E1=BA=ADn=20Nguy=E1=BB=85n-Th=C3=A1i?= <nguyenthaithuanalg@gmail.com>
Subject: [PATCH v2 1/2] libsimplelog: add binary log feature and cache hit/miss support
Date: Mon, 20 Jul 2026 23:30:29 +0700
Message-ID: <20260720163030.7247-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128282

Introduce a new binary log feature based on UTF-8 encoding patterns
to optimize logging capabilities.

Add cache hit and miss tracking mechanism to monitor performance
effectiveness.

Signed-off-by: Thuận Nguyễn-Thái <nguyenthaithuanalg@gmail.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 40 -------------------
 .../libsimplelog/libsimplelog_1.0.8.bb        | 18 ---------
 .../libsimplelog/libsimplelog_1.1.0.bb        | 29 ++++++++++++++
 3 files changed, 29 insertions(+), 58 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with-cmake-4.patch
 delete mode 100644 meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
 create mode 100644 meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb

diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with-cmake-4.patch
deleted file mode 100644
index 17adf92bb0..0000000000
--- a/meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 77be1b3e7d6ff4261114424278413a679672bb92 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Wed, 9 Jul 2025 12:10:37 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error in CMakeLists.txt:
-|   No cmake_minimum_required command is present.  A line of code such as
-|
-|     cmake_minimum_required(VERSION 4.0)
-|
-|   should be added at the top of the file.  The version specified may be lower
-|   if you wish to support older CMake versions for this project.  For more
-|   information run "cmake --help-policy CMP0000".
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Submitted [https://github.com/thuanalg/simplelog-topic/pull/1]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index dca80f1..0fc6db0 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,3 +1,5 @@
-+cmake_minimum_required(VERSION 3.5)
-+
- # Add main.cpp file of the project root directory as a source file
- project(simplelog_topic_project)
- set(SOURCE_LIB_FILES src/simplelog.c )
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
deleted file mode 100644
index 41b9d47686..0000000000
--- a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-
-SUMMARY = "simplelog-topc - Simple, STABLE, powerful of logging library in ANSI C/C++. Ready for billion records."
-DESCRIPTION = "Async and Fast C/C++ multi-thread logger with topics. No external dependencies."
-HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
-
-SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v${PV} \
-        file://0001-allow-build-with-cmake-4.patch"
-
-SRCREV = "093d80b4006042b75a433a5e63760ae9bebad142"
-
-inherit cmake
-
-# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
-EXTRA_OECMAKE += "-DUNIX_LINUX=1"
-
-
diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
new file mode 100644
index 0000000000..7a385d537b
--- /dev/null
+++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
@@ -0,0 +1,29 @@
+
+SUMMARY = "simplelog-topc - Simple, STABLE, powerful of logging library in ANSI C/C++. Ready for billion records."
+DESCRIPTION = "Async and Fast C/C++ multi-thread logger with topics. No external dependencies."
+HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
+LICENSE = "MIT"
+#The checksum of "LIC_FILES_CHKSUM" changed b/c I did change from "2024" to "2024-2026"
+#libsimplelog  is allways full "MIT license".
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=594fdc3cb85f0b684cf5d7b332a741be"
+
+SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v${PV}"
+
+SRCREV = "151e83902ca9755bcd285791d2f49de6fc30bfe6"
+
+inherit cmake
+
+EXTRA_OECMAKE += "-DUNIX_LINUX=1 -D__LINUX__=1 -D_GNU_SOURCE=1"
+
+# From v.1.0.8 -> v1.1.0
+# Note for -D__LINUX__=1 -D_GNU_SOURCE=1
+# If don't use these flags, v.1.1.0 works like v1.0.8, and well adapt with musl (strictly POSIX)
+# If use 2 flags, they helps the source is more effective. Please test for 2 cases, you will see.
+# Please check "p->r = sched_getcpu();" in "simplelog.c"
+# You can use as below without any problem
+# EXTRA_OECMAKE += "-DUNIX_LINUX=1"
+
+# Drop 0001-allow-build-with-cmake-4.patch as it is now integrated upstream. 
+# Please see branch "main", commit "4827c4325063266f6d2a7e133a9d3a9050ff6a3c" by 
+# Author: Alper Ak <alperyasinak1@gmail.com>
+
-- 
2.43.0


