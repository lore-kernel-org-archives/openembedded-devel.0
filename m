Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B63C48BC4
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 13:26:00 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.18646.1708089960155667591
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 05:26:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fCVhGU58;
 spf=pass (domain: linaro.org, ip: 209.85.128.53, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-411e5f21c0bso16743495e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 05:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708089958; x=1708694758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V9KkkTWSF6WU2KOFRRtr84crUXuy69eXQuLhxPDIy00=;
        b=fCVhGU58pbtPK9iZzqAqEQQxiUnTCxkG/3bPan4tubewZCagldh0/84L8wRvjJJrPx
         tfhxPvBQcd0hRqtEpATIUV1cDE01OpjL7kiZ1Okgdgz44wc1uqAD+ZfQuMkrnt52Focb
         seMDrW5AaofM/emNgKm/+XkD4w5PZE9nMPrxEkRcCemGwICOsLDCZX/njYc8c7qVs4VQ
         bEcL0bunQeCMmM51dkw2vqPX1yKCGgJSgqzd8vMKM98SYgICJ/FKYPsa5iB3zUgTREqC
         xAe/2Jjw6jfmIe2l8MdtjX7jO39qk6zbNBqi0X044xj8K1vRVUQHHApJrj+qAQXek5x/
         DyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708089958; x=1708694758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9KkkTWSF6WU2KOFRRtr84crUXuy69eXQuLhxPDIy00=;
        b=kvmBHURiBBHeDrLAqFg1+DIf3sWoiS9zVJpNaGo5eiaMdz2jHHkmL24r+SBfhewDC2
         ush8D6jt4Dtb6a5pHqPGPVnJSd9CLatedwdV2RB/0Xnm2+PWMgstw5bZan9RV1MRsnzD
         E0WJ6w6UdhDRIpISzy3EKBBwrVNRbtliw3N4HoNKetNNJMTD/vjzunTtxghqcIVBYQ6e
         OM2t5r4APCCSI6nBSFxUCboaFjAtEoA7AMOA5m5fGzvQ1icEyoenvrhw8Y/+5SLp9llP
         O6ekLS93mNjz6u2FVmtXw5G1F6/rcvkCuvHJZnR2lzm/HJk31xLtuBMyJSsHClYMngC3
         rxHA==
X-Gm-Message-State: AOJu0YxXRPe6oQLScswXSW/T2hF0Av9IIgb1IXN0GC5t6c+YSshc65qO
	LHd8x510Ky8Z705qnzUPi7DOuLty8+826NOaTozbtXl8jrtlN/6n39fR6EuaMk0QklaF2JYBakV
	O2gM=
X-Google-Smtp-Source: AGHT+IE5dPq+k8ajHQuYWCYGx4p9iHOEPnr0J2ORs7nId07AjdktSdzTOg8/i0cN6NOFOt3N8TwOqg==
X-Received: by 2002:a5d:644b:0:b0:33c:e392:14c3 with SMTP id d11-20020a5d644b000000b0033ce39214c3mr3425018wrw.47.1708089957814;
        Fri, 16 Feb 2024 05:25:57 -0800 (PST)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id k1-20020adfe3c1000000b0033afc81fc00sm2213269wrm.41.2024.02.16.05.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 05:25:57 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-python][nanbield][PATCH] python3-django: upgrade from 4.2.3 to 4.2.10
Date: Fri, 16 Feb 2024 14:25:55 +0100
Message-ID: <20240216132555.2754074-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 13:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108763

Upgrade to the latest 4.x LTS release.

Fixes CVEs:
CVE-2024-24680: Potential denial-of-service in intcomma template filter
CVE-2023-43665: Denial-of-service possibility in django.utils.text.Truncator
CVE-2023-41164: Potential denial of service vulnerability in django.utils.encoding.uri_to_iri()

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../{python3-django_4.2.3.bb => python3-django_4.2.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.3.bb => python3-django_4.2.10.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.3.bb b/meta-python/recipes-devtools/python/python3-django_4.2.10.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.2.3.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.10.bb
index 4e3192744e..a25ebc4b11 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.10.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "45a747e1c5b3d6df1b141b1481e193b033fd1fdbda3ff52677dc81afdaacbaed"
+SRC_URI[sha256sum] = "b1260ed381b10a11753c73444408e19869f3241fc45c985cd55a30177c789d13"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.43.0


