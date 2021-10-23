Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64058C433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 20:36:17 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web09.11225.1635021376529060559
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=ovW9iuBp;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.170, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f170.google.com with SMTP id n7so1500358ljp.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FFuWYRJ+NzqO2SyC4hLex2gxwK8YDxM+XyB+oa3W2f4=;
        b=ovW9iuBpW1M89jpLB6p/+h5nYLgbZUJ+4XkvWT2LW1/UHjFA3RljQsFofHUSc2DDfH
         Nd30EhYWyjZP8VyO8yNBGoocGN/L9Z6PhOvUAjey9a4azbmYna6w5l1D3krmtuFguRwW
         P6hGEK1D1/yvNMke2DrA0i/03RHla9xObKJQ5q7Llh8EQYsFO8g2t8oSo8072CgH0YKl
         R3ST9a12K0kEe1VaVmitC/TOc9OIHZne5d5X7H2Z97MylL6WB5wTMaoOBiRh/ei7Jaku
         kCp0xjHv9NCp1OcbA9NLtg1N5f8PB0cIo7HIS63xA6XPm9CUgWqmonMUtIm/pixgj7Xo
         sZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FFuWYRJ+NzqO2SyC4hLex2gxwK8YDxM+XyB+oa3W2f4=;
        b=dakQ639Zm+YXVM2yNiaRSvQ0jD1IXmkULsxkw/Lsvl2UlMULHjotQrQ80gI3szkr9J
         0V5y/Xi/Ts8nMinfRYUjZ5KlXeFjYT/Q7PfEVWflHpxve+wiB9jmC3X0OphOnav3KSwV
         nPxIYZA7BjoD5YrnUo7LgBYaikyqSmfAtYmr5FU9RAxyGLT/14l8g5aIq51dn2dqSwGj
         hsRAOW/U7228KJF1/ck4sJgGXTz5l+kn+tpOMmkDb3ydnOirqQszkJmmFKr/qvzblPDg
         /VMc20fktpHasrTzs00VLJvO9ob8Ieu7m+V4Bu0fjaPwBtRwdriF9e0qwYi5xf6nHUJl
         XvUA==
X-Gm-Message-State: AOAM531JJ7Sz0LVYDVltmZrZxz/xn4PjosTamxWZ8fzLOFO3PRrgLXEZ
	dHehqKDC8OSMjQyrkJ9Jbew2451549Wdo27L
X-Google-Smtp-Source: 
 ABdhPJzhuj/y/eSnfp+y69N4AGrkTnsowa1hkI6/bl5lShLMj47bFmDhiWAT9B4KmeQrlO6nKCFGMw==
X-Received: by 2002:a2e:b553:: with SMTP id a19mr8376131ljn.235.1635021374479;
        Sat, 23 Oct 2021 13:36:14 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 b39sm1268698lfv.200.2021.10.23.13.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 13:36:14 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-python] python3-tzlocal: update to 4.0.1
Date: Sat, 23 Oct 2021 22:36:12 +0200
Message-Id: <20211023203612.1656630-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Oct 2021 20:36:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93547

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-tzlocal_3.0.bb => python3-tzlocal_4.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_3.0.bb => python3-tzlocal_4.0.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_3.0.bb b/meta-python/recipes-devtools/python/python3-tzlocal_4.0.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-tzlocal_3.0.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_4.0.1.bb
index a9d372ee9..f8339bb2e 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_4.0.1.bb
@@ -3,6 +3,6 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
 
-SRC_URI[sha256sum] = "f4e6e36db50499e0d92f79b67361041f048e2609d166e93456b50746dc4aef12"
+SRC_URI[sha256sum] = "8560aabba61b5d2a5e1697bb781f682e6eaa3ce386cee85a09a458cc0003f836"
 
 inherit pypi setuptools3
-- 
2.25.1


