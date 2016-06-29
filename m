Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3E0E731D7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 08:24:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5T8O5ZP009790
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 01:24:05 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 29 Jun 2016 01:24:02 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Jun 2016 16:22:47 +0800
Message-ID: <1467188567-28145-6-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1467188567-28145-1-git-send-email-mingli.yu@windriver.com>
References: <1467188567-28145-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 5/5] python-setuptools-scm: Add python-setuptools-scm bb
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
X-List-Received-Date: Wed, 29 Jun 2016 08:24:04 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Add python-setuptools-scm bb as python-pytest-runner depends
  on python-setuptools-scm

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python/python-setuptools-scm_1.11.1.bb             | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-setuptools-scm_1.11.1.bb

diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_1.11.1.bb b/meta-python/recipes-devtools/python/python-setuptools-scm_1.11.1.bb
new file mode 100644
index 0000000..0b306f4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-setuptools-scm_1.11.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "the blessed package to manage your versions by scm tags"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
+
+inherit pypi setuptools
+
+SRCNAME = "setuptools_scm"
+
+SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "4d19b2bc9580016d991f665ac20e2e8f"
+SRC_URI[sha256sum] = "8c45f738a23410c5276b0ed9294af607f491e4260589f1eb90df8312e23819bf"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+RDEPENDS_${PN} = "python-py python-setuptools python-argparse python-debugger python-json"
+
+
-- 
2.8.1


