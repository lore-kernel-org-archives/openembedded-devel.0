Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EE9C352A7
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.21902.1649623239230603794
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=ukbP1m6I;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.41, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f41.google.com with SMTP id bq30so10609302lfb.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lttZik7Gog+Dc25jep6R0WLDN/aPOjNJehMXj9t71sg=;
        b=ukbP1m6IgUW/PNjyVIIC6YmrfDgOHM67LCgmz3uxOwQhlOFibxFnyMzLE11I8hHYvC
         mTnYlObJrdlHrSJ/6CPPI6124dClHESA5nbcaoF8s00iUs7U50upIGWsXrMiIgPJHk+7
         Op8TYqHEz4QjrDwm9StbQwEuz+rbnh3cCsc7ycH6+a/Qy3bIExtGz/xFJFFn3gY7BNOi
         41vYDpALm8THsZvPyF7AS+M7PIjqY4kk1PWbsi9j+zEXEZhZ5BRjJ2pnrid7+Gld4d17
         sAVKL6oiheocdofHVEoLW/jkKpsJRoiHw+NfssqhTrLyNNB68ViQebpYxP/sfI4OznBm
         29EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lttZik7Gog+Dc25jep6R0WLDN/aPOjNJehMXj9t71sg=;
        b=mxC/l4Y2iQvbJGhRKCj9MAwWIURb4imlZEIo/YPMUi+zRkEuxFkDPDprBg1lCNb5lb
         SpSo4FHeWIwQH539SoI9iYsMW7f/YnE7ePLbNfQm24lFs0+fnoLbBthkSa9j6+qEbjmG
         137d2fjNxQZoWCULYrbeci9SKuacVQel1zFKoplFHwhunmKL0q3cPp2+whbXKwmKyaPV
         VZHVk/SDwgFfyqVDJBpVDQs3aLfs4D3+vZ0da1mBNdUo0YrvTyULgKJfeedHgNijuBJL
         GRutcPT/eImrUg5QB51toTXwTIZCt2s4NpAuQ/pWtvjM5VXjRU5QCuEQNdw9fx66s3lS
         92qw==
X-Gm-Message-State: AOAM530IW8FLLEB9QLq2yV8dl+vRUuejPblDdfPcokO8ENDZwEVsJLXC
	59aurmEqZ5wnybyugRtWniYW9a0De19WE/Xb
X-Google-Smtp-Source: 
 ABdhPJxEStOZdanCwkml9Jo3uSvQ72Zq9OQzxkBvWCDADaU5A3FzjR3vEKAZl60/5kLqCgR4nvxUjw==
X-Received: by 2002:a05:6512:1082:b0:44a:a6be:90b with SMTP id
 j2-20020a056512108200b0044aa6be090bmr19969956lfg.45.1649623237182;
        Sun, 10 Apr 2022 13:40:37 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 f15-20020a19380f000000b0046baa2ef42dsm18841lfa.90.2022.04.10.13.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:40:36 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-xmlschema: update to 1.10.0
Date: Sun, 10 Apr 2022 22:40:34 +0200
Message-Id: <20220410204034.4043492-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96510

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-xmlschema_1.8.0.bb => python3-xmlschema_1.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.8.0.bb => python3-xmlschema_1.10.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.8.0.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.10.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.10.0.bb
index d720dd334..84050dc32 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "fa4e22a708f08d15f605c9191e2500149ba1a848fff7fa4904c2f2c57dc1087f"
+SRC_URI[sha256sum] = "be1eedce6a4b911fd3a7f4060d0811951820a13410e61f0454b30e9f4e7cf197"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.25.1


