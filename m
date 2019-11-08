Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B6D1B7FC49
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 07:25:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="78053592"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 15:25:49 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3EABF4CE1A01
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 15:17:40 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 15:25:47 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 15:26:16 +0800
Message-ID: <20191108072616.29402-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 3EABF4CE1A01.AA5C3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyrsistent: upgrade 0.15.4 -> 0.15.5
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
X-List-Received-Date: Fri, 08 Nov 2019 07:25:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyrsistent.inc     | 4 ++--
 ...ython-pyrsistent_0.15.4.bb => python-pyrsistent_0.15.5.bb} | 0
 ...hon3-pyrsistent_0.15.4.bb => python3-pyrsistent_0.15.5.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyrsistent_0.15.4.bb => python-pyrsistent_0.15.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyrsistent_0.15.4.bb => python3-pyrsistent_0.15.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyrsistent.inc b/meta-python/recipes-devtools/python/python-pyrsistent.inc
index 2add037de..fad488dd9 100644
--- a/meta-python/recipes-devtools/python/python-pyrsistent.inc
+++ b/meta-python/recipes-devtools/python/python-pyrsistent.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/tobgu/pyrsistent"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.mit;md5=ca574f2891cf528b3e7a2ee570337e7c"
 
-SRC_URI[md5sum] = "0298efae86e009e24136d39dc8b2d33e"
-SRC_URI[sha256sum] = "34b47fa169d6006b32e99d4b3c4031f155e6e68ebcc107d6454852e8e0ee6533"
+SRC_URI[md5sum] = "903c518c8829de4ee255cff68ff8da45"
+SRC_URI[sha256sum] = "eb6545dbeb1aa69ab1fb4809bfbf5a8705e44d92ef8fc7c2361682a47c46c778"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-six \
diff --git a/meta-python/recipes-devtools/python/python-pyrsistent_0.15.4.bb b/meta-python/recipes-devtools/python/python-pyrsistent_0.15.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyrsistent_0.15.4.bb
rename to meta-python/recipes-devtools/python/python-pyrsistent_0.15.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.4.bb b/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyrsistent_0.15.4.bb
rename to meta-python/recipes-devtools/python/python3-pyrsistent_0.15.5.bb
-- 
2.20.1




