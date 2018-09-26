Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8833379769
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 01:53:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2018 18:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,304,1534834800"; d="scan'208";a="266712745"
Received: from nsankark-mobl2.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.72.216])
	by fmsmga006.fm.intel.com with ESMTP; 25 Sep 2018 18:53:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Sep 2018 13:53:09 +1200
Message-Id: <20180926015309.18538-1-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] protobuf: make python-protobuf dependency optional and default to off
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
X-List-Received-Date: Wed, 26 Sep 2018 01:53:56 -0000

A dependency on python-protobuf was added in commit
5f6fcfd36272768a3ff9078c07c572cf5dc01ccd for the sole purpose of
providing a ptest, however python-protobuf is in meta-python and thus
this means that meta-oe would depend on meta-python by default (assuming
your distro enables ptest by default), and we don't want that - meta-oe
isn't supposed to depend upon any layer other than openembedded-core.
Luckily we can still have a ptest even without the python support, so
add a PACKAGECONFIG and leave it disabled by default.

Note: the PACKAGECONFIG here is not particularly useful since it's only
about what goes into the -ptest package and thus also the dependency. I
contemplated just using LANG_SUPPORT instead, but PACKAGECONFIG does
have the advantage that it's introspectable and fairly well understood
so in the end I went with it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
index f8498c4c8..cf72d9ca7 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
@@ -22,10 +22,13 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig ptest
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[python] = ",,"
+
 EXTRA_OECONF += "--with-protoc=echo"
 
 TEST_SRC_DIR = "examples"
-LANG_SUPPORT = "cpp python"
+LANG_SUPPORT = "cpp ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}"
 
 do_compile_ptest() {
 	# Modify makefile to use the cross-compiler
@@ -78,7 +81,7 @@ FILES_${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
 
 RDEPENDS_${PN}-compiler = "${PN}"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
-RDEPENDS_${PN}-ptest = "bash python-protobuf"
+RDEPENDS_${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python-protobuf', '', d)}"
 
 MIPS_INSTRUCTION_SET = "mips"
 
-- 
2.17.1


