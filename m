Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0A2B97E33A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 18:43:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 11:43:32 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga007.jf.intel.com with ESMTP; 02 Jun 2019 11:43:31 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2019 11:43:06 -0700
Message-Id: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-perl][PATCH 01/13] libterm-readkey-perl: upgrade 2.37 -> 2.38; fix upstream check; enable ptest
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
X-List-Received-Date: Sun, 02 Jun 2019 18:43:31 -0000
Content-Transfer-Encoding: 8bit

Upstream release notes:
"""
2.38     - 2019-01-05
        * Bundle up various changes including:
                * Indexing improvements
                * Makefile improvements for some make utils
                * Various code cleanups and modernizations
"""

* Add UPSTREAM_CHECK_REGEX
* Add UPSTREAM_CHECK_URI
* inherit ptest-perl; all tests pass
* ptest RDEPENDS on perl-module-test-more

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...erl_2.37.bb => libterm-readkey-perl_2.38.bb} | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)
 rename meta-perl/recipes-perl/libterm/{libterm-readkey-perl_2.37.bb => libterm-readkey-perl_2.38.bb} (74%)

diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
similarity index 74%
rename from meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
rename to meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
index 6b76682c68..cc1ac6ed56 100644
--- a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
+++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
@@ -3,8 +3,8 @@ DESCRIPTION = "Term::ReadKey is a compiled perl module dedicated to providing si
 control over terminal driver modes (cbreak, raw, cooked, etc.,) support \
 for non-blocking reads, if the architecture allows, and some generalized \
 handy functions for working with terminals. One of the main goals is to \
-have the functions as portable as possible, so you can just plug in "use \
-Term::ReadKey" on any architecture and have a good likelihood of it \
+have the functions as portable as possible, so you can just plug in 'use \
+Term::ReadKey' on any architecture and have a good likelihood of it \
 working."
 HOMEPAGE = "http://search.cpan.org/~jstowe/TermReadKey-${PV}"
 SECTION = "libraries"
@@ -14,16 +14,23 @@ LIC_FILES_CHKSUM = "file://README;md5=c275db663c8489a5709ebb22b185add5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/J/JS/JSTOWE/TermReadKey-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "e8ea15c16333ac4f8d146d702e83cc0c"
-SRC_URI[sha256sum] = "4a9383cf2e0e0194668fe2bd546e894ffad41d556b41d2f2f577c8db682db241"
+SRC_URI[md5sum] = "b2b4aab7a0e6bddb7ac3b21ba637482c"
+SRC_URI[sha256sum] = "5a645878dc570ac33661581fbb090ff24ebce17d43ea53fd22e105a856a47290"
 
 S = "${WORKDIR}/TermReadKey-${PV}"
 
+UPSTREAM_CHECK_URI = "https://metacpan.org/release/TermReadKey"
+UPSTREAM_CHECK_REGEX = "TermReadKey\-(?P<pver>(\d+\.\d+))(?!_\d+)\.tar.gz"
+
 # It needs depend on native to let dynamic loader use native modules
 # rather than target ones.
 DEPENDS = "libterm-readkey-perl-native"
 
-inherit cpan
+inherit cpan ptest-perl
+
+RDEPENDS_${PN}-ptest += " \
+    perl-module-test-more \
+"
 
 do_configure_append () {
     # Hack the dynamic module loader so that it use native modules since it can't load
-- 
2.20.1


