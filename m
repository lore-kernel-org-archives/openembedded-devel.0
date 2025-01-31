Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6922C02190
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 01:40:07 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.10327.1738287603379661645
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 17:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-71e3f291ad6so967916a34.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 17:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738287602; x=1738892402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5fmNkAMCYzw08yrGPwXHyRq8zbhT7rCvY/gVbpGrkc=;
        b=CJVy6gS9Avq+4IqNFV8qznYjnhtTpnfYTriGWbQ9Ouo682q/fuyv/X9/o5lZjAGIt3
         hVKgJNWEUtlOGClVVvnTu6FyiLdcHSeAyaEAJYWv9N3E7Bs28ZSNQC/VuqYOrh81Phfv
         EdKU1kExFqbe267DVeq8piEW2QkLvQ8fgt+8PlSNEIBRLIXbnVxTDdlqW6e+Jvb5Pag4
         4rjU63PmwcqKr8jwhMGcJDVy5c6y2QsRJJh/YEUFOgvKwWy0w0OsLea8VveAEkxh98pt
         pHaFWXXZRn5Jn0G3Lt/Atb82EpO9vK3cQbKK99jcwQdOOPRGpdwEyCDgjw0/1xiNKtlc
         Qbyg==
X-Gm-Message-State: AOJu0YzSwc0aM9FaJvzXsop6QkcRDrQPQUl/FIENmnstHUju3byZ4F1O
	V1GU9x6P9zJ8U458M5TPsIGcfqqOoe5/0ObGKQTja7XJ4zGkz+HGhek95AN6
X-Gm-Gg: ASbGncu+49QyJA2Tu+NrZ+1Tbdaudh/DO3y1+Pj78dITU15LjVGhapNCr3ZqqfZ+BFK
	+A6gjd9xMmgWb5ELJMwPv3wM1dW7wKlSy36QIbm0+t4dp3sMp6V6tte8HsbwlvkhJDsXrXDhDAl
	k8ZgqFDWV6EqiutwqnMVn39ktnrtyy7ZVHfsXZOUCO0YV3Mx5M6+2QeZ/oY2sVbhB2tFTaqtBXG
	HD05W/vXZAgshfqyl03C0TQhACWphiRFK8gll5WFA9YZC2239hh8JYKSMZ6rLpqunOGbQcTv1S3
	L6oOncv33XvZfFjhT8tli1gVCse3R6Iy0YYiESPttKd2ToPGCzC95HV7tari
X-Google-Smtp-Source: AGHT+IH3ohWO7pIpISVRUOg86dB+d3u7wuqvqfs1zIOJtATPWfLMTQwdLJSdOdM1Akm5FylcMs2HRw==
X-Received: by 2002:a05:6830:3707:b0:71d:ffa2:d34d with SMTP id 46e09a7af769-726567938aemr7083326a34.16.1738287601815;
        Thu, 30 Jan 2025 17:40:01 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726618b9f49sm659875a34.54.2025.01.30.17.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:40:00 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 06/11] python3-blinker: update recipe to use the ptest-python-pytest class
Date: Fri, 31 Jan 2025 01:39:30 +0000
Message-Id: <20250131013935.3714521-6-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131013935.3714521-1-derek@asterius.io>
References: <20250131013935.3714521-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 01:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115183

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-blinker/run-ptest               |  3 ---
 .../python/python3-blinker_1.9.0.bb                | 14 +-------------
 2 files changed, 1 insertion(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-blinker/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-blinker/run-ptest b/meta-python/recipes-devtools/python/python3-blinker/run-ptest
deleted file mode 100644
index 69cd362f69..0000000000
--- a/meta-python/recipes-devtools/python/python3-blinker/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh 
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.9.0.bb b/meta-python/recipes-devtools/python/python3-blinker_1.9.0.bb
index 33263ce6b3..2ee8133fbb 100644
--- a/meta-python/recipes-devtools/python/python3-blinker_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-blinker_1.9.0.bb
@@ -4,20 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=42cd19c88fc13d1307a4efd64ee90e4e"
 
 SRC_URI[sha256sum] = "b4ce2265a7abece45e7cc896e98dbebe6cead56bcf805a3d23136d145f5445bf"
 
-inherit pypi python_setuptools_build_meta ptest
-
-SRC_URI += "file://run-ptest"
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN} += "\
         python3-asyncio \
 "
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.34.1


