Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F82C3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 12:39:27 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.67080.1722515964955948225
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Aug 2024 05:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=T/xzvTMV;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso48283095e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Aug 2024 05:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722515963; x=1723120763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tg3c7ngfVcl4x9lhpbq6H30OwLD853qfSAJiKP0q3+s=;
        b=T/xzvTMVrXIRK8vSVDM77M5bN7lOgHOa7U3zR5hGDQik6ySrSsa+vwp+3p8G7c9cFe
         u5k9dtTEZKXt/hVeKOdG675EJ4oEvvA4mwIiZauF5vxyKSaY+b7ShoayHnb8lqi4pGRe
         7QJqRHOhxAT5cSHWSxl1s+qrP5/Km3/DvEdrOlBYW3rTyZ3gttiLcFO6nxovW529yMDk
         PPpc60hm1OiK5DRMOoEWa3sJGRdeiMa+uFddcZ8xN4AIl5ojE1NwDjd4kxgNdOtPhDyx
         BWv1LNUGVktfj9uWM5n3rM/3D/qm5ZY4pUpNTd0JTpTVWULiTLghNkvnt8ZooozCoAZ1
         RhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722515963; x=1723120763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tg3c7ngfVcl4x9lhpbq6H30OwLD853qfSAJiKP0q3+s=;
        b=DMsgvEIE6EAo/q1Xmn6qtyQe+y0fC1YrPOacua7BGvvI+2qhw44X2/uSIPzYURxrVa
         9ums/bcMh2vzxYb/wOrre/Cao0o47ID+BSsOFgYEBVkWBb6SSBGTedr7gPadx+FHbxY+
         ghkocLuTAzEdMQzenidB2Y+BT90DarrEf9iyT75x0e0SPaGVVklUfsov2Srl8LzXBly4
         JftaHMw1Csz6Y6NsZxmGhv7BZA2wmOrjB1LswVzBCeZRBcKTHBNXshfliqYkMhQwOAbC
         dgoIpnlZ1SxHJtln1Jgw3mX+rRt36TMXwbm0yoEleaTiXFm8HDBAbXqs9Ph6hhk9UQhq
         puoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9iIzeKspPLylwCkyg8GiDHehkdU1jysJ8CbnWIWnLQ2AZHz1lyxStp8m9q6b4xZMhZfPWXjOCNqYcig2VZt+DjOw7uGW2Tvuk4hPWUlbgZxcQA65J3hoLJw==
X-Gm-Message-State: AOJu0YzTpO9nmFdh9LYwTOmAuJ8UAr6FVb+dAQFzDDnbRNK+FNN2C4Vy
	jcTnWXzFhWxykUaM6YN6J/mMiFXZ78jyRijbBMqra6PBzdFw4Dg1QbA5UB9B5os=
X-Google-Smtp-Source: AGHT+IEllbqqeGlGUhJN87r2E3ikM32c5dx+4zPbWBbw9hMhf3xgSfTht7s2PsffRZ8LOq7SZzJISA==
X-Received: by 2002:a05:600c:5009:b0:428:111a:193 with SMTP id 5b1f17b1804b1-428e5860cd2mr5466585e9.37.1722515962693;
        Thu, 01 Aug 2024 05:39:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9895:bf13:f4de:f316])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb223f6sm57650315e9.45.2024.08.01.05.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 05:39:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 1/2] libgpiod: update v2.1.2 -> v2.1.3
Date: Thu,  1 Aug 2024 14:39:18 +0200
Message-ID: <20240801123919.124678-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Aug 2024 12:39:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111492

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bug fixes:
- fix C++ tests with recent kernels which introduced stricter reconfigure
  behavior
- fix a use-after-free bug in python bindings
- fix passing the event clock property to line requests in python bindings
- fix a memory leak in tools
- make sure the string buffers in line-info and chip-info are big enough to not
  truncate the strings they hold below the size accepted by the kernel

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../libgpiod/{libgpiod_2.1.2.bb => libgpiod_2.1.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.1.2.bb => libgpiod_2.1.3.bb} (94%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.3.bb
similarity index 94%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.1.3.bb
index b4665c156..6130371e4 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
 
 SRC_URI += "file://0001-bindings-cxx-Migrate-C-tests-to-use-Catch2-v3.patch"
-SRC_URI[sha256sum] = "7a148a5a7d1c97a1abb40474b9a392b6edd7a42fe077dfd7ff42cfba24308548"
+SRC_URI[sha256sum] = "2be4c0b03e995d236c0e476e14aeb475d7b431dd1439609b6d65c540f91eaf58"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = "--enable-tests --enable-tools --enable-bindings-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
-- 
2.43.0


