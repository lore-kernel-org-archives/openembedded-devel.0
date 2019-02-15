Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 629E27C6A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 06:07:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1F674Gl021901
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Feb 2019 22:07:04 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 14 Feb 2019 22:07:03 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 01:04:55 -0500
Message-ID: <f1c281963369fd58f2f1f4cb151f51c1a43524ae.1550210289.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1550210289.git.hongxu.jia@windriver.com>
References: <cover.1550210289.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/12] python3-keras-applications: add version 1.0.6
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
X-List-Received-Date: Fri, 15 Feb 2019 06:07:03 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python/python3-keras-applications_1.0.6.bb        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-keras-applications_1.0.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-keras-applications_1.0.6.bb b/meta-python/recipes-devtools/python/python3-keras-applications_1.0.6.bb
new file mode 100644
index 0000000..d38b992
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-keras-applications_1.0.6.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Reference implementations of popular deep learning models"
+HOMEPAGE = "https://github.com/keras-team/keras-applications"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=366e2fd3c9714f162d3663b6f97cfe41"
+
+SRC_URI = "git://github.com/keras-team/keras-applications.git"
+SRCREV ?= "61de21815728aa66377ebb2a7b4c2f5492a34dd2"
+
+
+inherit setuptools3
+
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native"
+
+RDEPENDS_${PN} = "python3-numpy \
+                  python3-h5py \
+                 "
-- 
2.8.1


