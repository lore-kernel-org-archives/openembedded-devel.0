Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E18EC7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:42 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.9142.1685521600338173903
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=lpBuFQjF;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.50, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-30a1fdde3d6so5486881f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521599; x=1688113599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylWYWcn/wdCpl1UcNfpBikrnh0OCnNahLTqXDU0X4jU=;
        b=lpBuFQjFWkGRiTf9qoy7oCHAsJepo+nQiPoUlv9cbz1uyvSdIVmnqSM1NkGCvHhKA3
         ry+xwMrPZ2Hxvvqdir+a7WXZpoXS8AohS6RLvEMyIlNGbmb6n8vZHHLWBnhMN1n88TTO
         V7e22PElRSXupIkCqWhPZS5eOdJYj7JR7JlbHcVI1Zung+YHumx/Cu072JNHLewrs9YY
         BMAeuc9AjEU4R/Gv5nQlXNxHMLOHrY0cfs82OBTryTdtKTm5GB9xQ1FDFy2P0ItTf5BU
         eEyuFOl4PZ6eEbczZMUi6uvT3dDgyyeslEj30TenKMJNwOa/788+OiSJGOaXw9zmOZro
         dG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521599; x=1688113599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylWYWcn/wdCpl1UcNfpBikrnh0OCnNahLTqXDU0X4jU=;
        b=LVhbMx30a6gKym0Fsi8vTgW4P+CAvAa7XfBIjLZtn+T55soUABBoweyT8zbK/+SNsl
         7HTV/jRj4z7cs04dzLf8vQ1IjNuTRNSKgPZ+l020BXkFDB19s/tTVOHa60fXf142Qc5k
         2fjZ00IcRd9Zd52DJDb05qlF56bO5FERZsIV4yhbZYnqrBgZSB7qEwO4EV1iKbkRMo6Z
         9Hxjxfhd/CPUi8CZsa0oGeKieS//Xjl4Jk/IcxBsOw72NxgmmD1C8ReI7xI5itmV/9lL
         y7dnX1ANJtBnYX2bYp0Rk2h9US/t1lYKEAeJqB+o0sBuTgli9b+nlEs/wbL+ultxFGp3
         IEgw==
X-Gm-Message-State: AC+VfDxqYewonRdvdYcFvzS3f+pX1JTeSbOH8LBRJ00UXSmhBX2SlKwC
	4QwTtUhcnawiD4b07lJNApZ7Ng==
X-Google-Smtp-Source: ACHHUZ5MSH9Afh63lCTL1srtMRbWwZbSoL1oW9LGYKuFUpDoIErl9fDZmQYicVoVtEijFgziLtYevQ==
X-Received: by 2002:adf:dc84:0:b0:307:9702:dfc8 with SMTP id r4-20020adfdc84000000b003079702dfc8mr3448021wrj.48.1685521598918;
        Wed, 31 May 2023 01:26:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 083/149] python3-jsonpath-rw: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:31 +0200
Message-Id: <20230531082437.10646-84-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103010

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb   | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
index b1af0f033..4cc39a286 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
@@ -8,4 +8,9 @@ SRC_URI[sha256sum] = "05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45edc89b11fa
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += " python3-decorator"
+RDEPENDS:${PN} += " \
+    python3-decorator \
+    python3-logging \
+    python3-ply \
+    python3-six \
+"
-- 
2.39.2


