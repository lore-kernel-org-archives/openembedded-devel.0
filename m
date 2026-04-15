Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3FB8F42139
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 18:25:30 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2034.1776277523358828470
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 11:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bKF7UyWY;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: mail2szahir@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35fb7f51171so3244395a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 11:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776277522; x=1776882322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KCdmTijo5diJs/0QagulzhZM3OLMFIIDVpzMub7R/7U=;
        b=bKF7UyWYSPIQUHgm79TpU73gZYsx2D54Pm2r0GJlimPsUFZ2UnEFEKR6LiHynQbgtP
         tUG+a4LAp9GadFwocbUtZFPI9j7ckf0pSV31K0ALz8p0fqOyDZTvxqn7hsvAA0uIwZ+N
         MHFU8upkuz3/lWSevJnCMqy+8s9U6eNFrQZ8lvVJrhLjYqW83X+imHKdLBWHiUh5dVPz
         VYqno17zxiQUXMGD6vuC/m366DQTyPoUK6XdPL8fNzdtQPd0EWCRGWlKIfhl4y4Kjo+L
         9wax7u5L6mN4Cj59nKwholDroXvyAWTF9t1nB86uwk0RtSM8+EW+0cUzBSuQ8uSrlVkn
         FMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776277522; x=1776882322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCdmTijo5diJs/0QagulzhZM3OLMFIIDVpzMub7R/7U=;
        b=KtJU9MlvjmSVXD9RJXWNbAYrz8zVZAxd+9m5E4ptBWrfBDOOKHvjx+T+hTqxll18N6
         mLE5XY+NDk/TetWutiZ9beCfAoN5Y/Z13Wb8JhL5eYAXPgRtb4bKAukuDqpf5QZAe5zw
         07+ZyaSxNOxaNv0W/5RUMu0Bl1H0uqPEyYltYi0erV6BO2qoQUN2u0X8An03kvvDk4GR
         dvptk8utTsRbvbBe7PIw44gEkW77JHPbehu/4YibFJREMhGdIIb9AB/ZIFdqKYQ9YEw/
         yEv3G+Mc7FtNARMEKfRZarpaTxFzWldOgPdrvx9CH1jwIMnaOWcr8SnzPyVpZcUi4Unc
         xXUw==
X-Gm-Message-State: AOJu0Yzyf+bG8iXZ8h3ReirTWsZ7WUBuqWlZtfdk3kp7vQ4tnaOMUQHj
	yKm5jSnI+nLeALoqeuY3ExAlbwkawjwevmpVJFoey++uh5BJcm+VfKS2X5v3ow==
X-Gm-Gg: AeBDiesB16kgNLf8QpxmSVS10O1tZfopKUVh5qQFZJhw/WlgTE3ZtZ8P6IzVHieNsKv
	EELw7uEi590qtd4z1qgjjacgtkZKA6PteDoF0OAMmy2J/hjHjwDJjJ6OVUFHrs8QO6LNK3BftPb
	4RpNP4s3pEhBwXCOSQd7RrY5kbeeOURUCu28yTEelhcd9pUzM31s8Ag9X1Upo6iSkMuRtXzWV+3
	Lqs6q/hkBXkCBESA47WZcFwanRV72yexW+3nQUELrZItmKny6wk+nlIvQgvxhquaCKbJEREUDq3
	CieK0EeW3GdNj6v4LV7NKMw4sM00iyRC0deaFgUjVQDYuuoWfrgMk2AIXyo0UjAWywcWs4byWol
	6cYB9ySRtMaZzEUCAb4dy4uhGZU5WRX+S/xq6h5bDmaRO6xkNCYed/SSI4UxLNCOm6J8yw5uhkh
	0EL67VO4UrW5HF8g+4tnwASN5F4c5PbEwuI9zrRiyohKqKxw==
X-Received: by 2002:a17:90b:3c48:b0:35b:e551:e776 with SMTP id 98e67ed59e1d1-35e42869cbdmr24368367a91.27.1776277522240;
        Wed, 15 Apr 2026 11:25:22 -0700 (PDT)
Received: from L-17367L.kpit.com ([49.47.218.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79581bad89sm2088262a12.25.2026.04.15.11.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:25:21 -0700 (PDT)
From: Zahir Hussain <mail2szahir@gmail.com>
X-Google-Original-From: Zahir Hussain <zahir.basha@partner.bmwgroup.com>
To: openembedded-devel@lists.openembedded.org,
	zahir.basha@kpit.com
Cc: mail2szahir@gmail.com
Subject: [meta-oe][master][PATCH] rocksdb: packageconfig knob for set static library option
Date: Wed, 15 Apr 2026 23:54:17 +0530
Message-Id: <20260415182417.1196014-1-zahir.basha@partner.bmwgroup.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 18:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126371

From: Zahir Hussain <zahir.basha@kpit.com>

Adding PACKAGECONFIG knob for enable/disable the static library option

it is just a follow-up changes of previous commit
https://git.openembedded.org/meta-openembedded/commit/?id=233079a41caded6b68972317f01dc09435ba1ae0
and also this changes are already accepted and integrated in kirkstone branch.

Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_10.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_10.10.1.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_10.10.1.bb
index cc0e887ea5..b810911b98 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_10.10.1.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_10.10.1.bb
@@ -41,6 +41,7 @@ PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
 PACKAGECONFIG[zstd] = "-DWITH_ZSTD=ON,-DWITH_ZSTD=OFF,zstd"
 PACKAGECONFIG[liburing] = "-DWITH_LIBURING=ON,-DWITH_LIBURING=OFF,liburing"
 PACKAGECONFIG[gflags] = "-DWITH_GFLAGS=ON,-DWITH_GFLAGS=OFF,gflags"
+PACKAGECONFIG[rocksdb_static] = "-DROCKSDB_BUILD_STATIC=ON, -DROCKSDB_BUILD_STATIC=OFF"
 
 # Tools and tests currently don't compile on armv5 so we disable them
 EXTRA_OECMAKE = "\
@@ -49,7 +50,6 @@ EXTRA_OECMAKE = "\
     -DWITH_BENCHMARK_TOOLS=OFF \
     -DWITH_TOOLS=OFF \
     -DFAIL_ON_WARNINGS=OFF \
-    -DROCKSDB_BUILD_STATIC=OFF \
 "
 
 CXXFLAGS += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_NO_INLINE_HINTS', '', d)}"
-- 
2.34.1


