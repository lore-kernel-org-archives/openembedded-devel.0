Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC9773281
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 08:24:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5T8O1Bw029722
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 01:24:01 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 29 Jun 2016 01:24:00 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Jun 2016 16:22:46 +0800
Message-ID: <1467188567-28145-5-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1467188567-28145-1-git-send-email-mingli.yu@windriver.com>
References: <1467188567-28145-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 4/5] python-pytest-runner: Add python-pytest-runner bb
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
X-List-Received-Date: Wed, 29 Jun 2016 08:24:00 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Add python-pytest-runner bb as python-mccabe depends
  on python-pytest-runner

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-devtools/python/python-pytest-runner_2.8.bb     | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pytest-runner_2.8.bb

diff --git a/meta-python/recipes-devtools/python/python-pytest-runner_2.8.bb b/meta-python/recipes-devtools/python/python-pytest-runner_2.8.bb
new file mode 100644
index 0000000..e091e01
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytest-runner_2.8.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Invoke py.test as distutils command with dependency resolution"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e38b971c2b4c33b978d1b9c9ece9ae63"
+
+SRC_URI[md5sum] = "041f3624f450d87a242e3907d7f90e8f"
+SRC_URI[sha256sum] = "1ec44deddaa551f85fd563c40a4c483a2609aca1f284a95399566a74d0680d5c"
+
+DEPENDS += " \
+    python-setuptools-scm"
+
+RDEPENDS_${PN} = "python-py python-setuptools python-argparse python-debugger python-json"
+
+inherit pypi setuptools
-- 
2.8.1


