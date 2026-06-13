Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB370CD8CA8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 08:19:25 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87549.1781338759701472753
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 01:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aXNZdRf7;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso11222355ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338759; x=1781943559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8lL7MWNvaalX6BaeKSdQldG06FDqymDP7SqeLdNXfk=;
        b=aXNZdRf7WMZHQfWLDdWm32Lmj0Y890YSxp7X98h88K6XX4ejWrLLXmQASFGbgvVAaC
         xi3DrS3TynL76ldVrzDP+VS2ioWKFz5NmpAFmJhGz1bZLyNIO2g1mjyg4zSclRWOajF3
         vM6ylkOLgVxbxr9yWd1lxCtM8yGcIYCzByinbnh9AUgVf7dR2QkHzrJyYvQEO1kU/Hs7
         bpXUcnszTQTM7EDFLbE4Qu/agu8jcc+uUHd5d5wFASKVxlszczGU5k9rfPuFHbd/eZBH
         0m6ImrbOiecszDcOBa8byt2+spCW4nlvDcUWWS0iStsehIIZxSSg0k3PvUJ6uzhyZGeK
         t08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338759; x=1781943559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F8lL7MWNvaalX6BaeKSdQldG06FDqymDP7SqeLdNXfk=;
        b=LIAfuKMXy5s+7hNZUydSqUdXgaTl4CIyBFsyOnlWzll8IATXW/1mYxGX6JsNXXN45U
         uMcSWi9xIaw21yw61u8RviupjLTIysGh6dri4fo4foFT+5VMGAQxocJ9wnyjbcLNJ8L8
         s0M2xp+aRQYDQFTLoiE4PIUlyndyRw84proaQ2Y7lx//quU1SYFlDSNwK63w+51d0Ieu
         ixnTn0cP56kN21twh37z305fJV4ca/+s3LHknQndDxP/cjc2bdtRzq50u7QztRZI7JeN
         R1pIzqOzZTD9gU/fFPxBZutlCIHCxnjuF39WjdKz/1Q4Fsi/6Hflp+QKdNw8h2dUEAqs
         mPgw==
X-Gm-Message-State: AOJu0YxC/IC77NSSCQ0+8cJJoTwevMWVOrniblx39tkvuO9btlHfAZjY
	4ItzUTod3UH5FPrGApY2BHOTdVsstAoQ02M19H7sDU++GjWG/Bdx6UFafqNRIHwU
X-Gm-Gg: Acq92OGgJv220XtYGyJ3hLtNj2Pa1uspA0nuQOxUJ3N9m2s0pfKhGdDTG08nqVJqliA
	eJ82kZD14te2H/yrQ7O1F0R3GEGRdgomv7erMxI0hDVaCfjR0AckswiUIv90P0Ib3OiJ3RBU7KA
	zFMplTE+Xiwi3X/70hVpOdcpW3uPM1F0KYkgihSX3CiltbFctj6Pdms33SqqvsrQ6Wsk0XzQPIy
	FGIRvNPgqoKNYzuvi5dfzQbacbQNMvh7hQaXlcSrRM1W+N/v2ha0osilC4t9pM5IdI48eWssgh5
	RSrrEKIM/MKNedZthekKGXMEQf38Bafi/3TP0TqJEiobedBwIVPBuCBikTknTOPQS9VE4VGDT8K
	6AjwPYO+uzH2jJW2Uo2zG68aO7dR9nwddE3Xwj8MCPlSKGSPAIVUv8w+oXHUW2IwM9CSOhVsaBt
	D9LsTvHnqaYV2bGHU9hsZgV9SOja3cmLQQkAx+
X-Received: by 2002:a17:903:1248:b0:2c1:69cb:4423 with SMTP id d9443c01a7336-2c4111b8e7cmr70702145ad.14.1781338759131;
        Sat, 13 Jun 2026 01:19:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm43885095ad.0.2026.06.13.01.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:19:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-python][wrynose][PATCH 16/16] python3-django: upgrade 6.0.5 -> 6.0.6
Date: Sat, 13 Jun 2026 20:18:24 +1200
Message-ID: <20260613081824.1223609-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
References: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 08:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127568

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://docs.djangoproject.com/en/dev/releases/6.0.6/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 4d1b2874478e4d4d0b36a5e504f0098bcbb5f199)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-django_6.0.5.bb => python3-django_6.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.5.bb => python3-django_6.0.6.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.5.bb b/meta-python/recipes-devtools/python/python3-django_6.0.6.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-django_6.0.5.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.6.bb
index 93bcc7b2e9..a96a6dbf53 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.6.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "bc6d6872e98a2864c836e42edd644b362db311147dd5aa8d5b82ba7a032f5269"
+SRC_URI[sha256sum] = "ad03916ba59523d781ae5c3f631960c23d69a9d9c43cecda52fc23b47e953713"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 6.x branch,

