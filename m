Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA4DEB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:03 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.7426.1687180982581576872
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=vb92xvX8;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31129591288so1810499f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180981; x=1689772981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EF2RvzRz2bImkD1JmuSwDbzFmUGm+oyNQOWca7YVyUc=;
        b=vb92xvX8DRnHdnPAnXASfaRJq8UBgiZpQNdNC492BMLVBoDnAhTBU1n0BgqVWaoJcV
         icUMLd0XPx7PhyPOuyG0ovmRxp5wpRpLdZv0OsjbHIcZD1UOssRomxOipTM5N4wWSMOU
         wIfHlaw0/UTnUogutvDnL1AzbsAv12FiArB4ypnvxWswhOBdCgpBj0eI+gX4kmkGaCvQ
         WlW4bda1wMjfEFLdlavpaFd+U+jxIlAyJwqciPSp6OItulIaFpzHLfhLNHMUoxPfrlRO
         d0C/IO0ELE/cCIdhjFGwZ0vjjc+aqrzY0gTBUe/g3dBO7nRdjM10MWraAhedBK/OR6Aj
         59UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180981; x=1689772981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EF2RvzRz2bImkD1JmuSwDbzFmUGm+oyNQOWca7YVyUc=;
        b=Z7hH11plCH70NgOHMluv/83amTMc+ClD7Rjhq2F9hlL1fF1KWaXlMZ3YcB0Vi3K4/y
         ArClv01gjujRyclMf7njrtPdDlMxOULfRSreZd0N/e56l4G8hEzCgWEOj3HTtVEgtYgD
         s2JTNJl0b09qzoU5VlPUp6GH0Dma/zfYnH9Ym1HEWowRN2yAD8vGmh8Faf5m/bnEati9
         bhsxq6wVm+LykO5JBZcAjqP04vQjBuCyE05IwNe7YBAIoMNKn7NiDlo4+5qvl3jH7IDY
         eFKhVw8M36VjjZDrz2TePeTtcwEbu8H1wS5YjMRzlk0QVBM8XSf69g60pfzbf54mDHAg
         ibug==
X-Gm-Message-State: AC+VfDwQEMOIq1PTcO3Uiu2A4Wbg7ont4zvYLRulw32A0r4mdP6/fmyE
	WB+LkBsOh+mTIJFkpqsR/UPwjpsB+GKrCpmJRUw=
X-Google-Smtp-Source: ACHHUZ50uTyeI/iCy3+NlhT8Pht7bAS1ATWLBgm2Gg0W5lwe+i0nUA/NQ4RVUUR3ZWxU5Fw+bFN+ng==
X-Received: by 2002:a05:6000:1008:b0:311:1501:ba53 with SMTP id a8-20020a056000100800b003111501ba53mr6081371wrx.49.1687180981106;
        Mon, 19 Jun 2023 06:23:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 39/54] python3-can: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:59 +0200
Message-Id: <20230619132214.213417-40-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103423

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-can_4.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.2.1.bb b/meta-python/recipes-devtools/python/python3-can_4.2.1.bb
index f5cc31d6f..5e3d54d6f 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.2.1.bb
@@ -11,10 +11,12 @@ inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
     python3-aenum \
+    python3-asyncio \
     python3-codecs \
     python3-compression \
     python3-ctypes \
     python3-fcntl \
+    python3-json \
     python3-logging \
     python3-misc \
     python3-netserver \
-- 
2.39.2


