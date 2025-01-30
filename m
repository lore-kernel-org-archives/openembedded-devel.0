Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62741C0218D
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:06 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.6214.1738274285628609255
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3cfeff44d94so4052125ab.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274284; x=1738879084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1aJM2t3nXPmC3Hr/s3FIBLr7mEbzyfcTGJzt3XzWgXE=;
        b=AuhcA0x3r7DEFb0fNdCnLYREBgF+/JVg74ad2oMGN5w+G1mo+JmoNd1tRP5JQqsZ2V
         KLCDDE5HBtMKIfVj6VULbG7q8EIac/KbSFfXMv4T92zXnkTk9rnB8tN99X4g7h01ekET
         U37E1dYuHzBYZjhbNT6umXuZhznti7wmxdMIcMwhcCKlmzZ+Za0f+ertVYtUVdIvCZUv
         NPWSAB5QTIcC9R4JJIgk8iceROaScJq9odaLSNadKf/CtmSDhfAME0u9V3/o+45wmCMo
         ivqB3j/irZdHgvPfq48Vwyt8UPflXdqlFxvszUoJ2mJ6G+CFA8MPThWCV8hIANC1h2km
         RytA==
X-Gm-Message-State: AOJu0YxW5oPTsfvThfQPAvcMtfwGM1CcvoTD0S4GCRA+XxhGg4rwT6hW
	GC+uxrGY0wXFnO4K7CUDq/Nt47CnowJwPWOeXFgaBH8WI3sU/k2EbXcaD+pMxRQ=
X-Gm-Gg: ASbGncsxKt/kHVSgNjjWCYA+A8LksyA9z2LAcmD8r77dD3xTIxAXk7iAS9+DQBzEtYQ
	pYL82XUQnOH6WHyk+FgRvN1gFzee2Gmz1mRF1hh+BBVUo9O01GyRaEyHWJt4EH5PAdLZpXP6Ife
	Wn+R5X0p2KZtybFGI/vgYh1ztVFuC+xZ4owQHesCnZbor2UBm4i32Qu5FR4MS9X6EPyJKtV+CHE
	Nan5VCE1Iyg2z0CQbCG1lkpUY1DE2kSpSSWfv833AAPjyrkWW7teLc+ckxltuRA1rnjAHH8sreE
	zEcocVbjfvjkK66RWwayN0YUjTn6Oxa59QkjZ0D7LMm6Ra5D5mrm/TE7S9lr
X-Google-Smtp-Source: AGHT+IEbcygS2O3ctYY2LBlS3lWzrWu9bcNbayl6MxBjPurqHnrPR/blrKlSR50bHu07XSuMO9Llug==
X-Received: by 2002:a05:6e02:156e:b0:3ce:7cf5:4cb7 with SMTP id e9e14a558f8ab-3cffe42288fmr65645625ab.14.1738274284409;
        Thu, 30 Jan 2025 13:58:04 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 02/23] python3-netaddr: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:17 +0000
Message-Id: <20250130215738.3280576-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115156

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-netaddr/run-ptest                |  3 ---
 .../python/python3-netaddr_1.3.0.bb                 | 13 ++-----------
 2 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-netaddr/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-netaddr/run-ptest b/meta-python/recipes-devtools/python/python3-netaddr/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-netaddr/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-netaddr_1.3.0.bb b/meta-python/recipes-devtools/python/python3-netaddr_1.3.0.bb
index b8a772566a..8b486d26ff 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_1.3.0.bb
@@ -4,18 +4,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=8afa43eca873b71d5d85dd0be1f707fa"
 
 SRC_URI[sha256sum] = "5c3c3d9895b551b763779ba7db7a03487dc1f8e3b385af819af341ae9ef6e48a"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI += " \
-        file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
+do_install_ptest:append () {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/netaddr/tests/* ${D}${PTEST_PATH}/tests/
 }
-- 
2.34.1


