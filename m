Return-Path: <ismo.puustinen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 009787828A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:44:29 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 06:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="978801577"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by orsmga003.jf.intel.com with ESMTP; 09 Jun 2017 06:44:29 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Jun 2017 16:44:26 +0300
Message-Id: <20170609134426.40771-1-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH] gflags: change download name.
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
X-List-Received-Date: Fri, 09 Jun 2017 13:44:30 -0000

Just having "v2.2.0.tar.gz" was causing problems with other similarly
misconfigured packages.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 meta-oe/recipes-support/gflags/gflags_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
index f2092a3..5fc28f6 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/gflags/gflags"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
 
-SRC_URI = "https://github.com/gflags/gflags/archive/v${PV}.tar.gz"
+SRC_URI = "https://github.com/gflags/gflags/archive/v${PV}.tar.gz;downloadfilename=${PN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "b99048d9ab82d8c56e876fb1456c285e"
 SRC_URI[sha256sum] = "466c36c6508a451734e4f4d76825cf9cd9b8716d2b70ef36479ae40f08271f88"
 
-- 
2.9.4


