Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0004B7E71C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 02:33:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,414,1559491200"; d="scan'208";a="74038587"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Aug 2019 10:33:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5E6C44CE03E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 10:33:49 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 22 Aug 2019 10:33:54 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Aug 2019 11:33:13 +0900
Message-ID: <20190822023313.118131-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 5E6C44CE03E6.AF6FC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-protobuf: upgrade 3.9.0 -> 3.9.1
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
X-List-Received-Date: Thu, 22 Aug 2019 02:33:54 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-protobuf.inc       | 4 ++--
 .../{python-protobuf_3.9.0.bb => python-protobuf_3.9.1.bb}    | 0
 .../{python3-protobuf_3.9.0.bb => python3-protobuf_3.9.1.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-protobuf_3.9.0.bb => python-protobuf_3.9.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.9.0.bb => python3-protobuf_3.9.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
index b13f10e36..ce95e66c9 100644
--- a/meta-python/recipes-devtools/python/python-protobuf.inc
+++ b/meta-python/recipes-devtools/python/python-protobuf.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi
 
-SRC_URI[md5sum] = "4ec7b2d49a5d1460591e520b54153c87"
-SRC_URI[sha256sum] = "b3452bbda12b1cbe2187d416779de07b2ab4c497d83a050e43c344778763721d"
+SRC_URI[md5sum] = "ca881f18795e024a2b935d5bae9b1ebe"
+SRC_URI[sha256sum] = "d831b047bd69becaf64019a47179eb22118a50dd008340655266a906c69c6417"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
diff --git a/meta-python/recipes-devtools/python/python-protobuf_3.9.0.bb b/meta-python/recipes-devtools/python/python-protobuf_3.9.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-protobuf_3.9.0.bb
rename to meta-python/recipes-devtools/python/python-protobuf_3.9.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.9.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.9.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.9.0.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.9.1.bb
-- 
2.17.1




