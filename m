Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6C8E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:09:21 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.688.1736539751904843627
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-844eac51429so168932039f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539751; x=1737144551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMjHOmi/zGlBxKTtFO7OXxHOsDRvG2YcgbP+NOZxWZE=;
        b=aXxRTtzQ6XKHSplpTswjIYkvhaNkNTablw80WPT97EvUGV8qhev7aNTgVXm9wTJa9B
         vNf3kstEK3Rkj4kuYLHmGIlFnIDVH/ypRDsZQ8uMarqOBzdC1z/rJznmDuy/LEKtzstb
         RNAAILcRuac3qER09pMP0WOMgsJelmCS7TCAkdYvGjghu+/KdgDVdO4bbV3oIJ57qWq4
         K7DKBkorCANJkV1MXFzZ7UJ5yjw+aGzSWffNrRLX3EFhhrnXvjZQE3nIX/5RypuoQBXW
         eWcHEaSb4QLX8bQXwHI0sN1G0R9EVl3aCxERbkIkxQVk47G6VZ5mLg6qcZ3uaMDf9ROi
         WjiA==
X-Gm-Message-State: AOJu0Yxeh4KcfVaz1EgAR9zjS7ujx3X5oJBg2AxZde/XRGMHyJ09/R67
	5RfG/TCAOWyUp06ASYv5c7ewVES43U1K0lMN0NfKYc1w33IVPWT1CkXuGw==
X-Gm-Gg: ASbGncspi3twZlCZ1X2a80nShV6VPLpIOa0uqpyByP7Je8o2/cdpp9S2Gu87lY5pp0V
	WYwadNRD2ejum79203KrSci4/glXDQndV1JozX6bm892lmvuF91sLUu0opoX8+TWBtYTt+qZUEB
	SACY3L5WdMvEow+i4zHOaZyAYSNymyto+hNARcHejlUi/b2nVrMOI5F3TmLdbqc9+N4BOekUBm5
	kv7F6qUvX13lL40O6wNFddMt8z8ZBnje5yd7AZikyPTmIo5E5rSf3E2JGpsupfXNDNpvaB+mk5P
	aoIh/z03L4JebiIy3a1PXrEHVQ==
X-Google-Smtp-Source: AGHT+IGYPHtj1y1jsAiftjl6PGAgJO8kJ9AruNLQ/OVWnOgBJT8gwgJQ2zKCh9FUejhcghQ61HeLgA==
X-Received: by 2002:a05:6602:36c8:b0:841:95b5:8953 with SMTP id ca18e2360f4ac-84ce018cbf3mr1186884539f.14.1736539750726;
        Fri, 10 Jan 2025 12:09:10 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fc84dasm104467139f.46.2025.01.10.12.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:09:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 07/13] python3-uritemplate: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:08:16 +0000
Message-Id: <20250110200822.3958062-7-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110200822.3958062-1-derek@asterius.io>
References: <20250110200822.3958062-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114797

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-uritemplate/run-ptest         |  3 ---
 .../python/python3-uritemplate_4.1.1.bb          | 16 +---------------
 2 files changed, 1 insertion(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-uritemplate/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-uritemplate/run-ptest b/meta-python/recipes-devtools/python/python3-uritemplate/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-uritemplate/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb b/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb
index e741b6268..77a52fa58 100644
--- a/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb
@@ -7,20 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0f6d769bdcfacac3c1a1ffa568937fe0"
 
 SRC_URI[sha256sum] = "4346edfc5c3b79f694bccd6d6099a322bbeb628dbf2cd86eea55a456ce5124f0"
 
-inherit pypi setuptools3 ptest
-
-SRC_URI += " \
-        file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-       python3-pytest \
-       python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-      install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
+inherit pypi setuptools3 ptest-python-pytest
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


