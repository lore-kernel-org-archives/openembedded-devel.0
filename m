Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32767.1793879743021998297
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nnvAg2Zi;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so6050405e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879741; x=1794484541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InRJkscdpZ9zWvmPO5zDA+XTzG79KgWO81mbrqmIZqs=;
        b=nnvAg2ZiRGnQU2ay93EsQesoUeu2qpMwFukqEDJesVutYO17CMDWlUFBxRzV6PCoP0
         s4ZluBF2dx4GDpTI/yZyO3zlYtp6wFwcS1m77Hp6YhBWLWp620A7jVBQGLhQs0p2CuRz
         3mQGtSe27gYeN0qGWd+FqX1TU6Y+Fr6B3LljM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879741; x=1794484541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=InRJkscdpZ9zWvmPO5zDA+XTzG79KgWO81mbrqmIZqs=;
        b=Gl2fRlDfYw+M1x7pQ6OGvhFSStphcr6Ch2fVaEP37N8dBmLc78MGzDHGdLq8tDlfEt
         kmbPZPfrIy2FUQK1b71pIPEKGiBBfpVaKK8FCzNNc3ctjSYM/YmB+kQdOb7Ne4H0C7JO
         XbPdIJJx6AwohaxiT5kO8+5OTl6AB9mJmFjSfaTfJ3IEsgMn+XP5/LkZjHWQCdks8j/d
         px6lyBSsGIprZBcHx6l0I5rmQZKsUsqgWjKbw8uVbLf/4oQXQaNNDkGP/xL1H3XEcAPm
         weKOYPIVZGZQd89XYs81RTbUR7YOgydayuhvTWInlXQZh90BW++XGyYRmtXjoptsLbBb
         yfYg==
X-Gm-Message-State: APuU4Z/26B6OtLIdVSQgVDNDZpVvvuN5o4oLD/tvjMNxVwT1oL/YgVfo
	ZGSREgWAy3vt0FHQS2SXprqzzHV5VO5XVlhkFxoLjjxcRxVY6vnmd7PPyaBXCDehb7j8wsW13FE
	WF8qD
X-Gm-Gg: AYBFou3FniGTwIX7rNcrw0fbCrNdfWZjlAZTLH096589rbqXimOmEnJ8WSsEs7IHoeO
	IRtc896qoNVYI0MNvq9C7BkbI8X0pLwk4XqJrqrmhE4pgARMvCdQa6DGzJACfEr49SkgIr5xj4F
	bkwMgTsYJgyvyhNQIBo2kknOnvFEnB+UxqKCg5bLp1GW3x8xBpOxEk0RPkp8dApRtIPW1a+3wIp
	y0JCYx3wWRiL/IqBj8zZ5hbhnc+JeIis0jLyQRt0LppheyyfWGjm1juX5rWCsQ1GD1fiFwR0Iao
	3iIbd4XxSbATKbro3erIOSO4QWQf0w94+U2Tw74KyZCfay33ClWheerbW3jMZaaulacexL+ya6F
	Im1zcy39dTB/joqCI5WOTHfBhEO/H5/9ozqQOUSHsLtmtLP1N7panrbzs3A7OU9xnEPn4+1qmad
	ATo/gO2RHVMHM80QkDN8tCWoxakUejavdAZJfZ9utR9dh6p+QGzvGgkjfwC04z0Xrk0Knr7zyO6
	Ua8s3C7xNjqc8HHs1GKKC9YKgqZL38sS9k9CD6XK+DOAuwBCdZeICEhbKtLz4vIpBJaoYFDilNp
	2QJXc+LKwX1mJ7SwTZVLUd2LsUQlKN69lHkADCbq1njoncCrUwkBqFlZtba+tiQyvOxPld2bbBQ
	H0buXCq0eh3zrprh+n7r0Yjm9UIbe2Yh5SxC8wukjdwYKJeHHLterRbE=
X-Received: by 2002:a05:600c:3b04:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4b55d8cfdbbmr39246855e9.12.1793879741324;
        Thu, 05 Nov 2026 03:55:41 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:40 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 14/19] python3-socketio: Upgrade 5.18.0 -> 5.18.1
Date: Thu,  5 Nov 2026 13:55:21 +0200
Message-ID: <20261105115526.634289-14-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131914
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.18.1:

- Fix enter/leave room in connect handler, when a message queue is
  used (regression introduced in v5.18.0)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-socketio_5.18.0.bb => python3-socketio_5.18.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.18.0.bb => python3-socketio_5.18.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.18.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.18.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-socketio_5.18.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.18.1.bb
index c389adda0d..653760cd17 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.18.1.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "81ec0fbc34b82009272834145a8fab82ccc36eb057eb2c3798dfe253fa47ed72"
+SRC_URI[sha256sum] = "07ab0e7c94a52833a67af1dc05958ad6fb0de69adc87de9198a61b22588c40d4"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,python3-aiohttp python3-websockets"
-- 
2.47.3

