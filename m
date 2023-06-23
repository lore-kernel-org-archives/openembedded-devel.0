Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5301BC001DB
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:27 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.211.1687531224767710453
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=Urg7a8Qy;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f9b4a71623so8079605e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531223; x=1690123223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTqldKrnj4BWJ/5Uc8Zd0h7x6Y/c2sBripdEf/biCYU=;
        b=Urg7a8Qy4684OcTVN5KW3BrChZVlC4Lqu/uYN7dwueHKmircYo7QKFbypf9EGNmnOV
         oIA0zXvaZc1lsAkRIARDg1GcdSmeibBk6G7lnMlx6fEVD+OmDpC2iUiTviJ7oumxprOt
         DQ19LdIt34XFEQ5fxX8YhiX//sN4fky9/cjXU5FVEgemjeRdwZEdvTaF1OfuOjjBPEpz
         2JNRT26cXrqT8iir153uhha61SQ+XMFUfwYxdyvlzWihLBekH3N23w3gVknE48PQD1RB
         tbaH17vh9gqyiivAfhOjfE6NHd8l87T1ILOWpGnNi9kM570pJzqQ7NG7QVQEqrbMuavP
         jWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531223; x=1690123223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTqldKrnj4BWJ/5Uc8Zd0h7x6Y/c2sBripdEf/biCYU=;
        b=YtRdgt4Ttg/x2LtQvy5suXVjFzsoFKpThimpNq6i5TycmtpMBv1tS17sdYtRgVavZ8
         RocE2dii/G4WbM04PEtD2yuljUL6QlZNhbi6g2RgKowhKREnShvwJKDaGo12BdJcxaJS
         DBL0UKvRa8JtlLluO45VZPd8mB0mXuKwtXQZKbQ+yJS0zel18KpeS7OIgq60DGZQN5rM
         Rs7StsGWkOAgje3rl0QsXLbnTwCB2z4BxbkzMzJ/8jDkb75dWnEENOGhEdX/nuo5KBKz
         e7KfC5LwyiXYPL1Plogll6TIzY+6WTd/UgohiFlwPdjWdaDKLFMADwaJqd5+GicralHG
         tMBA==
X-Gm-Message-State: AC+VfDwe5Gvo5G7Peaxe/as8wMfbwI+ZLAzXj0VfAZQt/qnCAu0CnfdJ
	rujo16l2Ez7pag8dITdOA+GmTl4mqb7KeGQ6FPA=
X-Google-Smtp-Source: ACHHUZ49Ch4jbWIQqy6YqlDCFKlTW2By4vndFmtjBk6ISeGIF00JxPpMQtW/f3o+VfPVdj62ZsHJiw==
X-Received: by 2002:a05:600c:2046:b0:3f9:b3c9:feed with SMTP id p6-20020a05600c204600b003f9b3c9feedmr4283798wmg.13.1687531223109;
        Fri, 23 Jun 2023 07:40:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 49/55] python3-dateparser: fix coding style
Date: Fri, 23 Jun 2023 16:39:15 +0200
Message-Id: <20230623143921.146338-50-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103545

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Stop using PYTHON_PN, order RDEPENDS alphabetically, fix whitespaces.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-dateparser_1.1.8.bb   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
index 67b82940b..13e8b184d 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
@@ -12,9 +12,9 @@ inherit pypi setuptools3
 CLEANBROKEN = "1"
 
 RDEPENDS:${PN} += " \
-        ${PYTHON_PN}-dateutil \
-        ${PYTHON_PN}-tzlocal \
-        ${PYTHON_PN}-ruamel-yaml \
+    python3-dateutil \
+    python3-ruamel-yaml \
+    python3-tzlocal \
 "
 
-# Ommitted ${PYTHON_PN}-convertdate, ${PYTHON_PN}-jdatetime ${PYTHON_PN}-umalqurra
+# Ommitted python3-convertdate, python3-jdatetime python3-umalqurra
-- 
2.39.2


