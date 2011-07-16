Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qhtkh-0001U4-4i
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jul 2011 03:33:07 +0200
Received: by yxi19 with SMTP id 19so793090yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2011 18:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=sMIbywliVQx+U0JXutQ0p/h1vrhs36F1yhocyHJn0bs=;
	b=pVFWwx0WweTE/RfpFX92U630gXBahN5Az06BaHe+z9PVUREbsaaykO1e7h5KXBz4wX
	jmligEGvFECjptlzMJvN9SStdoEp5/8Sl/li36QvB7KF6KDeeQyKamDt5DkddHKjfd2M
	/TGhVWSdjoB7PZOZaqNkc2qGbNEiD/RqE2vpI=
Received: by 10.236.145.66 with SMTP id o42mr5959820yhj.61.1310779440038;
	Fri, 15 Jul 2011 18:24:00 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id z28sm1655452yhn.21.2011.07.15.18.23.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jul 2011 18:23:59 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2011 20:19:58 -0500
Message-Id: <1310779198-20764-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: joelagnel@ti.com, beagleboard@googlegroups.com, k-kooi@ti.com, jdk@ti.com
Subject: [PATCH] beagleboard-test-scripts: BeagleBoard userbutton detection for flashing
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
X-List-Received-Date: Sat, 16 Jul 2011 01:33:07 -0000

* Build and install a userbutton tool to detect state of the user button on a BeagleBoard from /dev/input/event0
* Install a user.txt and uEnv.txt to /boot, Narcissus will copy from here to the FAT partition of an SD Card

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
This is an effort to be able to build an SD Card image for the BeagleBoard that can be used optionally for flashing
an image to NAND if the user button is pressed. This patch makes sure that the root filesystem is ready with the scripts
and programs required for Narcissus to build such an image.

This patch can be safely merged in even if the Narcissus hasn't yet been (as it was just submitted)

The related Narcissus patch is here:
http://groups.google.com/group/beagleboard/browse_thread/thread/c0dd79f8e5fb26ae

 .../beagleboard/beagleboard-test-scripts_git.bb    |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/recipes/beagleboard/beagleboard-test-scripts_git.bb b/recipes/beagleboard/beagleboard-test-scripts_git.bb
index 0ee7954..bb0e6e4 100644
--- a/recipes/beagleboard/beagleboard-test-scripts_git.bb
+++ b/recipes/beagleboard/beagleboard-test-scripts_git.bb
@@ -1,18 +1,22 @@
 ## Reminder:  The correct spacing for a variable is FOO = "BAR"  in : PR="r1"
 DESCRIPTION = "BeagleBoard test scripts"
 HOMEPAGE = "http://beagleboad.org/support"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "git://gitorious.org/~joelf/beagleboard-validation/validation-scripts.git;protocol=git \
 "
 
-SRCREV = "2df76857155fbd462527c2b00ee83214483f0594"
+SRCREV = "f7ba1b49190003af524f1a768ec887955a9994a0"
 S = "${WORKDIR}/git"
 
 inherit update-rc.d
 INITSCRIPT_NAME = "flash-nand-fs.sh"
 INITSCRIPT_PARAMS = "start 99 2 3 4 5 ."
 
+do_compile() {
+    ${CC} -o userbutton-pressed ${CFLAGS} ${LDFLAGS} flashing/userbutton-pressed.c
+}
+
 do_install() {
   TEST_FILES=" \
     testaudio \
@@ -36,4 +40,8 @@ do_install() {
   # We also register it as an init script so that the SD Card auto-flashes to NAND during boot.
   install -d ${D}/${sysconfdir}/init.d/
   install -m 0755 ${S}/flashing/flash-nand-fs.sh ${D}/${sysconfdir}/init.d/flash-nand-fs.sh
+  install -m 0755 userbutton-pressed ${D}/${bindir}/userbutton-pressed
+  install -d ${D}/boot/
+  install -m 0755 ${S}/flashing/user.txt ${D}/boot/user.txt
+  install -m 0755 ${S}/flashing/uEnv.txt ${D}/boot/uEnv.txt
 }
-- 
1.7.0.4



