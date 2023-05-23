Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3D2C77B7A
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 04:41:27 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.13827.1684816878601818485
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 21:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rPM6QxOF;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-25374c9be49so4338480a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 21:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684816878; x=1687408878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r5sGX3566poNz0kJM18z7z++tMLlYCWFybcvwMWQUDA=;
        b=rPM6QxOFU/HmQ+tzkNDikUlb/IB8rzpIayJtICZ3NbC8FMvz1fcjqyPvDsJ5pGw2x/
         hnNfQtB9vixc10p8pyo/xqbhEnZy5MsCmj3jY6NnykzFuvjRBedt0dqP9AKQfkSr648X
         yUCjSpQvmMxGv1dEPYteavN+rIGx6r2anJIE8N5f5ajivpl4Y/bVKWHZX8JEqX8Sx/HM
         ZRs1WgnwPn9jFE0EKlieRnKtznYemmDbH2g4JO/Ku2leqhmSdr4A9tMjz8GWNWLrCMwu
         rbmhmFrbTWNh9eHuUex7NR+cgxnnFCbGxdvPuEcGfUOqit0Toya2lVmdbdnXaPAP5eg/
         YiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684816878; x=1687408878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5sGX3566poNz0kJM18z7z++tMLlYCWFybcvwMWQUDA=;
        b=Ax3NA30OeDfZeEaLUY8pNQ69RUkEmDH1pf2QagSNkjjm7QendrSJlwBExD5WgtnKlY
         3I2rFP0dvsDAPkDXi3/Pd3/TkAnxJcKmgh/IGSQI0gDkidErCYCr7AK3u5gEYWkqvgeJ
         wXm5HtCkZ/07i2IjUqt5VQjYY4dIQSYlb7KWohnRNOSbGDCRN5vtd+vZ75vMmsOuX5EK
         lrdDODSGCXArMx2r7OkTtYXhujIJ1fpRaBq2KGF6BKZbg3yC63KwLftEBeRGQ6HsQcP7
         QAdEYMw6VHcmW+crLGaiiAhB/h87klGkgUAj04lOEsILZJhpYyuW1B5Qb2RXHUvXHZHW
         UmZw==
X-Gm-Message-State: AC+VfDxMed/Uhqq0xSUtFADdu0aUGDTSHxKKO6R49jE44Qz0bC/kGAe/
	yNsDnvHk74uxFkzcv+fpU1Rj8ij/3ZY=
X-Google-Smtp-Source: ACHHUZ7KMPdPBw0itOeNcv0x9g1eQLQqZLpW7dbtzmvvd0vrcN4rqpdokQy2cQalzKLW/MduKSUy+Q==
X-Received: by 2002:a17:90a:2806:b0:253:e0e1:618f with SMTP id e6-20020a17090a280600b00253e0e1618fmr9146428pjd.29.1684816877749;
        Mon, 22 May 2023 21:41:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id d61-20020a17090a6f4300b0024dfbac9e2fsm7176561pjk.21.2023.05.22.21.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 21:41:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] redis-plus-plus: Upgrade to 1.3.8
Date: Mon, 22 May 2023 21:41:15 -0700
Message-Id: <20230523044115.4187178-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 04:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102727

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-include-cstdint.patch          | 37 -------------------
 ...plus_1.3.7.bb => redis-plus-plus_1.3.8.bb} |  5 +--
 2 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/redis-plus-plus/files/0001-include-cstdint.patch
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.3.7.bb => redis-plus-plus_1.3.8.bb} (81%)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/files/0001-include-cstdint.patch b/meta-oe/recipes-extended/redis-plus-plus/files/0001-include-cstdint.patch
deleted file mode 100644
index bfe2412b5d..0000000000
--- a/meta-oe/recipes-extended/redis-plus-plus/files/0001-include-cstdint.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e74bb5a7ef87e697571181280e6108b89104c02d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 25 Jan 2023 20:40:56 -0800
-Subject: [PATCH] include <cstdint>
-
-gcc 13 libstdc++ moved some includes around and as a result <cstdint>
-is no longer transitively included [1]. Explicitly include it for uintXX_t.
-
-Fixes
-
-../git/src/sw/redis++/utils.h:187:1: error: 'uint16_t' does not name a type
-  187 | uint16_t crc16(const char *buf, int len);
-      | ^~~~~~~~
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Upstream-Status: Submitted [https://github.com/sewenew/redis-plus-plus/pull/449]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/sw/redis++/utils.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/sw/redis++/utils.h b/src/sw/redis++/utils.h
-index f77f796..ff38f2d 100644
---- a/src/sw/redis++/utils.h
-+++ b/src/sw/redis++/utils.h
-@@ -17,6 +17,7 @@
- #ifndef SEWENEW_REDISPLUSPLUS_UTILS_H
- #define SEWENEW_REDISPLUSPLUS_UTILS_H
- 
-+#include <cstdint>
- #include <cstring>
- #include <string>
- #include <type_traits>
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.7.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.8.bb
similarity index 81%
rename from meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.7.bb
rename to meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.8.bb
index 8e906a4483..3117e70d13 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.7.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.8.bb
@@ -4,9 +4,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https \
-           file://0001-include-cstdint.patch"
-SRCREV = "f3b19a8a1f609d1a1b79002802e5cf8c336dc262"
+SRCREV = "4368319fb668204f345da05b9dd79762506c67b6"
+SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.40.1


