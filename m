Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD539C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 08:31:31 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.29598.1635150690676674345
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 01:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 19P8VSCP013645
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 01:31:29 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 25 Oct 2021 01:31:28 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 25 Oct 2021 01:31:27 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] opencv: remove setup_vars_opencv4.sh
Date: Mon, 25 Oct 2021 16:30:22 +0800
Message-ID: <20211025083022.34708-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Oct 2021 08:31:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93559

From: Mingli Yu <mingli.yu@windriver.com>

Currently opencv ships with setup_vars_opencv4.sh, but there comes below
error:
 # /usr/bin/setup_vars_opencv4.sh
 Setting vars for OpenCV 4.5.2
 Append PYTHONPATH: /usr/bin/../lib/python3.9/site-packages
 # ls /usr/bin/../lib/python3.9/site-packages
 ls: cannot access '/usr/bin/../lib/python3.9/site-packages': No such file or directory

Considering the file is useless and also removed in other distribution [1],
so remove the file to avoid confusing.

[1] https://src.fedoraproject.org/rpms/opencv/blob/rawhide/f/opencv.spec#_424

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/opencv/opencv_4.5.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
index 361ac0cb9..8d557e086 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
@@ -230,4 +230,8 @@ do_install:append() {
         sed -e 's@${STAGING_DIR_HOST}@@g' \
             -i ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake
     fi
+    # remove setup_vars_opencv4.sh as its content is confusing and useless
+    if [ -f ${D}${bindir}/setup_vars_opencv4.sh ]; then
+        rm -rf ${D}${bindir}/setup_vars_opencv4.sh
+    fi
 }
-- 
2.17.1


