Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9C4E7719E
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 22:32:02 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.4061.1736548312591472738
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 14:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3a8c7b02d68so15719155ab.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 14:31:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736548311; x=1737153111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eixNj4D4w6izAJrB8DSSOFS4hAbVAS3H8xNMKleUnho=;
        b=F1V+Czrii6SwjLjWY09R2/VDrBfGH/1aeUcy+yNuL5wI7OuWyb4638Dw3WAEBh++nF
         M+CbPKpl2DiysJJs+7D4XNLW4DLYzDCPv4URoarDXxoP3EIjvWO3vM7Ejf/2BgwjAZKO
         62qRJCEbEKOCSq13X0Ny3bk688PGI5MMW2FpGkVoGPZubzzUOkZxo9ZATKU+fwlh22ib
         GPad/xxWjuJjjzCsQaNJNm/JDpug7eAnJTstcEJvZRDI8uZlmpQQQyX1XWNUltE9Xy6d
         LKTAPmufOdvHvHt7neS7tm+KB7HGb6taXBkWhCLa4hFkqrPpfDdsWWYr5ERcVwUN3BT+
         ZWWg==
X-Gm-Message-State: AOJu0YyvTro/y1zRCfgciTXMnlVAmYmaTUGXAB7AD9b3v77iM4jTpL/6
	ZI5pBVqPorz03BmtUrcFuYrxA9YYtqOvWHSnAt/BfUxImZHfnYxA/R6aSg==
X-Gm-Gg: ASbGncvy5vmsLPDSBaRtuWzkhF0culHJ1cFofZo0X5Pk8yC8ShgNaMkPogIVeQL5a6U
	qHyfAhgZjGB/PYTr8y/xX4fbYSqnH2X2nllD5wyzx7M5Wbevm2le80eEy32rd/+WajSL9hzyQMa
	fEA78tHrWIzKU3EnF/OjjUDgokLC8Sxx6NDXPCwNBN2v6qci8DUhGMXS4w5iHLIWi9Y6ImJ70Lu
	2SIP4Uq1pDMhyNUfNcEEIMmjoFI6wV2C6x1UsWHNrTBa3jzLU9hWHFpvcDrzo63CohCOMZIILn6
	SC8E2sGtDm+/53blKrct3hIk2Q==
X-Google-Smtp-Source: AGHT+IHMV0HzKEKXHlBIDYZrMb8rkb5MrCK3LtSqRaX/HmrYl/6GQnElIlYuhCvBsWKVoETnbRXQ0g==
X-Received: by 2002:a05:6e02:1d86:b0:3ce:5a89:326e with SMTP id e9e14a558f8ab-3ce5a893465mr25506855ab.13.1736548310965;
        Fri, 10 Jan 2025 14:31:50 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b614781sm1120035173.44.2025.01.10.14.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 14:31:50 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 1/5] python3-soupsieve: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 22:31:30 +0000
Message-Id: <20250110223134.4177993-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 22:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114810

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-soupsieve/run-ptest               |  3 ---
 .../recipes-devtools/python/python3-soupsieve_2.6.bb | 12 +-----------
 2 files changed, 1 insertion(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-soupsieve/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest b/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb
index dc317ea6c..dfcd9f484 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb
@@ -6,11 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bdfa4c8e8b6830bcf8e78cba1669e4d"
 
 SRC_URI[sha256sum] = "e2e68417777af359ec65daac1057404a3c8a5455bb8abc36f1a9866ab1a51abb"
 
-inherit pypi python_hatchling python_setuptools_build_meta ptest
+inherit pypi python_hatchling python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI += " \
-        file://run-ptest \
-"
 RDEPENDS:${PN} += " \
     python3-core \
     python3-datetime \
@@ -21,13 +18,6 @@ RDEPENDS:${PN}:append:class-target = " \
 
 RDEPENDS:${PN}-ptest += " \
     python3-beautifulsoup4 \
-    python3-pytest \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


