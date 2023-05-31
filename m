Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5032BC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:31:02 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.9187.1685521861601219691
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=b2z5Sc8I;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.48, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f3b9755961so6177645e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521860; x=1688113860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efacBSdZi4eB+CFnGwCEVWBOviY5602D9th+4vPBy/g=;
        b=b2z5Sc8IoKhtRGFVCyvh6loqTjsR0u6D3Q1eKN1Uxjg+j1r1Sy+DBWzdppNX9zm9iC
         ed7BvjhGbOWqx5IfGgMN2iF4HZ2qIJ9Yof462BdC/dNpWFp/76PPegfMIRkKxQJtQqmM
         3IFLn62Lk0dK+kSlplc9w/oPr9xhxCh6jUUwxOaXW2i8R7JNgoxnkbseKKVOCt1+UhF8
         GMtg9ezEPZ3crpHJTdxHx81KJqIYpQ9Zy/JLLCF4noiRPUgheCr2SymesIj5kYhd2Sl/
         beZXzwsFhAp2Zuih+kE9B0JqHA7cJyBh+HRmbUpOOppu/SuN2vwB+r+rmd0blGxzPtR+
         CcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521860; x=1688113860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efacBSdZi4eB+CFnGwCEVWBOviY5602D9th+4vPBy/g=;
        b=OpssPqbV/hPC+Yj2shRNtsdV0GKPxL2iyjuuFGuMLpv0w62P26mPKtebpmoo2Q07vj
         efoVo0u9lltLvJgwnXS03SBIKTIZT0NTxRcswQImT0ozoREHqQ+sytp1dUETBqYt+C3g
         //Gewae7WMBgmSX5vXmhYY+7NmuNTwWFJC2e/JKKBhDJGu7pW7FGbhDgcH5dSl9BNbTS
         xosQCTQAQMXt5adMd4q2qEeAFgKvIQA6hoDF+gcVjrIFFWSZYCHi0IXpu+at6tnE1w4w
         fVfP0FHxUzmtHKBM8OZt6MOEgcrHm7yffu3jMEACcFNf45TAsbiUagC4fM2QD04N2w3P
         Mq5A==
X-Gm-Message-State: AC+VfDzmv+fIQ9k1otxr/C+Ec4wNimryeNvdIFBPcWvYsyZjUmdOSxr8
	njvA9NQrgX1BqUSX0j2+SSzEDH10XV2rDeCg6wc=
X-Google-Smtp-Source: ACHHUZ7CeEqWVlPIoJuziRSta7TjpyDBbJ5RLfTBLH5cCC65+iQmAsr6DAQUnasZR0fPVgGKXUtbuA==
X-Received: by 2002:a05:6512:243:b0:4f3:a5da:118e with SMTP id b3-20020a056512024300b004f3a5da118emr2336880lfo.16.1685521859962;
        Wed, 31 May 2023 01:30:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id t16-20020a1c7710000000b003f604793989sm23338288wmi.18.2023.05.31.01.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:30:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 096/149] python3-ninja: add missing run-time dependencies
Date: Wed, 31 May 2023 10:29:11 +0200
Message-Id: <20230531083004.11083-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531083004.11083-1-brgl@bgdev.pl>
References: <20230531083004.11083-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103024

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-ninja_1.11.1.bb        | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
index 47a70aa38..3b9077f32 100644
--- a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
@@ -15,6 +15,11 @@ do_install:append () {
 	rm -rf ${D}${bindir}
 }
 
-RDEPENDS:${PN} = "ninja"
+RDEPENDS:${PN} = " \
+    ninja \
+    python3-io \
+    python3-json \
+    python3-ninja-syntax \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


