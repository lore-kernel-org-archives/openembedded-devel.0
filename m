Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lokkc-0001GQ-1T
	for openembedded-devel@lists.linuxtogo.org;
	Tue, 31 Mar 2009 22:40:02 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 2B2C1189478; Tue, 31 Mar 2009 22:40:11 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.linuxtogo.org
Date: Tue, 31 Mar 2009 22:40:11 +0200
Message-Id: <1238532011-2902-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>, Roger Monk <r-monk@ti.com>
Subject: [STABLE][PATCH] ti-codec-combos: Use DVSDK Codec Combos to be aligned with DVSDK
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
X-List-Received-Date: Tue, 31 Mar 2009 20:40:02 -0000

From: Roger Monk <r-monk@ti.com>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/dsplink/ti-codec-combos_3.16.bb |   19 +++----------------
 recipes/dsplink/ti-codec-engine_2.23.bb |    5 +++--
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/recipes/dsplink/ti-codec-combos_3.16.bb b/recipes/dsplink/ti-codec-combos_3.16.bb
index dc1ef9f..dd97a57 100644
--- a/recipes/dsplink/ti-codec-combos_3.16.bb
+++ b/recipes/dsplink/ti-codec-combos_3.16.bb
@@ -4,7 +4,9 @@ LICENCE = "unknown"
 
 require ti-paths.inc
 
-SRC_URI = "http://software-dl.ti.com/sdo/sdo_apps_public_sw/omap3530_dvsdk_combos_tspa/omap3530_dvsdk_combos_tspa-3_16-Linux-x86.bin \
+
+# Tar-Up Codec Combos from the OMAP DVSDK (http://www.ti.com/dvevmupdates) and drop in files/
+SRC_URI = "file://omap3530_dvsdk_combos_3_16.tar.gz \
     "
 
 S = "${WORKDIR}/omap3530_dvsdk_combos_3_16"
@@ -20,21 +22,6 @@ export CE_INSTALL_DIR="${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/ti-codec-engine/pa
 # Needed for now since makefile in latest package assumes this is set
 export CODEC_INSTALL_DIR="${S}"
 
-# Helper function to run the binary installer and unpack the tar.gz in the same place as it was before - this could be optimised later
-do_accept_license() {
-        export HOME="${WORKDIR}"
-	chmod +x ${WORKDIR}/omap3530_dvsdk_combos_tspa-3_16-Linux-x86.bin
-        ${WORKDIR}/omap3530_dvsdk_combos_tspa-3_16-Linux-x86.bin --mode silent --prefix ${S}_install
-        cd "${S}_install"
-	tar -xzvf omap3530_dvsdk_combos_tspa_3_16.tar.gz
-	if [ -d ${S} ] ; then 
-            rm -rf ${S}
-        fi
-        mv omap3530_dvsdk_combos_tspa_3_16 ${S}
-}
-
-addtask accept_license after do_unpack before do_configure
-
 do_compile() {
 
         # For now, remove the reference to Rules.make and swap prod for eval, since this only has eval libs included
diff --git a/recipes/dsplink/ti-codec-engine_2.23.bb b/recipes/dsplink/ti-codec-engine_2.23.bb
index 78684f4..a42c33b 100644
--- a/recipes/dsplink/ti-codec-engine_2.23.bb
+++ b/recipes/dsplink/ti-codec-engine_2.23.bb
@@ -125,7 +125,7 @@ do_compile () {
       COMPILER="${KERNEL_CC}" \
       ARCHIVER="${KERNEL_AR}" \
       KERNEL_DIR="${STAGING_KERNEL_DIR}" \
-      clean default
+      clean all
 
     # Build the gpp samples
     cd ${DSPLINK}/gpp/src/samples
@@ -230,7 +230,8 @@ do_compile () {
           CGTOOLS_V5T="${CROSS_DIR}" \
           CGTOOLS_C64P="${TICGTOOLSDIR}" \ 
           -C ${S}/examples/ti/sdo/ce/examples/$i \
-         clean all
+         clean 
+#all
     done    
 }
 
-- 
1.5.6.5



