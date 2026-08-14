Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946EBC5DF6E
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:21 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24402.1786747635516551035
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iu/K/uq9;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so1632584a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747635; x=1787352435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=699wWLdFNAKjfUKQdEfWkVBKikvJfZ5u9QHivnmMXV4=;
        b=iu/K/uq9lgsxPZ21G9VFBcn8xm+lZOJ/VJYgg61Pm0+NYCXEXEpsFNFHWQ5IK7pcM5
         57dg3ZB2vbBi+EXi9B55HUACw+lr4O/88a1LjA7eZriDNxIi3t8MdiGi93uqZr/lG5w4
         OoW4P1HCfSYmqeYyIWtPVzo9r8vFYJ7+Yp6Uxp5Hnj6zUoF6dxhLY2gNfb4G5jrH6NFj
         a09vkPa5D2C2mAO73LGWCicFvKhJ/NmqTydUq7XwnLfuDHlF0aixlpidiY/j0Y1WsyhA
         zrAqqdU11IPrBfH/YpTITFdHsRB8pFXLv2PwDgFyE8GCjFX2Ff6+bBVHFDNE/RrQdbN5
         RF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747635; x=1787352435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=699wWLdFNAKjfUKQdEfWkVBKikvJfZ5u9QHivnmMXV4=;
        b=oaf85BwSkbLcocbeewuTuLjaCmdiGWrWcgV1G2vcaHlFKsI1Ne8joLw7k4BTmgKUHx
         0wC4dxQXH5n+waEqMomuzHblfE6y9Y+UZyGHH2sY/UfUpItM7M9y2HZcpHn1g/zt6mgC
         dT0dtxLRYPS0oCWtL+XwJTbgIAfl7Vd8uLF78bVIn0sbGfUwPN7m9rsNZ1KTrkpMmt5v
         AsOGdJ94nSLzPxmiEm2TifaXJbv8x9DQNbjGuRgMJQ0mhIP1LhrmSsqT2iYUq/pQWGWu
         6C2AYQDBXCgbEXZvUaobR+Bqd0j/VNGOdZ/Y9G5lRZTfN8tKm53bc58JceV7rdKhtlP7
         vGnw==
X-Gm-Message-State: AOJu0Yx2Uwhx+IuhHymRkR/LVR5IHV0le7zZRSvokTs4mEDni/r2QhNP
	z9InbIRH1by78DsFZBWg3vro+Rvub536gkSVRSdQrDt1RF6XjKmW00cUXgXLSwHQ
X-Gm-Gg: AR+sD11mX+Nz0gJyhSyVLzFN/9DLZRWv9JGHJDHYQgHXhyF4BL96HxX+SLYoklk7r4R
	7VuwLCPvwYnkFHxMK8zPOiud865wQefKgVUCYNnD++VAsMvSSgmHLbZSnt+XEjXGrJFL9Fz9ae5
	Z/fgIsnxlBpzRF7gD+w6rkjk+NTOZDZMxjdN6o/uDA33HkA2lBtmJbRKTM8rRWBSiWqtmCX8hkB
	sHlTmulHXJiRQZ3ppO6Rx9IvvDCqfrU9r7ne9NzRO3ugae+/eS0j4BnutQKrsHiWLY4gNQudwZL
	pkk0nrNTbivp4YyaRkNoqQvLihUl1CpXrOnDjPMQZNvqdVRwxQHakz3H6tN4VAFlO/oMhP957nj
	PCGql/1PuNBJpb2SRelzQSSqerdKEJSdwO86iJm/vSy/uPtTaDWG7WiVyrZ7HalccoA38St6EWD
	L5/RT9Jz1N27qHPmWDNsOU3sY6pwkim6eVy/2LqqWYsQFvZssKp8/CQQZElUQTkASk7T39uT2p/
	gS6e+++tpkQtqGqlT6ilt1ysvRB2QgOoLcx1RQ1yVL4yleBvulrPoKHkpt4WPCrelnvYDSJuNuK
	yOU5ooZKEkmWhDqB+OrUCA4Mtpqc429gCxPGhZ6kj1UlSWgABwfDtzG/yaOYq4oTTWbQv9j67LI
	2JDdAwfgg44F0Ief9VJm7JcD45NfjYrsdeRwxcSXvZ2/Drg==
X-Received: by 2002:a05:6a20:430a:b0:3c3:c07b:5322 with SMTP id adf61e73a8af0-3cc71e7d6f0mr10019029637.34.1786747634828;
        Fri, 14 Aug 2026 15:47:14 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 081/109] redis: upgrade 8.8.1 -> 8.10.0
Date: Fri, 14 Aug 2026 15:45:07 -0700
Message-ID: <20260814224539.1523174-81-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129145

8.10.0's default "all"/"build" goal also builds the bundled modules
(redisbloom, redisearch, redisjson, redistimeseries), which pull in
their own vendored build systems and a python3 interpreter this
recipe has never needed. Restrict do_compile to the core server only,
the way scripts/build.sh does it internally (oe_runmake -C src all).
Rebase 0004-src-Do-not-reset-FINAL_LIBS.patch for the shifted context.

Build-verified for qemux86-64 (do_package_qa green).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...0001-hiredis-use-default-CC-if-it-is-set.patch |  0
 ...akefile-to-use-environment-build-setting.patch |  0
 .../0003-hack-to-force-use-of-libc-malloc.patch   |  0
 .../0004-src-Do-not-reset-FINAL_LIBS.patch        | 15 +++++++++------
 ..._SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |  0
 .../init-redis-server                             |  0
 .../{redis-8.8.1 => redis-8.10.0}/redis.conf      |  0
 .../{redis-8.8.1 => redis-8.10.0}/redis.service   |  0
 .../redis/{redis_8.8.1.bb => redis_8.10.0.bb}     | 10 +++++++++-
 9 files changed, 18 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis-8.8.1 => redis-8.10.0}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.8.1 => redis-8.10.0}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.8.1 => redis-8.10.0}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.8.1 => redis-8.10.0}/0004-src-Do-not-reset-FINAL_LIBS.patch (76%)
 rename meta-oe/recipes-extended/redis/{redis-8.8.1 => redis-8.10.0}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.8.1 => redis-8.10.0}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.8.1 => redis-8.10.0}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.8.1 => redis-8.10.0}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_8.8.1.bb => redis_8.10.0.bb} (88%)

diff --git a/meta-oe/recipes-extended/redis/redis-8.8.1/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-8.10.0/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.8.1/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.0/0001-hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.8.1/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-8.10.0/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.8.1/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.0/0002-lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.8.1/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-8.10.0/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.8.1/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.0/0003-hack-to-force-use-of-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.8.1/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-8.10.0/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 76%
rename from meta-oe/recipes-extended/redis/redis-8.8.1/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.0/0004-src-Do-not-reset-FINAL_LIBS.patch
index a8a13de83e..d6dff5f853 100644
--- a/meta-oe/recipes-extended/redis/redis-8.8.1/0004-src-Do-not-reset-FINAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis-8.10.0/0004-src-Do-not-reset-FINAL_LIBS.patch
@@ -15,20 +15,23 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Reworked for 8.0.0
 Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
 
+Rebased on 8.10.0: context shifted by 1 line (offset only).
+
 ---
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 5dbbefc..15fbe09 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -152,7 +152,7 @@ endif
-
+@@ -152,7 +152,7 @@
+ 
  FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
  FINAL_LDFLAGS=$(LDFLAGS) $(OPT) $(REDIS_LDFLAGS) $(DEBUG)
 -FINAL_LIBS=-lm
 +FINAL_LIBS+=-lm
- DEBUG=-g -ggdb
-
- # Linux ARM32 needs -latomic at linking time
+ 
+ # Replication compression (opt-in via BUILD_COMPRESSION=yes). When enabled the
+ # replication stream can be compressed with libzstd; when disabled libzstd is
+--
+2.34.1
diff --git a/meta-oe/recipes-extended/redis/redis-8.8.1/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-8.10.0/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.8.1/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.0/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.8.1/init-redis-server b/meta-oe/recipes-extended/redis/redis-8.10.0/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.8.1/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-8.10.0/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-8.8.1/redis.conf b/meta-oe/recipes-extended/redis/redis-8.10.0/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.8.1/redis.conf
rename to meta-oe/recipes-extended/redis/redis-8.10.0/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-8.8.1/redis.service b/meta-oe/recipes-extended/redis/redis-8.10.0/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.8.1/redis.service
rename to meta-oe/recipes-extended/redis/redis-8.10.0/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_8.8.1.bb b/meta-oe/recipes-extended/redis/redis_8.10.0.bb
similarity index 88%
rename from meta-oe/recipes-extended/redis/redis_8.8.1.bb
rename to meta-oe/recipes-extended/redis/redis_8.10.0.bb
index 09a7c3aeac..6176dc45be 100644
--- a/meta-oe/recipes-extended/redis/redis_8.8.1.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.10.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
           "
-SRC_URI[sha256sum] = "1d1e423c9c808de3cb01dd3300d2b8d305b7691382e31a847ec17b66d3157477"
+SRC_URI[sha256sum] = "f1baa4b28befd417aa6577ebeedde9e9fc7814cfcc299b2a6d2fd99ef7420a6c"
 
 RPROVIDES:${PN} = "virtual-redis"
 
@@ -47,6 +47,14 @@ do_compile:prepend() {
     oe_runmake -C deps hdr_histogram fpconv hiredis lua linenoise
 }
 
+# 8.10.0's default "all"/"build" goal also builds the bundled modules
+# (redisbloom, redisearch, redisjson, redistimeseries), which pull in their own
+# vendored build systems and a python3 interpreter this recipe has never needed.
+# Build the core server only, the way scripts/build.sh does it internally.
+do_compile() {
+    oe_runmake -C src all
+}
+
 do_install() {
     export PREFIX=${D}/${prefix}
     oe_runmake install

