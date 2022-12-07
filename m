Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07097C4708E
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 11:27:41 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.12831.1670412458855197245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 03:27:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fYB0Yv3U;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id h11so27577700wrw.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 03:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=flmr+xjrzipiVrCv6iEJ+mjadsT8x0JLB83VphaiE9Y=;
        b=fYB0Yv3UpYAxf75PJvKVFc8aGUWruZnCIV5GamFFyJhH+/XatScJAVKikAbnCHPKNs
         nwliFAJfoPKNw77T92JKeXatwECp97W6xp5d+oVADb2QA6rQejl7Qh0bmIIUTwoPTxCN
         I39xlTGVyLF4hedOHuIhtyCfnoapi4dqDNIaYxsc70xNYmvc89vd8MdTEDWNNygtGWUC
         py65zWB3LFNTjld2SIhrDL37vzIqE9r+bUXldxHIEKwQRx0LUJpXxgE42G9AI6xuUvBX
         uSsI5axe6T/cxuWC7cCLPZ2/mCAfSoueL9kHHQoqmo393jVPgAM6Bj8YLxtD9D5ZQJ58
         peCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flmr+xjrzipiVrCv6iEJ+mjadsT8x0JLB83VphaiE9Y=;
        b=QYB6berExq4g3VwHYHxCunbCp2YOot1NiGV+gD0Lja+oFljUPmPJoufHlfIGS4MPto
         UXtgFr0jceIz1rzNpbf15s9LXnmJUEGDuepaI2n5Z5QJNhZBumERfq/kmf9IO4qhl8MO
         eoPNWt4gDGzyQXcu4zo9QiQa4xAprI449BJdM8evR/j9pCyfjYjQeb9Te2DWcbF6HSC8
         Tt3LBuXsaxKE3TMZR3GbJqvqn5JX8vM8WKs5rM1vDSnEyatJpwcXXzBIRhPtKObOBp/z
         HyuuLCzmTYMNZqCa0BiuWEmRrgt0QgBWvVPWgl1Li2ne24EbQHCLGwFrPZK8QnFfYbmN
         C/3Q==
X-Gm-Message-State: ANoB5pmYJNOKrAbpS66zAw6/Fkbd8XdyvAkJj4wOpSoOgOtm+0IxoUyF
	TTiCDc5A3+6mJiPj30PXkxyzil3IOWA=
X-Google-Smtp-Source: AA0mqf7IgJ03qZuipO+26YI/y9FlS4AHwJbRX3L/vOpC9uy6QJpDU2omJ+igA7EXWUwMvu8D1OiRBw==
X-Received: by 2002:a5d:4fd0:0:b0:241:fdb9:c7b9 with SMTP id h16-20020a5d4fd0000000b00241fdb9c7b9mr35783125wrw.46.1670412456626;
        Wed, 07 Dec 2022 03:27:36 -0800 (PST)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id j42-20020a05600c1c2a00b003c6d21a19a0sm1679036wms.29.2022.12.07.03.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 03:27:36 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 1/2] proj: add a packageconfig to build as a static library
Date: Wed,  7 Dec 2022 12:27:29 +0100
Message-Id: <20221207112730.264291-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 11:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99971

Add a packageconfig to build Proj as a static library.

Keep the library shared by default.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta-oe/recipes-navigation/proj/proj_9.1.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.1.0.bb b/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
index ab69f0776..818c87bf0 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
@@ -16,9 +16,10 @@ FILES:${PN} += "${datadir}/proj"
 
 BBCLASSEXTEND = "native"
 
-PACKAGECONFIG ?= "curl"
+PACKAGECONFIG ?= "curl shared"
 PACKAGECONFIG:append:class-native = " apps"
 
 PACKAGECONFIG[apps] = "-DBUILD_APPS=ON, -DBUILD_APPS=OFF"
 PACKAGECONFIG[curl] = "-DENABLE_CURL=ON,-DENABLE_CURL=OFF,curl"
+PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF,,"
 PACKAGECONFIG[tiff] = "-DENABLE_TIFF=ON,-DENABLE_TIFF=OFF,tiff"
-- 
2.34.1


