Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D63EC02194
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:16 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.6248.1738274293030982390
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-854a68f5afcso18996139f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274292; x=1738879092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MRGwjN2LIzyZkm44eOvYi1krDO7+3WMhpLRX1vSWT4=;
        b=qfTg6lZ0A2koNHfBhLzAcWJtNMOl1AFFOyR7/FrVW+La7Q+NVdhc1v3a64m0dWgnP3
         aHBrMeRgANXD6STVITTIIjsAotMcLTop4YVfcAVvxA5HtS4HpWck4tpme3fphFZkzVCp
         21dyrk2OFVsdZ2xngM7UFijanKAif5Z6aKgHTPhDqvaIwjjbivSnpc8Ym4cvFIbXUwbg
         q6KawtmiTHbtSO1pEww5FtmxgRlbiSRq5ESB4uanGUpyIpiwVQ0qDCtFtWh6of8Mk0xQ
         /+UrxIBSaZo6P89E3+gbGaErXtXh2TVrHKfE2cCsT0Xk1dR94LEl+mOnUrNnmQJRMXZh
         E7lA==
X-Gm-Message-State: AOJu0YzxwEaNn9+iAJFyS7A2gpKDdITQ+z2JgKEyTVS9uavrXpNuHdBA
	fN8zQM/ByAl2uU+rixkU6Gok0yxgUjdO1/oucJHEnPH2wBenT4lmOeaDS+vTdTw=
X-Gm-Gg: ASbGncs14ljMXrlZ7xz4J9XMpp3zyuI9yynqxtqM0nwFxUTfuWN+37tqmPdPxIUXj/H
	R0YL1I3GLt241PPfaPkuIz53wmo4bbACvxFR5ydcLqcEtAxOHfEr97bJ2a2pZNxh8IjCSje8WW6
	TkrexV8BPaRcQWLOAyT0Bp4fxR+v7hwxrhRFcViBK/KR/oyKg/fs6hMz8tDan7vrH6DSMmbb3Ok
	h0oyzOS1S6/TO7nCJczm/AAtUkyqU2joEcvl6x01yeddcue5FFCoSojqQuDY0HS4f3Q/J2qox3E
	JqR2uDqW5ampHFYh+g1f8AX2VRU8JFzuM3wmXy5eudvIYwDSTh6kmGG0ZUlb
X-Google-Smtp-Source: AGHT+IEvbqe8NHQ0grj+U0GQGylkp+lUuGxwmG6ZVCm7hS2Fns/QuTXw3A2HFAIn6bX4iciw1OCf6Q==
X-Received: by 2002:a05:6602:2b84:b0:837:7f1a:40af with SMTP id ca18e2360f4ac-85439fbc891mr802317639f.14.1738274291847;
        Thu, 30 Jan 2025 13:58:11 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:10 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 07/23] python3-marshmallow: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:22 +0000
Message-Id: <20250130215738.3280576-7-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115161

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-marshmallow/run-ptest           |  3 ---
 .../python/python3-marshmallow_3.26.0.bb           | 14 +++-----------
 2 files changed, 3 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-marshmallow/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow/run-ptest b/meta-python/recipes-devtools/python/python3-marshmallow/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-marshmallow/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.26.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.26.0.bb
index a421a93e4c..bde3819379 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.26.0.bb
@@ -8,25 +8,17 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI[sha256sum] = "eb36762a1cc76d7abf831e18a3a1b26d3d481bbc74581b8e532a3d3a8115e1cb"
 
-inherit python_flit_core pypi ptest
-
-SRC_URI += " \
-        file://run-ptest \
-"
+inherit python_flit_core pypi ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += " \
-        python3-pytest \
         python3-pytz \
         python3-simplejson \
-        python3-unittest-automake-output \
         python3-zoneinfo \
         python3-tzdata \
 "
 
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/tests
-        rm -rf ${S}/tests/mypy_test_cases
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+do_install_ptest:append () {
+        rm -rf ${D}${PTEST_PATH}/tests/mypy_test_cases
 }
 
 RDEPENDS:${PN} += " \
-- 
2.34.1


