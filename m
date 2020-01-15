Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 88C1B7FA35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 09:29:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,322,1574092800"; d="scan'208";a="81889292"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2020 17:29:25 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id A53B24CE20FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 17:20:19 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 15 Jan 2020 17:29:25 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 Jan 2020 17:29:35 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2020 05:12:28 -0800
Message-ID: <1579093951-77460-13-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: A53B24CE20FB.A42CF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-kconfiglib: upgrade 10.42.0 -> 13.7.0
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
X-List-Received-Date: Wed, 15 Jan 2020 09:29:25 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python-kconfiglib-10.42.0.inc => python-kconfiglib.inc}  | 4 ++--
 .../recipes-devtools/python/python3-kconfiglib_10.42.0.bb     | 2 --
 .../recipes-devtools/python/python3-kconfiglib_13.7.0.bb      | 2 ++
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-kconfiglib-10.42.0.inc => python-kconfiglib.inc} (58%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-kconfiglib_10.42.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-kconfiglib_13.7.0.bb

diff --git a/meta-python/recipes-devtools/python/python-kconfiglib-10.42.0.inc b/meta-python/recipes-devtools/python/python-kconfiglib.inc
similarity index 58%
rename from meta-python/recipes-devtools/python/python-kconfiglib-10.42.0.inc
rename to meta-python/recipes-devtools/python/python-kconfiglib.inc
index 72d6a6592..c82b26bce 100644
--- a/meta-python/recipes-devtools/python/python-kconfiglib-10.42.0.inc
+++ b/meta-python/recipes-devtools/python/python-kconfiglib.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Kconfiglib is a Kconfig implementation in Python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=712177a72a3937909543eda3ad1bfb7c"
 
-SRC_URI[md5sum] = "2306279a050c6a888f34a5719047f217"
-SRC_URI[sha256sum] = "0070eb9061f924e1fa7bc2b1f0aeea1d38e1ddf9bbdbd4b5c346bcf1a0848674"
+SRC_URI[md5sum] = "7879aa13d306263e95146439d3959f23"
+SRC_URI[sha256sum] = "8dbb946d41a33cec2b63432393a4920479c8c9fa8d5bbca468c4e8a673be6e36"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-kconfiglib_10.42.0.bb b/meta-python/recipes-devtools/python/python3-kconfiglib_10.42.0.bb
deleted file mode 100644
index 10b039a75..000000000
--- a/meta-python/recipes-devtools/python/python3-kconfiglib_10.42.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-kconfiglib-${PV}.inc
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-kconfiglib_13.7.0.bb b/meta-python/recipes-devtools/python/python3-kconfiglib_13.7.0.bb
new file mode 100644
index 000000000..ab0944ff7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-kconfiglib_13.7.0.bb
@@ -0,0 +1,2 @@
+require python-kconfiglib.inc
+inherit pypi setuptools3
-- 
2.17.1




