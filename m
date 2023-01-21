Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38552C004D4
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:27 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.2057.1674324085724780259
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E+iffHvF;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id z20so5992847plc.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oWf+5iProbL2k5SQElwmvEepIDnou7B6HufTtvcjgyY=;
        b=E+iffHvFban58RtJBsQ5rECpkN/hIx1ajEYk4XM8ABjNR/5kLP8kEOrgIQ0OhmFBeI
         dcRpBLtcoMiNHEdHTpdkG2hbGqysfTrbxrr21Rve1p4veTt0CBDxLwkHLh3kCwWnrG7u
         DSTDQ1AJl3AqvbhXg5P47vSgF1zRpzVadD1B09RkSpS1r4ROXPMvZVY/iyJK9ci8EO/V
         SYXw4/D3s0mIH7AYSeErhAUwyRrDf0NPtWyRfHetkFjsv88wapqkdstgTUssX6a6OiGH
         8UFsVshXver3XfnP2dzwEPYnrnJEuzU8nK2ukFoILZJZ8Bk2afQNSjjMNyuGss3aX5sS
         5TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWf+5iProbL2k5SQElwmvEepIDnou7B6HufTtvcjgyY=;
        b=7rQRKlKYFbXxP5lKCX/0DqguqTGrWsAyLjdPrB8ABuOCRaCZGc7Du/f1hv3P1DblQ1
         PHth8p741TORjEnBTQWyRnQ2sOhqfTrg0Zk8jmse3JnlSDV1eSTPb9HUYo5jZ2lvcmSY
         4ASptk8mGa9w3/FRQqKFNPE4OGRpheZocbDIvn6nAL4yNZwkD5CpN6gSCcwnqjjJuqPX
         +A7b0drzj/WIp9f2sc5I2uw2eKTAm0agCPWf0EOqpsW7BMEgSnUaicyNMnnSUv8bT3Aq
         ms/jcUBlOpkUgvj2V7g2i4Rc6SsFkwwxoJMf8DjuSBUGO0YiTQQ1oiHDPESc0XWu010E
         XBNg==
X-Gm-Message-State: AFqh2kqRDbvReKv1rbMckZk1m053kLd0kmDrL0JUXuUCDq1c8BCHCgMJ
	Bsqp6bilSMrE1PvgZlsD5oXcdIbAp9sbHw==
X-Google-Smtp-Source: AMrXdXtQMadLGuA24KIQhGyZbgLWybnNEjAS6DGZhOg4GrlLVgbBxC2olkgnwo8DZkHUY6tbeSNDgQ==
X-Received: by 2002:a17:90b:3909:b0:229:ffd3:ad36 with SMTP id ob9-20020a17090b390900b00229ffd3ad36mr8850670pjb.0.1674324084461;
        Sat, 21 Jan 2023 10:01:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 01/30] libmodplug: Fix build with c++17
Date: Sat, 21 Jan 2023 10:00:52 -0800
Message-Id: <20230121180121.1229895-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100668

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Drop-register-storage-class-keyword.patch | 38 +++++++++++++++++++
 .../libmodplug/libmodplug_0.8.9.0.bb          |  5 ++-
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/libmodplug/libmodplug/0001-fastmix-Drop-register-storage-class-keyword.patch

diff --git a/meta-oe/recipes-multimedia/libmodplug/libmodplug/0001-fastmix-Drop-register-storage-class-keyword.patch b/meta-oe/recipes-multimedia/libmodplug/libmodplug/0001-fastmix-Drop-register-storage-class-keyword.patch
new file mode 100644
index 0000000000..dfdaf810d8
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libmodplug/libmodplug/0001-fastmix-Drop-register-storage-class-keyword.patch
@@ -0,0 +1,38 @@
+From 7a25d5def379db387de9237f0b03605b3ae277b6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 17 Jan 2023 11:32:59 -0800
+Subject: [PATCH] fastmix: Drop 'register' storage class keyword
+
+It has been dropped from laters C/C++ standards ( c++17 and newer )
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/fastmix.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/fastmix.cpp b/src/fastmix.cpp
+index d693d20..aa51c4a 100644
+--- a/src/fastmix.cpp
++++ b/src/fastmix.cpp
+@@ -288,7 +288,7 @@ CzWINDOWEDFIR sfir;
+ // MIXING MACROS
+ // ----------------------------------------------------------------------------
+ #define SNDMIX_BEGINSAMPLELOOP8\
+-	register MODCHANNEL * const pChn = pChannel;\
++	MODCHANNEL * const pChn = pChannel;\
+ 	nPos = pChn->nPosLo;\
+ 	const signed char *p = (signed char *)(pChn->pCurrentSample+pChn->nPos);\
+ 	if (pChn->dwFlags & CHN_STEREO) p += pChn->nPos;\
+@@ -296,7 +296,7 @@ CzWINDOWEDFIR sfir;
+ 	do {
+ 
+ #define SNDMIX_BEGINSAMPLELOOP16\
+-	register MODCHANNEL * const pChn = pChannel;\
++	MODCHANNEL * const pChn = pChannel;\
+ 	nPos = pChn->nPosLo;\
+ 	const signed short *p = (signed short *)(pChn->pCurrentSample+(pChn->nPos*2));\
+ 	if (pChn->dwFlags & CHN_STEREO) p += pChn->nPos;\
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb
index 144c737e76..e04e763776 100644
--- a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb
+++ b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb
@@ -4,8 +4,9 @@ HOMEPAGE = "http://modplug-xmms.sf.net"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9182faa1f7c316f7b97d404bcbe3685"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/modplug-xmms/libmodplug-${PV}.tar.gz"
-SRC_URI[md5sum] = "5ba16981e6515975e9a68a58d5ba69d1"
+SRC_URI = "${SOURCEFORGE_MIRROR}/modplug-xmms/libmodplug-${PV}.tar.gz \
+           file://0001-fastmix-Drop-register-storage-class-keyword.patch"
+
 SRC_URI[sha256sum] = "457ca5a6c179656d66c01505c0d95fafaead4329b9dbaa0f997d00a3508ad9de"
 
 inherit autotools pkgconfig
-- 
2.39.1


