Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9599B77AB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 01:36:43 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 02 Oct 2017 18:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,471,1500966000"; d="scan'208";a="158624945"
Received: from imakwana-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.79])
	by fmsmga006.fm.intel.com with ESMTP; 02 Oct 2017 18:36:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 08:40:09 +1300
Message-Id: <2184b0a74f70b5b5e4fc628ed4e48e9282b555a6.1506973045.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1506973045.git.paul.eggleton@linux.intel.com>
References: <cover.1506973045.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH v2 1/2] mraa: move recipe from meta-refkit-core
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
X-List-Received-Date: Tue, 03 Oct 2017 01:36:43 -0000

Make this recipe a little more widely visible (has previously appeared
in meta-refkit-core and meta-intel-iot-middleware). Also make couple of
minor tweaks:

* Make SUMMARY more accurate by borrowing the first part of the short
  description now in the mraa github repo
* Set HOMEPAGE
* Drop AUTHOR as this is field is only really intended for older
  software where there is no real point of contact for upstream other
  than an author's email address.
* Set COMPATIBLE_HOST to match what is checked by mraa's CMakeLists.txt

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-extended/mraa/mraa_git.bb | 51 +++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mraa/mraa_git.bb

diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
new file mode 100644
index 0000000..616048f
--- /dev/null
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -0,0 +1,51 @@
+SUMMARY = "Linux Library for low speed I/O Communication"
+HOMEPAGE = "https://github.com/intel-iot-devkit/mraa"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=66493d54e65bfc12c7983ff2e884f37f"
+
+SRCREV = "8ddbcde84e2d146bc0f9e38504d6c89c14291480"
+PV = "1.7.0-git${SRCPV}"
+
+SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http"
+
+S = "${WORKDIR}/git"
+
+# CMakeLists.txt checks the architecture, only x86 and ARM supported for now
+COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
+
+inherit cmake distutils3-base
+
+DEPENDS += "json-c"
+
+EXTRA_OECMAKE_append = " -DINSTALLTOOLS:BOOL=ON -DFIRMATA=ON -DCMAKE_SKIP_RPATH=ON"
+
+# Prepend mraa-utils to make sure bindir ends up in there
+PACKAGES =+ "${PN}-utils"
+
+FILES_${PN}-doc += "${datadir}/mraa/examples/"
+
+FILES_${PN}-utils = "${bindir}/"
+
+# override this in local.conf to get needed bindings.
+# BINDINGS_pn-mraa="python"
+# will result in only the python bindings being built/packaged.
+BINDINGS ??= "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_NODEJS') or '0') else '' }"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
+ ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)}"
+
+PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON, -DBUILDSWIGPYTHON=OFF, swig-native ${PYTHON_PN},"
+PACKAGECONFIG[nodejs] = "-DBUILDSWIGNODE=ON, -DBUILDSWIGNODE=OFF, swig-native nodejs-native,"
+PACKAGECONFIG[ft4222] = "-DUSBPLAT=ON -DFTDI4222=ON, -DUSBPLAT=OFF -DFTDI4222=OFF,, libft4222"
+
+FILES_${PYTHON_PN}-${PN} = "${PYTHON_SITEPACKAGES_DIR}/"
+RDEPENDS_${PYTHON_PN}-${PN} += "${PYTHON_PN}"
+
+FILES_node-${PN} = "${prefix}/lib/node_modules/"
+RDEPENDS_node-${PN} += "nodejs"
+
+### Include desired language bindings ###
+PACKAGES =+ "${@bb.utils.contains('BINDINGS', 'nodejs', 'node-${PN}', '', d)}"
+PACKAGES =+ "${@bb.utils.contains('BINDINGS', 'python', '${PYTHON_PN}-${PN}', '', d)}"
-- 
2.9.5


