Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C258D79CB3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 07:09:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,348,1559491200"; d="scan'208";a="72981678"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Aug 2019 15:09:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6D4A94CDB941
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 15:09:25 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 5 Aug 2019 15:09:29 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Aug 2019 15:08:43 +0800
Message-ID: <20190805070843.30763-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 6D4A94CDB941.AD43A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-jsonpatch: upgrade 1.23 -> 1.24
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
X-List-Received-Date: Mon, 05 Aug 2019 07:09:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-jsonpatch.inc              | 4 ++--
 .../python/{python-jsonpatch_1.23.bb => python-jsonpatch_1.24.bb}     | 0
 .../python/{python3-jsonpatch_1.23.bb => python3-jsonpatch_1.24.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jsonpatch_1.23.bb => python-jsonpatch_1.24.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.23.bb => python3-jsonpatch_1.24.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-jsonpatch.inc b/meta-python/recipes-devtools/python/python-jsonpatch.inc
index 409c09a..8f64c2a 100644
--- a/meta-python/recipes-devtools/python/python-jsonpatch.inc
+++ b/meta-python/recipes-devtools/python/python-jsonpatch.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi
 
-SRC_URI[md5sum] = "83c4c9faccb4a2ff8c1db80cbddc590d"
-SRC_URI[sha256sum] = "49f29cab70e9068db3b1dc6b656cbe2ee4edf7dfe9bf5a0055f17a4b6804a4b9"
+SRC_URI[md5sum] = "e86503f05fa192fa870d7004b8ce929a"
+SRC_URI[sha256sum] = "cbb72f8bf35260628aea6b508a107245f757d1ec839a19c34349985e2c05645a"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
 
diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.23.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.24.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-jsonpatch_1.23.bb
rename to meta-python/recipes-devtools/python/python-jsonpatch_1.24.bb
diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.23.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.24.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.23.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.24.bb
-- 
2.7.4




