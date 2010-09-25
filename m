Received: from defout.telus.net ([204.209.205.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kwong@wurldtech.com>) id 1OzYui-0003Jf-34
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 19:51:57 +0200
Received: from edtnaa01.telusplanet.net ([209.52.149.70])
	by priv-edtnes27.telusplanet.net
	(InterMail vM.7.09.01.00 201-2219-108-20080618) with ESMTP id
	<20100925170752.JKFH25952.priv-edtnes27.telusplanet.net@edtnaa01.telusplanet.net>;
	Sat, 25 Sep 2010 11:07:52 -0600
Received: from localhost.localdomain (s209-52-149-70.bc.hsia.telus.net
	[209.52.149.70])
	by edtnaa01.telusplanet.net (BorderWare Security Platform) with ESMTP
	id AFA7B3E06B983B7F; Sat, 25 Sep 2010 11:07:51 -0600 (MDT)
From: Kelvie Wong <kwong@wurldtech.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 10:07:05 -0700
Message-Id: <1285434426-17736-2-git-send-email-kwong@wurldtech.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285434426-17736-1-git-send-email-kwong@wurldtech.com>
References: <1285434426-17736-1-git-send-email-kwong@wurldtech.com>
X-Cloudmark-Analysis: v=1.1 cv=h6ChtguSspGJfXpanO7c7fpLHAUGK2tMuzTy8LHjEco=
	c=1 sm=0 a=vqEaDNv05NgA:10 a=45p8Zyiy/ZpScqfSBMwu1A==:17
	a=2Toa-IkM5SZDk29-vLcA:9 a=tS3OwJ2-_sdpyr3lHVkA:7
	a=8TBPf4jmKJteTmqc5lh8ALnMr0EA:4 a=HpAAvcLHHh0Zw7uRqdWCyQ==:117
X-SA-Exim-Connect-IP: 204.209.205.13
X-SA-Exim-Mail-From: kwong@wurldtech.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Kelvie Wong <kwong@wurldtech.com>
Subject: [PATCH 2/3] initramfs-module-udev: New module
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
X-List-Received-Date: Sat, 25 Sep 2010 17:51:57 -0000

This launches (and kills) udev during the initramfs procedure to populate
the /dev tree as udev would.

With this, we can boot off block devices by label or uuid, by using the
/dev/disk/by-{uuid,label,path}/sdX syntax.
---
 recipes/initrdscripts/files/15-initudev.sh         |    5 +++++
 recipes/initrdscripts/files/90-killudev.sh         |    4 ++++
 recipes/initrdscripts/initramfs-module-udev_1.0.bb |   13 +++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 recipes/initrdscripts/files/15-initudev.sh
 create mode 100644 recipes/initrdscripts/files/90-killudev.sh
 create mode 100644 recipes/initrdscripts/initramfs-module-udev_1.0.bb

diff --git a/recipes/initrdscripts/files/15-initudev.sh b/recipes/initrdscripts/files/15-initudev.sh
new file mode 100644
index 0000000..5505a83
--- /dev/null
+++ b/recipes/initrdscripts/files/15-initudev.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+# Starts udev to populate /dev
+
+# 'start' isn't actually needed, but keeps it consistent
+/etc/init.d/udev start
diff --git a/recipes/initrdscripts/files/90-killudev.sh b/recipes/initrdscripts/files/90-killudev.sh
new file mode 100644
index 0000000..464eb30
--- /dev/null
+++ b/recipes/initrdscripts/files/90-killudev.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+# Kills udevd before booting into the real root.
+
+kill `pidof udevd`
diff --git a/recipes/initrdscripts/initramfs-module-udev_1.0.bb b/recipes/initrdscripts/initramfs-module-udev_1.0.bb
new file mode 100644
index 0000000..0ae9a33
--- /dev/null
+++ b/recipes/initrdscripts/initramfs-module-udev_1.0.bb
@@ -0,0 +1,13 @@
+SRC_URI = "file://15-initudev.sh file://90-killudev.sh"
+RDEPENDS = "initramfs-uniboot udev"
+DESCRIPTION = "initramfs module for populating /dev with udev"
+
+do_install() {
+    install -d ${D}/initrd.d
+    install -m 0755 ${WORKDIR}/15-initudev.sh ${D}/initrd.d/
+    install -m 0755 ${WORKDIR}/90-killudev.sh ${D}/initrd.d/
+}
+
+PACKAGE_ARCH = "all"
+FILES_${PN} += " /initrd.d/* "
+
-- 
1.7.0.4



