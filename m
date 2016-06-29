Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49D1260589
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 08:23:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5T8NqSm029715
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 01:23:52 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 29 Jun 2016 01:23:50 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Jun 2016 16:22:43 +0800
Message-ID: <1467188567-28145-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1467188567-28145-1-git-send-email-mingli.yu@windriver.com>
References: <1467188567-28145-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/5] python-pbr: Add python-pbr bb
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
X-List-Received-Date: Wed, 29 Jun 2016 08:23:52 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Add python-pbr bb file as python-mock depends on
  python-pbr-native

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python-pbr_1.10.0.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pbr_1.10.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
new file mode 100644
index 0000000..fd35197
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
+HOMEPAGE = "https://pypi.python.org/pypi/pbr"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI[md5sum] = "8e4968c587268f030e38329feb9c8f17"
+SRC_URI[sha256sum] = "186428c270309e6fdfe2d5ab0949ab21ae5f7dea831eab96701b86bd666af39c"
+
+inherit pypi setuptools
+
+DEPENDS_class-target += " \
+        python-pip \
+        "
+
+BBCLASSEXTEND = "native"
-- 
2.8.1


