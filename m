Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.1118.1613674068413920826
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Feb 2021 10:47:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=DFxtkq9z;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.196, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f196.google.com with SMTP id k22so7284883ljg.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Feb 2021 10:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5V3FLLbdV7gzw0aPKc+hqj4OPlXnhl6ttSb648KTGW8=;
        b=DFxtkq9z6VMU3RRUOtvfgsRRXlfjWKcTb43RiGXExSOC2ghDPbSbUV2L8zGhXQv43K
         Igzq89kWEVKA7EcRceViU76/6Rx6CznOtWSq9ul2citmfVxvIZZjZp1/QKhsd8TjHcdK
         ynaPnCHj1GLFT5d4SP+QnQ7t+8QtrL09rGgRaXq/ApNdYBlBLCeP82a8T2EM3hR3f3YH
         baozrNpf48DBYIq2oXo4GYlmrOhwSYOWMfA7imSe5Z4SK3jK+bqVR6y8kfTV//9Y2XpX
         Rl6BoL/G9m0nEmXnY4XZ4LOoaFQR44SwGuX9vssgUcqq6KzOcSKAVC2119tMBwS1E1pH
         Ib0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5V3FLLbdV7gzw0aPKc+hqj4OPlXnhl6ttSb648KTGW8=;
        b=gZlLM1B8gaeHv8bST4R+nd3BBHgZPJY8hfTuQfPkrvMP3IaYptsNt9wQn9DZGAJmE7
         8C3CbEVTpk2LSGbnsOgrQXopCANbryEBc+7/CZpIcB1z1JIceEDGkcLTODq+fde31/PP
         5BNrMYoRCNbwKo+FvtUrP8aLVdzGuG5LcnFnVX83fDY6FJNZK7d86Blh78+R+BnP7e3L
         FueXC3spvhxJZTD+titLW3PfdFO0QUKQA/T4q4jWu59YCuiBq7Gyr+GYSseannDaSSnZ
         8I3UL3VulCXeSV+V8WaYwspQM3Kh1uxSY8uctNKJL5YolVFf6f/dU0z+k5pzEkBHIckG
         kxTA==
X-Gm-Message-State: AOAM532aR3maPXzc8njtwU1+oeMGd4Hgiu7T0qOY6HA6JjWMO5UBUyQC
	d0VHNs78ICz9vM7W90lNjPMDZa7NYrbhiXs3
X-Google-Smtp-Source: ABdhPJzGaDTRYoQQC2a1l8Onj+2k6EzvR56cuJ6KLGO0f4+a5idCEYldFdQK6k/kYM5S7Uxknyeiog==
X-Received: by 2002:a05:651c:cc:: with SMTP id 12mr1816021ljr.73.1613674066115;
        Thu, 18 Feb 2021 10:47:46 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id f5sm702805ljc.8.2021.02.18.10.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 10:47:45 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] wolfssl: updae to 4.7.0
Date: Thu, 18 Feb 2021 19:47:40 +0100
Message-Id: <20210218184740.1818731-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../wolfssl/{wolfssl_4.6.0.bb => wolfssl_4.7.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_4.6.0.bb => wolfssl_4.7.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.6.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.7.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_4.6.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_4.7.0.bb
index ad7e92341..83406f507 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.6.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.7.0.bb
@@ -14,7 +14,7 @@ RPROVIDES_${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https \
 "
-SRCREV = "9c87f979a7f1d3a6d786b260653d566c1d31a1c4"
+SRCREV = "830de9a9fb99e30f9ac9caa0a7f7bba29c3b4863"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.25.1

