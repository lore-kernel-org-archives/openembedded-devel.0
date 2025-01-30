Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94CAEC02197
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:26 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.6225.1738274301590327065
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a81324bbdcso9145725ab.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274300; x=1738879100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atymFMswPPOcFgHX2CMcxVXoEV2V7rAMrYA1Pa62bVM=;
        b=eMOVKhVFOxhqi25aR7RJUhZuthRJw6QSt0j4ipAEcVWo4LHo38vQBAOmMmP7tpTLrR
         mZYgciYy1n4yQ6mN1F/gp1HfSwfVlWvWzwzdt+ycpzAeZeLN9hKSJizPLvaj2Ufll76C
         amVwQBhyjJFplC0mxtffo3WO5ORE+HHslY1Tn9O05ybL4g+bl79nEaX1aJ5qVCNW1jhy
         nE16GKBTmSAU9teyGBpYBPhbuFhkrIMCJjtQd2CZP5K7Iwnw0dD90rwniyMrveZQbKus
         CDyQGM1FXqoXGGcPkSyVeF5FvJjZlvep3v3VAKDbsMgTO4teLzc34vnHHQ4pCryVyFk1
         jnDA==
X-Gm-Message-State: AOJu0Yycyx1RD2iBWHOdDFou96xyUK4ee3dtyREnlz6QuC+Q2oANK6I9
	zGuL9pz4siW6HwiZEMh/6KvFaxhJeQ69+4w+pP0BjS9HeaCp1nJYGhkbt1cdEkw=
X-Gm-Gg: ASbGncu7+mry4XZkCGQ8UDSt/vZ1rDAVHmclWkAd9ocrgjuWypFPO1CLbTGewYRTvZ0
	9Gkyx+gaAJ3tvw1oNafWKDMZB0idV55+67sCtQnxpDtKSqkyVIMOBoCdt4a+NyC7zgIVDNYJdn6
	c+tAd4tdNFvFW+yPXvNoldEgHFAhhv2KjA2rGUYVZKY88H/CwWXVQi15ttk/UgGqboUH2TEa9rX
	KcNN2SmnWemXEGqQnraPBW6VYUCtGXUW8S8sijD0OdbBJUSHYdwPZocnPfKUM3pDr5FpA1NWe1k
	4LPFa6Lvy4sJw8iVH/35g7NRJ5BPSogS74u3WYsbnm8uqqCxIoNMM9My9vBm
X-Google-Smtp-Source: AGHT+IHoC9JqDhIDNe2cir3a46vP5u4n/lctAR2mv4ea0J7/iP1kxVHBHCTS9bE0uW4BFdXlYabS0Q==
X-Received: by 2002:a05:6e02:1c2e:b0:3cf:bb6e:3065 with SMTP id e9e14a558f8ab-3cffe297c77mr85768365ab.0.1738274300431;
        Thu, 30 Jan 2025 13:58:20 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:19 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 14/23] python3-html2text: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:29 +0000
Message-Id: <20250130215738.3280576-14-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115168

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-html2text/run-ptest           |  3 ---
 .../python/python3-html2text_2024.2.26.bb        | 16 ++--------------
 2 files changed, 2 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-html2text/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-html2text/run-ptest b/meta-python/recipes-devtools/python/python3-html2text/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-html2text/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb b/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb
index 55f4c8b0a6..98e0cde1e5 100644
--- a/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb
+++ b/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb
@@ -6,22 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI[sha256sum] = "05f8e367d15aaabc96415376776cdd11afd5127a77fce6e36afc60c563ca2c32"
 
-inherit pypi setuptools3 ptest
+inherit pypi setuptools3 ptest-python-pytest
 
-SRC_URI += " \
-	file://run-ptest \
-"
+PTEST_PYTEST_DIR = "test"
 
 RDEPENDS:${PN} += "python3-html"
 
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/test
-	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


