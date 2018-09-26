Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7433C7981D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 05:36:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2018 22:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,305,1534834800"; d="scan'208";a="265779889"
Received: from nsankark-mobl2.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.72.216])
	by fmsmga005.fm.intel.com with ESMTP; 25 Sep 2018 22:35:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Sep 2018 17:35:46 +1200
Message-Id: <20180926053546.23456-1-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][sumo][PATCH] protobuf: make python-protobuf dependency optional and default to off
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
X-List-Received-Date: Wed, 26 Sep 2018 05:36:04 -0000

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
 meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
index 1ffb79da7..073dfaef0 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
@@ -12,7 +12,7 @@ DEPENDS = "zlib"
 DEPENDS_append_class-target  = " protobuf-native"
 RDEPENDS_${PN}-compiler = "${PN}"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
-RDEPENDS_${PN}-ptest = "bash python-protobuf"
+RDEPENDS_${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python-protobuf', '', d)}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
 
@@ -24,13 +24,16 @@ SRC_URI = "git://github.com/google/protobuf.git;branch=3.5.x \
 	   file://run-ptest \
           "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[python] = ",,"
+
 EXTRA_OECONF += " --with-protoc=echo"
 
 inherit autotools-brokensep pkgconfig ptest
 
 S = "${WORKDIR}/git"
 TEST_SRC_DIR="examples"
-LANG_SUPPORT="cpp python"
+LANG_SUPPORT = "cpp ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}"
 
 do_compile_ptest() {
 	# Modify makefile to use the cross-compiler
-- 
2.17.1


