Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21046CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 09:42:38 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16200.1780479742586552334
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 02:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=isfQ3eFG;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36c68964315so2411308a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 02:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780479742; x=1781084542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCHzXw4QdKgiMX3dtpdl7AqYAdzx/GgrWrZJ/Hl4VwM=;
        b=isfQ3eFGQ2DcE0D/CHNB8Xl6jJEbtw0I+tdUS9J5yV1yQD4KFMj0gjqAcijA2HVJWF
         I9CKRkELQgX7HPEXvRE62CK1yQ2Ijm2df3M3XsX6EJ5zE+5o2JuctoS+Y/yxy7rJ/eX1
         ExAk53ckNXjhca0NuYkcfQ5vm3ClTHoinv3J6X+r75RxKJFGQJJ9mGZv4hTORq4ZKLSo
         WmOzNgwBpmXZ0dnm02DHVvDrE3TF1NFBtWhkDPE/hCtAEk6PYEUdnuNjV18/GQKscWmA
         HatLXR/JpdWWxzzLAN7Qv2Ar0+1hRy7A1CeZn0plLj+lOKZNEFZjHo7Ye608J2YbfPms
         d5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780479742; x=1781084542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BCHzXw4QdKgiMX3dtpdl7AqYAdzx/GgrWrZJ/Hl4VwM=;
        b=FKkpGv6sW1O1PXsRnhPLHOX/K2CuYW0kDMHRDtGqBfXVlEpTLAWgk3wzsLM/aFv6tK
         FjqfG8YS9tKJyiMTEpd/aZk8g/k8y0FBr23bV/rDy23ykr7B5aIXgWrUn5RQUNpRZFbI
         gIv3Z5/42UeDqxANxeIx+zRgN9tDyeWrf4q/VJhuE59mckl7KehkQppqOJ5AxJqfLrWI
         GdSLjXv2x1zRGwIWmLO8RxYeZeGHOMJmPdRLcRMpo0RjusUVQGuCoT4aXZFBZROhlJ/h
         ey46vwAh5H8GW5WHAQse3fs7bKzI2Gf91k7iA08tnUoexu1/Y71syKEkijk3qAysQRxa
         W1fw==
X-Gm-Message-State: AOJu0YxDhZPquXcfqE+TSXgkneHoj6E4nGbmdw6+UCHKl/F0p/kSp8tv
	ChQaQSdKvHMMGVVj3fv27fQ+f6Kc3g8sByLXB/3tubfEhj+B9MDLwnydZGmDsg==
X-Gm-Gg: Acq92OHFDPnFSRnGVrwYOAM2H5+qXsvr6O0voa1aY1hQpolFilL1TCiT0sxoVTIZ42l
	8x7IJgmsvolgqCv+870TRMGOtAu3kPd0zsTUe6m9cO5U3WJNrd0oTGdeWeUbyG0Oy3CYZAHBHw2
	gDDV4MCu2wI1sqvlQftLfCdPC7IwtaomfRZ+01QLrXD9xZbOG+4bVmiNLw3vH1HgAUTIvtBCP6R
	o1nHJLLkFKCb7/q0sYHdPkCex9AiGabOv5vr3tD4LDAK4xro6o9eMInlBvdrnY2Y2vAYaXxg8BX
	yuQ/OCw6GQgs32rT9nKeE0Dt7VRh8HkcLK+UedrPKyJUSH4khayuCVNaExJ1UB3EuhEeAWuHLif
	BdBOYKXYquDwTdXcxAj3M8pChN6BDK19h7AXI/STsy9ZpuwfFzyQ/2H3cOpV2vD8KyDQWPnFjyz
	htVzKWsl8R3dFbvu+zlbLe8EElalMnJo6HUuQUC2RoZuod4JY=
X-Received: by 2002:a17:902:d592:b0:2bd:a529:4b5e with SMTP id d9443c01a7336-2c1644dc8f7mr26756705ad.41.1780479741867;
        Wed, 03 Jun 2026 02:42:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm19660035ad.52.2026.06.03.02.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 02:42:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/3] redis: upgrade 7.2.12 -> 7.2.14
Date: Wed,  3 Jun 2026 21:42:07 +1200
Message-ID: <20260603094207.218632-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603094207.218632-1-ankur.tyagi85@gmail.com>
References: <20260603094207.218632-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 09:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127379

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Bug and security fix release
https://github.com/redis/redis/releases/tag/7.2.13
https://github.com/redis/redis/releases/tag/7.2.14

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-hiredis-use-default-CC-if-it-is-set.patch              | 0
 ...2-lua-update-Makefile-to-use-environment-build-setting.patch | 0
 .../0003-hack-to-force-use-of-libc-malloc.patch                 | 0
 .../0004-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 ...05-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 0
 .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
 .../redis/{redis-7.2.12 => redis-7.2.14}/init-redis-server      | 0
 .../redis/{redis-7.2.12 => redis-7.2.14}/redis.conf             | 0
 .../redis/{redis-7.2.12 => redis-7.2.14}/redis.service          | 0
 .../recipes-extended/redis/{redis_7.2.12.bb => redis_7.2.14.bb} | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.14}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.14}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.14}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.14}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.14}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.14}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.14}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.14}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.14}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.12.bb => redis_7.2.14.bb} (97%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.14/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.14/0001-hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.14/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.14/0002-lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.14/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.14/0003-hack-to-force-use-of-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.14/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.14/0004-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-7.2.14/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.14/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.14/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.14/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.2.14/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.14/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/redis.conf b/meta-oe/recipes-extended/redis/redis-7.2.14/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.14/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.14/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.14/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.14.bb
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis_7.2.12.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.14.bb
index 2b4087a74b..93235e3707 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.14.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
           "
-SRC_URI[sha256sum] = "97c60478a7c777ac914ca9d87a7e88ba265926456107e758c62d8f971d0196bc"
+SRC_URI[sha256sum] = "21326da3f66c0aead4c8204c0ac52ff905337a77cadd169f75ac22835ea30025"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
 

