Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABE5F46C4F
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 15:13:08 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57248.1775488387346178813
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 08:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fxCEaxIn;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488971db0fdso28960295e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775488386; x=1776093186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NVhCrWOs+6LrTY24D5mQjy+FuT/azRB6e7bAMy/4Qk=;
        b=fxCEaxInVQz9qApxShk0BkOdBikFiRaBNX8phUF0uKD7xqoIRXWh2OTSzNE3i3lz1M
         0WmBx+9M+j1vBlR57WnEVM8BssUDRUR7wKqLvnFbe4m0u9pG2Ay10Vqp1O4JOzUmc6Kz
         jpVHijk83pWz2Ayyq48c07Lunb/nWq3EMJxuQJCiNP5L5d/PWXCnXKAGS9qSUsEOPVgS
         eZIvdO1jwIm6xcr6XtqCx6jEuv88BjnBCB6GaTB3EAAOtboifccnPK694s4RDSbN2QKG
         yHUPmP2+KBMwMkQiPA+t0bHeda7MuTzme72GBkhaZ14ltnOsblUYsvNQqv5gy9EKWgug
         TSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775488386; x=1776093186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2NVhCrWOs+6LrTY24D5mQjy+FuT/azRB6e7bAMy/4Qk=;
        b=PSWGExXfikfBgm1IkrkL+iDmVnoY+pwCLZSZVoZQNoJV5DO062fsHDJlZ6vQDHLe8X
         cy3pQQ37YKOtmOggmzNcO7dN+FWKrpzf3XdRm0k8eZ8QE8A8EsYzlEhEH75AQ/WEWtm+
         sM4aSS00eGbzS28FZYRalrnaMdE4BbufbcW4EjHtozrOV153dZhALu1rZh2cOUcL/kfR
         hQjJ7eoGj0HWOSSlQ260ZMTAUXXTvfInl4Za5JWh5q9T/IWvjOkI/lMttUxv1AwcOnDM
         DPF4KI0kuc/69sY5X+UFPCmE9tol6RzKnI2vHOVKuqv2KuP26c3qmKC8X82D9EGw1X69
         oi2A==
X-Gm-Message-State: AOJu0YzI2y4xNT2gpLqW6rQaU3NTOG4jUV+ehJhZ8Y+hDZIkGhs9N5C/
	7AbqVX5XG/gfCLsYv51fbeYEPdAXJYEyXcIIElmfi0FsmdoNpgDlS2Gm5GI7XQ==
X-Gm-Gg: AeBDieszBr45rgyhmR7n/uxd58vO7m0xTQr4xnUj0UqH0NI13PW2rG+0ebq8eVgGHD9
	uornv49A+H4rGokzfesGXWFcxdzbRPAUE14HLidwvqmM6LGO6UgN3+FsBGLs+dJqIbU82bHhetl
	Y8/oPaCXq98H8dPSc/KguBFMQw8Gxp38VheUyzHEoW/moqv/hD1hYaPYusZjKKmXrOiHvUmAfcd
	4RYH4UNHuW3oOh0tnQn5QTI0qyeqUDsFN4NI+dV8RpPk8zW0DHMSzUhVpJBUIH/vjxZITNFmuqr
	WvB+ncSh8p9ga+C5jiViyBC6G77FIXnBf2YQiF6Ay4yGZ7Dj905eGPA6lP1l2q2YiaautMzSyCm
	zbipdPoMI8ew2iISYA3WvD1rAQM67m9fZVK/dBb2MOzmGUIwVT5Cq1kiJOPZen+VXoSUeB8dZot
	8MZFOnHxjf/bg5n/ilwptX
X-Received: by 2002:a05:600c:820e:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-488997ee0bdmr193369635e9.30.1775488385649;
        Mon, 06 Apr 2026 08:13:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b6ff70bcsm92848765e9.14.2026.04.06.08.13.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 08:13:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/4] python3-aiohttp: upgrade 3.13.4 -> 3.13.5
Date: Mon,  6 Apr 2026 17:13:01 +0200
Message-ID: <20260406151303.3640343-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406151303.3640343-1-skandigraun@gmail.com>
References: <20260406151303.3640343-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 15:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126048

Changelog:
Skipped the duplicate singleton header check in lax mode (the default for response
parsing). In strict mode (request parsing, or -X dev), all RFC 9110 singletons
are still enforced.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-aiohttp_3.13.4.bb => python3-aiohttp_3.13.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.13.4.bb => python3-aiohttp_3.13.5.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.4.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.13.4.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 7416b87347..7e6f80102b 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.4.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "d97a6d09c66087890c2ab5d49069e1e570583f7ac0314ecf98294c1b6aaebd38"
+SRC_URI[sha256sum] = "9d98cc980ecc96be6eb4c1994ce35d28d8b1f5e5208a23b421187d1209dbb7d1"
 
 CVE_PRODUCT = "aiohttp"
 

