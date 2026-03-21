Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46676109448B
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 17:08:48 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14803.1774112926701839208
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2026 10:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z2XhG2Ja;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a27dddecb0so4014722e87.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 10:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774112924; x=1774717724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NrKiVwsop5+2be5yWmx9EqdBjSGSjUsIKS//PWtF+7A=;
        b=Z2XhG2JaNPWVrWw/q2q19OdTveo54GC56OBd2w72cXCnxc9tFZ9RxRwAcj9KXN9Bpg
         eN5vaOpECCBR+N0JKCJJjWHKQjJmcFtHa5v+Tcw3P4LT30XnJkMJTnjfHCT0Wxiff80h
         lBro7fdbeYpxKcUSETbfeTSgrxiXVajPSTTjFPY23iQyY8UV+X3+Zi9pbYpSmOZ+E0Y7
         hESj+SqM04Ch+yDpCEmDKWZIUCJghn8PEGhXQhtNCBRLvm8ExEGMJ1edu3Gs6YPJDsgQ
         IJpcNQJizKAYc4Jv9kcj3ehiIksxpDARL+hWbZ+zTwEusxVTl+wtb87ql6gK/5JVBrFy
         HIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774112924; x=1774717724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrKiVwsop5+2be5yWmx9EqdBjSGSjUsIKS//PWtF+7A=;
        b=oUDQv6GYSr1FWBTHE9wh5fq9SyG7znoVMV638EPAix2cIZ658SLRZnJ/AoCI+rJUXB
         dVEVKvBllFUoD6E2FpvPypd1h1lPZ9Ou19/DwldZa5qBsZ6uOtL6frQ6A+KJy9QJWPb1
         739FrhWyNbkEWpI/9ilSYAuG4Iw4LQKIluo988PbB1zCVF1VLEyCvprd2G9FblUlT1jr
         q48t5SZGxIpGLLFMBtbWnGTGSTNgNjOE1vEerKwJJ8vacOzjdiMHNUM/22Bpw629qINF
         364crSsbUvEy2wpvMSfd349Xl6MJ65BKm5JmNUecAUtXOhD4TrfFd2tQ71yjr1toCFbU
         n0Eg==
X-Gm-Message-State: AOJu0Yx9gyQbLp1f4I7Y8ZAsnumBzxKdnYsuqfgP6EcUCFGyv/8vt8y7
	dVyoYqIDWVpXy36DUeJJ0T/rtA4OmU0XKU2zkW5ahCHcHS/l8M7SRfYL7lwDyQ==
X-Gm-Gg: ATEYQzxnEpzfdwQEVEScM25dt79PcjkUGBVMLf+SCeK07q4gftqwD+taGweQKK6M8p3
	Jk6CIpPkMSvGZfyfxcsV2yOZZsoPcE2HvV9FvMyuVjMg9MBcuy8mLIarsDMMsn9PpuvZa7JIsUD
	WtlBnf/Nibo0JwqxJ4aXKpbRIQjkjxK2ovFR78G0qYeaJfOfEKv+tFX5tFcEuZVXPqvWiKK53Yu
	BYwhzCA6QhvSUqvCGwMt+GGQ6zBURUJubr74dBXsWjkQ4ZIIYunR8ltGuL7oK+Wmpkqa3WOMkDi
	/TiInRpcJXiV3c8sWdcMbUtuWZN6p5j75SyKYqReeCcQ01aYMB0b+SV9Hu95pklF/fD6FIQCAlV
	b/nzxEOWtef3o0cTfrvWRfKmdhXH5E3dSggLGOnMdOUvzkgurhQAgASzycX0KEaFI98SUQB5XW2
	et9f1k6jJnUzNeRrGq7z7iIAdgu62osxMn9Po/zQhfZIUJP86hHPKUCPH3LKO1jMDgIanTQsAtY
	9TtmFmZK3bNPjU7Y4cRHDML3yZP
X-Received: by 2002:a05:6512:33ca:b0:5a2:8568:7150 with SMTP id 2adb3069b0e04-5a285af54a1mr2156536e87.5.1774112924095;
        Sat, 21 Mar 2026 10:08:44 -0700 (PDT)
Received: from localhost.localdomain ([176.33.64.200])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192dcasm1249287e87.8.2026.03.21.10.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 10:08:43 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-webserver][PATCH] hiawatha: Fix checksum mismatch
Date: Sat, 21 Mar 2026 20:08:39 +0300
Message-ID: <20260321170839.1306510-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 17:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125465

Update the sha256sum to match the current upstream archive.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb
index 9c9aaed807..09f6184a66 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://hiawatha.leisink.net/files/download/hiawatha-${PV}.tar.gz \
            file://hiawatha.service \
           "
 
-SRC_URI[sha256sum] = "942dd76e0b0369188612020cbcc92c19e11ea9e844f5dfaef4e9c7ab6892e247"
+SRC_URI[sha256sum] = "f895a35234a3efdda78187acd7ec6da9cc6cb69b3dd186d1c3f474989c418dec"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"
-- 
2.43.0


