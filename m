Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495E9C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 04:57:05 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.15276.1702529821237671480
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 20:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7b37405f64aso310139439f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 20:57:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702529819; x=1703134619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B25a39zY34o4Q7HIAK/VIRFWnhkqqDDtihwPW8nmAx0=;
        b=rIpe8nxD3w4vKUqdlaL+n3wMZK4eoR/xK31xRpsTY7Ci95Op9R9ToddNgD4PgpZVV7
         fxgZbTbYUxAQLqcHcelucakqak2Cnmgaq86DcOMOxmeXRhuTjX5JmIjnK314MQtrjK6c
         JA5d6LMGwqtyeV73t4onfl7xqr4Z4pjYgjvbH3UhjpQJ9IpePLe2dZlzbOVfM2C/SESf
         +vUJWlphOSQDWcf0SlNMbVou9PTvqWzgnkncdq9QQRhPLHjdDqOd0Q8yRaYvszfOzqI0
         W2AMdqyg9zp8nW5KLa15oxa0gouZkod3G01TEgxqRwuvGEN2HMe6kvJKERXvxI0rnCgA
         vJhA==
X-Gm-Message-State: AOJu0YwDMCKmdN9lVEjQK/bnKMa2WehJzOBGf2DPa0Y+Ajyf4RaQkZbV
	MI1OmnvCKe/42JULyzRdOk/CTish1MxupQ==
X-Google-Smtp-Source: AGHT+IEIUIO5Mps506uvDnBCllkEiL/k1COaoP6bn+mh+pfm2ZPxHHhY21hbbih/yFHLjEZ1s/Npvw==
X-Received: by 2002:a05:6602:695:b0:7b7:cb6:ad96 with SMTP id dp21-20020a056602069500b007b70cb6ad96mr10766129iob.17.1702529819658;
        Wed, 13 Dec 2023 20:56:59 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id ei10-20020a05663829aa00b00466917fbfc4sm3205237jab.71.2023.12.13.20.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 20:56:59 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-olefile: update to version 0.47
Date: Thu, 14 Dec 2023 04:56:46 +0000
Message-Id: <20231214045646.1188342-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 04:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107410

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-olefile_0.46.bb => python3-olefile_0.47.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-olefile_0.46.bb => python3-olefile_0.47.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-olefile_0.46.bb b/meta-python/recipes-devtools/python/python3-olefile_0.47.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-olefile_0.46.bb
rename to meta-python/recipes-devtools/python/python3-olefile_0.47.bb
index e29f30f6f..2db0adad8 100644
--- a/meta-python/recipes-devtools/python/python3-olefile_0.46.bb
+++ b/meta-python/recipes-devtools/python/python3-olefile_0.47.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Python package to parse, read and write Microsoft OLE2 files"
 HOMEPAGE = "https://github.com/decalage2/olefile"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e21a06208415d5eb2001555d37851362"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f18814bd70fd28e11a4545145dcb3822"
 
-SRC_URI[sha256sum] = "133b031eaf8fd2c9399b78b8bc5b8fcbe4c31e85295749bb17a87cba8f3c3964"
+SRC_URI[sha256sum] = "599383381a0bf3dfbd932ca0ca6515acd174ed48870cbf7fee123d698c192c1c"
 
 inherit pypi setuptools3
 
-- 
2.34.1


