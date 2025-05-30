Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3218C54F30
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 04:04:29 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.3443.1748577864921195995
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 May 2025 21:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WSK3CX2h;
 spf=pass (domain: mvista.com, ip: 209.85.160.48, mailfrom: vanusuri@mvista.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2d0920ce388so887786fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 21:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1748577864; x=1749182664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mrRRPm+XYUMy0LcF0zfGd4Pg++GGxpLfsRo7/hU6fog=;
        b=WSK3CX2h2qYpWeLVcDmHaifjHGajTmolohs11uNcEXw4FqXSeAiQm3MJeuiCUf1ZEr
         HH5p3NSCqSjIFTBEyX6lzsWyCRVwEHkB+OdOiIYxolPPli8xzm90f2e/O4WIm4+2Xipv
         5a81AN7pUoJlaaliu5Js9fer9HL8szEKuss3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748577864; x=1749182664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrRRPm+XYUMy0LcF0zfGd4Pg++GGxpLfsRo7/hU6fog=;
        b=tGu0MiCJ7qXtBX7fMgVjedS+FS7ZR6STVXgpSvQL7WBfLZ6u2mgV9MXvkXav3Tuzza
         1S0LvOFhOyDfSz0wn650h9pNzuKh6UZhbBfKH+IX5Ub8gQBGU15mgd9+JRHO+FuwxGZN
         mMX0AJmEWcgs86y2xfLRXSDdAG8Q5FaeTh5twoVlARqT9pq0HaTiTgp96bSJWc9Jv1bG
         rW1NtnZFXmzdu4Krbs1jX5B0QmBenxIt5mbU5gbg8NXCi3C99f8vScLIix8CjWeCQX/j
         XBMKZAP8hseFXYggIefbFIiwRxsRp1dxRrh+VfU0BRYPziXu3pF9yHSRd1/91mYcRQWo
         XlEg==
X-Gm-Message-State: AOJu0YxR1gI5n58cOF4+jTnZRq0sMnaaDN+H8etNUshewSGaEhnh0BcB
	ZsDZs9aiGZCFUUJ4kj9HXvoiy08Cgl9V3Mut6v0Twh2g11MFwTLzItMvaJj6zt0Vn1lSFRxfql9
	pSmCqJU4=
X-Gm-Gg: ASbGncuBPRnMGy6lMrXUGYmfd4/AhN7G2DX859i1FeSGa4xYc5pTdH7qDI8a5b8equB
	96jwf8F3fqroAztvVf/PAMuUkIIr3iZ3AdV1meJhBVc4h80bchs6fXX06/JICZUHZJ3hC+VEBL4
	b2jj31pQj8qqGUbNs6ZN+jNP27ikJyy9pGixA8OZds65pzDvnzzXhJ5uvI9mrrD6gND4cL0JZ3V
	5bCS9LX11Qmeoe3oGVDQS19AnHkj7zbgF8p4A/agxLCXa1RsDPfaCWqmAv0WzUTvntuiVQ5gkmS
	lsZTTDYTIQ/9HPjWP1I6iKB0/0aXZCe4vF08d0Yi5LMfrgx4EhaoULM/TPYvQI8=
X-Google-Smtp-Source: AGHT+IHfmtPUT+XS6Vlmizhjol8L/gay6MoMbneZq369cCIC/x6vMZF6uTAKyY/1C2VxZIUYmTz0KA==
X-Received: by 2002:a05:687c:2181:b0:2df:787a:d8f9 with SMTP id 586e51a60fabf-2e92151f4b0mr898025fac.26.1748577863625;
        Thu, 29 May 2025 21:04:23 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.228.102])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e906b7fbbcsm548872fac.33.2025.05.29.21.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 21:04:21 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][PATCH] redis: upgrade 7.2.7 -> 7.2.8
Date: Fri, 30 May 2025 09:34:10 +0530
Message-Id: <20250530040410.29699-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 04:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117665

From: Vijay Anusuri <vanusuri@mvista.com>

ChangeLog:
https://github.com/redis/redis/releases/tag/7.2.8

Update urgency: SECURITY: There are security fixes in the release.

Security fixes
==================
* (CVE-2025-21605) An unauthenticated client can cause an unlimited growth of output buffers

Bug fixes
=================
* #12817, #12905 Fix race condition issues between the main thread and module threads
* #13863 RANDOMKEY - infinite loop during client pause
* #13877 ShardID inconsistency when both primary and replica support it

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../0001-hiredis-use-default-CC-if-it-is-set.patch              | 0
 ...2-lua-update-Makefile-to-use-environment-build-setting.patch | 0
 .../0003-hack-to-force-use-of-libc-malloc.patch                 | 0
 .../0004-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 ...05-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 0
 .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
 .../redis/{redis-7.2.7 => redis-7.2.8}/init-redis-server        | 0
 .../redis/{redis-7.2.7 => redis-7.2.8}/redis.conf               | 0
 .../redis/{redis-7.2.7 => redis-7.2.8}/redis.service            | 0
 .../recipes-extended/redis/{redis_7.2.7.bb => redis_7.2.8.bb}   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.7 => redis-7.2.8}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.7 => redis-7.2.8}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.7 => redis-7.2.8}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.7 => redis-7.2.8}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.7 => redis-7.2.8}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.7 => redis-7.2.8}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.7 => redis-7.2.8}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.7 => redis-7.2.8}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.7 => redis-7.2.8}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.7.bb => redis_7.2.8.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.7/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.7/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.8/0001-hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.7/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.7/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.8/0002-lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.7/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.7/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.8/0003-hack-to-force-use-of-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.7/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.7/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.8/0004-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.7/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.7/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.8/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.7/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.7/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.8/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.7/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.2.8/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.7/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.8/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.7/redis.conf b/meta-oe/recipes-extended/redis/redis-7.2.8/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.7/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.8/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.7/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.8/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.7/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.8/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.7.bb b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.2.7.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.8.bb
index 2f5e45ca0c..bf9de7a166 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.7.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
           "
 
-SRC_URI[sha256sum] = "72c081e3b8cfae7144273d26d76736f08319000af46c01515cad5d29765cead5"
+SRC_URI[sha256sum] = "6be4fdfcdb2e5ac91454438246d00842d2671f792673390e742dfcaf1bf01574"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
 
-- 
2.25.1


