Return-Path: <victor.rodriguez.bahena@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0B432739A7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2015 20:57:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 09 Mar 2015 13:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,370,1422950400"; d="scan'208";a="677499135"
Received: from vrodri3-mobl2.amr.corp.intel.com (HELO
	vrodri3-mobl2.zpn.intel.com) ([10.219.4.31])
	by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2015 13:57:50 -0700
From: Victor Rodriguez <victor.rodriguez.bahena@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Mar 2015 14:57:44 -0600
Message-Id: <1425934664-14174-2-git-send-email-victor.rodriguez.bahena@intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1425934664-14174-1-git-send-email-victor.rodriguez.bahena@intel.com>
References: <1425934664-14174-1-git-send-email-victor.rodriguez.bahena@intel.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
Subject: [meta-oe][PATCH 2/2] mpich: Disable RPATH to avoid issues in package_qa
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linux.intel.com>

Set --disable-rpath to extra opts in order to avoid issues
in package_qa also change default pm to gforker because
hydra has problems with RPATH.

TODO: Make a patch for solve hydra rpath issues.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb b/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
index 2f4226e..0225cee 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
@@ -1,20 +1,25 @@
-SUMMARY = "Message Passing Interface(MPI) implementation"
-HOMEPAGE = "http://git.mpich.org/mpich.git/"
+SUMMARY = "Message Passing Interface (MPI) implementation"
+HOMEPAGE = "http://www.mpich.org/"
 SECTION = "devel"
 
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=2106f0435056f3dd9349747a766e5816"
 
-SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
+SRC_URI = " \
+	http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz \
+"
+
 SRC_URI[md5sum] = "40dc408b1e03cc36d80209baaa2d32b7"
 SRC_URI[sha256sum] = "455ccfaf4ec724d2cf5d8bff1f3d26a958ad196121e7ea26504fd3018757652d"
 
-RDEPENDS_${PN} += "bash perl tcsh"
+RDEPENDS_${PN} += "bash perl libxml2"
 S = "${WORKDIR}/${PN}-${PV}"
 
 EXTRA_OECONF = "--enable-debuginfo \
                 --enable-fast \
                 --enable-shared  \
+                --with-pm=gforker  \
+		--disable-rpath \
                 --disable-f77 \
                 --disable-fc \
                 --disable-fortran \
-- 
1.9.3


