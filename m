Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3975E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 17:40:29 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.87827.1734457225037064227
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 09:40:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=0aZcPtoF;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436341f575fso43610965e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734457223; x=1735062023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XsP6LOhqGnb4bRs/onzpPGb6+DoEYaJ4XHJ7/TJNINo=;
        b=0aZcPtoFjwgVR22msTNw+ITtjtpWToyGuaX2Bu6r3OXrqceSuR6Lx6su0b+oBsbo5s
         JHkOaY4cYY7rhVOs1Dwzx96jQ4/s+Fdk0NmDilEJiWBLXJb4f8nSgsIaMlUijHk+dvBM
         23d2WsRZPUxZDR5Q0i2KoL280yX5aI/FJp+N0LSfAbl5SY/SUr6K5ooU+82jughZ2W+F
         Nmjwk7iDqFTbbkGDuCpFDKMvtTJH9swDEaMLhTSwKyyReW55wld/bicydKbUsZI4y94n
         ouHJygLbHKZcWm+0KjU6eJCqmdqCB/V/XdCB+IwDYE93HOQ53a49xJFX3tVZr5NI9+BO
         bPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734457223; x=1735062023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsP6LOhqGnb4bRs/onzpPGb6+DoEYaJ4XHJ7/TJNINo=;
        b=TgJjUNgrnrgkSME9ZOk/yXt9eNjWk1v4kEgjYmfbCisVsaiKt0ax+18jCPZeg3c9uc
         ANZXibBRN8hwxJ+Ud+aPAFtPSWn+RoIJn2S5XAzeAHwR1ko6BgShSU5vPt78frzPjC5M
         jIziHAPEjyh7/vhv7H9lYgjZo1111jHcN3G6Z0sVYoEVrsRM3+yjmWgVyYwmpaOk9lW/
         O0mI4h0XxwAshdtl6DDfUomn5dY141cNIZHmTKqe2w/wUYoX3jAQ/oUoyHaXgUwFN1Q/
         xK6IeIq7gya/HS6lEuPZ+kvLd7jb4BY7fFqhiIrdUvjhS8RPS5ILY+9Pu9NbrZG4d96f
         Xg7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/kMY6OGnh7K4fmAFY+X+maLtFwLM+xlpgSEa9XQomls/ztJIltYHIo27uhWZZo3d78WGKySxPihbtHOcri3eD8SI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyhwXU72oJLvSRMYKzUxcC8WbO4AuEzD66XzTqd4ICiPlGA6BA3
	HfVOOytGAGCcFN8MCA8IjfmTBLCwJx1n4s8PAYQ/6Nk0oUWawv7zSWaj/qmz8ms=
X-Gm-Gg: ASbGncsXN+riGwpgPRqixwe8qqCjr3yn8xodf1Wn2LhnuMzweBJy4M0eCfEAnmsHcgb
	oobKz4bgYUCheVcR3z+gKWuVls9FUxR3rX4smUbYcMglgbKSh4zDMDH+altYLe6DmnaN7H+6QHx
	yWeuZH3/am4ArpZZ4FgrQQq+GNnvkW96jBS8NMXh5ufjlDmzALI38Yed8P1ehFH/t4dURjbXKRk
	bst1//Jrh4KIF0kuAWM96FOdx7aZY5fWI1PW83FothV52/UiD+E8iJS
X-Google-Smtp-Source: AGHT+IGTUgOO/QOTfw5KgD0B/ySvGRiT13IMLcbrj4sZE4ud6TlMKdB58ig2TdwxLHle988on4u7Ag==
X-Received: by 2002:a05:600c:1da4:b0:434:f753:6012 with SMTP id 5b1f17b1804b1-4362aa509abmr179939595e9.17.1734457222963;
        Tue, 17 Dec 2024 09:40:22 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4699:6189:1775:3ce7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436362b74c7sm122954005e9.33.2024.12.17.09.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 09:40:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-filesystems][PATCH] gpiod-sysfs-proxy: update v0.1.1 -> v0.1.2
Date: Tue, 17 Dec 2024 18:40:20 +0100
Message-ID: <20241217174020.84283-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 17:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114373

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Small bugfix release addressing some corner-cases spotted in testing.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../{gpiod-sysfs-proxy_0.1.1.bb => gpiod-sysfs-proxy_0.1.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/{gpiod-sysfs-proxy_0.1.1.bb => gpiod-sysfs-proxy_0.1.2.bb} (97%)

diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.1.bb b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
similarity index 97%
rename from meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.1.bb
rename to meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
index 4d466d30f..fef258910 100644
--- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.1.bb
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
@@ -15,7 +15,7 @@ SRC_URI += " \
     file://run-ptest.in \
 "
 
-SRC_URI[sha256sum] = "c7830cb6a2c01914df2bc0549aef2dcfcb955520d400f65b3b50fb7a6f77f1b4"
+SRC_URI[sha256sum] = "4bdd4b8a7042f63a40507ae0f16b360011e67cbb2f0276289636487a54849530"
 
 # For full backward compatibility with the kernel sysfs interface, this option
 # must be selected. However, we don't make it the default as - with kernel sysfs
-- 
2.45.2


