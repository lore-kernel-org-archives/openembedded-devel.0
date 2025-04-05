Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561D0C36018
	for <webhook@archiver.kernel.org>; Sat,  5 Apr 2025 20:14:26 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.13108.1743884060752935580
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Apr 2025 13:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L0SEqJLx;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so576518266b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Apr 2025 13:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743884058; x=1744488858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CDky1uTLgtFSKyJF7HiCQSdqIQsDfzKG5hWSY8lvxR0=;
        b=L0SEqJLxbVW4IETMgLmCDGkfWH0T6c6y6o6JLSN9zJGGIOMFYWSf9Qa4FtBSecqOa3
         L1dSdAT45St6p1N9gZuX/Bd48YlZbV98CMzuDI049dN8x7knFk5k4uW9JR4+X6iqgwT9
         UL/hwn3WR8uqO1jPIJg/kKlw5gDt98BPtASFhWmfD7uYUfRQbrlYGhd3RI4WxjlGGJ8X
         ++y/YggatAKs6r/sEOm2GnGM7V7CfIpYG+RbcHUE9CEHfqJySTFaMd+e0hUFcAebSs4m
         J/OGydxz63dpEx3u9erSH2X1iaZXalCq1M9lqSCjOjunNzKPyY321y4aeEs7XgxAi7sf
         dvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743884058; x=1744488858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDky1uTLgtFSKyJF7HiCQSdqIQsDfzKG5hWSY8lvxR0=;
        b=cIsoegRWXGRQcoqccXD4bHs51Yhc8I0fpWE+8oICGWMDpmHacxRqGRJsq5ZK9gXHoF
         lDOcAwSlxjfh+ozQisvJqLc5JaiWO52K32TTYJxq1Uksq0kH1WXnRsOOuCQlnYDr/Zkp
         23SGLD4q6eNr3wPRXp0RQLsIulK1yn25iE5C7NELo9TRgNGudXFjCSpnhuTMHo6tLHpv
         5gizkrNlOt9vv05Dhsp+GyqhODqJdSG1Y/XIs8DFW3Os88aZ+tZ7TCHdp3IU04WJwsKZ
         D6DXwRvqSEq64A5/9l9WG4mbPXDzn9+SzZkWpEUNL0RI3+d5dc1Rr9CdjK3r/4FYtzZM
         BHcA==
X-Gm-Message-State: AOJu0YxHciF9EyMQrtucMTxrB+QYqFx91nZ6z+JnbPWtV7aWKb7REeqJ
	RcJptHy6dYmT+UtGZHK1bMlEfoB9Ws49jZjZHy4ZDf/Og1kEK4zYLvsv5Ehs
X-Gm-Gg: ASbGncv5uV/A0+Gu+7sOKPRetNZ/hCZk6S2e2SZuq6xGtf1qfQSj33LVTy6Ml/ly8D8
	ttOF6vhK3kNFCIi5mVpscfry7lumCC1e71ntH8zCbpiOSduOPR+wiEfF0kXQBjMi1GG37bOgz0Y
	5gorOOwfFFc6H7wpUVWoYuZgKpVVo7oWUJuBNwT0WNpO/Ax+nS5fOgjT5msG3877nAxSFFX9bE1
	rQa4mOmgq/cTYEWk8wto3HxGnCvEkj5WRRcagS68Jdda382rCsuO4EsUC3zkdS3QyWWTaSiXxep
	CX7wqdIB6yNqxHxOQVHZWAo5paJQmiUpYBpnLiawjvMPXXGElhtsZ9ANhTduUjwwajL+nRbsfwF
	v9tMo7jE7zFk1ihhd+5I2330=
X-Google-Smtp-Source: AGHT+IEdhIduMUIrOEV33arWsLLam0hvJIcQ5FiWALY75ZiuLg2sWQN+g7arn1XaxNcKHiZYgJy59A==
X-Received: by 2002:a17:907:3f15:b0:ac3:b115:21b8 with SMTP id a640c23a62f3a-ac7e76205a7mr323826266b.47.1743884058175;
        Sat, 05 Apr 2025 13:14:18 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013ebbdsm473166166b.93.2025.04.05.13.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 13:14:17 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-aiohttp: upgrade 3.11.14 -> 3.11.16
Date: Sat,  5 Apr 2025 20:14:01 +0000
Message-ID: <20250405201402.2733841-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Apr 2025 20:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116600

---
 .../{python3-aiohttp_3.11.14.bb => python3-aiohttp_3.11.16.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.11.14.bb => python3-aiohttp_3.11.16.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.14.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.16.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.11.14.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.11.16.bb
index 8a3ec3cc33..960272e9a3 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.14.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.16.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "d6edc538c7480fa0a3b2bdd705f8010062d74700198da55d16498e1b49549b9c"
+SRC_URI[sha256sum] = "16f8a2c9538c14a557b4d309ed4d0a7c60f0253e8ed7b6c9a2859a7582f8b1b8"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


