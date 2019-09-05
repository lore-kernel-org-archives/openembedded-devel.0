Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 26A7C7E544
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 08:22:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,470,1559491200"; d="scan'208";a="74880919"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 16:22:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7E03E4CE042F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 16:22:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 16:22:05 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Sep 2019 17:21:40 +0900
Message-ID: <20190905082140.41579-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 7E03E4CE042F.AF1E7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pbr: upgrade 5.4.2 -> 5.4.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2019 08:22:05 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../python/{python-pbr_5.4.2.bb => python-pbr_5.4.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pbr_5.4.2.bb => python-pbr_5.4.3.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python-pbr_5.4.2.bb b/meta-python/recipes-devtools/python/python-pbr_5.4.3.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python-pbr_5.4.2.bb
rename to meta-python/recipes-devtools/python/python-pbr_5.4.3.bb
index 1023b2031..b21722fda 100644
--- a/meta-python/recipes-devtools/python/python-pbr_5.4.2.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_5.4.3.bb
@@ -2,8 +2,8 @@ inherit setuptools
 # The inc file is in oe-core
 require recipes-devtools/python/python-pbr.inc
 
-SRC_URI[md5sum] = "ea90e1118a0132da752d45e68d10b2b8"
-SRC_URI[sha256sum] = "9b321c204a88d8ab5082699469f52cc94c5da45c51f114113d01b3d993c24cdf"
+SRC_URI[md5sum] = "477d2aa285ad97250a172b199f4060b7"
+SRC_URI[sha256sum] = "2c8e420cd4ed4cec4e7999ee47409e876af575d4c35a45840d59e8b5f3155ab8"
 
 do_install_append() {
         if [ -f ${D}${bindir}/pbr ]; then
-- 
2.17.1




