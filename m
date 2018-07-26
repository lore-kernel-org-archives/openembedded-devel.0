Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D3CA78C2A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 15:54:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6QFsfTn025134
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Jul 2018 08:54:42 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 26 Jul 2018 08:54:40 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 27 Jul 2018 00:04:55 +0800
Message-ID: <1532621095-23502-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe/meta-python][PATCH] clean up var-DISTUTILS_INSTALL_ARGS
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
X-List-Received-Date: Thu, 26 Jul 2018 15:54:42 -0000
Content-Type: text/plain

Since the following commit applied in oe-core
...
21f0c5a distutils/setuptools, distutils3/setuptools3: improve reproducibility
...
It unified var-DISTUTILS_INSTALL_ARGS in distutils and setuptools,
so clean up the duplicated var-DISTUTILS_INSTALL_ARGS in each recipe.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-devtools/python/python-distutils-extra.bb       | 2 --
 meta-oe/recipes-devtools/python/python3-distutils-extra.bb      | 2 --
 meta-python/recipes-connectivity/gateone/gateone_git.bb         | 4 +---
 meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb | 4 ++--
 4 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-distutils-extra.bb b/meta-oe/recipes-devtools/python/python-distutils-extra.bb
index 56dd33d..eb84f74 100644
--- a/meta-oe/recipes-devtools/python/python-distutils-extra.bb
+++ b/meta-oe/recipes-devtools/python/python-distutils-extra.bb
@@ -2,8 +2,6 @@ require python-distutils-extra.inc
 
 inherit setuptools
 
-DISTUTILS_INSTALL_ARGS += "--install-lib=${libdir}/${PYTHON_DIR}/site-packages"
-
 RDEPENDS_${PN} = "\
     python-distutils \
 "
diff --git a/meta-oe/recipes-devtools/python/python3-distutils-extra.bb b/meta-oe/recipes-devtools/python/python3-distutils-extra.bb
index af242b8..5836b09 100644
--- a/meta-oe/recipes-devtools/python/python3-distutils-extra.bb
+++ b/meta-oe/recipes-devtools/python/python3-distutils-extra.bb
@@ -4,8 +4,6 @@ inherit setuptools3
 
 S = "${WORKDIR}/python-distutils-extra-${PV}"
 
-DISTUTILS_INSTALL_ARGS += "--install-lib=${libdir}/${PYTHON_DIR}/site-packages"
-
 RDEPENDS_${PN} = "\
     python3-setuptools \
 "
diff --git a/meta-python/recipes-connectivity/gateone/gateone_git.bb b/meta-python/recipes-connectivity/gateone/gateone_git.bb
index 4577873..5d2ca00 100644
--- a/meta-python/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-python/recipes-connectivity/gateone/gateone_git.bb
@@ -16,9 +16,7 @@ S = "${WORKDIR}/git"
 
 inherit setuptools python-dir systemd update-rc.d
 
-DISTUTILS_INSTALL_ARGS = "--root=${D} \
-    --prefix=${prefix} \
-    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
+DISTUTILS_INSTALL_ARGS += " \
     --install-data=${PYTHON_SITEPACKAGES_DIR} \
     --install-scripts=${bindir} \
     --skip_init_scripts"
diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
index 0ca58c7..eb42fe9 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
@@ -16,8 +16,8 @@ SRC_URI = "git://github.com/mike-fabian/langtable.git;branch=master \
 
 inherit setuptools3 python3native
 
-DISTUTILS_INSTALL_ARGS = "--prefix=${D}/${prefix} \
-    --install-data=${D}/${datadir}/langtable"
+DISTUTILS_INSTALL_ARGS += " \
+    --install-data=${datadir}/langtable"
 
 FILES_${PN} += "${datadir}/*"
 
-- 
2.7.4


