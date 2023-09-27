Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D03CE7A8B
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 04:02:45 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.10192.1695787360679639143
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 21:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: straka.derek@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-65b10205207so27107816d6.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 21:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695787359; x=1696392159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=103S3s7wQxncLzSvmGQIf9OeUe0eAQGrkasvuKWSqcw=;
        b=H2pC+t+h8hmrPIKjzaHzQ4BXtjFL0ITNlZp03hz7g610edzj/36coMnuXX4pQ8z8Q5
         +UuCoVthHPQXAG57R5eDFdRySaTzmCjFuh3YctbUfMnZTljwH67EkwX0CmtDo7f2cwwE
         nGdMl7eRE/rLBP+LJG1BrAep+BivkOkd4pIn10bUqG+v4c3qJWcgsk65v8WiKYy68SkO
         WFdSRUJ+3Btip7ixbhjXP95cXiqtqrdHK4K2oTner4DQQTB9t3n7yM01owV3MOhq8wQQ
         vRBAdxaQO2aUXtuwYSL+wS62jbVdt65zL65m7Ul0g1XUrkfER/chNXgywdnuEutxg8+Y
         IB+A==
X-Gm-Message-State: AOJu0YwdfsGwdvdmwgLntMHvJnLxZdmzyhbUlYynAH/iyAIYTCcf6YWm
	xudD0aufogJpbm+w4yL2t/n6XgFYYMt5Zg==
X-Google-Smtp-Source: AGHT+IG/zpdmM3F+sdS0jvKLfDQ8s3Wpz4kEL5d9OS/M8iHx6nLfocoEosNNXc3X2d6VJYXnjv7/lg==
X-Received: by 2002:a05:6214:2a8b:b0:63f:8839:658 with SMTP id jr11-20020a0562142a8b00b0063f88390658mr4550978qvb.1.1695787359244;
        Tue, 26 Sep 2023 21:02:39 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id i11-20020a0cab4b000000b00655e4f57732sm3120179qvb.35.2023.09.26.21.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 21:02:38 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python3-pymysql: update verion 1.0.2 -> 1.1.0
Date: Wed, 27 Sep 2023 04:02:23 +0000
Message-Id: <20230927040223.1628803-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927040223.1628803-1-derek@asterius.io>
References: <20230927040223.1628803-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 04:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105156

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-pymysql_1.0.2.bb => python3-pymysql_1.1.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymysql_1.0.2.bb => python3-pymysql_1.1.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb b/meta-python/recipes-devtools/python/python3-pymysql_1.1.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pymysql_1.1.0.bb
index 062d7e7ea..f797674e8 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_1.1.0.bb
@@ -8,10 +8,10 @@ HOMEPAGE = "https://pymysql.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
 
-SRC_URI[sha256sum] = "816927a350f38d56072aeca5dfb10221fe1dc653745853d30a216637f5d7ad36"
+SRC_URI[sha256sum] = "4f13a7df8bf36a51e81dd9f3605fede45a4878fe02f9236349fd82a3f0612f96"
 
 PYPI_PACKAGE = "PyMySQL"
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pymysql/"
 UPSTREAM_CHECK_REGEX = "/pymysql/(?P<pver>(\d+[\.\-_]*)+)"
-- 
2.34.1


