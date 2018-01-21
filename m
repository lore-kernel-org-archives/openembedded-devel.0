Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0359F786F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 06:18:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jan 2018 22:18:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,390,1511856000"; d="scan'208";a="12828778"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2018 22:18:36 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jan 2018 22:18:33 -0800
Message-Id: <13cdd884efc0ff6aa695bff1d8126cc02d9e82bc.1516515289.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1516515289.git.timothy.t.orling@linux.intel.com>
References: <cover.1516515289.git.timothy.t.orling@linux.intel.com>
Subject: [meta-oe][PATCH 2/2] libdbi-perl: upgrade 1.636 -> 1.639
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
X-List-Received-Date: Sun, 21 Jan 2018 06:18:35 -0000

Changes in DBI 1.638:

Fix UTF-8 support for warn/croak calls within DBI internals,
    thanks to pali #53
Fix dependency on Storable for perl older than 5.8.9,
    thanks to H.Merijn Brand.

Add DBD::Mem driver, a pure-perl in-memory driver using DBI::DBD::SqlEngine,
    thanks to Jens Rehsack #42

Corrected missing semicolon in example in documentation,
    thanks to pali #55

Changes in DBI 1.637 - 16th August 2017:

Fix use of externally controlled format string (CWE-134) thanks to pali #44
    This could cause a crash if, for example, a db error contained a %.
    https://cwe.mitre.org/data/definitions/134.html
Fix extension detection for DBD::File related drivers
Fix tests for perl without dot in @INC RT#120443
Fix loss of error message on parent handle, thanks to charsbar #34
Fix disappearing $_ inside callbacks, thanks to robschaber #47
Fix dependency on Storable for perl older than 5.8.9

Allow objects to be used as passwords without throwing an error, thanks to demerphq #40
Allow $sth NAME_* attributes to be set from Perl code, re #45
Added support for DBD::XMLSimple thanks to nigelhorne #38

Documentation updates:
Improve examples using eval to be more correct, thanks to pali #39
Add cautionary note to prepare_cached docs re refs in %attr #46
Small POD changes (Getting Help -> Online) thanks to openstrike #33
Adds links to more module names and fix typo, thanks to oalders #43
Typo fix thanks to bor #37

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../perl/{libdbi-perl_1.636.bb => libdbi-perl_1.639.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libdbi-perl_1.636.bb => libdbi-perl_1.639.bb} (75%)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.636.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.639.bb
similarity index 75%
rename from meta-oe/recipes-devtools/perl/libdbi-perl_1.636.bb
rename to meta-oe/recipes-devtools/perl/libdbi-perl_1.639.bb
index 085b90493..bef4a8258 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.636.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.639.bb
@@ -13,11 +13,11 @@ RDEPENDS_${PN} = " perl-module-carp \
                    perl-module-dynaloader \
 "
 
-LIC_FILES_CHKSUM = "file://DBI.pm;beginline=8147;endline=8151;md5=2e5f6cf47e5ad7b77dcb6172edc29292"
+LIC_FILES_CHKSUM = "file://DBI.pm;md5=62a0479400fd3c7f793568af2e1f08ee;beginline=8147;endline=8151"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
-SRC_URI[md5sum] = "60f291e5f015550dde71d1858dfe93ba"
-SRC_URI[sha256sum] = "8f7ddce97c04b4b7a000e65e5d05f679c964d62c8b02c94c1a7d815bb2dd676c"
+SRC_URI[md5sum] = "f9bf9775b3dbaabc4630b2b29941aa89"
+SRC_URI[sha256sum] = "8e2cb3d6a8425bd68702aebbeee01e754ee11ad00e7f4f9a61b75483de104e8c"
 
 S = "${WORKDIR}/DBI-${PV}"
 
-- 
2.13.6


