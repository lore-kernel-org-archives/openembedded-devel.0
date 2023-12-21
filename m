Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58D5C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 15:44:50 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.53654.1703173489615565126
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 07:44:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-35fb0dcec7aso3686585ab.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 07:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703173488; x=1703778288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvppOSZw1rnLiM7LRdWEvqIqDd/qE7z5A+bi1f2l0Vs=;
        b=BqbYpYL0SWIDJL3N2o9qjkCgVkGmjpFX3m9KwlmZbnTybbFnAwyvWcIQ1Ik/S3Rqug
         nhbOu2Vj5H/aBe1gx1NHDTHZ6e30aY47QfYUvVdvMWMQ29PS9kzehHj3WyW4r2AFjjRJ
         pPhjgaALznslw8Mi93V3g9v6ele9XSUdFtfEr3L+Ho0JS1rTS6YGvOMRDdYiKeUCN4Wi
         XuyqtjrfHsU0b0QWdTeAoNmdudFxFIjNMF5TdWrFeCYgsdd778eLXQfV2i2tXxXpXbTq
         0vsSpTMuFXBEq0xyhIxZE7A8m4rRsh84lfRcGpQ98wlNNXRax4Bj8OWdEhBrk8Y8MYns
         4PWg==
X-Gm-Message-State: AOJu0YwZOF1amfbiAVo9kV7xywWB/VLakwvMrQtStcZBGTz2a/7Y/LB1
	PBPkBp4gnUCHyRKcoeTIuKzuAfRNn/Rjpw==
X-Google-Smtp-Source: AGHT+IGLDVcpHoYzH7Dx5SNe+Qmo8HaqTPerx1W9KlaqspUtJnuE2yOYPFm7I5f8pz1P1xxVMscH4A==
X-Received: by 2002:a05:6e02:18ce:b0:35f:d9e4:9c7c with SMTP id s14-20020a056e0218ce00b0035fd9e49c7cmr441853ilu.62.1703173487751;
        Thu, 21 Dec 2023 07:44:47 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id k28-20020a02ccdc000000b00469328386c8sm530578jaq.162.2023.12.21.07.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 07:44:47 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 1/5] python3-rapidjson: update to version 1.14
Date: Thu, 21 Dec 2023 15:44:31 +0000
Message-Id: <20231221154435.3874910-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 15:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107715

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...thon3-rapidjson_1.13.bb => python3-rapidjson_1.14.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rapidjson_1.13.bb => python3-rapidjson_1.14.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.13.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.14.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-rapidjson_1.13.bb
rename to meta-python/recipes-devtools/python/python3-rapidjson_1.14.bb
index 1623f721f..8b76397bf 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.13.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.14.bb
@@ -4,13 +4,12 @@ HOMEPAGE = "https://github.com/python-rapidjson/python-rapidjson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4daf3929156304df67003c33274a98bd"
 
-SRC_URI = "git://github.com/python-rapidjson/python-rapidjson.git;protocol=https;branch=master"
-SRCREV = "a87053d9b97750afddb504da05bd1cd9f4b94654"
-
-S = "${WORKDIR}/git"
+SRC_URI[sha256sum] = "26806f0a658c34b48d2951d8d3f846ca9deb93a34e664ef436db632a188b6779"
 
 # Inheriting ptest provides functionality for packaging and installing runtime tests for this recipe
-inherit setuptools3 ptest
+inherit setuptools3 pypi ptest
+
+PYPI_PACKAGE = "python-rapidjson"
 
 SETUPTOOLS_BUILD_ARGS += " --rj-include-dir=${RECIPE_SYSROOT}${includedir}"
 
-- 
2.34.1


