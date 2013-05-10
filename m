Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Uas3q-0006To-EL
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 20:28:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 10 May 2013 11:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,650,1363158000"; d="scan'208";a="332101440"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.234])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 11:09:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2013 19:09:32 +0100
Message-Id: <473c43c9394b7f54e9980090a68aa3587e9317d0.1368209302.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1368209301.git.paul.eggleton@linux.intel.com>
References: <cover.1368209301.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1368209301.git.paul.eggleton@linux.intel.com>
References: <cover.1368209301.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/7] phpmyadmin: update to 3.5.8.1
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
X-List-Received-Date: Fri, 10 May 2013 18:28:56 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../phpmyadmin/{phpmyadmin_3.5.2.2.bb => phpmyadmin_3.5.8.1.bb}     | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_3.5.2.2.bb => phpmyadmin_3.5.8.1.bb} (85%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.8.1.bb
similarity index 85%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.8.1.bb
index 996aa63..54cacb5 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.8.1.bb
@@ -5,13 +5,11 @@ LICENSE = "GPLv2 & LGPLv3 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
                     file://libraries/tcpdf/LICENSE.TXT;md5=5c87b66a5358ebcc495b03e0afcd342c"
 
-PR = "r1"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf"
 
-SRC_URI[md5sum] = "3f8993fe0f2fee1a022768278c6a270b"
-SRC_URI[sha256sum] = "d02de081c522d3026f4a8418538f7ff05adf280afa404851a5f7f4ef895b4a7d"
+SRC_URI[md5sum] = "76976c227041ac7109506b29aec3083a"
+SRC_URI[sha256sum] = "c66737ff55369b1c9e4b116e68f3c517faf7c4bc17e289d008d74fde6c8260f6"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
1.8.1.2



