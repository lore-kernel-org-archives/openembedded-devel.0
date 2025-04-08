Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183A2C3DA4A
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 02:52:17 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.65705.1744080730545962444
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 19:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FmG580A7;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2264aefc45dso63715465ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 19:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744080730; x=1744685530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hirYTAxwCPJQVbcqY3z8VYiXeHES59ot7pVBmRe0Hc=;
        b=FmG580A7/ipxqBlzp+rx5w/H5vyOhPmPDOMb7H4whsvii3pr37VHjmuBWKOpUooiM+
         ybDCObNKmjgMGgkCJuFj3mpfw5rFVXYMLmC5liF05PJHeia1QRmCXqb+09/ap8bf8+lT
         5inOQCnbzRdJqpbgQ2MHY6VCD+CuSrb7tkG7SanfIUzSwOPOCmZoUnW01erTpMq37tKg
         0aaPW6n4ez7S8UtrLRe3nfMOJt+Qkg8Hiky28Om6uOUzYvDCwNGzUrOSZrKMyiClqtjp
         +5zuDIU2S37bWGB2y1iP14mc/dsbpVACupybfsV5ecRYZ+nRHURx14qSMXqUvbJtf3hy
         RWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744080730; x=1744685530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hirYTAxwCPJQVbcqY3z8VYiXeHES59ot7pVBmRe0Hc=;
        b=Uk9HWAMiHOt83sElYBvFRZQcEONBVzK++mc32pQAqQ7GOohauhiFkZqD9+2oDPGkDM
         wWwrXUsQ4/jm+vdsg8PcI4K+Zj6PrjbbS/KIpl6GsBgD5zNjLu6L5tFm3J6XEyEpNvOp
         2cKTI4s8Kp8A8n6Al57uaXy/wp0WU9dAMI9vrQ2CXD++KzaUIYJBo1sgYkKsZYVE+n8k
         pVqv8+Yk1yswx4Ktc/4s5TbkDRFQSzlXQWsLqQwz7kBJQ0MVJhEA+TZ2porTn5PlrKMg
         QxXCnavj4OlBKIfmD9JaxsT+GN/xcBpi6IXW/XjgRr1p25fafFZlECB2yonInMrn00CP
         2hHw==
X-Gm-Message-State: AOJu0Yzn9mLasZ01nYUuXmTUSeU2XiyHt8JwuX4YhysZEiGhUIRvtS1x
	O+bxN8dZ0IEF7qJh/f4mj84OZU/YNxxXcWCs3H9qrg84E2kDSl6Hqjmo0N/q
X-Gm-Gg: ASbGncvMeeI5ymCSM7hBZR0ZD7xlpT8PH+W7zh6X/EvbyC/2wNykc5kEuxXVMr/CBnU
	ABixIWA1jq9vxKB4WT/9T5uIHLbXl8Nkhv7ioCyC2NMgUiIlsZGhrkceKZoyWSTRtVDsftkU2oS
	9/ajva0aidRRnG9uHl1StMwpzzHGpKIHZsCsDG27DbihM18ZKjWaJ5CqsWB4ykAfuZeF8wUkbVt
	dhvtqOxDDajPBlp+Mx6JJuHnL1w2Jg+3lGdUk5FPNx+t75j9pHgnnRPGxvT+JjcGWupmzsJZdDf
	pWbBi2cfikJjYyDIJ2/D8Jx8c8Rkr/55vCVk
X-Google-Smtp-Source: AGHT+IFsHrWWluB9QC7xkYNQwTEquyQqYwRJO5zLOUMsOTL68GinHMeaWQzpvbusCeATm0r6GJ3L/w==
X-Received: by 2002:a17:902:e78f:b0:224:26f5:9c1e with SMTP id d9443c01a7336-22a8a84add0mr200116055ad.2.1744080729614;
        Mon, 07 Apr 2025 19:52:09 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787728cfsm89057245ad.228.2025.04.07.19.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 19:52:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] mariadb: Fix build on riscv32
Date: Mon,  7 Apr 2025 19:52:05 -0700
Message-ID: <20250408025206.548418-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408025206.548418-1-raj.khem@gmail.com>
References: <20250408025206.548418-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 02:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116683

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 .../recipes-dbs/mysql/mariadb/riscv32.patch   | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/riscv32.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index eedb6735a4..3a39d036f7 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,6 +25,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
            file://3871.patch \
+           file://riscv32.patch \
           "
 SRC_URI[sha256sum] = "ff6595f8c482f9921e39b97fa1122377a69f0dcbd92553c6b9032cbf0e9b5354"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/riscv32.patch b/meta-oe/recipes-dbs/mysql/mariadb/riscv32.patch
new file mode 100644
index 0000000000..24b86584e3
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/riscv32.patch
@@ -0,0 +1,19 @@
+Do not use static_cast in C sources
+
+C compiler does not recognise static_cast which is a C++ keyword
+and bails out compiling mysys/my_rdtsc.c, use traditional typecast
+instead
+
+Upstream-Status: Submitted [https://github.com/MariaDB/server/pull/1981/files#r2032207090]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/include/my_rdtsc.h
++++ b/include/my_rdtsc.h
+@@ -226,7 +226,7 @@ static inline ulonglong my_timer_cycles(
+         "sub %0, zero, %0\n"
+         "and %1, %1, %0\n"
+         : "=r"(result_hi0), "=r"(result_lo), "=r"(result_hi1));
+-    return (static_cast<ulonglong>(result_hi1) << 32) | result_lo;
++    return ((ulonglong)result_hi1 << 32) | result_lo;
+ # else
+     ulonglong result;
+     __asm __volatile__("rdtime %0" : "=r"(result));

