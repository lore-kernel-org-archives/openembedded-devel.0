Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6C1D60119
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jul 2016 08:07:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6487oWu004779
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Jul 2016 01:07:50 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 4 Jul 2016 01:07:49 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Jul 2016 16:06:15 +0800
Message-ID: <1467619576-13899-5-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1467619576-13899-1-git-send-email-mingli.yu@windriver.com>
References: <1467619576-13899-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH v2 4/5] python-pytest-runner: Add python-pytest-runner bb
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
X-List-Received-Date: Mon, 04 Jul 2016 08:07:49 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Add python-pytest-runner bb as python-mccabe depends
  on python-pytest-runner

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-devtools/python/python-pytest-runner_2.8.bb    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pytest-runner_2.8.bb

diff --git a/meta-python/recipes-devtools/python/python-pytest-runner_2.8.bb b/meta-python/recipes-devtools/python/python-pytest-runner_2.8.bb
new file mode 100644
index 0000000..a4685ec
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytest-runner_2.8.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Invoke py.test as distutils command with dependency resolution"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e38b971c2b4c33b978d1b9c9ece9ae63"
+
+SRC_URI[md5sum] = "041f3624f450d87a242e3907d7f90e8f"
+SRC_URI[sha256sum] = "1ec44deddaa551f85fd563c40a4c483a2609aca1f284a95399566a74d0680d5c"
+PYPI_PACKAGE_HASH = "466cff61a9e0d513222afa3529bdb565a465812b7e50b218a5afd705f46b258c"
+
+DEPENDS += " \
+    python-setuptools-scm"
+
+RDEPENDS_${PN} = "python-py python-setuptools python-argparse python-debugger python-json"
+
+inherit pypi setuptools
-- 
2.8.1


