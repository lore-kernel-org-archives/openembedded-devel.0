Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7105EB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:43 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.7369.1687180959121939346
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=zn0IsGAD;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-311183ef595so3168068f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180957; x=1689772957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boAn4x11Bv91LZld2uutA6ZomADCjCpZ2huAyCKutx4=;
        b=zn0IsGADVjhGebPvRAN4b6KQOqLQREqyJOZyTc5Zaj3tfEbTUtjyh9W0YHDGw32Ekd
         5yj/b5rVmK4a2KceHpPVVazl/3z9MLs5jIH9nb4KMNd+b5dcfUyFhxdciF7xCST4j6Ls
         SJd3umgzb6tU2kz2QWnpTOzdvMPViPPQWhmYsRUFnLdtFaXC+HgG5M2dH6Hc2blFWXLl
         Nc4Pmv86c76D4KP1vbB/Df20QIF4dgkUSpbWKJn+ZoliwCW40jVVZIlTShQIlIQ6Cesf
         xlRp9HTvzpgBA65NpiK0LSWzeASnAvSmo8U5VA0C5sFm7oUU+oDb568O9xKTaaYYTZ++
         8Efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180957; x=1689772957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boAn4x11Bv91LZld2uutA6ZomADCjCpZ2huAyCKutx4=;
        b=LQkWYFxuKdYPaaoTLNzmeTwGInmq9z7nNl2T4H/hIDDdDkFrv/nlbeZHwJbnFXmoEh
         PuUW1HJK/5tJpEi/yEAToeZl4EVX+7POvp2SZzgEEd0ors+osUbQrEnjL5xhV/jIg5Rd
         PiWjW20VmNegsjujB/nhXqknEVzVj1TqoSihwQYReA0dcArHOJgjcp2RpST/slhzxMY8
         1+cFwBwk14EI9UEBKee8MTfw50u9V9tnA+V07rBjY6VHHletkI2fWSiwsBGnqiPlNMUN
         PIMmIBH4hY/miQkgKhgW4eorkIDuqpA/lmZpHziNtr7/38mY1bak6LRLoGe097uegNWb
         ak7w==
X-Gm-Message-State: AC+VfDyQ1UB88HAH+OvN0Q0nrL9nZ/su9eIrLLsSw543LnAmiSRiZCCx
	f3qKY1ZPWKnmP0NfMnV+jShYu6ByOX174Uxdvjs=
X-Google-Smtp-Source: ACHHUZ5EnKdB6ttE22m1xk7049WPL/BTVnPRlGzrXLkIJVPyKnNhwuWz75+pvAaFLJG5O9e8Vc1uSw==
X-Received: by 2002:a5d:4fc9:0:b0:30f:bcfd:ff9e with SMTP id h9-20020a5d4fc9000000b0030fbcfdff9emr7054710wrw.12.1687180957663;
        Mon, 19 Jun 2023 06:22:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 17/54] python3-isort: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:37 +0200
Message-Id: <20230619132214.213417-18-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103401

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-isort_5.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb b/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
index 03d7a529c..d111393ea 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
@@ -9,8 +9,10 @@ SRC_URI[sha256sum] = "8bef7dde241278824a6d83f44a544709b065191b95b6e50894bdc722fc
 inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += " \
+    python3-compression \
     python3-datetime \
     python3-difflib \
+    python3-email \
     python3-numbers \
     python3-pprint \
     python3-profile \
-- 
2.39.2


