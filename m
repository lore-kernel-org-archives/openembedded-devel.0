Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715B5C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:34 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35366.1790506285720183321
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pQT5HiUo;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b355ffso909811b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506285; x=1791111085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SuNBMtYkuXuU6Y3LF85Dp8ojHQQLghI9pESWYoVrK0=;
        b=pQT5HiUoAcA7I2KYp/Xj3mKPexhn2GeIR6e6NM8xFLui8uThEpotXOJlMwU3S5epIX
         7M5aIOLgXPULkMY1wUldQiHfYEHCRNq1jTQ3UEflLh9jU6lJzh1HGeTIVNQRPF3VB+Jj
         K4nXMCvPeIj0o4WqVBFj1qxtLkvafdICZoMZ0frlIpLvdiH11ITotqV00yEiHIcTwGZU
         lNL3qlSjZvU2F9i9wjtWnGlIJIQ8zDDW79+43YJaq8BMvslnjmefaC5pMwYbYDbrwedK
         SanDWEr2rCly367Fgg1mk7MHauJ1zyt+U2mO/mvMbNY9tUH/rKJ5mnYV4tkcyKdRMbvW
         /n0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506285; x=1791111085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3SuNBMtYkuXuU6Y3LF85Dp8ojHQQLghI9pESWYoVrK0=;
        b=NC5JVmL02bY8Uvew3M1B1BgNxk8DY2fPSd3z0VcVs2fhI+SMH5g6I3l62vUDk/oLjc
         KXgXMpU1ddwKDtwo8pIOcMdufhlXiqTYzIqEKL3o43o851rVzMTkQkwMQ1G+/G826y4m
         QXnJayk8NQ7IkRLdXpxmuoX7WUfuAAqVPS97HpmtkBbESeBTn6oDc+XrAlaBejUnC2Yk
         z/M9e3My9/9pJfycsAWWg/disWp6Upb395AuvXLLjRjzHlHAXKV7k+m00FshEHUjJFDi
         sLrM3wH/KTKOZa0aBc/5XhaTL3rCJOnyQZsZBZQHtll2IDJwdRAW+wJ8/MUstr/C8fgJ
         PV8A==
X-Gm-Message-State: AFuF++lF73SMbmIhEbE7KwXJkt4oGUAY7eZzeoRX0CjEMVKD+5qoC1w2
	PsKDbOltW/wdKFU+7kIC4OHby2VA68knE3MKMHxBjdYW2kXJLExofUWVdkQCBg==
X-Gm-Gg: AYBFou2KZHf8Yte9QfbeytyTQeZTqU0x463uLxF0GEtsMcS/tgGJllOiTLYWlr8Mu7H
	B6eiilyA36ShQE4VyZ5G1/Yeh0Bjx3gPPXEsjH4tiSP5g0A9abPdnPrciJ7W8OpKvVCTHb2kqmB
	8NN3137qxUzKWFzvV0v5GyFXuhDpQVPbC0OQpoBZCObKhpxl8a0TzH/OJQRIvyz1EWmkn+pCUsk
	hlu/wef/xC4Ecyq1puTcFge+QzTuKXprnmvKfSHN2NXlbvYUQ0e3cQ2f9kHJg5MxX+8lc0UiotZ
	RONhUnKikT8SRFKYLdNAAAEtm1BDjUwX//gGM7gq2aVAIvvFuf+3Sp6OVDy8ZFbwrgl6wy3X9r4
	aOGReoTXZC/UnG8Eiw4OrC8t2AWmFfPxrpcLsIhVSXpNwUQQ4Uj7reIoY2D/NGlKMB5NgZXFNhw
	/ut1KyptRzc32tU1NV2MpJVLr+8x2j4y6z1PIXac0RuQD7NOm+0SclouVCZp4EneLVgV6tP1cV6
	mfYuz98he7M9kl6yhjjtTA=
X-Received: by 2002:a05:6a00:e8e:b0:882:7f85:291d with SMTP id d2e1a72fcca58-8827f855658mr1184204b3a.19.1790506285073;
        Sun, 27 Sep 2026 03:51:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 27/35] pocketpy: upgrade 2.1.8 -> 2.2.0
Date: Sun, 27 Sep 2026 23:49:54 +1300
Message-ID: <20260927105002.1832451-27-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130361

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pocketpy/pocketpy/releases/tag/v2.2.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pocketpy/{pocketpy_2.1.8.bb => pocketpy_2.2.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.1.8.bb => pocketpy_2.2.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
index 910deba386..e4aca45ae8 100644
--- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
+++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
@@ -14,7 +14,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=224889df377610675315e194ac59276c"
 
 SRC_URI = "git://github.com/pocketpy/pocketpy.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "a2f16e5f1f5fcc3b3d2cc1bdacfc3a027dfe2d76"
+SRCREV = "6cbece9ebc98c19fa2c189dc6963b421c22c40ae"
 
 
 inherit cmake

