Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1099C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 07:17:41 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.68627.1674717461230170261
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 23:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T8n0XZuc;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id t12-20020a17090aae0c00b00229f4cff534so5321609pjq.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 23:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvY4DzKNYDLrQMgzpO/Xjz92a2Km9X0lChs8g7ng3jE=;
        b=T8n0XZuc7MXSj4yp0C5C10Wy1aTaxLaaeBlZG3C2/wBOGUGfueqGanN9oKonCwgnJJ
         06dyv1xu9f0hPUgQ9MVm5r32nTL+YeY9/gJTbxYZv73prCBpsBy0ovhOH97AVOVW+TGo
         WtmcurF9Hj1q/91p3PCJ71mhDFzqadCDvcP8hdZsuBMJA1JHOfWNJxfPG7uBp0W3AaL2
         lSZ3EQmvPCAuAH2xUV18M4dRWABLl7nUXQ4GzDwOHkkZvyN14iwme0OdOsHrWCB4rEnV
         SydAYKvcfySrWxN/Jf9NuwgWEwMnmqCVqrutboTQphpu04qssqyKaD92gDmB6zwyIQ+8
         puzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvY4DzKNYDLrQMgzpO/Xjz92a2Km9X0lChs8g7ng3jE=;
        b=NZ5DcT2+S67V1KLaXB0BWEf2OCjGYQCXBIiaaazdN1dtW6mRo1EVPkUWbpf0FbM9nJ
         PdfaIkBdHmh6r3hTGc1nWR1sdfVcdEi1/sHTUySI/kzfPlYYedjDtrb++Y7WAJoMZ2XY
         Gu1HzcLNkPaEK21i1bFmNXX3j3xXLQezNnyxt8/poXZ6GvkggTmY9VJHRiTBBKBQV39t
         IKeGuUegnCCkdU8BpOFAZMcVp/dHkAceDh12QA+PO9VnwceiaESZxeQ+M1QqOmBiUpvd
         RIM4eNxVOFfqPgxZ4xVFr5d1CEyLFT0fQWjSdMODVv4Tyl7qkPe2C+PwB72A2ylKrNzD
         FnaQ==
X-Gm-Message-State: AO0yUKWQlqLXF7A3Z2txJcqhJ1gDn50eJNccltL64SecJMVkUfwgLicD
	SSWtvnBvgoH+l75IC24HJnvmLv7+ce4R3g==
X-Google-Smtp-Source: AK7set8VtUKEcgL6ADsckifX2OcMouX6huAAwft4mqlgnYqAK/HbYv2Ta6WDD9mbmLpP93FLi5uuVw==
X-Received: by 2002:a17:902:d492:b0:196:3feb:1f1e with SMTP id c18-20020a170902d49200b001963feb1f1emr1013712plg.47.1674717460355;
        Wed, 25 Jan 2023 23:17:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902b69100b00196025a34b9sm458815pls.159.2023.01.25.23.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 23:17:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/13] rocksdb: Upgrade to 7.9.2
Date: Wed, 25 Jan 2023 23:17:25 -0800
Message-Id: <20230126071735.2444745-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126071735.2444745-1-raj.khem@gmail.com>
References: <20230126071735.2444745-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 07:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100785

Refresh patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-Add-missing-includes-cstdint-and-cstdio.patch  | 2 +-
 .../files/0001-cmake-Add-check-for-atomic-support.patch       | 2 +-
 .../files/0001-cmake-Use-exported-target-for-bz2.patch        | 2 +-
 meta-oe/recipes-dbs/rocksdb/files/ppc64.patch                 | 2 +-
 .../rocksdb/{rocksdb_7.5.3.bb => rocksdb_7.9.2.bb}            | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-dbs/rocksdb/{rocksdb_7.5.3.bb => rocksdb_7.9.2.bb} (96%)

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-Add-missing-includes-cstdint-and-cstdio.patch
index 1c505f7e18..a177ce28b9 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-Add-missing-includes-cstdint-and-cstdio.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-Add-missing-includes-cstdint-and-cstdio.patch
@@ -37,7 +37,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +#include <cstdint>
  #include <string>
  #include <vector>
- #include "rocksdb/status.h"
+ 
 --- a/table/block_based/data_block_hash_index.h
 +++ b/table/block_based/data_block_hash_index.h
 @@ -5,6 +5,7 @@
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
index 2906100dee..0fe9c12766 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
@@ -27,7 +27,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -1000,7 +1000,12 @@ option(ROCKSDB_BUILD_SHARED "Build share
+@@ -1057,7 +1057,12 @@ set(ROCKSDB_SHARED_LIB rocksdb-shared${A
  if(WIN32)
    set(SYSTEM_LIBS ${SYSTEM_LIBS} shlwapi.lib rpcrt4.lib)
  else()
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch
index 139312a298..706e0868e5 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch
@@ -13,7 +13,7 @@ Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/7541]
 
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -153,12 +153,7 @@ else()
+@@ -154,12 +154,7 @@ else()
    if(WITH_BZ2)
      find_package(BZip2 REQUIRED)
      add_definitions(-DBZIP2)
diff --git a/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch b/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch
index 45deef338c..211c1c720b 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
 @@ -131,8 +131,12 @@ static inline tokutime_t toku_time_now(v
    uint64_t result;
-   __asm __volatile__("mrs %[rt], cntvct_el0" : [ rt ] "=r"(result));
+   __asm __volatile__("mrs %[rt], cntvct_el0" : [rt] "=r"(result));
    return result;
 -#elif defined(__powerpc__)
 +#elif defined(__powerpc__) && defined(__GLIBC__)
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_7.5.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_7.9.2.bb
similarity index 96%
rename from meta-oe/recipes-dbs/rocksdb/rocksdb_7.5.3.bb
rename to meta-oe/recipes-dbs/rocksdb/rocksdb_7.9.2.bb
index b9416988cf..29f234d6ec 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_7.5.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_7.9.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "540d5aae516265170564ec27b3e67a54a11b7045"
-SRCBRANCH = "7.5.fb"
+SRCREV = "444b3f4845dd01b0d127c4b420fdd3b50ad56682"
+SRCBRANCH = "7.9.fb"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=https \
            file://0001-cmake-Add-check-for-atomic-support.patch \
-- 
2.39.1


