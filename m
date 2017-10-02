Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 92BBC77AB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 01:36:46 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 02 Oct 2017 18:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,471,1500966000"; d="scan'208";a="158624948"
Received: from imakwana-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.79])
	by fmsmga006.fm.intel.com with ESMTP; 02 Oct 2017 18:36:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 08:40:10 +1300
Message-Id: <f7734a8370ecb3d38aa5b4b8f6968eaf6f6f2b42.1506973045.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1506973045.git.paul.eggleton@linux.intel.com>
References: <cover.1506973045.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH v2 2/2] upm: add recipe from meta-refkit-core
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
X-List-Received-Date: Tue, 03 Oct 2017 01:36:46 -0000

Make this recipe a little more widely visible (has previously appeared
in meta-refkit-core and meta-intel-iot-middleware). Also make couple of
minor tweaks:

* Fix BINDINGS example to use the correct recipe name (copy-paste error)
* Set HOMEPAGE
* Drop AUTHOR as this is field is only really intended for older
  software where there is no real point of contact for upstream other
  than an author's email address.
* Set same COMPATIBLE_HOST as mraa since upm depends upon it

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...15-fixed-case-logic-in-getThresh-function.patch | 54 ++++++++++++++++++++++
 meta-oe/recipes-extended/upm/upm_git.bb            | 45 ++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 meta-oe/recipes-extended/upm/files/ads1x15-fixed-case-logic-in-getThresh-function.patch
 create mode 100644 meta-oe/recipes-extended/upm/upm_git.bb

diff --git a/meta-oe/recipes-extended/upm/files/ads1x15-fixed-case-logic-in-getThresh-function.patch b/meta-oe/recipes-extended/upm/files/ads1x15-fixed-case-logic-in-getThresh-function.patch
new file mode 100644
index 0000000..c617d14
--- /dev/null
+++ b/meta-oe/recipes-extended/upm/files/ads1x15-fixed-case-logic-in-getThresh-function.patch
@@ -0,0 +1,54 @@
+From c64d04d084f47b4cb3e1cdee6e96348fcc6a756e Mon Sep 17 00:00:00 2001
+From: Mihai Tudor Panu <mihai.tudor.panu@intel.com>
+Date: Tue, 30 May 2017 15:14:09 -0700
+Subject: [PATCH 1/1] ads1x15: fixed case logic in getThresh() function
+
+Signed-off-by: Mihai Tudor Panu <mihai.tudor.panu@intel.com>
+
+Upstream-Status: Backported [c64d04d084f47b4cb3e1cdee6e96348fcc6a756e]
+
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+
+---
+ src/ads1x15/ads1x15.cxx | 4 ++--
+ src/ads1x15/ads1x15.hpp | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/ads1x15/ads1x15.cxx b/src/ads1x15/ads1x15.cxx
+index 35782709..47701b2a 100644
+--- a/src/ads1x15/ads1x15.cxx
++++ b/src/ads1x15/ads1x15.cxx
+@@ -116,7 +116,7 @@ ADS1X15::setContinuous(bool mode){
+ 
+ float
+ ADS1X15::getThresh(ADSTHRESH reg){
+-     if( THRESH_HIGH && THRESH_LOW) return getLastSample(reg);
++     if(reg == THRESH_HIGH || reg == THRESH_LOW) return getLastSample(reg);
+      else return 0.0;
+ }
+ 
+@@ -137,7 +137,7 @@ ADS1X15::setThresh(ADSTHRESH reg, float value){
+      case 2:
+      case 3:
+           set_value = value / getMultiplier();
+-         set_value = set_value << m_bitShift;
++          set_value = set_value << m_bitShift;
+           if(i2c->writeWordReg(reg, swapWord(set_value)) != mraa::SUCCESS){
+             throw std::runtime_error(std::string(__FUNCTION__) + ": I2c.write() failed");
+             return;
+diff --git a/src/ads1x15/ads1x15.hpp b/src/ads1x15/ads1x15.hpp
+index 7524572d..efd8c8ec 100644
+--- a/src/ads1x15/ads1x15.hpp
++++ b/src/ads1x15/ads1x15.hpp
+@@ -390,7 +390,7 @@ namespace upm {
+              * @param reg ADSTHRES enum value.
+              * Returns 0.0 unless THRESH_HIGH or THRESH_LOW requested.
+              */
+-            float getThresh(ADSTHRESH reg = THRESH_LOW);
++            float getThresh(ADSTHRESH reg = THRESH_DEFAULT);
+ 
+             /**
+              * Sets threshold levels or configures for conversion ready
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
new file mode 100644
index 0000000..38065ce
--- /dev/null
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Sensor/Actuator repository for Mraa"
+HOMEPAGE = "https://github.com/intel-iot-devkit/upm"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=66493d54e65bfc12c7983ff2e884f37f"
+
+DEPENDS = "libjpeg-turbo mraa"
+
+SRCREV = "106b6c706268522ab0168a4ddb19e89ce832e084"
+PV = "1.3.0-git${SRCPV}"
+
+SRC_URI = " \
+    git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
+    file://ads1x15-fixed-case-logic-in-getThresh-function.patch \
+"
+
+S = "${WORKDIR}/git"
+
+# Depends on mraa which only supports x86 and ARM for now
+COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
+
+inherit distutils3-base cmake
+
+
+# override this in local.conf to get needed bindings.
+# BINDINGS_pn-upm="python"
+# will result in only the python bindings being built/packaged.
+BINDINGS ??= "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_NODEJS') or '0') else '' }"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
+ ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)}"
+
+PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON, -DBUILDSWIGPYTHON=OFF, swig-native ${PYTHON_PN},"
+PACKAGECONFIG[nodejs] = "-DBUILDSWIGNODE=ON, -DBUILDSWIGNODE=OFF, swig-native nodejs-native,"
+
+FILES_${PYTHON_PN}-${PN} = "${PYTHON_SITEPACKAGES_DIR}"
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


