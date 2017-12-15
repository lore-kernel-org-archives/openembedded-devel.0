Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3E0678843
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 20:22:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBFKMD8O006847
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 12:22:14 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 15 Dec 2017 12:22:11 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Dec 2017 15:21:56 -0500
Message-ID: <1513369321-18274-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
References: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][v2][rocko][PATCH 3/8] python-automat: add an initial recipe for version 0.6.0
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
X-List-Received-Date: Fri, 15 Dec 2017 20:22:13 -0000
Content-Type: text/plain

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---

Cherry-pick from master
2b6ae2d951df1050bf4fe0734ece750d0fef2faf

 meta-python/recipes-devtools/python/python-automat.inc   | 16 ++++++++++++++++
 .../recipes-devtools/python/python-automat_0.6.0.bb      |  2 ++
 .../recipes-devtools/python/python3-automat_0.6.0.bb     |  4 ++++
 3 files changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-automat.inc
 create mode 100644 meta-python/recipes-devtools/python/python-automat_0.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-automat_0.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python-automat.inc b/meta-python/recipes-devtools/python/python-automat.inc
new file mode 100644
index 0000000..1ac5d3b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-automat.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Self-service finite-state machines for the programmer on the go"
+HOMEPAGE = "https://github.com/glyph/Automat"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
+
+SRC_URI[md5sum] = "ad7bba58d262d8956d732330cb5ef53d"
+SRC_URI[sha256sum] = "3c1fd04ecf08ac87b4dd3feae409542e9bf7827257097b2b6ed5692f69d6f6a8"
+
+PYPI_PACKAGE = "Automat"
+
+inherit pypi
+
+RDEPENDS_${PN} += "\
+   ${PYTHON_PN}-attrs \
+   ${PYTHON_PN}-six \
+"
diff --git a/meta-python/recipes-devtools/python/python-automat_0.6.0.bb b/meta-python/recipes-devtools/python/python-automat_0.6.0.bb
new file mode 100644
index 0000000..8ac8c9c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-automat_0.6.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-automat.inc
diff --git a/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb b/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
new file mode 100644
index 0000000..0469e61
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-automat.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-enum "
-- 
2.7.4


