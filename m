Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2896BE2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 06:06:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1F66GcA008992
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Feb 2019 22:06:26 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 14 Feb 2019 22:06:05 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 01:04:50 -0500
Message-ID: <fe9b17af46281ae6c9a1ea351d686ab8fd1f46a7.1550210289.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1550210289.git.hongxu.jia@windriver.com>
References: <cover.1550210289.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/12] python3-markdown: add version 3.0.1
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
X-List-Received-Date: Fri, 15 Feb 2019 06:06:51 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/python/python3-markdown_3.0.1.bb        | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb b/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb
new file mode 100644
index 0000000..b6d2f18
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A Python implementation of John Gruber's Markdown."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "Markdown"
+PYPI_SRC_URI = "https://files.pythonhosted.org/packages/3c/52/7bae9e99a7a4be6af4a713fe9b692777e6468d28991c54c273dfb6ec9fb2/Markdown-${PV}.tar.gz"
+SRC_URI[md5sum] = "72219f46ca440b657bf227500731bdf1"
+SRC_URI[sha256sum] = "d02e0f9b04c500cde6637c11ad7c72671f359b87b9fe924b2383649d8841db7c"
+
+BBCLASSEXTEND = "native"
-- 
2.8.1


