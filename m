Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OjsHa-00082F-7E
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 13:18:58 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OjsHL-0006Ei-Fn from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 04:18:27 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 13 Aug 2010 13:18:25 +0200
From: noor_ahsan@mentor.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Aug 2010 17:17:11 +0600
Message-Id: <1281698231-26231-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 13 Aug 2010 11:18:26.0041 (UTC)
	FILETIME=[3FA6EE90:01CB3AD9]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH]Removing Legacy staging from genboot native recipe
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
X-List-Received-Date: Fri, 13 Aug 2010 11:18:59 -0000

genboot-native: Removing legacy staging

* Replaced do_stage function with do_install and replaced ${STAGING_BINDIR} with ${D}${bindir}
 
Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>

diff --git a/recipes/simpad-utilities/genboot-native.bb b/recipes/simpad-utilities/genboot-native.bb
index 47b9b34..f398a55 100644
--- a/recipes/simpad-utilities/genboot-native.bb
+++ b/recipes/simpad-utilities/genboot-native.bb
@@ -1,5 +1,5 @@
 SECTION = "console/utils"
-PR = "r1"
+PR = "r2"
 DESCRIPTION = "Console utility for generating a SIMpad boot image for the proprietary SIEMENS Switzerland bootloader"
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/genboot"
 SRC_URI = "file://gen_boot.c file://arnold_boot.h file://simpad-make-flashimg"
@@ -9,12 +9,15 @@ DEPENDS = "pad-native"
 
 inherit native
 
+NATIVE_INSTALL_WORKS = "1"
+
 do_compile() {
-	cp ${WORKDIR}/*.h ${WORKDIR}/*.c .
-	${CC} -I. -o genboot gen_boot.c
+        cp ${WORKDIR}/*.h ${WORKDIR}/*.c .
+        ${CC} -I. -o genboot gen_boot.c
 }
 
-do_stage() {
-	install -m 0755 genboot ${STAGING_BINDIR}/
-	install -m 0755 ${WORKDIR}/simpad-make-flashimg ${STAGING_BINDIR}/
+do_install() {
+        install -d ${D}${bindir}/
+        install -m 0755 genboot ${D}${bindir}/
+        install -m 0755 ${WORKDIR}/simpad-make-flashimg ${D}${bindir}/
 }


