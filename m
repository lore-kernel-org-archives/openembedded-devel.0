Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id AD0AE7D277
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 06:03:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,360,1549900800"; d="scan'208";a="59505922"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Apr 2019 14:03:59 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AB2644CD84CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 14:03:58 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 17 Apr 2019 14:03:58 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Apr 2019 14:04:48 +0800
Message-ID: <20190417060448.14702-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: AB2644CD84CA.A8BDD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-psutil: upgrade 5.4.6 -> 5.6.1
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
X-List-Received-Date: Wed, 17 Apr 2019 06:04:00 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-psutil_5.4.6.bb to python-psutil_5.6.1.bb.

-Upgrade from python3-psutil_5.4.6.bb to python3-psutil_5.6.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-psutil.inc         | 4 ++--
 .../python/{python-psutil_5.4.6.bb => python-psutil_5.6.1.bb} | 0
 .../{python3-psutil_5.4.6.bb => python3-psutil_5.6.1.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_5.4.6.bb => python-psutil_5.6.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.4.6.bb => python3-psutil_5.6.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index 67ae118bc..c70b4cf51 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,8 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
-SRC_URI[md5sum] = "200e073cdd56cc7a9ba9a06088569200"
-SRC_URI[sha256sum] = "686e5a35fe4c0acc25f3466c32e716f2d498aaae7b7edc03e2305b682226bcf6"
+SRC_URI[md5sum] = "765a4179f02c149794a6e99d890dfa4b"
+SRC_URI[sha256sum] = "fa0a570e0a30b9dd618bffbece590ae15726b47f9f1eaf7518dfb35f4d7dcd21"
 
 PACKAGES =+ "${PN}-tests"
 
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.4.6.bb b/meta-python/recipes-devtools/python/python-psutil_5.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-psutil_5.4.6.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.6.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.4.6.bb b/meta-python/recipes-devtools/python/python3-psutil_5.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.4.6.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.6.1.bb
-- 
2.20.1




