Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62840CD98D6
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 15:34:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73411.1781278459989382736
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2026 08:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hQWuGn2Q;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4908b92904fso11527725e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 08:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781278458; x=1781883258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pNvqBQsQzkoq7UIJrZEikAg8EHm7D4hMj8EnJQXuR0o=;
        b=hQWuGn2QaWlMI3Ufonjq1VPU3br+Yfz5R7GwbPVg1yQzkz6EJUskziFyjBFH/5nHho
         sGcDz4rm0dJ0Rh3Z39b41wiy/hG/1pBhvta+uZqgbTspLB3/zOUWMrWSfm9hXQ0tDKwC
         Ys5mUOXQqVw0C3WTd5ZF3jcUw485S/QCbnon8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278458; x=1781883258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNvqBQsQzkoq7UIJrZEikAg8EHm7D4hMj8EnJQXuR0o=;
        b=GPGgPqEIat0qZ9VnIfK36Q+izkxIi9+a4k3nPwG5Jrj6VLX6NUnzLl21Yq+YezL7DK
         7gmQ7wMzQhnlJ70nT6Rp0p/ineYrhcyZhyOIQWAJOrR0mnP/2TQfXalI07PsQPu+S7x/
         jb03CdYihp/Em52+pf6wIGeM+pvNI4MQkZoGnp+95qNIyL45RchKEA1KxU2wDhvBS2gX
         XsZNtarouKyDOvOyP0JEyS7dd4cNmO0C4RCkG4ZHzY0sNAtyS9W8t5HfZPptTxgzzQtv
         m5fY5MlnmrFOboOgj0Bto6ss8Fp9/cU4njrdLezD2QU991bN/IE2bdkBLJVttzQTA/gr
         JCbQ==
X-Gm-Message-State: AOJu0Yy03SrH1ULAmRfKHeW73yPs6v7hr6t3Zw6Q1dcI324gGYctVdqx
	WB6wcnxFLh5teF/3urHFAWtnGSmguoQha+QXTRJZk8TOnXZPwZ6xmFYojkbhppFrJgEPojQ2ZwO
	3tz3q
X-Gm-Gg: Acq92OHRYamttpyyGwhqDG/6WyNuzRHvA358EXAY0tng7nS9wKKpKsuYf8V++tFoIex
	dqcQOxP5/S/0Xc8ZsE4FEJ9s7Rq/g6Xu7gSwZORQNvs4ArmIked4zqGBYxw0H0mPP/ppW+WJTCB
	i2r5tJzP12vTPeowPqc5DiQpBn+TjPS1awD1pvLUR4PmnObDPd+KE/6oB9KyoQ7uBl5TfNDLn6w
	3PNuQC3uxQqQkRZxyAPnTD50IFNlIV3sYqJSQqzudfyKFTA6ruSzSPauU7DVsNDqhyLSofqT5Rg
	Qm1VL+ykvxCAmHC+uu+d3Mh8Z2SZ3LXWo2995YTuirZALFlVjbKZjHwZAnhW889UXofCeySUwu/
	C3z1/0wzaKX3qngN7M47k39/r9iDEZsERdkrvjorVk5FDQwPYD1+Hnycjfo/Xvv/FPRlEh1JpoQ
	n9xKJVXwPIn83eAT0PCN1kbFQ/e4FVRai0WdwG
X-Received: by 2002:a7b:c7d2:0:b0:490:c2a2:e91c with SMTP id 5b1f17b1804b1-490ec521e1cmr31760985e9.34.1781278458046;
        Fri, 12 Jun 2026 08:34:18 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm61187095e9.2.2026.06.12.08.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:17 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/8] python3-tornado: Upgrade 6.5.6 -> 6.5.7
Date: Fri, 12 Jun 2026 18:33:57 +0300
Message-ID: <20260612153404.3213552-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 15:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127543

Upgrade to release 6.5.7:

- CurlAsyncHTTPClient now fully resets the curl object before reusing
  it. This prevents incorrectly reusing options from a previous request,
  specifically including client SSL and credentials used for accessing
  proxies.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-tornado_6.5.6.bb => python3-tornado_6.5.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.6.bb => python3-tornado_6.5.7.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.6.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.5.6.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
index bb363fe1c1..4dda1541b8 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.6.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "9a365179fe8ff6b8766f602c0f67c185d778193e9bdd828b19f0b6ed7764177d"
+SRC_URI[sha256sum] = "66c513a76cda70d53907bc27cf1447557699c2e95aa48ba27a442ff61c3ddfc2"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


