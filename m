Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3844AD2A54D
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:35:19 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.32010.1729107316972583996
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MsNHarPd;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43159c9f617so75475e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 12:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107315; x=1729712115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLqI2jkb+ypu+BFx100WCLRgO+wZz1VU8GzQwKg1PKg=;
        b=MsNHarPd0VAaCh2MxR21nTahtV32y/kkOTK/vDztQGwSZTr+Gts/EnLlvGUQyDGdRW
         EIDOqboM4U7mJy5ZuS8kfoLQgdFv2ZESp6Ga/lmgiW/0dlBEGzvStv+FgH/VKSAV2oYL
         O1Elta9mEu5HQ0S9MjUnFSfL+EhCQFAQxkO3YNUFvqZ7R6U7BAZbKXg6/rYS0c/88ANd
         g/U2jDJFbge7XwPOlw9k/PihBimcnTxzYYh+86vqw2tFPN2t9YSR6A/90mmZ9uyW90MS
         4ND72ETvAiMm5hsZmHqjCdHSWr+kiyDbRoafpfip6CpktG3z8F0Py6TZCwrQFvKE0MG8
         LoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107315; x=1729712115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLqI2jkb+ypu+BFx100WCLRgO+wZz1VU8GzQwKg1PKg=;
        b=rMPAyg1wBz+HhLYlxTVnGXAAMr7NkzzdNfNcUZ5xX/sui6b+PUhdArPbyYUHL9U9BP
         GBiYbBzV/p9dGisBjqkZJ+0ngD4CGD1Pbb9jT8o001ygStTuXhIWrAbxhA+6YOKYn+MP
         hCOLcTRJl3FwEynAvyjD75FUo2JkjCDkjO7p4tupnSey38mTrEBiM/CXshrMuDZS5s2Y
         DpMkMwLundjhURq27cOUYAdh9KJ4oDu6duGLto4Ucv/euNJhGRG4v9Z9ZKTGQPWINtG/
         17m6zP53LJZyvWD9Jl6M45IGRL65Yd762voFD8p+qZ6qNopEJocAmMDJlUv3sgGDJowO
         bqVw==
X-Gm-Message-State: AOJu0YzWdiASGnzZ4P6LoERSxsQ5Y3HlXzCWrrwv2WD9Pj/3sG4VuXyH
	DoSoYOUg3Pe90+76jz1ZzC2HwkfyocQSdwUERLg9n4I5lJH2pcU8EobtRQ==
X-Google-Smtp-Source: AGHT+IE3bJV+K4KbzRxKsf6+jmA6dAO+Q7hOwHbz+GNakYt21VuR10EjDuL8ZB57Np0OZ4aG7Y+iaw==
X-Received: by 2002:a05:600c:154c:b0:430:570b:4546 with SMTP id 5b1f17b1804b1-4314a303421mr48165835e9.17.1729107315320;
        Wed, 16 Oct 2024 12:35:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf838dsm5120724f8f.78.2024.10.16.12.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:35:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/13] python3-httptools: update 0.6.1 -> 0.6.2
Date: Wed, 16 Oct 2024 21:34:57 +0200
Message-Id: <20241016193505.3459828-5-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016193505.3459828-1-alex@linutronix.de>
References: <20241016193505.3459828-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 19:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112946

This fixes python 3.13 issues.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-httptools_0.6.1.bb => python3-httptools_0.6.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httptools_0.6.1.bb => python3-httptools_0.6.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.6.1.bb b/meta-python/recipes-devtools/python/python3-httptools_0.6.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-httptools_0.6.1.bb
rename to meta-python/recipes-devtools/python/python3-httptools_0.6.2.bb
index 4192697df..73378baff 100644
--- a/meta-python/recipes-devtools/python/python3-httptools_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-httptools_0.6.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0a2d82955bf3facdf04cb882655e840e"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "c6e26c30455600b95d94b1b836085138e82f177351454ee841c148f93a9bad5a"
+SRC_URI[sha256sum] = "ae694efefcb61317c79b2fa1caebc122060992408e389bb00889567e463a47f1"
 
 SRC_URI += " \
         file://run-ptest \
-- 
2.39.5


