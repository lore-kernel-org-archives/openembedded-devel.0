Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 452E97FC39
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 02:47:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,253,1569254400"; d="scan'208";a="77773628"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 10:47:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6D8D34CE1649
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 10:39:39 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 1 Nov 2019 10:47:41 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 10:47:55 +0800
Message-ID: <20191101024755.3131-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 6D8D34CE1649.A9711
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-lazy-object-proxy: upgrade 1.3.1 -> 1.4.3
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
X-List-Received-Date: Fri, 01 Nov 2019 02:47:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Copyright year updated to 2019.

-Add setuptools_scm native recipe to DEPENDS.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-lazy-object-proxy.inc  | 8 +++++---
 ...t-proxy_1.3.1.bb => python-lazy-object-proxy_1.4.3.bb} | 0
 ...-proxy_1.3.1.bb => python3-lazy-object-proxy_1.4.3.bb} | 0
 3 files changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lazy-object-proxy_1.3.1.bb => python-lazy-object-proxy_1.4.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.3.1.bb => python3-lazy-object-proxy_1.4.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc b/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
index b88afce0e..bbbd66ce6 100644
--- a/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
+++ b/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
@@ -2,9 +2,11 @@ SUMMARY = "A fast and thorough lazy object proxy"
 HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
 LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ec680df42d8ad56427a83308817658cc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
 
-SRC_URI[md5sum] = "e128152b76eb5b9ba759504936139fd0"
-SRC_URI[sha256sum] = "eb91be369f945f10d3a49f5f9be8b3d0b93a4c2be8f8a5b83b0571b8123e0a7a"
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+SRC_URI[md5sum] = "5c64c06affcd2a7c6ddc848af4280cca"
+SRC_URI[sha256sum] = "f3900e8a5de27447acbf900b4750b0ddfd7ec1ea7fbaf11dfa911141bc522af0"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.3.1.bb b/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lazy-object-proxy_1.3.1.bb
rename to meta-python/recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.3.1.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
-- 
2.20.1




