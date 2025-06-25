Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4D0C77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 07:42:38 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.10066.1750837353284521405
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jun 2025 00:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SLouln2C;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad88d77314bso261752466b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 00:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750837351; x=1751442151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iuYd7pjsQT+Osk+zLBssBoJ85pg1kKoFcm4YgpVsQcA=;
        b=SLouln2C1SWnZlv1X4+vryWacY6yqFINr3vTE14F0RIBAj5HvG9EQjF0lXI/1g9ZkF
         0660XVP85Fwd/yjWrqf2YwUJdBnBH1LLnUDMq916OhXHyAHOXYiBm4Ujx43L/w6mIOZ6
         m+0+MpbJKnZRCPaYyrofb1FX7al0DwW25nvD/gAnakEDzL2lRpXV0TL6P7y1wjPOzBDR
         W3bLd6wdiVTQWA9Sv4hNgge0+k6eN36k2LcH0ZW2+X3mdh6+OTMnRrV5VTkH38Ne27Wr
         0mrhtP2zpys9JaKIQwOUwPtfBjOJ28iHNzdYYYzOYmIU8zt7P8NpYFk0m504ABvM3WHp
         S25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750837351; x=1751442151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iuYd7pjsQT+Osk+zLBssBoJ85pg1kKoFcm4YgpVsQcA=;
        b=o0aXZVM55hTfYrTVebRWQ6ysYeaxR2v3RI4DWxTCnlImTTgAUshk18BGCAb7bV+zBM
         FN49xSDIyguqwL4NTF8L3PdXGUNVQKOgdQbcm43OtGWJo6gplkTlw0P7s51bsTYF2Wjc
         1SHStJ2nv+VVr+9e6sJmHnFjZhB5AlbpeuTaYZT8dPjwMfQBV0uXspOBZ8R3kD4UQjCo
         eqFaRNNlTsUT1/Uq/aPy/zXaOtbsdjR0FqRMdv5EQstnlfTRg4iyKgEywmB/e7W3oXGW
         CCeuOjqo0UAvf6dh1M57OoCbi03seJzPePWPdSWyXYVZZqSgNABYbdLLrs0V8zSr2mhv
         WDBg==
X-Gm-Message-State: AOJu0YzzaFtli1zLXdX6e2DiZuVK/0xOYQ6K73kyG3mXuwDulwOOGCf9
	u3Z9gFlELw/pwGwWRiw7xGt1oL5p+zap2OUIuDrt0CCVMk2+HsS4NcL0UIe4Zg==
X-Gm-Gg: ASbGncs/dNzja8d2SfMCEAiY9X4Kx8xsxziAlbgI0TBswIS1yr17aLPmkGwcF5rDRJa
	A9U+QumDYhBTcx10LwzFh5GTL/8dmD/fAfe9S813JRFUqK/m6jDm0GGqS22F35qZ5TUFGCeXmzM
	WQ9mnqIw0xAzDv4lw4oPYv+w5fRyaBZdMz3M6ZUEwSi586Yiy7XzV7MD+wN52CyNbeS5DaR0oXE
	NtPILjN4SM8mIxn7Y5In4g84+CPT38L7CD8T0/VwagefxjG7C8YQ2NXVt2WL8ja2SCLd2YunxGX
	lax7bbpRetfDSi86iHrQZ7EHcXtGhnsgiGG+deVj5BFoFTikvdDCHJw1FZjyhSXYWYm8ypX3tvd
	ZiA==
X-Google-Smtp-Source: AGHT+IH2ZREnJlbSQDz4XhBmGmCQf415By9KJ9pPgFDuZHn9bRdtxRFG/P7RhbqNuThic0vIg2UmWw==
X-Received: by 2002:a17:906:ae94:b0:ace:d710:a8d1 with SMTP id a640c23a62f3a-ae0be894212mr171117466b.24.1750837351272;
        Wed, 25 Jun 2025 00:42:31 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4e32sm1013038266b.57.2025.06.25.00.42.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:42:30 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] paho-mqtt-cpp: add back SRCREV
Date: Wed, 25 Jun 2025 09:42:30 +0200
Message-ID: <20250625074230.2568963-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 07:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118106

SRCREV was removed accidentally during last update - add it back.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
index d1674403f0..5b4aed3001 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "17ff3dc0270738adc710667be44847eebc038ae0"
 
 DEPENDS = "openssl paho-mqtt-c"
 

