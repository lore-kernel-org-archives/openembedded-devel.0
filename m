Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3A97FC35
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 03:21:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,253,1569254400"; d="scan'208";a="77775391"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 11:21:26 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id BFDE841B7076
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 11:13:24 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 1 Nov 2019 11:21:27 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 11:21:41 +0800
Message-ID: <20191101032141.20864-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: BFDE841B7076.AA5A5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pathlib2: upgrade 2.3.4 -> 2.3.5
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
X-List-Received-Date: Fri, 01 Nov 2019 03:21:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pathlib2.inc       | 4 ++--
 .../{python-pathlib2_2.3.4.bb => python-pathlib2_2.3.5.bb}    | 0
 .../{python3-pathlib2_2.3.4.bb => python3-pathlib2_2.3.5.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pathlib2_2.3.4.bb => python-pathlib2_2.3.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pathlib2_2.3.4.bb => python3-pathlib2_2.3.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pathlib2.inc b/meta-python/recipes-devtools/python/python-pathlib2.inc
index c25e5a080..c5ba99d4f 100644
--- a/meta-python/recipes-devtools/python/python-pathlib2.inc
+++ b/meta-python/recipes-devtools/python/python-pathlib2.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mcmtroffaes/pathlib2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a"
 
-SRC_URI[md5sum] = "96da6398b3ea944417b84ccb25b171aa"
-SRC_URI[sha256sum] = "446014523bb9be5c28128c4d2a10ad6bb60769e78bd85658fe44a450674e0ef8"
+SRC_URI[md5sum] = "f2bd0a363eb0f8fa0556f35c1d9e66fb"
+SRC_URI[sha256sum] = "6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-six"
diff --git a/meta-python/recipes-devtools/python/python-pathlib2_2.3.4.bb b/meta-python/recipes-devtools/python/python-pathlib2_2.3.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pathlib2_2.3.4.bb
rename to meta-python/recipes-devtools/python/python-pathlib2_2.3.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.4.bb b/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pathlib2_2.3.4.bb
rename to meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
-- 
2.20.1




