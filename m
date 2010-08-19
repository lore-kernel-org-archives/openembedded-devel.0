Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Om6xq-0000CY-Ti
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 17:23:36 +0200
Received: by qwd7 with SMTP id 7so189862qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 08:23:13 -0700 (PDT)
Received: by 10.229.52.5 with SMTP id f5mr139980qcg.254.1282231392785;
	Thu, 19 Aug 2010 08:23:12 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id t1sm1818750qcs.45.2010.08.19.08.23.11
	(version=SSLv3 cipher=RC4-MD5); Thu, 19 Aug 2010 08:23:11 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Aug 2010 10:23:10 -0500
Message-Id: <1282231390-23994-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ti-msp430-chronos: replaced dos2unix with fromdos
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
X-List-Received-Date: Thu, 19 Aug 2010 15:23:36 -0000

* Added dependency on tofrodos-native
* Ran oe-stylize.pl
* Corrected spelling of "LICENSE"

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/ti/ti-msp430-chronos_1.05.00.00.bb |   33 +++++++++++----------------
 1 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/recipes/ti/ti-msp430-chronos_1.05.00.00.bb b/recipes/ti/ti-msp430-chronos_1.05.00.00.bb
index 3455697..8faf351 100644
--- a/recipes/ti/ti-msp430-chronos_1.05.00.00.bb
+++ b/recipes/ti/ti-msp430-chronos_1.05.00.00.bb
@@ -1,46 +1,41 @@
 DESCRIPTION = "eZ430 Chronos Tools - MSP430 Development Kit/Watch"
 HOMEPAGE = "http://processors.wiki.ti.com/index.php/EZ430-Chronos"
-LICENCE = "unknown"
 SECTION = "multimedia"
-
+LICENSE = "unknown"
+DEPENDS = "tofrodos-native"
+RDEPENDS_ti-msp430-chronos-apps += " tcl tk xdotool"
 PV = "1_05_00_00"
-PR = "2"
+PR = "3"
 
 SRC_URI = "http://focus.ti.com/lit/sw/slac388/slac388.zip;name=slac388zip"
-
 SRC_URI[slac388zip.md5sum] = "22d4104a07af584222828fb377793796"
 SRC_URI[slac388zip.sha256sum] = "1c9cd1e36015e8db3b36c98be41907628144b76002b3f76b27fd310f4bd35ad7"
 
-require ti-paths.inc
-require ti-staging.inc
-require ti-eula-unpack.inc
-
 S = "${WORKDIR}/ti/eZ430-Chronos"
 
-BINFILE="Chronos-Setup"
-TI_BIN_UNPK_CMDS="Y:workdir:"
-
 do_unpack_append() {
     os.system('mv "Texas Instruments" ti')
 }
-
 do_compile() {
     echo "Do Nothing for Now"
 }
-
 do_install() {
-
     install -d ${D}/${installdir}/ti-msp430-chronos-apps
     cp -pPrf "${S}"/"Control Center"/* ${D}/${installdir}/ti-msp430-chronos-apps
-
     # Remove dos formatting
-    dos2unix "${D}/${installdir}/ti-msp430-chronos-apps/Chronos Data Logger"/*
-    dos2unix "${D}/${installdir}/ti-msp430-chronos-apps/Chronos Control Center"/*
-
+    fromdos "${D}/${installdir}/ti-msp430-chronos-apps/Chronos Data Logger"/*
+    fromdos "${D}/${installdir}/ti-msp430-chronos-apps/Chronos Control Center"/*
     # Should probably also remove hardcoded script reference to tcl8.5
 }
 
 PACKAGES += "ti-msp430-chronos-apps"
+
 FILES_ti-msp430-chronos-apps = "${installdir}/ti-msp430-chronos-apps/*"
 
-RDEPENDS_ti-msp430-chronos-apps += " tcl tk xdotool"
+require ti-paths.inc
+require ti-staging.inc
+require ti-eula-unpack.inc
+
+BINFILE = "Chronos-Setup"
+
+TI_BIN_UNPK_CMDS = "Y:workdir:"
-- 
1.5.6.4



