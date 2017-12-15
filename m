Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 11D2F78844
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 20:22:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBFKMIGA006850
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 12:22:19 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 15 Dec 2017 12:22:16 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Dec 2017 15:21:59 -0500
Message-ID: <1513369321-18274-7-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
References: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][v2][rocko][PATCH 6/8] python-hyperlink: add a recipe for version 17.3.1
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
X-List-Received-Date: Fri, 15 Dec 2017 20:22:18 -0000
Content-Type: text/plain

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---

Cherry-pick from master
378b8a6a8aa65fae704e9ceddc3f2e2b07585953
                                                                                                                                                                                                                  .../recipes-devtools/python/python-hyperlink.inc        | 17 +++++++++++++++++
 .../recipes-devtools/python/python-hyperlink_17.3.1.bb  |  2 ++
 .../recipes-devtools/python/python3-hyperlink_17.3.1.bb |  4 ++++
 3 files changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-hyperlink.inc
 create mode 100644 meta-python/recipes-devtools/python/python-hyperlink_17.3.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python-hyperlink.inc b/meta-python/recipes-devtools/python/python-hyperlink.inc
new file mode 100644
index 0000000..2b5b0a0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-hyperlink.inc
@@ -0,0 +1,17 @@
+DESCRIPTION = "A featureful, correct URL for Python"
+HOMEPAGE = "https://github.com/python-hyper/hyperlink"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb"
+
+SRC_URI[md5sum] = "eaccb9845b559817e838846669cbc68a"
+SRC_URI[sha256sum] = "bc4ffdbde9bdad204d507bd8f554f16bba82dd356f6130cb16f41422909c33bc"
+
+inherit pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-stringold ${PYTHON_PN}-netclient"
+
+PACKAGES =. "${PN}-test "
+
+FILES_${PN}-test += " \
+        ${PYTHON_SITEPACKAGES_DIR}/hyperlinkt/test \
+"
diff --git a/meta-python/recipes-devtools/python/python-hyperlink_17.3.1.bb b/meta-python/recipes-devtools/python/python-hyperlink_17.3.1.bb
new file mode 100644
index 0000000..59a9a5c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-hyperlink_17.3.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-hyperlink.inc
diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb b/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb
new file mode 100644
index 0000000..3d30af2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-hyperlink.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-selectors ${PYTHON_PN}-enum"
-- 
2.7.4


