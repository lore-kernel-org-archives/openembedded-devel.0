Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B34C7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.9055.1685521520800913305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=ZVl39jBB;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f60804faf4so39527825e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521527; x=1688113527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7zeAAriHw2EnfWuvYGMAVyZzgzYRvzCclQN1+ixu4Q=;
        b=ZVl39jBBNdttMzfVwrtSHAPCFIeORQeHNpGNWobtI5PV3UbVYvOVpOoE+bTyylksOX
         TJ+h6WWrNubgf5rzjjn/7O9FZs6xK4nEon6Ut2uJGAc3VFrmA4LYAX1UXBjn8g+rCxuR
         VaoGUo7wEejeODVO90+fd2Yybr8DSrA4lX9i7SkwkaFur2R6xRQjvNTKU/vpzdaK9Ufw
         Ps+DWuvIVfz+7trnGU5YeTY+23IyN0DVeQskCbrgeODh8Fug+FoaEn7QkBCwDSE3k2hH
         lVYE7E2bT5O0DoENc9eYU8wnVUe6y6PvM41QvwdLUKaJLFhDBTQDBW1SP8zgDTRYcYqC
         MBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521527; x=1688113527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7zeAAriHw2EnfWuvYGMAVyZzgzYRvzCclQN1+ixu4Q=;
        b=UWyVWuOB96fU5rfiI8aeUbIjeVO9U0Ax5c6aO095o8f7dPYqXcuUrv1859t7/aYrYo
         XErQhOZ5D2ITIT74XRE/LlLOnB+ZyaIaAq2AcLo11pG36BkbeeKdqCNiUSBwgQ6B/fgi
         mJdtlFdNz49S5JShHEoYjH/KR4bS3EGDCtQlgthIrUBKuL0ZlTIPzfxiJZqaUdVij4BV
         SiZIWEXuMgjVzkTvX6qjL1zUC4Dxp7CvBvg2/bkjS9dMF0GJiATZKSoNKHLQZw9jykih
         WeplmrVgG+4l3p4rcFSOhvf52hZTRXenloEJqgdVFNqQTilr7F0BreKoDEWhs8MnJJw5
         S/hA==
X-Gm-Message-State: AC+VfDzpkCGnyQOb5en+C0dk55QGo94+goZEazq69gSg4tksd6qclzzi
	LXCcjZLthcelLYBdNlfZ6pVDzg==
X-Google-Smtp-Source: ACHHUZ7KfniKnfm7SeD+SzZ4hUG3AC0zlEobnqAal+rOpQwjX0QAPvGs1+/a9dLKlRT/ewaIO62/+g==
X-Received: by 2002:a1c:ed13:0:b0:3f6:69f:75cd with SMTP id l19-20020a1ced13000000b003f6069f75cdmr3643082wmh.0.1685521527744;
        Wed, 31 May 2023 01:25:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 019/149] python3-uswid: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:27 +0200
Message-Id: <20230531082437.10646-20-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102946

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-uswid_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-uswid_git.bb b/meta-python/recipes-devtools/python/python3-uswid_git.bb
index 6b2089893..40adc34c1 100644
--- a/meta-python/recipes-devtools/python/python3-uswid_git.bb
+++ b/meta-python/recipes-devtools/python/python3-uswid_git.bb
@@ -4,6 +4,12 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-or-later"
 
 DEPENDS += " python3-cbor2 python3-lxml python3-pefile"
+RDEPENDS:${PN} += " \
+    python3-cbor2 \
+    python3-json \
+    python3-lxml \
+    python3-netclient \
+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=40d2542b8c43a3ec2b7f5da31a697b88"
 
 SRC_URI = "git://github.com/hughsie/python-uswid.git;branch=main;protocol=https"
-- 
2.39.2


