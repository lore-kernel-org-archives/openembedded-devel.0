Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0713DC25B06
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 17:11:36 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.7090.1660497090523330297
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 10:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h/OL1Vmq;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 s5-20020a17090a13c500b001f4da9ffe5fso12585818pjf.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 10:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=hh/+pZBod9qTXOFEMS27FA3Dh1qrOeiLz9Dg1tl6iYY=;
        b=h/OL1Vmq8bYM8PHbVvVqAPVSovDUBf0tS8hUUQvAvtGvOilpbrBPeySNcMiv8K0Auz
         RK9zkNcqOLFI1f1T/fMDGNnxYttTgo9OnqC1IC+QZ8/LUA/TCyH6zydS7ZAgNvact4O9
         KUzZve3wZVSCsRFIJaSBqpXd3xg/GQlB3kt6w9hOQw658N8zWjzfAP5o97b6H7KaH/lm
         Ak6sx+kjE31cnAj8/hjG/PSvi3AVut81AvScPU+EPe91OLwjBwA5VY/YgsOe173XZ8pF
         7yy+xzGDGCApdasLb56FUeFVpUMEzID5jzXCbznQeVAi7ifEZoof3zJICyuAPujS33WJ
         5kvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=hh/+pZBod9qTXOFEMS27FA3Dh1qrOeiLz9Dg1tl6iYY=;
        b=Be+gW2uU4/tStKDwQOggSb1AyD2qTCqyTOGn/dN3O0ZP1fZEYTMZTyfZ5LG6JwAZX9
         THCLM8H+g9UmiYd30yGrHOK2m+EgrhkRuItYy++QqosNNkETVMrNF7/16H4GFsKv4pQd
         INXfz2n0dZqmeIWflNWGSfIwp/uf6J6s9YknBV2Uwl+X06vsL09mAM6wp5bw1jFw5kO/
         8uA0NcZCYYlLtYz940TepL2OdnL2RMXfSkPlnxkD6IRVRu05/gIm8QBvuat4HWZDFLGn
         IZt1pcVmBpUn2MoebSwSL7Y9R1X1QRGO7P8psiJ0MdjlXxyAIc8awVXUzKSB0SWmdAqJ
         hiQw==
X-Gm-Message-State: ACgBeo0d9dXxXk/PIg7RsbPljQe7pjDBn52NnJWvTgeg1o6eHPSNCJ6D
	9t7wzri+HBgr59w47fTOv6S/FL/A3PudOQ==
X-Google-Smtp-Source: 
 AA6agR45rW+EenC5UkU92B0t9luZIxTkhCMeOQkb/N8fSzsyI6KZ3Th0AXk52OXj7uXRUwuhMmCpNw==
X-Received: by 2002:a17:90b:1d0b:b0:1f5:72f:652c with SMTP id
 on11-20020a17090b1d0b00b001f5072f652cmr14327232pjb.38.1660497089328;
        Sun, 14 Aug 2022 10:11:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 143-20020a621795000000b0052d8b663c37sm5321733pfx.195.2022.08.14.10.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 10:11:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] toybox: Fix build with glibc 2.36+
Date: Sun, 14 Aug 2022 10:11:26 -0700
Message-Id: <20220814171126.2994955-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Aug 2022 17:11:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98229

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...oid-glibc-and-linux-mount.h-conflict.patch | 32 +++++++++++++++++++
 .../{toybox_0.8.7.bb => toybox_0.8.8.bb}      |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/toybox/toybox/0001-portability-Avoid-glibc-and-linux-mount.h-conflict.patch
 rename meta-oe/recipes-core/toybox/{toybox_0.8.7.bb => toybox_0.8.8.bb} (95%)

diff --git a/meta-oe/recipes-core/toybox/toybox/0001-portability-Avoid-glibc-and-linux-mount.h-conflict.patch b/meta-oe/recipes-core/toybox/toybox/0001-portability-Avoid-glibc-and-linux-mount.h-conflict.patch
new file mode 100644
index 0000000000..3e63bdd650
--- /dev/null
+++ b/meta-oe/recipes-core/toybox/toybox/0001-portability-Avoid-glibc-and-linux-mount.h-conflict.patch
@@ -0,0 +1,32 @@
+From 89000d9cb226cd864fa247f2428c9eaf7f414882 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 14 Aug 2022 10:02:15 -0700
+Subject: [PATCH] portability: Avoid glibc and linux mount.h conflict
+
+With glibc 2.36+ linux/mount.h> and <sys/mount.h> headers are
+no longer directly compatible
+
+Upstream-Status: Submitted [https://github.com/landley/toybox/pull/364]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/portability.h | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/portability.h b/lib/portability.h
+index 4de547a..24481ab 100644
+--- a/lib/portability.h
++++ b/lib/portability.h
+@@ -179,8 +179,12 @@ void *memmem(const void *haystack, size_t haystack_length,
+ #define SWAP_LE64(x) (x)
+ #endif
+ 
+-// Linux headers not listed by POSIX or LSB
++// Glibc 2.36 sys/mount.h conflicts with linux/mount.h
++// See https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
++#ifndef _LINUX_MOUNT_H
+ #include <sys/mount.h>
++#endif
++// Linux headers not listed by POSIX or LSB
+ #ifdef __linux__
+ #include <sys/statfs.h>
+ #include <sys/swap.h>
diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.7.bb b/meta-oe/recipes-core/toybox/toybox_0.8.8.bb
similarity index 95%
rename from meta-oe/recipes-core/toybox/toybox_0.8.7.bb
rename to meta-oe/recipes-core/toybox/toybox_0.8.8.bb
index 3441568005..e27f9ed95f 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.7.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.8.bb
@@ -8,8 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 inherit cml1 update-alternatives
 
 SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
+           file://0001-portability-Avoid-glibc-and-linux-mount.h-conflict.patch \
            "
-SRC_URI[sha256sum] = "b508bf336f82cb0739b77111f945931d1a143b5a53905cb753cd2607cfdd1494"
+SRC_URI[sha256sum] = "dafd41978d40f02a61cf1be99a2b4a25812bbfb9c3157e679ee7611202d6ac58"
 
 SECTION = "base"
 
-- 
2.37.2


