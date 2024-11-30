Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231D4D7360E
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 19:03:54 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.138212.1732993433558005276
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Nov 2024 11:03:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BfIubf1I;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2142214abd2so23365585ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Nov 2024 11:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732993433; x=1733598233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DAVWAMd8l8M03D3gS/U6AhKQiDOrXFixyO7UcdINZ+4=;
        b=BfIubf1IWfMGpo7n5HOq70Xdva/4PmjKUjctNF1IOvsVt6BV65QpAdpeGyNLvNuLS1
         WEKtgLFzEGMMomUXwugaA8EIZ4IhS/AxMWz0X/XIauF8vwOSJ+1lLVh4xrUPi1a200B6
         0ASBkgvn77jXuK0cn71bRuy6Cjlk0+3RP4djUhPltBbJIERxsF1HbWDEl6MgUgoqzJcp
         dE8VPmmI1kc/FTQyzUEwZNXeF+AVjNdXVQ20q4s/xsI7vz5m3GIICcdMaYTfAB7fv3s0
         a5hYsU2AB/idDIIMcMOTDKqksGuguG9oqLVVlg3xGiyki915zwFSm4gm/bN3aR4QkW8M
         DaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732993433; x=1733598233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAVWAMd8l8M03D3gS/U6AhKQiDOrXFixyO7UcdINZ+4=;
        b=REOIgXsmyUZD7zO/ODiyp+xv6IXvhSnkYPWQs8JoEujkwCj8EzT+K+1qxFWtl1knSl
         wQI29u9LWbs8jACl9eMvDz3Pg77lHffCgeW65YmXfDLYMhB6BfUeZZgXFUJfOxZrossP
         TTTGYikfBjZB8x34tXwcmCnV1u969Mrdcory12LsLYPfQihSENczm4l9+C28x87scS4Y
         jzQvtA/6xpXNlJ6xYVprCDQhwI+EbemCdaB0I2JmHdwLOFnml7WJTfGqPWxNjK1KKVRY
         Y0QVasvoSROLbXSJsG+IpHU/pyZdDJBXjD152vPuatf76jrs0GgpyRxQkB7Mo1W7B5GA
         P8lA==
X-Gm-Message-State: AOJu0Yx5w305EaMS+tt7zWmiIkCqgkDCeRjgOvJaxf7zO/wpWVIBAgIO
	mjz+kD8iqDNkC2FQ3x3NeOxaK0XbjnIB4S5a7fjq3Mv9NYVVQXGVAGrCyKxX
X-Gm-Gg: ASbGncv8Z74hYeKTEoBQzL99pDFisFAPP3QrOQm4ecf0uGSATvY31zB2mrJLYcw+rpT
	w9OoFbz7kuLgkJvf/6O7QkW/jsXXmR/yKtPVlAZgZ2U0HwfsRjIKwwPxpX1fhm7x4v1tfRRZoki
	6PIllGiFnSR47Dx6lAEojW6lhS5JNCcmFK3LigDXTyzFsG8WlVwbsArykNf45w8ZOOGpCNvqpCX
	OAVDEx5Xkd7JqD+Ij8QHPgCnoycLoEQNQAibGTvwCQrghasOYfC
X-Google-Smtp-Source: AGHT+IEhEX1djAFcZZs5Vqci35gQ7yDijguxPYTSnpGH3+IV5H83rw3lyejdhJ+Lq4SGP8VFx/hzrQ==
X-Received: by 2002:a17:902:d2c1:b0:212:29d7:e435 with SMTP id d9443c01a7336-21501d645fdmr208670025ad.39.1732993432647;
        Sat, 30 Nov 2024 11:03:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::b650])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215218f47e4sm49250115ad.23.2024.11.30.11.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 11:03:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-m2crypto: Upgrade to 0.43.0
Date: Sat, 30 Nov 2024 11:03:50 -0800
Message-ID: <20241130190350.3367952-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Nov 2024 19:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114129

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-m2crypto_0.42.0.bb => python3-m2crypto_0.43.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-m2crypto_0.42.0.bb => python3-m2crypto_0.43.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.43.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb
rename to meta-python/recipes-devtools/python/python3-m2crypto_0.43.0.bb
index 6b178cd127..5b4e7fa845 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.43.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
-SRC_URI[sha256sum] = "42b62df2caf623161b1d643a7235464c2fe2a3105049ebc498a6d47dc08f64b4"
+SRC_URI[sha256sum] = "6c2c1c7bb0e8aa768f7ca803da7dbc2666d4003b26bd7adf70233afc59d8cf33"
 
 inherit pypi siteinfo python_setuptools_build_meta
 

