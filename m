Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0A0FE7E510
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 18:44:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 11:44:15 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga007.jf.intel.com with ESMTP; 02 Jun 2019 11:44:15 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2019 11:43:16 -0700
Message-Id: <20190602184318.71277-11-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
References: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 11/13] libstrictures-perl: upgrade 2.000003 -> 2.000006; enable ptest
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
X-List-Received-Date: Sun, 02 Jun 2019 18:44:14 -0000
Content-Transfer-Encoding: 8bit

Add runtime and ptest dependencies.

Upstream release notes:

2.000006 - 2019-03-10
  - update internal list of warnings for categories added in blead (v5.29.9)
  - fix extras test to avoid any files in the temp directory's parent
    directories interfering (RT#128751)

2.000005 - 2018-04-20
  - update internal list of warnings for categories added in 5.28.0 (no
    behaviour change)

2.000004 - 2018-04-19
  - update bundled ExtUtils::HasCompiler to 0.021
  - update internal list of warnings for categories added in 5.26.0 (no
    behavior change)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...000003.bb => libstrictures-perl_2.000006.bb} | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)
 rename meta-perl/recipes-perl/libstrictures/{libstrictures-perl_2.000003.bb => libstrictures-perl_2.000006.bb} (81%)

diff --git a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000003.bb b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
similarity index 81%
rename from meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000003.bb
rename to meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
index a6808d3f8e..d1a5b4787d 100644
--- a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000003.bb
+++ b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
@@ -29,17 +29,20 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=246;endline=262;md5=43be558cf4f19823cdd6af22135cf5f8"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/strictures-${PV}.tar.gz"
-SRC_URI[md5sum] = "78244cfab6168dcf196370d1e2309536"
-SRC_URI[sha256sum] = "27f8ea096a521e9754d36ea32889c2cda28346d04e3e399e7ea118d182dbaf22"
+SRC_URI[md5sum] = "35c14fd25320f32ff40e977feae95d0d"
+SRC_URI[sha256sum] = "09d57974a6d1b2380c802870fed471108f51170da81458e2751859f2714f8d57"
 
 S = "${WORKDIR}/strictures-${PV}"
 
-inherit cpan
+inherit cpan ptest-perl
 
-RDEPENDS_${PN} = " perl-module-carp \
-                   perl-module-strict \
-                   perl-module-test-more \
-                   perl-module-warnings \
+RDEPENDS_${PN} += " \
+    perl-module-carp \
+    perl-module-strict \
+    perl-module-test-more \
+    perl-module-warnings \
 "
 
+RDEPENDS_${PN}-ptest += "perl-module-perlio perl-module-perlio-scalar"
+
 BBCLASSEXTEND = "native"
-- 
2.20.1


