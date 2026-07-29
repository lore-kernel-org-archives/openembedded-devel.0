Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16601C54F5C
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:49 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3037.1785293080855578089
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=grd5UrvA;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca88130e09aso251451a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293080; x=1785897880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TF6w/8UajU16Pk7HI0z6ScrfK8YXPyFrAMEOijwLZqE=;
        b=grd5UrvAjVcLaBU79pghTaoPzT0UQEJoGv6aqgxhYTxg4EYWEIXEFa8Ci6c7iigI9w
         WagJZXg7RARbZjWsxDrMv8v639gHJWR+p1DXlCN/H9PrYoKvbB8ChBrriLh2TNW1PZTg
         PZM07HgR5h7jgHs+ef8WuYGiDwaJWhHWZV/R079vvk2W0hgyQT2hTUjdGWdBPeql4IHW
         eqnv/AHGn/5cwnrN+dOGjNPqb1jvFIyONZLhHl/cRM0DVoG8y5GwZ10Y8WSbmiR+fKkt
         haybcAd1m7uj/6l2zIeEJ51lN1eyQ9xUbgsuzN1UuAuJSwYhMFTxJPQdIyZcw7cb2ODu
         2Nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293080; x=1785897880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TF6w/8UajU16Pk7HI0z6ScrfK8YXPyFrAMEOijwLZqE=;
        b=nMxSUSeuXDwG3l7D3oPzsSaK+PFVSNO/dAOR7KH7uOvxMBc/DonNYGvhs8UTbD7FpI
         szjKq33W6VYEZMbQBOJ3uU9hZ6vCsNkP8psHSbMlRp/xn7Ca+JonoFbSz2MUURAIZVU4
         fr4sQB+yX+pQ3uvgZFBuEPkpxWLTH/PTPfBjAwj4HeYBZ8NxSDvGksxh1OW8jMPl5roK
         Mrb7Xqe6yG1bVFiYqkpyWA9NElIqI5jwhrKloGlBa5BemRUgU2PnWpHmFZW8RchzFDSB
         RKI1FhJalz4k1PDeGZQ1cnvnjCfkAxXSKcXBqFLaUinmbGy7mpE6appPUCwvieVX/ZCj
         57sw==
X-Gm-Message-State: AOJu0YzUoB0Rv6/HIR+8jWQ/bN3NJvVrnadva9AAKir0dyEj4n8b+OBn
	YJvJHTINb40kyyEGDLASkhNQFzfeUEs2De8L3hR3dNjY90GwicsIi6Xv1a8QnwmP
X-Gm-Gg: AR+sD11M2lvfj3mC4vhNEPEaMTgJF0VBh+rwG0PLQQIbZ/qT69PqTkGCygVdGg0B/a8
	iiKOdBjCwpB+qTmVOKgOWmQKri+uvv30oRqWN9hMBez0fE1TVrITq7yuQ5ZPkGd6z7M9bJReZAs
	CPF8zG37SK+WMhKjoV2sfiQgD+4nMVpQrfrKz2I0bfjoWnFjR8arDauZvwyX91qkl1F3IwqUxZe
	2uWE1u2E9f26qgwxixEYFxFG/YIjQMZZJl9BUNp/omgdMCyx8rR0C/a2K3Wwfw8SQXlMmXQYznR
	8lzgE1UXDDLzZgWznmkf+9wrGYgAnKxYe6P+ik1n+gGS+EQnghULTwW//mP3HvPI3Greh7hyskm
	Wbe1YoiZkDIiNO4UmjF56Kxx5hUgPj6O9qCY7JCjtE+14j/oNndSBmts9L/zJ3n45KSuYsRSK0e
	KNWRWt71BXxKjz8XnDcfLI6kzSJkfhsHfIqoPIw4PzhtJe5C1G30ijO77ur9HLtSERNNjTJhzqe
	IO8WfWGdOH2f/ISWnp4j5VmWt1gP0xKTRXt1MBg32zqiosotWDzOxV1AHPUuSXgbXbMU5Wp3mBp
	Z/zKqu4Lec07tdzVL0/2S0HgL3fzlgqFfW/YJoQXiOYhj+qCUVpOcMql3ASnLJ+5bxeP4lyA6UD
	GEg==
X-Received: by 2002:a05:6a20:b40b:b0:3bf:a638:4376 with SMTP id adf61e73a8af0-3c8ab0e3b14mr6005459637.21.1785293080145;
        Tue, 28 Jul 2026 19:44:40 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 16/18] redis: upgrade 8.8.0 -> 8.8.1
Date: Tue, 28 Jul 2026 19:44:18 -0700
Message-ID: <20260729024420.2328180-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128532

Security fix release:
- Crafted RESTORE payloads in RedisBloom and TDigest may trigger out-of-bounds
  writes, potentially leading to remote code execution (RedisBloom #1044).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-hiredis-use-default-CC-if-it-is-set.patch              | 0
 ...2-lua-update-Makefile-to-use-environment-build-setting.patch | 0
 .../0003-hack-to-force-use-of-libc-malloc.patch                 | 0
 .../0004-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 ...05-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 0
 .../redis/{redis-8.8.0 => redis-8.8.1}/init-redis-server        | 0
 .../redis/{redis-8.8.0 => redis-8.8.1}/redis.conf               | 0
 .../redis/{redis-8.8.0 => redis-8.8.1}/redis.service            | 0
 .../recipes-extended/redis/{redis_8.8.0.bb => redis_8.8.1.bb}   | 2 +-
 9 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-8.8.0 => redis-8.8.1}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.8.0 => redis-8.8.1}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.8.0 => redis-8.8.1}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.8.0 => redis-8.8.1}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.8.0 => redis-8.8.1}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.8.0 => redis-8.8.1}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.8.0 => redis-8.8.1}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.8.0 => redis-8.8.1}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_8.8.0.bb => redis_8.8.1.bb} (97%)

diff --git a/meta-oe/recipes-extended/redis/redis-8.8.0/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-8.8.1/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.8.0/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-8.8.1/0001-hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.8.0/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-8.8.1/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.8.0/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-8.8.1/0002-lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.8.0/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-8.8.1/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.8.0/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-8.8.1/0003-hack-to-force-use-of-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.8.0/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-8.8.1/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.8.0/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-8.8.1/0004-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.8.0/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-8.8.1/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.8.0/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-8.8.1/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.8.0/init-redis-server b/meta-oe/recipes-extended/redis/redis-8.8.1/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.8.0/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-8.8.1/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-8.8.0/redis.conf b/meta-oe/recipes-extended/redis/redis-8.8.1/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.8.0/redis.conf
rename to meta-oe/recipes-extended/redis/redis-8.8.1/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-8.8.0/redis.service b/meta-oe/recipes-extended/redis/redis-8.8.1/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.8.0/redis.service
rename to meta-oe/recipes-extended/redis/redis-8.8.1/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_8.8.0.bb b/meta-oe/recipes-extended/redis/redis_8.8.1.bb
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis_8.8.0.bb
rename to meta-oe/recipes-extended/redis/redis_8.8.1.bb
index f9d297a16f..09a7c3aeac 100644
--- a/meta-oe/recipes-extended/redis/redis_8.8.0.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.8.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
           "
-SRC_URI[sha256sum] = "88422181efb0c9c0abba332e3e391d409e1e13714b838931669235e5796f704b"
+SRC_URI[sha256sum] = "1d1e423c9c808de3cb01dd3300d2b8d305b7691382e31a847ec17b66d3157477"
 
 RPROVIDES:${PN} = "virtual-redis"
 

