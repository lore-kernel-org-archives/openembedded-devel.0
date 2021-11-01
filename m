Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A99C433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 11:54:50 +0000 (UTC)
Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.42972.1635767689550859844
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 04:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=neutral (domain: fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@fujitsu.com)
IronPort-Data: =?us-ascii?q?A9a23=3ARnknE6k4YplGBxVfPdJyx6Xo5gyoJERdPkR7XQ2?=
 =?us-ascii?q?eYbTBsI5bpzFVyWIeWj2EMqqCYGSmKogjOdvg9B4PsJOAyIViGwZu+CA2RRqmi?=
 =?us-ascii?q?+KfW43BcR2Y0wB+jyH7ZBs+qZ1YM7EsFehsJpPnjkrrYueJQUVUj/nSH+OlULe?=
 =?us-ascii?q?cY0ideCc/IMsfoUM68wIGqt4w6TSJK1vlVeLa+6UzCnf8s9JHGj58B5a4lf9al?=
 =?us-ascii?q?K+aVAX0EbAJTasjUFf2zxH5BX+ETE27ByOQroJ8RoZWSwtfpYxV8F81/z91Yj+?=
 =?us-ascii?q?kur39NEMXQL/OJhXIgX1TM0SgqkEa4HVsjeBgb7xBAatUo2zhc9RZ2tVAs5OqU?=
 =?us-ascii?q?EEnOLbQsOoAURhECDw4NqpDkFPCCSHm75PJlBScLhMAxN0rVinaJ7Yw/f56B2x?=
 =?us-ascii?q?L//EUJD0BKxyOme+y6La6UfV3wMM7Ic/mOYkStn1twXfeF/lOfHxpa80m/vcBh?=
 =?us-ascii?q?HFp2J8IRq2YOqIkhfNUREyoS3Vy1p0/V/rSRNuVu0Q=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A/7Xo+KESICXLcwb7pLqEHseALOsnbusQ8zAX?=
 =?us-ascii?q?PiFKOH5om6Oj+fxG8M536faWskdzZJhDo7G90cC7KBu2n6KdirN/AV7NZmXbUD?=
 =?us-ascii?q?zCFvAH0WKb+V3d8nrFh4tgPLlbAtBDIey1HV5nltz7/QX9N94hxeOM+Keuify2?=
 =?us-ascii?q?9QYKcShaL7Fn8xxiChuWVml/RAx9D5I/E5aGouVdoT7IQwVvUu2LQmkCQ/PYp8?=
 =?us-ascii?q?DG0LbvYRs9DRYh7wWUyROEgYSKdCSl4g=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.87,199,1631548800";
   d="scan'208";a="116723125"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Nov 2021 19:54:29 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D01084D0DC7C
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  1 Nov 2021 19:54:24 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 1 Nov 2021 19:54:20 +0800
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-cycler: upgrade 0.10.0 -> 0.11.0
Date: Tue, 2 Nov 2021 04:53:54 +0800
Message-ID: <1635800034-101906-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: D01084D0DC7C.A13F3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@fujitsu.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 11:54:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93737

This is the first Cycler feature release in some years. New features include:

Added Cycler.by_key, which produces values by key (#26)
Added Cycler.__contains__, which adds support for in checks (#34)
Wheels now includes the LICENSE file (#48)
The sdist now includes the LICENSE (#58) and tests (#32)
Cycler no longer supports Python 2. Supported versions of Python are 3.6 and above.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-cycler_0.10.0.bb => python3-cycler_0.11.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cycler_0.10.0.bb => python3-cycler_0.11.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb b/meta-python/recipes-devtools/python/python3-cycler_0.11.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb
rename to meta-python/recipes-devtools/python/python3-cycler_0.11.0.bb
index edf3246bc0..59492e8bfa 100644
--- a/meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cycler_0.11.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "http://github.com/matplotlib/cycler"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7713fe42cd766b15c710e19392bfa811"
 
-SRC_URI[md5sum] = "4cb42917ac5007d1cdff6cccfe2d016b"
-SRC_URI[sha256sum] = "cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8"
+SRC_URI[sha256sum] = "9c87405839a19696e837b3b818fed3f5f69f16f1eec1a1ad77e043dcea9c772f"
 
 inherit pypi setuptools3
 
-- 
2.25.1




