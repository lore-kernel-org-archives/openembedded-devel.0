Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39172C00528
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:07 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.186.1687531198341775129
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=P8nH2OPN;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fa798cf204so10526305e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531197; x=1690123197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lz+LS9bQs/cnmhjSqEYJOvjUWu2hcbzfYk323FgOWkU=;
        b=P8nH2OPNR5zEQZcYShYlZGZfK4vbMpbbcOy5eWZh93nnRwD/nrZyGFGoPPlXcgWybp
         dUAj36i+mLEmE8FBICHSBoqH3HZRlsxNe3hJobI1DPK4ZXvzbVcaRUxv/vW8ho2uxmZ1
         1in1U3Hk/HNWyysmpR3q+6iVVgNCMeAg8Qd0n/+bItemv0jzWiaQZW81BK7Qbbd4l+9t
         bnAhfLWxWnlSSD0bx6h+MbA+lcFaehYJZmHHPYSFOoeFacJxKGHRTt504x3WSD1ZeckE
         SPsPPViqeVbCzCHT43RgHLHFFhGBo6FVUBTqUlDPd4o5uvmVL0rVSOdscRB7xr1kiWoB
         yDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531197; x=1690123197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lz+LS9bQs/cnmhjSqEYJOvjUWu2hcbzfYk323FgOWkU=;
        b=dYXGrYL9K7h7cstxcLMRYPWJPj0s0I18u3FzgsNBj7r90P1KSj8U5fI2yLR4CTCPtH
         pX9ej4iY+t2eixtCg2lxynKW1USlJQFYZd4qGJBPdUFUsd7N+HAWn1KseJaUXqXCwj54
         hDa4xL0Olv1PnZcZ6dTBbpZyY+365/U3DWaMrfv59YQUMGPa3zhEnWoX/MaC/YFRKQVZ
         PB/tppZA7/e/DfRyikbZJ32q0Da6FWmqP7FE+5szqwqQpWKu3GXLWZWOr2cFhU9hwrd8
         l9AWzomgbjfbbwzbHmXOWzYvhrewvYyKRDi9nPwPnYwty/oWdRZ4TMFi6F1ugFX6ZHsR
         aiyA==
X-Gm-Message-State: AC+VfDwt0Vdh+xKLul+oWTnLM3zZQGLy60B/Rpye7BC3/6NIus8sZywA
	OujRnr02yG+fvla9aNVF4IDIRQ==
X-Google-Smtp-Source: ACHHUZ6DnyW87JSfmTTgeYR2fkd2rXlzRBDoPkGLdInWp1bQc5tYgr1crNee6hQ2LgDMMUj8VzCmRA==
X-Received: by 2002:a1c:4b08:0:b0:3f9:c2f6:344 with SMTP id y8-20020a1c4b08000000b003f9c2f60344mr7976944wma.16.1687531196905;
        Fri, 23 Jun 2023 07:39:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 25/55] python3-gsocketpool: stop using PYTHON_PN
Date: Fri, 23 Jun 2023 16:38:51 +0200
Message-Id: <20230623143921.146338-26-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103521

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2 so use python3 explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python-gsocketpool/python3-gsocketpool_0.1.6.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
index 9ded1d4be..ee0ffacbd 100644
--- a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-gevent"
+RDEPENDS:${PN} += "python3-gevent"
 
 SRC_URI[md5sum] = "49f5f292ef1b60944ae92ca426a5e550"
 SRC_URI[sha256sum] = "f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c14cb14"
-- 
2.39.2


