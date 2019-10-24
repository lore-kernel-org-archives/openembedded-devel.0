Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 86ECD7D185
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 05:28:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,223,1569254400"; d="scan'208";a="77395324"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Oct 2019 13:28:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6F8F14B6EC86
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 13:20:30 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 24 Oct 2019 13:28:24 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Oct 2019 13:28:38 +0800
Message-ID: <20191024052838.1587-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 6F8F14B6EC86.AB66B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-astroid: upgrade 1.6.5 -> 2.3.2
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
X-List-Received-Date: Thu, 24 Oct 2019 05:28:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Add depends:pytest-runner-native.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-astroid.inc              | 6 ++++--
 .../python/{python-astroid_1.6.5.bb => python-astroid_2.3.2.bb}     | 0
 .../python/{python3-astroid_1.6.5.bb => python3-astroid_2.3.2.bb}   | 0
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-astroid_1.6.5.bb => python-astroid_2.3.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-astroid_1.6.5.bb => python3-astroid_2.3.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-astroid.inc b/meta-python/recipes-devtools/python/python-astroid.inc
index fae0f13..171d320 100644
--- a/meta-python/recipes-devtools/python/python-astroid.inc
+++ b/meta-python/recipes-devtools/python/python-astroid.inc
@@ -4,11 +4,13 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI[md5sum] = "2dd01ef0d5b5f0fc754c1ba40137b61c"
-SRC_URI[sha256sum] = "fc9b582dba0366e63540982c3944a9230cbc6f303641c51483fa547dcc22393a"
+SRC_URI[md5sum] = "b2cd5c0383ff33c1410e737c2607aa7a"
+SRC_URI[sha256sum] = "09a3fba616519311f1af8a461f804b68f0370e100c9264a035aa7846d7852e33"
 
 inherit pypi
 
+DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+
 PACKAGES =+ "${PN}-tests"
 
 FILES_${PN}-tests += " \
diff --git a/meta-python/recipes-devtools/python/python-astroid_1.6.5.bb b/meta-python/recipes-devtools/python/python-astroid_2.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-astroid_1.6.5.bb
rename to meta-python/recipes-devtools/python/python-astroid_2.3.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-astroid_1.6.5.bb b/meta-python/recipes-devtools/python/python3-astroid_2.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-astroid_1.6.5.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.3.2.bb
-- 
2.7.4




