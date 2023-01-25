Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A59C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 16:54:07 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.50533.1674665645750636552
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 08:54:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=al9ImgSO;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id 5so13123426plo.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 08:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vd9m5MKKyjYjmo2GFDYBUtz3Kw5S7RnrTL84E/xGMg=;
        b=al9ImgSO8clnYvp7vyxUXxIFeuTctSlrlFQVg7tfF1hiy/d7WhpwTeVqn9xxpPifyz
         ke4A9nYleYFzr8PbxkhwXMx9s0BSs11WpSp+zrr+G/cLAX1tbEnGdKQWDVgGLP1ijrFF
         rcnTPxWcZBCCSz4+x1POzz4fAhyMy34W/kUYvkgYHfW/MkQXfiHZF7Lts3mo4ncmkhGo
         vkRGdYDQ8lZi7Gzadnl0odvZoYkza6lvTdePFuWyJD7HR+i1ihahlPENE3XU8Ko6Dm0O
         UWvu9VYEn2VkqL8zXhVuFiTVkILBeS4pAQXagmcRtr/qFnSkJFkTnjd7vZ6Rd/ZNDVBx
         iojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vd9m5MKKyjYjmo2GFDYBUtz3Kw5S7RnrTL84E/xGMg=;
        b=YfAMefGEqZlYEUqdf2C7uTlMhlY38cF0IbWTmjipOvnjhLCuqnWj3QgLoluj2W4NKb
         KpBpvOP9fiJJkJLPQ6WZSm0cQL766SGubK0Anz1GjauQD2K8tQBD041T6PgfWWGsMoMY
         0aSusO5H7jGIa9NAwqvT5oB7TGpQYDVHQ1A/zGmtAcAPclkJ2qr/tThJhaXzDjB43KQA
         rP3Mu/R5r6v66B63wXqfTTS+QM3r1aqVrnir153QiTbpGH0rcJCfv0KzIGS+/o4AQmd/
         8lANAZmQEu/9e7uH0f6umNQ/jegscTqXvsX9gXmpGsXJttqSRsECeGfb640skrdMrY43
         P/fw==
X-Gm-Message-State: AO0yUKXW3xY+SY7sy73pL3nfm1vJ5cuyiRaz/UsDE/KDSI72do/Y9OQw
	yM0kiw6ORaw6BlAZT3FusFyboO97JfEExw==
X-Google-Smtp-Source: AK7set+pTbISmCiMGq7/OX26+Tqs7yuRg/A4Bk+HUpwj8YnwBU+tHHNNB0AZM3aTsKlY0GwiKfPfZg==
X-Received: by 2002:a17:903:1208:b0:196:1425:740c with SMTP id l8-20020a170903120800b001961425740cmr8349299plh.62.1674665644865;
        Wed, 25 Jan 2023 08:54:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id x5-20020a1709029a4500b00192a04bc620sm3824023plv.295.2023.01.25.08.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 08:54:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mariadb: Fix build with gcc-13
Date: Wed, 25 Jan 2023 08:54:01 -0800
Message-Id: <20230125165401.1151126-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125165401.1151126-1-raj.khem@gmail.com>
References: <20230125165401.1151126-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 16:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100779

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...-missing-includes-cstdint-and-cstdio.patch | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 4e285aea7e..1a47d91105 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -22,6 +22,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://cross-compiling.patch \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://lfs64.patch \
+           file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 SRC_URI[sha256sum] = "ffacf84e74daf249ad64b9573d79a4e882f66b004614f8b33bfcb14a8e25da1d"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
new file mode 100644
index 0000000000..7c37fef493
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
@@ -0,0 +1,95 @@
+From 6e376601c990abaa5e261d1311f92acb3b370b8f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 24 Jan 2023 21:40:43 -0800
+Subject: [PATCH] Add missing includes <cstdint> and <cstdio>
+
+This is needed with GCC 13 and newer [1]
+
+[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
+
+Upstream-Status: Pending
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
+diff --git a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
+index 963c1d8eb49..73487edd96d 100644
+--- a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
++++ b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
+@@ -5,6 +5,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include "rocksdb/rocksdb_namespace.h"
+ 
+ struct CompactionIterationStats {
+diff --git a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
+index c7f93b4cfcd..3c2ab80535a 100644
+--- a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
++++ b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
+@@ -8,6 +8,7 @@
+ #pragma once
+ #ifndef ROCKSDB_LITE
+ 
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ #include "rocksdb/status.h"
+diff --git a/storage/rocksdb/rocksdb/table/block_based/data_block_hash_index.h b/storage/rocksdb/rocksdb/table/block_based/data_block_hash_index.h
+index f356395f329..3215221755d 100644
+--- a/storage/rocksdb/rocksdb/table/block_based/data_block_hash_index.h
++++ b/storage/rocksdb/rocksdb/table/block_based/data_block_hash_index.h
+@@ -5,6 +5,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
+diff --git a/storage/rocksdb/rocksdb/util/slice.cc b/storage/rocksdb/rocksdb/util/slice.cc
+index 6db11cc947a..c26b6a21a57 100644
+--- a/storage/rocksdb/rocksdb/util/slice.cc
++++ b/storage/rocksdb/rocksdb/util/slice.cc
+@@ -8,6 +8,7 @@
+ // found in the LICENSE file. See the AUTHORS file for names of contributors.
+ 
+ #include <algorithm>
++#include <cstdint>
+ #include "rocksdb/slice_transform.h"
+ #include "rocksdb/slice.h"
+ #include "util/string_util.h"
+diff --git a/storage/rocksdb/rocksdb/util/string_util.h b/storage/rocksdb/rocksdb/util/string_util.h
+index a761be66c52..064d059f08f 100644
+--- a/storage/rocksdb/rocksdb/util/string_util.h
++++ b/storage/rocksdb/rocksdb/util/string_util.h
+@@ -6,6 +6,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <sstream>
+ #include <string>
+ #include <unordered_map>
+diff --git a/tpool/aio_linux.cc b/tpool/aio_linux.cc
+index 10234e0e46a..a6adf1af257 100644
+--- a/tpool/aio_linux.cc
++++ b/tpool/aio_linux.cc
+@@ -18,6 +18,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
+ 
+ # include <thread>
+ # include <atomic>
++# include <cstdio>
+ # include <libaio.h>
+ # include <sys/syscall.h>
+ 
+-- 
+2.39.1
+
-- 
2.39.1


