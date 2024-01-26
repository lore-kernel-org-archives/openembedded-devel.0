Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054C0C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 21:36:08 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.1934.1706304965642581580
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 13:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: straka.derek@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-210c535a19bso459435fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 13:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706304964; x=1706909764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjzvjMwg3PxFdnHPJxIkUXBeJSxAJPHxgmaitnfOYwI=;
        b=qyS3LxDVEbjBZqzGYBOUfDbvzdx4kexkcaw2jJYnR8NJXq1e0fukM0zAraMx1d/FVF
         1Yj1XsVp/NpXvF1Av6FwXDAXe9e9zmM0U5/waCh2OD8tJ/gbyqOvufeez0nGN202WLN9
         Q3Dce8V7JCx5cTRnApIIP4fAmcZvI08aQKjq5/3Dh/JbRBQ6EM+OFe1sTb4+Svf0po7D
         79ab4uZqo0srticNP00C6pFTA3nOmnocSezoL5xeNJSSNOTMcZwrP7WmVxnmPaNBXD6Y
         zvSFIOfY/VHjqSHicoEfrPWVRUj+8KU793IthBoCsTWnujrmKf+bNJu9C5l2opTJGGdN
         4Hzw==
X-Gm-Message-State: AOJu0Yw+RvzCTA4T6Bx+rW9bY6hcknhjU6v4ri4ptrDAmBfL7yl0sEJQ
	PeOQ5SG3K85WFJV7M8KggUBG7bK/oIEe1rqh/GF2mgryEK9tHRlswYnQHFjrj0MebsZf
X-Google-Smtp-Source: AGHT+IEGTeN4qiF1lx4bvQ50HhImxD+yo5wziAovyWFvEEIAPJmNmPrrE2BmCir5O7o7uw6ieiZ2aA==
X-Received: by 2002:a05:6870:63a0:b0:214:9ecd:56e8 with SMTP id t32-20020a05687063a000b002149ecd56e8mr314420oap.33.1706304963968;
        Fri, 26 Jan 2024 13:36:03 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id k7-20020a02ccc7000000b0046eec9217cbsm459494jaq.164.2024.01.26.13.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 13:36:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-gmqtt: update to version 0.6.14
Date: Fri, 26 Jan 2024 21:35:02 +0000
Message-Id: <20240126213502.1588080-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 21:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108473

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-gmqtt_0.6.13.bb => python3-gmqtt_0.6.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.13.bb => python3-gmqtt_0.6.14.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.13.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.14.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.13.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.14.bb
index 101bfb9aa..5d8a3ba51 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.13.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.14.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
 
-SRC_URI[sha256sum] = "b4623d3e32ba266e96c04b0871bb057d05414371c1d279550648b390e6ba7577"
+SRC_URI[sha256sum] = "45b0f7794247455b9163155eeedf41c86e303c72b79056bf65d33038b17443a3"
 
 inherit pypi setuptools3
 
-- 
2.34.1


