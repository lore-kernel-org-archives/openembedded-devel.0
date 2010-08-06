Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OhMXW-0007At-4R
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 15:00:48 +0200
Received: by qyk32 with SMTP id 32so6600634qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 06:00:37 -0700 (PDT)
Received: by 10.229.38.34 with SMTP id z34mr4533757qcd.183.1281099637391;
	Fri, 06 Aug 2010 06:00:37 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id t21sm1719152qcs.20.2010.08.06.06.00.36
	(version=SSLv3 cipher=RC4-MD5); Fri, 06 Aug 2010 06:00:36 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Aug 2010 08:00:35 -0500
Message-Id: <1281099635-11724-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux-omap-psp: Add camera bootarg
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
X-List-Received-Date: Fri, 06 Aug 2010 13:00:48 -0000

---
 conf/machine/include/omap3.inc         |    2 +-
 recipes/linux/linux-omap-psp_2.6.32.bb |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 7c30288..0b8e42e 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -3,7 +3,7 @@ SOC_FAMILY = "omap3"
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r86"
+MACHINE_KERNEL_PR = "r87"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes/linux/linux-omap-psp_2.6.32.bb b/recipes/linux/linux-omap-psp_2.6.32.bb
index 887e3d5..03706cd 100644
--- a/recipes/linux/linux-omap-psp_2.6.32.bb
+++ b/recipes/linux/linux-omap-psp_2.6.32.bb
@@ -132,6 +132,7 @@ SRC_URI = "git://arago-project.org/git/people/sriram/ti-psp-omap.git;protocol=gi
            file://cam/0003-mt9v113-Fix-State-variable-handling.patch \
 	   file://cam/0001-Move-sensor-rest-to-after-applying-power.patch \
            file://0001-BeagleBoard-Adjust-USER-button-pin-for-xM.patch \
+	   file://0001-omap3beagle-Add-camera-bootarg.patch \
            file://defconfig"
 
 SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \
-- 
1.5.6.4



