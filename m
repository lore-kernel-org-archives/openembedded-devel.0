Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DFEAF7F9C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 05:36:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81229903"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 13:36:37 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 0354249E9303
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 13:27:44 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 13:36:36 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020 13:36:37 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 13:37:53 +0800
Message-ID: <20200102053753.13318-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 0354249E9303.A9B93
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-passlib: upgrade 1.7.1 -> 1.7.2
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
X-List-Received-Date: Thu, 02 Jan 2020 05:36:38 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-passlib.inc      | 6 +++---
 .../{python-passlib_1.7.1.bb => python-passlib_1.7.2.bb}    | 0
 .../{python3-passlib_1.7.1.bb => python3-passlib_1.7.2.bb}  | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-passlib_1.7.1.bb => python-passlib_1.7.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-passlib_1.7.1.bb => python3-passlib_1.7.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-passlib.inc b/meta-python/recipes-devtools/python/python-passlib.inc
index 8a6d7e9b2..9cf02807a 100644
--- a/meta-python/recipes-devtools/python/python-passlib.inc
+++ b/meta-python/recipes-devtools/python/python-passlib.inc
@@ -7,10 +7,10 @@ tasks, from verifying a hash found in /etc/shadow, to providing full-strength pa
 hashing for multi-user applications."
 HOMEPAGE = "https://bitbucket.org/ecollins/passlib"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=73eed1a5470b969951dac411086c7036"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=44fd7dcd5d42b48d6dea59ac643a0179"
 
-SRC_URI[md5sum] = "254869dae3fd9f09f0746a3cb29a0b15"
-SRC_URI[sha256sum] = "3d948f64138c25633613f303bcc471126eae67c04d5e3f6b7b8ce6242f8653e0"
+SRC_URI[md5sum] = "b908529cfd4c33057c244324c692eae7"
+SRC_URI[sha256sum] = "8d666cef936198bc2ab47ee9b0410c94adf2ba798e5a84bf220be079ae7ab6a8"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-crypt \
diff --git a/meta-python/recipes-devtools/python/python-passlib_1.7.1.bb b/meta-python/recipes-devtools/python/python-passlib_1.7.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-passlib_1.7.1.bb
rename to meta-python/recipes-devtools/python/python-passlib_1.7.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-passlib_1.7.1.bb b/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-passlib_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
-- 
2.20.1




