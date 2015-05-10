Return-Path: <victor.rodriguez.bahena@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ABFD960043
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 May 2015 06:27:43 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 09 May 2015 23:27:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,400,1427785200"; d="scan'208";a="569005270"
Received: from amackay-mobl2.amr.corp.intel.com (HELO
	vrodri3-mobl.amr.corp.intel.com) ([10.254.128.102])
	by orsmga003.jf.intel.com with ESMTP; 09 May 2015 23:27:43 -0700
From: Victor Rodriguez <victor.rodriguez.bahena@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 May 2015 01:27:39 -0500
Message-Id: <1431239259-21577-1-git-send-email-victor.rodriguez.bahena@intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] mpich: added BASH_SHELL to CACHED_CONFIGUREVARS
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
X-List-Received-Date: Sun, 10 May 2015 06:27:45 -0000

On Fedora 17, bash has moved to /usr/bin/bash and the configure process finds
it on the host machine there, this ensures that it is set correctly for the
target.

Signed-off-by: Victor Rodriguez <victor.rodriguez.bahena@intel.com>
---
 meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb b/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
index 0225cee..eb6ceba 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
@@ -12,6 +12,8 @@ SRC_URI = " \
 SRC_URI[md5sum] = "40dc408b1e03cc36d80209baaa2d32b7"
 SRC_URI[sha256sum] = "455ccfaf4ec724d2cf5d8bff1f3d26a958ad196121e7ea26504fd3018757652d"
 
+CACHED_CONFIGUREVARS += "BASH_SHELL=${base_bindir}/bash"
+
 RDEPENDS_${PN} += "bash perl libxml2"
 S = "${WORKDIR}/${PN}-${PV}"
 
-- 
1.9.3


