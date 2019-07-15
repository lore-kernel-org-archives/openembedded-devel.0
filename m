Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DF9377D3CE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 05:54:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,493,1557158400"; d="scan'208";a="71445973"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jul 2019 13:54:45 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A3F504CDE64B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:54:30 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 15 Jul 2019 13:54:45 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jul 2019 13:53:56 +0800
Message-ID: <20190715055356.17821-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: A3F504CDE64B.A67BA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-protobuf: upgrade 3.8.0 -> 3.9.0
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
X-List-Received-Date: Mon, 15 Jul 2019 05:54:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-protobuf_3.8.0.bb to python-protobuf_3.9.0.bb.

-Upgrade from python3-protobuf_3.8.0.bb to python3-protobuf_3.9.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-protobuf.inc               | 4 ++--
 .../python/{python-protobuf_3.8.0.bb => python-protobuf_3.9.0.bb}     | 0
 .../python/{python3-protobuf_3.8.0.bb => python3-protobuf_3.9.0.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-protobuf_3.8.0.bb => python-protobuf_3.9.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.8.0.bb => python3-protobuf_3.9.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
index 2929700..b13f10e 100644
--- a/meta-python/recipes-devtools/python/python-protobuf.inc
+++ b/meta-python/recipes-devtools/python/python-protobuf.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi
 
-SRC_URI[md5sum] = "b7095f3eb736459716d606677b5a29ee"
-SRC_URI[sha256sum] = "8c61cc8a76e9d381c665aecc5105fa0f1878cf7db8b5cd17202603bcb386d0fc"
+SRC_URI[md5sum] = "4ec7b2d49a5d1460591e520b54153c87"
+SRC_URI[sha256sum] = "b3452bbda12b1cbe2187d416779de07b2ab4c497d83a050e43c344778763721d"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
diff --git a/meta-python/recipes-devtools/python/python-protobuf_3.8.0.bb b/meta-python/recipes-devtools/python/python-protobuf_3.9.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-protobuf_3.8.0.bb
rename to meta-python/recipes-devtools/python/python-protobuf_3.9.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.8.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.9.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.8.0.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.9.0.bb
-- 
2.7.4




