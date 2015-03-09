Return-Path: <victor.rodriguez.bahena@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C9CEA739A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2015 20:57:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 09 Mar 2015 13:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,370,1422950400"; d="scan'208";a="677499132"
Received: from vrodri3-mobl2.amr.corp.intel.com (HELO
	vrodri3-mobl2.zpn.intel.com) ([10.219.4.31])
	by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2015 13:57:48 -0700
From: Victor Rodriguez <victor.rodriguez.bahena@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Mar 2015 14:57:43 -0600
Message-Id: <1425934664-14174-1-git-send-email-victor.rodriguez.bahena@intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe][PATCH 1/2] Add mpich support
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
X-List-Received-Date: Mon, 09 Mar 2015 20:57:50 -0000

This patch add mpich support to yocto in order to run MPI framework on embedded
systems.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Victor Rodriguez <victor.rodriguez.bahena@intel.com>
Signed-off-by: Alexandru.Vaduva <Alexandru.Vaduva@enea.com>
---
 meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb

diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb b/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
new file mode 100644
index 0000000..2f4226e
--- /dev/null
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Message Passing Interface(MPI) implementation"
+HOMEPAGE = "http://git.mpich.org/mpich.git/"
+SECTION = "devel"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=2106f0435056f3dd9349747a766e5816"
+
+SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
+SRC_URI[md5sum] = "40dc408b1e03cc36d80209baaa2d32b7"
+SRC_URI[sha256sum] = "455ccfaf4ec724d2cf5d8bff1f3d26a958ad196121e7ea26504fd3018757652d"
+
+RDEPENDS_${PN} += "bash perl tcsh"
+S = "${WORKDIR}/${PN}-${PV}"
+
+EXTRA_OECONF = "--enable-debuginfo \
+                --enable-fast \
+                --enable-shared  \
+                --disable-f77 \
+                --disable-fc \
+                --disable-fortran \
+                --disable-cxx"
+
+inherit autotools-brokensep gettext
+
+do_configure_prepend() {
+    autoreconf --verbose --install --force -I . -I confdb/ -I maint/
+    oe_runconf
+    exit
+}
-- 
1.9.3


