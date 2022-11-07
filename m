Return-Path: <cp0613@linux.alibaba.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BBCC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 01:41:18 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by mx.groups.io with SMTP id smtpd.web10.5575.1667785274237747186
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Nov 2022 17:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.alibaba.com, ip: 115.124.30.57, mailfrom: cp0613@linux.alibaba.com)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0VU5.5Z6_1667785264;
Received: from DESKTOP-AMMB16H.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0VU5.5Z6_1667785264)
          by smtp.aliyun-inc.com;
          Mon, 07 Nov 2022 09:41:10 +0800
From: cp0613@linux.alibaba.com
To: openembedded-devel@lists.openembedded.org
Cc: cp0613 <cp0613@linux.alibaba.com>
Subject: [meta-python] [PATCH V2] add meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
Date: Mon,  7 Nov 2022 09:40:50 +0800
Message-Id: <20221107014050.180-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 01:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99436

From: cp0613 <cp0613@linux.alibaba.com>

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 .../python/python3-brotli_1.0.9.bb             | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb

diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb b/meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
new file mode 100644
index 000000000..5dfac5823
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Brotli compression format"
+HOMEPAGE = "https://pypi.org/project/Brotli/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=941ee9cd1609382f946352712a319b4b"
+
+PYPI_PACKAGE = "Brotli"
+PYPI_PACKAGE_EXT = "zip"
+
+SRC_URI[sha256sum] = "4d1b810aa0ed773f81dceda2cc7b403d01057458730e309856356d4ef4188438"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} = "\
+  ${PYTHON_PN}-cffi \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


