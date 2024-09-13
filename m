Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5655CEEEC2B
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 06:20:58 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.67530.1726208454147801695
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Sep 2024 23:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NlX2LY7P;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20551e2f1f8so5883165ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 23:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726208453; x=1726813253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3hPJ+w4zGiGqdMYCxuwRZAuVFcRpSLgxC0Y0kmQePkA=;
        b=NlX2LY7PISISVGU7IJHsb7jxFIJj0SpZy6K1H6E0MB+B4V03bckSl1GIyElDjHkZPt
         kr2h8ywsDW1fVCcnNYM3qM8XmeJIPcwDU1y66e4C3eH6AMtK9hU+BNqqCl5K50lOF7T6
         WDqGO1iBMPeLiMYV8u/WOAv2Ct+kCY0/GMgkeGOnJO5/88if3tDW/0pbnDpmhagLXrfY
         caYbRoxBw9EUiFARvpo6t0BCbd1mIqsLiNErNeGFBT7GkqEkvx4G00cKRu7Q562TB7X4
         EF1axX1sS5s/3QHFsf0A4Uv/ppAvKi3vK0VqMylk3Lx2asHtj5FVH2yM7pVOZLhwPBe4
         ZSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726208453; x=1726813253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hPJ+w4zGiGqdMYCxuwRZAuVFcRpSLgxC0Y0kmQePkA=;
        b=W8SbLoRwBAjaBVFVtvV0caI3ceeZ/hGvVTl//9niJt49GMEXjS0V780GstLnLZL3iw
         7JXJyxDngwbqiyKMlyRjg0Hrz4VNf4LzqW03/J+zqHG9T/6bilT9dkAIbDYzputOlqd+
         GL+oxJQvM/mddfvpkh4bseoyFR8Nd4fWawyFXjXL9RvNUVBfYBmVZLiOsd0hB7h5Js/a
         8ipv1L2jGFamOb0EuBzPW2jiWp2jyzasuWdhQy0b13fiSaShtrYKbcvHL/zobfYapLh0
         EhyXZIHBYn8GFD574WurDAYIR+xmVfDSVZ7naiHYOVR/QhvdwSTutarXIRK7+OZd922E
         K8jg==
X-Gm-Message-State: AOJu0YweZYdPl1WD0ryVU+FhqAdMo8qbAOb9V3G1r+zqyqj/0hLdGuhW
	IxpPgArkuc1Tdxarx6MNEUjdR4cYh5k5heH34ZqEclJCwMz04/36v1RCoIbw
X-Google-Smtp-Source: AGHT+IHsIVinzfUSZkkGuplE8aj6mozCZqDK0xAE4b+rs2/y7EzNGWjxarzqUhHNGqqAgdYh3uqQbQ==
X-Received: by 2002:a17:902:854b:b0:207:3a4a:de43 with SMTP id d9443c01a7336-207825346f7mr19320235ad.34.1726208453159;
        Thu, 12 Sep 2024 23:20:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c5d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd0edsm22401795ad.170.2024.09.12.23.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 23:20:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [meta-oe][PATCH 01/10] paho-mqtt-cpp: Use system paho-mqtt-c
Date: Thu, 12 Sep 2024 23:20:41 -0700
Message-ID: <20240913062050.2597921-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 06:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112260

It was an overisight during upgrade

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
index d2fbc3a34c..6f2efcda50 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
@@ -22,4 +22,4 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-EXTRA_OECMAKE += "-DPAHO_WITH_SSL=ON -DPAHO_WITH_MQTT_C=ON -DPAHO_BUILD_EXAMPLES=OFF"
+EXTRA_OECMAKE += "-DPAHO_WITH_SSL=ON -DPAHO_BUILD_EXAMPLES=OFF"

