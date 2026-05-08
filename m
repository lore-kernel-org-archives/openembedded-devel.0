Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4006CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:39:01 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8470.1778225934044487829
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2026 00:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QsRPdwB+;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7bd5dde63dbso18052817b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 00:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778225933; x=1778830733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oFE+3Cl3vfi36Fg8+b9fmvN0Szu9yW5/8cpwN5bCqjY=;
        b=QsRPdwB+VqAOQ3iESQoW6hbL3N1E9HFH5bKfrA3mK4cBijqipvLdv/Ip+V5rOkndAr
         zEth35UV+HOTTzGO+4+Bgteq7vWF/fIe+hxNWnBnPvI+0SKkciTX6Ba1T2cCsmSYjuWm
         cOAtoy3iYbfp8AXPRHFfohpNivea9OjrL0oI9nDpwLWMU3dh17SYS5w1HRn2KsZN8iDx
         wI8yAxqHM4kUabuQwD7A6YPRbFLh+i8HnPQQ5n+LrO+UiMzuapshfuctBWeQMVCxfHVV
         ePPxp2BOhNdXgNRBW7yvy3C8XsDRr5pN6Koe1NdBk8hG8CiPV6Ls7dOJ3tRdb7NJ0aTJ
         eCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778225933; x=1778830733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFE+3Cl3vfi36Fg8+b9fmvN0Szu9yW5/8cpwN5bCqjY=;
        b=JADvq3DYYq79RiYeO++H7DNqXg6kN+jK6GbIUGYD9HNheBDbCzU64rW+YXPv5+qmnt
         e4jSFpIUyYLkrJdf098h0CVvkALYPtok9r3yTEMd0H6phtGJzdhNbf1q6oipogEN6XvZ
         QB0KpO+4ga0FaUGfz6EeNJSaHUen52ipsXSOU5Tg/wzmZtqcwwhK17S+cC2X0KA3f/xV
         edxCFMuz8v43UD+jKGZWZahellYjXNxAL0bvzf5dEP5THDCb2+pdTh+tnXUavu4lmzmC
         kMWjDDedZjJZewvHWV1e4Uj6Kt96Jp8p8ddj/R3Zbqyf0QAwsVfqGUBs1kFYYexH0yU7
         VasA==
X-Gm-Message-State: AOJu0YxW69LVcFKCAn+ctIIk3lGa7CPT3UHN7A/jE6FXPY8WZwfGfXhb
	DW68WB41snsQsFDfic9pVxrk3XkT+QkpXSF13plj5Rx2brPwYTE4CkelKJsgBxED
X-Gm-Gg: Acq92OFFYQgOCtmZb5aW0k4vvpsnbaCdbceaH7Q9WxvKUjRq5hSoebbqa0ksBBubVc1
	8W2LRLqE21/6dU2WnAZIa/NZdeGH7Z7PvHROFrb8PBte8Az+mX8MYxz8/rut9A6OZmTPh6cSOp4
	isXrFJ242+Mj9lGT4o8XhgLZfYCAWSACOVttPnVOdx6Ssjkq6wvLfWc94xG3DGZM2hJQ0wDbngs
	YIPYJLLenHQwCTD/+mKBZcZuFzrW8cFbcimwP3fZWZuUJgd2U0C+ifLoEKBFKnqLptlCKBBOWQ8
	0NcLSZNZNHoOfx7IqBW4Fp9ZrUMPvI9Y5tl540Cf1y9eRm6N4xowyjoJNJZbLr0pJiVULUI+kDN
	fmYayHmYIDzuJ7kCvR4aiOsJ+WIkOP2kjjcyMjpXOTvWq7dIN/YSkACfyg+hNRng76h+7qllwLL
	HuSyifBYtbG9//YexAPsl06A+yx31tI1u0IlKkFN79bTajsIagJ//3t9WU6N3esK1JwgmuqUje3
	Awpsont/zB5AJFC71iNwlTclAUADMt6Ks6TyoNZ7Qyswuk=
X-Received: by 2002:a05:690c:34c9:b0:7ba:f6b4:3550 with SMTP id 00721157ae682-7bdf5f0754fmr125286467b3.45.1778225932866;
        Fri, 08 May 2026 00:38:52 -0700 (PDT)
Received: from testing.. ([50.219.35.228])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65d96bcdab3sm425248d50.14.2026.05.08.00.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:38:52 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] php: upgrade 8.2.30 -> 8.2.31
Date: Fri,  8 May 2026 03:38:44 -0400
Message-ID: <20260508073844.2675630-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 07:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126823

This is a security release.

Changelog: https://www.php.net/ChangeLog-8.php#8.2.31

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.30.bb => php_8.2.31.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.30.bb => php_8.2.31.bb} (100%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.30.bb b/meta-oe/recipes-devtools/php/php_8.2.31.bb
similarity index 100%
rename from meta-oe/recipes-devtools/php/php_8.2.30.bb
rename to meta-oe/recipes-devtools/php/php_8.2.31.bb
-- 
2.43.0


