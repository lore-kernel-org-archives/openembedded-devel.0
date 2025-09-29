Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56CDCCA474
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:45 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.52857.1759151084932484418
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rpitt1ab;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-634b774f135so5740662a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151083; x=1759755883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/oUSbiezshyKDDwTcNltjhvOjI0oMOIPTFLeltS7ZA=;
        b=Rpitt1abq8m2GLYH8jWSIRYZp75xZZguUII9dvuMYO8kMr+n28QA+kQF4mP3T1hsLq
         0o8/EDJSAc4clueT3t6ll2kvAF92f9k3n606xjNWkuy0FlYErPC8zKXxX8sgbzreo38S
         9ipd4TM/tKj/vV2ceEdL0O2dG9CdrF5jzD74glpFGXSSq4VX1pUq8MF1ApNVT7hYqgJf
         sgnroCPMK3jbqwhxRbrwPzpAirR0Vi5ZSBfATNidrsJRN/ZF65+GJeXR2rX+OzNIBZd8
         T7lvKQJHHSFVMCDZApKXTnNIgwOkee7MqXsl5qOkQC0dpzk2ykKY2SItG+CwFD6/JA/q
         0glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151083; x=1759755883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/oUSbiezshyKDDwTcNltjhvOjI0oMOIPTFLeltS7ZA=;
        b=KvNSbtYwfvxmP4ZPNDKhR+B+/uSGu/7piyrTAmCcMLv5b3iVoI9E6myKCwFms9HZJh
         mBrsZYiOd0arwekb6Ygxw1VoKEQ3/F/a1+LyGJm0aMNSLZmhlIHxdJmhV2Deay8i+iKW
         61fvlihJvTuxDGhQl7CgGLt0A49YyvQGza73wFEB+M22kQT9c+MfXkaIiFpXHUqrLf8f
         B9T72z10PpZLxE7aiFzZGPyQRCG6kglCoiSRRiLXNHk45hLlkG2QznXwmBxxp+KCJPla
         SN4tCd4LmWEvkMgRhaX8PZwqlgU3GL/erICttQ3QKmK/UGk/+cSpb39vO8JBwoswm7cV
         UnDQ==
X-Gm-Message-State: AOJu0YwNTmr1RhUFXS5ShzXaqyqk8X0RV89lE+eMo4xAFo/UW/pWKKOc
	j9IzIT5Rjb8oKFBi9UKLtZoHwd2A3+R0wahwciZstOQezdFIsdze+PAvhYBGGw==
X-Gm-Gg: ASbGncvKhKRDkZkwN2nMr3sD2rcbqC+LjHRDp0zRDehqvkNRe+MVl43U6aDMB3pSpgt
	B19ZsnT9nBS4E4rMJ9sYQu7oB1UUeIE+yalSQdf6CldrpaWJ7pecO18uXKPbDqaPfa3LrHLr2Zv
	Ovy3bVAEpAVP4fZfz9KTGZo1IskxRipNZVNzt9PCiXhkbtdz2UMagdoqCj23OaqAZxN0UimC68N
	7FL7Epa/A8JFMujDwa/Sp2tOk4VCV/7qslQeYKxUXvzw4EYWQ5pHoSIOKF5JFCS6CTiUry7O/xZ
	E3RJ6xQMnh2DJtTRKkhglRy/59xqXDLbTA565ElSJ3T4gR22VkduCr3GSgeaGDB6K/OsIA5e+JV
	ErFG6JnT1DLrzyvgDOJCKT56CeEjY60rdXp6eNMEyIw==
X-Google-Smtp-Source: AGHT+IGxqQRy/xUq1iz7KyTwVCifpTZo053RLfoxDuM0ACP+qDNLLPmRIuCCS4c24wow2CwYjDZEbA==
X-Received: by 2002:a17:907:9721:b0:b2d:830a:8c0a with SMTP id a640c23a62f3a-b34bbbda065mr1716414966b.35.1759151083219;
        Mon, 29 Sep 2025 06:04:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 18/22] paho-mqtt-c: upgrade 1.3.10 -> 1.3.11
Date: Mon, 29 Sep 2025 15:04:21 +0200
Message-ID: <20250929130425.2912077-19-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120031

From: Matthias Klein <matthias@extraklein.de>

Service release.
Issues resolved: https://github.com/eclipse/paho.mqtt.c/milestone/18?closed=1

Signed-off-by: Matthias Klein <matthias@extraklein.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ef4fb2211e3488bb0412557e1f933e4e201fe9b9)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{paho-mqtt-c_1.3.10.bb => paho-mqtt-c_1.3.11.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.10.bb => paho-mqtt-c_1.3.11.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.10.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.11.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.10.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.11.bb
index 374922e146..218672e266 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.10.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.11.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http;branch=master;protocol=https"
 
-SRCREV = "eff2da4875725509fc97641b118d6badf3e3a08f"
+SRCREV = "0995176412616ae8f1cba51c8d609fe4b69687ea"
 
 DEPENDS = "openssl"
 

