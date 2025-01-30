Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CF3C0218D
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:36 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.6259.1738274308090337980
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-854a68f5aeeso20850039f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274306; x=1738879106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9J/5jbhTj26g1JxYi70N3MFkEqtOH8jIbLfkkMTYs4E=;
        b=vSdSe9A6DF3Z7z2A2W9zHtvktpRoWV4hKcDj/9e2/xO8DDcpVTswIvJRyVM+2KPYQ6
         hhZgR4qDYACJHCYH3G70LbCeiaDx39d8MR9uBDXcztuobqH0WRyhUOWe7emYgE3S790v
         XCkEgOL4FYHk65x0P6AprkfQ/+QB5uDodmyuMb9q0GxaGTPWqS50Dhoyf/ACPc+u3B/e
         oPnuQL6vOhBnGGPCBJ5JInh4vB1Cnhedk80pHQ5FUSjBvYz9WN+maWF5WmM6IuaUt2J3
         wQyYdVYsk2XJ2+WW+SU+20MAfiFmh7Ca5RYFt+6D0LjDbMb1zp63HNI6RvSqOGLSSdrc
         qAIg==
X-Gm-Message-State: AOJu0Yyjk9G6JyGqCj2VCluTb5nwu1yehX3xsZg4CeQM+r7lI3BNP6S/
	B6ncLiy6jBZ7afNCdFB06Lmdy/mugMXIylCvF5KKqKSzHR6/xtKt4BgCd1l/2mY=
X-Gm-Gg: ASbGnctXoM55X0EJOR8K2s2V/GWgNV1NgxLvTbkWi+75fmHIwmefzmR771qZN5ARiX8
	ZaMOC8x5h23PTISpo8+QXuINdYtQycjnr5OZDRmqLLxlkilk3AGFXq3bgwFMuuOv/OPXj8/uIXk
	zja1HIcHNjZOgMKEYdIYOJEVDDnfKNmsOrcB4HPmMcaoJ0TEfZGAMCOG4YlH3IthFMkxy9NYiNZ
	+2SEnfpHol6oG/zBWdnCyAkuyscxRHeH37p2QH7Rn78XQzwgvVd+ShgMgFvUsPKbN2QIuF4gHDb
	LRMAXQaf6Df/yqPILv+wr30mwTg7AxPQ2IjwXeKVvQCFrPiyWRcCh+2gpMLc
X-Google-Smtp-Source: AGHT+IEmKOHy3bcqkjDoB2WpzB9pyGtj0jLSth4rLWoKs28lPEhnqQtaiSDAdOjRZvopzENZV2TUjQ==
X-Received: by 2002:a05:6e02:1f8a:b0:3cf:fd90:946a with SMTP id e9e14a558f8ab-3cffe445baamr76201455ab.10.1738274306446;
        Thu, 30 Jan 2025 13:58:26 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:25 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 19/23] python3-flask: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:34 +0000
Message-Id: <20250130215738.3280576-19-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115173

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-flask/run-ptest  |  3 ---
 .../recipes-devtools/python/python3-flask_3.1.0.bb   | 12 +-----------
 2 files changed, 1 insertion(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-flask/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-flask/run-ptest b/meta-python/recipes-devtools/python/python3-flask/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-flask/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb b/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
index 9b10089c9e..4d1d2d12e6 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
@@ -8,11 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
 SRC_URI[sha256sum] = "5f873c5184c897c8d9d1b05df1e3d01b14910ce69607a117bd3277098a5836ac"
 
-SRC_URI += " \
-        file://run-ptest \
-"
-
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 CLEANBROKEN = "1"
 
@@ -27,10 +23,4 @@ RDEPENDS:${PN} = " \
 
 RDEPENDS:${PN}-ptest += "\
     python3-asgiref \
-    python3-pytest \
-    python3-unittest-automake-output \
 "
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.34.1


