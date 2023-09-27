Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CECE810BA
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 08:42:58 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.13087.1695804177644460083
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 01:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E63ZxSxl;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso76423485e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 01:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695804175; x=1696408975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGq/gTXzgs6eu+wttpcXR8qZ9IdmIuBrtSQFWgRcytI=;
        b=E63ZxSxlVIyb8eO6YhBTy9VfeWWlptaGJx893ucW4/hURxV5U285fB7WDl22QucFd9
         hSJD5yaox5Fn9pyiQFYaNQ3zxqk7/kLJxZLRdll36NaD2Kzqtyan+mHoixY7wWvmenG/
         ravgSpqgEX9u0RK7jpwyQQTi5nvMJl5y+0kSBRBeWIrKOWox1V26ysF3NQzw1r06en6V
         UTmakpTofhWfunDQF+R+2wUOuU0eASYjfv5c7LHbcCzppHwvjwn7Nhmln4qibPMG0iPB
         ouHPitiDVtyH5AmbLcezPcIp4HuYvJ+VRfUXt6uNiqiDtuFsecImbeDk1Gbqhl/Kx7yF
         NkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804175; x=1696408975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGq/gTXzgs6eu+wttpcXR8qZ9IdmIuBrtSQFWgRcytI=;
        b=sbkUIA6gmpTr5fyxDZZomapiJSByc8rUT3Ahe01KOl/tQ/cSADN8b8aHlYWUiMDqBX
         aAlciK6WjQ+53M/tdIvdqDlE8mSuEfPfWCamUecyynvZZo9fJTqA8vml/Tx9yxRt6og8
         EJhXhkJh4kzyQzy74gIX4+zNlyyhHS28vOafmtBCwbvmhm9/LqmDRZKLwBaW78/6l14x
         epOl/BepYwnKuLrLrJ4iCAU/D2hL2nePc0Jakc4TOjdZ8DQWWtP2CX5AaM4tk637oaJU
         b3cTnICIS/jWwobpYC3vvK1KBcr7Kr4BNnKcQ4PrPIkE/qBaEyu6IKfaP5TJXHeNeK4b
         5IZg==
X-Gm-Message-State: AOJu0YyotDNllJzHi+S4ni3Wa3+B7zMDHdjMzqiPdP6vHSlwi1eRO4Xs
	KVl9Dqhw9XiMXPCG453BrybxiYAADFE=
X-Google-Smtp-Source: AGHT+IGBJQpinxLFupEl0on66ssFA3esvswvKZ7KXy4zsdvZsm8jCQZfs+TmOiKdiDwJS8Z04nRhWA==
X-Received: by 2002:a05:600c:210d:b0:405:3466:6b8 with SMTP id u13-20020a05600c210d00b00405346606b8mr1586088wml.12.1695804175452;
        Wed, 27 Sep 2023 01:42:55 -0700 (PDT)
Received: from firmware-builder.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc858000000b004030c778396sm20008616wml.4.2023.09.27.01.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:42:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 9/9] mariadb: add missing <cstdint> in rocksdb string_util.h
Date: Wed, 27 Sep 2023 10:42:42 +0200
Message-Id: <20230927084242.1195772-10-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927084242.1195772-1-peron.clem@gmail.com>
References: <20230927084242.1195772-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 08:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105184

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 ...Add-missing-includes-cstdint-and-cstdio.patch | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
index 12fbd7597..f8ccb998b 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
@@ -15,7 +15,8 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1 +
  .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1 +
  storage/rocksdb/rocksdb/util/slice.cc                            | 1 +
- 4 files changed, 4 insertions(+)
+ storage/rocksdb/rocksdb/util/string_util.h                       | 1 +
+ 5 files changed, 5 insertions(+)
 
 diff --git a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
 index 963c1d8e..73487edd 100644
@@ -65,6 +66,19 @@ index 6db11cc9..c26b6a21 100644
  #include "rocksdb/slice_transform.h"
  #include "rocksdb/slice.h"
  #include "util/string_util.h"
+
+diff --git a/util/string_util.h b/util/string_util.h
+index 55d106fff02..11178fd1d7b 100644
+--- a/storage/rocksdb/rocksdb/util/string_util.h
++++ b/storage/rocksdb/rocksdb/util/string_util.h
+@@ -6,6 +6,7 @@
+
+ #pragma once
+
++#include <cstdint>
+ #include <sstream>
+ #include <string>
+ #include <unordered_map>
 -- 
 2.25.1
 
-- 
2.34.1


