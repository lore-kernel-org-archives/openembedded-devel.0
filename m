Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 23AA57D088
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 08:42:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,279,1566835200"; d="scan'208";a="76766167"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Oct 2019 16:42:12 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8A0C74CE14FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 16:42:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 10 Oct 2019 16:42:10 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Oct 2019 16:41:57 +0800
Message-ID: <20191010084157.23957-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 8A0C74CE14FE.AA392
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-jinja2: upgrade 2.10.1 -> 2.10.3
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
X-List-Received-Date: Thu, 10 Oct 2019 08:42:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update:The license file changed its name and changed to 2007.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-jinja2.inc               | 6 +++---
 .../python/{python-jinja2_2.10.1.bb => python-jinja2_2.10.3.bb}     | 0
 .../python/{python3-jinja2_2.10.1.bb => python3-jinja2_2.10.3.bb}   | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jinja2_2.10.1.bb => python-jinja2_2.10.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-jinja2_2.10.1.bb => python3-jinja2_2.10.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
index aee7bd3..6a6aad9 100644
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ b/meta-python/recipes-devtools/python/python-jinja2.inc
@@ -1,11 +1,11 @@
 DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=20c831f91dd3bd486020f672ba2be386"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Jinja2"
 
-SRC_URI[md5sum] = "0ae535be40fd215a8114a090c8b68e5a"
-SRC_URI[sha256sum] = "065c4f02ebe7f7cf559e49ee5a95fb800a9e4528727aec6f24402a5374c65013"
+SRC_URI[md5sum] = "7883559bc5cc3e2781d94b4be61cfdcd"
+SRC_URI[sha256sum] = "9fe95f19286cfefaa917656583d020be14e7859c6b0252588391e47db34527de"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-math ${PYTHON_PN}-netclient \
diff --git a/meta-python/recipes-devtools/python/python-jinja2_2.10.1.bb b/meta-python/recipes-devtools/python/python-jinja2_2.10.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-jinja2_2.10.1.bb
rename to meta-python/recipes-devtools/python/python-jinja2_2.10.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.10.1.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.10.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-jinja2_2.10.1.bb
rename to meta-python/recipes-devtools/python/python3-jinja2_2.10.3.bb
-- 
2.7.4




