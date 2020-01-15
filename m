Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3646C7F9BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 09:29:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,322,1574092800"; d="scan'208";a="81889282"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2020 17:29:18 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 57C984CE1C86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 17:20:13 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 15 Jan 2020 17:29:17 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 Jan 2020 17:29:27 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2020 05:12:25 -0800
Message-ID: <1579093951-77460-10-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 57C984CE1C86.A2588
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-cmd2: upgrade 0.9.22 -> 0.9.23
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
X-List-Received-Date: Wed, 15 Jan 2020 09:29:19 -0000
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cmd2.inc         | 6 +++---
 .../python/{python-cmd2_0.9.22.bb => python-cmd2_0.9.23.bb} | 0
 .../{python3-cmd2_0.9.22.bb => python3-cmd2_0.9.23.bb}      | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.9.22.bb => python-cmd2_0.9.23.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cmd2_0.9.22.bb => python3-cmd2_0.9.23.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2.inc b/meta-python/recipes-devtools/python/python-cmd2.inc
index ceaa181d5..68381ad22 100644
--- a/meta-python/recipes-devtools/python/python-cmd2.inc
+++ b/meta-python/recipes-devtools/python/python-cmd2.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
 
-SRC_URI[md5sum] = "90dccab3a20106c543ef85d2bee720bb"
-SRC_URI[sha256sum] = "ba244b07c0b465ff54a6838dc61919599141dc92de1bf00bb0a70875189155e6"
+SRC_URI[md5sum] = "6db66a06210d5f1edb44693b887ed62b"
+SRC_URI[sha256sum] = "8ad12ef3cc46d03073c545b6e80a3f84a5921f6653073a60e7d9a7ff3b352c9e"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.22.bb b/meta-python/recipes-devtools/python/python-cmd2_0.9.23.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cmd2_0.9.22.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.9.23.bb
diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.22.bb b/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cmd2_0.9.22.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
-- 
2.17.1




