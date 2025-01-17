Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F10C0218A
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 22:59:29 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.810.1737154759778983002
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 14:59:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-844d555491eso80769639f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 14:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737154758; x=1737759558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cdaUX7lv9Q9BDPQPpBtOBTZ9obPgVMuGLqQiLH3epU=;
        b=aL2goklVWDOUJ9vOdVeLAuR5434+dQtacqPwyS6VraWK/iGwfxlJQJAy4I+oq+GB8U
         ERon4GDMelpsJnzgc2BTg6L8XtQYyyZNWS50WzpkzMq7aIyjYJ9m60z0bDNkyTOOHWVj
         d5hXHZCjsR8PaFcGi9qa1sM2J0RaU57ugO1hI2ROqsjzccS2dPsa30JiDuuzRsrOgmg/
         ig70bYwPbMUMmOyeYAyHchzOf3xb4hcnBf9ENZc4gwLdN6im+ccUwpIfn4ANAsMQZ6Ko
         5yAXBwZsc/2vRceB+1OaTKKa5qSm+llNXdUFhXAoDfiz0jIM1s4hvOOFNp9iI+VWDMSS
         oJYA==
X-Gm-Message-State: AOJu0Yynpb7XgH7NYHC7VIeFrTJtBWjGaf+6+tHLs/0uywCvSe30VwwE
	0Uyfzrh++LLoIXVLkaFK9KGnj7KXjGpjyJtwEtXbvqtW6qHJeRyDV83dNA==
X-Gm-Gg: ASbGnctX+YL4IktyrGocAehU9EMRTZLdCioq7KkL6/CpTKUTZdEYkBN4WParwsRHAmI
	QYJiQ3teveZkWhMMhBCY5Z48nHxnDTcG5N06aNjcp7xRx0jwQG7BwOXg8t1Tv/SIxvik6746Uky
	b1x/N8QQKuZqNMF5lQ56Y+1RqEwOwr77eg/k1KwKn7qUlSQCXShpfgCP6GqAFk5AawlS4rvor+6
	b6/patRZ0xhcGgETxdfKSPVg9LWBbq4UmxstZMaMCbeBILgv1jb44n4g9cvv5uFVVasQZdnfzJx
	Im0+c2B2K2NVtAYccK+E4ttw1Q==
X-Google-Smtp-Source: AGHT+IFtuwuSjda38nf4HOWlQzqhDB4uA5bl2htBd15tZwSO8Q6Qbhn++h4fjEzV86mKmwPVS2HzSQ==
X-Received: by 2002:a05:6e02:2383:b0:3a7:be5e:e22d with SMTP id e9e14a558f8ab-3cf743c99c4mr40801745ab.2.1737154758088;
        Fri, 17 Jan 2025 14:59:18 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea7564943asm865259173.95.2025.01.17.14.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 14:59:17 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 2/4] python3-platformdirs: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 22:59:00 +0000
Message-Id: <20250117225902.4103075-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117225902.4103075-1-derek@asterius.io>
References: <20250117225902.4103075-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 22:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114945

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-platformdirs/run-ptest           |  3 ---
 .../python/python3-platformdirs_4.3.6.bb            | 13 +------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-platformdirs/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.3.6.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.3.6.bb
index 02d8c3cec..c85e12ab5 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.3.6.bb
@@ -3,13 +3,9 @@ HOMEPAGE = "https://github.com/platformdirs/platformdirs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a"
 
-SRC_URI += " \
-    file://run-ptest \
-"
-
 SRC_URI[sha256sum] = "357fb2acbc885b0419afd3ce3ed34564c13c9b95c89360cd9563f73aa5e2b907"
 
-inherit pypi python_hatchling ptest
+inherit pypi python_hatchling ptest-python-pytest
 
 DEPENDS += " \
     python3-hatch-vcs-native \
@@ -18,15 +14,8 @@ DEPENDS += " \
 RDEPENDS:${PN}-ptest += " \
     python3-appdirs \
     python3-covdefaults \
-    python3-pytest \
     python3-pytest-cov \
     python3-pytest-mock \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}
-        cp -rf ${S}/tests ${D}${PTEST_PATH}/
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


