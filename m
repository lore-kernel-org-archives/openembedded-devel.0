Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FE5D3C905
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:28:03 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15673.1765373277566960780
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ry2DRFV7;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b9387df58cso10466255b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373277; x=1765978077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PE7gQIcqBUVsyhwzSUpmACNMUxwDj2nViQLvMIbMbYA=;
        b=Ry2DRFV7VeDVXossr+pjguapmhsPxbdTyjwC+AHUKVsfVI6xOdf4l+m3exZnUzev/4
         qb36WIYkJnOcg4V5+uXG8jzZvFlURHy4VXF3uz+br/2LMOhl3SptT7fRj6b8r3z33mK+
         kJzgz0huqSYXhxDxAdJ5dLMLW24ZDA0Ty+Hy8LU26qBCejE97nONHw66luG8ncmMo606
         BSL6xpH2iuYDHqYw3O4yufJqrA30NxgI0D1AZMiwWJebQVpaEV2N2qK6VAaZr3Z5gHEs
         gaWzY3JYLBHSqarXXAYCfNgtbGiRbvXaHEOyp7GwZd4tmPh+SwMgLIHVT+EKcVAqVnm8
         fWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373277; x=1765978077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PE7gQIcqBUVsyhwzSUpmACNMUxwDj2nViQLvMIbMbYA=;
        b=cfP2bXpogbU6IeWqoigE02yskEMozsUqBwfzGnEb4y7MjFyxiU8TkFBqzXAmLWuHNT
         iMvzxtFhrOGNWkX73xRsTAS+LVzCzk4avLKRLbv6v1m72MbUKB40Yskfk6+pkEa03AQU
         fbc5zEfC5+/yRdcaE9DSLMRwZ5NtcniO/WxivGqzrflwSmlBVSM5R/HOXHqGRYXyRurN
         XuZzrYUlyP7AvAHUvNSfJM2RUsMOyOpPhjHwjJt/4Uy5uxkHdDSnEyQf4nTHUWGbvl00
         Bwy79g5ybPVsAkRtcGtGKvv5iuscZBwxs0GfOlIaP9TIYALXaiyacxHTZB5gzM5d2cTj
         8zkA==
X-Gm-Message-State: AOJu0Yx6/5fgoKppRlA+LXY9ayBz3A6Rmdr3nfJuAojbtYeMA3Sjtpln
	UIqezj2NACDlAWkGe0u2RHKxOW6/TX7uQA0HaQsLZXqGCm5S3H2I+17XhqyK9w==
X-Gm-Gg: AY/fxX75RnwqiFyLslVLP2Z128S+rDZZ9+t82tekhueOghy4qEcRc5dKorzghQ3CC4M
	tjpvJhPuifn6MZT1bAk5i0X4Pl+zoNvdPP+F3cy14EXlsjwoVugKj0PhZ3Rg7VyzceS1INEJXqQ
	fWexvw6B2XymLoTmDEJX3HztNmXZy9++TAoKKNW3aMF3unk1FxwzogDO/fZKEgxBB289n+E/NfJ
	sd/n5jiMnr87yXsKWtWWqXmCc7OZlSwyYiVGOL4GZeTPYOnbCVFC3cpBzvw0k2T3bWhXx2/P1Cj
	YxLCiUpFW8pclXtCS8gwVbuSWLDOWkzvCt1JeuirvBUCanVP1OsaTyOcgSQpsNz13+Zec4jx0DU
	B8BScqS+yYtyTsPeIQ8XPC3a2MlP3hVXUMR7IrgcrDS94tkvgZUMw44rQCPPwDEJstiFQQ7JFd8
	uoNk86dk8rqp/uRlR/RIflSDY=
X-Google-Smtp-Source: AGHT+IFVhqnUPL00DHxFjAqGQbkqie44d7uqNwk3M04cEGesVllK4yFzdTzvF+KofyxFBbpcXvTseA==
X-Received: by 2002:a05:6a00:198e:b0:7f0:665d:efd8 with SMTP id d2e1a72fcca58-7f22ee59c37mr2320732b3a.67.1765373276817;
        Wed, 10 Dec 2025 05:27:56 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2ae6fa824sm19163006b3a.47.2025.12.10.05.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:27:56 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 38/43] upower: upgrade 1.90.10 -> 1.91.0
Date: Wed, 10 Dec 2025 18:57:39 +0530
Message-ID: <20251210132744.336180-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132744.336180-1-ankur.tyagi85@gmail.com>
References: <20251210132744.336180-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122542

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- New feature: Support multiple keyboard backlight LED control.
- Make installation of tests optional
- Support conf.d style config file
- Deprecate CapacityLevel property

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 07dae4fd4e475e4f3eebd28f84e7a0813a8b6140)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../upower/{upower_1.90.10.bb => upower_1.91.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/upower/{upower_1.90.10.bb => upower_1.91.0.bb} (95%)

diff --git a/meta-oe/recipes-support/upower/upower_1.90.10.bb b/meta-oe/recipes-support/upower/upower_1.91.0.bb
similarity index 95%
rename from meta-oe/recipes-support/upower/upower_1.90.10.bb
rename to meta-oe/recipes-support/upower/upower_1.91.0.bb
index a7effcd7de..9d20e0a432 100644
--- a/meta-oe/recipes-support/upower/upower_1.90.10.bb
+++ b/meta-oe/recipes-support/upower/upower_1.91.0.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 "
 
 SRC_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/archive/v${PV}/${BPN}-v${PV}.tar.bz2"
-SRC_URI[sha256sum] = "c1baf418b685ffe4150c8a75c04da0cec70323fe094b5b257b287eea564d3f56"
+SRC_URI[sha256sum] = "954f8ee8d1422c813615862bc6249cb9b31ace1d905fd1f06549c4e47f4ba401"
 S = "${UNPACKDIR}/${BPN}-v${PV}"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/tags"

