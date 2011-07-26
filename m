Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QlWHA-0000SB-QI
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 03:17:36 +0200
Received: by yib18 with SMTP id 18so2638640yib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2011 18:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=BBgy+TaqMlicSgj3tMSzb8DCysODffwkZLwUMJI2Psc=;
	b=AQomaGbDTfoJzX2K0fVg71IDIB831+a5AuoGOkqSTNnHQaWL5Bnk/bp00xcWmmy9HJ
	wxD1RwVVn3i47CLZATBriR55/05AVhdMfa0pPRsN//37g9VkUPoH1er7KECGMygsRgcM
	YOF31Nu8QU6eiUwsfH02MzvT2KEgM7KkXesbI=
Received: by 10.236.144.231 with SMTP id n67mr6341662yhj.354.1311642803352;
	Mon, 25 Jul 2011 18:13:23 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id w24sm631746yhl.76.2011.07.25.18.13.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 18:13:10 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Jul 2011 20:07:59 -0500
Message-Id: <1311642479-11502-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: jdk@ti.com, k-kooi@ti.com
Subject: [PATCH] beagleboard-test-scripts: userbutton state detection: Remove userspace scripts
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
X-List-Received-Date: Tue, 26 Jul 2011 01:17:37 -0000

Have U-boot detect if user button was pressed and set a boot argument
so that user space can use this information

This solves a couple of problems:
* The user-button doesn't have to be held when userspace loads
* Eliminate the need for userspace scripts that check for the state of the button

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
I know recently these updates have become fairly noisy and maybe even a chore for
maintainers to keep applying. Moving to AUTOREV checkout for this recipe (from a
stable branch I maintain) would reduce or eliminate this (I'm not sure how to trigger
rebuilds though without a PR bump)

If not, I'm sorry for the noise, hopefully this should be the last change as this script
hasn't moved for a few days now.

 .../beagleboard/beagleboard-test-scripts_git.bb    |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/recipes/beagleboard/beagleboard-test-scripts_git.bb b/recipes/beagleboard/beagleboard-test-scripts_git.bb
index bb0e6e4..6b676de 100644
--- a/recipes/beagleboard/beagleboard-test-scripts_git.bb
+++ b/recipes/beagleboard/beagleboard-test-scripts_git.bb
@@ -1,22 +1,18 @@
 ## Reminder:  The correct spacing for a variable is FOO = "BAR"  in : PR="r1"
 DESCRIPTION = "BeagleBoard test scripts"
 HOMEPAGE = "http://beagleboad.org/support"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "git://gitorious.org/~joelf/beagleboard-validation/validation-scripts.git;protocol=git \
 "
 
-SRCREV = "f7ba1b49190003af524f1a768ec887955a9994a0"
+SRCREV = "4c129ee73698bfb14cfa4c77c2796e871b255551"
 S = "${WORKDIR}/git"
 
 inherit update-rc.d
 INITSCRIPT_NAME = "flash-nand-fs.sh"
 INITSCRIPT_PARAMS = "start 99 2 3 4 5 ."
 
-do_compile() {
-    ${CC} -o userbutton-pressed ${CFLAGS} ${LDFLAGS} flashing/userbutton-pressed.c
-}
-
 do_install() {
   TEST_FILES=" \
     testaudio \
@@ -40,7 +36,6 @@ do_install() {
   # We also register it as an init script so that the SD Card auto-flashes to NAND during boot.
   install -d ${D}/${sysconfdir}/init.d/
   install -m 0755 ${S}/flashing/flash-nand-fs.sh ${D}/${sysconfdir}/init.d/flash-nand-fs.sh
-  install -m 0755 userbutton-pressed ${D}/${bindir}/userbutton-pressed
   install -d ${D}/boot/
   install -m 0755 ${S}/flashing/user.txt ${D}/boot/user.txt
   install -m 0755 ${S}/flashing/uEnv.txt ${D}/boot/uEnv.txt
-- 
1.7.0.4



