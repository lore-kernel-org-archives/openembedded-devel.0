Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2C9C48BF8
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:14 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.618.1708129029171137914
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FQk0bAE4;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e0fc87fc2dso1691120b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129028; x=1708733828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WN0GDaE+A5/4oDhgWGYDNb4Smz8Y6WHuXWDdRy1pRrc=;
        b=FQk0bAE4CN0+W8Xgr5XL8IhEECuAyeS8x0/GeXOivCLKd5ENlU2vPMMePygXyolA4S
         gplm20TEPj/ZAs1LMdBJzDdh1J4gbuVLOPa7gGRNlzQZB6SD8qS0E03jlQe5FpANG2dU
         kC0+ajWzoPGHsdjHFztiqHcb5DZJvtqzPl7Add0PYg7OeXB9HwHDuds5P0Hxyz8bGgC3
         aMINUxaMpRpSMYdXypTDQ48B9Icd9O7FmIeTQMYRojZXmUKBMGbxmMIDsK17z/F8obRn
         yidBz99WOpyOAr2o3NTg8Bl2oD7DRuxitrpjohmSZSKHM+X1uWoUJWnmA/DeAU2VgymQ
         Xjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129028; x=1708733828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WN0GDaE+A5/4oDhgWGYDNb4Smz8Y6WHuXWDdRy1pRrc=;
        b=KrKp0TuUIjAXZ9o6oCCINbtzP9Vme7JfK8+9X6IxafgJpLjTmEyosQgum6p1WmHnuU
         KEmBxfq2wHg4aRTvAlY8/mt0MRG6JocvF5tpy+lGqeT5G+aPbLSyNrtHov5eWKy5jY2o
         nqUtx7BG1x2Kz7i5kVejlMxEdhLEMxgA2ezzG8SjA7w2ao6hN0EjqXBarBb03ZW5cmv6
         o8OJyBQSZhL/V8kip2V9VB5C/9cX+pQE2K47PM7T41xFoHosa7yP37ldoeCxj/tFjMMn
         DpkgrQ2KrYdL/O6CA+gfuxoZdwQLFwcvebFMR2W3f2Efj2CXyEh/eu0TjQmz7RRcwrYZ
         H6lw==
X-Gm-Message-State: AOJu0YzOWxfvs34wjRmH2RvhRpmipXkkgqvA4EHJyW3rUGgRpv9//mIj
	C1rpD04UMjVUhbNQCI8g4Q79nWpv0B7ITooqXtAY8/T/utlHo8svqNdBWC3y
X-Google-Smtp-Source: AGHT+IHeAM6tm+7Jik4vWPDDVH8yg6a+g2/SEHbB7Un+QS2PgIQ70lpnhmYI3E/7kT5Hf/3Ofku8DA==
X-Received: by 2002:a05:6a00:2190:b0:6e0:a312:1f3 with SMTP id h16-20020a056a00219000b006e0a31201f3mr8489260pfi.27.1708129028383;
        Fri, 16 Feb 2024 16:17:08 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:08 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 45/60] python3-service-identity: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:36 -0800
Message-Id: <55785398d9c181fe5b71d57ba8237e759c2054e7.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108815

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-service-identity/run-ptest | 2 +-
 .../recipes-devtools/python/python3-service-identity_21.1.0.bb | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-service-identity/run-ptest b/meta-python/recipes-devtools/python/python3-service-identity/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-service-identity/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
index c3c26dda38..0a2f2728b7 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
@@ -20,7 +20,8 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


