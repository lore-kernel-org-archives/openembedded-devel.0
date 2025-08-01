Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1AAC87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 23:13:48 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.100698.1754090018609018177
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Aug 2025 16:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lb0F8/yE;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76b6422756fso2970691b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 16:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754090018; x=1754694818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/Mp4ImbUtFEnrWSoagtVJ4BEwTaSl9giFJGLN/gUg8=;
        b=lb0F8/yE+yLbo8mpmF7rKrJpXiHARf6TWJBGiItZU3xQtKfehchSUsKp+yTqGU6jmf
         FrwHrvGbHMCHLCsd2wj0kOKTNGFhxibI5H7ncTyLccgDdth0AEMD63b6Le7E+Y3EB12r
         f2aSVN1rkePyNuny2xGhqyHi1DYJBFcJ+pB5mvdPqKtSzZK7bE1mPHPaawJswY84XvwJ
         3Blc3GfS+izZMJ+tJyst2x0v+q/Ui7BkN9P+4LgZvdxdtgYbNiBujxWPTDFF1Nh00fuZ
         k5UPVSiuY7DirsJFouyOq8yyxYel/CZngHeRhcV9e6/BwnFV1x0m5wEOL2wN5pEv+Uxu
         Grow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754090018; x=1754694818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/Mp4ImbUtFEnrWSoagtVJ4BEwTaSl9giFJGLN/gUg8=;
        b=PMNvFeX4lCOcGg8EV15HpQ/tjRDCrO6XR0+379H0e85fLotTru9esdfb1jbkavi1IG
         j7wndAth/5qAplW3cD5g74MQvMLAsDlqO9ZwlpBXsbQwXj4fF1CJOxS+nv+PqPnyY43k
         Bih3kwHqoADfBTcDvSkyGAmRE+MXlIc2YJY+qyU2mqwFi/0olvHhbxna/HAa3yIPqWNY
         nNtDLtOdlPIO4A9t3Ven0T/gd7SQlyoPTFRZVlkxlMAP5rkZ1BttWGgRNA2FTKh7J7/N
         0fZkxVWHmYIgVGLC1KHIdm4Ng5hQIENxuOswboSrxGCzN1w361B4jD+F/kqKSjI5Gq2k
         T1BQ==
X-Gm-Message-State: AOJu0YzHw2lnkER3hJSjEdlZX1EQIeeNDiJkeqgA5EIDmYCjPfLEbI0E
	42kITCLUD4FsgBUt7iuN7UfHUCEVuwfziNO1Gpwcp+cOPiJ995p51GqJL/T77cJv5X4=
X-Gm-Gg: ASbGncsXOaEzNyVT4oQRdWoxnfzbHQ1bP+HI0AxjsR/Z8t3DIVjYJN7zH/fWZLNqR1M
	2YPXnd2BlnGspoHlaVWOPkvEnUxWN8L7L4xcda7DKbMVe4RPeG3sbX/iQE0dVni3Vf4CjhUsr9n
	3Qne5TNydSXcWHUVm3jKc21hHGBqL8EsGLzYDEeRI7R6M/D+jS6nKvl41U92IMYUOcWvz8vIYit
	GLJZqwy/Fey6v3kCk/U6AehRSFLQwl/gJUMytBPcarwMlYeXK6RoPg/dBMeWZ8Lot1+gVzWwHwv
	g6o5urd6bL/N2x9lEaaGwnSDzkqDYUCVyL9HRP2DGHIAYZP02swJu6hPKSE+rwDRA3MyADDFZb6
	OVrs0y+7onK75fSRtsjS8BE62
X-Google-Smtp-Source: AGHT+IHmnwrKXds5nVMKPPnqe61syPet8f1uZNxjmlmLvzGZzITal+/iZIrJz82VCG6GIOjh8lhE0Q==
X-Received: by 2002:a05:6a20:3ca1:b0:1ee:d418:f764 with SMTP id adf61e73a8af0-23df9848d3bmr2139641637.38.1754090017454;
        Fri, 01 Aug 2025 16:13:37 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b423d2f4fcesm2141884a12.33.2025.08.01.16.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 16:13:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] redis: Upgrade to 7.2.10
Date: Fri,  1 Aug 2025 16:13:30 -0700
Message-ID: <20250801231332.4167568-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801231332.4167568-1-raj.khem@gmail.com>
References: <20250801231332.4167568-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 23:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118824

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-hiredis-use-default-CC-if-it-is-set.patch     |  0
 ...ate-Makefile-to-use-environment-build-setting.patch |  0
 .../0003-hack-to-force-use-of-libc-malloc.patch        |  8 ++++----
 .../0004-src-Do-not-reset-FINAL_LIBS.patch             | 10 +++++-----
 ...-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |  0
 .../0006-Define-correct-gregs-for-RISCV32.patch        |  0
 .../{redis-7.2.8 => redis-7.2.10}/init-redis-server    |  0
 .../redis/{redis-7.2.8 => redis-7.2.10}/redis.conf     |  0
 .../redis/{redis-7.2.8 => redis-7.2.10}/redis.service  |  0
 .../redis/{redis_7.2.8.bb => redis_7.2.10.bb}          |  3 +--
 10 files changed, 10 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.10}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.10}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.10}/0003-hack-to-force-use-of-libc-malloc.patch (86%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.10}/0004-src-Do-not-reset-FINAL_LIBS.patch (79%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.10}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.10}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.10}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.10}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.10}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.8.bb => redis_7.2.10.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.10/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.10/0001-hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.10/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.10/0002-lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.10/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 86%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.10/0003-hack-to-force-use-of-libc-malloc.patch
index 1f97f9783d..8991d2d9bc 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.8/0003-hack-to-force-use-of-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.10/0003-hack-to-force-use-of-libc-malloc.patch
@@ -19,10 +19,10 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
  src/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-diff --git a/src/Makefile b/src/Makefile
-index ecbd275..39decee 100644
---- a/src/Makefile
-+++ b/src/Makefile
+Index: redis-7.2.10/src/Makefile
+===================================================================
+--- redis-7.2.10.orig/src/Makefile
++++ redis-7.2.10/src/Makefile
 @@ -13,7 +13,8 @@
  # Just use 'make dep', but this is only needed by developers.
  
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.10/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 79%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.10/0004-src-Do-not-reset-FINAL_LIBS.patch
index 974cf5169f..0513138b4e 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.8/0004-src-Do-not-reset-FINAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.10/0004-src-Do-not-reset-FINAL_LIBS.patch
@@ -15,11 +15,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/Makefile b/src/Makefile
-index 39decee..f5efe82 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -119,7 +119,7 @@ endif
+Index: redis-7.2.10/src/Makefile
+===================================================================
+--- redis-7.2.10.orig/src/Makefile
++++ redis-7.2.10/src/Makefile
+@@ -122,7 +122,7 @@ endif
  
  FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
  FINAL_LDFLAGS=$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-7.2.10/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.10/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.10/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.10/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.2.10/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.10/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/redis.conf b/meta-oe/recipes-extended/redis/redis-7.2.10/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.10/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.10/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.10/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.8.bb b/meta-oe/recipes-extended/redis/redis_7.2.10.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.2.8.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.10.bb
index 3c4d84085b..ecdb39c6f3 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.10.bb
@@ -17,8 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
           "
-
-SRC_URI[sha256sum] = "6be4fdfcdb2e5ac91454438246d00842d2671f792673390e742dfcaf1bf01574"
+SRC_URI[sha256sum] = "e576ad54bc53770649c556933ecd555b975e3dac422e46356102436a437b43c7"
 
 RPROVIDES:${PN} = "virtual-redis"
 

