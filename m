Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1F5CCD184
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 10:19:09 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.4028.1759485730208218508
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Oct 2025 03:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OHixLdgY;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: joao.raul.434@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso16767985e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759485728; x=1760090528; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iwb/HbnwzE5TgmJ5/wf40ncfLtJl41+p/ryuB8gP2tw=;
        b=OHixLdgY+TNhKnNpXZIrfyfwSYBAWHfPhw8t+W/fq/howPIoiuqZ+w8Xr5CZHAa1Wb
         TLam0jKP7TzTPqRyz+810CPCBVWV3z7s4sOIUM7FAWSR2d+lgBwUHSoX4/XNmzoVl3i3
         kv6+vFs7rd+TFXZOcC6tCFjbd7XhDcLmypDk6lRPb8OM9WgetC30TBx4ES8gs8IGZVGC
         0fSpLwJdDHx3Cf1yEBVT4LGQGrj7NVpiX/nZhCdrtGwpiB1hmRqKJRheg7lpxnxYdr7q
         maFN7lCarCKWXqMPZ3d/AA3SFcLVtg2xH8hRfA4whcP32MZ4C/sc/S/ZHxPq8pl371c3
         pOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759485728; x=1760090528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iwb/HbnwzE5TgmJ5/wf40ncfLtJl41+p/ryuB8gP2tw=;
        b=hIHwpVcDcVPJpdsHZv/fGWyZs7yiVvFhizRUSlSHXWTMaWzurOZxC8uBQF+DVDyjwa
         BB998O4J+QUgBo/c8rfKawJOtac1yWJNzgs2NsbGTDG8Ke1e0hny7mZMiPoOuCkSkqLe
         AUJSjT/o7Ja2aP5WPspjSwlhK1YdMxM4yEZgNAdJiGZlDrex7UBUpRq4xGliI4P2WOYo
         Vrq5NJZBSR8mPXJr72UMk7FxFFx1p0MYLdiNmufxu6487f9bKDyBUb4sLhHqTDp08uQS
         fBVD5pomXED6ZxTtbLOvWPquZlz6oK1jznXAr0535m2MqxTVi6A5Kysrb4b5SNKvuK2l
         lCtg==
X-Gm-Message-State: AOJu0YyrTkIG6q5GOqJOt2VRkR+AUEt37nJ9tmSNarRYX5V6A9NgD/hZ
	KclAhug5a+JT+rAd0E+9+Cfw66VuIhtAkRxhBZSnMzQStKxfGKMd8qUNJD2g2vOY
X-Gm-Gg: ASbGncskmKW7zS2aWUMgDdUT0qB4agPKrT7n1UA3UoqEOGLFPq/Eljo9LesJfPE+Lg7
	Qe2dAqoFQJZ1FBv6N/E5x2ley495p2wrDTGrOv5f/6sE5ueNLfH+po5Ec9P2ItmU7fZCyPE4kkT
	SNlRFqOkV/1p57zg10Wa06i66Pd6czMa23hG/9mo23HUhR/eSJvRKIvr9MIheAhDiy85zR51NId
	m68FtdkjviHhtfj5XG7NDKNXLeQb8C5sB4AX8NHYvrSiGNLYqLxISc6Nr6A/rzy6kieeGb3a39P
	Zt04nvWE/rZKndJY1PmiOAKf5hkgiPO6Yb0HWjy8cdf03iDfNce8O+aDXbNszTMrGhZl7pSCKza
	ZnLza/eeKYPOkNpIup8+f7ye6EL63eKAOSVHmmgREpK9A7PK8Cx/6ypTcsyvztSePU8DYdfykbr
	doKXAZqnSZAUk00JQDKw4A4ZCnl4vuEGgfdQSq9Fj/RAq5G5ucmNy8y5qP
X-Google-Smtp-Source: AGHT+IEnb31rk1OrNtS9qbQI4uTEgrgtqxeGgX3IPBHOv71MpmBumqd0OFpYijRSWcENMMu1yqX13g==
X-Received: by 2002:a05:600c:8185:b0:45b:9afe:ad48 with SMTP id 5b1f17b1804b1-46e7110a1c3mr18424415e9.16.1759485727929;
        Fri, 03 Oct 2025 03:02:07 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723624b3sm23352645e9.17.2025.10.03.03.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 03:02:07 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: joao.lima@hbkworld.com
Subject: [meta-oe][PATCH 1/2] openocd: bump the openocd, jimtcl versions
Date: Fri,  3 Oct 2025 11:00:47 +0100
Message-ID: <20251003100049.1695-2-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20251003100049.1695-1-joao.lima@hbkworld.com>
References: <20251003100049.1695-1-joao.lima@hbkworld.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 10:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120215

From: Joao Lima <joao.lima@hbkworld.com>

Version bumps:
   - openocd: 91bd431 -> 66ea461
   - jimtcl: fcbb449 -> f160866
   - libjaylink: 9aa7a59 -> 0d23921

Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 3bbe33ca1d..3b7705c41d 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -13,10 +13,10 @@ SRC_URI = " \
 "
 
 SRCREV_FORMAT = "openocd"
-SRCREV_openocd = "91bd4313444c5a949ce49d88ab487608df7d6c37"
+SRCREV_openocd = "66ea461846a3a4a96687c9287c3f61ae8ce0b775"
 SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
-SRCREV_jimtcl = "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
-SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
+SRCREV_jimtcl = "f160866171457474f7c4d6ccda70f9b77524407e"
+SRCREV_libjaylink = "0d23921a05d5d427332a142d154c213d0c306eb1"
 
 PV = "0.12+git"
 

