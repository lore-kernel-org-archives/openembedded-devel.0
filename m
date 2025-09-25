Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63872CAC5BC
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:59 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.9704.1758801832136657894
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UWVnamrd;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7322da8so171984866b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801830; x=1759406630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aa8/G5fOv6+eyRDkdY4U9/Q7K0KyUr3H9lS91l+fRyQ=;
        b=UWVnamrdXzoIj+kOIgeGPh1lFgff2vESn17z7AUk+XC3FHfmwx1M4i2sc0U1ysjO5z
         nF2eUix9+nw+ilJfo1xTx5qqIzax0nwnKddwcy33r/s3c12JfCAmEJYw2tRpSjLH2l61
         IY7fBj4irP/QyHhukBgbK9LEgZvxm9cMcZZeZwY4oGk2iQlUvlxPGADBrEizGCbpld5f
         6CqlBTSLNtXX1SWtoi81YtuVKSVWjr+4S4ZFrr3RbMolJd9Dohu5ehTB2QMNEBnFWdoQ
         VdwinH93zP/Dkr0E8Lr/Za2UK9LDWKQNYdfHci8pXm05Ya0vn/Iik+qFQX+yKVVRVkvb
         Zu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801830; x=1759406630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aa8/G5fOv6+eyRDkdY4U9/Q7K0KyUr3H9lS91l+fRyQ=;
        b=k4ahi1ZLCV3+2rzZHnm/I2yLgUJxdA+eT7Al0PiucS8WaQFflkT2enJ22wSKDnveUN
         8hWA7vWt4vxhEqjGuDDDgAsz5wzTip2aaoIgNr6H3ccbXkt56cyVWQ4uzFVXArhmq6+d
         /bjwgLNqAI/vHCfIQqie5tHKxp1ap42Xz3JgVEcEr6jxefaqfg1R0y8Hez6FMNvl75Co
         TPDsE8aQSpentHWjtmHh9R4v3TES4q3lpKD/KhP76HAv1dAAypFV1dcy2TUsIsSeaOWq
         S0losjx9riQNpn6JGh/rkAC/oqMeRkkF7lZAZFHjQkGdyZ2GM/bKzRh3f/VNFvrsNsJW
         QqOA==
X-Gm-Message-State: AOJu0Ywqi+y96mk5GNiQSgBIZxL0VXBkGZc+J3+WC3ccp0UDGOH3dAlC
	MIfQmWRzj1wrngMcrtOzlJ2Y2zRs9cadPmft4amuR6gaHqdJp5e5nJDwqe7OF2LQ
X-Gm-Gg: ASbGncspuEHHnZSqPVKYSnCabhXTefWpNRlY0bZx/SbLLwasLvIv1PvqQx1dT4PAGGq
	SVcRSRwwAPNawOCsHYN2HE1r8dFh5oKbMXNoNP63Fjx0baUZ4h+TIXUyuRXDOba1B1D4HSzGjWv
	TCb1TLO/z4Ov1S/vXWAU5KulMg8EMzZMK3QkdkqcL0EjVKc5N7yr3AOHFRAXvPE7WBLFWHZ8/JJ
	RTS3ZiYiPb76oO7NuPmf3afyzu1MMWdXqQuL4r4/yJNybN+dgN0R0Uhptbgds4PjskSV3ndo4Ak
	2KWaUo8So7zTuFzU83cE+PRR13WDunL/f/CQjwLAH9JrjjlNMnEj1r/cqCgPd+OHFefSPYhMdN+
	eEExFLmoASImnv170v9hX
X-Google-Smtp-Source: AGHT+IGm0U8NPpDo7xtH8+U5VXbzbWVKO1x+tcoN9Jn6MgWV8yEGLA4yrxy7IIPo+8CGIJAwnT8B1Q==
X-Received: by 2002:a17:907:2d8c:b0:b24:6396:c643 with SMTP id a640c23a62f3a-b34ba450628mr341955866b.23.1758801830242;
        Thu, 25 Sep 2025 05:03:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][kirkstone][PATCH 08/21] dracut: Do not undefine _FILE_OFFSET_BITS
Date: Thu, 25 Sep 2025 14:03:20 +0200
Message-ID: <20250925120334.1670367-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119867

From: Khem Raj <raj.khem@gmail.com>

Fixes build with 64bit time_t

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 944e9dcdc8a05294f79a69c2f2b6ed8c5bdb0819)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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

