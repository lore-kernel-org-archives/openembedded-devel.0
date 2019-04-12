Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7F17D848
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 03:34:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,339,1549900800"; d="scan'208";a="59092613"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Apr 2019 11:34:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id B5CC24CD8183
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 11:34:05 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 12 Apr 2019 11:34:03 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Apr 2019 11:34:50 +0800
Message-ID: <20190412033450.12482-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: B5CC24CD8183.A880E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCHv2] python-dateutil: upgrade 2.7.3 -> 2.8.0
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
X-List-Received-Date: Fri, 12 Apr 2019 03:34:06 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-dateutil_2.7.3.bb to python-dateutil_2.8.0.bb.

-Upgrade from python3-dateutil_2.7.3.bb to python3-dateutil_2.8.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-dateutil.inc       | 4 ++--
 .../{python-dateutil_2.7.3.bb => python-dateutil_2.8.0.bb}    | 0
 .../{python3-dateutil_2.7.3.bb => python3-dateutil_2.8.0.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dateutil_2.7.3.bb => python-dateutil_2.8.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-dateutil_2.7.3.bb => python3-dateutil_2.8.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index 9c5a89dd3..e230f15dd 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -4,8 +4,8 @@ HOMEPAGE = "https://dateutil.readthedocs.org"
 LICENSE = "BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996"
 
-SRC_URI[md5sum] = "175b7c1a3cc0cb01151eced07c61c0b8"
-SRC_URI[sha256sum] = "e27001de32f627c22380a688bcc43ce83504a7bc5da472209b4c70f02829f0b8"
+SRC_URI[md5sum] = "354db28843d949f1bc3e49e8458e22df"
+SRC_URI[sha256sum] = "c89805f6f4d64db21ed966fda138f8a5ed7a4fdbc1a8ee329ce1b74e3c74da9e"
 
 PYPI_PACKAGE = "python-dateutil"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-dateutil_2.7.3.bb b/meta-python/recipes-devtools/python/python-dateutil_2.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-dateutil_2.7.3.bb
rename to meta-python/recipes-devtools/python/python-dateutil_2.8.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.7.3.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-dateutil_2.7.3.bb
rename to meta-python/recipes-devtools/python/python3-dateutil_2.8.0.bb
-- 
2.20.1




