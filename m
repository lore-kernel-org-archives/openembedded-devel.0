Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E7AC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 11:59:30 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.14001.1716551963164237290
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 04:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=p/3NctJr;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5295f012748so906693e87.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 04:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716551961; x=1717156761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aUz9XZl6ycVvra9WHEEA+CovMZHhJg7Z/1cLst1W8Rc=;
        b=p/3NctJrgwYYMObEam2xeFeU+TU7PHKM98X/wYViixXHBOUpDuFuXZMx0BPmXl+8CM
         tnAw3PnQ0C+OsyGU9l89STg73vJK/xbnLZ/iIO+ju4v5iD3+xs98IJAUCJpl5xGFhz/Q
         wP1zd+SotgeHqTq6FhdQxePipN8bjAdHSg2GT3UxDSrpYBR18vClbjVUAffEXilYnwnK
         Yf2+JOTQ3nLjyu98rGLip8xxVvLbqWQS6XHb7ByK+ZyEnhWET5ou8u83FfbI7ubcBmDj
         3c73vqYezcQTkRCoJHdbGkfk0ak9UaMXY8oRi12xMZfHaRuZ6ClrWWzyUPyUpakJgxK0
         emHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716551961; x=1717156761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUz9XZl6ycVvra9WHEEA+CovMZHhJg7Z/1cLst1W8Rc=;
        b=voMKDmLuiqEcPZ671T7gVUUs+oYOgHLDPvgSlESbkIcT6jD2RgjlKcwtfGbPLW9EGe
         TNskZtEA2BNlbplVP9AEfJWQ3XhVandvAfGJiv6goqRQ2hXHvTLpfxk0Cqku7PEacsOT
         NSQ2eid/IcRR5c7YPFvD9XPyrfXRUzHFnMq79BVIDJ1UllibgJk6wwX43zpKWeX8O8ta
         ciDivtDZpyjZcpUUS5aaNPCwN3iDQIWaX8G0DAkMJZ46X//hJQNI+kI5ZapjY+aqKu9/
         uX0FLoFwKj8txq4z+vJdxbCv84jueP/Txm2lYS171MI2OwaCLxtmF+XpDxRhr5zftjJ3
         vk6g==
X-Gm-Message-State: AOJu0YyTTWdHY4McZ6w+YKMEJi8uDq39pVcn/BCsrjtjxZaslbhw8tMN
	Koi58Kc07aZwWxPHxt7moqUjQaGbdqCmh1phP9baJGeWPIXfX8TIccBB8Zy1nQ+JIczQmTGvKsH
	z
X-Google-Smtp-Source: AGHT+IFcIXoUVCWPQv3lu+kJdHKmTCmtmt3mygM3bGTuzCdLgp3BvccYrVHXmh9Zmlpuq60E7xQ2OA==
X-Received: by 2002:a05:6512:3b8d:b0:520:85cf:db7f with SMTP id 2adb3069b0e04-52965479b50mr1664788e87.28.1716551961022;
        Fri, 24 May 2024 04:59:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066bd0bsm165254e87.165.2024.05.24.04.59.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 04:59:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libcamera: update to 0.3.0
Date: Fri, 24 May 2024 14:59:20 +0300
Message-Id: <20240524115920.2502043-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 11:59:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110513

Upgrade libcamera to version 0.3.0, gaining support for SoftISP.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../libcamera/{libcamera_0.2.0.bb => libcamera_0.3.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.2.0.bb => libcamera_0.3.0.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
index 45d6be31ec95..11dd2ba56910 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
@@ -16,7 +16,7 @@ SRC_URI = " \
         file://0001-ipu3-Use-posix-basename.patch \
 "
 
-SRCREV = "89227a428a82e724548399d35c98ea89566f9045"
+SRCREV = "aee16c06913422a0ac84ee3217f87a9795e3c2d9"
 
 PE = "1"
 
-- 
2.39.2


