Return-Path: <alexanderhaas.expleo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB877C433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 10:28:02 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web08.10403.1636453682086773253
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 02:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AdMK8076;
 spf=pass (domain: gmail.com, ip: 209.85.208.68,
 mailfrom: alexanderhaas.expleo@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id g14so74024424edz.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 02:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JL+KcjK2XTGXODvCLf75gyRCmP4Tp1wQEjP7GdgsXss=;
        b=AdMK8076v8g9rfvmb0F0H2o5/mIbZmz7gfFKOGwUcNfgEBIF9NSh9kRZtjAyLja7gB
         Qp+LsCAwEGRf/7h2nJwm8kWexrhPehFaxvHb0kPIn+yamPUsvtmbKcnFEkcceSDCgegE
         X5nF9LgOPSdZabz3WhdcrJpy/sfLHKSyoCBo+SQlQE3hp4KPWl50gg4j5NTMNZ1Q/YSN
         9TAmk1L4WCvEVA52dkKKn+7BNnX5zi9mnOJqUBg9jKRJxtI84i0buvxNWeMzG8j5AhHN
         x6tHZ64XuK1Q2Ywt6O4jcvTUOP9+Hi7zquZE7icEPb6lrxjCnxBGw5uYCUBys65Jp1P4
         4OYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JL+KcjK2XTGXODvCLf75gyRCmP4Tp1wQEjP7GdgsXss=;
        b=dLo4Y6bALTHLRy9fvXiZoqkxzox/BfmQPlgsHEqNKY9LQGGvTTqbZN3c96cSgjad2O
         hQrEbN7xsDNgCWNwCDwu0SZdB56ItqPZ1bjo3Ax9z6PelipIKR0BRGOG0YmkubAWReix
         xIN1gnDyfuDJFheKIDgJVE7Yx85/6oI996VosEq32o8K2VlGuZWyoc3C8plAN7m+Rk2V
         MBoLw8vpM+J3D5Y6S8n80aRs95G8n0BJBdQkzKaVeClRF/MxkfJtBLvrtqlamPwV7wGt
         QP/r9HX8FM/4RFdUvgQ8LDZj91elkgehtM6kqxgqEOPpDtMzEJbGd8ctW3+WG+6uvksz
         9k5Q==
X-Gm-Message-State: AOAM530nnaKev9fe9jtzPYPIdTzOctejpAI6n89LzLI4N4ayBUsvQPWb
	oD2XH9AXlamSk/4VAs/NHBKn4bAGy1K+HQ==
X-Google-Smtp-Source: 
 ABdhPJzm04M8yHomGrM+C6Fnm97uZVd43c2soNHz2pvoPpGexHQbRI9D7EIBmmhUyXGp+RC2635xJg==
X-Received: by 2002:a05:6402:254f:: with SMTP id
 l15mr8456385edb.296.1636453680345;
        Tue, 09 Nov 2021 02:28:00 -0800 (PST)
Received: from alex-rrp.fritz.box
 (dslb-084-063-170-065.084.063.pools.vodafone-ip.de. [84.63.170.65])
        by smtp.gmail.com with ESMTPSA id
 q8sm5014634edd.26.2021.11.09.02.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 02:27:59 -0800 (PST)
From: Alexander Haas <alexanderhaas.expleo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Haas <alexanderhaas.expleo@gmail.com>
Subject: [meta-python][dunfell][PATCH] python3-fasteners: fix RDEPENDS
Date: Tue,  9 Nov 2021 11:27:57 +0100
Message-Id: <20211109102757.16992-1-alexanderhaas.expleo@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Nov 2021 10:28:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93880

this fixes the parsing error for python3-fasteners_0.16.3 that resulted
from a colon after RDEPENDS

Signed-off-by: Alexander Haas <alexanderhaas.expleo@gmail.com>
---
 meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
index 1ba2c6f20..7ebaa4590 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "b1ab4e5adfbc28681ce44b3024421c4f567e705cc3963c732bf1cba334
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "\
+RDEPENDS_${PN} += "\
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-fcntl \
 "
-- 
2.33.1


