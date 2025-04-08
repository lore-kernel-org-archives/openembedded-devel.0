Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B42C3601E
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 02:52:17 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.66267.1744080729676105306
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 19:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LtPmLVUA;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2243803b776so69457985ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 19:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744080729; x=1744685529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=toT5OyMWwbr0j4nba0SgudiVXkXcTcZbswzp0re87xs=;
        b=LtPmLVUA404mnqhzOUVKlhqFDffE6oG6UQUZcx+jiXkLO4ybg9mlVWxXG4iTvBM5Qr
         aqh7q9OlWS3NV7zu6wY8ot6CduIjXZsOkmeGCd+DtOcZWgflJzgEpZ/kCrVlf7JdNaTa
         +bJV89CdQY//gQUMMFXLGHPloEUeWCZQ0zsW+I6FPFaylWH1nWkM7vXOE6xmreQCWfq6
         a+jliJEYELVQLNkKseZQA+PUsxe0kZ87zYWXV2jy3VBLdpgmfYBzu1wPjrR/cbtKty/j
         BNC7S7tBLWnq3GZngLY1JsPLQnbCiKWckn77KXtw9mwvP02qhdrX+R1GCNOq6AfauW1A
         VDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744080729; x=1744685529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toT5OyMWwbr0j4nba0SgudiVXkXcTcZbswzp0re87xs=;
        b=io8KfKhkwKW5r52RvKdGegVwbjsVMuLCpY3klVZv9XzB5xTzHoRtiBTgn1q9Z5+U/r
         /yovj/nsI5MunVpxR/O7bHiRgb2TaCEMSU6S6NdCTiPgQE3wjutHkjVafHd+NkJe+YzP
         R3ubpt7jGqQ5DH5OfyhcqtFQ9F/A0t+tmT2gHYa6OKJX5m9LikiOqu9AULlVCys/L1Fz
         vKTWWJH89zHWRvP0YKgILQW+lqekQ5//E9JZk/kWoorbRfy6dlvMC5RGtzhyc036LHOY
         lNZ4DtM6Mf0bRLnqQtRi6AUkWY0I+JfgLAVqWO2yva+OZN+J+MYG2E+b6V8QgkQ2ugzj
         PdAw==
X-Gm-Message-State: AOJu0YzS7Y0GiuG9/l/pKp2M6M4AgUP8d6TNpbbOgW0+H0J9UEg5y0Ks
	OwUdVUc0y8+0AXI64TfVG3bcRbfQgmi8zfidX8MCT0hsMc4vaPudkfPzEgMz
X-Gm-Gg: ASbGnctyYVMTc2MnxEaQjy9aU/pblYiMueMx6kNF9vhhvzM1KTgzlV8pCeEdwPBsTnO
	tQgNvS3uDvGU5w3I6GGvFhZc1H89GSRp7cjtFAozs/bLQRH82018dpqf7UbkAMtu6jMNxW/rte6
	6oCA0RAYwPWxrLe4M9SdRMURwwQski+K7O0E4Xv30WU+uKUjSRyfhMB4Qh4I1GOPD1PbMQquK4M
	QdmeEE5RmFzoNyefd/qXZjrGqR5WImI1JaGogjrPLMslB0QBi9AeqJKKzKFq1FD+IvD4NGoOkFA
	yknBHbJAlA1JzlUfGGtIQsmnXGSScOg0K7F6+FZvu8TAeuo=
X-Google-Smtp-Source: AGHT+IE4zH202rK1nOhyXY4IsJLhL5gbW9OkcYM79J3CXZ1i6NGZu1JXx6u3UasFJ8/XC1DR2g0qcg==
X-Received: by 2002:a17:903:2c5:b0:224:1294:1d24 with SMTP id d9443c01a7336-22a954f9deamr144968775ad.3.1744080728735;
        Mon, 07 Apr 2025 19:52:08 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787728cfsm89057245ad.228.2025.04.07.19.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 19:52:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] mariadb: Fix build with clang
Date: Mon,  7 Apr 2025 19:52:04 -0700
Message-ID: <20250408025206.548418-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 02:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116682

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc        |  1 +
 meta-oe/recipes-dbs/mysql/mariadb/3871.patch | 29 ++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/3871.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index f704ff6dec..eedb6735a4 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -24,6 +24,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
+           file://3871.patch \
           "
 SRC_URI[sha256sum] = "ff6595f8c482f9921e39b97fa1122377a69f0dcbd92553c6b9032cbf0e9b5354"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/3871.patch b/meta-oe/recipes-dbs/mysql/mariadb/3871.patch
new file mode 100644
index 0000000000..4bbca2d706
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/3871.patch
@@ -0,0 +1,29 @@
+From d6923ac0adc11a0364acd421316116190eedb508 Mon Sep 17 00:00:00 2001
+From: Brad Smith <brad@comstyle.com>
+Date: Fri, 7 Mar 2025 02:04:01 -0500
+Subject: [PATCH] Fix building with Clang and GCC on RISC-V
+
+Clang does not have the builtin __builtin_riscv_pause().
+
+Upstream-Status: Backport [https://github.com/MariaDB/server/pull/3871]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/my_cpu.h | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+--- a/include/my_cpu.h
++++ b/include/my_cpu.h
+@@ -97,7 +97,12 @@ static inline void MY_RELAX_CPU(void)
+   /* Changed from __ppc_get_timebase for musl and clang compatibility */
+   __builtin_ppc_get_timebase();
+ #elif defined __GNUC__ && defined __riscv
+-  __builtin_riscv_pause();
++  /* The GCC-only __builtin_riscv_pause() or the pause instruction is
++  encoded like a fence instruction with special parameters. On RISC-V
++  implementations that do not support arch=+zihintpause this
++  instruction could be interpreted as a more expensive memory fence;
++  it should not be an illegal instruction. */
++  __asm__ volatile(".long 0x0100000f" ::: "memory");
+ #elif defined __GNUC__
+   /* Mainly, prevent the compiler from optimizing away delay loops */
+   __asm__ __volatile__ ("":::"memory");

