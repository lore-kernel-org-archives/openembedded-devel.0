Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01096C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 08:19:28 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.57469.1710145167241243037
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Mar 2024 01:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=IPX3wkqD;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.181, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d3fae963a8so38335031fa.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 01:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1710145165; x=1710749965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSF+VPD51HcvJmOdpmWKjVpQ9NWYq9idx8Vdg1HaeMI=;
        b=IPX3wkqDCKUdSH4sIDnNx2yMUso0xw8QDvJt0FJrXNBylfpFx1nyA7UgDjFnHyf12m
         RY2uqocGuI2fCum5ichz03jTqS4r0oIEAnXIcy6DTvlaz4wSzHZEuh9hMT6Au2GgN3ks
         ZuJDSGJbKpJEUIQqA4IX3pTjKoH3HcPxTCJ8XVaUHv0m+Iryggj73Lmdx2xLkE1Cl7wk
         uRQvuTjsu7NEI2sVywy5NeD50qPoLkd3lQkvwbX3BOVPKTq0SsUQpNX7HSTpFDQAuf6U
         7pumHJKmco6ZfY7bUiV/0yLzFcGFLUYZ5XLHjLl68GqeEhKkDL5FvQULzYmppOqCGxZA
         c40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710145165; x=1710749965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSF+VPD51HcvJmOdpmWKjVpQ9NWYq9idx8Vdg1HaeMI=;
        b=oOZeaNPDWZWDcdRD5Y3mh015ca8655ql4BIEwFK7TfOvTonF7LuXBm3lBhOIIELt+1
         UT9JG1PGztiFGYjg2JkbPTqc6BCsV+ZdTiZg4Z2Ex2+qEj1isb3l+nksGo+V1JW1aWeo
         c1LKqaQJdgZ5tt5PSRS4hM4NmLOMCxW8olZPTR/weMOTSNbcskEeYEyzNoQosxxc002+
         tuLc2nybiIXV11f9MoANjSYUAb9W2hhqOqxM1yGwerrU8D+4XmYHUC8Q122WxB5Kd7FE
         3JCC9Dc1X3394wOJobH7iHhK8byFBW8F3XCS6gQHZzobk3sFTVYSdNpQcX062VK4Bn3o
         dWHA==
X-Forwarded-Encrypted: i=1; AJvYcCX6Yt/5XrnSIAx6J5XfK7foCU4Ony2AHD6l6MFROZ28oPnCAmrzkYoiheWaWXsAkbTJdn90D8W4HO+TMM2IeNheJdxZLwFPitNETsAGIVtNUQSRp2Y/7/TO+g==
X-Gm-Message-State: AOJu0YzD0+h6HCGEOeSZCMXEZ6y0kn3ChU+5fWzRCFraHPkLJzKh0Dfq
	jxv4lYBF+9y16Re6P3ctQ/5JkrhwZc+KS6GBbb9nEYlJnJzI52Y0Xg/B0sjJeDE=
X-Google-Smtp-Source: AGHT+IGPNxQQZNQ2nXy+afbIeC5Z3ivKvVQ+GRnIMA0AvywAffFNheGpyMdQZD0w+o6q9AdFt1nPCw==
X-Received: by 2002:a2e:be27:0:b0:2d2:a3bb:e319 with SMTP id z39-20020a2ebe27000000b002d2a3bbe319mr3722110ljq.1.1710145165259;
        Mon, 11 Mar 2024 01:19:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2647:282c:79b0:93ed])
        by smtp.gmail.com with ESMTPSA id g13-20020a05600c310d00b004131bb71c07sm8246601wmo.11.2024.03.11.01.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 01:19:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH] libgpiod: update to v2.1.1
Date: Mon, 11 Mar 2024 09:19:20 +0100
Message-Id: <20240311081920.5978-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 08:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109266

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is a bug-fix release addressing a couple issues in core libgpiod.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../libgpiod/{libgpiod_2.1.bb => libgpiod_2.1.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.1.bb => libgpiod_2.1.1.bb} (93%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
similarity index 93%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.1.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
index 33df709a6..c62c9a356 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
 
-SRC_URI[sha256sum] = "fa4024a080121c958502f9a46a5bda44bea85e7a4dd7fcb3dead463b6fc4261c"
+SRC_URI[sha256sum] = "b21913f469d3135680d5516f00fdf9f81d5e564e19ffb690927ea7f1d7e312cb"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = "--enable-tests --enable-tools --enable-bindings-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
-- 
2.40.1


