Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54C7C4332F
	for <webhook@archiver.kernel.org>; Sat, 31 Dec 2022 22:50:34 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.53629.1672527025184504229
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Dec 2022 14:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TdiG/Gci;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 78so16262734pgb.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 14:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fwUH4weZBr+sZVwWiaEdc8R3rQGU6+i0gnmksM+GWa4=;
        b=TdiG/Gci+aNd9usNN2rufAE+mb1pekDpB2cIACNvDtI8J/VVl6KhXQpJYLiZCL/qD7
         IQLVPGTjvDt5YRJYAC3c3m5IKabi3p5WaSWrn6xp5fP148mw7OnirWJTuf+Dwqon6W6E
         sqoXlwu+ASt7Z8ZyWbVZ6fbpdE2uLlyj4tTvVnVm/jkGVq+H8rkMJOBI2kbSKYWpuUYJ
         eiEYTf7iNZjwDqtKBi9nx0aE+B2QWT0425R2QADUvMKOzkTgVaHERFWdidZVG1V3tcDf
         pxbopQMW2VGixHnxSGHSGnBEiGb77ojqChvnHyxsuGrbBhwDd70IFkUTl0FFnNB4oz4+
         uX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwUH4weZBr+sZVwWiaEdc8R3rQGU6+i0gnmksM+GWa4=;
        b=bjdbCStDBWYHnmZN0O0gqaL0UXDsR8FQh6AO4ER2dx/51LKTcbPbcVaPkQNBKVPEPD
         ddsAA90fKDzGc9OHrYgL8sURhDSv6EJ2HMbrltH+AK2/RzZZeoS3Kmm0GyYDff1c13+0
         /8M9OIOqRjLk3HRPAEn8F4i7d5qv87jEti+LEK2PAYIA9UwrvbtT6dT/fwAHGrCbtLaY
         4YRw/vGSCf+oh/MD2VR4DWtPvRjbJPLs3pz+wdoCHW41Hx70GWwsuZRcN+NnVf0NAMJ9
         dnwAaKxtpkcdfLb7NAZkO6zNENYN16B+SaEnCf3s3Fg7wW+ChUH5Egv8i+winOIq48rS
         UUaQ==
X-Gm-Message-State: AFqh2kp0a8KPXQvISRlNscj6JqHduI//UGslQEZXaWB00PzhslUuicjU
	ttEXBya9fDS7DaPgLGnw6rfZarcNz6M=
X-Google-Smtp-Source: AMrXdXsBRLtYg7syyP+E/ciMdsSwXEpVVPjvuC4e9u8r2y045dvlZg8+TBHSXsiCQRGlIk9fGEi67A==
X-Received: by 2002:a62:1687:0:b0:57a:7b74:4ec5 with SMTP id 129-20020a621687000000b0057a7b744ec5mr39462667pfw.13.1672527024196;
        Sat, 31 Dec 2022 14:50:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id b8-20020aa79508000000b0057691fb0d37sm8714682pfp.193.2022.12.31.14.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 14:50:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH] dracut: Do not undefine _FILE_OFFSET_BITS
Date: Sat, 31 Dec 2022 14:50:21 -0800
Message-Id: <20221231225021.1486486-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 22:50:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100328

Fixes build with 64bit time_t

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...stall-Do-not-undef-_FILE_OFFSET_BITS.patch | 32 +++++++++++++++++++
 .../recipes-devtools/dracut/dracut_056.bb     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-install-Do-not-undef-_FILE_OFFSET_BITS.patch

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-install-Do-not-undef-_FILE_OFFSET_BITS.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-install-Do-not-undef-_FILE_OFFSET_BITS.patch
new file mode 100644
index 0000000000..170df7119f
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/dracut/0001-install-Do-not-undef-_FILE_OFFSET_BITS.patch
@@ -0,0 +1,32 @@
+From 7f8ef553b7c433af153d48c6a16b2943780abf67 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 31 Dec 2022 14:41:52 -0800
+Subject: [PATCH] install: Do not undef _FILE_OFFSET_BITS
+
+_FILE_OFFSET_BITS is a feature test macro to determine largefile
+support. Usually its set to 64 on systems supporting LFS. Its also
+needed to be set to 64 for supporting 64bit time_t on glibc on 32bit
+systems. If its undefined explicitly, then 64bit time_t can not be
+enabled.
+
+Upstream-Status: Submitted [https://github.com/dracutdevs/dracut/pull/2157]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/install/dracut-install.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/install/dracut-install.c b/src/install/dracut-install.c
+index dda0caca..05a67a03 100644
+--- a/src/install/dracut-install.c
++++ b/src/install/dracut-install.c
+@@ -22,7 +22,6 @@
+ #ifndef _GNU_SOURCE
+ #define _GNU_SOURCE
+ #endif
+-#undef _FILE_OFFSET_BITS
+ #include <ctype.h>
+ #include <errno.h>
+ #include <fcntl.h>
+-- 
+2.39.0
+
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_056.bb b/meta-initramfs/recipes-devtools/dracut/dracut_056.bb
index 7b89006103..364beec5d8 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_056.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_056.bb
@@ -11,6 +11,7 @@ SRCREV = "631d5f72a223288aa1f48bb8e8d0313e75947400"
 SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protocol=http;branch=master \
            file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
            file://0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch \
+           file://0001-install-Do-not-undef-_FILE_OFFSET_BITS.patch \
            "
 
 DEPENDS += "kmod"
-- 
2.39.0


