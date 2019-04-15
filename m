Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7451B7BD64
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 05:57:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,352,1549900800"; d="scan'208";a="59315933"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Apr 2019 13:57:04 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id E9F884CD846E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 13:57:06 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 15 Apr 2019 13:57:08 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Apr 2019 13:57:13 +0800
Message-ID: <1555307833-17472-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: E9F884CD846E.A0AA8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] To fix confilict error with python3-pbr.
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
X-List-Received-Date: Mon, 15 Apr 2019 05:57:04 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pbr_4.2.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb b/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
index 3248772..361f2a4 100644
--- a/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
@@ -5,3 +5,9 @@ require recipes-devtools/python/python-pbr.inc
 SRC_URI[md5sum] = "6619780896ca81c7cd19c6e2f439b6c9"
 SRC_URI[sha256sum] = "1b8be50d938c9bb75d0eaf7eda111eec1bf6dc88a62a6412e33bf077457e0f45"
 
+do_install_append() {
+        if [ -f ${D}${bindir}/pbr ]; then
+                mv ${D}${bindir}/pbr ${D}${bindir}/pbr-2
+        fi
+}
+
-- 
2.7.4




