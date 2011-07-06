Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QeUrn-00068c-6H
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 18:22:23 +0200
Received: by ywa12 with SMTP id 12so36436ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 09:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8XATO4EtlC9Se+KrGJFBKG7ritcSd3dCmnmjieoLcxs=;
	b=Iy/ZnoCNdRTAcR3ghMZLOvQuk5/N1BOOtkLL/chZSOlrRsddOnROvbNmXbIK9/DC3Z
	x8MTi97YXyMBFi96zkTg5OHMvCt5P0hYvCfBL9jzNh0vz3LSicaG0RGBGjgDbFEfZ3P8
	F/pqtjhhdaZrzj4krZf1ObswyHEFkwL3jB/Lc=
Received: by 10.101.191.5 with SMTP id t5mr7271896anp.101.1309969112045;
	Wed, 06 Jul 2011 09:18:32 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id e23sm1946160anp.38.2011.07.06.09.18.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jul 2011 09:18:31 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Jul 2011 11:15:19 -0500
Message-Id: <1309968919-23810-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: joelagnel@ti.com, beagleboard@googlegroups.com, k-kooi@ti.com,
	Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com, beagle@list.ti.com
Subject: [PATCH v2] beagleboard-test-scripts: Add a script flash-fs.sh for flashing NAND
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
X-List-Received-Date: Wed, 06 Jul 2011 16:22:23 -0000

This script flashes the NAND of a BeagleBoard if it exists, and if there is a valid image to flash

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
Changes since v1:
* Bumped PR
* Using commit revision number instead of AUTOREV
* Using update-rc.d class instead of copying init script to /etc/rc5.d/
* Removed full stops from the commit summary
* Made comment on the init script in do_install more clear

 .../beagleboard/beagleboard-test-scripts_git.bb    |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/recipes/beagleboard/beagleboard-test-scripts_git.bb b/recipes/beagleboard/beagleboard-test-scripts_git.bb
index be0d059..4e0f54f 100644
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
+SRCREV = "c482b7cb6caaa986a86d360d39e9040c77667d6b"
 S = "${WORKDIR}/git"
 
+inherit update-rc.d
+INITSCRIPT_NAME = "flash-fs.sh"
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
+  install -m 0755 ${S}/flashing/flash-fs.sh ${D}/${sysconfdir}/init.d/flash-fs.sh
 }
-- 
1.7.0.4



