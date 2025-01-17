Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF5AC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 20:30:52 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.4853.1737145852333408169
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 12:30:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-844e61f3902so200382539f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 12:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737145851; x=1737750651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4n7Z+iX8Kp8KcU1yHzM1zHLUakm7KO5SFj7lcxgKjxY=;
        b=LgLLqTQLpGZHl9Bs3lZWLZ9+RSBiqSnewng1j98dyEdlQUaSBGm0SmQMK6dwZ2+HPL
         Sf2FoxUg0+c5z/QS9I06IOuASv0+xE77IH5lhZWYblRgb3tTIeJ7djgZ0j+ZzuW9pH0a
         zWqwpdzNjngaxaXgfVF7nQ397Np+rkAotMcLqwqje+Z4+E8qfprAj3aCyVd7ilJwFvMC
         okStIUvMmXxca96QMarO9o8S/vzTnbW7RrWCssKPkb31N4LeXlVcMKVZkDrueebR6s0U
         CWnNDmibWEBBB6225zxwkpfIBAnsrt1h8umueaGwnlfp8jTwvpS+hmeAEBX4nGU0e9wY
         suzw==
X-Gm-Message-State: AOJu0YyaMjdVT2UgfxNsoPUGAkhOhZprdZa+rvgvmQgfQhZv/U1JDjnU
	X9A+dzXbFiqBTda5sapGUtxsvBeOEPBfP/ifjIsMRfW55nXFCQ1YkgM5bw==
X-Gm-Gg: ASbGncu2GBS8NWFtvJBw4bRybIOn9m8XX9OsxnxrK/toH2bhbI/4RxNrjobpF+PS1ee
	llZGAjbl7Kweekgq4HSXGcGUAlo3WMh72huqfVihew/caNV1WRXFWrUsVDBqzzQzcLQ9+RvEbvW
	8z+/jCBCWsqZ5SK5rIou4Ki7PiwiZrsetaRYafx2MS8215crxRJovFdBhDxvbY35ycB7IpP4bvz
	mqr07rYuiafYlabuS8rn13kq9VTtjwjX7FJjHFAXJRjaj1HYr7hUSEYZeSsPwx2Qy/6+DU7+jOK
	Pzkvp4bK0auLdxmNlallsDolFg==
X-Google-Smtp-Source: AGHT+IHs8D12LeKcqUKORakI+fQtDHqSvQOcufaEt/aAylFF4srIEQlgJbH/swOfgjNePSmc4EaT9w==
X-Received: by 2002:a05:6602:27cb:b0:847:51e2:eb0 with SMTP id ca18e2360f4ac-851b62afe94mr338853639f.12.1737145850738;
        Fri, 17 Jan 2025 12:30:50 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea7566e687sm801814173.128.2025.01.17.12.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 12:30:49 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 08/10] python3-prettytable: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 20:30:28 +0000
Message-Id: <20250117203030.3648575-8-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117203030.3648575-1-derek@asterius.io>
References: <20250117203030.3648575-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 20:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114941

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-prettytable/run-ptest            |  3 ---
 .../python/python3-prettytable_3.12.0.bb            | 13 ++-----------
 2 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-prettytable/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-prettytable/run-ptest b/meta-python/recipes-devtools/python/python3-prettytable/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-prettytable/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.12.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.12.0.bb
index 442aadda2..007c0bffa 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.12.0.bb
@@ -5,10 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c9a6829fcd174d9535b46211917c7671"
 
 
 SRC_URI[sha256sum] = "f04b3e1ba35747ac86e96ec33e3bb9748ce08e254dc2a1c6253945901beec804"
-SRC_URI += " \
-	file://run-ptest \
-"
-inherit pypi ptest python_hatchling
+
+inherit pypi ptest-python-pytest  python_hatchling
 
 do_install:append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
@@ -31,15 +29,8 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
     python3-pytest-lazy-fixtures \
     python3-sqlite3 \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-     install -d ${D}${PTEST_PATH}/tests
-     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


