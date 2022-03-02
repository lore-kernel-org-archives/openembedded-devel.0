Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13185C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 18:57:50 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.1589.1646247469563814007
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D8t+zV01;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id bd1so2346757plb.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bSL9aVMrqx5eRgaSW+ibv97Uv/xKn3Iuv4UXH7kcGAI=;
        b=D8t+zV01zGNaGggnl4mWD9RHgv4KZwZuBSqHlyoW7kNyoXuwvbwJyuj48GfFyRFQBO
         EXsA2QA8HiQjDtCIMu1BEOu3LTo5NuRhk1terWiWfiPoIAHEce5/LDJJKolKymP4Y2AU
         8Cc8MuPrQ/1qPuT74mwWWPngoqcWciyWWXxxgNWaBFz7fp4e6v2g8CUAc1oeiKc+vdsY
         My9iIBcoCMWSNM1xbE2PyW3p3hJJT/5/ySyyy7W4bsFrsbK96Lrz9xu+tPQ4M+ugvQ9s
         8XxBBiDLTmewYLlGrG7tISlW9LEEdoncGt4paMk4P5JChZT7qDA8/5cICgaQie9IpWzR
         N/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bSL9aVMrqx5eRgaSW+ibv97Uv/xKn3Iuv4UXH7kcGAI=;
        b=480b/zo6dC+9lQpgbCvup2lBkmB8b/wPRl5FtWeanTztz/U+tiWPy+xUU+1eWMRvhj
         hXbcUfQbtykIM8s1M74coXp/erQwld5HY+VYzFqt299nuJwSS9+9EQ2wd4TyTSs7N2GV
         X5U9KHGHZDz+E5H1MtKKQmANJoypG4RLg4b+YgQ6bJF4WGx2/h+2VhPbId59cyuenxd0
         EsKYgCEOYAxQhvsJxTNdKKTouK466Dn42eodF9qEgtTAT4zKFhaWYGLOt1FXCdmD2Cjr
         TTDtqM72KAUbKMRpw2LCqvrLmTqCzBzVNo9bYrDXgpmiOpAHDOliiBQ1yM7qmdlmS4CV
         YdrA==
X-Gm-Message-State: AOAM531t6lxgmoK2j8eLh+/h+P9h+6v1Rimf5UlzgLcDBXYkwl7oBz9R
	/WBuz/VB8NBsVsKYsR26oO1Wlu07a/TTJw==
X-Google-Smtp-Source: 
 ABdhPJyeoOyPu9AmqMf4qs+Np/gzaArLymRsaWBiG5B/XC2G5/uBfkgeGlaWrSbww6Y8ajzewTrHjg==
X-Received: by 2002:a17:90b:1bcd:b0:1bf:a19:f2ac with SMTP id
 oa13-20020a17090b1bcd00b001bf0a19f2acmr534122pjb.7.1646247468761;
        Wed, 02 Mar 2022 10:57:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 nn10-20020a17090b38ca00b001bc3a60b324sm5560011pjb.46.2022.03.02.10.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 10:57:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/5] python3-keras-applications: Define
 PIP_INSTALL_PACKAGE
Date: Wed,  2 Mar 2022 10:57:42 -0800
Message-Id: <20220302185746.2402043-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 18:57:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95699

Fixes build with wheel packaging

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-keras-applications_1.0.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb b/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
index 11ab8b0a5f..6c2af0d4ea 100644
--- a/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
@@ -10,6 +10,8 @@ SRCREV ?= "3b180cb10eda683dda7913ecee2e6487288d292d"
 
 inherit setuptools3
 
+PIP_INSTALL_PACKAGE = "Keras_Applications"
+
 S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native"
-- 
2.35.1


