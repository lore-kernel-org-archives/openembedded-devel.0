Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC32C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:00:12 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.2818.1737140408120120762
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 11:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3ce8c069840so16751965ab.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 11:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737140407; x=1737745207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8Nc6/Fa3b7byWArP9In+w2rWq6gT+J6643FcY6jMXg=;
        b=wqFU1m8i7cU0Bz/Bq0HWhHRD9gHRFC7bJhC9FDAHHWvZf+VTDnEVGUSmILAjccargi
         AIVFAxk612atUeWDFxcH7zMK9T0Rgse7My70VwJwIeu2j22QbI914M4SQsMxtpL72L/J
         fcL7H7X+2UDmgYE7GHr4Hxd4jsj1yoZ863CnClCVBmWbGqEgzVrIJJXhDx3ZdXygo6uv
         nWiWC55gH814y2BSfwVLKUzPsbPve0X7Op9IlkF104NjRdwrmjOWoqspofp+MkJ2irDx
         bUGBYDR4cPjE5lrSDxfh4lSt8zZ0RXK4ki7uH8nzmozexn+ckmHy8AyAlAYGrW1biPTY
         lOkA==
X-Gm-Message-State: AOJu0Yz8ZpJ2YVkIosYhJXn+wOLE++0N5JyanQtpoQZ2laz0wjqzlxKH
	Zt0RtpWylYaGwSPkssAqEn+AfQkqtaUdYJnJZ6OLxfcIbya6IAcO/RgyIg==
X-Gm-Gg: ASbGncskk8ySmuq2td+60ezZPQixLT/3yZZQCGw2+ACKO/mwd7IDpyf7HDxecopbAs7
	t6bFOMqyjBtVMhr0U/nre/1pg17hF48hC87pdnVe16md61CZxvyOafUFaRKgXpPY0q4JqJ+5kdk
	XkzeNKfldy/QS7or2FrsoyRFlHLaNiflgDtdqSAg9Q/LSpwVOSM+uKC/GMda+bBicrS35rIUG3j
	GXJJEBso7ztfkZoMJjxtTun9jyJyyDHn+6IyTCcoEyLKBUeHxnzGRLD3pDwGZWJ7IZXS1XrTHvY
	2J5HZS4+0ezZL1urcxuyCL4p8Q==
X-Google-Smtp-Source: AGHT+IHMQz/DFt3dbrOmNfby5X3ogeNm+q2nq5U9maIiN+rYFmtZB2wmqYOqs7ey+eZlBpJ0jMzNRw==
X-Received: by 2002:a05:6e02:1989:b0:3ce:8aa2:3fb1 with SMTP id e9e14a558f8ab-3cf744bf12dmr32281565ab.22.1737140406968;
        Fri, 17 Jan 2025 11:00:06 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea75495f5dsm761396173.60.2025.01.17.11.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:00:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 02/10] python3-scrypt: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 18:59:36 +0000
Message-Id: <20250117185944.3434424-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117185944.3434424-1-derek@asterius.io>
References: <20250117185944.3434424-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 19:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114923

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-scrypt/run-ptest                 |  3 ---
 .../python/python3-scrypt_0.8.27.bb                 | 13 ++-----------
 2 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-scrypt/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-scrypt/run-ptest b/meta-python/recipes-devtools/python/python3-scrypt/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-scrypt/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.27.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.8.27.bb
index a3254de07..02f1da8f5 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt_0.8.27.bb
+++ b/meta-python/recipes-devtools/python/python3-scrypt_0.8.27.bb
@@ -7,22 +7,13 @@ SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
 
 SRC_URI[sha256sum] = "a7b637848ed518c1ea2b31a9ecaaa3f49616598d8442de8706cf1f01fbabf0a7"
 
-inherit pypi ptest setuptools3 dos2unix
-
-SRC_URI += " \
-    file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
+inherit pypi ptest-python-pytest setuptools3 dos2unix
 
 RDEPENDS:${PN} += " \
     python3-ctypes \
 "
 
-do_install_ptest() {
+do_install_ptest:append() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/scrypt/tests/* ${D}${PTEST_PATH}/tests/
 }
-- 
2.34.1


