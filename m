Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 255277E947
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 09:47:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,438,1557158400"; d="scan'208";a="70369670"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Jul 2019 17:47:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id F3EBB4CDDD59
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 17:47:50 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 1 Jul 2019 17:47:52 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Jul 2019 17:49:26 +0800
Message-ID: <20190701094926.29724-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: F3EBB4CDDD59.ACFD4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] tcsh: upgrade 6.20.00 -> 6.21.00
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
X-List-Received-Date: Mon, 01 Jul 2019 09:47:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from tcsh_6.20.00.bb to tcsh_6.21.00.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-shells/tcsh/{tcsh_6.20.00.bb => tcsh_6.21.00.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-shells/tcsh/{tcsh_6.20.00.bb => tcsh_6.21.00.bb} (91%)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.20.00.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.21.00.bb
similarity index 91%
rename from meta-oe/recipes-shells/tcsh/tcsh_6.20.00.bb
rename to meta-oe/recipes-shells/tcsh/tcsh_6.21.00.bb
index c171963c2..278ab0458 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.20.00.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.21.00.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
     file://0001-Enable-system-malloc-on-all-linux.patch \
     file://0002-Add-debian-csh-scripts.patch \
 "
-SRC_URI[md5sum] = "59d40ef40a68e790d95e182069431834"
-SRC_URI[sha256sum] = "b89de7064ab54dac454a266cfe5d8bf66940cb5ed048d0c30674ea62e7ecef9d"
+SRC_URI[md5sum] = "5bd5f11515cc5cca927777fa92f9d4b9"
+SRC_URI[sha256sum] = "c438325448371f59b12a4c93bfd3f6982e6f79f8c5aef4bc83aac8f62766e972"
 
 EXTRA_OEMAKE += "CC_FOR_GETHOST='${BUILD_CC}'"
 inherit autotools
-- 
2.20.1




