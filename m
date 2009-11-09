Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1N7byA-0007PD-Qu
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Nov 2009 22:40:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 229475BE6CB;
	Mon,  9 Nov 2009 16:30:21 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32455-08; Mon,  9 Nov 2009 16:30:21 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id F3C565C0788; Mon,  9 Nov 2009 16:30:20 -0500 (EST)
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 8857B5BE6CB;
	Mon,  9 Nov 2009 16:30:19 -0500 (EST)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 6B51040FCC; Mon,  9 Nov 2009 16:30:19 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Nov 2009 16:30:18 -0500
Message-Id: <1257802218-2294-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.ott.cti.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] module-init-tools 3.4: fix when sbindir != /sbin
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
X-List-Received-Date: Mon, 09 Nov 2009 21:40:18 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/module-init-tools/module-init-tools_3.4.bb |   48 ++++++++++++--------
 1 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/recipes/module-init-tools/module-init-tools_3.4.bb b/recipes/module-init-tools/module-init-tools_3.4.bb
index caea00d..1a1e86d 100644
--- a/recipes/module-init-tools/module-init-tools_3.4.bb
+++ b/recipes/module-init-tools/module-init-tools_3.4.bb
@@ -4,13 +4,13 @@ the same function that the modutils package serves for Linux 2.4."
 LICENSE = "GPL"
 SECTION = "base"
 
-PR = "r1"
+PR = "r2"
 
 PACKAGES =+ "module-init-tools-insmod-static module-init-tools-depmod"
 RDEPENDS_${PN} += "module-init-tools-depmod"
 
-FILES_module-init-tools-depmod = "${sbindir}/depmod.26"
-FILES_module-init-tools-insmod-static = "${sbindir}/insmod.static"
+FILES_module-init-tools-depmod = "${base_sbindir}/depmod.26"
+FILES_module-init-tools-insmod-static = "${base_sbindir}/insmod.static"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/module-init-tools/module-init-tools-${PV}.tar.bz2 \
 	   file://modutils_extension;patch=1 \
@@ -19,8 +19,8 @@ S = "${WORKDIR}/module-init-tools-${PV}"
 
 EXTRA_OECONF = "--disable-manpages"
 
-bindir = "/bin"
-sbindir = "/sbin"
+bindir = "${base_bindir}"
+sbindir = "${base_sbindir}"
 
 inherit autotools
 
@@ -30,37 +30,47 @@ do_configure_prepend() {
 
 do_install() {
 	autotools_do_install
-	for f in bin/lsmod sbin/insmod sbin/rmmod sbin/modprobe sbin/modinfo sbin/depmod; do
-		mv ${D}/$f ${D}/$f.26
+	for f in ${base_bindir}/lsmod ${base_sbindir}/insmod ${base_sbindir}/rmmod ${base_sbindir}/modprobe ${base_sbindir}/modinfo ${base_sbindir}/depmod; do
+		mv ${D}$f ${D}$f.26
 	done
 }
 
 pkg_postinst_module-init-tools() {
 #!/bin/sh
-for f in sbin/insmod sbin/modprobe sbin/rmmod sbin/modinfo; do
-bn=`basename $f`
-   update-alternatives --install /$f $bn /$f.26 60
+for f in ${base_sbindir}/insmod ${base_sbindir}/modprobe ${base_sbindir}/rmmod ${base_sbindir}/modinfo; do
+	bn=`basename $f`
+	update-alternatives --install $f $bn $f.26 60
 done
-update-alternatives --install /bin/lsmod bin-lsmod /bin/lsmod.26 60
-update-alternatives --install /sbin/lsmod lsmod /bin/lsmod.26 60
+
+update-alternatives --install ${base_bindir}/lsmod bin-lsmod ${base_bindir}/lsmod.26 60
+
+# Bug #232: Install /sbin/lsmod as a symlink to /bin/lsmod to match Busybox
+if [ "${base_bindir}" != "${base_sbindir}" ]
+then
+	update-alternatives --install ${base_sbindir}/lsmod lsmod ${base_bindir}/lsmod.26 60
+fi
 }
 
 pkg_prerm_module-init-tools() {
 #!/bin/sh
-for f in sbin/insmod sbin/modprobe sbin/rmmod sbin/modinfo; do
-bn=`basename $f`
-   update-alternatives --remove $bn /$f.26
+for f in ${base_sbindir}/insmod ${base_sbindir}/modprobe ${base_sbindir}/rmmod ${base_sbindir}/modinfo; do
+	bn=`basename $f`
+	update-alternatives --remove $bn $f.26
 done
-update-alternatives --remove bin-lsmod /bin/lsmod.26
-update-alternatives --remove lsmod /bin/lsmod.26
+update-alternatives --remove bin-lsmod ${base_bindir}/lsmod.26
+
+if [ "$bindir" != "$sbindir" ]
+then
+	update-alternatives --remove lsmod ${base_bindir}/lsmod.26
+fi
 }
 
 pkg_postinst_module-init-tools-depmod() {
 #!/bin/sh
-update-alternatives --install /sbin/depmod depmod /sbin/depmod.26 60
+update-alternatives --install ${base_sbindir}/depmod depmod ${base_sbindir}/depmod.26 60
 }
 
 pkg_prerm_module-init-tools-depmod() {
 #!/bin/sh
-update-alternatives --remove depmod /sbin/depmod.26
+update-alternatives --remove depmod ${sbindir}/depmod.26
 }
-- 
1.6.3



