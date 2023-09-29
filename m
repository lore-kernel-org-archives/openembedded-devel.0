Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6542DE728E2
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:00:55 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.27598.1696017648811329835
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7742be66bd3so720110185a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 13:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696017647; x=1696622447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i7os97rd/TkMHQbPAF4/Tzb4xUo7iKbCEnj+mSAErIM=;
        b=Vpp0u56qJH6mfFBhrevnEBclRkWa5tIhOVT2IuxX/Xhof33wSr99dOREVg7ghqMfCF
         6BQkVwaOx0Vz1lHfe/7qnJQKL5J3PQUSPqhECs1/e4F1pL5LZpySnhpkLyqNx1iiEn3V
         uWH7A3FvbZCJsVjYyul31RwcSGOwS0udCfuGexz+9w13nLHZ7zW0ze6kQLlvlXToS0LG
         qivqHPgfJ0SjNm+CH90ZPPRDvllwwvLTVo+2iWHH+V2gVrxr/tBKzMyBIrqJg3x+6MZ8
         BNu/xtDOIUlJ2i51+b936Y/NNqP6pFvHQ6YoZq8rEgvfIwo8GFxzwiL8GlBElN1UuKR3
         8A5w==
X-Gm-Message-State: AOJu0YxYu1YalsuKx78J/U0cDbvyk6ISw+e8ekCp1l9aAcht5mQz37B/
	eRDw76nX3X97ZJdROHUzCnPi8uPRS4zdDg==
X-Google-Smtp-Source: AGHT+IGtAQuxg00jw2MlrEihNYxVPsJmoZxJiNg+1Lr4isRqJlG7ll9J9Iw+QEixaRlyXVaZEdq7rg==
X-Received: by 2002:a05:620a:4486:b0:774:2e8f:2170 with SMTP id x6-20020a05620a448600b007742e8f2170mr6186708qkp.4.1696017647372;
        Fri, 29 Sep 2023 13:00:47 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id q21-20020ae9e415000000b00767177a5bebsm7128664qkc.56.2023.09.29.13.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:00:46 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-astroid: update version 2.16.6 -> 3.0.0
Date: Fri, 29 Sep 2023 20:00:36 +0000
Message-Id: <20230929200036.1758398-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 20:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105263

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-astroid_2.15.6.bb => python3-astroid_3.0.0.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.15.6.bb => python3-astroid_3.0.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.15.6.bb b/meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-astroid_2.15.6.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb
index 7325eb13f..2f80187b2 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.15.6.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "903f024859b7c7687d7a7f3a3f73b17301f8e42dfd9cc9df9d4418172d3e2dbd"
+SRC_URI[sha256sum] = "1defdbca052635dd29657ea674edfc45e4b5be9cd53630c5b084fcfed94344a8"
 
 inherit pypi python_setuptools_build_meta
 
@@ -27,6 +27,7 @@ RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-wrapt \
     ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-typing-extensions \
 "
 
 RDEPENDS:${PN}-tests:class-target += "\
-- 
2.34.1


