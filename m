Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E660DC4452F
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:01 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11276.1784590732307531523
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UpLlg8ui;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-848643382fcso11773429b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590732; x=1785195532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cU3MAVMkmR/j4ch5V9cwY2dRIwSh8iYi1SF99eWHOo0=;
        b=UpLlg8uimOBHOjKN5Agj+htbUcHjaIHfhBOuX9Z+cigSKkWW2tIwdh4yAWyqfP6aMt
         TXGncr1BnmPjRz+XX6YBVsj/rQO4PujGUAY6GKE60Ff15OqRlnUXyi5zqO7V5yOvIHqw
         KYtt9D4pVr2g+n1Brgvqe058Zea9Nq325qkoCuFJ3ZOHkcO1GaCZxwoYyU6r5mbLGXnV
         eWBe+zBmyU7jr/aZjPXYJoWMsZUkqKdJ+41cOCS4soxu0EAfL/znGzi20CFk/bMYR3Tr
         j4rUF0bSejlQp4UB+5lDM9mtSSXjRnEE3mMEsscAqp4BqZamyjy5WyeCbksiKaRq3SeV
         uJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590732; x=1785195532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cU3MAVMkmR/j4ch5V9cwY2dRIwSh8iYi1SF99eWHOo0=;
        b=QdKU+UfdvqTWZc1GXmDO7KKKuTGpPN3J0g9LSQ0qmGkEPcZglrtQ4PoxlkkLTrJpf0
         0LZMayy4WIFg6ug3a4o+2mukQwvEQv0uNGcuBKoqrdXq5XZ5pfYpgSDwi1EKrAd8A6LC
         yBmMS6XicwZ2D6E4QPKev/hHhGpGEoJ7nqAuwWz74UjvW/ocMFdafBiwb8zVWjdfey5l
         qe6+35/zFdR+ksf6b+ibKWqV9SDVwTqbGAsZXiw+ZmUX/V3b7hWQ9gQF6MJgwziBB7hi
         LMra5nBWAHu+chIjrRKgnBvP/TnYKPivT4eW4DLL5RXQTLE0PMpEtviol0Csv7OTo0By
         OBRg==
X-Gm-Message-State: AOJu0Yzcyv/oEzQuWPh4xnXoLcwSgdEh10xBtNCqKADmm8knVDDX6ZKO
	hvwOJlBz9UyWsqPG/hTVDzp5b+I2mV3o1oCWKPDDuTaexT7taeHaVWgH0YYHww==
X-Gm-Gg: AfdE7ck1ccxRPCyxuC9ok/cmbYQictzW+5V0LmSb6FTW68SnXVJbz5M5DpOhkotDwbB
	8eukUX0QVSD4y8Mc/iildFPTc1rERd9OZL4GJzN5c4Wo5IPdBrm1WvvNqwPL/k3RgZb6pina57W
	+vr8ODHQ4mzA+fCHl1garNLJZl//xbH5UqlddWyBYizYp/+xMgez4NmVvxZemt7Z8FJI41ixm94
	JJTH/JtcOuYYg9m8wCIOuQ5qOwCOh2kfmOfgEbL5S0iO0578AnXD5bFATYxDGLi+AhDJ6VmAFYR
	VnoykAmEYMF3MvdkVj0VF6yKgyfeAtx5sPBObc384NVVQg3/Tmkc6m03o7u5EWxVfDp8dS9e5K0
	LhaOk4TGc8t++QUh4Pbxm6kTGpBK2RUgsPzkdyrT+9Hk/pxJPDOBuQ0zBTuvWcO2hF3NJe2q+xT
	dYewlemV9JM1hv/Fnmt4S0tOYoLg==
X-Received: by 2002:a05:6a20:914f:b0:3c3:8ce8:203 with SMTP id adf61e73a8af0-3c3ad9d158dmr16378772637.50.1784590731699;
        Mon, 20 Jul 2026 16:38:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:38:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][wrynose][PATCH 11/30] swagger-ui: upgrade 5.32.6 -> 5.32.7
Date: Tue, 21 Jul 2026 11:37:52 +1200
Message-ID: <20260720233811.2324493-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128312

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 5a1603e21dfe5636e129b0a07d4e6c110841d564)

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.32.6.bb => swagger-ui_5.32.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.6.bb => swagger-ui_5.32.7.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.6.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.7.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.6.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.7.bb
index 4f157f1692..788a8f5638 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.6.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "dcdca62c8b64a0a54e4decd4e1a6c3c712fdcc60"
+SRCREV = "bf6a8f05dcde5904cab31e666e80e456a05782f2"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

