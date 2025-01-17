Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB82C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 22:59:29 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.814.1737154762291583878
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 14:59:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-844eac51429so199459339f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 14:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737154760; x=1737759560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IG6PTl0d3sB/e0S1PhLKBosg9y7xuu195u2RIqxNYo=;
        b=PuscsaEYgSf4D1fjqFyu5WQGRyFV+/P3MgC1qXFkbIOQovalS2xtV4cc24EPEBwR/V
         TD1IHSXA+q/FED9C+QXBypguqhAwziRl9TDgHImFaLrdr3YNWAA0rO4ebm8yhGaRVJej
         dORXSNOx0v9NDf77aRSqHU/x4vU/mHN9hvd7zqQQ6yCsopTHFb8El3xgw+oS8uBzflVq
         Gihk3m4HRdu18LtDz8hE8EZDJB9NcqFkA0j12hG9rTsdRKwqHcseJ81iwAqCCJNpXzOf
         OWWzPM8+d7HAYsPQ6HgOeX5ZDE+O7EdDlrmv4t+gj1SZUfGqJ7c611oHvDO/FxKjgdm+
         MeUQ==
X-Gm-Message-State: AOJu0Yy01ddqkWZa9gcu7FkP7juOagNQZspvbuTmowMefMA2hNl8QzEs
	IPDXLGMLu+p5OHFRVFyh7VxdtoSwGlK/kbz52ocCz44kipPlMxA6pkKugw==
X-Gm-Gg: ASbGnctBQ5BtAwibHvnCNEGseCWIHxpT3Z+FxTsdylkU4GO7je3r2/MQ49J9mKCecxT
	kkUjf8V4c3Il86V7A+sClnXgrofXpDrwZTJR8yImAAO+w9M/QsME5nhmSCnMOhZnkWzIkkWm6pr
	iIE1OIzDQchA2xsf6QySB0NA4lwx/zu+m4riedv4VsylvUn9Au4+tbkDNUEimKh1vpnApeiVPzW
	mFRJBSEm51aMJi2FJugJ+UKmn+NgIHrnGfAf5SSe2PtgIM1d/0Mu1k5hTwgOTGbHtHSP28C26/y
	vclaceOsIIlnYxeiSC4RqIuWweBInccHxx0rhpE=
X-Google-Smtp-Source: AGHT+IFMPkwB/RwVD5AZxwbBiva1r0uoBtRYov0Q9LUjhX9OAmebglldOBbv4n2kVGnhJSpWvv2SRw==
X-Received: by 2002:a05:6602:4899:b0:84f:2929:5ee0 with SMTP id ca18e2360f4ac-851b64f4bd9mr394742239f.10.1737154760651;
        Fri, 17 Jan 2025 14:59:20 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea7564943asm865259173.95.2025.01.17.14.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 14:59:20 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 4/4] python3-pillow: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 22:59:02 +0000
Message-Id: <20250117225902.4103075-4-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117225902.4103075-1-derek@asterius.io>
References: <20250117225902.4103075-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 22:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114947

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-pillow/run-ptest |  3 ---
 .../recipes-devtools/python/python3-pillow_11.1.0.bb | 12 +++---------
 2 files changed, 3 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pillow/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pillow/run-ptest b/meta-python/recipes-devtools/python/python3-pillow/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-pillow/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pillow_11.1.0.bb b/meta-python/recipes-devtools/python/python3-pillow_11.1.0.bb
index 7be15f3f9..f8341c90f 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_11.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_11.1.0.bb
@@ -7,11 +7,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a1b708da743e3fc0e5c35e92daac0bf8"
 
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
            file://0001-support-cross-compiling.patch \
-           file://run-ptest \
            "
 SRCREV = "4c1aed801e43c6b307e7135279ca1dbc02bbf052"
 
-inherit python_setuptools_build_meta ptest
+inherit python_setuptools_build_meta ptest-python-pytest
+
+PTEST_PYTEST_DIR = "Tests"
 
 PEP517_BUILD_OPTS += " \
     -C platform-guessing=disable \
@@ -51,10 +52,8 @@ RDEPENDS:${PN}-ptest += " \
     python3-core \
     python3-image \
     python3-mmap \
-    python3-pytest \
     python3-pytest-timeout \
     python3-resource \
-    python3-unittest-automake-output \
     python3-unixadmin\
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'tk', '', d)} \
 "
@@ -65,9 +64,4 @@ S = "${WORKDIR}/git"
 
 RPROVIDES:${PN} += "python3-imaging"
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/Tests
-    cp -rf ${S}/Tests ${D}${PTEST_PATH}/
-}
-
 BBCLASSEXTEND = "native"
-- 
2.34.1


