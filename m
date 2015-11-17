Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C099F6E268
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 09:17:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAH9H6Ks010899
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 01:17:06 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 17 Nov 2015 01:17:05 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Nov 2015 04:17:04 -0500
Message-ID: <1447751824-114954-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-python] python-pygpgme: add ptest support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Nov 2015 09:17:10 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* add ptest support
* runtime depends on gnupg

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../recipes-devtools/python/python-pygpgme/run-ptest        |  3 +++
 meta-python/recipes-devtools/python/python-pygpgme_0.3.bb   | 13 +++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pygpgme/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-pygpgme/run-ptest b/meta-python/recipes-devtools/python/python-pygpgme/run-ptest
new file mode 100644
index 0000000..ac867e2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pygpgme/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+GPG_AGENT_INFO= python test_all.py -v
diff --git a/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb b/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
index f06c344..39a7ada 100644
--- a/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
+++ b/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
@@ -7,12 +7,21 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI = "https://pypi.python.org/packages/source/p/pygpgme/pygpgme-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/p/pygpgme/pygpgme-${PV}.tar.gz \
+           file://run-ptest \
+          "
+
 SRC_URI[md5sum] = "d38355af73f0352cde3d410b25f34fd0"
 SRC_URI[sha256sum] = "5fd887c407015296a8fd3f4b867fe0fcca3179de97ccde90449853a3dfb802e1"
 
 S = "${WORKDIR}/pygpgme-${PV}"
 
 DEPENDS += "gpgme"
+RDEPENDS_${PN} += "gnupg"
+
+inherit setuptools ptest
 
-inherit setuptools
+do_install_ptest(){
+    install ${S}/test_all.py ${D}${PTEST_PATH}
+    cp -r ${S}/tests ${D}${PTEST_PATH}
+}
-- 
1.9.1


