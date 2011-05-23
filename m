Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QOVGR-0000kq-SO
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 15:33:44 +0200
Received: by mail-gw0-f47.google.com with SMTP id 11so2199777gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 06:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=fRvY9AJ07EV6IO/gcSa+CGRLfH76bkmEXjOfDZd6SBE=;
	b=lng+9AMQCCVxQSrgW7Wy5OQOWWr7OInRswnuexGAmvUqZcL+z2v79zvYICaGvakxAh
	A+lNoVgXjvzCoTvb7vLMPiOVM7Fg/XyhJEQTMx2vYORUn2i8r7GhXABQwz3kk5mJPIWg
	JbZpHsdrd/4D/vNaS5pjZK+br5e2om/QBbVEI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=naITIjFnvlYhdsSsK4/aGDUwGMdS7OvKq+0osmkAMBzSrAN5RWtUsEY1sCISQKJEPX
	KQj27OK5FPH9HKA5hZtl5NOUZtaWCxFkX0xCcBX8ZNC4DQYq+Urpv5ky+3b+YT/HnLD/
	EoFSWktPdSw4UqmSyn18NrRUNuK6PMnaIJbOE=
Received: by 10.150.180.20 with SMTP id c20mr1977397ybf.413.1306157445632;
	Mon, 23 May 2011 06:30:45 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q29sm2723749yba.17.2011.05.23.06.30.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 May 2011 06:30:44 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 May 2011 13:30:23 +0000
Message-Id: <1d9eec6f984f4b9e1d3a760305688dc8fb4e57f7.1306157341.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306157341.git.otavio@ossystems.com.br>
References: <cover.1306157341.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306157341.git.otavio@ossystems.com.br>
References: <cover.1306157341.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/4] udev: remove udev.inc since it was not being in use
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
X-List-Received-Date: Mon, 23 May 2011 13:33:44 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/udev/udev.inc |  101 ------------------------------------
 1 files changed, 0 insertions(+), 101 deletions(-)
 delete mode 100644 meta-oe/recipes-core/udev/udev.inc

diff --git a/meta-oe/recipes-core/udev/udev.inc b/meta-oe/recipes-core/udev/udev.inc
deleted file mode 100644
index 0c8a662..0000000
--- a/meta-oe/recipes-core/udev/udev.inc
+++ /dev/null
@@ -1,101 +0,0 @@
-DESCRIPTION ?= "udev is a program which dynamically creates and removes device nodes from \
-/dev/. It responds to /sbin/hotplug device events and requires a 2.6 kernel."
-
-LICENSE = "GPLv2+"
-
-SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-	   file://udev.rules \
-	   file://devfs-udev.rules \
-	   file://links.conf \
-           file://permissions.rules \
-	   file://mount.sh \
-	   file://network.sh \
-	   file://local.rules \
-           file://init \
-	   file://udev-compat-wrapper-patch"
-
-INC_PR = "r30"
-
-inherit update-rc.d autotools pkgconfig
-
-PARALLEL_MAKE = ""
-UDEV_DEVFS_RULES ?= "0"
-PKG_libvolume-id-dev = "libvolume-id-dev"
-
-RDEPENDS_${PN} += "module-init-tools-depmod udev-utils"
-
-INITSCRIPT_NAME = "udev"
-INITSCRIPT_PARAMS = "start 03 S ."
-
-export CROSS = "${TARGET_PREFIX}"
-export HOSTCC = "${BUILD_CC}"
-export udevdir ?= "/dev"
-# Put stuff in /lib and /sbin
-export bindir := "${base_bindir}"
-export sbindir := "${base_sbindir}"
-export usrbindir := "${bindir}"
-export usrsbindir := "${sbindir}"
-export etcdir := "${sysconfdir}"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-UDEV_EXTRAS = "<override me>"
-EXTRA_OEMAKE = "-e \
-		'EXTRAS=${UDEV_EXTRAS}' \
-		'STRIP=echo'"
-
-RPROVIDES_udev_append = " udev-compat-wrapper"
-RDEPENDS_udev_spitz += "udev-compat"
-do_unpack_append_spitz() {
-	bb.build.exec_func('do_apply_compat_wrapper', d)
-}
-RDEPENDS_udev_akita += "udev-compat"
-do_unpack_append_akita() {
-	bb.build.exec_func('do_apply_compat_wrapper', d)
-}
-RDEPENDS_udev_c7x0 += "udev-compat"
-do_unpack_append_c7x0() {
-	bb.build.exec_func('do_apply_compat_wrapper', d)
-}
-RDEPENDS_udev_poodle += "udev-compat"
-do_unpack_append_poodle() {
-	bb.build.exec_func('do_apply_compat_wrapper', d)
-}
-
-# Modify init script on platforms that need to boot old kernels:
-do_apply_compat_wrapper() {
-	cd ${WORKDIR}
-	sed -i "s:/sbin/udevd:\$UDEVD:g;s:/sbin/udevadm:\$UDEVADM:g" init
-	patch <udev-compat-wrapper-patch
-	cd -
-}
-
-do_install () {
-	install -d ${D}${usrsbindir} \
-		   ${D}${sbindir}
-	oe_runmake 'DESTDIR=${D}' INSTALL=install install
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
-
-	install -d ${D}${sysconfdir}/udev/rules.d/
-
-	install -m 0644 ${WORKDIR}/local.rules         ${D}${sysconfdir}/udev/rules.d/local.rules
-	install -m 0644 ${WORKDIR}/permissions.rules   ${D}${sysconfdir}/udev/rules.d/permissions.rules
-	install -m 0644 ${WORKDIR}/udev.rules          ${D}${sysconfdir}/udev/rules.d/udev.rules
-	if [ "${UDEV_DEVFS_RULES}" = "1" ]; then
-		install -m 0644 ${WORKDIR}/devfs-udev.rules ${D}${sysconfdir}/udev/rules.d/devfs-udev.rules
-	fi
-
-	install -d ${D}${sysconfdir}/udev/scripts/
-
-	install -m 0755 ${WORKDIR}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
-	install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
-        install -m 0644 ${S}/extras/volume_id/lib/libvolume_id.h ${D}${includedir}
-        oe_libinstall -C extras/volume_id/lib libvolume_id ${D}${libdir}
-}
-
-PACKAGES =+ "udev-utils libvolume-id libvolume-id-dev"
-FILES_libvolume-id-dev = "${includedir}/libvolume_id.h ${libdir}/libvolume_id.a ${libdir}/libvolume_id.so ${libdir}/pkgconfig/libvolume_id.pc"
-FILES_udev-utils = "${usrbindir}/udevinfo ${usrbindir}/udevtest ${sbindir}/udevadm"
-FILES_libvolume-id = "${base_libdir}/libvolume_id.so.*"
-FILES_${PN} += "${usrbindir}/* ${usrsbindir}/udevd"
-FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
-- 
1.7.2.5



