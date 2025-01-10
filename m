Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F8DE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:09:01 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.671.1736539738621364096
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:08:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-844dfe4b136so61411539f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:08:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539737; x=1737144537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LaDMlZuy14iuzp+EMGmMQx9ylU4wHgyF72Dg/hgioPs=;
        b=dVt57EOKeoRu0oRj7PqRX40fZwr2/nR104mQweHmVEKAtkEhhnsk6dSlMB/kw3OtJk
         CSWjkdovf2ScKM8y7d8uL0MDQhHFUkTFkK5GWqwMcfiZkTykG4wEp0+z1tnKpiLy0FFz
         sF/CluxCW1R6aJW7K0JO5is+Rf/CVFSvUFegnDOxN5OnSaplqngGjYx+prr+zyXkR7bP
         ung1yc+s0hDyZE3suTUHikl8WoOsBbGb/yicJonHF7pYwpJXPlFP1gZzk4un6pEFUSdU
         gk6UmjlBeDGQrrQ1B4AKvElAgMalV5nUT3ReWe7t7WvLKlR/otEPkUupN1SHA6QLMWSB
         a03Q==
X-Gm-Message-State: AOJu0Yyem9tDVEWwl7hsqNgKRkimyPG5G1paHoeXbx7chxYOhJq+k17R
	5rSq6ROgM0ksPvi5V3XaxFuZR6rOPtbGMN7PdjJXB8sw5+Ai2zkYjkCfDA==
X-Gm-Gg: ASbGncv9WpL+5GcTZOyV9T/AE9qbrr3SXmJ1ENlfVCqGSCkKP/POZ5YjNu89ft/zsGR
	M1qZzrYCGxwlfh93oEHENxXvPUm4G6SpRdoXho06F4m9cGt0r6r2FAky9/Ffu+zqv8sztj6inq8
	OiVLfgjEpNIy45P30wNmM537ErItjCRLoRBauA0X1lP2T1+F0sI3TTBiddhtEhXEPKdUxJOlv8p
	NQND6H9PfoQsNW7q9qpFLGQ+Cua9T+8MiIuZtLre/OtNybYRWgjgSNzG9dbaxOJsjfb5FZPweDM
	ssVsTRaOhaRBSMehVAOwluB2Lw==
X-Google-Smtp-Source: AGHT+IH9KJj0XGb3veyF2ru0CWmE/Hsif4EOeaLDsIHWi6yppgstHhWofUrPhpYlJN2suA4myjq1ug==
X-Received: by 2002:a05:6602:36cf:b0:843:e9c1:930b with SMTP id ca18e2360f4ac-84ce0194e69mr1165516239f.14.1736539737293;
        Fri, 10 Jan 2025 12:08:57 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fc84dasm104467139f.46.2025.01.10.12.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:08:56 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 01/13] python3-yarl: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:08:10 +0000
Message-Id: <20250110200822.3958062-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114791

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-yarl/run-ptest        | 3 ---
 .../recipes-devtools/python/python3-yarl_1.18.3.bb        | 8 +-------
 2 files changed, 1 insertion(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-yarl/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-yarl/run-ptest b/meta-python/recipes-devtools/python/python3-yarl/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-yarl/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.18.3.bb b/meta-python/recipes-devtools/python/python3-yarl_1.18.3.bb
index 8db97093c..5370573a3 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.18.3.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.18.3.bb
@@ -5,11 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI[sha256sum] = "ac1801c45cbf77b6c99242eeff4fffb5e4e73a800b5c4ad4fc0be5def634d2e1"
 
-SRC_URI += "file://run-ptest"
-
 PYPI_PACKAGE = "yarl"
 
-inherit pypi ptest python_setuptools_build_meta cython
+inherit pypi ptest-python-pytest python_setuptools_build_meta cython
 
 DEPENDS += " \
     python3-expandvars-native \
@@ -31,7 +29,3 @@ RDEPENDS:${PN}-ptest += " \
     python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.34.1


