Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCFFC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 11:21:22 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41013.1785756072815333708
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 04:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pkijjMOT;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8486ac3f347so3992859b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 04:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756072; x=1786360872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gV8hJp8BLLhDD0XoCVN0r4iUYJ5uQvJ7X/Z9jkm3erc=;
        b=pkijjMOTcugAyGMOZpaWkVvSMI82KYd2+Bw5n5x5lXD3/fUNSaHcE8GjJoBzdVitHr
         wtdAevuefiQcZ0fwpIVgl+DDqvLvyYDDOiTr4L17tL+hXm3CumUG7Iz0TSR6R8/2YnVb
         VBhxnLorgI9tDqo/O4TCDFNPkXIi1aVHyGPdn+CqBMr0kFF/4U5el3Hwv5SVhf4KGCVJ
         uKJUL8hb6AckoVmYEhv0xjscLgaFBY4S8E3UD+vjkTQ8EOPSMlzYmAPWIRDe6jV2chcV
         loaBN1avkzORVBCP0XeO5agW91Gu2UAlsRZAH1J52gFjCdxHpKkqrTJp1izNYLBroa6p
         KQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756072; x=1786360872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gV8hJp8BLLhDD0XoCVN0r4iUYJ5uQvJ7X/Z9jkm3erc=;
        b=mQW26WQts9O8o73LsGgGELfuBk0Q29cFX3fTtjkdyAana9rOi7b5r0WHLpcFwPVXSy
         6D4fn97gUr7sY1d3/JcHBMpixRVgvp/HKIF82APZoLHd4rNVvxwCdP5DEZjLBrQT3uai
         5NRJr7tJbjhGaj+dlycNpBJ4gDj+7AR5fUkWMtcvSmzWQ29K6GSdl5u+go07T6MsvK3b
         4JY6jt5WnJDSF/8eYK0/j7JcCvjvXrzwyQuzoIr/8EYaxd9/21950fd0geBqKwa2Rjk/
         PbxRkgg+g6MCW3id4PS+qUFoiEEsuI6rhGnE4hP14smiWO/1T8v6y0TSauuMYhUxyXl+
         5l1w==
X-Gm-Message-State: AOJu0YxDWhBADYUApiPZSHwYVaCpvAGBh6z3MhJ9xD1peeqiT+5IbFBC
	nyy9hQSDmomHFIvIfq9luT3hF9zGXtSQWKH0Nv4+OSR2tiSaehIy8jLr9HCi1jLt
X-Gm-Gg: AR+sD10fsxo2AH7t9Na6kDSZS82STGuwfF/Oghe/9tTVlMFsq29nMiEG0Z+On/3otg1
	Q8OOSOn/EWbMvub8JfK8e+IqB5kITZYHIuKjM93JEKLanvJia6eqcq0QaP6shI6d3pvlLP9UEhn
	gyCXu2YB3p0tDteiG7bhfLX0L9/28j3eKpAmqNNOkZEKyWqKaWK/ktab4IuDvHs5z8pQVVp18MY
	j/PGpvMaz3b4hUFe23VAIGVNXUxO+PZH5wcz34KVK91y1KcFjj71ixyMedSauuQIkccSj3LOAOz
	/JtgLDjbUpwxKl+aBhWxwKykKVKpVDfg8ockORYoZr7qLHpOcEA2/jRtTXc5DlaKnWzSE+XVfrE
	t76pL63ecGDWDya53wOPD1VgB0ciowkPI8/nbokgCX4GUYs/RXgbK4eJnqL3aRb1ZArWK1ZaQ4r
	gxDEuQfHKnpbN1p8S8DO3aE+5DClDBvn4KjR9H3y77Z0s+pw7VXgTz/RTA4MFqVZNOIP8W1Vf/8
	vraJvkRp9zc
X-Received: by 2002:a05:6a20:2451:b0:3c3:80bc:1540 with SMTP id adf61e73a8af0-3c91a711b5cmr10218637637.3.1785756072173;
        Mon, 03 Aug 2026 04:21:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddcba2bsm42463843eec.11.2026.08.03.04.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/6] crow: upgrade 1.3.2 -> 1.3.3
Date: Mon,  3 Aug 2026 23:20:54 +1200
Message-ID: <20260803112055.3926085-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803112055.3926085-1-ankur.tyagi85@gmail.com>
References: <20260803112055.3926085-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 11:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128680

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/CrowCpp/Crow/releases/tag/v1.3.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/crow/{crow_1.3.2.bb => crow_1.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/crow/{crow_1.3.2.bb => crow_1.3.3.bb} (92%)

diff --git a/meta-oe/recipes-support/crow/crow_1.3.2.bb b/meta-oe/recipes-support/crow/crow_1.3.3.bb
similarity index 92%
rename from meta-oe/recipes-support/crow/crow_1.3.2.bb
rename to meta-oe/recipes-support/crow/crow_1.3.3.bb
index 09970fcfc2..da8da60aea 100644
--- a/meta-oe/recipes-support/crow/crow_1.3.2.bb
+++ b/meta-oe/recipes-support/crow/crow_1.3.3.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e08502e395a6f7c037ddfe7d2915f58e"
 
 SRC_URI = "git://github.com/CrowCpp/Crow.git;protocol=https;branch=v1.3;tag=v${PV}"
-SRCREV = "f8c060c51feeca2c65828fb6f538603db4392d55"
+SRCREV = "7375d3dc1ffb8719778cdb29fb1c73141ce684e8"
 
 inherit cmake
 

