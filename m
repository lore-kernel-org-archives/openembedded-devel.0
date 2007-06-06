Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HvqTx-0002Lw-Mo
	for openembedded-devel@openembedded.org; Wed, 06 Jun 2007 10:03:09 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l5680hox022555 for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Jun 2007 10:00:43 +0200
Message-ID: <466669AD.6050809@dominion.kabel.utwente.nl>
Date: Wed, 06 Jun 2007 10:00:45 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.0 (Macintosh/20070326)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46665B15.8090401@dominion.kabel.utwente.nl>
	<74d0deb30706060046q7a91542bl6591542175161eb5@mail.gmail.com>
In-Reply-To: <74d0deb30706060046q7a91542bl6591542175161eb5@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: splitting task-boot out of task-base
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
X-List-Received-Date: Wed, 06 Jun 2007 08:03:11 -0000
Content-Type: multipart/mixed; boundary="------------090809010205040904020203"

--------------090809010205040904020203
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

pHilipp Zabel schreef:
> On 6/6/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> Building something task-boot based will make OE build everything in task-base, which is a
>> bit wastefull, so put task-boot in its own recipe to prevent that.
>>
>> Comments?
> 
> Good idea ...
> 
>>  # task-base contain stuff needed for base system (machine related)
>>  #
>>  RDEPENDS_task-base = "\
>> -    task-boot \
>>      task-distro-base \
>>      task-machine-base \
>>      ${DISTRO_SSH_DAEMON} \
> 
> ... but task-base should still RDEPEND on task-boot, shouldn't it?

Right :) Updated version attached.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGZmmsMkyGM64RGpERAsviAKC0C1yvKNXtBVFpBFeI4LCPC+8DiACgsHfI
iMitiucLV8KDus5YlqEHx8I=
=xBCy
-----END PGP SIGNATURE-----
#
# old_revision [b7a223418eae963a7bb9acb5a448f9f1afda730e]
#
# add_file "packages/tasks/task-boot.bb"
#  content [56d15357c084979376245421266733fb5a2ac2c3]
# 
# patch "packages/tasks/task-base.bb"
#  from [6fdee3b6f767252f69deb3a8c875e7d7668dd786]
#    to [cc21b03ea34f69a2d4ea66e043efbde612643618]
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
--- packages/tasks/task-base.bb	6fdee3b6f767252f69deb3a8c875e7d7668dd786
+++ packages/tasks/task-base.bb	cc21b03ea34f69a2d4ea66e043efbde612643618
@@ -1,8 +1,9 @@ PR = "r36"
 DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
 PR = "r36"
 
+DEPENDS = "task-boot"
 PROVIDES = "${PACKAGES}"
-PACKAGES = 'task-boot \
+PACKAGES = ' \
             task-base \
             task-base-extended \
             task-distro-base \
@@ -43,27 +44,11 @@ PACKAGE_ARCH_task-base = "${MACHINE_ARCH
 # packages which content depend on MACHINE_FEATURES need to be MACHINE_ARCH
 #
 PACKAGE_ARCH_task-base = "${MACHINE_ARCH}"
-PACKAGE_ARCH_task-boot = "${MACHINE_ARCH}"
 PACKAGE_ARCH_task-machine-base = "${MACHINE_ARCH}"
 PACKAGE_ARCH_task-base-apm = "${MACHINE_ARCH}"
 PACKAGE_ARCH_task-base-pcmcia = "${MACHINE_ARCH}"
 
 #
-# udev, devfsd, mdev (from busybox) or none
-#
-DISTRO_DEV_MANAGER ?= "${@base_contains("MACHINE_FEATURES", "kernel26",  "udev","",d)} "
-
-#
-# sysvinit, upstart
-#
-DISTRO_INIT_MANAGER ?= "sysvinit sysvinit-pidof"
-
-#
-# tinylogin, getty
-#
-DISTRO_LOGIN_MANAGER ?= "tinylogin"
-
-#
 # linux-hotplug or none
 #
 HOTPLUG ?= "${@base_contains("MACHINE_FEATURES", "kernel24",  "linux-hotplug","",d)} "
@@ -158,26 +143,6 @@ RRECOMMENDS_task-machine-base = "${MACHI
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
 

--------------090809010205040904020203--
