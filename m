Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93E9C4332F
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 08:40:43 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.10453.1670229638923265358
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Dec 2022 00:40:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=yhX4nswn;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id bx10so17515881wrb.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Dec 2022 00:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xk8avtVx73LLYNGapfLRb2StQbCtW5PgK5Td49QZ9yo=;
        b=yhX4nswnGK7zXt+kJ6eW/son5Hd0uFpjstk9X8p7krjehAuwgpN6/7Hn1m06qpeq0D
         XbKJwTpczCXl8ucMT8AOXRKAxDa2t86iYcDuhcZauA/qEJuyXtgRV7Kg2pUL6DQZwlOh
         iu6PpCfB+qXlSgTjCzPPD0G13otHVsqU6bGBWoo162cAdVV2WYWszBTtqqNmFN1eXfLP
         GxBV1K17cnSkY3WqYeUpdNxkhLd6cIPRHn6BAEgxtYLg3aRkxB4vuQSRa/gQAPUvZWZB
         NCkmewvLRxa1UqoKwoNnxZfE8VmrvLbzYNKColGqqqh0vsklkNgy8wTq2T1Rb+eNwcli
         4VLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xk8avtVx73LLYNGapfLRb2StQbCtW5PgK5Td49QZ9yo=;
        b=RKsfOYmzWehKOkKRheDEOcLLa4jaLFXaUzNueC4a2vecJn3oRDqdUSK0tYuZrod0P9
         s0wr+VusHTCoiwvqibLcbGczTW8gyt64q83DrDttGZmWvnoD1G1uK5L0G4go2e7AUFcW
         cSBBz+371KAfOER9dnu+MlS4zoUlsDmVOVUrt/1Yvuws7cWw0DTRnJwoqLqQr3ZHwsAR
         FGiEqC+Czh+Vq8Y3vd9tRie/zs1DbtrcRaUZZb4xbsFLNKDd0GkwEy0aN+xu5i42MNHU
         Qmow7o8cmGwknCCOKZHz2xqjjaJPZ2uvD7FZ8RtarKsR0wiBvE2SZ6WGUqAvc0np/hZs
         BHOQ==
X-Gm-Message-State: ANoB5plqNQJEPiTSOvIfTokcbo8QFdvVT/YcpcH67OPYqfe0kliZ8eeZ
	JewvzuKJrozu8Wq8Oo2wgKKFqQ==
X-Google-Smtp-Source: AA0mqf6+CklBqEtbCO1GRTzQZHpdFFkzBwBimwTXgpiybXB29VUhzHMNIIWFZXmFC1EF7RoWXcyk6w==
X-Received: by 2002:a5d:5685:0:b0:235:f0a6:fafd with SMTP id f5-20020a5d5685000000b00235f0a6fafdmr50344320wrv.75.1670229637160;
        Mon, 05 Dec 2022 00:40:37 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1845:911d:bbf3:b5df])
        by smtp.gmail.com with ESMTPSA id m28-20020a056000025c00b00242257f2672sm13859561wrz.77.2022.12.05.00.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 00:40:36 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH] packagegroup-meta-python: add missing packages
Date: Mon,  5 Dec 2022 09:40:32 +0100
Message-Id: <20221205084032.9829-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Dec 2022 08:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99949

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The recently added kmod and watchdogdev packages were not added to the
meta-python packagegroup. This fixes it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 1d2a9952c..4e318967d 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -218,6 +218,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-keras-preprocessing \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 opengl", "python3-kivy", "", d)} \
     python3-kiwisolver \
+    python3-kmod \
     python3-langtable \
     python3-lazy-object-proxy \
     python3-libconf \
@@ -450,6 +451,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-visitor \
     python3-waitress \
     python3-watchdog \
+    python3-watchdogdev \
     python3-web3 \
     python3-webcolors \
     python3-webencodings \
-- 
2.37.2


