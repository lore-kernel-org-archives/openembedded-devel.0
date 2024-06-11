Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3EEC25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 09:04:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.5041.1718096673803186344
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 02:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=tfnJ4Lm4;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42198492353so6867045e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 02:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718096672; x=1718701472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dq+SNIZ/bsatwkZB9rLGAcfWqvSMZLbWSSNgNKqTlyQ=;
        b=tfnJ4Lm45XsOBxt3wihsGl/4w+jQdj9eFE/mr/2XD6VN+oIF5p3pxrn7o3pZWtUJlh
         ZuTMAyfviCGeZ7I2hSFXkpX854J/8aLaNnLEQtVCvtWex6HYDv6RKB9XVOAqALe0E2+6
         dWxbeavm+bKL4UWJ0HsufvNOdVYByeE36OEzd2VsNp5PcaI5aH2Rq16NkE0993xBuZl2
         6fLF0G9MlIF1IP6hPB0lEvnqecgMdMNa23tByXevm5yhWXsx+lzVhuLfLvD3l+jjZFqI
         sMlPdaAcQRKMXeRMWvQwEdRXOrmNnDWe/33+y+B7J7CgqgZ0G2WCqU0QxduA7tXY2qL3
         9hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718096672; x=1718701472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dq+SNIZ/bsatwkZB9rLGAcfWqvSMZLbWSSNgNKqTlyQ=;
        b=A9le17sBH6HWL+tKmGwg61VWhMmREYy1N65+d23yPeyxD5T9bWdJq8bPMgKgTNH3k7
         efYbX8y42YwWaAJI5wDCLRStE63ULruRM/11QtVPdJwUsDYoDSfJFjcrk2YC4EK93vg2
         BoQEAxElpmZkMOtPhRr8LPudLXwWMO2ECbA6lM+vBRPIpRX/d+DYUh1vLrSWx8OJtPn9
         EQzMQ0BLphcD7Mi352xHel4Hlwpp2d3hylqJI4+uq8OSv7nDFoYY/G/C//ESz7pfkUWX
         zN5che4KS4F1Jdb7bgZyuXlmyg2po6JYP52UoD1Pg4VofbRfU3tmUG76GSHxDiEvqIHG
         qLsg==
X-Forwarded-Encrypted: i=1; AJvYcCUwQ1PmZ+60ysrg8Mxvw4CrvjWhN0W6cQS8NWnvK6cY5Qd8BMWPTmR450APseiI+86FCUxwMd5UCT0Nsx4upoSuAOFg7EOP2y4WCPLQs3iNQCXW99SbYLmEuw==
X-Gm-Message-State: AOJu0YwqqWRfWytAAMWNOI5/9Rl/4HkrrEb88qn7RyJwBRE2W+6NvoJ3
	QUrRYnSz1WCzfXDNrxX59XKommO0VZdgVFQuRM8jhMYdRlOprsmHD7gjacu7u9k=
X-Google-Smtp-Source: AGHT+IGYFwGdUoTpezvREqm8fxM67E9LjQpFrYIGyNnlSFnI/hXM1hq6lGq5iQvyeN7DQ6umICF8yw==
X-Received: by 2002:a05:600c:138e:b0:421:565b:e71a with SMTP id 5b1f17b1804b1-421649eca88mr84452855e9.5.1718096672046;
        Tue, 11 Jun 2024 02:04:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:38d:e428:e1bc:56b7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421dd8c3a9esm59166345e9.27.2024.06.11.02.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:04:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] libgpiod: update to v1.6.5
Date: Tue, 11 Jun 2024 11:04:02 +0200
Message-ID: <20240611090403.26474-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 09:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110822

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This release contains a build fix for environments that require libgen.h
to be included for basename() and don't pull it implicitly with any
other header.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../libgpiod/{libgpiod_1.6.4.bb => libgpiod_1.6.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.6.4.bb => libgpiod_1.6.5.bb} (94%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
similarity index 94%
rename from meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
index 111a5727b..74b49a57b 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
@@ -3,7 +3,7 @@ require libgpiod.inc
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
-SRC_URI[sha256sum] = "7b146e12f28fbca3df7557f176eb778c5ccf952ca464698dba8a61b2e1e3f9b5"
+SRC_URI[sha256sum] = "ae280f697bf035a1fb780c9972e5c81d0d2712b7ab6124fb3fba24619daa72bc"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-1.x:"
 
-- 
2.40.1


