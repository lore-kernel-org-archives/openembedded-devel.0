Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3A0EA8541
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 18:59:27 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46096.1772996358803396533
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Mar 2026 11:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BizIgjR2;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b94a19fdso6787926f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 11:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772996357; x=1773601157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mjhByol82/BTRIWZKRQZOV9aEscnWS2fzhc3/X3YVZY=;
        b=BizIgjR2lDtrlRabyaKGdDJ52GRDBFfDn1fQkloQ3WaF88q7rWzbiIxHGFvf/siqco
         AdVJNBr4q+CFHErQmccWFVjK+6MUoje3HXw/7uQWTf+CTUVtrGC2DC1tmAvnNZyfoG47
         JCT0UZ1a0d8pgelE3QEqdS+tTpQLEeEJBiHne+hYyNGA3z+KdYswPwaSzHXVUUuFdG/M
         oC6N+Utaz4NK2TvUD3TRuYeyONOGXsTOsbtI6BLZbBDyUTzOABJBJZc8xl8EUvwSGtkC
         vKnMJjAw8Txz1Da/Rt258aPO7LiNbDLLV2Q9O6/vtX1aniTMCQjuFPwXmpDRAkr/6phD
         PJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772996357; x=1773601157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjhByol82/BTRIWZKRQZOV9aEscnWS2fzhc3/X3YVZY=;
        b=hD1gmIsRqoSJuZN3y4x3pu3Bi60452jx4Jmq1BKgvAy+Kw3JkDf7eXlD1dBZ92t0Ju
         1/YA+kEBxwAFh/UXE0Ecl6NgxzIwsj1bDVEFNZvvGaYNveHS2Zkd9XYRrCXGoufpLG1G
         kNyq+/+oBNygCa7BgPPIenLWqdrUr8jqywY9jYF88oAe8jzokSlYUS6AvTH2TwKJ0Tef
         YBda/Be8jS2XUdbH3pGUVC8jiAPT/C4A2b9flZbxQ0hmnzKFF2TPlq5AqG2r9Q5MBvVv
         kpPNLp2Ijor+7G5cQQEsmgtIVThEX0ix2D9yppWODqLESrc5EJlHkXOsfCVU1m718vwJ
         G+bA==
X-Gm-Message-State: AOJu0Yzf+nLLr76bZ8Ud8dlbdF25mzJ+2ERg+ziULJtKUWn0RYv2ZTMR
	uru9Eus6nriA4l5rNB1yl9gx6XYENAkXyZhZJoQ4ZqqB+/bxSXBZdJa8ZpYbrA==
X-Gm-Gg: ATEYQzyllEfNhWtD/TJGSj99oxAmtRFpc1SXgBxOgD4AghjrJPy7BYNj3EFkfyXuSlU
	K6t304FhryRHbvLbLV2ul5Cj/K1lgACtvom5ZrkVv+ngrAI+HP1i1SUIouUCiD6j0Xy0K9cKOgw
	T0xivCVmemkzu6zPtc35rMh2TQXNGrPc5K9WNOqmLENB0J10YM6VcmMj3+NVwZLpLG2GwjBGHJy
	sxQRNQh3FXFquI3NjBKzKjwzggm7z7gvdKByJPB/v+r0yj9jFFLkuqUa+w23s7r+Zgu5vGso4O6
	oGCdng5zhwUbj3pVfvwHF8lK0mowNcffDyz3NG+r73QARc0NcGf4w5lgsulVjkDmMgE/fiYqFBQ
	wucjk/xOioIBAosVEnBe0WiHXRaUs+wBcDuYyC/hWi2TAMTle8hxdEPIClYhJIy0EPcMMIrvpy3
	DQEizSH/jyJAFCAE+acznG
X-Received: by 2002:a05:6000:186b:b0:439:9282:e728 with SMTP id ffacd0b85a97d-439da654ce4mr16391389f8f.2.1772996356737;
        Sun, 08 Mar 2026 11:59:16 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97abasm18321038f8f.10.2026.03.08.11.59.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 11:59:16 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] redis: upgrade 8.0.0 -> 8.0.6
Date: Sun,  8 Mar 2026 19:59:15 +0100
Message-ID: <20260308185915.26612-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 18:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124947

License-Update:
- Upstream has removed incorrect gplv3 text from the license (because agplv3
  is the correct), which changed the checksum
- The recipe had incorrect license indication. Redis 8 is not BSD licensed,
  but depending on the user's choice, it's agplv3 or sspl (or custom redis
  license, which is not added to the list)

Changelogs:
8.0.6:
- Security fix: A user can manipulate data read by a connection by
  injecting \r\n sequences into a Redis error reply

8.0.5:
Bugfixes:
- HGETEX - potential crash when FIELDS is used and numfields is missing
- Potential crash on HyperLogLog with 2GB+ entries
- Cuckoo filter - Division by zero in Cuckoo filter insertion
- Cuckoo filter - Counter overflow
- Bloom filter - Arbitrary memory read/write with invalid filter
- Bloom filter - Out-of-bounds access with empty chain
- Bloom filter - Restore invalid filter [We thank AWS security for
  responsibly disclosing the security bug]
- Top-k - Out-of-bounds access

8.0.4:
Security fixes
- (CVE-2025-49844) A Lua script may lead to remote code execution
- (CVE-2025-46817) A Lua script may lead to integer overflow and potential RCE
- (CVE-2025-46818) A Lua script can be executed in the context of another user
- (CVE-2025-46819) LUA out-of-bound read

New Features
- VSIM: new EPSILON argument to specify maximum distance

Bug fixes
- Potential use-after-free after pubsub and Lua defrag
- Potential crash on Lua script defrag
- HINCRBYFLOAT removes field expiration on replica
- Prevent CLIENT UNBLOCK from unblocking CLIENT PAUSE
- Endless client blocking for blocking commands
- Vector sets - RDB format is not compatible with big endian machines
- EVAL crash when error table is empty
- Gracefully handle short read errors for hashes with TTL during full sync

8.0.3:
Security fixes
- (CVE-2025-32023) Fix out-of-bounds write in HyperLogLog commands
- (CVE-2025-48367) Retry accepting other connections even if the accepted connection reports an error

New Features
- VSIM: Add new WITHATTRIBS to return the JSON attribute associated with an element

Bug fixes
- A short read may lead to an exit() on a replica
- db->expires is not defragmented

8.0.2:
Security fixes
- (CVE-2025-27151) redis-check-aof may lead to stack overflow and potential RCE

Bug fixes
- Cron-based timers run twice as fast when active defrag is enabled

Other general improvements
- LOLWUT for Redis 8

8.0.1:
Performance and resource utilization improvements
- Vector sets - faster VSIM FILTER parsing

Bug fixes
- Query Engine - revert default policy search-on-timeout to RETURN
- Query Engine - @__key on FT.AGGREGATE used as reserved field name preventing access to Redis keyspace
- Query Engine - crash when calling FT.CURSOR DEL while retrieving from the CURSOR

Notes
- Fixed wrong text in the license files

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-hiredis-use-default-CC-if-it-is-set.patch          | 0
 ...a-update-Makefile-to-use-environment-build-setting.patch | 0
 .../0003-hack-to-force-use-of-libc-malloc.patch             | 0
 .../0004-src-Do-not-reset-FINAL_LIBS.patch                  | 0
 ...efine-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 0
 .../redis/{redis-8.0.0 => redis-8.0.6}/init-redis-server    | 0
 .../redis/{redis-8.0.0 => redis-8.0.6}/redis.conf           | 0
 .../redis/{redis-8.0.0 => redis-8.0.6}/redis.service        | 0
 .../redis/{redis_8.0.0.bb => redis_8.0.6.bb}                | 6 +++---
 9 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis-8.0.0 => redis-8.0.6}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.0.0 => redis-8.0.6}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.0.0 => redis-8.0.6}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.0.0 => redis-8.0.6}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.0.0 => redis-8.0.6}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.0.0 => redis-8.0.6}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.0.0 => redis-8.0.6}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.0.0 => redis-8.0.6}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_8.0.0.bb => redis_8.0.6.bb} (94%)

diff --git a/meta-oe/recipes-extended/redis/redis-8.0.0/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-8.0.6/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.0.0/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-8.0.6/0001-hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.0.0/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-8.0.6/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.0.0/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-8.0.6/0002-lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.0.0/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-8.0.6/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.0.0/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-8.0.6/0003-hack-to-force-use-of-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.0.0/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-8.0.6/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.0.0/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-8.0.6/0004-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.0.0/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-8.0.6/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.0.0/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-8.0.6/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.0.0/init-redis-server b/meta-oe/recipes-extended/redis/redis-8.0.6/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.0.0/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-8.0.6/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-8.0.0/redis.conf b/meta-oe/recipes-extended/redis/redis-8.0.6/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.0.0/redis.conf
rename to meta-oe/recipes-extended/redis/redis-8.0.6/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-8.0.0/redis.service b/meta-oe/recipes-extended/redis/redis-8.0.6/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.0.0/redis.service
rename to meta-oe/recipes-extended/redis/redis-8.0.6/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_8.0.0.bb b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
similarity index 94%
rename from meta-oe/recipes-extended/redis/redis_8.0.0.bb
rename to meta-oe/recipes-extended/redis/redis_8.0.6.bb
index afad578dba..6787f42350 100644
--- a/meta-oe/recipes-extended/redis/redis_8.0.0.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
@@ -2,8 +2,8 @@ SUMMARY = "Redis key-value store"
 DESCRIPTION = "Redis is an open source, advanced key-value store."
 HOMEPAGE = "http://redis.io"
 SECTION = "libs"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4feb9943a139a170b9d6ed6ec3342d0c"
+LICENSE = "AGPL-3.0-only | SSPL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9f1da87999fb281d8a9e3e3b2d0403b4"
 DEPENDS = "readline lua ncurses"
 
 SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
@@ -16,7 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
           "
-SRC_URI[sha256sum] = "cf395665ba5fcecc4ef7aed1d8ab19c268619d98595827565c82344160171262"
+SRC_URI[sha256sum] = "6d0a9913887a4972536f9da226f1575859c34d86354129163260a5f9c6bd4229"
 
 RPROVIDES:${PN} = "virtual-redis"
 

