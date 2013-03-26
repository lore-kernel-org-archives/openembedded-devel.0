Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UKS3M-0003qP-Dx
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 12:28:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Mar 2013 04:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,911,1355126400"; d="scan'208";a="276066290"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 26 Mar 2013 04:11:30 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Mar 2013 13:11:29 +0200
Message-Id: <1364296289-23374-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1364293926-32661-1-git-send-email-laurentiu.palcu@intel.com>
References: <1364293926-32661-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [meta-browser][PATCH v2] nss: change shebang line for smime script
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
X-List-Received-Date: Tue, 26 Mar 2013 11:28:35 -0000

This patch fixes the shebang line of the smime script and also adds a
'perl' RDEPENDS for the main package since smime needs perl to run.

Also, this patch fixes some do_rootfs failures when using RPM backend
because RPM automatically scans the files and, if perl scripts are
found, adds dependency on the file found in the shebang line (i.e.
/usr/local/bin/perl).

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
Changes in v2:
 * moved the RDEPENDS line at the end to conform with the style guide;

Thanks,
Laurentiu

 recipes-support/nss/nss_3.13.3.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-support/nss/nss_3.13.3.bb b/recipes-support/nss/nss_3.13.3.bb
index 59c16e8..fbab6ee 100644
--- a/recipes-support/nss/nss_3.13.3.bb
+++ b/recipes-support/nss/nss_3.13.3.bb
@@ -105,7 +105,10 @@ do_install() {
 	sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nss.pc
 	sed -i s:OEINCDIR:${includedir}:g ${D}${libdir}/pkgconfig/nss.pc
 	sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nss.pc
+
+	sed -i s:/usr/local/bin/perl:${bindir}/perl:g ${D}${bindir}/smime
 }
 
 FILES_SOLIBSDEV := ""
 FILES_${PN} += "${base_libdir}/lib*${SOLIBSDEV} ${libdir}/lib*${SOLIBSDEV}"
+RDEPENDS_${PN} += "perl"
-- 
1.7.9.5



