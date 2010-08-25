Received: from mail.infocentr.ru ([78.108.66.4])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1OoJBo-0003Lh-9q
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 18:51:07 +0200
Received: from localhost.localdomain (unknown [192.168.62.150])
	by mail.infocentr.ru (Postfix) with ESMTP id 5F760B0016E3;
	Wed, 25 Aug 2010 22:44:30 +0600 (YEKST)
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Aug 2010 22:44:24 +0600
Message-Id: <1282754664-7480-1-git-send-email-norguhtar@gmail.com>
X-Mailer: git-send-email 1.6.0.6
X-SA-Exim-Connect-IP: 78.108.66.4
X-SA-Exim-Mail-From: norguhtar@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3] sysvinit_2.86.bb: change sysvinit-utils for compatible with upstart
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
X-List-Received-Date: Wed, 25 Aug 2010 16:51:07 -0000

From: Norguhtar <norguhtar@gmail.com>

* move shutdown to sysvinit package
* move killall5 to sysvinit-utils
* change PR = "r59"

Signed-off-by: Anatoly Shipitsin <norguhtar@gmail.com>
---
 recipes/sysvinit/sysvinit_2.86.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/sysvinit/sysvinit_2.86.bb b/recipes/sysvinit/sysvinit_2.86.bb
index 40c642a..aca5249 100644
--- a/recipes/sysvinit/sysvinit_2.86.bb
+++ b/recipes/sysvinit/sysvinit_2.86.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "System-V like init."
 SECTION = "base"
 LICENSE = "GPLv2+"
 HOMEPAGE = "http://freshmeat.net/projects/sysvinit/"
-PR = "r58"
+PR = "r59"
 
 # USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf.
 # Set PACKAGE_ARCH appropriately.
@@ -42,7 +42,7 @@ PACKAGES =+ "sysvinit-utils sysvinit-pidof sysvinit-sulogin"
 FILES_${PN} += "${base_sbindir}/* ${base_bindir}/*"
 FILES_sysvinit-pidof = "${base_bindir}/pidof.sysvinit"
 FILES_sysvinit-sulogin = "${base_sbindir}/sulogin"
-FILES_sysvinit-utils = "${bindir}/last.${PN} ${bindir}/mesg.${PN} ${bindir}/wall.${PN} ${base_sbindir}/shutdown.${PN} ${bindir}/lastb ${bindir}/utmpdump ${base_sbindir}/runlevel"
+FILES_sysvinit-utils = "${bindir}/last.${PN} ${bindir}/mesg.${PN} ${bindir}/wall.${PN} ${bindir}/lastb ${bindir}/utmpdump ${base_sbindir}/killall5"
 RRECOMMENDS_${PN} = "sysvinit-utils"
 RRECOMMENDS_${PN}_micro = ""
 
@@ -112,6 +112,7 @@ pkg_postinst_${PN} () {
 update-alternatives --install ${base_sbindir}/halt halt halt.${PN} 200
 update-alternatives --install ${base_sbindir}/reboot reboot reboot.${PN} 200
 update-alternatives --install ${base_sbindir}/poweroff poweroff poweroff.${PN} 200
+update-alternatives --install ${base_sbindir}/shutdown shutdown shutdown.${PN} 200
 }
 
 pkg_postinst_sysvinit-utils () {
@@ -119,13 +120,13 @@ pkg_postinst_sysvinit-utils () {
 update-alternatives --install ${bindir}/last last last.${PN} 200
 update-alternatives --install ${bindir}/mesg mesg mesg.${PN} 200
 update-alternatives --install ${bindir}/wall wall wall.${PN} 200
-update-alternatives --install ${base_sbindir}/shutdown shutdown shutdown.${PN} 200
 }
 
 pkg_prerm_${PN} () {
 #!/bin/sh
 update-alternatives --remove halt halt.${PN}
 update-alternatives --remove reboot reboot.${PN}
+update-alternatives --remove shutdown shutdown.${PN}
 }
 
 pkg_prerm_sysvinit-utils () {
@@ -133,7 +134,6 @@ pkg_prerm_sysvinit-utils () {
 update-alternatives --remove last last.${PN}
 update-alternatives --remove mesg mesg.${PN}
 update-alternatives --remove wall wall.${PN}
-update-alternatives --remove shutdown shutdown.${PN}
 }
 
 pkg_postinst_sysvinit-pidof () {
-- 
1.6.0.6



