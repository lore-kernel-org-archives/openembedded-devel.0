Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA6FC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 08:54:13 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.31820.1644828852398694196
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Feb 2022 00:54:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=KA3UYuZQ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.50,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f50.google.com with SMTP id j26so14741181wrb.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Feb 2022 00:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xJ5O9TNnGhU6r+6oAlrqHNM461tYvvS8p1qJTm2v8wo=;
        b=KA3UYuZQjhHfgEb2rckmQZ9j5oZMG/tTuBhz1V1VLgVK8wTTBwDJLjmUdUCuDR97CY
         UKhJg9jRO7XqR9xOMSu3TJyEQ2PCm7GccvxlgEQA1xgDXexe2GB9G9qb3b1hXs9/3DeQ
         kTESrAmUeI9LQ0wD+FVFEveEZmeWzp0m8uZik1ekxjXjYLgTRMLioZcT5n37uUpa1Eg/
         uWf7IAgtBKsuWQ4bikSnfUECaOpstOaKxJ1gWJLS76ndK5rTElrIR1OCCqjmfyTWG1c1
         45YozvH84UDtEnCr9rJALk3wdVqVIS7/k/6I2B9MXObGHA3U6ZbD5V4eAkRWkCImRuI9
         VtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xJ5O9TNnGhU6r+6oAlrqHNM461tYvvS8p1qJTm2v8wo=;
        b=6wRIR3OKwRXuSRmW47eBVhoWVtfD9iwnQLJyfnL30Ry1xH/Muj2GD1z0UfDj1qeh4x
         edJY0cNnPbxflL7XXp3QwAUCXAAPe6HLhqstQtW1Wt2E06rKOfUhq9YEjWvm+IKBtQwT
         jB2upgdTg6THxC/skLwwnhGnHmPkRRnAIRgldNebrWR0Z3XJLn4YiFAjfLcowG8V58pq
         FOPJ5xAa8vg314w3rjkmMdvOxRqgIiy6aYWpaVItM8zsZl95SqK7D6b/aci1WvGJ96yu
         30QcUk5UtM3YLzB1oU7grfPlWSfI0uiBcDsEj7AwDNd+kvkrn3HQvLcnlY5igcvrvhBw
         l45w==
X-Gm-Message-State: AOAM532zSeES0DuGxsti+wRsFp/GBBWqVTd+B1qyzwtqokI6uzRNDE9w
	LiiYIq5LCo3I4CJyt4zGdOwqsg==
X-Google-Smtp-Source: 
 ABdhPJzA+ncEkASDn/z/vVbGW74pCO/yqMGpDESBLxvkoFooFVsyE15uPpgeRz0DAyitVOjvbIpJfA==
X-Received: by 2002:adf:fd89:: with SMTP id d9mr10083102wrr.348.1644828850670;
        Mon, 14 Feb 2022 00:54:10 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id
 g10sm3654089wri.91.2022.02.14.00.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:54:10 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-virtualization][PATCH] python3: drop boto3 and botocore
Date: Mon, 14 Feb 2022 09:53:36 +0100
Message-Id: <20220214085336.288156-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Feb 2022 08:54:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95304

AWS packages are provided by meta-aws in more recent versions. Drop them
from meta-virtualization.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 recipes-devtools/python/python3-boto3_1.17.51.bb | 16 ----------------
 .../python/python3-botocore_1.20.51.bb           | 10 ----------
 2 files changed, 26 deletions(-)
 delete mode 100644 recipes-devtools/python/python3-boto3_1.17.51.bb
 delete mode 100644 recipes-devtools/python/python3-botocore_1.20.51.bb

diff --git a/recipes-devtools/python/python3-boto3_1.17.51.bb b/recipes-devtools/python/python3-boto3_1.17.51.bb
deleted file mode 100644
index 9c94a34..0000000
--- a/recipes-devtools/python/python3-boto3_1.17.51.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-HOMEPAGE = "https://github.com/boto/boto"
-SUMMARY = "Amazon Web Services API"
-DESCRIPTION = "\
-  Boto3 is the Amazon Web Services (AWS) Software Development Kit (SDK) for Python, \
-  which allows Python developers to write software that makes use of services like \
-  Amazon S3 and Amazon EC2. \
-  "
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
-
-SRC_URI[sha256sum] = "c45e7d3aef8965ae1b42c9855c31ded19fbb38cfad0a34cc37dc880ded3672c2"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += "python3-botocore python3-urllib3 python3-unixadmin"
diff --git a/recipes-devtools/python/python3-botocore_1.20.51.bb b/recipes-devtools/python/python3-botocore_1.20.51.bb
deleted file mode 100644
index ca506f6..0000000
--- a/recipes-devtools/python/python3-botocore_1.20.51.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "The low-level, core functionality of boto 3."
-HOMEPAGE = "https://github.com/boto/botocore"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
-
-SRC_URI[sha256sum] = "c853d6c2321e2f2328282c7d49d7b1a06201826ba0e7049c6975ab5f22927ea8"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += "python3-jmespath python3-dateutil python3-logging"
-- 
2.30.1


