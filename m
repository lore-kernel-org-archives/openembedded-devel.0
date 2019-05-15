Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 62D7D7D2E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2019 05:39:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,471,1549900800"; d="scan'208";a="63102170"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 May 2019 13:39:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6D4D64CDB1E9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2019 13:39:19 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 May 2019 13:39:18 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 May 2019 13:40:16 +0800
Message-ID: <20190515054016.27286-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 6D4D64CDB1E9.AC191
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-six: upgrade 1.11.0 -> 1.12.0
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
X-List-Received-Date: Wed, 15 May 2019 05:39:22 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-six_1.11.0.bb to python-six_1.12.0.bb.

-License-Update: Copyright year updated to 2018.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-six.inc          | 6 +++---
 .../python/{python-six_1.11.0.bb => python-six_1.12.0.bb}   | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-six_1.11.0.bb => python-six_1.12.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-six.inc b/meta-python/recipes-devtools/python/python-six.inc
index a5915c116..47129258e 100644
--- a/meta-python/recipes-devtools/python/python-six.inc
+++ b/meta-python/recipes-devtools/python/python-six.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Python 2 and 3 compatibility library"
 HOMEPAGE = "http://pypi.python.org/pypi/six/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=35cec5bf04dd0820d0a18533ea7c774a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=83e0f622bd5ac7d575dbd83d094d69b5"
 
-SRC_URI[md5sum] = "d12789f9baf7e9fb2524c0c64f1773f8"
-SRC_URI[sha256sum] = "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
+SRC_URI[md5sum] = "9ae5d1feed8c0215f4ae4adcd9207fcb"
+SRC_URI[sha256sum] = "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73"
 
 do_compile_append() {
     ${PYTHON} setup.py -q bdist_egg --dist-dir ./
diff --git a/meta-python/recipes-devtools/python/python-six_1.11.0.bb b/meta-python/recipes-devtools/python/python-six_1.12.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-six_1.11.0.bb
rename to meta-python/recipes-devtools/python/python-six_1.12.0.bb
-- 
2.20.1




