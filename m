Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2E2DE60807
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 06:26:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2018 22:26:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,377,1515484800"; d="scan'208";a="19378051"
Received: from wrath.jf.intel.com ([10.54.31.19])
	by fmsmga007.fm.intel.com with ESMTP; 21 Feb 2018 22:26:45 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Feb 2018 22:26:31 -0800
Message-Id: <20180222062631.11026-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180222062631.11026-1-timothy.t.orling@linux.intel.com>
References: <20180222062631.11026-1-timothy.t.orling@linux.intel.com>
Subject: [meta-perl][PATCH 2/2] libmodule-runtime-perl: upgrade to 0.016, use upstream
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
X-List-Received-Date: Thu, 22 Feb 2018 06:26:44 -0000

Upstream has fixed build system to use EUMM, so we no
longer need the fix on github.com/moto-timo.

Add UPSTREAM_CHECK_REGEX to ensure we catch future updates.

Extended the license checksum to include the Copyright.
The length of the README file has changed, so the checksum
has changed. Verified that the license remains the same.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...runtime-perl_0.015.bb => libmodule-runtime-perl_0.016.bb} | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
 rename meta-perl/recipes-perl/libmodule/{libmodule-runtime-perl_0.015.bb => libmodule-runtime-perl_0.016.bb} (75%)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.015.bb b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
similarity index 75%
rename from meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.015.bb
rename to meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
index b92842c46..89f0f709a 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.015.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
@@ -17,12 +17,14 @@ SECTION = "libs"
 HOMEPAGE = "http://search.cpan.org/~zefram/Module-Runtime/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;beginline=45;endline=46;md5=62e24a93342fede7221d66335c716f34"
+LIC_FILES_CHKSUM = "file://README;beginline=36;endline=44;md5=9416434672a57853d6181f3da9094963"
 
-SRCNAME = "module-runtime"
-SRC_URI = "https://github.com/moto-timo/${SRCNAME}/archive/${PV}.tar.gz"
-SRC_URI[md5sum] = "ad6ca179c978aa02ac8aa29244ef9beb"
-SRC_URI[sha256sum] = "59effa82b3f6986d28de6154a8f2428157691004d951f936a81e851f4dbcb045"
+SRCNAME = "Module-Runtime"
+SRC_URI = "${CPAN_MIRROR}/authors/id/Z/ZE/ZEFRAM/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "d3d47222fa2e3dfcb4526f6cc8437b20"
+SRC_URI[sha256sum] = "68302ec646833547d410be28e09676db75006f4aa58a11f3bdb44ffe99f0f024"
+
+UPSTREAM_CHECK_REGEX = "Module\-Runtime\-(?P<pver>(\d+\.\d+)).tar"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.13.6


