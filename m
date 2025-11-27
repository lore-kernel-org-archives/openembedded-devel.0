Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D91DD11183
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 13:18:57 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18163.1764249536165846809
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Nov 2025 05:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JfTWsLR2;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so7911745e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 05:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764249534; x=1764854334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7BjCGJuCmZqOlXGo0KCeNtWc2PhqomkMUcS1CA4WtYA=;
        b=JfTWsLR2bJ7cDCjsd8pQ+o7E7mnc+znqE8qCECvO1Ur5KHZcCFdC6cBhP4GyIsMAH0
         iine2wka/+OsoQjuJbAOmIjcKBcOpRRfatX70Zk4zqbK4eIY8H4+94te1iz07NBk+eP1
         Cs6iaF+xNloy/f9ZgY152krxZ6AZlhD1ruIoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764249534; x=1764854334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BjCGJuCmZqOlXGo0KCeNtWc2PhqomkMUcS1CA4WtYA=;
        b=Ac3z5JK+VA2IzKmAe08kh7jm7j4joeTT8hRtVJd/fxItjVQ6H1F2Dtnas+9wi/BNkV
         0rn4h0CCgSgjXZwkTv7yAGMX7yDjrPeC8jHLYmYWjM/iefVQ4CPhl6aWRg+aTVcLRpYI
         D+y4KdzUN2fHoLycwTlDghom01B4/mdwrLPw/SxloRhnS589ZCpGvCHy2D6wAnjGMUwo
         eRxfVs+0W9ZA74o1UL4zMt1PD02ptetY3dkEv9JCqjycfzad8188aTsDFxLJsyfL5HP8
         qRSDr9hLZekX2Y7cdt1q80lVsIKo5ZrMnB5vpMpNjC7Pj3VcsQ2mJ8160sfMno4DV5ij
         EHpA==
X-Gm-Message-State: AOJu0YxncfMayRTv8RgIshoDh50Tfws1WC/zF9IFTin0b049ZO3uryIX
	UCQCr7VQxXjhCk+3xclgTnctO18pUY27s2bfMsvEQNLLK3oX3SGXdvA7YpPmksY46U6WGbjA+J/
	GiHbz
X-Gm-Gg: ASbGncujbvjG2WLzjpuekJjlYvjol3EQ7gv4zGOY2hshY9ofxoyBGWFzloA02A74hZP
	o5144y3BouRzJldGh1t824ecfh7TzvRFbr0Hzbt0JPJ5jkOcfHGFQME7kwTl2N6Bjn3YpOQWJFz
	6zOMklvqf3KXJAcXi7NstR6jQhFMvOp6EX6fpEO08WViGtUJzqOlBi0T9AUNhxGDvSRy437khIj
	knzexg68BeCEp0AJ+ic9heul3MghJ17/NP53AGDZn2/DQPkU7N/fXfXNnox3F6Nr9JQOAaU/8D2
	51QU8wEQ5BPNb3YS94TUpvjjvAFTOuuUGXDhol8AuAMwZIXl6P1VqHwi7IqgwD1OYRB58BLNiFz
	mAkmxzgU2/ev4arR/ny39VytRhMML17ACYbdJ2Vwfsi06bxONpxRZcgmXKpEmY/HOG9KICz7G6/
	e/iqAiAmDiaNhkv8zpGnNZh4lPsqbfMtZ+PU8=
X-Google-Smtp-Source: AGHT+IHVS3iY4SBfd05lRyBtgRahEpPj2MOB1lfIbrP8sVulJacI2HbqiYHW/8LrqVAIjE9KtwtRRQ==
X-Received: by 2002:a05:6000:1006:b0:42b:3cd2:e9ba with SMTP id ffacd0b85a97d-42cc1d0cedcmr20011617f8f.33.1764249533870;
        Thu, 27 Nov 2025 05:18:53 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a3e4sm3669915f8f.25.2025.11.27.05.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 05:18:53 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-pillow: Add nativesdk to BBCLASSEXTEND
Date: Thu, 27 Nov 2025 15:18:50 +0200
Message-ID: <20251127131850.1256195-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 13:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122105

Add nativesdk to BBCLASSEXTEND because python3-pikepdf requires
nativesdk-python3-pillow.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb
index 4db5db1572..0730ac7d32 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb
@@ -64,4 +64,4 @@ CVE_PRODUCT = "pillow"
 
 RPROVIDES:${PN} += "python3-imaging"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


