Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EAEE978D22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 01:47:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6U1ljn6012286
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2018 18:47:46 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Sun, 29 Jul 2018 18:47:45 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 29 Jul 2018 18:47:43 -0700
Message-ID: <20180730014743.18367-2-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180730014743.18367-1-hongzhi.song@windriver.com>
References: <20180730014743.18367-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v4 1/1] snappy: add a new recipe
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
X-List-Received-Date: Mon, 30 Jul 2018 01:47:45 -0000
Content-Type: text/plain

Snappy is a compression/decompression library. It does not aim for
maximum compression, or compatibility with any other compression
library; instead, it aims for very high speeds and reasonable compression.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta-oe/recipes-extended/snappy/snappy_1.1.7.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-extended/snappy/snappy_1.1.7.bb

diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
new file mode 100644
index 000000000..6f1978a07
--- /dev/null
+++ b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
@@ -0,0 +1,21 @@
+#
+# Copyright (C) 2014 Wind River Systems, Inc.
+# Released under the BSD-3-Clause license (see COPYING.BSD-3 for the terms)
+#
+SUMMARY = "A compression/decompression library"
+DESCRIPTION = "Snappy is a fast data compression and decompression library \
+It was designed to be very fast and stable, but not to achieve a high \
+compression ratio."
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
+
+SRC_URI = "https://src.fedoraproject.org/repo/pkgs/snappy/snappy-1.1.7.tar.gz/sha512/32046f532606ba545a4e4825c0c66a19be449f2ca2ff760a6fa170a3603731479a7deadb683546e5f8b5033414c50f4a9a29f6d23b7a41f047e566e69eca7caf/snappy-1.1.7.tar.gz"
+
+SRC_URI[md5sum] = "ee9086291c9ae8deb4dac5e0b85bf54a"
+SRC_URI[sha256sum] = "3dfa02e873ff51a11ee02b9ca391807f0c8ea0529a4924afa645fbf97163f9d4"
+
+inherit cmake pkgconfig
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lzo] = "-DHAVE_LIBLZO2=1,-DHAVE_LIBLZO2=0,lzo,"
-- 
2.11.0


