Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7BC77FA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 06:09:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I69TRu013603
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jul 2017 23:09:29 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 23:09:28 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Jul 2017 02:09:09 -0400
Message-ID: <e1a6d0a8d55255cbe21f5da475942a106a73df41.1500357921.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500357921.git.hongxu.jia@windriver.com>
References: <cover.1500357921.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] python3-requests-file: add recipe 1.4.2
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
X-List-Received-Date: Tue, 18 Jul 2017 06:09:29 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/python/python3-requests-file_1.4.2.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-file_1.4.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-requests-file_1.4.2.bb b/meta-python/recipes-devtools/python/python3-requests-file_1.4.2.bb
new file mode 100644
index 0000000..8652876
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests-file_1.4.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "File transport adapter for Requests"
+HOMEPAGE = "http://github.com/dashea/requests-file"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9cc728d6087e43796227b0a31422de6b"
+
+SRC_URI[md5sum] = "a907efb75faf0ccbb1857432bf9d8c0f"
+SRC_URI[sha256sum] = "f518e7cfe048e053fd1019dfb891b4c55b871c56c5a31693d733240c80b8f191"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    python3-requests \
+"
+
-- 
2.8.1


