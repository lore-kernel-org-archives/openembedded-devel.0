Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033ADC02190
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 01:39:57 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.10322.1738287596993162894
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 17:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-71e2764aa46so945799a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 17:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738287596; x=1738892396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4qfGrtBSb5oHonG1zkYyC7JBeVBM+yQwCja2fcF1FI=;
        b=nl88pSvg6LxLt/7lv8WcqnMzdJVFHBWNAyGRIHbxgYV4tgOqTaAYhFCpnfhDlGMlN/
         IbolRxD+dXUKerzgcQnFUL1B6y/MUYhcEj+3GeY+ReFMS084ZUtlRIkWZczrdFUlw2AK
         rZNVYxlakN16L2VpwOfzqdcKSX2NVv0vM1upyRz2W8SUex0ufoozod1d+fVidCxVe150
         Vsd6YG0fTFD4WiEmqCkyTGOGF6PymkqnaVjNgOKX16muU/gDnis7Xfy35JKCl30f5ZJi
         OeXG6nr/lAly7oAwmQNx/Slpxnv12wxSyi1Bxz47Ukqvnhr0NafEcC+DVw7pZJuUzbAM
         EmsA==
X-Gm-Message-State: AOJu0YxCV1yxtXRsnmd6ZwnNvrC7CFRdzwiZEHP0E+NrjB/fEamVIECQ
	kdt7nZR9C+LpEPQQSdVzTuFPIPYvhQ75siwAhrxTYKnlUHyzwzI/XZQxJpFi
X-Gm-Gg: ASbGnctJu81htMlovlsJcaCn67olVjlY2f5X6hKeOi/nZjDDZeXzgszRz7i/30swhSz
	m0UDyWKRGwh6ngP1lRpZE85ekQ2L76oyooD38tA8r/t8gEXBYvFrIPERI/QVpIkOLatT3/3g77J
	ZUgfo3SyZ0HmpiqNgTiYTwCtNt/rafIbBQI9clON8t6wYq93+2d9XckAwr/8JnT2I1HDMwW20Vx
	D/l+deuXkqmvFgTFebvkDkf9QqJoU0+ra7Y1khdfsPnaSJzZZDuOEGfB3+ivmd2mHnY9JuE4+fo
	W50AUzQTrLi/9vY8bSvTWaTImhmGZu/zVKyox6LRTrrFLJZ+eBMx5GyCGP2m
X-Google-Smtp-Source: AGHT+IFp0hjjWj7oeUXuqeXaRLShkXDHQYfGIlDx9EBLgNs4SKw+y+QxnO01dKSw9zj/5E2tGTt8aw==
X-Received: by 2002:a05:6830:3509:b0:71e:72:3ab6 with SMTP id 46e09a7af769-726568ea02cmr7803717a34.26.1738287595868;
        Thu, 30 Jan 2025 17:39:55 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726618b9f49sm659875a34.54.2025.01.30.17.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:39:55 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 03/11] python3-arrow: update recipe to use the ptest-python-pytest class
Date: Fri, 31 Jan 2025 01:39:27 +0000
Message-Id: <20250131013935.3714521-3-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131013935.3714521-1-derek@asterius.io>
References: <20250131013935.3714521-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 01:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115180

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-arrow/run-ptest |  3 ---
 .../recipes-devtools/python/python3-arrow_1.3.0.bb  | 13 +------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-arrow/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-arrow/run-ptest b/meta-python/recipes-devtools/python/python3-arrow/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-arrow/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb b/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
index c1b7c1a433..7ce9583d2a 100644
--- a/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
@@ -6,26 +6,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=14a2e29a9d542fb9052d75344d67619d"
 
 SRC_URI[sha256sum] = "d4540617648cb5f895730f1ad8c82a65f2dad0166f57b75f3ca54759c4d67a85"
 
-inherit pypi python_flit_core ptest
-
-SRC_URI += " \
-    file://run-ptest \
-"
+inherit pypi python_flit_core ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += " \
     python3-dateutil-zoneinfo \
-    python3-pytest \
     python3-pytest-mock \
     python3-pytz \
     python3-simplejson \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN} += " \
     python3-compression \
     python3-dateutil \
-- 
2.34.1


