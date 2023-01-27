Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAC4C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 18:04:41 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.109336.1674842671957390149
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jan 2023 10:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SZdAyJNm;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id x5so2356908plr.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 10:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IusjJgBt9urLUJ0GctUzVGCR1lGKwbmUmW/3LQcM6fY=;
        b=SZdAyJNmoF7TOqgTmILUNLrHFkoH3x21HEKCGz70Unm4gfSWejDTvKyUjtNS7P7Ql0
         X8vSD4EpT2I4z0kKWY5v08xF4I95+/xZBWwdoFv2ys3NaFhXhXm1oHKzS+BxrwSs9sQh
         XAp/AQ/W9yX8RmDpA1yVvbisQhm1gWZ/zy70mFeA83fHGtC9stlkIzsE+V31xxn2Ivq5
         PXsRe4YSWl6oldCrWkFJWSXBw+G6SIIwNOgafJaenRNIeLYt4+E6l/1oqruW+1okj5uT
         CAEEnAp+DnN5vGrAGmWfjoIBhqvmx0Gp2nsYjgeUJ5XWpc0YurUYm/c4Y4BVwRa58h8k
         CXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IusjJgBt9urLUJ0GctUzVGCR1lGKwbmUmW/3LQcM6fY=;
        b=q4M3AsWcIx7NwWk8LvLXC1s2ijpCIW8q8dRBJ2/79Cgw6xd0SM/AwRxSzGamhI1kYC
         yTMvoEUmfJEqhz6lOmWUh0pkRrYlg0SUeIJw14XUNoywPlJaHqskHDYylKqE598rGZeP
         I75dJRvXIZfnraUDhKfsK8mq7Gk3IlrNZu8HdJjx3rTznNcCuLSNeBJrLotjjTy4QHpc
         JPPzQ1/SQ7rl5JM+qqIQJrhujvLsAbz8CES1L7gy9GtLl1v5U+8GKrw1zDObxa24HqL9
         3uKKryvWfXLWlO1eQB8rxzVDa7ywFI7cw8GHD3Ulu7Xm4hX5N26KT5Lk4o5Wvli0Nb97
         iqYw==
X-Gm-Message-State: AFqh2kqBsHbjwSDrz38ZgepkiUTDYPopHsym5cXchF3OJSSVEehaxJun
	B/sw/yJgjxp2yub5tWnNAzvHdDMA0PjdAg==
X-Google-Smtp-Source: AMrXdXuHD2ZHfd6C7ZqSBtHB9cNrEBUssKhEcrK7+qw2c+XDxtt/bt4hozj7iMcNqBYmSi5+OsyX0Q==
X-Received: by 2002:a17:902:7089:b0:194:6414:12db with SMTP id z9-20020a170902708900b00194641412dbmr38660632plk.56.1674842671121;
        Fri, 27 Jan 2023 10:04:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id iy15-20020a170903130f00b00186748fe6ccsm3163554plb.214.2023.01.27.10.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:04:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] minifi-cpp: Fix build with gcc13
Date: Fri, 27 Jan 2023 10:04:26 -0800
Message-Id: <20230127180426.754319-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127180426.754319-1-raj.khem@gmail.com>
References: <20230127180426.754319-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 18:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100826

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-missing-includes-cstdint-and-cstdio.patch | 70 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.7.0.bb            |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-includes-cstdint-and-cstdio.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-includes-cstdint-and-cstdio.patch
new file mode 100644
index 0000000000..0fce8dc64f
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-includes-cstdint-and-cstdio.patch
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
+--- a/thirdparty/rocksdb/include/rocksdb/utilities/checkpoint.h
++++ b/thirdparty/rocksdb/include/rocksdb/utilities/checkpoint.h
+@@ -8,6 +8,7 @@
+ #pragma once
+ #ifndef ROCKSDB_LITE
+ 
++#include <cstdint>
+ #include <string>
+ #include "rocksdb/status.h"
+ 
+--- a/thirdparty/rocksdb/util/string_util.h
++++ b/thirdparty/rocksdb/util/string_util.h
+@@ -6,6 +6,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <sstream>
+ #include <string>
+ #include <unordered_map>
+--- a/extensions/expression-language/common/Value.h
++++ b/extensions/expression-language/common/Value.h
+@@ -15,6 +15,7 @@
+  * limitations under the License.
+  */
+ 
++#include <cstdint>
+ #include <string>
+ #include <sstream>
+ #include <iomanip>
+--- a/libminifi/include/utils/StringUtils.h
++++ b/libminifi/include/utils/StringUtils.h
+@@ -18,6 +18,7 @@
+ #define LIBMINIFI_INCLUDE_IO_STRINGUTILS_H_
+ #include <iostream>
+ #include <cstring>
++#include <cstdint>
+ #include <functional>
+ #ifdef WIN32
+ 	#include <cwctype>
+--- a/thirdparty/rocksdb/db/compaction_iteration_stats.h
++++ b/thirdparty/rocksdb/db/compaction_iteration_stats.h
+@@ -5,6 +5,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ struct CompactionIterationStats {
+   // Compaction statistics
+ 
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index b843f72a52..1bf99d4907 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;branch=master;protocol=ht
             file://0001-cxxopts-Add-limits-header.patch \
             file://0001-Fix-build-with-libc.patch \
             file://0001-civetweb-Disable-lto.patch \
+            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
             file://minifi.service \
             file://systemd-volatile.conf \
             file://sysvinit-volatile.conf \
-- 
2.39.1


