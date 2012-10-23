Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TQaFP-0000Aa-By
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 10:54:03 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Oct 2012 01:40:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,634,1344236400"; d="scan'208";a="159274861"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.83])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Oct 2012 01:40:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Oct 2012 09:40:32 +0100
Message-Id: <1350981632-5089-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-webserver][PATCH] apache2: avoid injecting host include path
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
X-List-Received-Date: Tue, 23 Oct 2012 08:54:03 -0000

includedir (by way of EXTRA_INCLUDES) gets into the CFLAGS of modphp
via apxs; thus it should not point to a location on the host.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-httpd/apache2/apache2_2.4.2.bb         |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
index 5857be7..af7840d 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://httpd.apache.org/"
 DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
 SECTION = "net"
 LICENSE = "Apache-2.0"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://server-makefile.patch \
@@ -93,6 +93,7 @@ apache_sysroot_preprocess () {
 
 	sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
 	sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
+	sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
 }
 
 #
-- 
1.7.9.5



