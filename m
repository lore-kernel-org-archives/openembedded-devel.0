Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qf2hE-0003a5-Of
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 06:29:45 +0200
Received: by gxk3 with SMTP id 3so708143gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 21:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hNFXrF3ekWG/O+kMH73ocrOZV1XDUo+uf4cbTqe2A34=;
	b=u/USXUi2tplnBb+8LAx/mGOuE4z6uhN0K9jA7kaVBME6EmvonSGyiCLvXETSAJydmG
	EvQOQkAdOQWHXUO6Rkn5H1qOQsh9mpV1DuJ6OChhWIYubXRto4bQG2jSQ6AeMLLWRU13
	BAg+GMCMBsKUOlVp9F5oZqgKt+m+GGFThQ6es=
Received: by 10.236.190.164 with SMTP id e24mr1930271yhn.270.1310099151203;
	Thu, 07 Jul 2011 21:25:51 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id f4sm3921264yhn.69.2011.07.07.21.25.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jul 2011 21:25:50 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jul 2011 23:22:42 -0500
Message-Id: <1310098962-13326-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: joelagnel@ti.com, beagleboard@googlegroups.com, k-kooi@ti.com,
	Joel A Fernandes <agnel.joel@gmail.com>, g-coley1@ti.com, jdk@ti.com
Subject: [PATCH v4] beagleboard-test-scripts: Add a script flash-fs.sh for flashing NAND
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
X-List-Received-Date: Fri, 08 Jul 2011 04:29:45 -0000

This script flashes the NAND of a BeagleBoard if:
  * There is a valid image on the SD Card to flash
  * The board has NAND

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
Changes since v3:
* User button changes for flashing have been removed as it seemed unstable and we would like to have a
revision which we're using for the BeagleBoard image that's being shipped with a BeagleBoard C5 board.

We're calling this version of the build "Alpha", the "Beta" will have the flash-with-userbutton feature

* flash-fs.sh renamed to to flash-nand-fs.sh after suggestion from Khem

 .../beagleboard/beagleboard-test-scripts_git.bb    |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/recipes/beagleboard/beagleboard-test-scripts_git.bb b/recipes/beagleboard/beagleboard-test-scripts_git.bb
index be0d059..0ee7954 100644
--- a/recipes/beagleboard/beagleboard-test-scripts_git.bb
+++ b/recipes/beagleboard/beagleboard-test-scripts_git.bb
@@ -1,14 +1,18 @@
 ## Reminder:  The correct spacing for a variable is FOO = "BAR"  in : PR="r1"
 DESCRIPTION = "BeagleBoard test scripts"
 HOMEPAGE = "http://beagleboad.org/support"
-PR = "r2"
+PR = "r3"
 
-SRC_URI = "git://gitorious.org/beagleboard-validation/scripts.git;protocol=git \
+SRC_URI = "git://gitorious.org/~joelf/beagleboard-validation/validation-scripts.git;protocol=git \
 "
 
-SRCREV = "473dd2ab20d866be6168c9f992c2c9e74e485c9d"
+SRCREV = "2df76857155fbd462527c2b00ee83214483f0594"
 S = "${WORKDIR}/git"
 
+inherit update-rc.d
+INITSCRIPT_NAME = "flash-nand-fs.sh"
+INITSCRIPT_PARAMS = "start 99 2 3 4 5 ."
+
 do_install() {
   TEST_FILES=" \
     testaudio \
@@ -28,4 +32,8 @@ do_install() {
   for i in ${TEST_FILES}; do
     install -m 0755 ${S}/${i} ${D}/${bindir}
   done
+  # A script to flash NAND if the board has it, and if there is valid image to flash on the SD Card.
+  # We also register it as an init script so that the SD Card auto-flashes to NAND during boot.
+  install -d ${D}/${sysconfdir}/init.d/
+  install -m 0755 ${S}/flashing/flash-nand-fs.sh ${D}/${sysconfdir}/init.d/flash-nand-fs.sh
 }
-- 
1.7.0.4



