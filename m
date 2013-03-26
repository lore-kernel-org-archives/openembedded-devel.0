Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UKRSI-0002AM-Ga
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 11:50:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Mar 2013 03:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,911,1355126400"; d="scan'208";a="218952573"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Mar 2013 03:32:08 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Mar 2013 12:32:06 +0200
Message-Id: <1364293926-32661-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-browser][PATCH] nss: change shebang line for smime script
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
X-List-Received-Date: Tue, 26 Mar 2013 10:50:43 -0000

This patch fixes the shebang line of the smime script and also adds a
'perl' RDEPENDS for the main package since smime needs perl to run.

Also, this patch fixes some do_rootfs failures when using RPM backend
because RPM automatically scans the files and, if perl scripts are
found, adds dependency on the file found in the shebang line (i.e.
/usr/local/bin/perl).

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 recipes-support/nss/nss_3.13.3.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-support/nss/nss_3.13.3.bb b/recipes-support/nss/nss_3.13.3.bb
index 59c16e8..c05179f 100644
--- a/recipes-support/nss/nss_3.13.3.bb
+++ b/recipes-support/nss/nss_3.13.3.bb
@@ -7,6 +7,7 @@ LICENSE = "MPL1.1 GPL LGPL"
 LIC_FILES_CHKSUM = "file://security/nss/manifest.mn;md5=d71978748f23eae3156c38ac2a691924"
 
 DEPENDS = "sqlite3 nspr nspr-native"
+RDEPENDS_${PN} += "perl"
 
 SRC_URI = "\
 	http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_13_3_RTM/src/${PN}-${PV}.tar.gz \
@@ -105,6 +106,8 @@ do_install() {
 	sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nss.pc
 	sed -i s:OEINCDIR:${includedir}:g ${D}${libdir}/pkgconfig/nss.pc
 	sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nss.pc
+
+	sed -i s:/usr/local/bin/perl:${bindir}/perl:g ${D}${bindir}/smime
 }
 
 FILES_SOLIBSDEV := ""
-- 
1.7.9.5



