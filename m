Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B9FCD4F2F
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:25 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17889.1763014819181311488
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fWXfw/4y;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b9387df58cso406230b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014818; x=1763619618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpoKsipn1jWJ4DoaqLUg/KWTvQIG7m+fVToj8xuErq8=;
        b=fWXfw/4yDjA2okml4pUxmd2p4/HY1s2+uOp9LU5phLKA1kvcM/GUSjjqeLmSKZYpER
         Wngg/sKNfos/zE31Ohb7Qg/wJi0Ir+sZkI8iPmBKNiRuay4nldH28vCseL9N8GcV0flx
         0Q9QPbnO3iduVxTqppQzuKbXpcSRXScH4cTjWQ8+43ltxn4FXHJsy0Y0f2rNay5TKKvd
         i7iAJehgkav/tqqqII7kD1UF6yMe1/iJBmE53B8V2gFZMJWz4kCUshELuutO4nNd2Ohz
         KVA1g6r9vu+AQDSxQvQFD9kxrheTTPX+DvN4qU83eazR+9w6cPuiIsGZXaNHDwhU1mUl
         kNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014818; x=1763619618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KpoKsipn1jWJ4DoaqLUg/KWTvQIG7m+fVToj8xuErq8=;
        b=l1StLK2ZNjsCFCNWlA9+bT7S2VWyKC/Uyzpyav9TKDxCufwSKXfU8i8HGlq/7fXaOv
         uC7E7ZFU/0ErQVtblcA+A2ZqlQx1jXIWw203kbXFQBETEgdeSdRKvzL2RXanF/+agCam
         7CYlR/8cwZm5Ria2GS/p2JIPJsQQuysUHI9zlNoEHS4cqh0GR2P5VDldX2FkWBVCZomZ
         8Gi8NXyEczVgptUMjs2gNhO5Gs+zs//aab7zJG0rfwb+FPZJ1lP6M+XUcZF3yooNq6/Z
         9YWN7g9UIbeYh91FkRiXyCaksIopfDVc6vkXxMSmGdySs8PnQAAwVTwVmjFOGOAP757+
         w12Q==
X-Gm-Message-State: AOJu0YyY9FUrw+c74Fg5/LC1VFz+sk3hwG2ONYM5no4ESmupbjLm8mNr
	TeD+k/qERsupcuZ2QPFZCcPmtTznrvJbKsiRbgPoPUkXirpwmz92HKVE2ZgsuQ==
X-Gm-Gg: ASbGncuAJy6Br7IfKlpAjGI7FnGawge2D8qac+jhFSerOFQuruYA3nWtXjhE58y7e06
	DtNiGKNg4KUzpy7B+vdQ692Tew6fk+57g9dXbTWqq3c5h85XHhxfdH5IHfMOTtDVk33lL4Sv3EZ
	3AFkxr9dUkFdKn3cW9mp1n87vknl2zNdBsNMIED/1IP3P5qOn/OMtrSFPw53jk7MSieUwMNNEFO
	0jJ/3b5C/qlaiVUy2C/yw7FDd7w2pL2LJhYtl9l1cGuUYUZ7CNJMHgDE4b9AETFMkhD5z9mhVV8
	nZ2urLg/Zs/EXvcXjXTY9TD2ZURDihj8aGduBAxzosG4pWQc3NGKVrqNMhoVHnXml3d6tSaV5zQ
	84vwgIWZvhgfKAy0S6mF12YDlu2aWYrYctfHR4/tRH9osON9CLODdvUQenALupHTsfJfMod6IHW
	n1qSmW5DrOnWUKZQ==
X-Google-Smtp-Source: AGHT+IEs345na1BT3SU9T5/R9eCZlAQIrBC4jvOerMSHrN0Bx6owM9YVGpVwVCZrYcXmSGQsvV9j7Q==
X-Received: by 2002:a05:6a00:2d13:b0:7ad:386e:3b6d with SMTP id d2e1a72fcca58-7b7a49f83a7mr6761357b3a.21.1763014818468;
        Wed, 12 Nov 2025 22:20:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:18 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 16/38] libgpiod: update to v1.6.5
Date: Thu, 13 Nov 2025 19:18:51 +1300
Message-ID: <20251113061914.3756301-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121614

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This release contains a build fix for environments that require libgen.h
to be included for basename() and don't pull it implicitly with any
other header.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4b4086edef22b7aec9559af931db47d6107971d9)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libgpiod/{libgpiod_1.6.4.bb => libgpiod_1.6.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.6.4.bb => libgpiod_1.6.5.bb} (94%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
similarity index 94%
rename from meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
index 111a5727ba..74b49a57bc 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
@@ -3,7 +3,7 @@ require libgpiod.inc
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
-SRC_URI[sha256sum] = "7b146e12f28fbca3df7557f176eb778c5ccf952ca464698dba8a61b2e1e3f9b5"
+SRC_URI[sha256sum] = "ae280f697bf035a1fb780c9972e5c81d0d2712b7ab6124fb3fba24619daa72bc"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-1.x:"
 

