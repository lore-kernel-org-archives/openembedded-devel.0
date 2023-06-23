Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C37FC001E0
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:17 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.204.1687531208010961922
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=yI1EuhAA;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f918922954so8067505e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531206; x=1690123206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPY4DDQuIK3n3n/NaYItmWKimd9mYA2zdaX/E2wQjeo=;
        b=yI1EuhAAxtQCHBc2vv3jdBUxqGigRQS68n+NZFzA1DE86mq5fsndHXV92svP+THWdY
         xk/miT4ofnDk78Se2RzQofku2Q+yrEbhRjepgF8qLRzMS8Ik7lBoGsnmbsEkb8ASYURM
         crxcfBmLtnUt77FP3qmmiX6hR96V2gGW39Vc/ndklrDPVGvii5ShQ42FzpkL3PSAm/D0
         V+yrQeHm4pGYnGCSnboKupwE5Uj9TqhKpVmfuXeUZpVMw1CnN2TnzsyqkF1LwB9gu5sg
         sbTyg0+jGXqC6uIs/7I7bE6WcuAHxnkdNUwteb60tLi7QSgXJanG353D+ffqOv4SzMp8
         XauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531206; x=1690123206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPY4DDQuIK3n3n/NaYItmWKimd9mYA2zdaX/E2wQjeo=;
        b=V82IS8SXQRsRYle0pM6UVRD5kvQPSB0NyNWd2s6ww7Dn4hvkTykXCjqh+rQNXy6v2j
         3r9Zfg9cQM462WqyZNdz/NlmrSXXF59zasU/tJG7XbPpZet70vBLhw+bdoyMLlcfXxFv
         PQzhlSiAmkYr9lvzWt7ahGANTzASSv+fAjkqFE61Oam6ABrfZaCegd/PEkLkUhVJ2eZG
         wJ8G0GCctNZcPWBrHDFA6to5wtXU78CjWncgmV1mlhLjQ8orQvkPss6rta+mySUIPo20
         ffKKpJvjeGhcj5kljx+yGDrjWAwv1QrZP2tGvQPIul0aFdDllwN1Jp7xmM28Dk9w/mpJ
         rSRg==
X-Gm-Message-State: AC+VfDz+iqzgYaxiTOlJlNLcwb0YLIbT7iZScvBOfRudOW62RjL9ipHx
	skwPZynGm42l/UZz8dK953zuAA==
X-Google-Smtp-Source: ACHHUZ5nIjM9w8Vramqz+ovTwb4yCcBVhqUiqlkcjHr5sr7kVbEPCQ+AX+RB7bx9CQ9l/nhQIMtCKQ==
X-Received: by 2002:a7b:cc8d:0:b0:3f6:389:73b1 with SMTP id p13-20020a7bcc8d000000b003f6038973b1mr15307105wma.6.1687531206523;
        Fri, 23 Jun 2023 07:40:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 34/55] python3-aspectlib: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:00 +0200
Message-Id: <20230623143921.146338-35-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103530

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-aspectlib_2.0.0.bb       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb b/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
index d2b0864ca..134151328 100644
--- a/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
@@ -27,6 +27,9 @@ RDEPENDS:${PN}-ptest += "\
     python3-unittest-automake-output \
 "
 
-RDEPENDS:${PN} += "python3-core python3-fields"
+RDEPENDS:${PN} += " \
+    python3-fields \
+    python3-logging \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


