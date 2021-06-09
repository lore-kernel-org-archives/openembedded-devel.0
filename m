Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.3.1623267107377195991
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jun 2021 12:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=uxbwGFeJ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso3698040wmc.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jun 2021 12:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yNwDP8Rlpzaz6LNNdDVwr4694ag39yMIyPQf6on3dvk=;
        b=uxbwGFeJDuXgfGtvfdbs8MuTq7FjHqYFzX1LoO3cgZnAtKwylcA+TtGhV1d7uWGobf
         JYFHyJ+uOTPDQr5+v3nf8cnK7wVeB7U3V0VFMZYUdX/gWWAsESE6E7k5uhfR+yCDJbXt
         oahuqBHgh6zdRZKz6BRkDatz0SZgvOnHBX9IQRbAlV3wxo3yIoqHT+5F65HX0BztdwAW
         TixEiKIEHmWDjqfyhXQ9rAhINrl34NSa5qIisBjvEmCEAPyi3b6dj8lOxzuQOzyNdDKC
         gJ4lvV3r6WN/WM12tfgGXxdc2nlCUJNAzCuldNKuWQukJV2yotu9vQcJHHlckdU1SmP5
         UfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yNwDP8Rlpzaz6LNNdDVwr4694ag39yMIyPQf6on3dvk=;
        b=dViYi9Ougqlr2GqLfi0tqmzPrZJApecUgG8XuQM7/eadhkTWMJlRv5o1GZ++c6HzNf
         GVgofqV1dJSEL6BLJfXWVtzDRjm4Ej71J4L+FWAoP9gMft84k8rQ27PiVurPUEgQXJxs
         9+p23arxYBKPn1kGH9lBnooOrKeD/XHHaczUziINmEBxjkMCra1pMZvZpgqsnDlQUjaF
         G0PViPLw0JG3xARMbP0QCwSGBOD2tCrVVqyuiiOLy3YdyrJHmJC2CryrdHNsRq0kmfeY
         aVq3SVZg9rZluTrmfLThU1jWgQAIQy5+txGaBKECrIum+ar4UT9Kw0lTcjw+dKNsKo+x
         5kkQ==
X-Gm-Message-State: AOAM5303LFYl/BWyB61frMBl6xJBKNO6uac6eMYbsS2o29rkNfGTifWN
	kkQ352nHU9v3aty+9AY3iXJAmw==
X-Google-Smtp-Source: ABdhPJwuGl6dfOkm+//NOrSUX4Jt3/4W/fabu1bClXUPWYuS+K3V0fpbazTjiqEDtJFVbLzkMTGilA==
X-Received: by 2002:a1c:e441:: with SMTP id b62mr1442272wmh.36.1623267105924;
        Wed, 09 Jun 2021 12:31:45 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id i2sm633262wmo.40.2021.06.09.12.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 12:31:45 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] libgpiod: update my email address
Date: Wed,  9 Jun 2021 21:31:44 +0200
Message-Id: <20210609193144.25592-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I now maintain the project and this recipe in my own time. Update my
email address in the AUTHOR field.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index bb586b681..2d63d83e9 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "C library and tools for interacting with the linux GPIO character device"
-AUTHOR = "Bartosz Golaszewski <bgolaszewski@baylibre.com>"
+AUTHOR = "Bartosz Golaszewski <brgl@bgdev.pl>
 
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
-- 
2.30.1

