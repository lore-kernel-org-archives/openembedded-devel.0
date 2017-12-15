Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5132478844
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 20:22:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBFKMFBF002621
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 12:22:15 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 15 Dec 2017 12:22:14 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Dec 2017 15:21:57 -0500
Message-ID: <1513369321-18274-5-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
References: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][v2][rocko][PATCH 4/8] python-constantly: add a recipe for version 15.1.0
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
X-List-Received-Date: Fri, 15 Dec 2017 20:22:14 -0000
Content-Type: text/plain

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---

Cherry-pick from master
b9e0b2abd1074f846bb3aef3670c0a461f6b1d00
                                                                                                                                                                                                                  meta-python/recipes-devtools/python/python-constantly.inc     | 11 +++++++++++
 .../recipes-devtools/python/python-constantly_15.1.0.bb       |  2 ++
 .../recipes-devtools/python/python3-constantly_15.1.0.bb      |  2 ++
 3 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-constantly.inc
 create mode 100644 meta-python/recipes-devtools/python/python-constantly_15.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python-constantly.inc b/meta-python/recipes-devtools/python/python-constantly.inc
new file mode 100644
index 0000000..8153504
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-constantly.inc
@@ -0,0 +1,11 @@
+DESCRIPTION = "Symbolic constants in Python"
+HOMEPAGE = "https://github.com/twisted/constantly"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e393e4ddd223e3a74982efa784f89fd7"
+
+SRC_URI[md5sum] = "f0762f083d83039758e53f8cf0086eef"
+SRC_URI[sha256sum] = "586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35"
+
+inherit pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-json"
diff --git a/meta-python/recipes-devtools/python/python-constantly_15.1.0.bb b/meta-python/recipes-devtools/python/python-constantly_15.1.0.bb
new file mode 100644
index 0000000..29b15eb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-constantly_15.1.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-constantly.inc
diff --git a/meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb b/meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb
new file mode 100644
index 0000000..3f66754
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-constantly.inc
-- 
2.7.4


