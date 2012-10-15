Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TNknA-0000h1-4J
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Oct 2012 15:33:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Oct 2012 06:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,587,1344236400"; d="scan'208";a="234042968"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.76])
	by fmsmga001.fm.intel.com with ESMTP; 15 Oct 2012 06:19:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Oct 2012 14:19:48 +0100
Message-Id: <1350307188-12001-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-webserver][PATCH] modphp: call gnu-configize in do_configure
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
X-List-Received-Date: Mon, 15 Oct 2012 13:33:12 -0000

Since we override do_configure, gnu-configize doesn't get called and
using the old gnu-config files distributed with the PHP source can cause
problems for some people e.g. building for AArch64; so add a call to it
explicitly here.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc      |    1 +
 meta-webserver/recipes-php/modphp/modphp_5.3.14.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 55e7c92..1db85bf 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -49,6 +49,7 @@ acpaths = ""
 # which breaks everything...
 #
 do_configure() {
+	gnu-configize --force
 	find . -name config.m4 -o -name configure | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
 	export PHP_LIBXML_DIR=${STAGING_DIR_NATIVE}${layout_exec_prefix} 
 	oe_runconf
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb b/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb
index a4011b6..2a264d7 100644
--- a/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb
+++ b/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb
@@ -1,5 +1,5 @@
 include modphp5.inc
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "7caac4f71e2f21426c11ac153e538392"
 SRC_URI[sha256sum] = "c8075b6e83c5db0d26cc8426a7456856421089a76c963813b1fcac3ced041cb3"
-- 
1.7.9.5



