Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76BCEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:36 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.178.1687531174392648957
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=xjOWJYnh;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f9c532f9e3so9130425e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531173; x=1690123173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UM0xLwnHeLPVmNWSMTeDrJ7teywnPS6ruC26a/aJbJc=;
        b=xjOWJYnhFUbDgJvOv3OiCRwUZXrIPE/ZVgmmX67xHl2ufZOslb+YH44oZ+5ClQYpmM
         M7RCNGSBlGXGxVAnviM17JLPrB1NjD1L2QNwfU9Dnj50sQHcsD9RHBHggZFenUK4Eqdv
         /qUOqky9qLzQfW9dTFSbOgQOshHDkPu7hLGP+FvVxScgVTulNGtnzC4vcm6FycVtETl4
         ux6SByBKvL7bG0CTTwCpbU9G3DJYcJaJY27JIHCKghIYsxmOqNNFO9kOldLrZkJicU58
         3nBaeGFVUhh1xgNdCPtEr49xYMbyWJvDLOeT2BE3VorXOlThj/KNaHnhcDT4xmdmxQ5u
         c1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531173; x=1690123173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM0xLwnHeLPVmNWSMTeDrJ7teywnPS6ruC26a/aJbJc=;
        b=AmcyWo+ehrkYDL/inQWNjb6ZD/tdi9yG73U+22CXKFQOB9pNFj2t5Z1/2Py+QauJ32
         Rd1yJtPaD9IjMOqOCDuaT8P6GoXJPPjXHrhJSerXgAbUHqM4/IwcvbaIc2NfFmc61A/3
         UWgbdooSJZ2MCH97Be1TkF4P2SPGuyvrK20yp+u2rJGtbhy7ytJK//uaSHGt+8OI9VB2
         REbcJ2v+4d99FrRtri5FIpogjCy+IQb4GANAL5pbMh44L/Rl8isbcMxxENPMe914d2v8
         QSEFeNbn3x/6v50d8/zHiWy/q+z0ONM2/AObyIXkDJZxNY8FUQUPgMWqPo2IR8t9MK/5
         pfcg==
X-Gm-Message-State: AC+VfDy3biJcR3jM3nwy6vBlfOEwPV/+uWMtL+PgnysIbFvnvqSBIU0L
	6LQy508LYVh/9JFh4BnkS9MqLg==
X-Google-Smtp-Source: ACHHUZ6q/zCzH/ggE3sOIB4/9yJFEUHPmqFLcBf7wSh4s1f8H/SkLCP//zkYzT9xTRD/JbbxP00MXA==
X-Received: by 2002:a7b:c3d5:0:b0:3fa:70e6:65f0 with SMTP id t21-20020a7bc3d5000000b003fa70e665f0mr4255619wmj.29.1687531172695;
        Fri, 23 Jun 2023 07:39:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 01/55] python3-pywbemtools: remove build-time dependencies
Date: Fri, 23 Jun 2023 16:38:27 +0200
Message-Id: <20230623143921.146338-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103497

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

None of these are required at build-time. Remove them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../pywbemtools/python3-pywbemtools_1.2.0.bb               | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.0.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.0.bb
index 5a56d0056..ab631b256 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.0.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.0.bb
@@ -8,13 +8,6 @@ SRC_URI[sha256sum] = "921fb57ea2ae3ae2806e18895bb0457697f27221b345c8b05afa4cb304
 
 inherit pypi setuptools3
 
-DEPENDS += " \
-    ${PYTHON_PN}-pyyaml-native \
-    ${PYTHON_PN}-pywbem-native \
-    ${PYTHON_PN}-six-native \
-    ${PYTHON_PN}-click-native \
-"
-
 RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-ply \
     ${PYTHON_PN}-pyyaml \
-- 
2.39.2


