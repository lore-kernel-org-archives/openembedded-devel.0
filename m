Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D68CAC5BD
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:49 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.21084.1759223985448270698
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BwjLkFXW;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-930a6c601b3so96890939f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223984; x=1759828784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Irx+3y2huMtAgDuQ/Kh2SlMPkES6oMpAgwFR/XiWyUU=;
        b=BwjLkFXW9Ytyc6ErAZMjBr3xgKfvkDeDUdj4Ry8IgNHI+8DObVLGRKke6KV+QivP0c
         zyyAB2X/25gT13kaNL70nQCg2wRIoUGDXfWe9QGAachapg6BoFFVcsxxaW/VzCofldC+
         f1wnCTLVkV+SN6bdQoQQDmTMCRe0N4b9hfUb4lm6dMJtx49uqp6B57JKsVG8mBhO9bok
         Q3L0eelg0Jq3UUP9A8IeRFoyv4CJr0SxmHGI2JG3172iJtjnCNUkBcfMbEbSZV71gPFl
         IGnnpbL8YDhSdJ85Czp2rWW+mthYkOEsKKsz0COgb5OdNfx2lVgSZbSsGN+Tkbq5+xrw
         E3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223984; x=1759828784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Irx+3y2huMtAgDuQ/Kh2SlMPkES6oMpAgwFR/XiWyUU=;
        b=Kv93hSzQKFdRunAr0gXV3kIt1j7SQdxQsQYkws0upDyI8eZ+quGFlimodOTKTqcMQA
         Mmw+Ec+iWv5JXnd0im+K2MKWNFkDRhBMwpeohWC6zSYZ9AIdDSjv0CvgM+TK1PcX6iHJ
         VL7ixEL9mTdsxn/p0+s80nTa4mhOvva0rvVQVwwCXlSWKkWBrY773fhr9toy/XEz0dc0
         sMqaNAtwwbrZH9kt73kBKL3qT8Q4KByJxTX8j1og6TFXtgG+ZUiCZUk1K+knDG2ipRpO
         3KeVqkOlMbvydVeob9IPNVEqoxYD1xRmq3XYu2h3AGaaXa/N7VyLQFLSz2BPmaAKNrV+
         KVIQ==
X-Gm-Message-State: AOJu0YwTeaKO/TjvLLuyo5PRywd42p2S7Tbt57cwbDlB5OLWzz4UV9Sb
	mfQo5mjhuNJEOm5kfd5oZyp3dRihQ9enqxxT9rqFG41ouvYVxKe8AcrC6Ce3oXj3
X-Gm-Gg: ASbGnctlwn6eJfWijOcvLz815DWThoqQlJDB5bozhAt5Xoado783rzCCZkrcuS7JxyR
	/tGeH5gEqpj5yXd0jYYQF4RVjzTsOa+9LHsNNz1QAkw/9eTqTCTzFmIfn3xGAH5dq/IDiNqa+sO
	khjlXb17NiETcW8c1y08Z30RJWkp01Cvbedg+Uc1diZ3MhfaN0SfDkoGc45TRDS9AdGicLyj1fM
	AHk2uIOuuCVSPtY0ZQBuRZ6lgDP4CVUiveluixPsIfodntva//twhmNUAVhlEkFTZSN+/zTEU7P
	1py8tzet97yiJJoZQpHwu1Bo+wV3RH5+5ayZw2zObkPuPj1rCqVRuehZGQMLoMW3OhOCDFVjyRx
	3g4vjG1+77gxmzTY4w3QihEHXS+azBjVStezSn+I87cHNI7ssfu4/QsSq+J/w9OEHu6Fe/VqKs3
	8=
X-Google-Smtp-Source: AGHT+IFFI5DrXK8D6HmUzyVMovm1dEi2o3ncj5zBuRjuFf7fhqpufxiJg08vH7n8lYW1f5TWVw9Ifg==
X-Received: by 2002:a05:6e02:156e:b0:427:54bc:4670 with SMTP id e9e14a558f8ab-42754bc4848mr72515725ab.26.1759223984500;
        Tue, 30 Sep 2025 02:19:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:44 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 22/22] libgpiod: update to v2.2.2
Date: Tue, 30 Sep 2025 22:18:41 +1300
Message-ID: <20250930091841.1693131-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120074

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is a bugfix release addressing issues in tools and core library. No
API changes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6914e20d63ab1c4378fc23ebd71b000be5fa131a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libgpiod/{libgpiod_2.2.1.bb => libgpiod_2.2.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.2.1.bb => libgpiod_2.2.2.bb} (98%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
similarity index 98%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
index b72d960c10..8797dd1d59 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
@@ -13,7 +13,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 
 SRC_URI += "file://gpio-manager.init"
 
-SRC_URI[sha256sum] = "0e948049c309b87c220fb24ee0d605d7cd5b72f22376e608470903fffa2d4b18"
+SRC_URI[sha256sum] = "7e3bff0209d75fbca2e9fcff1fd5f07cc58b543e129e08b6d4bb1e4a56cfec0d"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = " \

