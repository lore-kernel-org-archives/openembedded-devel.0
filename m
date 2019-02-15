Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B0D36BE2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 06:07:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1F67FNt009002
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Feb 2019 22:07:26 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 14 Feb 2019 22:07:05 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 01:04:56 -0500
Message-ID: <a488ede1d50a4732396bde219b9e9f5e34cb1cb6.1550210289.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1550210289.git.hongxu.jia@windriver.com>
References: <cover.1550210289.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/12] python3-keras-preprocessing: add version 1.0.5
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
X-List-Received-Date: Fri, 15 Feb 2019 06:07:50 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python/python3-keras-preprocessing_1.0.5.bb           | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-keras-preprocessing_1.0.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.0.5.bb b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.0.5.bb
new file mode 100644
index 0000000..58b8c62
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.0.5.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Easy data preprocessing and data augmentation for deep learning models"
+HOMEPAGE = "https://github.com/keras-team/keras-preprocessing"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1744b320500cc2e3112964d00cce7aa4"
+
+SRC_URI = "git://github.com/keras-team/keras-preprocessing.git"
+SRCREV ?= "362fe9f8daf556151328eb5d02bd5ae638c653b8"
+
+inherit setuptools3
+
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native"
+
-- 
2.8.1


