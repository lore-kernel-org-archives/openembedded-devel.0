Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5509E6C108
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 08:59:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,268,1571673600"; d="scan'208";a="79439151"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2019 16:59:46 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C4FA14CE1A05
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 16:51:19 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Dec 2019 16:59:49 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Dec 2019 07:28:10 -0800
Message-ID: <1575300494-101612-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: C4FA14CE1A05.AA2FF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-pytest: upgrade 5.2.2 -> 5.3.1
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
X-List-Received-Date: Mon, 02 Dec 2019 08:59:47 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pytest.inc                 | 4 ++--
 .../python/{python-pytest_5.2.2.bb => python-pytest_5.3.1.bb}         | 0
 .../python/{python3-pytest_5.2.2.bb => python3-pytest_5.3.1.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_5.2.2.bb => python-pytest_5.3.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_5.2.2.bb => python3-pytest_5.3.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index a26d410..e35d566 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=640061b8cee64b308a4d2f9f556c12f2"
 
-SRC_URI[md5sum] = "889344299c9182aff67d6e461cb7af29"
-SRC_URI[sha256sum] = "27abc3fef618a01bebb1f0d6d303d2816a99aa87a5968ebc32fe971be91eb1e6"
+SRC_URI[md5sum] = "06cdb939a1f45f6b82b304abb87c3e30"
+SRC_URI[sha256sum] = "f67403f33b2b1d25a6756184077394167fe5e2f9d8bdaab30707d19ccec35427"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
                    "
diff --git a/meta-python/recipes-devtools/python/python-pytest_5.2.2.bb b/meta-python/recipes-devtools/python/python-pytest_5.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_5.2.2.bb
rename to meta-python/recipes-devtools/python/python-pytest_5.3.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.2.2.bb b/meta-python/recipes-devtools/python/python3-pytest_5.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_5.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest_5.3.1.bb
-- 
2.7.4




