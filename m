Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1F3F47F630
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 07:04:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,306,1566835200"; d="scan'208";a="77091478"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Oct 2019 15:04:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 886D94CE14E1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 15:04:14 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 17 Oct 2019 15:04:34 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Oct 2019 15:04:46 +0800
Message-ID: <20191017070446.2733-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 886D94CE14E1.A868B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] protobuf: upgrade 3.9.2 -> 3.10.0
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
X-List-Received-Date: Thu, 17 Oct 2019 07:04:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../protobuf/{protobuf_3.9.2.bb => protobuf_3.10.0.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.9.2.bb => protobuf_3.10.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.9.2.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.10.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.9.2.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.10.0.bb
index a007b2a..9284541 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.9.2.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.10.0.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS_append_class-target = " protobuf-native"
 
-SRCREV = "52b2447247f535663ac1c292e088b4b27d2910ef"
+SRCREV = "6d4e7fd7966c989e38024a8ea693db83758944f1"
 
-SRC_URI = "git://github.com/google/protobuf.git;branch=3.9.x \
+SRC_URI = "git://github.com/google/protobuf.git;branch=3.10.x \
            file://run-ptest \
            file://0001-protobuf-fix-configure-error.patch \
            file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch \
-- 
2.7.4




