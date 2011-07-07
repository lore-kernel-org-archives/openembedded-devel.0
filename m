Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QewA6-0005Wy-NM
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 23:31:11 +0200
Received: by yib18 with SMTP id 18so614005yib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 14:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lIf8ciYrrko3nz9p9FOyLZnTcKJdBw9Njk04iTscHZw=;
	b=hYTaEmbS/IwhQHQU45lT0ETEKZj8w6PVXkCUDK+EzSdGape+heywbQ4A20J62s3OQM
	p3yYE136noKr5o07M74BUc6OIv8QoWkaJuq50lmRtJyP/Lkp6pMvZnIjI8a1kCvBxPVa
	PC83jq0bfN/MJdWOYlqRZngtb49RtoXc0GyY8=
Received: by 10.236.67.47 with SMTP id i35mr1687793yhd.66.1310074018047;
	Thu, 07 Jul 2011 14:26:58 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c69sm624804yhm.15.2011.07.07.14.26.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jul 2011 14:26:57 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jul 2011 16:23:56 -0500
Message-Id: <1310073836-11556-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: joelagnel@ti.com, beagleboard@googlegroups.com,
	Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com, k-kooi@ti.com
Subject: [PATCH v3] beagleboard-test-scripts: Add a script flash-fs.sh for flashing NAND
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
X-List-Received-Date: Thu, 07 Jul 2011 21:31:11 -0000

This script flashes the NAND of a BeagleBoard if:
  * The user-button is pressed
  * There is a valid image on the SD Card to flash
  * The board has NAND

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
Changes since v2:
  User button is checked before flashing of the board

This is based on Jason's review:
http://groups.google.com/group/beagleboard/msg/835de9a37c3a340a

 .../beagleboard/beagleboard-test-scripts_git.bb    |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/recipes/beagleboard/beagleboard-test-scripts_git.bb b/recipes/beagleboard/beagleboard-test-scripts_git.bb
index be0d059..3f3cc56 100644
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
+SRCREV = "513bfa2e99822150ea5845f3a33c349029cb7c13"
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



