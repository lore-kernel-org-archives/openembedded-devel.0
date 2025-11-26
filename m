Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA972D111A2
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 20:49:31 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3906.1764190169637264175
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 12:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=buh0p/VK;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29555415c5fso2268335ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 12:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764190169; x=1764794969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cml8DUxHc6I9bIka1LpNJ/5MvEMsOsQg9NF3HLlLiF0=;
        b=buh0p/VKWnuL0AApv3ZrrD3mFBDni8D39cU3xqzvnTha0kLGE0ZTaYGoUwIqY7AbV7
         mjXIx9R3j4ixU9K371eBTJ6kBUm5fr/AvA2cktv7J+3dxdUEIWrzuE8UcqFE6bRT/zO+
         oob6hP86qc3Z73+wCmDrr4oPDLx5ldGFizaKEPFNz+DEymZpgQ40v0HU7LrA8K2lQmdY
         lNmE/Tuls48LrONJKs/jYxxxB6nKIEOhkm4+ztX1gbiDxMAPldhGBRVAluiYdonXptZc
         p4Zy1P3wQpCJHs2AOUX8o4GKTrH0LwJjm11QqJ6mx4hwMuAsRaZ3WVXysSIHDFuGD638
         6Q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764190169; x=1764794969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cml8DUxHc6I9bIka1LpNJ/5MvEMsOsQg9NF3HLlLiF0=;
        b=KgLdyFHpUoUr4P3dXqH0FQd2KUHduuVb/PloXaVqQwfxAPPSiaZERpQT+xDkJrqX/u
         rf2WtGyweQkZXSbv01CccXj+rPa39OH8R+ojqANPDSh+tQ+tLbWJuxNwbMiw6nVPqFLH
         pXtImJNMd0OtO7tWlcvP2dMRxYnaZDrix5yTcSnL/o7dCDd6QoOYOOOlxvmq7vDy7mjB
         oRA3TJnxkjJfS64QOm/yIEHEjYSy1Wynw4pH7cdM99Usee5OVgVcMaEkwLbmptcB35Pe
         XPPfT4BSwgB3ayDX1HmQNlTn1biQqxrAI8e8L3OnRswEPPoe7DWZMkz9zrP3iR48exy7
         yGEw==
X-Gm-Message-State: AOJu0YxhPA2E3BkiqmQaobMAL0mr062ezypf1eET9VufXhl+d8IlfEsI
	FAX176D2jdWO2DXJdnTLwdKlpcpgi4jj5e+mf8E4ei5mMTldkrMPZwxEPVBBnA==
X-Gm-Gg: ASbGncsdOO99qtoMkUGqwjQGJmLEeujF5l2AfYf/lgztilN/xYAENC/wH1wW0kD2bv9
	IQqic8R/LnS4LetusVdnEVq7Qgtc2umXuHaR4TRkYTCe5MIypsHlZ47uMW3dBHAd4KzA+s2DBqM
	E/WGrEDHuHEtUawSejmuSi0xIJvZETgff++vpDkvmo20a+GFnylr4Az8+wArmJe6ZemWXS4BMTK
	UxAqwwWRQt7X3ocr+8SUiN+jqs/jXZOguEL6hpvrMqS1XC4yl9IUKtJvfGeifsQtqAFpljTKjqT
	J8wtlhz+KPqmGp0VYfWxI8YUX0oFoEphjeIF3H4zL22yhb9Ho7ZT9Q67HogFT0VfIKNzhy6crAH
	wUJRHk3Fa/+4kButCZClaFSYcSlPlSuYwyIwViNrP6a62eJlqYXatep9AYPx6L+AdPj41QgQ3Rh
	/mrJIFE7VHxbwWiVgBIPZIXNQ=
X-Google-Smtp-Source: AGHT+IGNnneInvAEn6Fr2FEb1JYyI7YsyGYUpU9sxuH098uRvfjPcp6H+gB/gwaZrX8y5dso09FUoA==
X-Received: by 2002:a17:902:eb8b:b0:26b:da03:60db with SMTP id d9443c01a7336-29b6c40263cmr222393365ad.13.1764190168817;
        Wed, 26 Nov 2025 12:49:28 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111016sm202443635ad.6.2025.11.26.12.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 12:49:28 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][whinlatter][PATCH 6/9] mariadb: Upgrade 11.4.8 -> 11.4.9
Date: Thu, 27 Nov 2025 09:48:43 +1300
Message-ID: <20251126204847.1969339-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
References: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 20:49:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122088

From: Mingli Yu <mingli.yu@windriver.com>

Remove the 0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
patch as its logic included in new version [1].

Release notes: https://mariadb.com/docs/release-notes/community-server/11.4/11.4.9

[1] https://github.com/MariaDB/server/commit/e8026a50197cbfccd70a2072cbc0ae4728a4ab40

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a5ef451fb7c8dc4d428a4c243fd59565757d728b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ive_11.4.8.bb => mariadb-native_11.4.9.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
 ...lity-with-ARMv9-by-updating-.arch-di.patch | 41 -------------------
 .../{mariadb_11.4.8.bb => mariadb_11.4.9.bb}  |  0
 4 files changed, 1 insertion(+), 43 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.8.bb => mariadb-native_11.4.9.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.8.bb => mariadb_11.4.9.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.8.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.8.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.9.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 82479c248f..4fcb5a1e40 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -22,14 +22,13 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
-           file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
            file://riscv32.patch \
            file://0001-Remove-x86-specific-loop-in-my_convert.patch \
            file://0001-support-reproducible-builds.patch \
            file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch \
            file://0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch \
           "
-SRC_URI[sha256sum] = "52fa4dca2c5f80afc1667d523a27c06176d98532298a6b0c31ed73505f49e15c"
+SRC_URI[sha256sum] = "8e481ca29b5a740444d45451c8ea2d93711cf525d6fa5d27bc9512cf8973b075"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
deleted file mode 100644
index 2a1c74a68c..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 0b1ba174bd5148c0675b335fcebde767a56e10bb Mon Sep 17 00:00:00 2001
-From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
-Date: Mon, 2 Dec 2024 02:18:46 +0000
-Subject: [PATCH] Ensure compatibility with ARMv9 by updating .arch directive
-
-The pmem_cvap() function currently uses the '.arch armv8.2-a' directive
-for the 'dc cvap' instruction. This will cause build errors below when
-compiling for ARMv9 systems. Update the '.arch' directive to 'armv9.4-a'
-to ensure compatibility with ARMv9 architectures.
-
-{standard input}: Assembler messages:
-{standard input}:169: Error: selected processor does not support `retaa'
-{standard input}:286: Error: selected processor does not support `retaa'
-make[2]: *** [storage/innobase/CMakeFiles/innobase_embedded.dir/build.make:
-1644: storage/innobase/CMakeFiles/innobase_embedded.dir/sync/cache.cc.o]
-Error 1
-
-Upstream-Status: Submitted
-
-Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
----
- storage/innobase/sync/cache.cc | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/storage/innobase/sync/cache.cc b/storage/innobase/sync/cache.cc
-index 43d642d0..c5e67709 100644
---- a/storage/innobase/sync/cache.cc
-+++ b/storage/innobase/sync/cache.cc
-@@ -82,7 +82,12 @@ static void pmem_cvap(const void* buf, size_t size)
-   for (uintptr_t u= uintptr_t(buf) & ~(CPU_LEVEL1_DCACHE_LINESIZE),
-          end= uintptr_t(buf) + size;
-        u < end; u+= CPU_LEVEL1_DCACHE_LINESIZE)
-+#if defined __ARM_ARCH && __ARM_ARCH == 9
-+    __asm__ __volatile__(".arch armv9.4-a\n dc cvap, %0" :: "r"(u) : "memory");
-+#else
-     __asm__ __volatile__(".arch armv8.2-a\n dc cvap, %0" :: "r"(u) : "memory");
-+#endif
-+
-   __asm__ __volatile__("dmb ishst" ::: "memory");
- }
- 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.8.bb b/meta-oe/recipes-dbs/mysql/mariadb_11.4.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.8.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.9.bb

