Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBA8C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 04:57:14 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.2214.1718081830846070195
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 21:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q1d28Gfp;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f717b3f2d8so10775345ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 21:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718081830; x=1718686630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zku7KmeK1OpGeTuR3p1I5C2V/GVudXSpb3XvLSzls/s=;
        b=Q1d28GfpafO0lSHV9p5tVziIVk9DJjbVwi/f9u6GUC7LwnlkehW4eC/OPhOYB7p1tf
         2qaiEwUWKiBQhtIfqW+cTmPv+k1IiTrlwfuMXKoNib8WjKmq4ZzRrZKnpwt38J/jfGrv
         JGX7uxzx/OH5cDk7rLKHCWklpGtMjxnb+Wv3ZpaYNRgtvl8lNTD9wGxTo945JWj4gDyw
         IDjFymTytJmFNh7KfuewSvPKFXXVhxTHc1grYz8zDdamHCX4zyIBd1lhkd80diVOOjgP
         awMzk61zp8QPhadM54jDWBzF0PQ8lPgfwwRTnwxT0zJET7oIg2ROE9eBsfjh0K4RqWq4
         trfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718081830; x=1718686630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zku7KmeK1OpGeTuR3p1I5C2V/GVudXSpb3XvLSzls/s=;
        b=Sl/tBznq7fQ4+KwbaRT3ymoWN/9ozH1I7Yw6ulAUXsCpcvCUE9Y8VdZ1ZxF0nhJTfE
         ZL0FoQQAR6umJNILw/nXxtl/gIoTQd5oq6/3LZu29KqwOddcROi92VgPmrs3XeC9XTfo
         b4i9sn7s7l5hwR91sYitK3iOkQf7IY792KkGBgWsPc6Mv2B0j50tL5i4BSk9RQzNteXB
         OdwopEZgz+o6BMX57K4CsxviBqhdwZOXgjZyqe4gc6woPN0DgtPzho5hQZm2VrbhCuJp
         MvV9CQ/JM7RvpDjVgScZ8w07uXqg8YoXW2nbotjWayoB+e/6vFzjtoXqC1pFIVVkfkDB
         To3A==
X-Gm-Message-State: AOJu0Ywi7tv1JkBb8YWDhdQTjN8L6QWGtV25ZUvaKDCVTaX0FUW24ZN7
	ipY2DBNdQrSe2oSknPCC4z3I7RDFsK6VwOO6B4hX+qsab2GyaaOwQ7Q3bg==
X-Google-Smtp-Source: AGHT+IF6p/OOz5g2HPsYWkkgXfi9DbPqP6hADMq8E7EC+ptSunLg7AWwDLSSZcJulW02qufFEK2BkA==
X-Received: by 2002:a17:902:e88b:b0:1f6:23ca:ec6 with SMTP id d9443c01a7336-1f72892fb89mr21482285ad.22.1718081829957;
        Mon, 10 Jun 2024 21:57:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f70ddc54c8sm34537055ad.43.2024.06.10.21.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 21:57:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] googlebenchmark: Fix build on riscv64
Date: Mon, 10 Jun 2024 21:57:07 -0700
Message-ID: <20240611045707.489554-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 04:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110812

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ype-conversion-to-match-function-ret.patch | 32 +++++++++++++++++++
 .../googlebenchmark/googlebenchmark_1.8.4.bb  |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/googlebenchmark/googlebenchmark/0002-cycleclock-Fix-type-conversion-to-match-function-ret.patch

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0002-cycleclock-Fix-type-conversion-to-match-function-ret.patch b/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0002-cycleclock-Fix-type-conversion-to-match-function-ret.patch
new file mode 100644
index 0000000000..cc22a7e8a9
--- /dev/null
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0002-cycleclock-Fix-type-conversion-to-match-function-ret.patch
@@ -0,0 +1,32 @@
+From 54bca09aca6ccec41f852cb1f834463bc51290d0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 Jun 2024 21:45:22 -0700
+Subject: [PATCH] cycleclock: Fix type conversion to match function return type
+ on riscv64
+
+Fixes builds with clang
+
+src/cycleclock.h:213:10: error: implicit conversion changes signedness: 'uint64_t' (aka 'unsigned long') to 'int64_t' (aka 'long') [-Werror,-Wsign-conversion]
+     213 |   return cycles;
+         |   ~~~~~~ ^~~~~~
+   1 error generated.
+
+Upstream-Status: Submitted [https://github.com/google/benchmark/pull/1802]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cycleclock.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cycleclock.h b/src/cycleclock.h
+index c657414..bd62f5d 100644
+--- a/src/cycleclock.h
++++ b/src/cycleclock.h
+@@ -210,7 +210,7 @@ inline BENCHMARK_ALWAYS_INLINE int64_t Now() {
+ #else
+   uint64_t cycles;
+   asm volatile("rdtime %0" : "=r"(cycles));
+-  return cycles;
++  return static_cast<int64_t>(cycles);
+ #endif
+ #elif defined(__e2k__) || defined(__elbrus__)
+   struct timeval tv;
diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.4.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.4.bb
index 34732b42d9..706862f24a 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.4.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.4.bb
@@ -5,7 +5,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main \
-           file://0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch"
+           file://0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch \
+           file://0002-cycleclock-Fix-type-conversion-to-match-function-ret.patch"
 SRCREV = "a4cf155615c63e019ae549e31703bf367df5b471"
 
 S = "${WORKDIR}/git"

