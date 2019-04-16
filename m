Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE227C617
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 07:42:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,355,1549900800"; d="scan'208";a="59421412"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Apr 2019 15:42:17 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 4E7974CD80C7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 15:42:12 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 16 Apr 2019 15:42:17 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Apr 2019 15:42:24 +0800
Message-ID: <1555400544-22738-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 4E7974CD80C7.AC9E5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] To fix conflict error with python3-pycodestyle when do_rootfs.
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
X-List-Received-Date: Tue, 16 Apr 2019 07:42:19 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pycodestyle_2.4.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pycodestyle_2.4.0.bb b/meta-python/recipes-devtools/python/python-pycodestyle_2.4.0.bb
index 7c736e7..ec6c12f 100644
--- a/meta-python/recipes-devtools/python/python-pycodestyle_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python-pycodestyle_2.4.0.bb
@@ -2,3 +2,9 @@ inherit setuptools
 require python-pycodestyle.inc
 
 RDEPENDS_${PN} += "${PYTHON_PN}-lang"
+
+do_install_append () {
+        if [ -f ${D}${bindir}/pycodestyle ]; then
+                mv ${D}${bindir}/pycodestyle ${D}${bindir}/pycodestyle-2
+        fi
+}
-- 
2.7.4




