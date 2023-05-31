Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947ACC7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:51 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.9118.1685521547794259697
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=ONdgl0LZ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-30c199195f0so204113f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521546; x=1688113546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9RBCNYSLs1LPI8SKQBLXIzYMipY0L1Yklo4wzWl9Qs=;
        b=ONdgl0LZGzHVGr6WHWYj1p3sNw+Ljy7bHzWBh22Dh/KKrMqev57hJGfX02rQRXuVoL
         zG9bvKZyhoznEd9kUMzirq7uveORv9ezellFtSt8aSqMN1dsoorlkKmUYaxdwC/Ozcbe
         xpfLvnvfmuGzNsDUHX3pgasL4tGeu36MJf2iQBV7CksGq06c+7X8KGh3p2pyEYBX+CBt
         74zKz4ln4aVfOAksNqYmDZ61YBOhh1ASNoq+4hQx/GvXRO4LUJeiIOYEZ2XCvSRfCLKd
         qzyqeRq1jgGyyfMIT4AgM020JQTIpJVHHW4CCdCXPoF0UlRadD60ZgiosTJA8a6NJQ7D
         ATdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521546; x=1688113546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X9RBCNYSLs1LPI8SKQBLXIzYMipY0L1Yklo4wzWl9Qs=;
        b=AIitQBHrRQq4s9RcpS7Po4wycmUo16dv1ecPB4q1TbpEYUxfZFYqCVcdVMcYTqkTWT
         cNNdItln+BgQHYBwANCujX0jXLdGtsY6Kdf+Xx0B3SOWTUuvdPQVaJiDMLUn1zdMDK2q
         hUgw619JFqYL36j4nFRoMRyGXVphdRC5X01JpA5S4CpBAUF7btHURR5S9J4KVIoSWwZg
         mJnObli7N42ElaRdREt5BWIh3o/roB5URDgpitXvmDbSzJIUz6f8E7zh8+h5FH2PY0dM
         mSggUw5tsW5UDCLEYcBMXjVUl2ZcK/YmftHqa/3Hq1db+nBwFAatOr2NjHakhZqfrb1D
         nAXA==
X-Gm-Message-State: AC+VfDxwU6J3EXzuTUtVkF70uCPumni7TOOVgcg+zR4OTgIJoyPfhoTx
	yRbPxqFo1ypPpQLO92lOsx96gg==
X-Google-Smtp-Source: ACHHUZ6hLGo43PrxAeubePdwHo2rQN0Wj1BpiadiaU27g/GvEjyUz0vMDlYkWyRAinkDx4R/PkK3dg==
X-Received: by 2002:adf:cd8e:0:b0:30a:dfb4:e300 with SMTP id q14-20020adfcd8e000000b0030adfb4e300mr4784870wrj.28.1685521546294;
        Wed, 31 May 2023 01:25:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 037/149] python3-tornado: drop ${PN} from RDEPENDS
Date: Wed, 31 May 2023 10:22:45 +0200
Message-Id: <20230531082437.10646-38-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102964

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ptest package doesn't need to explicitly depend on the main package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-tornado_6.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
index 1535214b7..df257e5d9 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-em
                    ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
                    ${PYTHON_PN}-ctypes ${PYTHON_PN}-misc"
 
-RDEPENDS:${PN}-test += "${PN} ${PYTHON_PN}-unittest"
+RDEPENDS:${PN}-test += "${PYTHON_PN}-unittest"
 
 PACKAGES =+ "\
     ${PN}-test \
-- 
2.39.2


