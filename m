Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F01F4BB83
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 19:05:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28137.1771959897279436173
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 11:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m3iBhks2;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48069a48629so60101345e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771959896; x=1772564696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8HpiKGBJcUVoV/SeO8noKMt/M5xY1d6EHZteU5E9iw=;
        b=m3iBhks25pH8lFgY6dZCXhq775biS4mu5XVZBn9aXICHGFBxOaALU7axdr5et+iTan
         dbNGPbD3x+XpXwPRxCW+zRvtB8nGjkauvsJtDVQqeZOfwEC/cA6TpbbtHHLtKZx5sTp0
         QikJZIlrAjWx/XNHpknEW8vOMfqhZ4e/ILH9faa1OO1wY7NgtOR4/6oRA4br2g5HhOgT
         uIvCBtdw9qxFxBchZ9lmbWcGkbe9kp68tdUkOMU+yYN7N9yVQ8l8PGr/qypL/NVsYU3m
         3KC/j8arR1LjNmspovbKxUQ3bZt79sU0byX9jkk706rtvprPodAFpELuNDAeN4BhiNG3
         Eg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959896; x=1772564696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T8HpiKGBJcUVoV/SeO8noKMt/M5xY1d6EHZteU5E9iw=;
        b=WThg8XeIgHZ8Sc8qgyWM/VHqVNkbOalBkWVmer7BQPwec7WPLDBvtYFnF8Lpbgt8zO
         3JVq1JYU7qLBzSTbZOdJK7MzQWkS1G/u920Ke1vjrLQl0Rrpg+iErqV09/JPoGi4Uhs2
         j/hf1oDLHOxxcd6xzdh1JuwfPZN8N4dTpHQ6atke3ZztcaBAdVRHQkVx04379z4Hriu8
         gDyqvlEoDf4US/imuJSCjiHUc/AcOah6KriIoBNCE9Gxl9zDccu65veQKvvlmPOcPafO
         O5GvR6FemL3I3GTimPUMpahil7kU8u7r7Jq80Rn1oQAOQduH8CK6EaoiHcoKX3o4m6Vl
         j6BQ==
X-Gm-Message-State: AOJu0YywUCYDBoW1C9Yb750qvR7P8nxnSII/IgFNwyIFekVDoA8Lh1sD
	Wb/pgoG1rBIGAgfIPlwCYPxcGkerYFrvOHflkA42XKrZsAWNOgSiuCq0uJXNyA==
X-Gm-Gg: AZuq6aLVfXlQhIfrHyDmRnEYA5z4w5gJD8yPRRWctVV4AKD2vUsNfUiQ+QgdYceP48s
	Gx5emlwBu4zlJ9kCb2MWDmpXjWf3x6XpTJgDCP2iVL/OqqSGI+5PwWLKlC79Fq1o2kjxO4SwCas
	rO7k786iSqPuj6VVGMIhY0OK916ho1mqxu6XzN9GyPs22aMyTXiG5mKtDmpdpr2siN46hhhIoNZ
	dbWVfkpGL9Up/pdhMqQvR5sLPKk/7TPm7dTjQYPdNV1vzYqV4c6zMk6+Xv6P+/dJKXXJKeOv/TX
	SWRd3sdPQo0UChXBFJH5Bcmfatccu0E5zXxEIShGiLF2Vklt0ACVtzhzw1QIENl47n1TO/lqa3p
	qwrLtxgK6R6ahdQiPUQduuJx3lIrdY9sgekD32Kbvj3c7ZqwtIlzaWUNp45JjxYfby+VTVSiVaJ
	JMbqqZOrpDleRDpqKVVv3+
X-Received: by 2002:a05:600c:1e28:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-483a95fe96bmr194892795e9.32.1771959895486;
        Tue, 24 Feb 2026 11:04:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c09897sm29394920f8f.17.2026.02.24.11.04.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 11:04:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 5/8] libjxl: upgrade 0.11.1 -> 0.11.2
Date: Tue, 24 Feb 2026 20:04:48 +0100
Message-ID: <20260224190451.1596179-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224190451.1596179-1-skandigraun@gmail.com>
References: <20260224190451.1596179-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 19:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124593

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- fix tile dimension in low memory rendering pipeline (CVE-2025-12474)
- fix number of channels for gray-to-gray color transform (CVE-2026-1837)
- djxl: reject decoding JXL files if "packed" representation size overflows
    size_t

https://github.com/libjxl/libjxl/releases/tag/v0.11.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libjxl/{libjxl_0.11.1.bb => libjxl_0.11.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libjxl/{libjxl_0.11.1.bb => libjxl_0.11.2.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
rename to meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb
index ad5b5d169b..1157f07d84 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb
@@ -8,11 +8,11 @@ inherit cmake pkgconfig mime
 
 DEPENDS = "highway brotli"
 
-SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1 \
+SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1;tag=v${PV} \
            file://0001-cmake-Do-not-use-mrelax-all-with-clang-on-RISCV64.patch \
            "
 
-SRCREV = "794a5dcf0d54f9f0b20d288a12e87afb91d20dfc"
+SRCREV = "332feb17d17311c748445f7ee75c4fb55cc38530"
 
 EXTRA_OECMAKE = " \
 	-DCMAKE_BUILD_TYPE=Release \

