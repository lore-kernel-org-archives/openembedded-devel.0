Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8F2CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 20:35:58 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.2748.1759782949709421223
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 13:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m4iCBVi4;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3d50882cc2so1029558966b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 13:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759782948; x=1760387748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b51yxWgCxgyAIperDlXOJYUPOu+PobmgNwy9V+alvfQ=;
        b=m4iCBVi4aavXJMS8ryP5g1figB4dDLp4xTuYYqnNCUBP5X+Uh6H6vtdyiY78wugcbM
         uIWvcJy5tI5FKfW1Gxqtu/5bgI/+h0ash1ME9+2exCHBtXtUoIJkQw5S80CP79aJrDxK
         bx4X/uxvjTTJrzIV9rj+MAG6ueNmobkTzsMz/lbeMcKkoOkZmAsYcDMe07o5cDnn+HBT
         xl2FgQ1ILqTbmB8H8Rv9FmzlH/RjKq6W+DyodFi0wWGZ0I18v0f6TNLFRyXL1ZR/7ncs
         vaqiGhVkbIp5pDevrj9joJBKu5ljXtexV0euhSSFZ89SvcOwxvjRBhj4FXyrwt21pcXE
         fiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759782948; x=1760387748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b51yxWgCxgyAIperDlXOJYUPOu+PobmgNwy9V+alvfQ=;
        b=VWlTN+ZhNWYz9OVurh60Q9qWA3OvNddSBltTQpmK5HKvUR3QjtOuDB6aNZe5XoZZD3
         sC7Rc2izkmpUDUrZwQ+tcivND2Ajb3B2WWx2bcGKYOT6hMLj+c07D3dWpNN3pzc+36qi
         4+rAa7ZoGe2WqBKQVtpi2oGgKEqLTCbjehu5puFFnpnLndPt2fN0F1lrzQGycnaHfsMA
         v50eSQpHFbLyIuPmMn7EjjP1K2L3uX851jQtXwMWoWNUP8HmoyB9PfGXVPVL047DznZy
         Xd/33XdftzQQPOt4ZKsaKpUxvjtcQPn3nKmDSV9pCcJWzwT4Sjl5M908Hkj4RLbl9J0Q
         8loA==
X-Gm-Message-State: AOJu0YwI6ck7yzzCvXXJS7YBRuaMykYanlroUVei62D9gAkTtHiOyKee
	ut8zFAJTT+fYy1TwP1lzNFXtieZHDgoAuPwTxoqAtrUqoIl2CCL8RaIeOF5tvA==
X-Gm-Gg: ASbGncu2y3MjIfuLqM/teLj/EALZ2E0in9CgWntDbBCRJ+KA/DoNQd/keaKGt/RHjX0
	74DuFnHQfTtIvn6S1LZZov5wazVa8LG5ty/Xm9PRCr/j3duIr9fVyIW12azMNJdzr6zZOtAhOCw
	T54Wf+NOHUJDojoIdifj+oRw3ck9W33c3ZYa2i0BAwWD7LzUfB+ZiqfSqv1qMLUltkgHf/Zu/8G
	MCodh4stjnDgJ1VodwyZ0tWewECYbuM7xcgVErbhnUOGQ8ZyfLWIPn0kncK9XWFVWwcOU0j6DvS
	uS0OvnLUJQgNvdZIHyJZmxQeVvvneclpZw6VT/rRB5X5c1BKdYwUx8RWXB47VFP1n3XxnUuYIVq
	3m4EOPPLrCSXkyh9Fd4kvBPDTLYlP1JCGPyTxfgoyXNm7
X-Google-Smtp-Source: AGHT+IHXiBd6Ftod8faxM6Xjia66X+l+yfTj33mylJZg5j1rexWxCc3urWkIzy28M8SGj/Pq2lG87g==
X-Received: by 2002:a17:907:2d1f:b0:b3f:cc6d:e0a8 with SMTP id a640c23a62f3a-b49c304d343mr1902327566b.17.1759782947781;
        Mon, 06 Oct 2025 13:35:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9bd7sm1236570166b.3.2025.10.06.13.35.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 13:35:47 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] redis: upgrade 7.2.10 -> 7.2.11
Date: Mon,  6 Oct 2025 22:35:46 +0200
Message-ID: <20251006203546.2189796-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 20:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120316

Changelog:
(CVE-2025-49844) A Lua script may lead to remote code execution
(CVE-2025-46817) A Lua script may lead to integer overflow and potential RCE
(CVE-2025-46818) A Lua script can be executed in the context of another user
(CVE-2025-46819) LUA out-of-bound read

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-hiredis-use-default-CC-if-it-is-set.patch              | 0
 ...2-lua-update-Makefile-to-use-environment-build-setting.patch | 0
 .../0003-hack-to-force-use-of-libc-malloc.patch                 | 0
 .../0004-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 ...05-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 0
 .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
 .../redis/{redis-7.2.10 => redis-7.2.11}/init-redis-server      | 0
 .../redis/{redis-7.2.10 => redis-7.2.11}/redis.conf             | 0
 .../redis/{redis-7.2.10 => redis-7.2.11}/redis.service          | 0
 .../recipes-extended/redis/{redis_7.2.10.bb => redis_7.2.11.bb} | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.10 => redis-7.2.11}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.10 => redis-7.2.11}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.10 => redis-7.2.11}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.10 => redis-7.2.11}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.10 => redis-7.2.11}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.10 => redis-7.2.11}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.10 => redis-7.2.11}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.10 => redis-7.2.11}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.10 => redis-7.2.11}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.10.bb => redis_7.2.11.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.10/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.11/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.10/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.11/0001-hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.10/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.11/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.10/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.11/0002-lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.10/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.11/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.10/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.11/0003-hack-to-force-use-of-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.10/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.11/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.10/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.11/0004-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.10/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-7.2.11/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.10/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.11/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.10/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.11/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.10/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.11/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.10/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.2.11/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.10/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.11/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.10/redis.conf b/meta-oe/recipes-extended/redis/redis-7.2.11/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.10/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.11/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.10/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.11/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.10/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.11/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.10.bb b/meta-oe/recipes-extended/redis/redis_7.2.11.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.2.10.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.11.bb
index f15e07191d..5aea249133 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.10.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.11.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
           "
-SRC_URI[sha256sum] = "e576ad54bc53770649c556933ecd555b975e3dac422e46356102436a437b43c7"
+SRC_URI[sha256sum] = "2f9886eca68d30114ad6a01da65631f8007d802fd3e6c9fac711251e6390323d"
 
 RPROVIDES:${PN} = "virtual-redis"
 

