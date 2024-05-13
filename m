Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23F1C25B75
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 09:48:28 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.56415.1715593699701324760
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 May 2024 02:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=tVF8d10x;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.50, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-34e0d47bd98so2814817f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 02:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715593698; x=1716198498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TAKjfLG3ozYkjURMgFp/ddiikC5t9SDndHPqomkszBg=;
        b=tVF8d10xter4cM75VlHfppelSN8Cr4G7bnE/maB0ASBwq4xKlANwjtlPZqPE5g906C
         gPwkl8LNMGJI7EXXdhdl5ZD57TZI6mvzCAxJ6xFPE/ySBBrWnx3lwQ0+6uH+ZUoIWGGG
         6LnEXcmn9amOEQVIviEczMV4JnHFQIQwnAdDxaalAh3YMBhrQ+/oL5+lwO1CdI6VNZWX
         BZVOPQ7SqWw6ixR/C6bbtFfGFwlhL9HQKZyE1Baecj0wxeNZUDW7TvprYUAryWm28Nfz
         VAFrz6LIALlL5hGVg7bZfjHtnU/+MEIbVwLR/D8fuXl7ccIEPR5T1rd9AMlrbZuHAQLM
         wGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715593698; x=1716198498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TAKjfLG3ozYkjURMgFp/ddiikC5t9SDndHPqomkszBg=;
        b=hDHVHA84oZAIJQ45MKLdaviC2YdLorrTbm2CO2gyFW0Y0ejrdn7+eGNhubAs0N0MOG
         q5V0xY/ZXiATx1KajswRzY0OUbfLlq4vHzBZ53bSNYVLf0Z6RB9AkCopy6huiq6lvSTj
         ZmuZf4QHMHTojGBLZia3MWunlqyFlbMQTquKprwg2eyv43F+kWM+H9zCKlim60p+Zm09
         4HtD9IdT3v+2wrFZYcwQlB750ZtCqdwMQVTLHK10hthFNX/hnCG/rIvSl3odVcQnEp2H
         ZqOAV2UQKELSuG89ZVGOIgqg/ATdDeb07k7ZppQTtrcfwmjd+KHUvZvV+ZUuB/WE5G5z
         bpNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5Y7Z+5fXATfIOjJYGgzj6lBvLNn3VoUeOAkDLOv/kugIB4pKoapa6MQ9SIaoGLotA4u0r7Ipl9TsMQuQryJvHWqEejwKvDH/UUsBYA9CTdwUl9zJMt3Hb0Q==
X-Gm-Message-State: AOJu0YyxW5QIoyc2uZ4WxxRG34GlED/Nk06Hp+KDh1KqhjDM+5MqQ/JL
	Mxz/lzC2O9brtLI+1AfBP2gegUhATxQFo6s2VErY2elmz+0Cq+9lWS6+i1ymGg4=
X-Google-Smtp-Source: AGHT+IHiinwrqH7w8+CVDGosL07xT6DuXy1GZsYFvUJ/GEJdR3P2ixY+HkkYe38njSPEen36abjAgQ==
X-Received: by 2002:adf:ef48:0:b0:34e:8a10:3c2 with SMTP id ffacd0b85a97d-35049ab94b1mr7688388f8f.24.1715593697880;
        Mon, 13 May 2024 02:48:17 -0700 (PDT)
Received: from brgl-uxlite.. ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8969f0sm10742569f8f.28.2024.05.13.02.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 02:48:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH] libgpiod: update to v2.1.2
Date: Mon, 13 May 2024 11:48:14 +0200
Message-Id: <20240513094814.152801-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 09:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110336

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is a small bugfix release that fixes a build issue with slibtool
(not relevant to meta-oe ATM), makes the licensing of C++ bindings less
restrictive and preemptively fixes an issue that will be triggered with
linux v6.9 when running gpio-tools ptest suite.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../libgpiod/{libgpiod_2.1.1.bb => libgpiod_2.1.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.1.1.bb => libgpiod_2.1.2.bb} (93%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
similarity index 93%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
index 4c13d67eb..6e4fbd2a3 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
 
-SRC_URI[sha256sum] = "b21913f469d3135680d5516f00fdf9f81d5e564e19ffb690927ea7f1d7e312cb"
+SRC_URI[sha256sum] = "7a148a5a7d1c97a1abb40474b9a392b6edd7a42fe077dfd7ff42cfba24308548"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = "--enable-tests --enable-tools --enable-bindings-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
-- 
2.40.1


