Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D7DAE7D72F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 05:34:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="78438528"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2019 13:34:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 940EF4CE1BF0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 13:25:51 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 14 Nov 2019 13:34:02 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Nov 2019 13:34:35 +0800
Message-ID: <20191114053435.7320-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 940EF4CE1BF0.A924C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-tornado: upgrade 5.1 -> 6.0.3
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
X-List-Received-Date: Thu, 14 Nov 2019 05:34:03 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-tornado.inc        | 4 ++--
 .../python/{python-tornado_5.1.bb => python-tornado_6.0.3.bb} | 0
 .../{python3-tornado_5.1.bb => python3-tornado_6.0.3.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-tornado_5.1.bb => python-tornado_6.0.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-tornado_5.1.bb => python3-tornado_6.0.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
index 16899f88c..7cb61931a 100644
--- a/meta-python/recipes-devtools/python/python-tornado.inc
+++ b/meta-python/recipes-devtools/python/python-tornado.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "bd264851c409f926d1dae1ad5055d28d"
-SRC_URI[sha256sum] = "4f66a2172cb947387193ca4c2c3e19131f1c70fa8be470ddbbd9317fd0801582"
+SRC_URI[md5sum] = "cab4b11480f6d032e46465586192d343"
+SRC_URI[sha256sum] = "c845db36ba616912074c5b1ee897f8e0124df269468f25e4fe21fe72f6edd7a9"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
                    ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
diff --git a/meta-python/recipes-devtools/python/python-tornado_5.1.bb b/meta-python/recipes-devtools/python/python-tornado_6.0.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-tornado_5.1.bb
rename to meta-python/recipes-devtools/python/python-tornado_6.0.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-tornado_5.1.bb b/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-tornado_5.1.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
-- 
2.20.1




