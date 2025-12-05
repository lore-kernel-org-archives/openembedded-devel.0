Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE81D33994
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 17:11:38 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30.1764954697075184958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 09:11:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BdQ3GCDx;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so16367455e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 09:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764954695; x=1765559495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=F9sqbpnFrvtEJuPgtGi4c/DTZ7hx+PeUNfu1FG6IfzQ=;
        b=BdQ3GCDxjcjYFFucaNxd7YLJPl0YeH2PhSGLsZ+jHz6dcuac9rQAfqN+bCfrTC1WcZ
         ph8TxjY1AcECVkq9hFpvEAoapYjs9QbNIlBbK7xh3mplm3gVdEZdIS5/zi+l1XnaOgnf
         SQo37JvAhK6zDmKs2flZDxuHGSMFH5v23Cek19p/EbMZiH028qgti6u/l+RCqh0ZkYAL
         pv9pEsh4SWYyoyvBhkdVAUsxbjyNWgopzOcA/zgV+GIUIyOBJ3OESUHop5fOSgc44n8Y
         YK4DZDSpOxHbmFpcdtZEDDQbDuyPTPX5nhs1ikbUNjQJ5TxX48qJ08STUsx6N5HHqNct
         z9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764954695; x=1765559495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9sqbpnFrvtEJuPgtGi4c/DTZ7hx+PeUNfu1FG6IfzQ=;
        b=UTKQ+ZUocRJnrkMzb4vy4F0XfiVPNh3RHPQ8jXKwFWg1RYAG4K4+T4DA79HD7HWiXv
         Z8QH++OD1VSictiwp5pu/Kzhd5w/eNdwAolB8XOoQczbif3MQJG1dJwC+2Q4M+5tRzoe
         LoXWGBnsr/uYQ30i4YMjEHIlAw7kRUgIZT69sMxsDJY0U+w+mPL57QeMkrkOPbbl9OMj
         GDq8BsAWssJ/5efB/WI1Pi5+m4BAhuQHT3GGPtfh5Mu5WR3TVBLH8FWif72eHJccxKI0
         OwTWqm1L7rgS/jhhoqAc5MaZHRP7UQrMJ8kvSLRJGubMbkZE4DGZ7aKo5cxUWGF7s0Zq
         ilRg==
X-Gm-Message-State: AOJu0YytOmZfuxuhsYNYUGHo10fxVOX308mNnRpgB/zFUBWB7vlueg+H
	LRquyUNilctiWtQIkgPiU8dDqLTLWhXl74pTrOq6LvHp1xoOXBIPmgTLRyKUog==
X-Gm-Gg: ASbGncuJhdslBtiKntPeoMRHOkFB/v0NYXhvIsnx8/U4hOY4CWeSL8zIRx4Hoe7uV5b
	ePa+V8TiLCme/1huV53XcvR2hUb4QTSsY1hosoNgvOV8jMaLGGmdf49tajveYE+O78Pd2jwiwkT
	U7nrFzxJLe83qBN2kwYPCEVwdxbdJcDolYg0b3li9K0SYa+S1nFSR4YiiovL13jTx/k6PSuyYK7
	LXsh31zGWyz2aE1gfTmnpCBE7WVKlLvI2KNhpXvsmRYOHgx7285CTK+qrSUwTwxcX8dkMkk/I72
	om6TaqRdlefPYfdVaPXEwrr8G7EaRu24E2W12vnCdkVq6ZCaL/MOoBfKpJI9+iD5vT0h2sMzRW1
	9b/9u3uREBD3sftcGTWlJYoGKfNHAiUGW5Z2Y5Dg0dIUtF5QHcEbhnurM5/VglSS/OsCUPDN7ZB
	hvAMcbov2a
X-Google-Smtp-Source: AGHT+IHt1mNGd4XyhUWuwUAv0dd4zPKLGScMHBU4J8kBcEyF+Rjw02tfBJJ0Pc1lysmUyXf+3QRH+Q==
X-Received: by 2002:a05:600c:4588:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-4792af4890fmr97533085e9.29.1764954695061;
        Fri, 05 Dec 2025 09:11:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6db3sm98563435e9.1.2025.12.05.09.11.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 09:11:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 01/10] xrdp: upgrade 0.9.18 -> 0.9.18.1
Date: Fri,  5 Dec 2025 18:11:25 +0100
Message-ID: <20251205171134.1346494-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 17:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122347

Contains fix for CVE-2022-23613

Changelog: https://github.com/neutrinolabs/xrdp/releases/tag/v0.9.18.1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/xrdp/{xrdp_0.9.18.bb => xrdp_0.9.18.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.18.bb => xrdp_0.9.18.1.bb} (97%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
similarity index 97%
rename from meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
index 947ca75388..354eb11730 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            "
 
-SRC_URI[sha256sum] = "c5eea0af055fac90c632e44fb667f1a25c55de2e34b37127e4cb0aabaef90a0f"
+SRC_URI[sha256sum] = "f76aa16034689bb8997e56fd554db29ba57caa1bab228a6eda28be4389dedeb9"
 
 CFLAGS += " -Wno-deprecated-declarations"
 

