Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83022F42115
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 18:17:59 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1936.1776277073108697642
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 11:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iG67AWPM;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: mail2szahir@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3591cc98871so3338594a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 11:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776277072; x=1776881872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oyYSL5wcNzpVS5gyF9WEGXsoGuPGcQLJVZNVYO1mTu8=;
        b=iG67AWPMeQ24N8lmcH2gwbigkbm/ahdh5a/c9kIBe8WZS9y669+27NYd1dRPFE0zbD
         8oYH6KMqT1nrX51Hn81hSmFaIYMjB+4ClewHE4IXG8eG1nqVcWUCmsY6EXZbpJLk/MMb
         D7Ntdiv2wtGqRnWCc4A+OSkSVNIN3J5ufXTQQHVGoX+TP3cto0Lww/IkISMUaQrDzeBh
         7r7jpr5ftyqyRVyzsdbQfKyVIXs+6tvrD7OrlWMpQJUtaQSCsCiRpknTv70EcoigUzP4
         Z8NVw/csxT8FE/6Xoi+Bl2WD6NqRsQeJBJAQ+yRK4PJvHDD3zPyTVD4EpHkkZBaLFBpx
         Thrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776277072; x=1776881872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyYSL5wcNzpVS5gyF9WEGXsoGuPGcQLJVZNVYO1mTu8=;
        b=QjQU5E7KGAZ9sfp7KFOjOnMHjBPZMFzRHwAf3BrHNdx66Mjyvdno7iO001DYK5dg5X
         z3oobUdUzubNqLP/wWKP2qYl/f2u/q9f8q/WJOFh0zZw0dJ6qamzyGx2sRmlwQbzy5v9
         sO4PJKyeKt/sA9uPSxahRRwtVLx61CSJdWMSBKiRE6c7ZQZ8bI/AhsnJYFAUWn9AaU5N
         yRqKGYyqjf4XVkKtQWZ1enFJNsrd/khbE+YO22h211CU1dqcHKe12r6n+NrSqQ2XbRbE
         QVMHo2vjNHSiugG7OcKXm7alhqfkfAgYRVGCTpW43RB5e7GVw9rsjBGNy9hsxzHvaya3
         u2lg==
X-Gm-Message-State: AOJu0Yyu9hz5LE28iLj+XNWZyTFn58WJoXClL75oybJGWNEnWM3XJh2Z
	ZDkpmRyzu5b6ZxKEuRPxA23yUr5ClPHY+CkimwTEBREPtrx1lEgaOK7aMSOOIA==
X-Gm-Gg: AeBDievmLt5htTbsQY/4/aB9BLAmI7GgM5ima9NTnTxw5h5+FZJzGS/xuXgGTj6u7UL
	Qi4ZF/fZVx9S17lO+sA1VNcj2qh4bCxO+e61anB7ceJopqlYGMKoFqrFhKZCMO98vfIej0AOItm
	IADL0KJ1j9U+n7HMDyhROn5BaxfP3yNl61KFonNbYAWUAsAlhXAXJC46/moxznHvbZE3cEKylYO
	FyQvMIkELIeCtwF4jFdMS11I44p7bZnfKQgZWvz8+MuLeIauwy5JAR5hVfxnul/QlUR36o4vYE8
	CrgScp3SeupK9w184OjZL7aAYYrr8DttTVCEk5r3qfYdtoqMKSjYSAEKumTsg+nWa+u4zvZeRrY
	gp5TVhmoyKWy36Rpm1VBYpgybqRJGmQMAFcXQZHI2QMdYWVBFSucUxYqmxrtU26aq2QrQx88dqL
	XJiM+deF/cNS7v0s2q6s2O3EStDT5oKjuuWr3xkcal1Bf33A==
X-Received: by 2002:a17:90b:1a8f:b0:359:83d3:27d3 with SMTP id 98e67ed59e1d1-35e4274e363mr18703903a91.2.1776277072189;
        Wed, 15 Apr 2026 11:17:52 -0700 (PDT)
Received: from L-17367L.kpit.com ([49.47.218.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fd20d0eb5sm4138857a91.12.2026.04.15.11.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:17:51 -0700 (PDT)
From: Zahir Hussain <mail2szahir@gmail.com>
X-Google-Original-From: Zahir Hussain <zahir.basha@partner.bmwgroup.com>
To: openembedded-devel@lists.openembedded.org,
	zahir.basha@kpit.com
Cc: mail2szahir@gmail.com
Subject: [OE-core][scarthgap][PATCH] rocksdb: packageconfig knob for set static library option
Date: Wed, 15 Apr 2026 23:46:45 +0530
Message-Id: <20260415181645.1191232-1-zahir.basha@partner.bmwgroup.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 18:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126369

From: Zahir Hussain <zahir.basha@kpit.com>

Adding PACKAGECONFIG knob for enable/disable the static library option

It is just a follow-up changes of previous commit
https://git.openembedded.org/meta-openembedded/commit/?h=scarthgap&id=72018ca1b1a471226917e8246e8bbf9a374ccf97
and also this changes are already accepted and integrated in kirkstone branch.

Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
index fae54fdba4..a55a8eb59b 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
@@ -36,6 +36,7 @@ PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
 PACKAGECONFIG[zstd] = "-DWITH_ZSTD=ON,-DWITH_ZSTD=OFF,zstd"
 PACKAGECONFIG[lite] = "-DROCKSDB_LITE=ON,-DROCKSDB_LITE=OFF"
 PACKAGECONFIG[gflags] = "-DWITH_GFLAGS=ON,-DWITH_GFLAGS=OFF,gflags"
+PACKAGECONFIG[rocksdb_static] = "-DROCKSDB_BUILD_STATIC=ON, -DROCKSDB_BUILD_STATIC=OFF"
 
 # Tools and tests currently don't compile on armv5 so we disable them
 EXTRA_OECMAKE = "\
@@ -44,7 +45,6 @@ EXTRA_OECMAKE = "\
     -DWITH_BENCHMARK_TOOLS=OFF \
     -DWITH_TOOLS=OFF \
     -DFAIL_ON_WARNINGS=OFF \
-    -DROCKSDB_BUILD_STATIC=OFF \
 "
 
 CXXFLAGS += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_NO_INLINE_HINTS', '', d)}"
-- 
2.34.1


