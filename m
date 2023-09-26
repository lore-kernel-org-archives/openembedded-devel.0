Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438E2E7F140
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 22:04:40 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.4106.1695765876805561189
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 15:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7741c2e76a3so513054785a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 15:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695765875; x=1696370675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VhrJOTF2ElCQmIIR+OfAxw5/GJuUGnMSf+S0pYt0g4g=;
        b=EjpLzms8iPgyrVzWV9ZyNR8+aWSM9TDAO+NJ4baQcyJaJwg9qYmRZNidRa7Oi9gSv+
         OL+de/Y1R1ZIRPYLeQO8YpWH8pOmJP6XCTJ9PJKFpIFQ1hYz3es7sg9ZNjSAAc7hqR3L
         DUnN2KeUbu0nVlYQNVOWtBDURLc9XTXaYfP8Dtll+1Cdiy4aw1CqFAzEOP5LMH7EX713
         FiG+Wyb+bVlBvxQmJU+74yx7CFDFGF8rZVaCotId2q0US/ojGspaMkY6tdimBeRbU1Xh
         McTDcw+KeMot1ufV+uxymFBH6irH6UiFQrBc4YsDdlstcOgxSECZ0SxflkblsBg96a8d
         iUFg==
X-Gm-Message-State: AOJu0YxqLxW6+jDxn0u0q8aJip59nZJPcir40mjZgp4j5M3whmyMEXrJ
	QEWcUgwxac2x1gxSMUDAA4bs0m+xh+OI5w==
X-Google-Smtp-Source: AGHT+IGS4m0ML9c2Nmzrz5DObmozHyQixfxpFr0JiZZQIaAQxbK4vQv/SdxnJ5VKeL1Kq6EG0BJY2g==
X-Received: by 2002:a05:620a:4082:b0:773:b543:5989 with SMTP id f2-20020a05620a408200b00773b5435989mr112328qko.2.1695765874748;
        Tue, 26 Sep 2023 15:04:34 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id u6-20020a05622a010600b00403b44bc230sm4933441qtw.95.2023.09.26.15.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 15:04:34 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pydantic: Update version 1.10.7 -> 2.4.1
Date: Tue, 26 Sep 2023 22:04:23 +0000
Message-Id: <20230926220423.1601455-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 22:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105151

Update build to use hatchling
Add dependency for README generation
Verify the license terms and update the checksum

Note from upstream
=======
Pydantic V2 is a ground-up rewrite that offers many new features, performance improvements, and some breaking changes compared to Pydantic V1.

If you're using Pydantic V1 you may want to look at the pydantic V1.10 Documentation or, 1.10.X-fixes git branch. Pydantic V2 also ships with the latest version of Pydantic V1 built in so that you can incrementally upgrade your code base and projects: from pydantic import v1 as pydantic_v1.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...thon3-pydantic_1.10.7.bb => python3-pydantic_2.4.1.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_1.10.7.bb => python3-pydantic_2.4.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.4.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.4.1.bb
index 9d59cf859..6d06650eb 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.4.1.bb
@@ -1,11 +1,13 @@
 SUMMARY = "Data validation and settings management using Python type hinting"
 HOMEPAGE = "https://github.com/samuelcolvin/pydantic"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2c02ea30650b91528657db64baea1757"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
-inherit pypi setuptools3
+inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "cfc83c0678b6ba51b0532bea66860617c4cd4251ecf76e9846fa5a9f3454e97e"
+SRC_URI[sha256sum] = "b172505886028e4356868d617d2d1a776d7af1625d1313450fd51bdd19d9d61f"
+
+DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
 RDEPENDS:${PN} += "\
     python3-core \
-- 
2.34.1


