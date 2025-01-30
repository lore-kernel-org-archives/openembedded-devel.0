Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB697C02199
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:26 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.6247.1738274291766454292
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3ce886a2d5bso10919355ab.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274290; x=1738879090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTXwuDijxZponVPdZ1WN060ztaTiN6sFtxOurMRhAbQ=;
        b=B++6goP9lrivz9SkCiP47LQoB7KL5xwF9I1ZKLpqHWl7i0MHF665kTD4ReDcPurr83
         El4xiwizC5D7nufaQQ4/Pv1AdeybMNdP46I4URUnOiOz3wN/HMyZMZ/2VZDc9MNE6kMw
         Mz5OZ1nSUSS1z14Gkrttdhh0Ne3DAvNC0nHSM4MEAxLAIgyO/V1/WpH6qOy4KLeH2z6I
         ShfpeOCGNQGiIXWDNLBboQpAV+wwcy2Tdlv1/1hCMTBf277y7pq/tJcR9ATwNascAK8F
         h1KgrW+eU12FbAxtc5XyCTvtYn4RZvRcgfUjdjesXmPOvjkFdpgX1lmdcENkJX7NUcgi
         JhIA==
X-Gm-Message-State: AOJu0YyEVxxoqDii83FxzcHZRJJRw/bNi2xk/SMsLH/+Sx+U1d3j/VFe
	bh3FExxcJY1KedRcoZ6WyxNphpAWdR7fXKvLxbOr+EMxQjvYoG8gZfjkxzbIq5Q=
X-Gm-Gg: ASbGncvYhiP4p8fPm/z6ORd/KV/gI7fR37STQ5HyY0VsxutxYNl1JYrSC+3xphSuaJM
	kUwJZsJ9ZpF0TmGqNtivgMlOWu6vRuIcIDzRJxUyV6e+3pS0CL05kpecnr7lPx6VZb6KaHlBqYi
	mhxMan8nbxIDSKcnN/IW22/ILc33G2wg/8agSmEfVz2A4HWIcMp+5zgGUZD05bVlL+UiEHeE4az
	RorSJVcMaEnUKTGz9Mnisgu4SBJQ8MrUd0qRvJUY4XDgQqfAinRpaYKEYaeT1yv38M/E/5zVTbr
	FBQRWeRCkzIKchXlR9JR5H9jNrEY2UfqeY9XgwhzX6trfuIynaV3lYN4GcvP
X-Google-Smtp-Source: AGHT+IEz6XljvGzvzL6ChXKIIIcuxVqAHwKuKgwEuRrJvZow5ofwp8NkNCwK5392XGq0p181XsPkyQ==
X-Received: by 2002:a05:6602:134c:b0:849:d268:d75 with SMTP id ca18e2360f4ac-85439f89e05mr881006539f.9.1738274290167;
        Thu, 30 Jan 2025 13:58:10 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 06/23] python3-multidict: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:21 +0000
Message-Id: <20250130215738.3280576-6-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115160

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-multidict/run-ptest              |  2 --
 .../python/python3-multidict_6.1.0.bb               | 13 +------------
 2 files changed, 1 insertion(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-multidict/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-multidict/run-ptest b/meta-python/recipes-devtools/python/python3-multidict/run-ptest
deleted file mode 100644
index d74acaf564..0000000000
--- a/meta-python/recipes-devtools/python/python3-multidict/run-ptest
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb b/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
index 1132e9ba5d..ed49b8ff02 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/multidict/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b4fef6e4b0828c2401fb983363985b39"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PV .= "+git"
 
@@ -12,19 +12,8 @@ SRCREV = "4140e63780dc6dd600a1837cb9b4c5198c3dcd68"
 PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-SRC_URI += " \
-	file://run-ptest \
-"
-
 RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
     python3-pytest-cov \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


