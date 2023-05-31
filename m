Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E663AC7EE3A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:11 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.9119.1685521551547921937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=VE8ruRlW;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3078a3f3b5fso5426987f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521563; x=1688113563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Gy24mLQ9MOrK8LiIOxKLu9i7CreY7uKmylQMpuueYM=;
        b=VE8ruRlWiSDwlF9nXvdsW9Mw+2DLueFT9VIUrAONoYODlIFfAgdLacfOPk0eBT3twA
         Uc/YRaNVULU7ev5oUY6BZsCPnQyHwUyEGjQRYjsSQ1Pye7F74VcB54R4hoOlFDzxYswZ
         L1+tGn2DXUHhEsDfr6MWEmFtpSsZlZe0gl5f5A2Y8iA5uvir1XA5PLMwFwRu+uqJREwH
         tSFSw3mzaP7njUrjl7/xE0RAkFuPX5UKz/WtPQzIkE/uZqTN6/uJkn2A7C3/7H0YwT7d
         zY9ZL5NERYTEXFOhB9oOXHYeU84MKg/i6u8eiWDMJy7pWs+xs/efBGQ9ghaEZ0B13+X9
         Shcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521563; x=1688113563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Gy24mLQ9MOrK8LiIOxKLu9i7CreY7uKmylQMpuueYM=;
        b=WsvB9qZrzNYtDv8xXJ00A+RyntfNBHv+gWkzg88D66KL4LvBQi4JqbfZc95a62g5EY
         Pdg1D6fClqPH3HQ2eGQ9q8ZK/mTGpIQznQ9r/NEHnzM0RxyBkABrRFaSKEH5BR6h0JV/
         qNM3KpA+P0TR++Ef6SpnRjbAzhFZShtZuVelBWfBk61bbPxilT4e2lnTb4kYhb0JOze7
         H2u0Czs1X3M9NirYYb5c8560GewH494ABiQUHHqUcsF+VgVskuKPEYKllF/+wtiU3GxC
         2vfALLvSpjGWWjrRLOH2NYTAhIbzhZVD9Nc/l/Aq3IfuqSbviUBdG1IWtqdny/LwmKCt
         xF6g==
X-Gm-Message-State: AC+VfDyguglP7zZ5bvHXcXg4wspVu3MSQalKCaBT67mLruULssZgnqdU
	FoYXcQd9ijYu2GT/lx/UgGiHktDbP1evxKi1jsk=
X-Google-Smtp-Source: ACHHUZ4zux79ornxx6Wr6FL6ZqyfUy8SY7dHf2NAb5uBZhIlKWlhrzvMyFMKq9OnDpqMlr4M3Qf/ug==
X-Received: by 2002:a5d:4f8b:0:b0:30a:a715:66c8 with SMTP id d11-20020a5d4f8b000000b0030aa71566c8mr3812358wru.8.1685521563553;
        Wed, 31 May 2023 01:26:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 052/149] python3-process-tests: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:00 +0200
Message-Id: <20230531082437.10646-53-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102979

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-process-tests_2.1.2.bb  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-process-tests_2.1.2.bb b/meta-python/recipes-devtools/python/python3-process-tests_2.1.2.bb
index 24ab0399f..eb01504f6 100644
--- a/meta-python/recipes-devtools/python/python3-process-tests_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-process-tests_2.1.2.bb
@@ -13,3 +13,9 @@ inherit pypi setuptools3
 RDEPENDS:${PN} += "python3-core"
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += " \
+    python3-io \
+    python3-logging \
+    python3-unittest \
+"
-- 
2.39.2


