Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 209367FC42
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 06:29:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="78051362"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 14:29:30 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id A37094CE19F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 14:21:21 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 8 Nov 2019 14:29:28 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 18:09:07 +0800
Message-ID: <1573207747-79004-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: A37094CE19F6.A76AC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] tslib: upgrade 1.16 -> 1.21
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
X-List-Received-Date: Fri, 08 Nov 2019 06:29:30 -0000
Content-Type: text/plain

1) Add new binary file ts_conf into sub-package tslib-tests.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/tslib/{tslib_1.16.bb => tslib_1.21.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/tslib/{tslib_1.16.bb => tslib_1.21.bb} (94%)

diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.16.bb b/meta-oe/recipes-graphics/tslib/tslib_1.21.bb
similarity index 94%
rename from meta-oe/recipes-graphics/tslib/tslib_1.16.bb
rename to meta-oe/recipes-graphics/tslib/tslib_1.21.bb
index 8d23bd5..2bc40d9 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.16.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.21.bb
@@ -17,8 +17,8 @@ SRC_URI = "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.
            file://ts.conf \
            file://tslib.sh \
 "
-SRC_URI[md5sum] = "254a022fc8aa89d164840fe8869c2441"
-SRC_URI[sha256sum] = "c9a54651337a701a66b074c603c313225579995a7910e519bbc7b1dcdab9a755"
+SRC_URI[md5sum] = "b2b20d3ed520128513f8d3135b42e142"
+SRC_URI[sha256sum] = "d2a57b823ea59e53a3b130eef05dfed1190b857854f886eec764e1ca1957cf56"
 
 UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
 
@@ -79,4 +79,4 @@ FILES_tslib-calibrate += "${bindir}/ts_calibrate"
 FILES_tslib-uinput += "${bindir}/ts_uinput"
 
 FILES_tslib-tests = "${bindir}/ts_harvest ${bindir}/ts_print ${bindir}/ts_print_raw ${bindir}/ts_print_mt \
-                     ${bindir}/ts_test ${bindir}/ts_test_mt ${bindir}/ts_verify ${bindir}/ts_finddev"
+                     ${bindir}/ts_test ${bindir}/ts_test_mt ${bindir}/ts_verify ${bindir}/ts_finddev ${bindir}/ts_conf"
-- 
2.7.4




