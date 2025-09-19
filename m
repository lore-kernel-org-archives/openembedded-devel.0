Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC69CAC5AC
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:59:47 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.17322.1758290382105932181
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vy0+4leV;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b07c081660aso376262266b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 06:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758290380; x=1758895180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hb2k6I8x55qqKsiZ8k/dOxPItySuoUkQ8NgLxzzYpZM=;
        b=Vy0+4leV8N8GHgio3MGM4IMjRdTrcRcv3GR9pinD1JlbMBu2Cz3uoc43uTj7UpIDOO
         AlMcRIDrxO4XQi5dliLWuPwgwMo92/gcKU/fK1bI9QnibRSHGsC6f61AgBeo8DNdjpvQ
         FWh/pMhlN6VOytKPis9jZmytNCyE9IWJg5nsj4q4ffXjyae+thcU24CbmKNSdAxVeum/
         he1SC4T7m70Kxv2YmqQ1l7dV0k2yHQWeVqdQ0Uz4B+zTwpD8JWhBk6BN4nFe0Xiov2mx
         5vuCcJlLS+boRLnRLkt5k2Y6+DFbssZ32qgp1aqvALXkTCSaOH5GAAt4IfU6wGgvIDAX
         OLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758290380; x=1758895180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hb2k6I8x55qqKsiZ8k/dOxPItySuoUkQ8NgLxzzYpZM=;
        b=AcnvDHDPwwnc7to/5rw6ZwzfiAidnVyOWX+UkL/zZycoxhsx8nwcGS6u8//59cC7Q3
         yk9UKyT247pm40XFQn4X83MLGs6mUCZyndlrljyzzPpiCVMZAPS4o/C10Ses19KDjR+/
         VXziIt8rLDYwsLUE76DaKzry1NUKL5/pFZSM1gWLHHuW4suISqGnlOqYxPVwgnSiTQDO
         U0AONZRnaP/CEfcbrlNeBE4PpbCPByNe7iyFilY1UlJYGKxqAKXWuFHcTcjUoEnVy+z0
         A5RpZA36LwCCE1XDLpRvlk7wKGziJ6JiS0elDvz3I8/fyw9jaF3/uWQ+DYMcL/LrRxcT
         t6SA==
X-Gm-Message-State: AOJu0YyttWhPS6PU1gdsaz9uCOBoHJzIRzkGfceOi9gvCP36V5vDfOWB
	EpmcqgbhnTIztFPRrtiBph/dpPfCFeWER5q13ke9NBpRKTF4Tdtw2y8k5Uu0wQ==
X-Gm-Gg: ASbGncvhDxcHoT9UxVIq6T0IDFhCOwXHsllWO5X0po1tuVQrAt9DwAUcTFFBa2+P1Sw
	H766wBHQCvrurEy73wTW0sGhUmULNYBhhI84qO5mFFmeck6cnTFWTKCUXmdLIuonFX2KY3eU+7+
	1Gkmu+ZGEKdjzxkruUYb05yy+KmNtYF2QuM8qNUhuFwTMhH1oEUfztcsfw2jJmgi6Y5/joSZVi2
	40fbADD3s3QVERHBI9D4JYOHZcTBF/NK+jQPp+1KdyVbvv+O3Pj1UEGY8054Yq6UaBl4o1yrG8e
	ev3a+6SCL6+l6Jdeh0zKm8X99PeVhAtlvxuw1cK5oExTFVpvvmmaY4qPnQ+ln1gOB/SebX1z+Jg
	gAUlwmaWQeG09OKHsKhb1
X-Google-Smtp-Source: AGHT+IGw4UDcwHCPwpmX0JNFJcuSVhVEg1WT/HMC6Qz89/+G/uLBoZycORSYKRwizZ5/YYAgsqlYoA==
X-Received: by 2002:a17:906:7310:b0:b04:858e:c1ee with SMTP id a640c23a62f3a-b24ed886e06mr396608166b.2.1758290380269;
        Fri, 19 Sep 2025 06:59:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd262993asm442209166b.94.2025.09.19.06.59.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 06:59:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 9/9] hddtemp: Add missing prototype for ata_get_powermode in sata.c
Date: Fri, 19 Sep 2025 15:59:31 +0200
Message-ID: <20250919135933.916848-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919135933.916848-1-skandigraun@gmail.com>
References: <20250919135933.916848-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 13:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119606

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fdb8bc38b1e959006a0a5d98c84c8443c785e49d)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-Declare-ata_get_powermode-prototype.patch | 33 +++++++++++++++++++
 .../hddtemp/hddtemp_0.3-beta15.bb             |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/hddtemp/hddtemp/0001-sata.c-Declare-ata_get_powermode-prototype.patch

diff --git a/meta-oe/recipes-support/hddtemp/hddtemp/0001-sata.c-Declare-ata_get_powermode-prototype.patch b/meta-oe/recipes-support/hddtemp/hddtemp/0001-sata.c-Declare-ata_get_powermode-prototype.patch
new file mode 100644
index 0000000000..5703d3c241
--- /dev/null
+++ b/meta-oe/recipes-support/hddtemp/hddtemp/0001-sata.c-Declare-ata_get_powermode-prototype.patch
@@ -0,0 +1,33 @@
+From c5ca31940d1d1889ef2cc6974c18ff24ab406748 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Aug 2022 16:42:23 -0700
+Subject: [PATCH] sata.c: Declare ata_get_powermode prototype
+
+Fixes build warnings/errors
+
+sata.c:127:10: error: call to undeclared function 'ata_get_powermode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+|   switch(ata_get_powermode(dsk->fd))
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/sata.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/sata.c b/src/sata.c
+index d67621f..4172245 100644
+--- a/src/sata.c
++++ b/src/sata.c
+@@ -52,7 +52,8 @@
+                 (((u16)(__x) & (u16)0xff00U) >> 8) )); \
+ })
+ 
+- 
++extern enum e_powermode ata_get_powermode(int device);
++
+ static int sata_probe(int device) {
+   int bus_num;
+   unsigned char cmd[4] = { WIN_IDENTIFY, 0, 0, 1 };
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
index b4be39feb5..e9d30977fe 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
+++ b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
@@ -10,6 +10,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
            file://hddtemp-0.3-beta15-autodetect-717479.patch \
            file://0001-backtrace-Replace-struct-ucontext-with-ucontext_t.patch \
            file://0001-configure.ac-Rename-to-configure.ac-and-use-external.patch \
+           file://0001-sata.c-Declare-ata_get_powermode-prototype.patch \
            file://hddtemp.db \
            file://init \
 "

