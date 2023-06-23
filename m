Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE430EB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:56 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.197.1687531196178206412
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=4BNTF9I9;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f9ede60140so8272055e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531194; x=1690123194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCN6+S2prOKgWJGgHO9vq378aSshuaWaBUWV06XCIfg=;
        b=4BNTF9I9NexYcP/9ulLKs5vAkdni44fdMjp491C2eSp/f45Et7+vhoFmrA+9yr22Iz
         8tw2aYl7IjXlAUXsKH/8xcLDY7RkUxfkw8LYutt4Hvgb05663mMyT2FtjUJzjZybXg1O
         68y1RKQi++MGhamHVsf5azA2oVWXXZDXFlHGnxfPyIAqJq04f+afSD4queZPLLbGu4DB
         4Ss43iHq0CLRC/23S20JbqF7G5QEuM+pXnDruF86UzwwEhwZCQ9QNMP28ANZHhSJz3XY
         IKeezTx7KOp7GGcBRfFWEaHXKtlI0EXnt3btCTaRWdw1L4ba0NSX3jCexxQER0NgeIFQ
         wQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531194; x=1690123194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCN6+S2prOKgWJGgHO9vq378aSshuaWaBUWV06XCIfg=;
        b=MWLIWbWPfOJ9C9bH5J4RPbCU9hvNrGVFIjuKFWAEmSq/Pako4nejDW2nH47gwHRvJS
         YsqPYch9EBtoihE7ZcClVlMMqIqdgminpwWZAo95SfXDUSSdSkPiHDVtqpFcdtUWfg70
         Azxs+FIecdOBfDbt5t5Rag2ohnDjs+ZxkzVs0zGw6imEFMDA1dK41vyYAcb0ZEGvQJGA
         l439knsQa0sy03K3Pz9hmuXZYAP6prML/UUay1lntY1mgjRJiajyjaJJ2b2V2GAjaFMe
         7BuePJh/nUNnGabcdRiu5CcWQHe4z1hP9w/Phhx8+FGVCRQlcbBRNwOhtR4Mwg7WEZEA
         Du9A==
X-Gm-Message-State: AC+VfDymgoii0GqIcWBWNviyvLLFHjl3y4zcehSSyvMHTp8Sr+RyhbBY
	r9EfTsmE/6grNwAal3Yd08vaRQ==
X-Google-Smtp-Source: ACHHUZ57/D7DlFGJe5KbA0Bw3IymT7OfyfrXTLrWsCc8ocHXBWXcoxdldul3ISMYlb/aXtKGOwALRw==
X-Received: by 2002:a05:600c:ad4:b0:3f9:b8b8:20e8 with SMTP id c20-20020a05600c0ad400b003f9b8b820e8mr8239649wmr.18.1687531194709;
        Fri, 23 Jun 2023 07:39:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 23/55] python3-h11: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:49 +0200
Message-Id: <20230623143921.146338-24-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103519

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-h11_0.14.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-h11_0.14.0.bb b/meta-python/recipes-devtools/python/python3-h11_0.14.0.bb
index 7bda0eae1..2bddefa3f 100644
--- a/meta-python/recipes-devtools/python/python3-h11_0.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h11_0.14.0.bb
@@ -6,3 +6,5 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f5501d19c3116f4aaeef89369f458693"
 inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "8f19fbbe99e72420ff35c00b27a34cb9937e902a8b810e2c88300c6f0a3b699d"
+
+RDEPENDS:${PN} += "python3-profile"
-- 
2.39.2


