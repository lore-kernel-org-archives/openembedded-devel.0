Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55470C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 13:18:39 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.7350.1652966314666145659
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 06:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=49METEqW;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id j24so7168407wrb.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 06:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zw87+QJk/CqoRVBT36RtgIF3MVDBVB8DD/COcPNr6Ic=;
        b=49METEqWut2DXYBuPd0wkzas074rw1RJ2mLjgrqJu2ReLABX/33iaGlGh5Ymt9PqCd
         zIzWz0gYKvn5fPamX/1tL1RhJfiLJ6PAyf95zhP9+D8nyaK12SRgivJOayO27/vm4tst
         /yX4QMSDj1a4v+e+akhrbuVGz+sH8xD4ord98Rv4crCF7LOvzqxwzbZZyf2Z9MKhuE+u
         NFvvzmGrnruNPJdQIuKz4b1ffTUcRdsSSODl4oCP8LosV4F63QVfZP5ROht2vgJCJSS9
         hBDCM1s0K+EfaXgpvqyH2WUuyLMYZ76Y0TBxCx3u1JdBKek3vHEKAAu/fCINs2D7Foqi
         NKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zw87+QJk/CqoRVBT36RtgIF3MVDBVB8DD/COcPNr6Ic=;
        b=StSerpvwKafYOgSSRaak3M376wncf+ot8vGtAuV7m/RKGnMIQUvm75m865AqFNeEWB
         AnDN/MpONWoqMTq44uzWm27LqfLniU1Zs+WGp7HDwFgdi8tBjrPee/I7lnJ5Vis8EUax
         ugH3sydQdjYI1A8+jzp+WlaYYzL6hP9Rqrml70uN5X0UFLwW5L7KO7C3mIEORjiToLJX
         GKSh6RL4L930aorgcWu0n7Kww6QNY490cocBoYxSGPmaT3ra/rCcz41m+p5qjlmaL2Rd
         Iybpq402d8I3IM3GNXxM+7IpYu8u5Ll1e2sMouKsqWnK7yoBY6dXkpL0RSUtSlj/t6oj
         ZWQw==
X-Gm-Message-State: AOAM532Z4wc4l/APGoBt6s6ZchH8FlKh8me0j97VdAIWrAjs4eE+nqbp
	DDSPghpwDsGdu+ximl/6eY9WuQ==
X-Google-Smtp-Source: 
 ABdhPJyclj7rGDoJgEQRnpSQ4QzsqL1yimjePbeu6Dm+BMXBLlF401u7Wy7QzhtsN3oegWBDOxtVDw==
X-Received: by 2002:adf:f152:0:b0:20d:740:beba with SMTP id
 y18-20020adff152000000b0020d0740bebamr4125775wro.512.1652966313047;
        Thu, 19 May 2022 06:18:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ca58:bf7f:d73d:ba32])
        by smtp.gmail.com with ESMTPSA id
 m4-20020adfa3c4000000b0020e6c51f070sm1672125wrb.112.2022.05.19.06.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 06:18:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 1/2] python3-speedtest-cli: fix RDEPENDS
Date: Thu, 19 May 2022 15:18:26 +0200
Message-Id: <20220519131827.166725-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 13:18:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97195

There are packages missing in RDEPENDS needed to run speedtest-cli. Add
them and use += for the assignment as we don't know what inherited
classes may have added.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../recipes-devtools/python/python3-speedtest-cli_2.1.3.bb  | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
index 06d98cbe1..472113b05 100644
--- a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
@@ -7,4 +7,8 @@ SRC_URI[sha256sum] = "5e2773233cedb5fa3d8120eb7f97bcc4974b5221b254d33ff16e2f1d41
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "${PYTHON_PN}-misc"
+RDEPENDS:${PN} += " \
+    python3-misc \
+    python3-threading \
+    python3-xml \
+"
-- 
2.34.1


