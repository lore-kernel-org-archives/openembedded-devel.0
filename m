Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370A3D5B87C
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 07:18:53 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16558.1765869530638276667
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 23:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HCHFmuqE;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7fbbb84f034so257007b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 23:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765869530; x=1766474330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4AR+Dce+hdRk/kbGoTBFuh6NUIKFjYa2ppTi9o64eAo=;
        b=HCHFmuqEdxuaw9hu1KUzu1s6jwekj3+dc1kl2A5UmvIJ2cB2uq2BnviI2Nac1S227O
         xE5ly7spBEsRcwAvFKXFir0yX126YP6+3M5N2i9HXw8siTHIHl9gwn3NkkEJPGTh45jD
         SN1OqM//qnBIzAbxqy7mn6UvApWUbZKl+/BtZAr+viJ1Wrp+uRU/fH+ngQyK3qcpmHgY
         nasjp3ZgcLQbCF7v/BYBNwRpdDxsGD+2Lu0YeuAUKy9n/AZofMHF43H7A1EhnVq7pPVv
         zoOq/B1se2LJfytK1GtqAcp54FsdTmhwNNXCrQQpQclqaqStjg+rOcI8aQq/GT7fwT4n
         oReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765869530; x=1766474330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4AR+Dce+hdRk/kbGoTBFuh6NUIKFjYa2ppTi9o64eAo=;
        b=TwyFH+9R6SaWi1Z7wzqEOtUtELvh7grpmuE7mEeiNXmUBiaQf/uP9jM1QelE/LHyak
         OGFY4hP0j/TxMJWDH4Emxj2uSDdjGDASStqZbWfdJ2cJc9Wi5hKoJYq5Ho9xrMsqGaLh
         ApFrSFZL+PuRLb2rQuto3+JVRHjwerjXURk2sz5yc9UUgukDvKDXmFK1qAnrs2ATkDVe
         0jgP42NqjbBaImRnzrHgjjR+gUksIble7nF8F2MvIMUypaw8Od9mcYL7qSd+/MZK9IkJ
         8qo7F9+vJ4eeF+oK3yezkejHqP7Lc+sio/7Upx/We/KgawjfSXCkKedJRAhiNnprgJTV
         hSeQ==
X-Gm-Message-State: AOJu0YyepNNKWRv+mIlIgg7F8wCeTmLBsN3403esPxret6L3zkTY5Qgl
	DwhZHYG1TV59fgGXt0qJgeOPl6aH+7Xwsp0WgzdzGve4O3Gz9KYwlWyAoFf7vA==
X-Gm-Gg: AY/fxX6H3+tiap24TU6AhwmgthoZPaG4YIhj9G238kzKZkiwqBqX4xnoID/YpBq5YQD
	KYBFNFrT9LIOazdvD8iESlT3qX0z5Q14eC3HTvw17Jc3f5utlqyA0ecAbAvho8vRG7kscjslcnE
	NdtazKEwMher3NzRaXq0zple+dQB1dxf3ASpNiL3GVMvsNUm7whS4RQFbRWa2e1+swXrpFQJxvB
	d3lwaX/4eZpjUpFB1MV2wcFyM4E4F6QfvYeMJbBbLgGW5/cnu1wkVE3rS4AfNOXWV1ivC4EG1mR
	vKKizc0OmLBZadoWM2mVIkZUGv3khZYjHg4raec7j8p3Gxxl+rKBy9nlIuvVYMcZatezrhjOgJ+
	2Nhc15l6jB4weKIdwN3Y+7hbP+6tRmQDl+iaqMJFoz7hOICXSfV4yR77EJISBmCpm0hsp96b5Pu
	/+uilzhJoQLwItLlW1/YDekuU8
X-Google-Smtp-Source: AGHT+IFJIQCfBr+vZBJHsw0/cSbmFmdQXSxRNKcjAxrq1x4h/5MlTuYlcwoVZiDdB61qRiozIroadA==
X-Received: by 2002:a05:6a20:e292:b0:366:14b0:4b12 with SMTP id adf61e73a8af0-369afff1e93mr14628814637.78.1765869529732;
        Mon, 15 Dec 2025 23:18:49 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d50f9fsm152598275ad.44.2025.12.15.23.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 23:18:49 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][scarthgap][PATCH] openh264: patch CVE-2025-27091
Date: Tue, 16 Dec 2025 12:48:40 +0530
Message-ID: <20251216071840.3180374-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 07:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122686

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-27091

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openh264/openh264/CVE-2025-27091.patch    | 28 +++++++++++++++++++
 .../openh264/openh264_2.3.1.bb                |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264/CVE-2025-27091.patch

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264/CVE-2025-27091.patch b/meta-multimedia/recipes-multimedia/openh264/openh264/CVE-2025-27091.patch
new file mode 100644
index 0000000000..fc7ccceec7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264/CVE-2025-27091.patch
@@ -0,0 +1,28 @@
+From 09672b2fe25ca0ca6537412eb835209b6c7c791b Mon Sep 17 00:00:00 2001
+From: BenzhengZhang <140143892+BenzhengZhang@users.noreply.github.com>
+Date: Thu, 19 Dec 2024 17:12:42 +0800
+Subject: [PATCH] Potential bug fix (#3818)
+
+CVE: CVE-2025-27091
+Upstream-Status: Backport [https://github.com/cisco/openh264/commit/63db555e30986e3a5f07871368dc90ae78c27449]
+(cherry picked from commit 63db555e30986e3a5f07871368dc90ae78c27449)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ codec/decoder/core/src/decoder.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/codec/decoder/core/src/decoder.cpp b/codec/decoder/core/src/decoder.cpp
+index dba6711b..c639cf7c 100644
+--- a/codec/decoder/core/src/decoder.cpp
++++ b/codec/decoder/core/src/decoder.cpp
+@@ -848,6 +848,10 @@ int32_t WelsDecodeBs (PWelsDecoderContext pCtx, const uint8_t* kpBsBuf, const in
+             return pCtx->iErrorCode;
+           }
+ 
++          if (pCtx->iErrorCode != ERR_NONE && !(pCtx->iErrorCode & dsDataErrorConcealed)) {
++              return pCtx->iErrorCode;
++          }
++
+           pDstNal += (iDstIdx + 4); //init, increase 4 reserved zero bytes, used to store the next NAL
+           if ((iSrcLength - iSrcConsumed + 4) > (pRawData->pEnd - pDstNal)) {
+             pDstNal = pRawData->pCurPos = pRawData->pHead;
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
index 6dfd759355..f0fe4f874f 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
@@ -17,6 +17,7 @@ BRANCH = "openh264v${PV}"
 SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH} \
            file://0001-Makefile-Use-cp-options-to-preserve-file-mode.patch \
            file://0002-Makefile-add-possibility-to-disable-NEON-extension.patch \
+           file://CVE-2025-27091.patch \
            "
 
 COMPATIBLE_MACHINE:armv7a = "(.*)"

