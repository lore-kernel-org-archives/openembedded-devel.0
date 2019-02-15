Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEFDD7C697
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 06:07:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1F66kuD008997
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Feb 2019 22:06:56 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 14 Feb 2019 22:06:35 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 01:04:53 -0500
Message-ID: <7e5aec8acc2ebf7c2c5c1a5ad29ac60986b0af51.1550210289.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1550210289.git.hongxu.jia@windriver.com>
References: <cover.1550210289.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/12] python3-astor: add version 0.7.1
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
X-List-Received-Date: Fri, 15 Feb 2019 06:07:20 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python3-astor_0.7.1.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-astor_0.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-astor_0.7.1.bb b/meta-python/recipes-devtools/python/python3-astor_0.7.1.bb
new file mode 100644
index 0000000..c2dc924
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-astor_0.7.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Easy manipulation of Python source via the AST."
+HOMEPAGE = "https://github.com/berkerpeksag/astor"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=561205fdabc3ec52cae2d30815b8ade7"
+
+SRC_URI = "git://github.com/berkerpeksag/astor.git"
+SRCREV ?= "4ca3a26e52f08678854c2841cd0fdf223461e47d"
+
+inherit setuptools3
+
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native"
-- 
2.8.1


