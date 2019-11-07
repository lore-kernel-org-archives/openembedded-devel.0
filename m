Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 247A27F80F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 08:25:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,277,1569254400"; d="scan'208";a="77996169"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2019 16:25:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 04BFA4CE1C93
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 16:17:33 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Nov 2019 16:25:38 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Nov 2019 20:05:23 +0800
Message-ID: <1573128323-61872-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 04BFA4CE1C93.A7A96
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] mce-test: Update to latest git version
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
X-List-Received-Date: Thu, 07 Nov 2019 08:25:42 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/mcelog/mce-test_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb b/meta-oe/recipes-support/mcelog/mce-test_git.bb
index 888c729..007b394 100644
--- a/meta-oe/recipes-support/mcelog/mce-test_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git;protocol=git \
            file://makefile-remove-ldflags.patch \
           "
-SRCREV = "74bffd8b0aa27051aeaa1983a7b23975ca8d8726"
-PV = "20171030+git${SRCPV}"
+SRCREV = "7643baf6c3919b3d727e6ba6c2e545dc6a653307"
+PV = "20190917+git${SRCPV}"
 
 RDEPENDS_${PN} = "mcelog mce-inject dialog bash"
 
-- 
2.7.4




