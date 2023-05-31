Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0363AC7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:42 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9140.1685521598458804598
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=216owHpk;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-30c2b83b2f0so90226f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521597; x=1688113597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEspHUaZRX6GCvBEwfVmWj5SR0ZAIarJdBLZuP9QiD4=;
        b=216owHpkl24oTjDzBv1Kz4jlUreD7xCtG0vsa4/WVgc/0USO18EvPWZT+fDN+c9FSO
         CTJsG4NaaClqLYzgZJj57V+ptd3vyFvR0J1pyR8xYYIyt305fD2PF9bwOHhOLiidSFfi
         RZYCOpLrc7ZqWE4Up2OTYTuJTmG7Bskl/lxZkueFWS9lHBpj+naE+IO4KpWUnALvpkqB
         zPgO4WO/QHpavz9bfhrZGhpSIN+ltArnaTEfGzU4npclpnRGglmYuYPyFyYAzVf0PICS
         eGh+wRQqmi3riJ3XqzkC46NhLGQT5Sm2BVMzCBoh+MzL2FvkkYuyzmCZPE0k0VMx2ehw
         QnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521597; x=1688113597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEspHUaZRX6GCvBEwfVmWj5SR0ZAIarJdBLZuP9QiD4=;
        b=a+GqZ/vCbwAvQc6G6pFY4Va3Rujze5/YSosmicF6NgHeeOgdchr4cAz2L/jDv9jMAH
         FP8Bcd/2dU7LIiXAfGsAayRrEHYacrykViUFTkHBSe8GDxbNccggN9SG/hL397+8OJAc
         OtGg/dIxsGWYD/xKcb9JaW1khQh6cC030/FCd8FOjN+3GyCrhYHMi3OYjGtnGQRv2103
         G3NgS8ezqkV/q1hZo6P/h2HE2Sl/PQnTItDixdwZ2b8XF9pjotjtXWrR9Bo38Knd4tJv
         QK2YRhE/Q+NFm1LQuZgYg/8tW/3MqRihUyklbROPzQbJafYypSP8xA5Nci2CEW96Ewml
         vExg==
X-Gm-Message-State: AC+VfDy5zZy54iJ3naIsD6+EYG5Ol6LzGwOngFKH4wKyeD2QYE5ibl1b
	5SZbKQI1IIRhQZape9F97I5IzMUW3MXCSwfz1io=
X-Google-Smtp-Source: ACHHUZ4zIT/yAWzZBW05e7fz7n4mskzZ/m2QuFRNKJPnBCruKLrNC0gt2usQagRRBUdaVtnES102pA==
X-Received: by 2002:a5d:6a11:0:b0:2f8:3225:2bc2 with SMTP id m17-20020a5d6a11000000b002f832252bc2mr3493930wru.41.1685521596980;
        Wed, 31 May 2023 01:26:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 081/149] python3-petact: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:29 +0200
Message-Id: <20230531082437.10646-82-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103008

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-petact_0.1.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-petact_0.1.2.bb b/meta-python/recipes-devtools/python/python3-petact_0.1.2.bb
index 58cd05e22..b7fa69ffa 100644
--- a/meta-python/recipes-devtools/python/python3-petact_0.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-petact_0.1.2.bb
@@ -7,3 +7,9 @@ SRC_URI[md5sum] = "47e9a6abc91b4022953e4007ddae9e68"
 SRC_URI[sha256sum] = "5dcb0d44f86a601e41a2def9770993cd0ea45c76d37eb3f35e3dd61aa50350e6"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-compression \
+    python3-crypt \
+    python3-io \
+"
-- 
2.39.2


