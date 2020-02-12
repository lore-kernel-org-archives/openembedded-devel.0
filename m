Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2733061051
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2020 10:55:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83207927"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Feb 2020 18:55:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 856AE406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2020 18:46:00 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 12 Feb 2020 18:55:30 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 12 Feb 2020 18:55:38 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Feb 2020 10:35:57 -0800
Message-ID: <1581532558-107111-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581532558-107111-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1581532558-107111-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 856AE406AB15.A05D5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python3-configparser: upgrade 3.8.1 -> 4.0.2
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
X-List-Received-Date: Wed, 12 Feb 2020 10:55:38 -0000
Content-Type: text/plain

Add build dependency of setuptools-scm-native for python3-configparser.

Error message:
ERROR: Do not try to fetch `setuptools_scm>=1.15.0' for building. Please
add its native recipe to DEPENDS.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-configparser.inc        | 7 ++++---
 ...configparser_3.8.1.bb => python3-configparser_4.0.2.bb} | 0
 2 files changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configparser_3.8.1.bb => python3-configparser_4.0.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-configparser.inc b/meta-python/recipes-devtools/python/python-configparser.inc
index 8ecfe221d..bce7cee46 100644
--- a/meta-python/recipes-devtools/python/python-configparser.inc
+++ b/meta-python/recipes-devtools/python/python-configparser.inc
@@ -5,9 +5,10 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa"
 
-SRC_URI[md5sum] = "bc1558ed941cb1acb80ff650726d5af8"
-SRC_URI[sha256sum] = "bc37850f0cc42a1725a796ef7d92690651bf1af37d744cc63161dac62cabee17"
+SRC_URI[md5sum] = "35926cc4b9133f1f9ca70a1fd2fdf237"
+SRC_URI[sha256sum] = "c7d282687a5308319bf3d2e7706e575c635b0a470342641c93bea0ea3b5331df"
 
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 inherit pypi
 
-BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-configparser_3.8.1.bb b/meta-python/recipes-devtools/python/python3-configparser_4.0.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-configparser_3.8.1.bb
rename to meta-python/recipes-devtools/python/python3-configparser_4.0.2.bb
-- 
2.17.1




