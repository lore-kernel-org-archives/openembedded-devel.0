Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D90817F944
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 01:39:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,388,1571673600"; d="scan'208";a="81257291"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Jan 2020 09:39:47 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 50D0049E9313
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 09:30:52 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 3 Jan 2020 09:39:46 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 3 Jan 2020 09:39:49 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 22:09:30 -0800
Message-ID: <1578031770-88411-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578031770-88411-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578031770-88411-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 50D0049E9313.AF066
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-sqlalchemy: upgrade 1.1.17 -> 1.3.12
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
X-List-Received-Date: Fri, 03 Jan 2020 01:39:48 -0000
Content-Type: text/plain

-License-Update: Copyright year updated to 2019.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-sqlalchemy.inc   | 6 +++---
 ...hon-sqlalchemy_1.1.17.bb => python-sqlalchemy_1.3.12.bb} | 0
 ...n3-sqlalchemy_1.1.17.bb => python3-sqlalchemy_1.3.12.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.17.bb => python-sqlalchemy_1.3.12.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.17.bb => python3-sqlalchemy_1.3.12.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
index 0c191ae7d..3763a39ae 100644
--- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
+++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
@@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
 HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22bb"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2f5eb030c48975d5294baf0f5d01af1c"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi
 
-SRC_URI[md5sum] = "03db1c8f8ae911977c0bf3950a4c9c21"
-SRC_URI[sha256sum] = "6b55ec379c11ad696f9371ce8e0de93c7f21134323f56a56a1b0d8fbef17013c"
+SRC_URI[md5sum] = "02a46be841903b60c52a83342d3ced8e"
+SRC_URI[sha256sum] = "bfb8f464a5000b567ac1d350b9090cf081180ec1ab4aa87e7bca12dab25320ec"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.3.12.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.3.12.bb
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb
-- 
2.17.1




