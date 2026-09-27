Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7151FC98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:34 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35368.1790506291255283348
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bMzsdPd8;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86b90133ae8so968950b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506291; x=1791111091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VeGnLxzTehC+Kt07acKxQW3QGdv789LaSAJXWGfJjwI=;
        b=bMzsdPd8yyNiMOJfxCkYtZ7H+uMPWuMmhenTOlfsBysAbTXJSGS/r0cqYiq5RmoF8N
         8atmnFTQX5cYGO3PMT2nLZ5PmbzGzTJ2+vwpVYGpjqPunA/ilOw+lbeU/RRQ2O0bRv7X
         qk4wQ619O2/FbDpFtqTMxCOhRbxxYx8mptJ7ELk6ByEdZBmdLN/6nsM2xaaSGryfbWXA
         LFITFKeUCvMaAdOa7nXZHDgK/sBR4RSCyq5S0og1ZI2JO8SQ5cLtGCiYZtUe/86Y7cLT
         dDWzKXqiNe9e2fKo/vU2u+WzE8uxDW+AR8oLUBev2RV6vMeDfx4UlayCw0YTKx8RonzW
         t1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506291; x=1791111091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VeGnLxzTehC+Kt07acKxQW3QGdv789LaSAJXWGfJjwI=;
        b=gEcMHZZqN6HXSIPFju+UVAQk5b8ymQTNtBa39SERnll5CySry1ZLa9DZXibhqgBizz
         afrtzc4Qyka/QPIgjHmlLrUflKhGWEjEPUHimdUEzfY+5zJBdTcRzufnYHtOV4XGot76
         NXW9L8X4t9b4lLj5AFh2uX/SgEEm8x8MngzziLU03hECqGeTRynkNEdp/Pb9Lnk2/XDa
         3KGbyB1tWXG2W/duwel0oJMUouN6jS6DULOj2PPYsXqQUIFHGx+YikfrIvdMzmApWHTO
         Qgd//tfqlagAkurKWpVSmGnuk2KGCgTdODSAuG7nFe/m0mreX/zcgaSdaTB1xG9CEe5V
         VpUQ==
X-Gm-Message-State: AFuF++miF2TpVB6Yy9Mipdn3LeZ1wsi6bG9ImM++KJuWqnmdiLHgoMMe
	HWfLD0vkscauCED0wDKW9rjG7s/SbwjKtPEswKUpsyL+Ub05J2QZgzAmAyJCww==
X-Gm-Gg: AYBFou1a+dZzm6n1YmtDVK1IMWep0cMUrGi0why4wTMcfocWj8B52zR2v3nFh4eeK9O
	0LR9WnyGD0AAxEYS8yTXj4uwDeKycW8i5u8wrWhj1envf+OHHbISfxUVUAAoDo77fnY7BS/oOyz
	CsA1xlJb++1NUJBnO4zp2p3uhXi73npac41k+VJUYiAd5x6v2GLQeryo1HFkEDxeVZnX0+pZVOh
	yB7R9CW5PxcV/QiN8OiBQtDMLXQwbr4Ml+Iy3Hw/xDYzRcF7GLS3tAqwY7NecPeO/5bV4zNZfgN
	kmdob7uyqc25z94BP2nNU73FrjuymPVoLMTB9U/V0Fpa4TSwCy/CBqaJvnbBjGJuJN61kOEgRxz
	BVThBvJUn3MjK2WQcMdIHKIYrlgThY/anTBfbNZleW0LHo6gwa4OfiSaYa70nSs6DrEjJ2qjD5+
	hcb87f9op/CaonoF4IAyUd5j+ymEkE0JW0WjCCEke4EKa7NU1l+PLdlFZCtiaOH/R1EXn6DbyBJ
	Hn3PBKMGWH6VHAhEIq7N9s=
X-Received: by 2002:a05:6a00:f96:b0:87a:23b3:1064 with SMTP id d2e1a72fcca58-87e98d891d4mr9017680b3a.11.1790506290602;
        Sun, 27 Sep 2026 03:51:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 29/35] redis: upgrade 8.10.1 -> 8.10.2
Date: Sun, 27 Sep 2026 23:49:56 +1300
Message-ID: <20260927105002.1832451-29-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130363

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/redis/redis/releases/tag/8.10.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-hiredis-use-default-CC-if-it-is-set.patch              | 0
 ...2-lua-update-Makefile-to-use-environment-build-setting.patch | 0
 .../0003-hack-to-force-use-of-libc-malloc.patch                 | 0
 .../0004-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 ...05-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 0
 ...06-src-Makefile-do-not-build-the-test-modules-from-all.patch | 0
 .../redis/{redis-8.10.1 => redis-8.10.2}/init-redis-server      | 0
 .../redis/{redis-8.10.1 => redis-8.10.2}/redis.conf             | 0
 .../redis/{redis-8.10.1 => redis-8.10.2}/redis.service          | 0
 .../recipes-extended/redis/{redis_8.10.1.bb => redis_8.10.2.bb} | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-8.10.1 => redis-8.10.2}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.1 => redis-8.10.2}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.1 => redis-8.10.2}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.1 => redis-8.10.2}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.1 => redis-8.10.2}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.1 => redis-8.10.2}/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.1 => redis-8.10.2}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.1 => redis-8.10.2}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.1 => redis-8.10.2}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_8.10.1.bb => redis_8.10.2.bb} (98%)

diff --git a/meta-oe/recipes-extended/redis/redis-8.10.1/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-8.10.2/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.1/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.2/0001-hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.1/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-8.10.2/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.1/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.2/0002-lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.1/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-8.10.2/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.1/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.2/0003-hack-to-force-use-of-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.1/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-8.10.2/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.1/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.2/0004-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.1/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-8.10.2/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.1/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.2/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.1/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch b/meta-oe/recipes-extended/redis/redis-8.10.2/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.1/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.2/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.1/init-redis-server b/meta-oe/recipes-extended/redis/redis-8.10.2/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.1/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-8.10.2/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.1/redis.conf b/meta-oe/recipes-extended/redis/redis-8.10.2/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.1/redis.conf
rename to meta-oe/recipes-extended/redis/redis-8.10.2/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.1/redis.service b/meta-oe/recipes-extended/redis/redis-8.10.2/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.1/redis.service
rename to meta-oe/recipes-extended/redis/redis-8.10.2/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_8.10.1.bb b/meta-oe/recipes-extended/redis/redis_8.10.2.bb
similarity index 98%
rename from meta-oe/recipes-extended/redis/redis_8.10.1.bb
rename to meta-oe/recipes-extended/redis/redis_8.10.2.bb
index 40e92dc318..d24f6825d1 100644
--- a/meta-oe/recipes-extended/redis/redis_8.10.1.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.10.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-src-Makefile-do-not-build-the-test-modules-from-all.patch \
           "
-SRC_URI[sha256sum] = "60166c95ab7aedaa9dfe516de685be0a4dd87be95ded59ba429df14c13f1b663"
+SRC_URI[sha256sum] = "b9ffee226b5eecdba98a679260dad764b2a4ebd90dce4ad5ac9e9f3eef9c02b3"
 
 RPROVIDES:${PN} = "virtual-redis"
 

