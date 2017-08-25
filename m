Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7A63078407
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 17:01:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 25 Aug 2017 10:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,426,1498546800"; d="scan'208";a="1188164245"
Received: from wrath.jf.intel.com ([10.54.70.9])
	by fmsmga001.fm.intel.com with ESMTP; 25 Aug 2017 10:01:20 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Aug 2017 10:01:15 -0700
Message-Id: <20170825170115.14446-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [meta-perl][PATCH v2] libmodule-build-perl: upgrade to v0.4224 and fix qa error
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
X-List-Received-Date: Fri, 25 Aug 2017 17:01:19 -0000

* Use COPYRIGHT excerpt from README for license check
  - Remains the same perl5 license
  - LICENSE contents is unhelpful "FULLTEXT"
* Correct copy-paste error in SUMMARY
* Fix rpm package_qa error by 'inherit allarch'
* Author is now LEONT instead of KWILLIAMS
* Update HOMEPAGE
* Add interpreter fix from meta-cpan for lib/Module/Build/Base.pm

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>

---
Changes in v2:
* Drop unused run-ptest, Module::Build's tests are designed to
  be run on a non-installed version of the module. Not useful
  in a ptest context.
---
 .../libmodule/libmodule-build-perl_0.31.bb         | 27 -----------------
 .../libmodule/libmodule-build-perl_0.4224.bb       | 34 ++++++++++++++++++++++
 2 files changed, 34 insertions(+), 27 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.31.bb
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.4224.bb

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.31.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.31.bb
deleted file mode 100644
index c0fa06d08..000000000
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.31.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Module::Build::Tiny - A tiny replacement for Module::Build"
-DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
-Makefile.PL file to drive distribution configuration, build, test and \
-installation. Traditionally, Build.PL uses Module::Build as the underlying \
-build system. This module provides a simple, lightweight, drop-in replacement. \
-Whereas Module::Build has over 6,700 lines of code; this module has less than \
-120, yet supports the features needed by most distributions."
-SECTION = "libs"
-
-HOMEPAGE = "http://search.cpan.org/~kwilliams/Module-Build-0.31/"
-
-LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=43339d8f9d3a956ee9eceb07717ee95e"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/K/KW/KWILLIAMS/Module-Build-${PV}.tar.gz"
-SRC_URI[md5sum] = "3d4fdffe58f6236253767e5a71edf29b"
-SRC_URI[sha256sum] = "e2f723be8d6c70b4ddbca3b5e32e52e6e98eae8f43e34d7ede87efcb1796bbb5"
-
-S = "${WORKDIR}/Module-Build-${PV}"
-
-inherit cpan_build
-
-do_install () {
-        cpan_build_do_install
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.4224.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.4224.bb
new file mode 100644
index 000000000..b09135c95
--- /dev/null
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.4224.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Module::Build - Build and install Perl modules"
+DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
+Makefile.PL file to drive distribution configuration, build, test and \
+installation. Traditionally, Build.PL uses Module::Build as the underlying \
+build system. This module provides a simple, lightweight, drop-in replacement. \
+Whereas Module::Build has over 6,700 lines of code; this module has less than \
+120, yet supports the features needed by most distributions."
+
+SECTION = "libs"
+
+HOMEPAGE = "https://metacpan.org/release/Module-Build"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=960;endline=965;md5=624c06db56a2af4d70cf9edc29fcae1b"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-${PV}.tar.gz"
+SRC_URI[md5sum] = "b74c2f6e84b60aad3a3defd30b6f0f4d"
+SRC_URI[sha256sum] = "a6ca15d78244a7b50fdbf27f85c85f4035aa799ce7dd018a0d98b358ef7bc782"
+
+S = "${WORKDIR}/Module-Build-${PV}"
+
+inherit cpan_build allarch
+
+# From:
+# https://github.com/rehsack/meta-cpan/blob/master/recipes-devel/module-build-perl/module-build-perl_0.4216.bb
+#
+do_patch_module_build () {
+    cd ${S}
+    sed -i -e 's,my $interpreter = $self->{properties}{perl};,my $interpreter = "${bindir}/perl";,g' lib/Module/Build/Base.pm
+}
+
+do_patch[postfuncs] += "do_patch_module_build"
+
+BBCLASSEXTEND = "native"
-- 
2.13.5


