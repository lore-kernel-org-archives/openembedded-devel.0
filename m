Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TMj4v-0008G3-6q
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Oct 2012 19:31:17 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Oct 2012 10:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,577,1344236400"; d="scan'208";a="226182311"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.39])
	by orsmga002.jf.intel.com with ESMTP; 12 Oct 2012 10:18:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Oct 2012 18:17:55 +0100
Message-Id: <62bb7805c5979bfae9a70747139ea9e626d42674.1350062247.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1350062247.git.paul.eggleton@linux.intel.com>
References: <cover.1350062247.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1350062247.git.paul.eggleton@linux.intel.com>
References: <cover.1350062247.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 1/2] modphp: fix rpath QA issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Oct 2012 17:31:17 -0000

Fixes the following QA issue:

ERROR: QA Issue: package modphp contains bad RPATH ${STAGING_DIR_TARGET}/usr/lib in file ${WORKDIR}/packages-split/modphp/usr/lib/apache2/modules/libphp5.so

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc      |    4 ++++
 meta-webserver/recipes-php/modphp/modphp_5.3.14.bb |    2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 344eb31..2a73e90 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -52,6 +52,10 @@ do_configure() {
 	find . -name config.m4 -o -name configure | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
 	export PHP_LIBXML_DIR=${STAGING_DIR_NATIVE}${layout_exec_prefix} 
 	oe_runconf
+
+	# No libtool, we really don't want rpath set...
+	sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
+	sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
 }
 
 do_install  () {
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb b/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb
index 707f5f9..a4011b6 100644
--- a/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb
+++ b/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb
@@ -1,5 +1,5 @@
 include modphp5.inc
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "7caac4f71e2f21426c11ac153e538392"
 SRC_URI[sha256sum] = "c8075b6e83c5db0d26cc8426a7456856421089a76c963813b1fcac3ced041cb3"
-- 
1.7.9.5



