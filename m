Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RXXom-0000ez-5w
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Dec 2011 13:38:48 +0100
Received: by bkbzv15 with SMTP id zv15so5496428bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2011 04:32:02 -0800 (PST)
Received: by 10.205.122.1 with SMTP id ge1mr4124204bkc.103.1323088321723;
	Mon, 05 Dec 2011 04:32:01 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n14sm12866896bkn.13.2011.12.05.04.32.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 04:32:00 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Dec 2011 13:31:56 +0100
Message-Id: <1323088316-20564-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-java] openjdk-6-common: move java2-vm to RRECOMMENDS
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
X-List-Received-Date: Mon, 05 Dec 2011 12:38:48 -0000

 Even though a vm is a hard dependency it is set as RRECOMMENDS so a single vm can get uninstalled:

   root@beaglebone:~/java# opkg remove openjdk-6-vm-shark
   No packages removed.
   Collected errors:
    * print_dependents_warning: Package openjdk-6-vm-shark is depended upon by packages:
    * print_dependents_warning:         openjdk-6-java
    * print_dependents_warning: These might cease to work if package openjdk-6-vm-shark is removed.

In the above situation all vms (cacao, zero and shark) were installed, but due to llvm problems[1] shark is currently broken. To fix the java install shark needs to get uninstalled.

In theory this change allows people to break the java installation, but in practice it's already broken due to [1].

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-December/036595.html

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-core/openjdk/openjdk-6-common.inc |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
index ef1c41d..257fe56 100644
--- a/recipes-core/openjdk/openjdk-6-common.inc
+++ b/recipes-core/openjdk/openjdk-6-common.inc
@@ -10,7 +10,7 @@ ICEDTEA = "NEEDS TO BE SET"
 S = "${WORKDIR}/${ICEDTEA}"
 B = "${S}/build"
 
-INC_PR = "r11"
+INC_PR = "r12"
 
 SRC_URI = "\
   ${ICEDTEA_URI} \
@@ -426,7 +426,14 @@ RPROVIDES_${JDKPN}-vm-shark = "java2-vm"
 RPROVIDES_${JDKPN}-vm-zero = "java2-vm"
 RPROVIDES_${JDKPN}-vm-cacao = "java2-vm"
 
-RDEPENDS_${JDKPN}-java = "java2-vm"
+# Even though a vm is a hard dependency it is set as RRECOMMENDS so a single vm can get uninstalled:
+# root@beaglebone:~/java# opkg remove openjdk-6-vm-shark 
+# No packages removed.
+# Collected errors:
+#  * print_dependents_warning: Package openjdk-6-vm-shark is depended upon by packages:
+#  * print_dependents_warning: 	openjdk-6-java
+#  * print_dependents_warning: These might cease to work if package openjdk-6-vm-shark is removed.
+RRECOMMENDS_${JDKPN}-java = "java2-vm"
 
 # For some reason shark and cacao do not automatically depends on -common.
 # So we add that manually.
-- 
1.7.2.5



