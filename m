Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF5FC54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 12:43:56 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.20146.1748522633136470979
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 May 2025 05:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OzRLNdO1;
 spf=pass (domain: mvista.com, ip: 209.85.161.41, mailfrom: vanusuri@mvista.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6065251725bso586359eaf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 05:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1748522632; x=1749127432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HIdNnuEVHEPoX5icjXMj5U8nSPXehC+nk3silZtNhvw=;
        b=OzRLNdO16elNOZowq9XEERYBNXBpVBHY67OKAM/OvPBV5oZOHkor30WpYd+ANXQhGj
         Y7zJiK1SEleqeE/eMs0wEULC+71+2FFH9OPNIbhDpp3OTncODbAqGaBzGaEa5BXhLub1
         raDZ36bRheEY7NDiG+b/3ddx5ThcZ1MBDynkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522632; x=1749127432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIdNnuEVHEPoX5icjXMj5U8nSPXehC+nk3silZtNhvw=;
        b=IFs6whwq8Lm2wl2UQHSAkKTzfHEkULXtGgut8dq1ftPwREH1uvyaelgEa4NbyY4tN1
         iRIqhaHjKXdZ2EvUFP+IQobfVs3iskBANIXeSIK4QzxBiRSlNLVc6GqF8+E8Mtvmk527
         0G2MNxGfCiZEKo28i8LzwfTkGH6eQ+n92qhSyJQB/TVEwVUeRUxBiTd/MW4iQ/Pjj4kL
         X51Q/R+b2/gTkC7Tqbr6oZ4j1x5WHMcOkUzkLK4EHiYz5XM046CVAARnqOiYrkusydBB
         SDBF1AL/lyxUxew7nA7Dkd/3FzSiqgweCpXngUFbR0oVHrHV1fa2MoDiv7QYgx7OPhpv
         aM3g==
X-Gm-Message-State: AOJu0YxN6aE1IkQkXa8O3ZCsMV+W6ONw7lNkTrLX7LvVlETZMdMXm4gZ
	mQflmE+Gze0xqlmRZqs6rbOcgKxqs4Rr4Y6qP2Sotv6fsBrqkeYs1Jn81ROBvFkXKrPM3cG+KLN
	8/zjudrM=
X-Gm-Gg: ASbGncu9EMfXYGYrkyHoO5hTlXXP9quuSRvA3YH0xqOf8eojiQ+ue9S7vhpTMlOVpmw
	ej343ExBX7xVG0Fhvh9g5eev8ce/Ujp/plraW5gVHl90QeeYHVp2/cUspo6A0d9In0wb54DA4LK
	lKLwnBZWj+YWu/G4blBNQ7IxjYBLCI1eTr36xxz0IHSCgJR9di3Hgq8Mb08JJNAfl6mC+AdjATX
	FmwAO4skpSjrWU/XXPWGIXFoE0mOPlyjpZO5Kv65G8L26rqmMAdFpnl/fnlFkCjvYIin5GinDgg
	96rBKCUO3Ky9zhhKXNz9UIfK6wICaWTuLnrdhK9XaYKuJrJ2DP4nTXYiLrwq7n4=
X-Google-Smtp-Source: AGHT+IHZOnBLFVgchhv3iRYM5TSPNhTHNhD1S17wjGJd1Yp5nPpnXu8QgsRJJu9SxlY0HfnsXqPolA==
X-Received: by 2002:a05:6820:2709:b0:60b:9d5b:ea0b with SMTP id 006d021491bc7-60b9fb539d9mr12778773eaf.3.1748522631857;
        Thu, 29 May 2025 05:43:51 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.211.255])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60bd9c2fd5bsm537995eaf.23.2025.05.29.05.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:43:49 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][master][walnascar[PATCH] redis: upgrade 7.2.7 -> 7.2.8
Date: Thu, 29 May 2025 18:13:39 +0530
Message-Id: <20250529124339.13516-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 12:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117655

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
index c688e92cca..3c4d84085b 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.7.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
           "
 
-SRC_URI[sha256sum] = "72c081e3b8cfae7144273d26d76736f08319000af46c01515cad5d29765cead5"
+SRC_URI[sha256sum] = "6be4fdfcdb2e5ac91454438246d00842d2671f792673390e742dfcaf1bf01574"
 
 RPROVIDES:${PN} = "virtual-redis"
 
-- 
2.25.1


