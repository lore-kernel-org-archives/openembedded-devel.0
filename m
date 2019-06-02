Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B45877E33A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 18:44:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 11:44:03 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga007.jf.intel.com with ESMTP; 02 Jun 2019 11:44:03 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2019 11:43:12 -0700
Message-Id: <20190602184318.71277-7-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
References: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 07/13] libextutils-installpaths-perl: upgrade 0.011 -> 0.012; enable ptest
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
X-List-Received-Date: Sun, 02 Jun 2019 18:44:01 -0000
Content-Transfer-Encoding: 8bit

* Add RDEPENDS for libextutils-config-perl
* Add runtime and ptest dependencies

Upstream release notes:
0.012     2018-05-10 21:03:33+02:00 Europe/Amsterdam
          - Allow a argument to install_map with source dirs
          - Make tests prove and 5.6 friendly

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...=> libextutils-installpaths-perl_0.012.bb} | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-installpaths-perl_0.011.bb => libextutils-installpaths-perl_0.012.bb} (52%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.011.bb b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
similarity index 52%
rename from meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.011.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
index 6eb434a95e..2da5e3b4f4 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.011.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
@@ -9,17 +9,26 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b6fa54d873ce6bcf4809ea88bdf97769"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-${PV}.tar.gz"
-SRC_URI[md5sum] = "9c75894c3c8c899ab6bfafc5eaa97999"
-SRC_URI[sha256sum] = "7609fa048cdcf1451cad5b1d7d494f30e3d5bad0672d15404f1ea60e1df0067c"
+SRC_URI[md5sum] = "9a8d66aab1ffec98ea260faf03ac612b"
+SRC_URI[sha256sum] = "84735e3037bab1fdffa3c2508567ad412a785c91599db3c12593a50a1dd434ed"
 
 S = "${WORKDIR}/ExtUtils-InstallPaths-${PV}"
 
-inherit cpan
+inherit cpan ptest-perl
 
-RDEPENDS_${PN} = " perl-module-extutils-makemaker \
-                   perl-module-data-dumper \
-                   perl-module-test-more \
-                   perl-module-file-temp \
+RDEPENDS_${PN} = " \
+    libextutils-config-perl \
+    perl-module-bytes \
+    perl-module-data-dumper \
+    perl-module-extutils-makemaker \
+    perl-module-file-temp \
+    perl-module-test-more \
+"
+
+RDEPENDS_${PN}-ptest = " \
+    ${PN} \
+    perl-module-file-spec-functions \
+    perl-module-test-more \
 "
 
 BBCLASSEXTEND = "native"
-- 
2.20.1


