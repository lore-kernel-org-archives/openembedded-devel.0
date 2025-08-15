Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6125CCA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 05:50:18 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.5725.1755237014462256767
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 22:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q1QgM9CT;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-244581caca6so12887545ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 22:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755237013; x=1755841813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2eGa2RPT7ynfNDXeKInyUTROwAmJO22utKkv6pcefik=;
        b=Q1QgM9CTosqYeS81ehxmsuNdP+6u3Ov2KP4nLS6T+4ylxW3568FYukzNMAgV6YzRhL
         g6nzO1ItemotdV5yUmcXuNtSiGpsh74eC+MQAxfhmSz9d6uEfAhnwSA6d4RTexqp84GY
         JZYgFQR3VPbLJObzwzcQ3aAFos3vAXv8xnHJBJN640Ow0LPdAWHvYLW++L4GDz/c8RvO
         u6U6MQkX5r6VkfmbAEQ0aAquLQcY/7H1SeIiNBXmwr7OvYJZQ+GS+9hlwGx3RRSgv0lX
         7iR4by7J5fcqW8U2BjBDOBdwcuBpY9lEqwKeSb062G6BPO3jKTDQGcTUjlwWNoAteT03
         +kGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755237013; x=1755841813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eGa2RPT7ynfNDXeKInyUTROwAmJO22utKkv6pcefik=;
        b=Rab2epiv3tlGnFLuyyI3nrLutMzmtJr5aOoCRShfq3LlY7vI2dSfnP6QOOzNALnjec
         S2CFbkE0zCkkWXBIu+1j2IBCOGu4SAzL1t7ATDJOtctkZtt3abcwVQNJJmQ7tzb9yDuB
         ZQi5dVdFFkYP3TBqwlt26f/R8hS2N6WcfEkPL2PHPxH9RKtIyG0f9Jr5e34Q/pfau6sL
         wu287HKUajUkGe6+0qmlKbeoF6OqqBoGUEZnmDDyrRQMIid1yqVBaiV+z+3vmHKQTap5
         bziGhxl/JqY9aKmQWJc8pocfHkTvUEdZ+3yMr375f90fDqRyOEOfJ078VMzVoRn95fxm
         1r8g==
X-Gm-Message-State: AOJu0Yz5UkBNwfNeFuyMEH7DCrIrgSR1S+gDDomeBbU8LyUC5A135W1c
	/Y8TOLFB0QlqQ3bpUTcMipcLqm2KR/6az7o3XSyFue7NVwGoegc3vrZOUmODMepi
X-Gm-Gg: ASbGncubctO0CvctZ4BYLvxL7DluG2SFclXlytxTy9tS9t5Rci4xDPh4LmwaoXKtn0Y
	VXz+xhTpk39eKja4EC51RdtUjAi47Mx2Q5PemZLBM8g7fOPBnDoZuFHUI5xufLcGV/mtgRiphuh
	/YhpzHHl5qnoo+oOk6xSBdrBJjQBz76Tsb3Ynd1ShVUF4kfGw8uzjpx3eaIWzDArXM3dh4LnHp1
	plDnJ1TxRozvhuO/JSyETE8o2Se92xsZ9VZI1uk1Otp2n6JhV2jZj0POEWQaWvLRVcbPh9UdjbY
	f6tIh2Tmv1QFCppvvutRyY8Dg41C9rhDyKe/sILweCE5D2XCzdulQ3aDKCsUKoZQODkXMtmquXO
	vcfjY5oGfblzTDQiMfyTt
X-Google-Smtp-Source: AGHT+IFUPdV1vJZ9AyhtOJFMkYHOdAAH/zhdRFErr4ienkuqfqEyuGpFQCXNZT2by/hXsSIg9uhTiQ==
X-Received: by 2002:a17:902:d58f:b0:240:5c38:756b with SMTP id d9443c01a7336-2446d710a8fmr10823675ad.14.1755237013439;
        Thu, 14 Aug 2025 22:50:13 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d58ab11sm5954195ad.159.2025.08.14.22.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:50:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] rocksdb: Fix build when using x86-64-v3 tune
Date: Thu, 14 Aug 2025 22:50:11 -0700
Message-ID: <20250815055011.2625329-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 05:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118955

Fixes
| ../sources/rocksdb-9.10.0/util/crc32c.cc:553:21: error: '__builtin_ia32_pclmulqdq128' needs target feature pclmul
|   553 |   const auto res0 = _mm_clmulepi64_si128(crc0_xmm, multiplier, 0x00);
|       |                     ^
| /mnt/b/yoe/master/build/tmp/work/x86-64-v3-yoe-linux/rocksdb/9.10.0/recipe-sysroot-native/usr/lib/clang/21/include/__wmmintrin_pclmul.h:45:13: note: expanded from macro '_mm_clmulepi64_si128'
|    45 |   ((__m128i)__builtin_ia32_pclmulqdq128((__v2di)(__m128i)(X), \
|       |             ^
| ../sources/rocksdb-9.10.0/util/crc32c.cc:555:21: error: '__builtin_ia32_pclmulqdq128' needs target feature pclmul
|   555 |   const auto res1 = _mm_clmulepi64_si128(crc1_xmm, multiplier, 0x10);
|       |                     ^
| /mnt/b/yoe/master/build/tmp/work/x86-64-v3-yoe-linux/rocksdb/9.10.0/recipe-sysroot-native/usr/lib/clang/21/include/__wmmintrin_pclmul.h:45:13: note: expanded from macro '_mm_clmulepi64_si128'
|    45 |   ((__m128i)__builtin_ia32_pclmulqdq128((__v2di)(__m128i)(X), \
|       |             ^
| 2 errors generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
index 5bbb010f8b..4b15f538ff 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
@@ -51,6 +51,7 @@ EXTRA_OECMAKE = "\
 "
 
 CXXFLAGS += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_NO_INLINE_HINTS', '', d)}"
+CXXFLAGS += "${@bb.utils.contains('TUNE_FEATURES', 'x86-64-v3', '-mpclmul', '', d)}"
 
 do_install:append() {
     # Fix for qa check buildpaths

