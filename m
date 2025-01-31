Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01844C0218A
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 01:39:57 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.10522.1738287595794891188
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 17:39:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: straka.derek@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5fa2a2bdde9so370914eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 17:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738287594; x=1738892394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VvmGb1zDqUZtnXPjJtWmBq569N0bCI5nobBlmuofCg=;
        b=YzxPZ7XpTMM7G2ttW6fFT1WLQ+TRVashFeQknIZXcaKNS/VDFXzSXbkAimDMAt5u7A
         CMaaO/x95Yy8sLf/kyQo6SjT4+84nHY7Bgboii8j7g1IvziXvNlm996bOFA35srZ0r74
         lbZrV6xKAVOer3z0kDTR+A0AOZ16qdlj1iVadNM8+nf7ccYP5MMvcdtks8BCSGmNI8PF
         xw2V9T6Mpnta6lC0qhv3YHVeHBexXLSloJNV1NC60BEHz2GCUO5tWVh1IahxBAhi+byz
         3p+rAyEZ556KNqIC2Aw6AbmJnj0E7ssUpT+rfLSV3HUDqlw9rJjXWvhlAd4+tRpUDgP0
         14qw==
X-Gm-Message-State: AOJu0Yz48Dh2qtDeZ4V4AIYT+YZWw9tKfN78z4UAFmIjaz1IYfKVJvss
	CUaYOvbQ008YyCQ5SMTTqpqOQgTiih6FqhPVqeX3LsSql04OQRDZH2xmCgnZ
X-Gm-Gg: ASbGncvicxper2RJ7lAJqG++nR3TPcxS84kJpDP9x/VB/wDVD43hbqtAWglRkj31N1A
	uONm8jir116UEkAQqdTETgSgVCGAbX6wVg2hU2hhY3z0nMraaNtdt8FA7xPCyW01ajpC1sTnrEf
	51a8sUEdeSFcnwSAMT4lwEHhhYewPVA9zGDxOJVMpLzqriOzCKG8S/xRwOWhYjJxFvbYeaSQG28
	G+DmRxGNCMMKbQrT58mjPbIX4h9TSOLa5hCI9BF7/yYIqeoNZ/++uwJmoLpHL8D9wEQF/eGret8
	6tgncKsQ8KDnSKkV8YHKdcu87H+RzwRg/cXOjOqxi8+0CpxT8qkB/TzEOgfN
X-Google-Smtp-Source: AGHT+IFY7vL9RYvpUpgIY91dh59XXp6PKNgDcDkBuk/wPnr8Zs2wG6dfNNXr7Dfwhta7r4NVXgZuWg==
X-Received: by 2002:a05:6820:1514:b0:5fa:67a9:8593 with SMTP id 006d021491bc7-5fc00226ac4mr6876154eaf.2.1738287593996;
        Thu, 30 Jan 2025 17:39:53 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726618b9f49sm659875a34.54.2025.01.30.17.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:39:52 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 02/11] python3-bleak: update recipe to use the ptest-python-pytest class
Date: Fri, 31 Jan 2025 01:39:26 +0000
Message-Id: <20250131013935.3714521-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131013935.3714521-1-derek@asterius.io>
References: <20250131013935.3714521-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 01:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115179

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-bleak/run-ptest |  3 ---
 .../recipes-devtools/python/python3-bleak_0.22.3.bb | 13 +------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-bleak/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-bleak/run-ptest b/meta-python/recipes-devtools/python/python3-bleak/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-bleak/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb b/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
index c0150c7901..47b3bcc62f 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
@@ -6,25 +6,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 SRCREV = "2e6890f68f6718b4f92e602b9b926aa3d107b556"
 PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop"
 
-inherit pypi python_poetry_core ptest
+inherit pypi python_poetry_core ptest-python-pytest
 
 S = "${WORKDIR}/git"
 
-SRC_URI += " \
-	file://run-ptest \
-"
-
 RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
 	python3-pytest-asyncio \
-	python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN} += " \
 	python3-core (>3.8) \
 	python3-dbus-fast \
-- 
2.34.1


