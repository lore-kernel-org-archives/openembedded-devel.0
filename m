Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65DCC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 20:31:02 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.4856.1737145853356016702
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 12:30:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3ce8a4e95f3so22441145ab.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 12:30:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737145852; x=1737750652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygsmgnBn/gijitVslYZLxMKuzIuThLM1kWneBkzrvcI=;
        b=YXw5XSdFQlGw3wI5NiSthqko9U12HHWAg2kpXn5lx4siy9J2RCLl5HvVo08IX9bxG5
         gmWrtJEUmIrs2UbW3HAMFlUcGwCdrw0SswzDG3P+3PUdwleydyolW8uZ/ORdAhOyr0oq
         BcAbsNT27ooR580wx8fOPC23STVF+d60owWM6RbEDVe1grecwckoReb6AkwJZpDRwAOB
         rdFeI6Bc/5P+Wy9HPxdpkCx03aOrYj06QvgrDAAmxPosL6HKrDnhlFm0rRqgnnSOlZGa
         8ikdULHYLX6T+U/hqOHM4bYtxiH0Xt1mBk4N95/dtqt1aJrtdzumVdwUy3T4dweAfI/r
         eq5g==
X-Gm-Message-State: AOJu0YzOaMWtcYwC/HBHSQFphpEuJAua72l9HX7jH1m8iIxcfrpu4G8c
	PQnyRtRGCWYjRASkToMVFfv8H4/jaLFdwSdf3H0jYk4CEt1nA2X+DRUVFw==
X-Gm-Gg: ASbGncss9aLEHIL4Z10h3HFztsE8tzGfnMxxykL8rkG+wCuUqRmAUjVAZfWfGn4LsIE
	jTvnNDm7M4EfzbQDSaPoQ72N/GkIeZzgIIKk995f9JuUkSMlfJ3uQt8FwyOL4u+Co+SiJE/l3/N
	MhoxJtEyNtM9KqmXvn4kazBa6dZ3A3GCFVwlnFEf74exZASCSPrmZLedqQUUQBRKZBvaPsxsBPA
	6NTOTLtlU/7BbAKx3V9QwuEooY9t0EjsyUxs/hu7kcjD1A9jdNS+dO5z0TLG3FVn7P0nPYpKiBf
	QPMHBhOOQx4oUtj8NDb/6PEmmw==
X-Google-Smtp-Source: AGHT+IGuISWs0bRbaI98BBnJb7VgIRij1zcHZQzozVulPIEquUv1BN/7QEBBBjTsPgnhsDdqZXA1hA==
X-Received: by 2002:a05:6e02:378b:b0:3a7:dd62:e954 with SMTP id e9e14a558f8ab-3cf74283ccamr37554295ab.0.1737145852160;
        Fri, 17 Jan 2025 12:30:52 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea7566e687sm801814173.128.2025.01.17.12.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 12:30:51 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 09/10] python3-precise-runner: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 20:30:29 +0000
Message-Id: <20250117203030.3648575-9-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117203030.3648575-1-derek@asterius.io>
References: <20250117203030.3648575-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 20:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114942

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-precise-runner/run-ptest      |  3 ---
 .../python/python3-precise-runner_0.3.1.bb       | 16 ++--------------
 2 files changed, 2 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-precise-runner/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-precise-runner/run-ptest b/meta-python/recipes-devtools/python/python3-precise-runner/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-precise-runner/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb b/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
index ea453366a..53fc31ab8 100644
--- a/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
@@ -5,18 +5,6 @@ LIC_FILES_CHKSUM = "file://README.md;md5=2ad29e930f3107d52d2a55728bf62116"
 
 SRC_URI[sha256sum] = "1a464209fb4bf0a3f5d5a428310cb2a70487a01a6bc3a960d1dda90af896b80d"
 
-inherit pypi setuptools3 ptest
+inherit pypi setuptools3 ptest-python-pytest
 
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/test
-	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
-}
+PTEST_PYTEST_DIR = "test"
-- 
2.34.1


