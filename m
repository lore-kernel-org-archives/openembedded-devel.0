Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C60546B43D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 06:54:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,328,1574092800"; d="scan'208";a="82105977"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2020 14:54:30 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 8004C4CE20F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 14:45:21 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 17 Jan 2020 14:54:27 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 17 Jan 2020 14:54:28 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jan 2020 14:55:58 +0800
Message-ID: <20200117065558.19959-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 8004C4CE20F6.A5B00
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-yappi: upgrade 1.0 -> 1.2.3
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
X-List-Received-Date: Fri, 17 Jan 2020 06:54:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-yappi.inc        | 6 +++---
 .../python/{python-yappi_1.0.bb => python-yappi_1.2.3.bb}   | 0
 .../python/{python3-yappi_1.0.bb => python3-yappi_1.2.3.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-yappi_1.0.bb => python-yappi_1.2.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-yappi_1.0.bb => python3-yappi_1.2.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-yappi.inc b/meta-python/recipes-devtools/python/python-yappi.inc
index 54d408742..e84774f9d 100644
--- a/meta-python/recipes-devtools/python/python-yappi.inc
+++ b/meta-python/recipes-devtools/python/python-yappi.inc
@@ -2,10 +2,10 @@ SUMMARY  = "Yet Another Python Profiler"
 HOMEPAGE = "http://yappi.googlecode.com/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9a193c13f346884e597acdcac7fe9ac8"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=91efaebbca5a9e4db0870636d36e7b98"
 
-SRC_URI[md5sum] = "a545101aa8a435b0780f06f4723f58c8"
-SRC_URI[sha256sum] = "7f814131515d51db62b1a3468bcb84de30499124752806a5a6e11caf0b4344bf"
+SRC_URI[md5sum] = "36474a3e47ad9a2e4605b8e7e30a08fc"
+SRC_URI[sha256sum] = "b8db9bc607610d6da4e27e87ec828ebddec4bdaac89ca07ebfe9a153b0641580"
 
 inherit pypi setuptools
 
diff --git a/meta-python/recipes-devtools/python/python-yappi_1.0.bb b/meta-python/recipes-devtools/python/python-yappi_1.2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-yappi_1.0.bb
rename to meta-python/recipes-devtools/python/python-yappi_1.2.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.0.bb b/meta-python/recipes-devtools/python/python3-yappi_1.2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-yappi_1.0.bb
rename to meta-python/recipes-devtools/python/python3-yappi_1.2.3.bb
-- 
2.20.1




