Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D34BE71D33
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:56:58 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.29046.1696021008173103674
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: straka.derek@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-65afae9e51fso65641726d6.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 13:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696021007; x=1696625807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vz4Hl40BKshc1HbChm/LaHwOn6zqYQP46aU6wZzEuw=;
        b=MJU2i+k8MjJCzFVlH2l/EmU+3LxrwbQsMzB4obM5+g76sWsDzcN1Cl3BlL2WIUE02c
         10NiB90ktol4sAssdBvy6gxBh8wOrk+/3ZWQl7ZNI/RlvXPHosi8aRCGXp7U2YDMwQ+r
         /SuGGTsuNyXel+6uANZqeM2pM9nCoj7nluXJAsnnQn9NUnpKaTiaYZ3PeisBuLIpW4rY
         RJlsXzSUQnwWbc50fiLXeT/GLTXN9kQWHJUDIADdrQv15N/4okF8MhFPcM2v6S+7elVo
         bH9KyDhl4Cle5jULDe4heHBy+OQzNt34uelEN5I2wd/2IOVG9uH+wnM6xgFCLWAT9+1z
         qwNA==
X-Gm-Message-State: AOJu0YxGoLv6OpJ5pZqnriKQFD39siAHtVfBtuy034QCvZ6EnRgOSBSn
	uYCeWyHKIGR9b3ZdphRTis/1vyINpWBXO4el
X-Google-Smtp-Source: AGHT+IEaHc0g1v71nsyk/78UHJvk60SmaG/jJYdNek88Y1lhvP01z23Tp2dWGeUpjEcFYE2JN6hM0A==
X-Received: by 2002:a0c:b3d2:0:b0:64f:67ae:a132 with SMTP id b18-20020a0cb3d2000000b0064f67aea132mr4532240qvf.23.1696021006700;
        Fri, 29 Sep 2023 13:56:46 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id f15-20020a0ccc8f000000b0065b5306565esm2576210qvl.112.2023.09.29.13.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:56:46 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-flask: update version 2.3.2 -> 2.3.3
Date: Fri, 29 Sep 2023 20:56:32 +0000
Message-Id: <20230929205632.2106945-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 20:56:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105267

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-flask_2.3.2.bb => python3-flask_2.3.3.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask_2.3.2.bb => python3-flask_2.3.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb b/meta-python/recipes-devtools/python/python3-flask_2.3.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-flask_2.3.2.bb
rename to meta-python/recipes-devtools/python/python3-flask_2.3.3.bb
index c4c1ff7de..c8c8d870a 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.3.3.bb
@@ -6,9 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "8c2f9abd47a9e8df7f0c3f091ce9497d011dc3b31effcf4c85a6e2b50f4114ef"
-
-PYPI_PACKAGE = "Flask"
+SRC_URI[sha256sum] = "09c347a92aa7ff4a8e7f3206795f30d826654baf38b873d0744cd571ca609efc"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


