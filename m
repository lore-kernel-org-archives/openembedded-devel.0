Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 17E967F944
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 01:39:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,388,1571673600"; d="scan'208";a="81257290"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Jan 2020 09:39:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 69436406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 09:30:48 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 3 Jan 2020 09:39:43 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 3 Jan 2020 09:39:45 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 22:09:29 -0800
Message-ID: <1578031770-88411-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578031770-88411-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578031770-88411-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 69436406AB15.AFEBE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-cachetools: upgrade 3.1.1 -> 4.0.0
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
X-List-Received-Date: Fri, 03 Jan 2020 01:39:47 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cachetools.inc     | 4 ++--
 ...{python-cachetools_3.1.1.bb => python-cachetools_4.0.0.bb} | 0
 ...ython3-cachetools_3.1.1.bb => python3-cachetools_4.0.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cachetools_3.1.1.bb => python-cachetools_4.0.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cachetools_3.1.1.bb => python3-cachetools_4.0.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cachetools.inc b/meta-python/recipes-devtools/python/python-cachetools.inc
index 9c793808f..f3d3bc6bc 100644
--- a/meta-python/recipes-devtools/python/python-cachetools.inc
+++ b/meta-python/recipes-devtools/python/python-cachetools.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=27f7518eb6f7dc686d0f953b2f28dae5"
 
 inherit pypi
 
-SRC_URI[md5sum] = "91aa9b611b6345154df84e8e37746f41"
-SRC_URI[sha256sum] = "8ea2d3ce97850f31e4a08b0e2b5e6c34997d7216a9d2c98e0f3978630d4da69a"
+SRC_URI[md5sum] = "6a88df13467e80eb61dd2bedad19b83c"
+SRC_URI[sha256sum] = "9a52dd97a85f257f4e4127f15818e71a0c7899f121b34591fcc1173ea79a0198"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-cachetools_3.1.1.bb b/meta-python/recipes-devtools/python/python-cachetools_4.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cachetools_3.1.1.bb
rename to meta-python/recipes-devtools/python/python-cachetools_4.0.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-cachetools_3.1.1.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cachetools_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_4.0.0.bb
-- 
2.17.1




