Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E22C47077
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:24:30 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.155961.1703877862743815274
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-35fe994dab5so26478595ab.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:24:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703877861; x=1704482661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igeNbh73CvgSRFHZWPDe2adD5+HrcB8msXpTW5KBUyE=;
        b=i3J17dawhH6CGlT+m7AZsSoIjatxnhrxtaGh5FrgqGzlX8340f5+aNemcItw2xlR6M
         S/Vs7tsYHJryeDxufuwaC/woTUg2chUoJT2ocUr3bIaN/iEhdx+TvYkcAFugPGQAJ+eo
         eheVFF9dsBq16DYIdZ0kstUzqYGnhaj1iWYUINkj9GlbRTR0rNqvP7MbsXVb2+0vv0wM
         re0xeW8OYnOYzNVOyklxDdzrd0u48oo1Zp4PeAVO5ILvW4CaFvoFVgjbo2hs80gkBgBf
         3AWjmPZAItVE/EWioOiFnYfDSzMkRVgKSysBSchMQxpwh3yxVNmtIgmLxxVbCbm9WK4i
         QlEg==
X-Gm-Message-State: AOJu0Yw/zPjnL7vmPJkiVfliaORFE9FyGtSwUzfijZ7adMEUsCTW23by
	pTXmjn78ysFXY13ImsadwyP1KqheuUMs5w==
X-Google-Smtp-Source: AGHT+IGP5iu6JOpLUAm9hTWWP2gPLU7yqV2nv044uhuYKL0eeleQCPmsuePdTlNyBdAYCoFqn+I2NA==
X-Received: by 2002:a05:6e02:349f:b0:35f:eb24:6bbe with SMTP id bp31-20020a056e02349f00b0035feb246bbemr20992520ilb.41.1703877861210;
        Fri, 29 Dec 2023 11:24:21 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id cd8-20020a0566381a0800b0046ce5f7e87fsm4884599jab.136.2023.12.29.11.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:24:20 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 4/5] python3-pdm-backend: update to version 2.1.8
Date: Fri, 29 Dec 2023 19:24:06 +0000
Message-Id: <20231229192407.2736363-4-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229192407.2736363-1-derek@asterius.io>
References: <20231229192407.2736363-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107903

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ython3-pdm-backend_2.1.7.bb => python3-pdm-backend_2.1.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm-backend_2.1.7.bb => python3-pdm-backend_2.1.8.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm-backend_2.1.7.bb b/meta-python/recipes-devtools/python/python3-pdm-backend_2.1.8.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pdm-backend_2.1.7.bb
rename to meta-python/recipes-devtools/python/python3-pdm-backend_2.1.8.bb
index 679ecb0d4..f1f507243 100644
--- a/meta-python/recipes-devtools/python/python3-pdm-backend_2.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm-backend_2.1.8.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "d3b50ab6374557c1edc348135e0da5decef228ddf8c973a58e40f437cf3595ba"
+SRC_URI[sha256sum] = "2487dfbd13f69d80fb4e6a08006a3ee68272833970813047dc5fcfacdfdc0151"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


