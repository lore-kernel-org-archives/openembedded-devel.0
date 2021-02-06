Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.13053.1612650172682553327
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 14:22:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=OG3M87EO;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.195, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f195.google.com with SMTP id e18so11945358lja.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 14:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mlCueSPLbm7LfgvnoAAD8yBUrN5QhbtvJJYqwqTtEhA=;
        b=OG3M87EOmRoSturnZgz3P7dzG2ko+RhmL+3Sfd4S/WNG1teJQpVG5FXBmLooZmUCMD
         U7JVDkx2JHL7BSly5FAwYBoLVXfVRO7GYx31H2wOLMQOXt+RC1BUw2ekxh/Ccwv7whq8
         qNqMZXViKlzkPIa21WQwgTgv+Y+lc477vvQrupCIMXpdtNh3V4ALFAhYPzrkx9ZGYr/g
         6P7jdmX8Q8XmxN2UJcC3Q4eu2nzBTe5jMDXdj2cnPT8ju0sKNEgAqJOf/gdIfRtaUpXI
         5x6a6xMYSa34D8xEGRH9O/Wt0O9qHhiKx02x3nNC7pMyYsKtuIzo0EfouQxFVvxPhjdI
         UWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mlCueSPLbm7LfgvnoAAD8yBUrN5QhbtvJJYqwqTtEhA=;
        b=cNzDc24Cr1M/tUzWLPhVD/Czdx/e7hqyGEGdkahJyCrIQ8MfI3CpOg3+M081868rb0
         FKvrZLz6uVd276t026PV8o0dGAkBqkHM44KNy0l7TlRMO208fLrnqU8hPIq69SgwLKuY
         BvykWLVfHdOwgvFpn+COsrSOnBxaTYcILkc7G+m2r2NBx+vm9GeP/dS0BvDp/Ov1C2Wo
         MxHA0NA/V12DpwUcaX0J3KQmJhKQv5LULt1H7+AgMX2ykrBJavOxFf9QqksTvkoWAR8L
         CkonhvZHJ74B+0Kdttz44OvJwpctfE+syCd2SeJdMcvdCgltWqGkazFBKlP0RXwU6hnA
         hA3A==
X-Gm-Message-State: AOAM5338HaRmBAGyRuaGJ1h8UWFD9UIp7ghGmWVkXbp4OFJf4f8I4i+U
	OnhEQA3jfUWEkduFEDM4b7enO/kQS4RIxmo5
X-Google-Smtp-Source: ABdhPJznYQ+NhdMxORaUR5jIsa+R4disqt8HsBhpuJeeyIpwa8qgLiHvOmcIDFvCRhEN1kqFJXGR3Q==
X-Received: by 2002:a2e:543:: with SMTP id 64mr6552844ljf.207.1612650170306;
        Sat, 06 Feb 2021 14:22:50 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id r136sm1453962lff.247.2021.02.06.14.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 14:22:49 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] nghttp2: update to 1.43.0
Date: Sat,  6 Feb 2021 23:22:48 +0100
Message-Id: <20210206222248.4084974-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../nghttp2/{nghttp2_1.42.0.bb => nghttp2_1.43.0.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/nghttp2/{nghttp2_1.42.0.bb => nghttp2_1.43.0.bb} (90%)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.42.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
similarity index 90%
rename from meta-networking/recipes-support/nghttp2/nghttp2_1.42.0.bb
rename to meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
index d24b0b475..959cccf35 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.42.0.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
@@ -11,8 +11,7 @@ SRC_URI = "\
     https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[md5sum] = "c38f1d230af8cec480ff9dd60c9e0db0"
-SRC_URI[sha256sum] = "c5a7f09020f31247d0d1609078a75efadeccb7e5b86fc2e4389189b1b431fe63"
+SRC_URI[sha256sum] = "f7d54fa6f8aed29f695ca44612136fa2359013547394d5dffeffca9e01a26b0f"
 
 inherit cmake manpages python3native
 PACKAGECONFIG[manpages] = ""
-- 
2.25.1

