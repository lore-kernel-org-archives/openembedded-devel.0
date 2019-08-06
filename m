Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 58A757C124
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 00:44:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,350,1559491200"; d="scan'208";a="73026694"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Aug 2019 08:44:29 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id D36374CDFCDE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 08:44:31 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 6 Aug 2019 08:44:35 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Aug 2019 17:44:27 +0800
Message-ID: <1565084667-13725-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: D36374CDFCDE.A9B5F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-pbr: upgrade 5.4.1 -> 5.4.2
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
X-List-Received-Date: Tue, 06 Aug 2019 00:44:30 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/{python-pbr_5.4.1.bb => python-pbr_5.4.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pbr_5.4.1.bb => python-pbr_5.4.2.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python-pbr_5.4.1.bb b/meta-python/recipes-devtools/python/python-pbr_5.4.2.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python-pbr_5.4.1.bb
rename to meta-python/recipes-devtools/python/python-pbr_5.4.2.bb
index b980933f0..1023b2031 100644
--- a/meta-python/recipes-devtools/python/python-pbr_5.4.1.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_5.4.2.bb
@@ -2,8 +2,8 @@ inherit setuptools
 # The inc file is in oe-core
 require recipes-devtools/python/python-pbr.inc
 
-SRC_URI[md5sum] = "ab6e26026ab306989a636ec2d50a435a"
-SRC_URI[sha256sum] = "0ca44dc9fd3b04a22297c2a91082d8df2894862e8f4c86a49dac69eae9e85ca0"
+SRC_URI[md5sum] = "ea90e1118a0132da752d45e68d10b2b8"
+SRC_URI[sha256sum] = "9b321c204a88d8ab5082699469f52cc94c5da45c51f114113d01b3d993c24cdf"
 
 do_install_append() {
         if [ -f ${D}${bindir}/pbr ]; then
-- 
2.17.1




