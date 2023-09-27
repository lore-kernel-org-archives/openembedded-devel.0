Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557E8EE14D8
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 04:31:45 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.10665.1695789096755467811
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 21:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: straka.derek@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-65d01a847b3so610656d6.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 21:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695789095; x=1696393895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZRu+uuAoIwnwBKyXRT9Z691aczO8qUUtypUlXCP2XE=;
        b=B+TxaVmue4VPFXm+sxWU3a/TFX7lrBgfRY4EY0tfU4vPSoNtAfUCuig5Qs9s6d7dFl
         +uZn++2+oROu1KSyPvAjFWuLag1Jq+lzIq58zmbwfLVSAq4DbT0bH/L+cdQJb01k2AiQ
         /Nc21VJnY7SxjqDQ7iz0HCNUkbJsAsh+eEFs4iF/msBd3iv+ECONi9G+6Nk2ryilkyJ0
         x0bytzJGQmDtPHib+SZ+aLB1QDRhvQLvIf2Uocp2potlGW7rJPzZqaTlof4kxMFy0XcQ
         Ph7plvucy4F2DrUalgOaQHwiqc6jCPu1LX1X+dkKOX3J5Niit2uy29vBbrwiKPuyo4ew
         whsA==
X-Gm-Message-State: AOJu0Yzs6k4SD+HWuF0tdTUPn57Z5m3P32F3XuCeiQmQ5mriwxJaLdOU
	4MRVGrLQveVd2eRX9K2rorTT651XAOs/KA==
X-Google-Smtp-Source: AGHT+IHqkS2EmngrQ6PF3o7mYJ49yvnX5j+VA4pvOVq2USpJvJR3kc1DKbhU1Skj08U+u91HYWCy0A==
X-Received: by 2002:a0c:f5d0:0:b0:65b:1cc5:ae6d with SMTP id q16-20020a0cf5d0000000b0065b1cc5ae6dmr892912qvm.62.1695789095448;
        Tue, 26 Sep 2023 21:31:35 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id s14-20020a0c8d4e000000b0065b2e14c1besm862932qvb.99.2023.09.26.21.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 21:31:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pyproject-api: update version 1.5.1 -> 1.6.1
Date: Wed, 27 Sep 2023 04:31:26 +0000
Message-Id: <20230927043126.1661639-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 04:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105158

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...n3-pyproject-api_1.5.1.bb => python3-pyproject-api_1.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproject-api_1.5.1.bb => python3-pyproject-api_1.6.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.5.1.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.6.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyproject-api_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-pyproject-api_1.6.1.bb
index 1b458fa2d..739df2a1b 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.6.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pyproject-api.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "435f46547a9ff22cf4208ee274fca3e2869aeb062a4834adfc99a4dd64af3cf9"
+SRC_URI[sha256sum] = "1817dc018adc0d1ff9ca1ed8c60e1623d5aaca40814b953af14a9cf9a5cae538"
 
 PYPI_PACKAGE = "pyproject_api"
 
-- 
2.34.1


