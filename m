Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4B2597E728
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 05:45:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,363,1557158400"; d="scan'208";a="67035830"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jun 2019 13:45:42 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 68DB14CD846F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 13:45:44 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 12 Jun 2019 13:45:40 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Jun 2019 13:46:57 +0800
Message-ID: <20190612054657.3908-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 68DB14CD846F.A8849
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-psutil: upgrade 5.6.2 -> 5.6.3
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
X-List-Received-Date: Wed, 12 Jun 2019 05:45:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-psutil_5.6.2.bb to python-psutil_5.6.3.bb.

-Upgrade from python3-psutil_5.6.2.bb to python3-psutil_5.6.3.bb.

-License-Update: Simplified introduction to the license for this package.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-psutil.inc       | 6 +++---
 .../{python-psutil_5.6.2.bb => python-psutil_5.6.3.bb}      | 0
 .../{python3-psutil_5.6.2.bb => python3-psutil_5.6.3.bb}    | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_5.6.2.bb => python-psutil_5.6.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.6.2.bb => python3-psutil_5.6.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index acf4ddd6e..e466c5cd4 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -1,9 +1,9 @@
 SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
 
-SRC_URI[md5sum] = "571962acd249bcfbae317884af47c402"
-SRC_URI[sha256sum] = "828e1c3ca6756c54ac00f1427fdac8b12e21b8a068c3bb9b631a1734cada25ed"
+SRC_URI[md5sum] = "1bbc1788588cc3c2c461cd98a830ba72"
+SRC_URI[sha256sum] = "863a85c1c0a5103a12c05a35e59d336e1d665747e531256e061213e2e90f63f3"
 
 PACKAGES =+ "${PN}-tests"
 
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.6.2.bb b/meta-python/recipes-devtools/python/python-psutil_5.6.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-psutil_5.6.2.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.6.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.6.2.bb b/meta-python/recipes-devtools/python/python3-psutil_5.6.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.6.2.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.6.3.bb
-- 
2.20.1




