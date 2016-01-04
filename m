Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B22EB731DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:13:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2188289"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 18:13:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B3BB24004E00
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 18:13:01 +0800 (CST)
Received: from localhost.localdomain (10.167.226.98) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 18:16:33 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Jan 2016 13:12:38 +0300
Message-ID: <1451902358-1844-4-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1451902358-1844-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1451902358-1844-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.98]
X-yoursite-MailScanner-ID: B3BB24004E00.AEE6B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][jethro][PATCH 4/4] python-cryptography: Error fix
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
X-List-Received-Date: Mon, 04 Jan 2016 10:13:17 -0000
Content-Type: text/plain

python-cryptography depends on python-enum34 python-six python-pyasn1,
And will download modules enum34 six pyasn1 in the step of do_compile.
If your network is not very well,errors will occur as following:
  Download error on https://pypi.python.org/simple/enum34/:
  [Errno -5] No address associated with hostname -- Some packages may not be found!
  Couldn't find index page for 'enum34' (maybe misspelled?)

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-cryptography_0.8.1.bb   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb b/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
index 41e4acd..d6ebbb7 100644
--- a/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
@@ -38,6 +38,20 @@ RDEPENDS_${PN}-ptest = "\
 
 inherit ptest
 
+do_compile_prepend() {
+    install -d ${S}/.eggs
+    if [ -f ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/enum34*.egg ]; then
+        cp ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/enum34*.egg ${S}/.eggs/
+    fi
+
+    if [ -f ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/pyasn1*.egg ]; then
+        cp ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/pyasn1*.egg ${S}/.eggs/
+    fi
+
+    if [ -f ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/six*.egg ]; then
+        cp ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/six*.egg ${S}/.eggs/
+    fi
+}
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-- 
1.8.4.2




