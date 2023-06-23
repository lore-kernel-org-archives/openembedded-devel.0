Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AB1EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:07 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.198.1687531197398001557
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=Rk8sfDgz;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f9189228bcso7998645e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531196; x=1690123196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cQdYCiuafvhHNhsYwUkLJy+N7hMP5FE0216On5hyXQ=;
        b=Rk8sfDgziAkBSsKbMT1Isq+Afk8xCCSvZJBNiUGlYVG7aJ5lUyQnUakiyNXrSXnZ6L
         tOnl6GLc+lHI3etAQUjL6JZK1sm+MysZ36kgSzeC0bzHXg36HHaxleqnUQkKABP1D3oq
         Sf8Q00CHo+Ko5njoT+/rRMieEVjAhb/WYYRyekL5TdTCnN+CqVXb4DrOgZurHHR83rIz
         ACya93+iJAQr3BuMC71A/4mB1VvZ5eIJP4OnbZWZCoNJRTG0pnw23llCoBqRcMPPZoX+
         71gF5VWEbMAEZCiuKjOer6HPKpD3dHCqP6cmyjITqju3lHkiV0HE6wCtjbdAJaCqCoi4
         La7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531196; x=1690123196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cQdYCiuafvhHNhsYwUkLJy+N7hMP5FE0216On5hyXQ=;
        b=iomdgpZvnGF6/TGp8ga66AbsU2+NNPt2M7/HmOVFel+6GZ64QoabKzldtPJpaZPsDf
         aNmrLV+vQ+/XoFsp1JQZWxEjXNVzLrboqXf41YcAMvIQoGb4Kr+zfBC7FEP1+0lqI1H2
         Ow7HmXrvum+F+yg9rsbN7fVIBKFRQzZsWQQvq6nqZpOM/WtEQhFiuXIpT/rhsO+LnJkq
         hmC9IWDDQQDWOEmDAF67ucMUsZNa/2uu0gUYvizMTKaTQHFB7zXyov4lN7Dw/69SQOa9
         Sfu5Wdl5UFuTRX5vmGC0xO8zR4BcW5KZ3jC+5N7IiaZ5gs1u77FQH2hdyikagzCzWFsa
         KBTw==
X-Gm-Message-State: AC+VfDxhUeN+T76fP/ezvCuDg+18UDDD7q6guK6zx40B0cNNFmf911nG
	swduc8DgxDV99MKt9EGmYQAuScFW1PR0xgkhGj4=
X-Google-Smtp-Source: ACHHUZ6/spnAAlOiMQlNvniuR8OGB9dHN005pdCxXqFmhLuLPzg1nYNFGxFh72uzd7uZsS7bx65b4Q==
X-Received: by 2002:a7b:c4ca:0:b0:3fa:8028:3863 with SMTP id g10-20020a7bc4ca000000b003fa80283863mr377558wmk.8.1687531195831;
        Fri, 23 Jun 2023 07:39:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 24/55] python3-gsocketpool: drop unneeded DEPENDS
Date: Fri, 23 Jun 2023 16:38:50 +0200
Message-Id: <20230623143921.146338-25-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103520

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This package doesn't depend on python3-gevent at build-time.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python-gsocketpool/python3-gsocketpool_0.1.6.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
index a5581c252..9ded1d4be 100644
--- a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "creates a pool of connections that can be used with gevent"
 HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
-DEPENDS += "${PYTHON_PN}-gevent"
+
 RDEPENDS:${PN} += "${PYTHON_PN}-gevent"
 
 SRC_URI[md5sum] = "49f5f292ef1b60944ae92ca426a5e550"
-- 
2.39.2


