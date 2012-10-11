Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TMELo-00050O-5j
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 10:42:40 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Oct 2012 01:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,570,1344236400"; d="scan'208";a="233393148"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.70])
	by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2012 01:29:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Oct 2012 09:29:23 +0100
Message-Id: <a6614039ee04605d4b5efe6b2c2942dc9d0aac4d.1349944125.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349944125.git.paul.eggleton@linux.intel.com>
References: <cover.1349944125.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349944125.git.paul.eggleton@linux.intel.com>
References: <cover.1349944125.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 2/2] apache2: reorganise packaging definitions
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
X-List-Received-Date: Thu, 11 Oct 2012 08:42:40 -0000

Move RDEPENDS to the end and PACKAGES before other packaging
definitions.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-httpd/apache2/apache2_2.4.2.bb         |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
index 2c0fa6b..5857be7 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
@@ -3,7 +3,6 @@ extensible web server."
 SUMMARY = "Apache HTTP Server"
 HOMEPAGE = "http://httpd.apache.org/"
 DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
-RDEPENDS_${PN} += "openssl libgcc"
 SECTION = "net"
 LICENSE = "Apache-2.0"
 PR = "r2"
@@ -103,13 +102,13 @@ INITSCRIPT_NAME = "apache2"
 INITSCRIPT_PARAMS = "defaults 91 20"
 LEAD_SONAME = "libapr-1.so.0"
 
+PACKAGES = "${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
+
 CONFFILES_${PN} = "${sysconfdir}/${PN}/httpd.conf \
 		   ${sysconfdir}/${PN}/magic \
 		   ${sysconfdir}/${PN}/mime.types \
 		   ${sysconfdir}/init.d/${PN} "
 
-PACKAGES = "${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
-
 # we override here rather than append so that .so links are
 # included in the runtime package rather than here (-dev)
 # and to get build, icons, error into the -dev package
@@ -140,3 +139,5 @@ FILES_${PN} += "${libdir}/lib*.so ${libdir}/pkgconfig/*"
 
 FILES_${PN}-dbg += "${libdir}/${PN}/modules/.debug"
 
+RDEPENDS_${PN} += "openssl libgcc"
+
-- 
1.7.9.5



