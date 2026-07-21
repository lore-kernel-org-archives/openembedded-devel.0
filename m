Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D49C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 05:28:39 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16230.1784611711549520416
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 22:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pjpj7s52;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848643382fcso11938062b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 22:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784611711; x=1785216511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VKCtnwsHD81V1W2P5RyVhcJrKDbs8LfDygZUV2ha1k=;
        b=pjpj7s52DXqFXpAs7V0KhTM3W5tvxO/30vU9ZyF04xvan7HIUAWh2OCtGv7oLzEvI8
         DbYozM5z+Oiv+y55OAIbHSooAo5PBEI5ud6RdkqAjoEJXxQ1T5/2vfb72RxJFQqLMQiA
         +FljM7maIODrmifp+qu1nBrRnl/f32lTNLfEASn7PduUV9cLU6Dl07fBEcTr4cWaz61q
         50Tv5sm/6ak+0Xydx/msyFnOVbPPPOICaSJBhwhgngUN10bLmQEtDlP9tcoeOhSAtFVd
         UiDUEcnkgnxxRlOmMLeNZChJgPIccYZZSfzVwA+YgZuvgtgQlolqGBy95odjU8Gp7C/K
         Orng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784611711; x=1785216511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5VKCtnwsHD81V1W2P5RyVhcJrKDbs8LfDygZUV2ha1k=;
        b=h1AfZgh/KHAtpTXYTdmpHKJ7m3nlI2nX29VGAWg++j3HP9x61xmQaYp4Fg5ZKxZoon
         DVvVt1GiUDdAHqlMhtpdN0iNl+iq7Ru+MzYIq7Wh+mI2JX2Ae5Emq1mP/uyOSUMaufts
         COljyhqWjj5+Hazc08ENLLxjvAACpzWzFUsGQYDcl4ctntaJPW8z66nuqc7DT3aU1G75
         hySnCcg3e0mf7dypG7WevFGN0POYD6ECBvdnSzGVZztUUwoEZZp104vhlUMek1xIq1pS
         fn0WkmQqFmZFo9k1+YDV1aaWvtMlP7dR7RRQnwZVy9URBarRn43qepdGQRIiK7ZhRmcQ
         xOAQ==
X-Gm-Message-State: AOJu0YxPyMajCFzt6dSrxWON3FlFXhiGpb0XLSppZNaPy1/TdRdGqJSr
	pA8cFHCNZuEqUimYZhz4UzOrstgAsuLufI0kcSGBYlS90cBPQKFIk6y79ztJPg==
X-Gm-Gg: AfdE7cmvRFs1peliNfEVq4b9kOTGozQKxf0OruCnwTdMOEwDwnO1VejzQuWUHhMLedc
	6faRyl5ouQbasRIIpQwBgLlZkUbUSsk30Ltb3PMXgq56xIGwEe6UVpio8YlkW2oM+Fa/R4QCIvu
	riTaSVsDqm5s8iRb8YxOHACLrWrjs3fGl9crvkEDIEN5WyzuJokycUcOmMcrdEwQVpuSxk6Thu4
	pr9aSrgIUTePaw45WkiokF0RRP8+5Tl9MLR1Yqhqd30GPNB2uWk+fo2CnRRKzt2IplkjaZd5HIj
	IQEtLA2SCh90C7dgqg5gyYjMa+YsdFdnZ3H2jOrpL14Ldx3RE832DKp3BZQSazIpvX2Alfu7xn8
	jBAMeKQCVUxcb0EN49MuV+0/yTsuXrLwj6SDMcaouBkmdCIWB0dMjVYsYXsD65DW5wda5qrlX7l
	BLHhFN3rpq0d89GRk=
X-Received: by 2002:a05:6a21:512:b0:3b3:1951:489b with SMTP id adf61e73a8af0-3c3ad9588d0mr19027420637.45.1784611710719;
        Mon, 20 Jul 2026 22:28:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb8a4sm46340772eec.14.2026.07.20.22.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 22:28:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH] php: upgrade 8.5.7 -> 8.5.8
Date: Tue, 21 Jul 2026 17:28:22 +1200
Message-ID: <20260721052822.2698400-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 05:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128338

From: Jason Schonberg <schonm@gmail.com>

This is a security release.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.8

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 34b5cd16f1c61255e99c2ceb21c096708335300f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.7.bb => php_8.5.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.7.bb => php_8.5.8.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.7.bb b/meta-oe/recipes-devtools/php/php_8.5.8.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.7.bb
rename to meta-oe/recipes-devtools/php/php_8.5.8.bb
index 4fd517f789..8d9b91aa7f 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.7.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.8.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "4ef9355f784d4b320151eb3f31c5941c0da297025eedb97f2838b2ce73dd59bf"
+SRC_URI[sha256sum] = "22f938efc6c4eaa8bf2e40ae11466140309496aa5d5a19204272fb2596fd11dd"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."

