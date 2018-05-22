Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2B78A746A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 05:15:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40194282"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 May 2018 13:15:44 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1ECBF4B402E7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 13:15:41 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 22 May 2018 13:15:44 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 May 2018 13:15:02 +0800
Message-ID: <20180522051502.29198-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: 1ECBF4B402E7.AFD89
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] rrdtool: 1.6.0 -> 1.7.0
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
X-List-Received-Date: Tue, 22 May 2018 05:15:44 -0000
Content-Type: text/plain

Upgrade rrdtool from 1.6.0 to 1.7.0.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../rrdtool/{rrdtool_1.6.0.bb => rrdtool_1.7.0.bb}                | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/rrdtool/{rrdtool_1.6.0.bb => rrdtool_1.7.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
rename to meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb
index 797bcaa..ff99574 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb
@@ -4,13 +4,13 @@ HOMEPAGE = "http://oss.oetiker.ch/rrdtool/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3349111ed0533471494beec99715bc9d"
 
-DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native"
+DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native python-setuptools-native"
 
-SRCREV = "61f116744262c4c18922dcf806e496715f199669"
-PV = "1.6.0"
+SRCREV = "bfc82d5242855628b826018479df00e0ec4e8360"
+PV = "1.7.0"
 
 SRC_URI = "\
-    git://github.com/oetiker/rrdtool-1.x.git;branch=1.6;protocol=http; \
+    git://github.com/oetiker/rrdtool-1.x.git;branch=master;protocol=http; \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4




