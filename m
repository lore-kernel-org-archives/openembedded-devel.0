Return-Path: <rcz@pengutronix.de>
X-Greylist: delayed 925 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Nov 2019 08:43:43 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id EFF027F8AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 08:43:43 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <rcz@pengutronix.de>)
	id 1iXhp4-00064R-CV; Thu, 21 Nov 2019 09:28:18 +0100
Received: from rcz by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <rcz@pengutronix.de>)
	id 1iXhp4-0004D1-53; Thu, 21 Nov 2019 09:28:18 +0100
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Nov 2019 09:27:52 +0100
Message-Id: <20191121082750.4688-1-r.czerwinski@pengutronix.de>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: rcz@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python-pyelftools: add recipes
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
X-List-Received-Date: Thu, 21 Nov 2019 08:43:44 -0000
Content-Transfer-Encoding: 8bit

pyelftools is a pure-Python library for parsing and analyzing ELF files
and DWARF debugging information.

Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
---
 .../recipes-devtools/python/python-pyelftools.inc  | 14 ++++++++++++++
 .../python/python-pyelftools_0.25.bb               |  2 ++
 .../python/python3-pyelftools_0.25.bb              |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyelftools.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyelftools_0.25.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb

diff --git a/meta-python/recipes-devtools/python/python-pyelftools.inc b/meta-python/recipes-devtools/python/python-pyelftools.inc
new file mode 100644
index 000000000..7d4f763ff
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyelftools.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "pyelftools is a pure-Python library for parsing and analyzing ELF files and DWARF debugging information"
+HOMEPAGE = "https://github.com/eliben/pyelftools"
+SECTION = "devel/python"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
+
+SRC_URI[md5sum] = "c5629b9a5d19c82107a946cce52eeec2"
+SRC_URI[sha256sum] = "89c6da6f56280c37a5ff33468591ba9a124e17d71fe42de971818cbff46c1b24"
+
+PYPI_PACKAGE = "pyelftools"
+
+inherit pypi
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-pyelftools_0.25.bb b/meta-python/recipes-devtools/python/python-pyelftools_0.25.bb
new file mode 100644
index 000000000..de4202506
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyelftools_0.25.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-pyelftools.inc
diff --git a/meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb b/meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
new file mode 100644
index 000000000..56eb8c4cd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pyelftools.inc
-- 
2.24.0


