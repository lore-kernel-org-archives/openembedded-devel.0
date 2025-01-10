Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9660E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:09:11 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.677.1736539745296184454
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:09:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-84cdacbc3dbso176729539f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539744; x=1737144544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTX+PFF2onaUccTP0MGwnHZKn3irSm1ubfU54eCMA4M=;
        b=nAhlR0cZozjU5Ak2yy2RlKACdeCSDJg6Jfvdo8xUfBIrrOb+veXjCh2ycGtc34aEnl
         N9PozWE2jTaqFQljv+gsdvpEIdFigf6yA99KeSqXVuzh+Q4tLrfP2iU/aN/6cClbDW1Z
         e1zEQUnAOmkUlzlr0LXPUroaFrP2IWhLfZLS5ZJbmZTCHrlDwFsrzJivRxH22qPUaGSY
         x5dB/zLUWokgAUfJtUWVs0B2M8+zuM23g0dnp5uaK03oMQzN/JBCgp9Q7TB8qsXx0oKX
         cONWqTUBT7ih/PN2cGVlaj4JHUSWFQb19jpbMpQla1b/wQEVNje3rHSAt2r7e9jUMR2i
         E32g==
X-Gm-Message-State: AOJu0YyYLTY/jDJCEoKMmPFymg5y6gB8aMQYfa+XC9idqtLG4AQ1gvUN
	pguGr6S0dGneK9L2kRVd+BYN7C0rj6i27B7AIk/O3YofkM8s6eAN++9Qyw==
X-Gm-Gg: ASbGncs+FBjmdxhts4DdTWTTU+5N2Gf80hIN+A7t+nyFSWXTC8BpFAhepBpmhvf3i+9
	ACRqyBa1/NQddGv4ESUhVbJLD6ViC10X1nKvcQ/Beu57uKVBEXmltuJzUR+HnD5WmsUJk1a3bJi
	b2sVNjCriJcwxKwZEyBjHAZB4Pb8zpatR/SISe7nA9siDBzEeiINxxCaX3lsVjdldJ/dHYmcG7c
	MDCAkv3941y1qp+8B2K8YTYl9grhctrkQ8PfPninC+r6TwsPXIAb72A3x9jAhZ9IQTcDYujWx8e
	url0lcaJTHLZEWtgImAjJF/pRw==
X-Google-Smtp-Source: AGHT+IE0Eg+VREF9L3G7hzSDs6xO82/buLqO4KCKbt/yr1zVJ3R55bvWFhhBT9iYcxx/N8tq3QLVaQ==
X-Received: by 2002:a05:6602:3e81:b0:83b:a47c:dbfd with SMTP id ca18e2360f4ac-84ce007670bmr1276590539f.6.1736539743677;
        Fri, 10 Jan 2025 12:09:03 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fc84dasm104467139f.46.2025.01.10.12.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:09:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 04/13] python3-wsproto: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:08:13 +0000
Message-Id: <20250110200822.3958062-4-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110200822.3958062-1-derek@asterius.io>
References: <20250110200822.3958062-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114794

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-wsproto/run-ptest           |  3 ---
 .../python/python3-wsproto_1.2.0.bb            | 18 +++---------------
 2 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-wsproto/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-wsproto/run-ptest b/meta-python/recipes-devtools/python/python3-wsproto/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-wsproto/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-wsproto_1.2.0.bb b/meta-python/recipes-devtools/python/python3-wsproto_1.2.0.bb
index 09f5565a9..4aac092fb 100644
--- a/meta-python/recipes-devtools/python/python3-wsproto_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wsproto_1.2.0.bb
@@ -3,23 +3,11 @@ HOMEPAGE = "https://github.com/python-hyper/wsproto/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=69fabf732409f4ac61875827b258caaf"
 
-inherit pypi setuptools3 ptest
+inherit pypi setuptools3 ptest-python-pytest
 
-SRC_URI[sha256sum] = "ad565f26ecb92588a3e43bc3d96164de84cd9902482b130d0ddbaa9664a85065"
-
-SRC_URI += " \
-        file://run-ptest \
-"
+PTEST_PYTEST_DIR = "test"
 
-RDEPENDS:${PN}-ptest += " \
-        python3-pytest \
-        python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/test/* ${D}${PTEST_PATH}/tests/
-}
+SRC_URI[sha256sum] = "ad565f26ecb92588a3e43bc3d96164de84cd9902482b130d0ddbaa9664a85065"
 
 RDEPENDS:${PN} += " \
         python3-h11 \
-- 
2.34.1


