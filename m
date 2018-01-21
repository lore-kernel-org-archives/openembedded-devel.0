Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 96775787B9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 22:44:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 14:44:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,393,1511856000"; d="scan'208";a="21169365"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga003.jf.intel.com with ESMTP; 21 Jan 2018 14:44:27 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:44:10 -0800
Message-Id: <a7db1f261998d4c45fa41806cbb370e3bc7a04ae.1516574387.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
References: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
Subject: [meta-perl][PATCH 10/12] librole-tiny-perl: upgrade 2.000005 -> 2.000006
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
X-List-Received-Date: Sun, 21 Jan 2018 22:44:25 -0000

Changes:

2.000006 - 2017-11-08
  - account for code references stored directly in stash (for perl 5.28)
  - work around hint leakage when loading modules in perl 5.8 and 5.10.1

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../{librole-tiny-perl_2.000005.bb => librole-tiny-perl_2.000006.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/librole/{librole-tiny-perl_2.000005.bb => librole-tiny-perl_2.000006.bb} (84%)

diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000005.bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000006.bb
similarity index 84%
rename from meta-perl/recipes-perl/librole/librole-tiny-perl_2.000005.bb
rename to meta-perl/recipes-perl/librole/librole-tiny-perl_2.000006.bb
index f684f684b..c2755ea0f 100644
--- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000005.bb
+++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000006.bb
@@ -9,8 +9,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=177;endline=214;md5=26df7e7c20551fb1906e2286624f0b71"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz"
-SRC_URI[md5sum] = "c8c5cf1e02d2e0a1ed22530b55b67d66"
-SRC_URI[sha256sum] = "593a29b621e029bf0218d0154d5dfdf6ec502afc49adeeadae6afd0c70063115"
+SRC_URI[md5sum] = "7c277728a7e090f64b495857cadfed08"
+SRC_URI[sha256sum] = "cc73418c904a0286ecd8915eac11f5be2a8d1e17ea9cb54c9116b0340cd3e382"
 
 S = "${WORKDIR}/Role-Tiny-${PV}"
 
-- 
2.13.6


