Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1FDFB60116
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 03:33:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,367,1544457600"; d="scan'208";a="54302759"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Feb 2019 11:33:23 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 36AAD4C4C381
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 11:33:24 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Thu, 14 Feb 2019 11:33:33 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Feb 2019 11:34:26 +0800
Message-ID: <20190214033426.24605-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 36AAD4C4C381.ABF31
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python][PATCH] python-paste:upgrade to 3.0.6
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
X-List-Received-Date: Thu, 14 Feb 2019 03:33:23 -0000
Content-Type: text/plain

1.Upgrade python-paste from 2.0.3 to 3.0.6.

2.Add pytest-runner to run pytest

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../{python-paste_2.0.3.bb => python-paste_3.0.6.bb}       | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paste_2.0.3.bb => python-paste_3.0.6.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python-paste_2.0.3.bb b/meta-python/recipes-devtools/python/python-paste_3.0.6.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python-paste_2.0.3.bb
rename to meta-python/recipes-devtools/python/python-paste_3.0.6.bb
index 6b4019f84..4d5c3239b 100644
--- a/meta-python/recipes-devtools/python/python-paste_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python-paste_3.0.6.bb
@@ -5,10 +5,13 @@ RDEPENDS_${PN} = "python-six"
 
 LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
-SRC_URI[md5sum] = "1231e14eae62fa7ed76e9130b04bc61e"
-SRC_URI[sha256sum] = "2346a347824c32641bf020c17967b49ae74d3310ec1bc9b958d4b84e2d985218"
+SRC_URI[md5sum] = "4e93762f24fc728ecb4ddcff2693df39"
+SRC_URI[sha256sum] = "06aacf7a40685be0a0db8b26516e7d559d7fe5ccf7a47c5cd34f15ab558a8b92"
 
 PYPI_PACKAGE = "Paste"
 inherit pypi setuptools
 
 FILES_${PN} += "/usr/lib/*"
+
+DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+
-- 
2.17.2




