Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HvpVi-00061b-0H
	for openembedded-devel@openembedded.org; Wed, 06 Jun 2007 09:00:50 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l566wRox011758 for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Jun 2007 08:58:27 +0200
Message-ID: <46665B15.8090401@dominion.kabel.utwente.nl>
Date: Wed, 06 Jun 2007 08:58:29 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.0 (Macintosh/20070326)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-Enigmail-Version: 0.95.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: RFC: splitting task-boot out of task-base
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jun 2007 07:00:54 -0000
Content-Type: multipart/mixed; boundary="------------000103040808080101080902"

--------------000103040808080101080902
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Building something task-boot based will make OE build everything in task-base, which is a
bit wastefull, so put task-boot in its own recipe to prevent that.

Comments?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGZlsVMkyGM64RGpERArFrAJ9l0VsikRpX7jyg/x31s7wFv/640gCgrm77
6BCH6TouYgRsvTXhbDXsCkY=
=kElm
-----END PGP SIGNATURE-----
#
# old_revision [cc77b9d135248dc8b58b6894e8ed95dcbd474752]
#
# add_file "packages/tasks/task-boot.bb"
#  content [56d15357c084979376245421266733fb5a2ac2c3]
# 
# patch "packages/tasks/task-base.bb"
#  from [e137a9c33e08135bf3218f592df8f5b18cfe04cf]
#    to [ddd47e3dc1d7070db0cba2a2b47982fea5db68b7]
#
============================================================
--- packages/tasks/task-boot.bb	56d15357c084979376245421266733fb5a2ac2c3
+++ packages/tasks/task-boot.bb	56d15357c084979376245421266733fb5a2ac2c3
@@ -0,0 +1,53 @@
+DESCRIPTION = "Basic task to get a device booting"
+PR = "r35"
+
+PROVIDES = "${PACKAGES}"
+PACKAGES = 'task-boot'
+
+ALLOW_EMPTY = "1"
+
+# packages which content depend on MACHINE_FEATURES need to be MACHINE_ARCH
+#
+PACKAGE_ARCH_task-boot = "${MACHINE_ARCH}"
+
+#
+# udev, devfsd, mdev (from busybox) or none
+#
+DISTRO_DEV_MANAGER ?= "${@base_contains("MACHINE_FEATURES", "kernel26",  "udev","",d)} "
+
+#
+# sysvinit, upstart
+#
+DISTRO_INIT_MANAGER ?= "sysvinit sysvinit-pidof"
+
+#
+# tinylogin, getty
+#
+DISTRO_LOGIN_MANAGER ?= "tinylogin"
+
+#
+# those ones can be set in machine config to supply packages needed to get machine booting
+#
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
+
+#
+# minimal set of packages - needed to boot
+#
+RDEPENDS_task-boot = "\
+    kernel \
+    base-files \
+    base-passwd \
+    busybox \
+    initscripts \
+    modutils-initscripts \
+    netbase \
+    update-alternatives \
+    ${DISTRO_DEV_MANAGER} \
+    ${DISTRO_INIT_MANAGER} \
+    ${DISTRO_LOGIN_MANAGER} \
+    ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
+
+RRECOMMENDS_task-boot = "\
+    ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}"
+
============================================================
--- packages/tasks/task-base.bb	e137a9c33e08135bf3218f592df8f5b18cfe04cf
+++ packages/tasks/task-base.bb	ddd47e3dc1d7070db0cba2a2b47982fea5db68b7
@@ -1,8 +1,9 @@ PR = "r35"
 DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
 PR = "r35"
 
+DEPENDS = "task-boot"
 PROVIDES = "${PACKAGES}"
-PACKAGES = 'task-boot \
+PACKAGES = ' \
             task-base \
             task-base-extended \
             task-distro-base \
@@ -43,7 +44,6 @@ PACKAGE_ARCH_task-base = "${MACHINE_ARCH
 # packages which content depend on MACHINE_FEATURES need to be MACHINE_ARCH
 #
 PACKAGE_ARCH_task-base = "${MACHINE_ARCH}"
-PACKAGE_ARCH_task-boot = "${MACHINE_ARCH}"
 PACKAGE_ARCH_task-machine-base = "${MACHINE_ARCH}"
 PACKAGE_ARCH_task-base-apm = "${MACHINE_ARCH}"
 PACKAGE_ARCH_task-base-pcmcia = "${MACHINE_ARCH}"
@@ -88,7 +88,6 @@ RDEPENDS_task-base = "\
 # task-base contain stuff needed for base system (machine related)
 #
 RDEPENDS_task-base = "\
-    task-boot \
     task-distro-base \
     task-machine-base \
     ${DISTRO_SSH_DAEMON} \
@@ -158,26 +157,6 @@ RRECOMMENDS_task-machine-base = "${MACHI
 RDEPENDS_task-machine-base = "${MACHINE_EXTRA_RDEPENDS}"
 RRECOMMENDS_task-machine-base = "${MACHINE_EXTRA_RRECOMMENDS}"
 
-#
-# minimal set of packages - needed to boot
-#
-RDEPENDS_task-boot = "\
-    kernel \
-    base-files \
-    base-passwd \
-    busybox \
-    initscripts \
-    modutils-initscripts \
-    netbase \
-    update-alternatives \
-    ${DISTRO_DEV_MANAGER} \
-    ${DISTRO_INIT_MANAGER} \
-    ${DISTRO_LOGIN_MANAGER} \
-    ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
-
-RRECOMMENDS_task-boot = "\
-    ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}"
-
 RDEPENDS_task-base-kernel24 = "\
     modutils-depmod"
 

--------------000103040808080101080902--
