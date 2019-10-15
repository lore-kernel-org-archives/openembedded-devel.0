Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E1C4A7F2FD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 07:09:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,298,1566835200"; d="scan'208";a="76985008"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Oct 2019 15:09:49 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id DFD924CE1505
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 15:09:29 +0800 (CST)
Received: from localhost.localdomain (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 15 Oct 2019 15:09:46 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Oct 2019 15:09:18 +0800
Message-ID: <20191015070918.20555-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: DFD924CE1505.A8D36
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-protobuf: upgrade 3.9.2 -> 3.10.0
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
X-List-Received-Date: Tue, 15 Oct 2019 07:09:49 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-protobuf.inc       | 4 ++--
 .../{python-protobuf_3.9.2.bb => python-protobuf_3.10.0.bb}   | 0
 .../{python3-protobuf_3.9.2.bb => python3-protobuf_3.10.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-protobuf_3.9.2.bb => python-protobuf_3.10.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.9.2.bb => python3-protobuf_3.10.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
index 406131108..e2376952c 100644
--- a/meta-python/recipes-devtools/python/python-protobuf.inc
+++ b/meta-python/recipes-devtools/python/python-protobuf.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8
 
 inherit pypi
 
-SRC_URI[md5sum] = "d634666c898148e4565ac62f3ba4a2ca"
-SRC_URI[sha256sum] = "843f498e98ad1469ad54ecb4a7ccf48605a1c5d2bd26ae799c7a2cddab4a37ec"
+SRC_URI[md5sum] = "fe72775d61de7acb58c46f27377ae9ca"
+SRC_URI[sha256sum] = "db83b5c12c0cd30150bb568e6feb2435c49ce4e68fe2d7b903113f0e221e58fe"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
diff --git a/meta-python/recipes-devtools/python/python-protobuf_3.9.2.bb b/meta-python/recipes-devtools/python/python-protobuf_3.10.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-protobuf_3.9.2.bb
rename to meta-python/recipes-devtools/python/python-protobuf_3.10.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.9.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.10.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.9.2.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.10.0.bb
-- 
2.20.1




