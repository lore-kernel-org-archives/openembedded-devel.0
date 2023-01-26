Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9C2C54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 07:17:41 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.68626.1674717460429623922
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 23:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bRrt8KqS;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id jm10so1099363plb.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 23:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohbovFq9xONaoElHpPzldE51K4zTCOcFaBziQG5yJ9k=;
        b=bRrt8KqSI34wv5Jiu8/KyvVKCwJ+ASsZt28gWTG9WPo1cuve7cpPKvKpmmqaXtAbUj
         fcjPHcmKpUWMt5NDJ0gowFpkBdUB2EsJ5OLF1lFZhf4VcfCu/WKQ4sOulWfd/sGhvSKA
         6fPJ0V5ppaMvDC8x8TIpVaJJp90fAT1692Od5IVQBz07UcSjKZPuXI5iTHrjxPA5/jjf
         HhvwQq5MNJmNbnk00m/5zQIFPXuaVYlD+1/pfIZxv3mxK8gM8KaAFKJbRUVU2VQx18AM
         Fs5OT5lNqOveKG7fl6lidc1PQW2FikCyCbpBlx2k4jjEnFnRm7uYUiRZJ2lmc2dWJxfg
         eEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohbovFq9xONaoElHpPzldE51K4zTCOcFaBziQG5yJ9k=;
        b=sLQFIAWBa3+jeIp0EmCPbyI4m1RNniLbAHo4NLCXRKviWvPUxh9POdIiVC2FPR7TAp
         BDofUr3LiHwJXQgHFDqhjcrgrKJ4BHpLV23WBwwnMoUmiISW7js9tp1ez/idFACSRXWb
         V3dHbOVVrtqGA4rDIhsvliXEwRCQvmQDzgBWqb628hEZQ4sKhyDE9HZ8u55LoWJQgmtt
         EOFz6UET7chBmGv6pxa2nndqE72MCsy8JTIlpKf2oLJbjHFJMFr6QKVgLmYi8j7hYkSv
         AXRYlGyFCqBjgEnlGtz5Qkpj2nlrxgIjlPJPK8xrGX8CzysJ29bqDoOQW1Uch2cxi67W
         4tVw==
X-Gm-Message-State: AO0yUKVQ4AcyatV+a8Er5VKNy4/P+Nb0vrJaYtAAk61e1ywb9TGN9XxS
	j4lRU5aYUSdEaadZgU00SQSlo4kgms7+pw==
X-Google-Smtp-Source: AK7set+4j+V+OORec2Tjew8Z3H8DPYw7ZW3pFFJ+Kp7gEHgnzzB8JIecUm7P5tQRUhfPp67e8bwrjQ==
X-Received: by 2002:a17:902:d044:b0:195:ed79:4846 with SMTP id l4-20020a170902d04400b00195ed794846mr853906pll.22.1674717459519;
        Wed, 25 Jan 2023 23:17:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902b69100b00196025a34b9sm458815pls.159.2023.01.25.23.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 23:17:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/13] rocksdb: Fix build with gcc13
Date: Wed, 25 Jan 2023 23:17:24 -0800
Message-Id: <20230126071735.2444745-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126071735.2444745-1-raj.khem@gmail.com>
References: <20230126071735.2444745-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 07:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100784

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-missing-includes-cstdint-and-cstdio.patch | 70 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_7.5.3.bb  |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-Add-missing-includes-cstdint-and-cstdio.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-Add-missing-includes-cstdint-and-cstdio.patch
new file mode 100644
index 0000000000..1c505f7e18
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-Add-missing-includes-cstdint-and-cstdio.patch
@@ -0,0 +1,70 @@
+From 6e376601c990abaa5e261d1311f92acb3b370b8f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 24 Jan 2023 21:40:43 -0800
+Subject: [PATCH] Add missing includes <cstdint> and <cstdio>
+
+This is needed with GCC 13 and newer [1]
+
+[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
+
+Upstream-Status: Backport [https://github.com/facebook/rocksdb/commit/88edfbfb5e1cac228f7cc31fbec24bb637fe54b1]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h   | 1 +
+ storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1 +
+ .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1 +
+ storage/rocksdb/rocksdb/util/slice.cc                            | 1 +
+ storage/rocksdb/rocksdb/util/string_util.h                       | 1 +
+ tpool/aio_linux.cc                                               | 1 +
+ 6 files changed, 6 insertions(+)
+
+--- a/db/compaction/compaction_iteration_stats.h
++++ b/db/compaction/compaction_iteration_stats.h
+@@ -7,6 +7,7 @@
+ 
+ #include <cstdint>
+ 
++#include <cstdint>
+ #include "rocksdb/rocksdb_namespace.h"
+ 
+ namespace ROCKSDB_NAMESPACE {
+--- a/include/rocksdb/utilities/checkpoint.h
++++ b/include/rocksdb/utilities/checkpoint.h
+@@ -8,6 +8,7 @@
+ #pragma once
+ #ifndef ROCKSDB_LITE
+ 
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ #include "rocksdb/status.h"
+--- a/table/block_based/data_block_hash_index.h
++++ b/table/block_based/data_block_hash_index.h
+@@ -5,6 +5,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
+--- a/util/slice.cc
++++ b/util/slice.cc
+@@ -12,6 +12,7 @@
+ #include <stdio.h>
+ 
+ #include <algorithm>
++#include <cstdint>
+ 
+ #include "rocksdb/convenience.h"
+ #include "rocksdb/slice_transform.h"
+--- a/util/string_util.h
++++ b/util/string_util.h
+@@ -6,6 +6,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <sstream>
+ #include <string>
+ #include <unordered_map>
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_7.5.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_7.5.3.bb
index d4f0346ee1..b9416988cf 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_7.5.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_7.5.3.bb
@@ -12,6 +12,7 @@ SRCBRANCH = "7.5.fb"
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=https \
            file://0001-cmake-Add-check-for-atomic-support.patch \
            file://0001-cmake-Use-exported-target-for-bz2.patch \
+           file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://ppc64.patch \
            file://mips.patch \
            file://arm.patch \
-- 
2.39.1


