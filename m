Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0sHr-0006oz-QG
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 11:22:03 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2012 02:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="114422022"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.5])
	by orsmga002.jf.intel.com with ESMTP; 24 Feb 2012 02:12:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 10:12:35 +0000
Message-Id: <fec883382ffa4dcf438630b3ea32987950226cba.1330078260.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1330078260.git.paul.eggleton@linux.intel.com>
References: <cover.1330078260.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1330078260.git.paul.eggleton@linux.intel.com>
References: <cover.1330078260.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/2] python-setuptools: remove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 10:22:04 -0000

This is identical to the version now in OE-Core except for the
NATIVE_INSTALL_WORKS line and that variable is no longer used, so remove
this recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../python/python-setuptools_0.6c11.bb             |   33 --------------------
 1 files changed, 0 insertions(+), 33 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb

diff --git a/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb b/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb
deleted file mode 100644
index 32e2e57..0000000
--- a/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "Download, build, install, upgrade, and uninstall Python packages"
-HOMEPAGE = "http://cheeseshop.python.org/pypi/setuptools"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=23;endline=23;md5=8a314270dd7a8dbca741775415f1716e"
-
-SRCNAME = "setuptools"
-PR = "ml3"
-DEPENDS += "python"
-DEPENDS_virtclass-native += "python-native"
-
-SRC_URI = "\
-  http://cheeseshop.python.org/packages/source/s/setuptools/${SRCNAME}-${PV}.tar.gz\
-"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
-
-do_install_prepend() {
-    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
-}
-
-RDEPENDS_${PN} = "\
-  python-distutils \
-  python-compression \
-"
-
-SRC_URI[md5sum] = "7df2a529a074f613b509fb44feefe74e"
-SRC_URI[sha256sum] = "630fea9b726320b73ee3ca6ff61732cb32675b0389be658080fe46383b87a1d3"
-
-BBCLASSEXTEND = "native"
-
-NATIVE_INSTALL_WORKS = "1"
-- 
1.7.5.4



