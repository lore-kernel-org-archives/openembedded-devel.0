Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id ED62771C7A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 06:26:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2018 22:26:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,377,1515484800"; d="scan'208";a="19378039"
Received: from wrath.jf.intel.com ([10.54.31.19])
	by fmsmga007.fm.intel.com with ESMTP; 21 Feb 2018 22:26:40 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Feb 2018 22:26:30 -0800
Message-Id: <20180222062631.11026-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [meta-perl][PATCH 1/2] libmodule-pluggable-perl: use upstream instead of github.com/moto-timo
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
X-List-Received-Date: Thu, 22 Feb 2018 06:26:42 -0000

Upstream has updated the build system to use EUMM, so the fix on
github.com/moto-timo is no longer needed.

Because the versions where out of sync, reflect the bump in PR.

Add UPSTREAM_CHECK_REGEX to properly catch upstream updates.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb    | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
index c73a15a4f..aed65d3a8 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
@@ -17,9 +17,14 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=322;endline=325;md5=086450ce010f6fda25db0b38fcc41086"
 
 SRCNAME = "Module-Pluggable"
-SRC_URI = "https://github.com/moto-timo/${SRCNAME}/archive/${PV}.tar.gz"
-SRC_URI[md5sum] = "e32475d6ff5843f738cedacd3b7a2cdb"
-SRC_URI[sha256sum] = "58c62292eea6d06959eba1b97598650813211265403242d57efb2f605c96059f"
+SRC_URI = "${CPAN_MIRROR}/authors/id/S/SI/SIMONW/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "87ce2971662efd0b69a81bb4dc9ea76c"
+SRC_URI[sha256sum] = "b3f2ad45e4fd10b3fb90d912d78d8b795ab295480db56dc64e86b9fa75c5a6df"
+
+PR = "r1"
+
+UPSTREAM_CHECK_REGEX = "Module\-Pluggable\-(?P<pver>(\d+\.\d+))"
+UPSTREAM_CHECK_URI = "https://metacpan.org/release/${SRCNAME}"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.13.6


