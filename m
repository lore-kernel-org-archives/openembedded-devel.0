Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E64ED78740
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 22:44:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 14:44:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,393,1511856000"; d="scan'208";a="21169345"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga003.jf.intel.com with ESMTP; 21 Jan 2018 14:44:21 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:44:07 -0800
Message-Id: <d48e0832d1139d896aa712a251e078568f9e0451.1516574387.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
References: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
Subject: [meta-perl][PATCH 07/12] libmoo-perl: upgrade 2.003002 -> 2.003004
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
X-List-Received-Date: Sun, 21 Jan 2018 22:44:20 -0000

Changes:

2.003004 - 2017-12-01
  - re-allow stubs for attribute parameters like isa or coerce (RT#123753)
  - fix accidentally removed space in coderef error message (GH#33)
  - fix test errors with old Carp versions

2.003003 - 2017-11-16
  - test tweaks
  - fix handling of code refs stored directly in the stash (for perl 5.28)
  - consider inline packages with constants in them as being loaded
  - stubs will be treated as methods that exist when inflating to Moose
  - avoid loading overload.pm unless required

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libmoo/{libmoo-perl_2.003002.bb => libmoo-perl_2.003004.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libmoo/{libmoo-perl_2.003002.bb => libmoo-perl_2.003004.bb} (91%)

diff --git a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.003002.bb b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.003004.bb
similarity index 91%
rename from meta-perl/recipes-perl/libmoo/libmoo-perl_2.003002.bb
rename to meta-perl/recipes-perl/libmoo/libmoo-perl_2.003004.bb
index a0fe4927f..a260ab87d 100644
--- a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.003002.bb
+++ b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.003004.bb
@@ -10,8 +10,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=731;endline=776;md5=27efedd175eeaddbd18f4e3572bd72a8"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Moo-${PV}.tar.gz"
-SRC_URI[md5sum] = "e9f1f3159555ecebcd062e998f297a94"
-SRC_URI[sha256sum] = "f3e9741e79baa63e89f5a08706cd80d18c0a5a37e3d898847e002310e06582f1"
+SRC_URI[md5sum] = "d4fcd0f240033198571fcc81ce7c5f15"
+SRC_URI[sha256sum] = "f8bbb625f8e963eabe05cff9048fdd72bdd26777404ff2c40bc690f558be91e1"
 
 S = "${WORKDIR}/Moo-${PV}"
 
-- 
2.13.6


