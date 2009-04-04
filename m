Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lq58a-0003fj-EW
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Apr 2009 14:38:19 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 96BF0189477; Sat,  4 Apr 2009 14:38:17 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Apr 2009 14:38:17 +0200
Message-Id: <1238848697-20191-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH v2] gstreamer-ti: fix path to codec combos
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
X-List-Received-Date: Sat, 04 Apr 2009 12:38:19 -0000

From: Koen Kooi <koen@openembedded.org>

---
    gstreamer-ti_svn.bb     |   11 +++++++++--
    ti-codec-combos_3.16.bb |    7 +++++--
 2 files changed, 14 insertions(+), 4 deletions(-)
   
diff --git a/recipes/dsplink/gstreamer-ti_svn.bb b/recipes/dsplink/gstreamer-ti_svn.bb
index e14f262..ab705f3 100644
--- a/recipes/dsplink/gstreamer-ti_svn.bb
+++ b/recipes/dsplink/gstreamer-ti_svn.bb
@@ -4,7 +4,7 @@ SRC_URI = "svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=gstreamer_ti;proto=
           "
 SRCREV = "160"
 
-PR = "r6"
+PR = "r7"
 
 # Again, no '.' in PWD allowed :(
 PV = "0+svnr${SRCREV}"
@@ -32,6 +32,14 @@ export XDC_PLATFORM
 #GCArmv5T.cc.opts = "SEDME_CCARCH";
 #GCArmv5T.cc.$seal("opts");
 
+do_configure_prepend() {
+	for i in ${S}/src/*.cfg ; do
+		sed -i -e s:\./encodeCombo.x64P:${datadir}/ti-codec-combos/encodeCombo.x64P:g \
+	           -e s:\./decodeCombo.x64P:${datadir}/ti-codec-combos/decodeCombo.x64P:g \
+	           $i
+	done
+}
+
 do_compile_prepend() {
 	for i in $(find ${S} -name "config.bld") ; do
 		    sed -i -e s:SEDME_CCARCH:'${TARGET_CCARCH}': $i
diff --git a/recipes/dsplink/ti-codec-combos_3.16.bb b/recipes/dsplink/ti-codec-combos_3.16.bb
index dd97a57..6bab35a 100644
--- a/recipes/dsplink/ti-codec-combos_3.16.bb
+++ b/recipes/dsplink/ti-codec-combos_3.16.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/omap3530_dvsdk_combos_3_16"
 
 # Yes, the xdc stuff still breaks with a '.' in PWD
 PV = "316"
-PR = "r14"
+PR = "r15"
 
 TARGET = "all"
 
@@ -77,6 +77,10 @@ do_install () {
 do_stage () {
 	install -d ${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/ti-codec-combos
 	cp -pPrf ${S}/* ${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/ti-codec-combos
+	for codec in encode decode ; do
+		mkdir -p  ${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/ti-codec-combos/packages/ti/sdo/servers/$codec/package/info/${datadir}/ti-codec-combos
+		ln -sf ${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/ti-codec-combos/packages/ti/sdo/servers/$codec/package/info/$codec* ${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/ti-codec-combos/packages/ti/sdo/servers/$codec/package/info/${datadir}/ti-codec-combos
+	done
 }
 
 FILES_ti-codec-combos = "${datadir}/ti-codec-combos/*"
-- 
1.5.6.5



