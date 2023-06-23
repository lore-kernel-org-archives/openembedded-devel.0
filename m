Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF3FEB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:46 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.181.1687531179454995476
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=l7j8yeGk;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f9189228bcso7995575e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531178; x=1690123178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6YOPUgYGF0B4qY3Fb2DPlWZeGZXtzHEnAbcvz7tWE0=;
        b=l7j8yeGkyIpwysaRjYMJsJ4Z5LOzwTrJOQz38Qv0NQ0CKWgeXYI5Md6aDV6eWah09g
         sHCsbdGX/OfpR3Pkc/v0saP+ML7bMDVMzPixJvMYBidtDENPJT4fn6I5GzRcmCbg0Anz
         j0VM0FhTJGrggPy9SicfFLPtnHSj/elN7v7Isf5Sb16n8yewZ25S0T3tF3GCJ3PNVkjQ
         avHXP43ehFjZQAnBxwqiWBh9NwLQH8UAURUjEypRe5XHzCaM13Xyil/uYr8xmhz08qbm
         hKugr4Dm6ykLiG37LimSlh2g4wOnGAz3H/sbWC3HKY1ZNLsKjxghXTbgQWPqriPA5wI8
         ueqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531178; x=1690123178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6YOPUgYGF0B4qY3Fb2DPlWZeGZXtzHEnAbcvz7tWE0=;
        b=D2XPUjFl0c6FhokTxMGONby1BITbnwD+k+VL4kF/UdD/bAlmLPKmoI4RCQhEGRl++d
         7fPh5/wzL8Aw1TfuBvnA1HqMexzBtI8hOsVoyrKHLi368KWt6s3Yy/G/+canzyEebKwx
         aBbgz04cg9ufefmE/E92gLUEa4drf0et6smjL+ZXzOY0mGvht+nQLmOmJxm3VBuy/sr3
         y6WI5wf5vslIvR+8IrY2bOp3eAYdUUpbEhC0mYfCNGq88jxhn7X6q6MIA4yC797rr2KE
         2RidoEY8n9NXxO8xqciQ8GgmC60lhjiYEsqO0H1eTQWfg1FwuVHBtMBZp1GNyDrm3L7I
         SHzg==
X-Gm-Message-State: AC+VfDzFFrpVUl3AuQlhtQgM3Gl7w/7oOfXpxq6PEys2TsVyd43hyK4R
	gNQvJ8CC+ufYkyA2sFH71VUV6A==
X-Google-Smtp-Source: ACHHUZ7jkP+KoS0PTJxFYAaKwxcfKr+mxdLwHkVthyWUNSLzzxEte9APhkNN+BLSFIokQ1Fos9nMyA==
X-Received: by 2002:a05:600c:2046:b0:3f9:b3c9:feed with SMTP id p6-20020a05600c204600b003f9b3c9feedmr4282324wmg.13.1687531177778;
        Fri, 23 Jun 2023 07:39:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 06/55] python3-padatious: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:32 +0200
Message-Id: <20230623143921.146338-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103502

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-padatious_0.4.8.bb    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb b/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
index 404a0170d..fef6376ef 100644
--- a/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
@@ -7,3 +7,11 @@ SRC_URI[md5sum] = "7dd2f1830737dc142aa199f77dacf32e"
 SRC_URI[sha256sum] = "e471f251b94e8cadf6e4214f0f3b7b36678848aaa8c51cd5638ab23ecb716f75"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-fann2 \
+    python3-json \
+    python3-multiprocessing \
+    python3-padaos \
+    python3-xxhash \
+"
-- 
2.39.2


