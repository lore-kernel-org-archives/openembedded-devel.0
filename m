Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 09DCE70057
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 05:04:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10495791"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Sep 2016 13:04:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 82E41403CC5C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 13:04:10 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 1 Sep 2016 13:04:10 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Sep 2016 01:04:07 -0400
Message-ID: <1472706247-1498-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 82E41403CC5C.A4D1A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] rrdtool: 1.5.4 -> 1.6.0
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
X-List-Received-Date: Thu, 01 Sep 2016 05:04:18 -0000
Content-Type: text/plain

Upgrade rrdtool from 1.5.4 to 1.6.0.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../recipes-extended/rrdtool/{rrdtool_1.5.4.bb => rrdtool_1.6.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/rrdtool/{rrdtool_1.5.4.bb => rrdtool_1.6.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
rename to meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
index a43e770..09aac4d 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3349111ed0533471494beec99715bc9d"
 
 DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native"
 
-SRCREV = "04f70058cc894c0a3ee5d555ea1bb5a8d4bb8a0e"
-PV = "1.5.4"
+SRCREV = "61f116744262c4c18922dcf806e496715f199669"
+PV = "1.6.0"
 
 SRC_URI = "\
-    git://github.com/oetiker/rrdtool-1.x.git;branch=1.5 \
+    git://github.com/oetiker/rrdtool-1.x.git;branch=1.6;protocol=http; \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4




