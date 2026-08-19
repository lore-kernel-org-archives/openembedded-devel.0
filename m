Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6ACC5DF89
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:41 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.927.1787117860682123662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N2TeJTHe;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e88b60121so587368a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117860; x=1787722660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1YfLYSplRLiWAS+kS6gymiKVsqko6XZ5Tp1ryV2Ac8=;
        b=N2TeJTHeVakab9jc0O2iXKRyA0cDnNZVQh657AgrdGhIPX+iIizhpeAJ+oRPZf3N1u
         M3R1ojQfn19w5D6dTIFrKMVO8radKQSlc8ht4wbjzsVtZsevliHM/3oMGoTpCYzj6VkQ
         YPNR2anVbSJWyvR/x++p36sloh0YUcvTcT1ouvNLispt1bC5lTy7aIhUbw5E/DnbM4yB
         r9HRupr0VMfWvZ0tzMHJicx4KT9sePMWfnczQQ1nw4DDf1J9hAhwdyppj7n9XyMA8cF+
         cU2C03woIPowS6yCr8CxfpwzD329zTauUsH1ANeT0r9IUzQGZ9XGjK3ntSwmylQJv1pU
         mHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117860; x=1787722660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1YfLYSplRLiWAS+kS6gymiKVsqko6XZ5Tp1ryV2Ac8=;
        b=U/yMrV8xaAV/SA0r5xp+XF8eFcxXLIK9+NOjgnERbqxL9DWsxLabJ1Nt/UC8WkcaEu
         2AwjtPW2aoaayT1EF16X9/yS2QokIlg+U7L0rKkQyWXalaowvf2ewgrLQIe/xZ+S20wa
         7529KEJwwlQd1577TV+jy1hwBp4hUOLEi1MgGJubu4y9AmkbwaWifsAslRjgwBQbQ6J+
         KkWo2YOO59ELNJVfaOjK4XG0m7ZA6Xf8KGqrtJJ2FpOlc9xV5N/zVKIMb12RTWaBlBny
         DLmEujUl+XU88+jYOmHwkOzpMUNYUuYLMWl8nYh3Hy3QLgx6m8kp/4YeoYWUDdKWDgrS
         mPgQ==
X-Gm-Message-State: AOJu0YzQIECIF87a1g06IMAGglx29qEhNRaMVNNyB205Aj2g3hhxBciG
	EywsF/FfZ1o60YHaOB7Sqft4vImQ0csMOYVITtcu3VkOVplN7VzHppcjKrH9WSM2
X-Gm-Gg: AR+sD10CosK09GIzCdcGR4DgqzXnQp1x5oNNnYX0QDfifLM7rkLv1Gr7yLKz/y8+jZg
	RaLTsIevx+ym7V7zpzKlEM54bbbhDwCJXBfIfkS/IRNsjdqipgTjAsO6STeTiloan5w2QhpTWC+
	tNor0uHVL5YHfEby+gdYj+C7VrmILHgOkWQwYWVyALJvvz0H96AiqiSyrMX7BSfwS1bt4o4DrlJ
	NFtJ8Ll6EkKFSJDz5tvVplnQOxgDSgrWk7I6N27FzaicnLoFhfp5qN7VAK+IdE+utlPt1vi0iTh
	LM6B2tYEnmPINDYEnAz+nJsgBY4U75IZ5Wq+D38TJZEtSIEe9RqDLFtiXLPFMquXC6M3G3YxUji
	FjoVC4PUhx+KTQevEAYCFa4ZrbiHWB3kF43qIZ5CTPGHwN19HRbE5Her1V00HSBdZ1QUfqP/ywW
	PBEcRPa5fI23vVkFppu3Z6tqThZMedEfdwqG3Ckv/31Cj5Edplp9+Uc3FZDTJScJNLnpyQEiU10
	yequKWpsLHd
X-Received: by 2002:a17:90b:4e8f:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39580a80a58mr3955504a91.1.1787117859996;
        Tue, 18 Aug 2026 22:37:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 25/25] redis: upgrade 8.10.0 -> 8.10.1
Date: Wed, 19 Aug 2026 17:36:29 +1200
Message-ID: <20260819053629.391864-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129269

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/redis/redis/releases/tag/8.10.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-hiredis-use-default-CC-if-it-is-set.patch              | 0
 ...2-lua-update-Makefile-to-use-environment-build-setting.patch | 0
 .../0003-hack-to-force-use-of-libc-malloc.patch                 | 0
 .../0004-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 ...05-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 0
 .../redis/{redis-8.10.0 => redis-8.10.1}/init-redis-server      | 0
 .../redis/{redis-8.10.0 => redis-8.10.1}/redis.conf             | 0
 .../redis/{redis-8.10.0 => redis-8.10.1}/redis.service          | 0
 .../recipes-extended/redis/{redis_8.10.0.bb => redis_8.10.1.bb} | 2 +-
 9 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-8.10.0 => redis-8.10.1}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.0 => redis-8.10.1}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.0 => redis-8.10.1}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.0 => redis-8.10.1}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.0 => redis-8.10.1}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.0 => redis-8.10.1}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.0 => redis-8.10.1}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.0 => redis-8.10.1}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_8.10.0.bb => redis_8.10.1.bb} (97%)

diff --git a/meta-oe/recipes-extended/redis/redis-8.10.0/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-8.10.1/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.0/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.1/0001-hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.0/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-8.10.1/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.0/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.1/0002-lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.0/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-8.10.1/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.0/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.1/0003-hack-to-force-use-of-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.0/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-8.10.1/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.0/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.1/0004-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.0/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-8.10.1/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.0/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.1/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.0/init-redis-server b/meta-oe/recipes-extended/redis/redis-8.10.1/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.0/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-8.10.1/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.0/redis.conf b/meta-oe/recipes-extended/redis/redis-8.10.1/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.0/redis.conf
rename to meta-oe/recipes-extended/redis/redis-8.10.1/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.0/redis.service b/meta-oe/recipes-extended/redis/redis-8.10.1/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.0/redis.service
rename to meta-oe/recipes-extended/redis/redis-8.10.1/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_8.10.0.bb b/meta-oe/recipes-extended/redis/redis_8.10.1.bb
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis_8.10.0.bb
rename to meta-oe/recipes-extended/redis/redis_8.10.1.bb
index 6176dc45be..c0c7c8430a 100644
--- a/meta-oe/recipes-extended/redis/redis_8.10.0.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.10.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
           "
-SRC_URI[sha256sum] = "f1baa4b28befd417aa6577ebeedde9e9fc7814cfcc299b2a6d2fd99ef7420a6c"
+SRC_URI[sha256sum] = "60166c95ab7aedaa9dfe516de685be0a4dd87be95ded59ba429df14c13f1b663"
 
 RPROVIDES:${PN} = "virtual-redis"
 

