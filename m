Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AFDC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:57:43 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web08.4319.1634338662931434677
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Uarkib+P;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.51, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f51.google.com with SMTP id i24so46552278lfj.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bSve28glj3LfB3wTWxsmeJ4hD625brFSLMF56FEPqss=;
        b=Uarkib+PbDmr64890UhFQRN/ksXmenxmodSdijpADKOUSw4Ml4QRb3WHr0oZBln9tT
         swwrqQeZbMV9mlhOu7nCYrwMO35rjTj+kMXPBFRiDv+x7qwa9lxK+g+cavIAS/4d651l
         GNt+mmnXCyBRwGSfXw9mDhRzWHzrcp/PgBqIFepjSuEJsecNmemzjxqSsko61snogUhP
         kgLX1sXJat9ZmafUZwx59hSYk5aBeYgZsvfvP5ebdc6JH1F64x06tpfYyyBzewD6zHbw
         Z5SAGzNP6+eqe0BnZ3Vhf/s/nbci+x/UJUYVXM6erxXPswnnCwOXAOUeOe1DrmkJ+ADN
         Km1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bSve28glj3LfB3wTWxsmeJ4hD625brFSLMF56FEPqss=;
        b=hId5A+Hcn9tHBrn8lNkhJxUNt7Az3WbNGuMPk6HyW22vSvYP8QRjOLP0wHZ1qFcehO
         YfOhv5xVktdUhW5cGRhlungPLJxAFP0mQ2VGuA2LQ83qf3nVBCZerFdFu0ogA1fiGZAt
         +F16Jp9x7dVPX1y92ty+mLMwLANTqNHzMFcM73LtxzH5nIk9fs15+Z+yp8HG/YdaOJfQ
         CTAI8IS7s7+AZ/CnYl/y4yPAJIsa/w5WF//6hqloUZn1yc4guFK2G9Xc3AaWNj4DRV9X
         X6oGyYWi1qjU1DPhwPPn3FwH+vNuIGnkPq+OvtMR7hf12yg45Vjj1WIvc2dXlatOIFub
         Xnwg==
X-Gm-Message-State: AOAM53092rnxDMiuIFxBfGNVZJWY0O6SHqJFmJ0uR4TTN9n4QvlRUyVX
	tHfMl32hdrrtEwRn3J6sqDVN1b8bMBkaP74y
X-Google-Smtp-Source: 
 ABdhPJw5cS2PJdordGP1o2paEbCZaP5EGOMw0bc2m9pb3RESCaJOr70tEyOf/fBHpdSoX4L7pNtQCw==
X-Received: by 2002:a19:ad0c:: with SMTP id t12mr2000475lfc.173.1634338660639;
        Fri, 15 Oct 2021 15:57:40 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 b23sm656140lff.148.2021.10.15.15.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:57:40 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-haversine: update to 2.5.1
Date: Sat, 16 Oct 2021 00:57:38 +0200
Message-Id: <20211015225738.4163912-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:57:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93369

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-haversine_2.4.0.bb => python3-haversine_2.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-haversine_2.4.0.bb => python3-haversine_2.5.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.4.0.bb b/meta-python/recipes-devtools/python/python3-haversine_2.5.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-haversine_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-haversine_2.5.1.bb
index 9eda659e1..1ed67d326 100644
--- a/meta-python/recipes-devtools/python/python3-haversine_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.5.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Calculate the distance between 2 points on Earth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[sha256sum] = "6dcdee48b854b7bd0a121a04a2cb775dc7d9e2354f1e22d29ff62110189305b0"
+SRC_URI[sha256sum] = "357e41dfddc4a0f2b1c941d92a590cac840f7ce4b3da14b45b68d968b3ad7cc7"
 
 inherit pypi setuptools3
 
-- 
2.25.1


