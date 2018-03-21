Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EBE267894E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:36:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38026068"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Mar 2018 11:36:20 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2040448AE76D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:36:21 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 21 Mar 2018 11:36:19 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Mar 2018 11:36:10 +0800
Message-ID: <1521603377-34881-5-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 2040448AE76D.A3C0C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-cffi: 1.11.4 -> 1.11.5
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
X-List-Received-Date: Wed, 21 Mar 2018 03:36:21 -0000
Content-Type: text/plain

Upgrade python-cffi from 1.11.4 to 1.11.5.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cffi.inc                   | 4 ++--
 .../python/{python-cffi_1.11.4.bb => python-cffi_1.11.5.bb}           | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.11.4.bb => python-cffi_1.11.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index 39ab19f..e6071ee 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "8ef0f852498908b20bc508799901fe93"
-SRC_URI[sha256sum] = "df9083a992b17a28cd4251a3f5c879e0198bb26c9e808c4647e0a18739f1d11d"
+SRC_URI[md5sum] = "ac8492f4ad952360737413e82d661908"
+SRC_URI[sha256sum] = "e90f17980e6ab0f3c2f3730e56d1fe9bcba1891eeea58966e89d352492cc74f4"
 
 RDEPENDS_${PN}_class-target = " \
     ${PYTHON_PN}-ctypes \
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.11.4.bb b/meta-python/recipes-devtools/python/python-cffi_1.11.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cffi_1.11.4.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.11.5.bb
-- 
2.7.4




