Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3kNr-0001no-Cd
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 10:36:40 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Feb 2013 01:20:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,628,1355126400"; d="scan'208";a="282551368"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.51])
	by orsmga002.jf.intel.com with ESMTP; 08 Feb 2013 01:20:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2013 09:20:39 +0000
Message-Id: <732a62676e557c917579e396cf9eeac4724f6871.1360315212.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360315212.git.paul.eggleton@linux.intel.com>
References: <cover.1360315212.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1360315212.git.paul.eggleton@linux.intel.com>
References: <cover.1360315212.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/2] python-pyyaml: update to version 3.10 and tweak
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
X-List-Received-Date: Fri, 08 Feb 2013 09:36:41 -0000

* Update to 3.10, using tarball instead of svn
* Set SUMMARY instead of description
* Drop PR

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../{python-pyyaml_svn.bb => python-pyyaml_3.10.bb}  |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-pyyaml_svn.bb => python-pyyaml_3.10.bb} (50%)

diff --git a/meta-oe/recipes-devtools/python/python-pyyaml_svn.bb b/meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb
similarity index 50%
rename from meta-oe/recipes-devtools/python/python-pyyaml_svn.bb
rename to meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb
index 92c0673..625efd5 100644
--- a/meta-oe/recipes-devtools/python/python-pyyaml_svn.bb
+++ b/meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb
@@ -1,18 +1,18 @@
-DESCRIPTION = "Python support for YAML"
+SUMMARY = "Python support for YAML"
 HOMEPAGE = "http://www.pyyaml.org"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
 DEPENDS = "libyaml python-cython-native"
-SRCREV = "344"
-PV = "3.08+svnr${SRCPV}"
-PR = "ml2"
 
-SRC_URI = "\
-  svn://svn.pyyaml.org/pyyaml;module=trunk;protocol=http \
-  file://setup.py \
-"
-S = "${WORKDIR}/trunk"
+SRC_URI = "http://pyyaml.org/download/pyyaml/PyYAML-${PV}.tar.gz \
+           file://setup.py \
+           "
+
+SRC_URI[md5sum] = "74c94a383886519e9e7b3dd1ee540247"
+SRC_URI[sha256sum] = "e713da45c96ca53a3a8b48140d4120374db622df16ab71759c9ceb5b8d46fe7c"
+
+S = "${WORKDIR}/PyYAML-${PV}"
 
 inherit distutils
 
-- 
1.7.10.4



