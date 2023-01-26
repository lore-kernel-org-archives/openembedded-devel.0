Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8F3C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 21:05:35 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.86464.1674767133906134221
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 13:05:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yvxv1wj6;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id a18so3031082plm.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 13:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vEOwmfLcOA77aVTmRvXeA1Mo8/3NAaKY+u/CtCyHPQ=;
        b=Yvxv1wj6wiwkumQS7Ant2DFHLkmJAMfuR5aHKwj2Di2/MaA380N5npaRpycGTbC4v/
         lsah9TvaxsxCUr5Dg3ikcfiVmZY5Nf9BJ64IrBe0NYnsG/e0bqIVdxim48HgGmAOv5vr
         tRd/bvY0X1T84At4QAatYzi6gNjWqzaKgItEVPIVjxzY+mNPc0FxWeQ2UtwbZQbSyVXV
         UpXcr9DF3B9NSnDvuCp4hvau1TPJpJXQ55LwtVzCM6YAshvo/UFnnSQrJKfX1eHlXolo
         w+/DTFJKU4rgcD4JXQV+0U0TmyzV74zq4kLkj/2vTBi8uMLMJQldjItoYobcBz4Q3fZD
         PMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vEOwmfLcOA77aVTmRvXeA1Mo8/3NAaKY+u/CtCyHPQ=;
        b=dmXulpWJoeszw6dJ9zhJz+MUg6TIz3VNxnWk2/FECsNRc1NDe7LwPL5HG9kHgZO9lG
         x6s681kRece3+y5ye+HxQSkNz8P7YCbayu/XHduyk0TXDzYBix9eG2MX+o72XOb2CbFZ
         /DScCxvf6u/pdaMgAwyKVyIdoJyupqES+yjGCapkPMpBvYFlEpDHNfw3IW4pgMoFTPIM
         CmTdfE9syOfk4ko1QSxUd1KBd6eaLuWfO23Bkm45mXApYuoXFg2X8cSC87t6CvpBE9hY
         QgXrrXQQYWYCvHjfdCdE05tqz8+T66KGrKzqQLlyF6CE04YpJJsT+HwMPDbCXb1uWj5X
         IluQ==
X-Gm-Message-State: AO0yUKUs84I60QfxDgX7pRzj6OYlWkifc9tbsGIqw2khTUQQ9H6iU8oE
	wQX6Xb96ZULUHrapFU4Zv2L0GOvSczSivA==
X-Google-Smtp-Source: AK7set+aZIfPn/Z2bZOBGgxQY6MbCrafEEDaHMninGlVcAMdH14qtM0XPjVeQYBX4PK+pEuRY1XcEQ==
X-Received: by 2002:a17:90a:317:b0:22a:33f:fb3d with SMTP id 23-20020a17090a031700b0022a033ffb3dmr3738310pje.48.1674767133024;
        Thu, 26 Jan 2023 13:05:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id j8-20020a17090a94c800b0022bee398e09sm1503847pjw.4.2023.01.26.13.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 13:05:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] rocksdb: Fix build with clang compiler
Date: Thu, 26 Jan 2023 13:05:27 -0800
Message-Id: <20230126210527.2815542-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126210527.2815542-1-raj.khem@gmail.com>
References: <20230126210527.2815542-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 21:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100803

Need to drop using -msse4.2 -mpclmul

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Do-not-add-msse4.2-mpclmul-on-clang.patch | 33 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_7.9.2.bb  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch
new file mode 100644
index 0000000000..e521854439
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch
@@ -0,0 +1,33 @@
+From cedc84a8db468d0b6652e78a8a6667e655586b53 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Jan 2023 13:00:43 -0800
+Subject: [PATCH] cmake: Do not add -msse4.2 -mpclmul on clang
+
+When testcase is compiled with clang and -msse4.2 -mpclmul is added to
+cxxflags then clang -m32 still ends up compiling the test case which is
+not correct for i386, therefore depend on yocto to pass the right flags
+from environemnt via cflags rather than manufecture them here
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index dbef059028..981545a4e0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -290,7 +290,7 @@ endif()
+ 
+ include(CheckCXXSourceCompiles)
+ set(OLD_CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS})
+-if(NOT MSVC)
++if(NOT MSVC AND NOT CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
+   set(CMAKE_REQUIRED_FLAGS "-msse4.2 -mpclmul")
+ endif()
+ 
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_7.9.2.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_7.9.2.bb
index 29f234d6ec..8faaee40f6 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_7.9.2.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_7.9.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=htt
            file://0001-cmake-Add-check-for-atomic-support.patch \
            file://0001-cmake-Use-exported-target-for-bz2.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
+           file://0001-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch \
            file://ppc64.patch \
            file://mips.patch \
            file://arm.patch \
-- 
2.39.1


