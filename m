Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 939046007A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2019 02:16:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,368,1549900800"; d="scan'208";a="59710881"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Apr 2019 10:16:31 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A1C444CD8106
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2019 10:16:29 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 19 Apr 2019 10:16:32 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Apr 2019 10:17:19 +0800
Message-ID: <20190419021719.6448-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: A1C444CD8106.A75B4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCHv2] python-jinja2: upgrade 2.10 -> 2.10.1
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
X-List-Received-Date: Fri, 19 Apr 2019 02:16:32 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-jinja2_2.10.bb to python-jinja2_2.10.1.bb.

-Upgrade from python3-jinja2_2.10.bb to python3-jinja2_2.10.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-jinja2.inc         | 4 ++--
 .../python/{python-jinja2_2.10.bb => python-jinja2_2.10.1.bb} | 0
 .../{python3-jinja2_2.10.bb => python3-jinja2_2.10.1.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jinja2_2.10.bb => python-jinja2_2.10.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-jinja2_2.10.bb => python3-jinja2_2.10.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
index 5342eb563..aee7bd3ff 100644
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ b/meta-python/recipes-devtools/python/python-jinja2.inc
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=20c831f91dd3bd486020f672ba2be386"
 
 PYPI_PACKAGE = "Jinja2"
 
-SRC_URI[md5sum] = "61ef1117f945486472850819b8d1eb3d"
-SRC_URI[sha256sum] = "f84be1bb0040caca4cea721fcbbbbd61f9be9464ca236387158b0feea01914a4"
+SRC_URI[md5sum] = "0ae535be40fd215a8114a090c8b68e5a"
+SRC_URI[sha256sum] = "065c4f02ebe7f7cf559e49ee5a95fb800a9e4528727aec6f24402a5374c65013"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-math ${PYTHON_PN}-netclient \
diff --git a/meta-python/recipes-devtools/python/python-jinja2_2.10.bb b/meta-python/recipes-devtools/python/python-jinja2_2.10.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-jinja2_2.10.bb
rename to meta-python/recipes-devtools/python/python-jinja2_2.10.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.10.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.10.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-jinja2_2.10.bb
rename to meta-python/recipes-devtools/python/python3-jinja2_2.10.1.bb
-- 
2.20.1




