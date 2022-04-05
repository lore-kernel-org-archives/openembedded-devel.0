Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1B9C5518D
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.3561.1649147510977452776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 01:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IHbrQPWx;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 5so21915753lfp.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 01:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d+OyXdfdWuxHtPEqqfsKa0r6hYMnzKPSCGRVH68GWws=;
        b=IHbrQPWxR2zb4XC8DU06OngU3a6ndluvhkPzRGvDMD0D4ggSQZww2fjlDhBwef3R5O
         I8fADHY+P6xr0h+KldCrWxylxDNgQdAX/sRup4jFblOeXzcMXpV7dw7bxIFnlCgm7UQA
         TSW+bSk6A8U6Bsic6D6Tb3W+jZqRSQI/hn60w1VXseWjbFJzdn1E3weKdkkzoJFZcHJQ
         Sk/fdomAEZCUg9wtI4M69ftdax4kUM8l8el/uVtU6i+XkV74t7nPOHKS6+MlG8FNpmCG
         J8nrTOopZ8MUNkSEDRHBUdGf1r3YnnGbIRnPdBsKON/C4buaRzcF76wKpL+wJ1puufiP
         RNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d+OyXdfdWuxHtPEqqfsKa0r6hYMnzKPSCGRVH68GWws=;
        b=h1UGB36yMV0ukalOL/EqhukltjYK5hTz9/D8Pa1MNpG2/qCRahW1YXpFWNxelI9hB7
         FSzn036v+/vVKQNiYf8++46hkEjFeCx28q+w6S1oTKhzEN77pZNXH5xiSgAzl7age0ZL
         tw3DxsxbXTomMPkU4NOqAthGmI3YpW4e7azjWW/fF1efHHmPci5AzwzUtRygaLAmY6TD
         zcnoPsmUXaNNM8oFSNVkjgJfKF489+0MRW0ptgaJPZcgeIKd3zse03RCx3A0TDhTIkZy
         N629CBEqj+t8ntqqZLormzsZ9Md7LfTElqTSdXTy5aZYnNPPhGFeTV847kehVUNrmJL/
         bkzQ==
X-Gm-Message-State: AOAM5312vnPuz/vafHdIFHuH5fLvhr5SzNa+iT/iHVAF2rkcP/Pi+2+J
	CgUwnU6wSnpy46pwC0MHWmvK0GsxBvQ=
X-Google-Smtp-Source: 
 ABdhPJxd5HGRN1ZllXcCguZ49s0JbbjAz8im3P2ZGr1Yeb4e0UzwW8+8f5zmULbULqA1XmWsEEnIdA==
X-Received: by 2002:a05:6512:2827:b0:44a:8de0:15ae with SMTP id
 cf39-20020a056512282700b0044a8de015aemr1879977lfb.682.1649147508394;
        Tue, 05 Apr 2022 01:31:48 -0700 (PDT)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id
 p18-20020a19f112000000b0044b04bbd7acsm679567lfh.58.2022.04.05.01.31.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 01:31:47 -0700 (PDT)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-qface: upgrade 2.0.6 -> 2.0.7
Date: Tue,  5 Apr 2022 08:31:27 +0000
Message-Id: <20220405083127.815361-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96419

Adds compatibility with jinja 3.1.1

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 .../python/{python3-qface_2.0.6.bb => python3-qface_2.0.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-qface_2.0.6.bb => python3-qface_2.0.7.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-qface_2.0.6.bb b/meta-python/recipes-devtools/python/python3-qface_2.0.7.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-qface_2.0.6.bb
rename to meta-python/recipes-devtools/python/python3-qface_2.0.7.bb
index 63453517e..c42b91fcd 100644
--- a/meta-python/recipes-devtools/python/python3-qface_2.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-qface_2.0.7.bb
@@ -2,7 +2,7 @@ SUMMARY = "A generator framework based on a common modern IDL"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eee61e10a40b0e3045ee5965bcd9a8b5"
 
-SRC_URI[sha256sum] = "87ce8ce7123ae57d91ac903c6c330a99273e7f4665a0ab88e6a17f9c98143a68"
+SRC_URI[sha256sum] = "fae48ba129c55da8445580eb711905c03911c4250761c0cd53c67e33495b0cee"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


