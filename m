Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 00AB07C6A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 06:05:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1F65ZVI021892
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Feb 2019 22:05:35 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 14 Feb 2019 22:05:34 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 01:04:46 -0500
Message-ID: <09c81900de7078cd0e4cafb217818ef1c829e9ea.1550210289.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1550210289.git.hongxu.jia@windriver.com>
References: <cover.1550210289.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/12] python3-pkgconfig: add version 1.4.0
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
X-List-Received-Date: Fri, 15 Feb 2019 06:05:35 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/python/python3-pkgconfig_1.4.0.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb
new file mode 100644
index 0000000..92eb8bf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Python module to interface with the pkg-config command line too"
+HOMEPAGE = "http://github.com/matze/pkgconfig"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=faa7f82be8f220bff6156be4790344fc"
+
+SRC_URI = "git://github.com/matze/pkgconfig.git"
+SRCREV ?= "8af0102346847e8873af8e76ab3f34ba9da806e2"
+
+RDEPENDS_${PN} = "pkgconfig \
+                 "
+
+inherit setuptools3
+
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native"
+
-- 
2.8.1


