Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99D1C44506
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 13:09:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8823.1783602567560184681
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2026 06:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rksXqTd3;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so19454145e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 06:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783602566; x=1784207366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkHwzBmzw4mPCh2IQuMwKMbtjrJrsiINyo5R1ymKcWc=;
        b=rksXqTd3LO74emnUOEa6E1JJnCY5gAkrzhZwJO/5AfAB2UBhAE4+Eg613kQZQQCACD
         H1WNFM/pYuxkSwOSz7lSD+FSu1/6aELVdu8xK5PqrOJguCP42MDfHnTrG5LlP89AeUF4
         QnfsChayeqICHSceY0x9YwLUsXRVP61unPrSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602566; x=1784207366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fkHwzBmzw4mPCh2IQuMwKMbtjrJrsiINyo5R1ymKcWc=;
        b=K4bWWW5uBC7+oXWfpjF9SZN04dD3ygHgDuV/n7VZMdEnjOZVFIH55iSMkRJmbTgS4s
         v1golDGdDDRhFIG256446misXpqhr9EZh8oN1sFTMbsyKqpsXW8cFEucI964xZB0nUsS
         N+JbDf0W0mT7myO8gFZOvfI/6Dzhu+51MFbDl/l7tgK/shTlMU0SUS/ct5ROvhzjKn/c
         PR/snnNCjeG8rYgoWdqoTsiAkjvj0r50i5gzES9AeueXjmzOLzT9DAHt4KN2TDSfOecj
         VuyiXNKdeO3dH1GWw1UjMFfYZcgQnjnUgMwO65fSRnAuWXkKbtds25sWiqoeEFVmPvAT
         4BkA==
X-Gm-Message-State: AOJu0Yy/G/JKmIjGA3sZ9FnNb0wJq0CYSPyIc9x9y579l9ApWWUWBc8M
	CfFPryto+Xj/f7DIo7M4ZBxZagzGikl+gn60jNqWDuOWk+UnidPQiXPkpTqZ+m/PXnsM3R68jDh
	jtcWw
X-Gm-Gg: AfdE7cmIDbl2VHkRbFG4udrfx35zsnIzblLR/QzTf/tyVCO+uspdN3ZI8e69l8zhJ0h
	2dJyUx/5aRanfwXVTr1GYdFRRUHAXQKGg4+taVJLPxNV1ZBQBOMiPYq99HuxBFhPZD1uHQORW5f
	BGTosf1g+uNsdxxBHhcyL9ZZhE32Rnnw1ruTRktS9ZvBnWtINaeoSHDmjUJpDIrS1oUagrJfoy1
	LKpHpdoYGAMGI8NVK1ubXmuTmFWes6ajej3w2TsVId0wWWZA6gGLbku5vH8sFj9aRPJSjj72FyC
	BHatFpb5VBXh210sJ0aqj4b6AiJmgsEkBLOOys1nA9ObiglCiZ/qYCDrWmNwTk/gBli4710b13H
	iazHRGB/vVIfZQ65GZlcoRk1pAYZufnqLOGt0JWY7lwH0kP1t2QzYPhETJRbGpxZIUlumCC6Yc6
	KfNZAiwOny95MzCw9Oqa0B27PCbP14e6YnQCV9lmRmNcxeQ05EP0ocBtFMdJ89Xjvc7hK8sGMVx
	7Sg5VvMmrMVeMwkVvAO2q/rtt8UAJdJhp89U2EiTjcu/4RCBWX/
X-Received: by 2002:a05:600c:1d0f:b0:493:cfd2:cd06 with SMTP id 5b1f17b1804b1-493e68b8007mr71713965e9.6.1783602565735;
        Thu, 09 Jul 2026 06:09:25 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6cccfdsm61032835e9.1.2026.07.09.06.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:09:25 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-olefile: Enable tests
Date: Thu,  9 Jul 2026 16:09:18 +0300
Message-ID: <20260709130921.4185087-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260709130921.4185087-1-leon.anavi@konsulko.com>
References: <20260709130921.4185087-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 13:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128122

Inherit ptest and include tests for olefile.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-olefile/run-ptest            |  3 +++
 .../python/python3-olefile_0.47.bb              | 17 +++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-olefile/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-olefile/run-ptest b/meta-python/recipes-devtools/python/python3-olefile/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-olefile/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-olefile_0.47.bb b/meta-python/recipes-devtools/python/python3-olefile_0.47.bb
index bb6fa7a8cc..c5f72d12eb 100644
--- a/meta-python/recipes-devtools/python/python3-olefile_0.47.bb
+++ b/meta-python/recipes-devtools/python/python3-olefile_0.47.bb
@@ -3,11 +3,12 @@ HOMEPAGE = "https://github.com/decalage2/olefile"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f18814bd70fd28e11a4545145dcb3822"
 
+SRC_URI += "file://run-ptest"
+
 SRC_URI[sha256sum] = "599383381a0bf3dfbd932ca0ca6515acd174ed48870cbf7fee123d698c192c1c"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
-PYPI_PACKAGE = "olefile"
 PYPI_PACKAGE_EXT = "zip"
 
 RDEPENDS:${PN} += "\
@@ -15,3 +16,15 @@ RDEPENDS:${PN} += "\
     python3-datetime \
     python3-logging \
 "
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-core \
+    python3-unittest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.47.3


