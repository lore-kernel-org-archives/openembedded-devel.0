Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 81A267D6A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 03:46:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,557,1549900800"; d="scan'208";a="66171029"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jun 2019 11:46:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 9B58E4CDCEBE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 11:46:23 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 6 Jun 2019 11:46:29 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 6 Jun 2019 11:47:37 +0800
Message-ID: <20190606034737.12893-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 9B58E4CDCEBE.AE10F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-mako: upgrade 1.0.10 -> 1.0.12
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
X-List-Received-Date: Thu, 06 Jun 2019 03:46:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-mako_1.0.10.bb to python-mako_1.0.12.bb.

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-mako.inc         | 6 +++---
 .../python/{python-mako_1.0.10.bb => python-mako_1.0.12.bb} | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-mako_1.0.10.bb => python-mako_1.0.12.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-mako.inc b/meta-python/recipes-devtools/python/python-mako.inc
index d86ad33cd..dc27ada74 100644
--- a/meta-python/recipes-devtools/python/python-mako.inc
+++ b/meta-python/recipes-devtools/python/python-mako.inc
@@ -2,14 +2,14 @@ SUMMARY = "A super-fast templating language that borrows the best ideas from the
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1bb21fa2d2f7a534c884b990430a6863"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=df7e6c7c82990acf0228a55e00d29bc9"
 
 PYPI_PACKAGE = "Mako"
 
 inherit pypi
 
-SRC_URI[md5sum] = "a94d376078dda65f834ea5049a81ebb5"
-SRC_URI[sha256sum] = "7165919e78e1feb68b4dbe829871ea9941398178fa58e6beedb9ba14acf63965"
+SRC_URI[md5sum] = "4a7aef27217a8e6c1a29447c9b1b00ab"
+SRC_URI[sha256sum] = "0cfa65de3a835e87eeca6ac856b3013aade55f49e32515f65d999f91a2324162"
 
 RDEPENDS_${PN} = " \
     ${PYTHON_PN}-html \
diff --git a/meta-python/recipes-devtools/python/python-mako_1.0.10.bb b/meta-python/recipes-devtools/python/python-mako_1.0.12.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-mako_1.0.10.bb
rename to meta-python/recipes-devtools/python/python-mako_1.0.12.bb
-- 
2.20.1




