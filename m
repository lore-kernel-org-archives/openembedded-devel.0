Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2BFC001DE
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:46 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.172.1687531183007879570
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=jAz16W/E;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fa71db41b6so8195635e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531181; x=1690123181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zVwbBmRe3wqNRGrTnqdCpzPcbwgOCpznIpz7u2vYic=;
        b=jAz16W/EJsQRafC3GDycYDSGbWC8DPovPCbTFlDo4gZhPT7iq4Eg/R3g4kOcc/UsUF
         Dgi9V/b/k2JcrE71kBnkpZ3EY/ROYswucS8nsTwxWe8hESoGvkuQSfhZ/B9JWSpmabGC
         H1Wda4ACcOFVHHhm8pGcLN4h0L6lcB5d9LXylMFDQQbnz3eex/F608yFbHoNVVN03+0N
         Qxw749Oxdlj0qyjJ6FZZAU280XBxnY8KP+rWml73DgbJ7zSyJmOcCldhu4k7RBtP5jiC
         g3kx4WoAf5otPkS4yOX6f7O3bvDgHkgwdMQ4OlCCc6JPnU2ZWWNlIWVO17hVcbA0r7iK
         OoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531181; x=1690123181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zVwbBmRe3wqNRGrTnqdCpzPcbwgOCpznIpz7u2vYic=;
        b=hSOFUm0Yd38s4BxcKo1XuXAGfXDqcigAeq958S7MWy/fk8OgW2Dh8F0bb+Iy6Ohy6c
         PNCU31JKT6aPEBkIVQy3Jj/21lv07dfBolKTfGfUwPtDbkEODnex2U3ZS/JjApfVS9WS
         J7/iFTPgDobUPV+IUGMczbYe97h9ab4snLTrl9nvtdspyduHR6VaZkUPpndFALJgaMMj
         mSrQPibl77NbR3S1ySg/ygX6PDQAa4KAKr8q7YfcfoXl3Syve2HSo5OjBnXFFDR+18ao
         6sZs90AF1nZ7O6FT8lVOq7yJOz0PDute5CIVc/cLfbp5PMM7WT3M5C5Ly5Jo33WODAI1
         ZTdg==
X-Gm-Message-State: AC+VfDxTYVxgIAuKyaxjk0Zstcsu2KUHOrUHIEdByOw+lcMg0xwqyg5d
	PBoWeSOT8zIaE9jENFyNQoF6gQ==
X-Google-Smtp-Source: ACHHUZ5hHuxuK+1+vKzno8voeuJB41NkW6W06Nwo7OFEeG2d4oABXDLbyN9/+AtmZhyqH3eMyqak0A==
X-Received: by 2002:a05:600c:21c7:b0:3f9:b0ed:b71f with SMTP id x7-20020a05600c21c700b003f9b0edb71fmr3701272wmj.10.1687531181530;
        Fri, 23 Jun 2023 07:39:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 10/55] python3-path: fix coding style
Date: Fri, 23 Jun 2023 16:38:36 +0200
Message-Id: <20230623143921.146338-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103506

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Stop using PYTHON_PN and make indentation consistent.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-path_16.6.0.bb        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-path_16.6.0.bb b/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
index 479177ed7..51b6574e0 100644
--- a/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 SRC_URI[sha256sum] = "bea3816e1d54f4e33aac78d2031a0b0ed2f95e69db85b45d51f17df97071da69"
 
 SRC_URI += "\
-        file://run-ptest \
+    file://run-ptest \
 "
 
 inherit pypi python_setuptools_build_meta ptest
@@ -13,11 +13,11 @@ inherit pypi python_setuptools_build_meta ptest
 DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += " \
-        ${PYTHON_PN}-appdirs \
+    python3-appdirs \
 "
 RDEPENDS:${PN}-ptest += " \
-        ${PYTHON_PN}-pytest \
-        ${PYTHON_PN}-unittest-automake-output \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 BBCLASSEXTEND = "nativesdk native"
-- 
2.39.2


