Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B93D97F968
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 05:41:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,250,1569254400"; d="scan'208";a="77724004"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2019 13:41:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4257A4B6EC6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 13:33:55 +0800 (CST)
Received: from localhost.localdomain (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 31 Oct 2019 13:41:54 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 13:42:02 +0800
Message-ID: <20191031054202.28870-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 4257A4B6EC6E.A87C0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-evdev: upgrade 0.7.0 -> 1.2.0
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
X-List-Received-Date: Thu, 31 Oct 2019 05:41:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-evdev.inc          | 4 ++--
 .../python/{python-evdev_0.7.0.bb => python-evdev_1.2.0.bb}   | 0
 .../python/{python3-evdev_0.7.0.bb => python3-evdev_1.2.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-evdev_0.7.0.bb => python-evdev_1.2.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-evdev_0.7.0.bb => python3-evdev_1.2.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-evdev.inc b/meta-python/recipes-devtools/python/python-evdev.inc
index 989d1e5f6..953094ba7 100644
--- a/meta-python/recipes-devtools/python/python-evdev.inc
+++ b/meta-python/recipes-devtools/python/python-evdev.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
 
-SRC_URI[md5sum] = "c7e855ae9f97f869a59e75b29f05ce74"
-SRC_URI[sha256sum] = "57edafc469a414f58b51af1bfb9ee2babb9f626dd2df530d71c1176871850aa1"
+SRC_URI[md5sum] = "53e440943dfa2514f95b3c448d6a36cb"
+SRC_URI[sha256sum] = "b03f5e1be5b4a5327494a981b831d251a142b09e8778eda1a8b53eba91100166"
 
 do_compile_prepend() {
     rm -rf ${S}/evdev/ecodes.c
diff --git a/meta-python/recipes-devtools/python/python-evdev_0.7.0.bb b/meta-python/recipes-devtools/python/python-evdev_1.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-evdev_0.7.0.bb
rename to meta-python/recipes-devtools/python/python-evdev_1.2.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-evdev_0.7.0.bb b/meta-python/recipes-devtools/python/python3-evdev_1.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-evdev_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-evdev_1.2.0.bb
-- 
2.20.1




