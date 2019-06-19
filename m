Return-Path: <timothy.t.orling@linux.intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Jun 2019 15:06:37 UTC
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 410857E9A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 15:06:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jun 2019 07:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="150629080"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga007.jf.intel.com with ESMTP; 19 Jun 2019 07:59:30 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2019 07:59:18 -0700
Message-Id: <20190619145918.20187-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-perl][PATCH] libmodule-build-perl: drop, has moved to oe-core
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
X-List-Received-Date: Wed, 19 Jun 2019 15:06:37 -0000
Content-Transfer-Encoding: 8bit

libmodule-build-perl is a dependency for cpan_build.bbclass
and as such has been moved to oe-core

OE-Core rev: 81ba07d85d21456bf7248b2f04082958e8d724c2

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libmodule/libmodule-build-perl_0.4224.bb  | 34 -------------------
 1 file changed, 34 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.4224.bb

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.4224.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.4224.bb
deleted file mode 100644
index d523a7a0c7..0000000000
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.4224.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "Module::Build - Build and install Perl modules"
-DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
-Makefile.PL file to drive distribution configuration, build, test and \
-installation. Traditionally, Build.PL uses Module::Build as the underlying \
-build system. This module provides a simple, lightweight, drop-in replacement. \
-Whereas Module::Build has over 6,700 lines of code; this module has less than \
-120, yet supports the features needed by most distributions."
-
-SECTION = "libs"
-
-HOMEPAGE = "https://metacpan.org/release/Module-Build"
-
-LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;beginline=960;endline=965;md5=624c06db56a2af4d70cf9edc29fcae1b"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-${PV}.tar.gz"
-SRC_URI[md5sum] = "b74c2f6e84b60aad3a3defd30b6f0f4d"
-SRC_URI[sha256sum] = "a6ca15d78244a7b50fdbf27f85c85f4035aa799ce7dd018a0d98b358ef7bc782"
-
-S = "${WORKDIR}/Module-Build-${PV}"
-
-inherit cpan_build
-
-# From:
-# https://github.com/rehsack/meta-cpan/blob/master/recipes-devel/module-build-perl/module-build-perl_0.4216.bb
-#
-do_patch_module_build () {
-    cd ${S}
-    sed -i -e 's,my $interpreter = $self->{properties}{perl};,my $interpreter = "${bindir}/perl";,g' lib/Module/Build/Base.pm
-}
-
-do_patch[postfuncs] += "do_patch_module_build"
-
-BBCLASSEXTEND = "native"
-- 
2.20.1


