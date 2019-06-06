Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 73F3A7D68F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 03:29:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,557,1549900800"; d="scan'208";a="66169066"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jun 2019 11:29:21 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 0F1D34CDCEA5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 11:29:21 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 6 Jun 2019 11:29:27 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 6 Jun 2019 11:30:34 +0800
Message-ID: <20190606033034.9152-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 0F1D34CDCEA5.AE990
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cachetools: upgrade 3.1.0 -> 3.1.1
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
X-List-Received-Date: Thu, 06 Jun 2019 03:29:22 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-cachetools_3.1.0.bb to python-cachetools_3.1.1.bb.

-Upgrade from python3-cachetools_3.1.0.bb to python3-cachetools_3.1.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cachetools.inc     | 4 ++--
 ...{python-cachetools_3.1.0.bb => python-cachetools_3.1.1.bb} | 0
 ...ython3-cachetools_3.1.0.bb => python3-cachetools_3.1.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cachetools_3.1.0.bb => python-cachetools_3.1.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cachetools_3.1.0.bb => python3-cachetools_3.1.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cachetools.inc b/meta-python/recipes-devtools/python/python-cachetools.inc
index 52ae3186d..9c793808f 100644
--- a/meta-python/recipes-devtools/python/python-cachetools.inc
+++ b/meta-python/recipes-devtools/python/python-cachetools.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=27f7518eb6f7dc686d0f953b2f28dae5"
 
 inherit pypi
 
-SRC_URI[md5sum] = "a7b1c5eb5390d50067c62d7bcb4e875c"
-SRC_URI[sha256sum] = "9efcc9fab3b49ab833475702b55edd5ae07af1af7a4c627678980b45e459c460"
+SRC_URI[md5sum] = "91aa9b611b6345154df84e8e37746f41"
+SRC_URI[sha256sum] = "8ea2d3ce97850f31e4a08b0e2b5e6c34997d7216a9d2c98e0f3978630d4da69a"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-cachetools_3.1.0.bb b/meta-python/recipes-devtools/python/python-cachetools_3.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cachetools_3.1.0.bb
rename to meta-python/recipes-devtools/python/python-cachetools_3.1.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-cachetools_3.1.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_3.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cachetools_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_3.1.1.bb
-- 
2.20.1




