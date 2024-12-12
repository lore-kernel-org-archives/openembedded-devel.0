Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70624E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 20:48:18 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.1383.1734036493345487173
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 12:48:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-71e2851de95so315006a34.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 12:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734036492; x=1734641292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv2kiTHjXu9T5Udj9YnVK+a9cXgGEaH2098rP41ZNGk=;
        b=ZY9DHJf97iRghl5P4pn1xZQevi7/E4qu8ifw/12twoXxSOrVHVrnUn9OQ8dbNnPCRL
         /kJKYXWBBKkf3f0d6EyWahzQ+g3oIjAc9MxpFrHyWe87ou4dLHU1xbK7YPjK2PODVZSQ
         N6OihzSaKOKLHV3m5CmHuYcyGEg4Y+YSawUM6Q6+CsfZZkqeClOlYqnjAxCIVWoUn7e8
         xjjWWn7NkRoAQoSKY3bzHVwr/szPWgtzAd88hDRKxeQriITdjaG+YQlBnF5nQS8dVmh0
         +pDskwxHi+kek208B+uYbutCmp9mKuo67w+Bds5CUU7nUjucXVfDdobqQIDlRmwcn2uJ
         3SfQ==
X-Gm-Message-State: AOJu0YxjvidnuNUtcnkFXzUS+8wl/33jvd0u9DBt6qM1o/H/879z+UMx
	1f0jHjM2ZOvngQYCPlUWPWt2lezouoflorwwaS63A4uH3ZJFPPynWK3xWA==
X-Gm-Gg: ASbGnctIx4iEAE7Ou71Ybf7Tr694C1i2D9AIDX4UM1SnENS54+jRT76aHY/c4BEZUiL
	zPKFTW6H5ntg2MUzPDoEOw2mrU5KJPvK74iDC2kkyfcYZs3tlpUcfUzhclOq5MTSw7Ol9gzVLKL
	aG+MQZYo537aPFC7aQgswxRWiOOvaGpfqt7K7LPhDuEFDJzI++594C6ehzF20z5smKmH19lQ85D
	zdWRxc+JLxaatn7mAHCKO9IP/Qe5bU0HpUdxxSosJT2Rhqi44EKUkfSQweWtI3igTTLF2OSW/md
	TwBYvAg98yWkPasWiaRsdKxzzQ==
X-Google-Smtp-Source: AGHT+IHPoXG2MK5ixbJR58mDxa9TMgaoWl3PJyTKI2pbLUsXbAoyFcLRbC8AHOiLUQaBakjcse1Csg==
X-Received: by 2002:a05:6830:6e09:b0:71d:4624:3f45 with SMTP id 46e09a7af769-71e36f1de9dmr1403776a34.18.1734036492042;
        Thu, 12 Dec 2024 12:48:12 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71e1e974290sm760564a34.32.2024.12.12.12.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 12:48:10 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH] python3-pdm: update to version 2.22.0
Date: Thu, 12 Dec 2024 20:47:59 +0000
Message-Id: <20241212204759.3536372-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 20:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114302

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-pdm_2.21.0.bb => python3-pdm_2.22.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.21.0.bb => python3-pdm_2.22.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.21.0.bb b/meta-python/recipes-devtools/python/python3-pdm_2.22.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pdm_2.21.0.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.22.0.bb
index d323ae3c6..e65e0e459 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.22.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "9c928d6db62d104ab86318fe09aaf9bdfc6f616176af407e4df00f59e001930f"
+SRC_URI[sha256sum] = "61b4f0f8238bf99ba59ffae3db524604417379df917e081d61b1e257bfc20e43"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


