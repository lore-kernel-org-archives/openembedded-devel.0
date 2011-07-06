Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QeH0g-0003Jv-C0
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 03:34:38 +0200
Received: by yib18 with SMTP id 18so2677876yib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jul 2011 18:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Lyzh0rGKBeqC9i089F8uL+gFIEGFiS7vQQI9lgGdk1U=;
	b=xXufCbdmkyeurWmYVoorrvlnNRI0hnZOJHkxKQ4xeJHMrJhOR74+w75dAVeQ5Srvjv
	KBtmTygwuKjag/YNMdHs+UG6BFH7m1TtM4thfhPFQuz52EbxSlnDkSMKwAVEfzxUrfhe
	SfpV8Fo/AnsyYXqVKfW66iWR8ioxiDhm3ds54=
Received: by 10.236.193.99 with SMTP id j63mr5802383yhn.19.1309915847164;
	Tue, 05 Jul 2011 18:30:47 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id i30sm184210yhm.7.2011.07.05.18.30.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 18:30:46 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jul 2011 20:27:23 -0500
Message-Id: <1309915643-16401-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: joelagnel@ti.com, Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com,
	k-kooi@ti.com
Subject: [PATCH] beagleboard-test-scripts: Add a script flash-fs.sh for flashing NAND.
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
X-List-Received-Date: Wed, 06 Jul 2011 01:34:38 -0000

This script flashes the NAND of a beagleboard if it exists, and if there is a valid image to flash.

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
 .../beagleboard/beagleboard-test-scripts_git.bb    |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes/beagleboard/beagleboard-test-scripts_git.bb b/recipes/beagleboard/beagleboard-test-scripts_git.bb
index be0d059..237d8d6 100644
--- a/recipes/beagleboard/beagleboard-test-scripts_git.bb
+++ b/recipes/beagleboard/beagleboard-test-scripts_git.bb
@@ -3,10 +3,10 @@ DESCRIPTION = "BeagleBoard test scripts"
 HOMEPAGE = "http://beagleboad.org/support"
 PR = "r2"
 
-SRC_URI = "git://gitorious.org/beagleboard-validation/scripts.git;protocol=git \
+SRC_URI = "git://gitorious.org/~joelf/beagleboard-validation/validation-scripts.git;protocol=git \
 "
 
-SRCREV = "473dd2ab20d866be6168c9f992c2c9e74e485c9d"
+SRCREV = "${AUTOREV}"
 S = "${WORKDIR}/git"
 
 do_install() {
@@ -28,4 +28,7 @@ do_install() {
   for i in ${TEST_FILES}; do
     install -m 0755 ${S}/${i} ${D}/${bindir}
   done
+  # Add  script to flash the NAND if it exists and if there is a valid image to flash on bootup.
+  install -d ${D}/${sysconfdir}/rc5.d/
+  install -m 0755 ${S}/flashing/flash-fs.sh ${D}/${sysconfdir}/rc5.d/S99flashfs
 }
-- 
1.7.0.4



