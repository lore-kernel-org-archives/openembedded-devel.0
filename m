Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54527CAC5BD
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 21:09:41 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.20996.1759007376863171742
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 14:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ccbmbMq+;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-636255b92c9so900064a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 14:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759007375; x=1759612175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YpcFl0hACrXBqqynRUn3Rmvixwlh59lsVl/It59FRzs=;
        b=ccbmbMq+RWIxf0qAObq5gD9MsVUK6T8Ffs/KcQ1A+0imhiKbJRQCc6zY9P61VRwPyj
         IqwivGhRS/N8C0N72jcgvIIJy6ryfdi0aJFBDL+NGuXvAHFTMWVyFioQFrVSCBZz74Gg
         StuRLRHq6GRwdORnMVi+EtWNdni80sdCUIorxpWqJSXrDkXoub47Wa4P0WOLJPIJMJkK
         X5BGy3D+m727YDzxL8Z54zMKZpdRYGjEz0pYpYqTjJKLW2FgQqQ5F4mwlvIA4kQhissV
         DbiNyIrecs4UF19PfwNlhUFc8B4Sn1jnKYdUc53UoUOijapLDbVUyrPHlYlGkCRTAhEV
         xi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759007375; x=1759612175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpcFl0hACrXBqqynRUn3Rmvixwlh59lsVl/It59FRzs=;
        b=rlVQglXmvZbhvKHbuae4jlTnmuH/0L+P7fe7YpsbSGl/L3V9hAxpTvlzrNhfoYXHrE
         4Gr03Fw8fKoxjLTdd26kW1rc0ID1/Erbs2yM9un0//wKcAbh18Ql/gxr/8nshVbQ1R49
         fqaZiGTTZkuoeiUaGZVKIurl5uLphSEbJZ4ue6urcRObMlRCG/CZSWTH+0IhtIqiI14X
         E9qIDPgcIhQRuXQhx5/pN3P3r78yrNzN8PjptemNYYkMwgk2y35Qni88NUxHgoCVTZMH
         Qd02O4w5zoByL5uWa1SN0DMr2ZCqbBYunckmSxP57i4cB1CM6nJXPjqjG2qNalXFtQbB
         MihA==
X-Gm-Message-State: AOJu0YwaTShu7EdhDiYDYD0h7+5Tx7VcN2MhdVqjFGdMPdCABpeLMynf
	NdABCNouugJDe8rkHRAcTmahCNo/PUhWLAWuTorEJsDT0koZZyuhhSN4gW0VPQ==
X-Gm-Gg: ASbGncsfI5D2kdrHI04FfS1XvOJokf1PxFhKGNiGLwGCKb51kj2c0Qbv5tGklIK7tKG
	uJCIBO6suP1+wqhpq4vlLWpzgYGA4XPF++DJJx9q0eHizAqFK6wAaXGTKLXMyQZEToPBjs5I8Uf
	BQGAb9zznXn3JAG3yWHh/D8uz9yi2OYRrWECRzJsQI2wodB8prTmK6qPX8WHDq/j7iQIxRs9PFZ
	2PF+qxrFVCc1zDfZCUE///JxQMS0lIBxEBWUyKMuFlMnL5vhgEJBVP+ur2ieTEqXse+dmt816ol
	FxrnZBosdcNr4uZ9T+I9yjIFz79S1jSeA5q8L/JV/5xPPhv9iZz9w52v1V1mzyGjKKLkDBblkxl
	Kp77zxLDt5J9O1TbH7JVx9MP57J+PwF0=
X-Google-Smtp-Source: AGHT+IFP9lKOE4w47GE8/n3P4tmeKV0ChCQzXdb5GtHkOylb7/ZDa9huGYFK4cc5B+8UpaYueaDRlQ==
X-Received: by 2002:a05:6402:1659:b0:62f:1e7a:f842 with SMTP id 4fb4d7f45d1cf-6349fa91f2bmr9007013a12.27.1759007374888;
        Sat, 27 Sep 2025 14:09:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634bffdf857sm2803796a12.16.2025.09.27.14.09.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 14:09:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] redis-plus-plus: upgrade 1.3.14 -> 1.3.15
Date: Sat, 27 Sep 2025 23:09:33 +0200
Message-ID: <20250927210933.3868073-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 21:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119995

Drop 0001-update-cmake_minimum_required-to-3.5.patch, because it is
included in this release.

Add back 0001-CMakeLists.txt-fix-substitution-for-static-libs.patch
to SRC_URI, because it was removed accidentally during a previous
update.

Changelog:
- Support cmake FetchContent feature
- Support more hash commands
- Make variant parser more efficient
- Fix event loop crash: avoid closing handle opened by hiredis

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...update-cmake_minimum_required-to-3.5.patch | 34 -------------------
 ...us_1.3.14.bb => redis-plus-plus_1.3.15.bb} |  4 +--
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/redis-plus-plus/files/0001-update-cmake_minimum_required-to-3.5.patch
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.3.14.bb => redis-plus-plus_1.3.15.bb} (87%)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/files/0001-update-cmake_minimum_required-to-3.5.patch b/meta-oe/recipes-extended/redis-plus-plus/files/0001-update-cmake_minimum_required-to-3.5.patch
deleted file mode 100644
index 02093573ce..0000000000
--- a/meta-oe/recipes-extended/redis-plus-plus/files/0001-update-cmake_minimum_required-to-3.5.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e30d4c4c557568b01d5adce9df2714de8d3921c2 Mon Sep 17 00:00:00 2001
-From: sewenew <sewe.code@gmail.com>
-Date: Tue, 15 Apr 2025 22:57:08 +0800
-Subject: [PATCH] update cmake_minimum_required to 3.5
-
-Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
-Upstream-Status: Backport [e30d4c4c557568b01d5adce9df2714de8d3921c2]
----
- CMakeLists.txt      | 2 +-
- test/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e0a8cf4..9c742f9 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.1)
-+cmake_minimum_required(VERSION 3.5)
- 
- function(GET_VERSION VERSION_PART VERSION_NUM)
-     set(VERSION_REGEX "^const int VERSION_${VERSION_PART} = (.+);$")
-diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
-index 3423956..88aa079 100644
---- a/test/CMakeLists.txt
-+++ b/test/CMakeLists.txt
-@@ -1,6 +1,6 @@
- project(test_redis++)
- 
--cmake_minimum_required(VERSION 3.1)
-+cmake_minimum_required(VERSION 3.5)
- 
- set(REDIS_PLUS_PLUS_TEST_SOURCES src/sw/redis++/test_main.cpp)
- 
diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.14.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.15.bb
similarity index 87%
rename from meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.14.bb
rename to meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.15.bb
index 19e68edea8..1f4b05cbac 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.14.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.15.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 DEPENDS += "hiredis"
 
 SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https;tag=${PV} \
-           file://0001-update-cmake_minimum_required-to-3.5.patch"
-SRCREV = "b13fcead60bdc03f9771da25715bb134be89aa2f"
+           file://0001-CMakeLists.txt-fix-substitution-for-static-libs.patch"
+SRCREV = "a63ac43bf192772910b52e27cd2b42a6098a0071"
 
 
 inherit cmake

