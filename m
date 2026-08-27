Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEE9C61DC6
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 02:53:54 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28399.1787799227023191328
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 19:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=is7WtzBd;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8556ec44e9aso3727b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 19:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787799226; x=1788404026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q8UpYBoc/M1BkcYKHAYSrQ2SzHDTpmMXyDtNhyPg3wM=;
        b=is7WtzBdaI6XQkCgl/qVdaxAAbDZZBk0hRne77IDkTc1M8oS5PaCBnx065Nrjm5wuj
         O+g0NstKJ8DpIPgK5mJDDR/P9mhz1uWd2iOp9KfMTVBmda5gLMwvDDgJWDPm3vlQrIA+
         EAlphpUQBmnTA58M7nYi02P9yhSAJjShxMfT/ftmfh/fpSmSca4F6bVZpAQfYfdjS71G
         YYkd+zdPRE8u5tYIsH+tY2VPBwjJ6t326X/kbxdmB4xTKPlgaDVs/SuXxxmoZ4i+AARl
         Xn2Wj4co/s86ehPdYC06vfWeoG5VSUKqfZE61ukX+Cti8gr2mdVXbK+ND0Ef9Bxpt9ke
         vpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787799226; x=1788404026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q8UpYBoc/M1BkcYKHAYSrQ2SzHDTpmMXyDtNhyPg3wM=;
        b=TQe+Jy5wbgtkEX3vMDA++HLOim+1c9KVBeHzjJus8EkWCWRt9SfEjZFza1JLOURY3X
         T7T2j9EVVAQC4vtsSLE8zJ1y8pDhh6xzJlxvh6SWk2EZsQPvuwoW8krk/XRPNEDFKJ2t
         q5PH4mMXZLhu2aprod7lHR+S50d/R0ZhmuvGI9o88yLo2iDPvFPWHMR6A9vL2Y5IsjeH
         vcQLsb+N4eTT9tYcEUxj+fqGDX37zsQLmDuzVPynMW0hAQAYiHzOHLUqVV45e+T/IMDL
         ri2+h4zvAQH8kLlK1LVW9Z8EXF6jHTF0T3dNmJEfrntatWNJ5qoI8wTOSRnFHP59PinL
         22Dw==
X-Gm-Message-State: AFuF++kju1pvwWAK5hdAf5o/okoyoaR205/zt6554orcZ6sO/EL7j9yX
	aRhAnCyRth9rt9S/DoqQxN/QNk4rowN65WK8q99Im4hxpAO9Hlf9fd7s2svjbA==
X-Gm-Gg: AR+sD12wdHHmoilqX+kolX1i5mvj03Id1FeOapVVbKI5LF8xufJm62N2s47FL/aPjWe
	OLgjygM5vGv1k7CCQweUXaVLkyKNZg3O62fpBHKIKJoRed7re6NU9W1ZGN3Fwc2wDq8Tvd94RXq
	GQdmBQBcw0UOd84ndgRM6cVLDYD1OfbzYRTjlqqNIAZ6+oEXHjUdz4Z5X8Wr1Xs2NnDGgLGaA6m
	tFNNfEZxMArdQfc0kJM8F8gOVZEHBqg/L+aDI9cv6OAy80Ugwjm8OV56XaUqUdYPAiDv/RdbUOM
	RDwvu72rUEaX1BTpTDUeMSc+7J4qAzVgcTNfXToWLpUpv94VaIfFxHlG3Q9rMOMniJQ0k8mCs+I
	BEkPumZ8r6TF2PiyJA2ITEGNQe5H7hyRNXkGTpDU+SId7frBeNg8vSXaT506DolFiTni+B0Cs2+
	rkzwRK0Sdtvc38UOr7tcjS7+uMxAZzSAVKFnYCGGW3JpO+xc43z5K4OOPaYRrOXjplbZDxLzUD
X-Received: by 2002:a05:6a00:178c:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-85371cb5696mr20533163b3a.1.1787799226337;
        Wed, 26 Aug 2026 19:53:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8556db7ab0esm5787b3a.48.2026.08.26.19.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 19:53:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 6/11] srt: upgrade 1.5.6 -> 1.5.7
Date: Thu, 27 Aug 2026 14:53:18 +1200
Message-ID: <20260827025323.1433982-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
References: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 02:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129526

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/Haivision/srt/releases/tag/v1.5.7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/srt/{srt_1.5.6.bb => srt_1.5.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-support/srt/{srt_1.5.6.bb => srt_1.5.7.bb} (95%)

diff --git a/meta-multimedia/recipes-support/srt/srt_1.5.6.bb b/meta-multimedia/recipes-support/srt/srt_1.5.7.bb
similarity index 95%
rename from meta-multimedia/recipes-support/srt/srt_1.5.6.bb
rename to meta-multimedia/recipes-support/srt/srt_1.5.7.bb
index b4ae8bed09..2796ee443e 100644
--- a/meta-multimedia/recipes-support/srt/srt_1.5.6.bb
+++ b/meta-multimedia/recipes-support/srt/srt_1.5.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/Haivision/srt"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRCREV = "c63c311e88aa55e430e3b7d94b89d790994f88c4"
+SRCREV = "d99d2e1a3b1a213b03c7dfbea5133898935fdeea"
 SRC_URI = "git://github.com/Haivision/srt;protocol=https;branch=master;tag=v${PV} \
            file://0001-don-t-install-srt-ffplay.patch \
            "

