Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF0C1E7719B
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:06 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.48482.1736119441298474889
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N+tqm6wz;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e461015fbd4so13036058276.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119440; x=1736724240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbSXaOQWyDKwxO39ZFrMWf1Z/0MjXGz8/veSJvHytyE=;
        b=N+tqm6wzjlJZf2yauvtcZcAMMpVJRx/pj8PzRvWK/ka1vep13YUKOoah3UlKb78jLS
         Nu3GVHf/EaRpJ1AFjwuxOMjBsx8VJR76l3si3uMnR789WGBOgOKYSFPqbUfg9a4rlkmK
         ws67IqNxWLxNV+3fbpVWDsbFmJBcbZPVIdluf1GPtPTz18qvx4ZrmwqHT/eHgIgsIf+5
         Qn3fVtm8CDJUS47rWq6xJdHbMACgV8am/gPB9nUWMhtF4mPw98/Bhw9w6yIQ4gz+/SA2
         2g4Xq7BzR+qofr1B+RV8a/yCG2NTbHi76qaPDWiS5N496Nq91CqQ8ITGUnL+9RQfzJ9u
         zE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119440; x=1736724240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbSXaOQWyDKwxO39ZFrMWf1Z/0MjXGz8/veSJvHytyE=;
        b=iAVbxGkIex0Veh+5sh3XI/wzbkA8162wqUkkvAT3oPeSUVbRPU9OHlGJAEOblPqouV
         6JrnbXL1cm6UZ/QauRE2ppjXQETKKj3Ru2d46opiNt6GdjYIrZVF2MVOnXdN77egYPL+
         0PUl/58/EN7qNex2YbCLMjtgmwtynT4IND5bJmXpMK7wboV4S6TX1Y6Z5gILt7GTMbyn
         XuPDN1x9/S5gbg/FamGGCfgDlnJjZq/0BL2qeNpDqcXk/N3ldbnMgOojd83xC26ovcgl
         h6ulaYBGPKEOnDz9b4z41ylvqK5Qw3yTcyu6LiXRx6btoWsvUcx/YUihLAmjVYYwJYh4
         lNnw==
X-Gm-Message-State: AOJu0YwvY5QG3ohebafMrWd54rtq+BA/4WMx5/tMGT8Ux4gOF0oJe/4J
	sG1s2GVplUyu6CYE4gHgZuZhQBADrnXcRFMY0IbvXEuBA5RdV3bzGKSleJqt
X-Gm-Gg: ASbGncvoe+5fdvYOdcDWVo5cCxLdSiecKAWZ4DVykugyMjYFm0Wd4S7WPq5+/dig9Po
	nPK2JqkKSkCNZDqi5PCTL81NWVI575B9bPITIIcLtffJp0/DGZ4NuWNkeJf2fW1Hb9qLSn3ZKm6
	Tl86EwAAGVqVaOhZB91L8z9u6fEtaIWplOyNWSLUpI1a/Ttt7Be4ok5SZHv/ncZqCYrrFCF5QDQ
	HG6sO6g+X5VBlGbZ3KypMSxKfNRaFSuoxfZL7cISdVQJEP6hmvUK7SpWKBdjIcakMi9Kg==
X-Google-Smtp-Source: AGHT+IEEm5nEyLGSLyw8rYubul9031/3aKTKAEhT4YPgSRijL5nazkmZXXCqGYgP355G58rcMd+4pg==
X-Received: by 2002:a25:e087:0:b0:e4b:25c6:54f6 with SMTP id 3f1490d57ef6-e538c3a2ff8mr28244510276.40.1736119440318;
        Sun, 05 Jan 2025 15:24:00 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 03/24] mariadb: Ensure compatibility with ARMv9 by updating .arch directive
Date: Sun,  5 Jan 2025 18:23:36 -0500
Message-ID: <20250105232358.1502946-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114633

From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>

The pmem_cvap() function currently uses the '.arch armv8.2-a' directive
for the 'dc cvap' instruction. This will cause build errors below when
compiling for ARMv9 systems. Update the '.arch' directive to 'armv9.4-a'
to ensure compatibility with ARMv9 architectures.

{standard input}: Assembler messages:
{standard input}:169: Error: selected processor does not support `retaa'
{standard input}:286: Error: selected processor does not support `retaa'
make[2]: *** [storage/innobase/CMakeFiles/innobase_embedded.dir/build.make:
1644: storage/innobase/CMakeFiles/innobase_embedded.dir/sync/cache.cc.o]
Error 1

Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aa667cbe219d207412fb5d89182887759fd63bc7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...lity-with-ARMv9-by-updating-.arch-di.patch | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 39c9f4c9d5..f3b8b5eed4 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -24,6 +24,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://0001-Use-a-lambda-function-as-deleter-prototype-in-unique.patch \
+           file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 SRC_URI[sha256sum] = "0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894e48d20"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
new file mode 100644
index 0000000000..11d1724768
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
@@ -0,0 +1,44 @@
+From 1b0c05b53ede7decb3f4dfe6187f9573cab5e0ab Mon Sep 17 00:00:00 2001
+From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+Date: Mon, 2 Dec 2024 02:18:46 +0000
+Subject: [PATCH] Ensure compatibility with ARMv9 by updating .arch directive
+
+The pmem_cvap() function currently uses the '.arch armv8.2-a' directive
+for the 'dc cvap' instruction. This will cause build errors below when
+compiling for ARMv9 systems. Update the '.arch' directive to 'armv9.4-a'
+to ensure compatibility with ARMv9 architectures.
+
+{standard input}: Assembler messages:
+{standard input}:169: Error: selected processor does not support `retaa'
+{standard input}:286: Error: selected processor does not support `retaa'
+make[2]: *** [storage/innobase/CMakeFiles/innobase_embedded.dir/build.make:
+1644: storage/innobase/CMakeFiles/innobase_embedded.dir/sync/cache.cc.o]
+Error 1
+
+Upstream-Status: Submitted
+
+Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+---
+ storage/innobase/sync/cache.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/storage/innobase/sync/cache.cc b/storage/innobase/sync/cache.cc
+index 43d642d05b5..af2d1f3d221 100644
+--- a/storage/innobase/sync/cache.cc
++++ b/storage/innobase/sync/cache.cc
+@@ -82,7 +82,12 @@ static void pmem_cvap(const void* buf, size_t size)
+   for (uintptr_t u= uintptr_t(buf) & ~(CPU_LEVEL1_DCACHE_LINESIZE),
+          end= uintptr_t(buf) + size;
+        u < end; u+= CPU_LEVEL1_DCACHE_LINESIZE)
++#if defined __ARM_ARCH && __ARM_ARCH == 9
++    __asm__ __volatile__(".arch armv9.4-a\n dc cvap, %0" :: "r"(u) : "memory");
++#else
+     __asm__ __volatile__(".arch armv8.2-a\n dc cvap, %0" :: "r"(u) : "memory");
++#endif
++
+   __asm__ __volatile__("dmb ishst" ::: "memory");
+ }
+
+-- 
+2.43.0
+
-- 
2.43.0


