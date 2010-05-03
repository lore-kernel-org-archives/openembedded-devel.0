Received: from fg-out-1718.google.com ([72.14.220.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O8sCM-0007rT-5u
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 11:44:51 +0200
Received: by fg-out-1718.google.com with SMTP id 19so713226fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 May 2010 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=8e4/3TpVSJ+zO1Y9bKwoS3paulQwUS7AsV5FjbNUMXo=;
	b=umD/cA0/nKPY0XsFrM8+ljyy9YS6Mvh4k8is2wDRb3OteLvp8QQjJe0CtGntS6mXrr
	3pAdGqISYuFjIG0QmAc3mWG6AqDetZs0+V6fUSoM9VmAfLdX61ym2xW8bQuqLJPx/VDT
	+rwC3WPFv46hnZFILyuy+3q0+u4JWceuHOJW8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=pYwJhGot7Rj1dJ9Mi8mMHIa1hQ+esrCl3EulCAEvhh2pFksyw/ANnhKqfcxqEuFXXu
	e1ngETUTWD39gOqRTUl9A64SYEoOAw9ikDihzgT0pzISN8AgaqJOiGXBLEP33eAWtsO2
	ml50WvpTwvJio4woxMsYc1F2qAzmFGwUKP9ww=
Received: by 10.86.22.31 with SMTP id 31mr9555369fgv.24.1272879638547;
	Mon, 03 May 2010 02:40:38 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 28sm8378723fkx.36.2010.05.03.02.40.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 May 2010 02:40:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 May 2010 11:40:51 +0200
Message-Id: <1272879651-27000-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 72.14.220.152
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] klibc: cleanup all version
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
X-List-Received-Date: Mon, 03 May 2010 09:44:57 -0000

* reuse as much .inc as possible
* use INC_PR
* added klibc-utils.inc with common do_install_append for installing all utils
  added PACKAGES + FILES variables for them (union for all klibc versions)
* added klibc-utils-static.inc with common part of all klibc-utils-static recipes
  and including klibc-utils.inc in the end with prepared variables to install
  static versions
* modprobe was installed in base_bindir for shared and base_sbindir for static, unified
  to base_sbindir
* I've prepared 1.5.18, but needs more love as few patches doesn't apply and I would like to
  convert all to new staging (don't know how to install to cross with native install).
  And please comment about Kbuild/all_headers staging and include/asm link.

* 1.5.14 tested with slugos/nslu2le linux-ixp4xx-2.6.27.8+svnr1089-r2
* 1.5.15+1.5.16 tested with angstrom/spitz linux-2.6.34-rc6+git% (with work-arround see bellow)

* all version:
  with newer kernel version where is no include/asm, which is
  replaced with include/asm-generic + ie arch/arm/include/asm/
  we can stage asm -> ../arch/arm/include/asm/ link, or fix klibc
  autotools to use arch inludes correctly

* 1.5.15+1.5.16:
  #still needs Kbuild files and all headers (ie include/drm, include/mtd were missing)
  #work-arround by hand (just to show what needs to be solved):
  cd ${STAGING}/spitz-angstrom-linux-gnueabi/kernel/
  mv include indlude-orig
  cp -ra ${WORKDIR}/spitz-angstrom-linux-gnueabi/linux-2.6.34-rc6+gitr0+be1066bbcd443a65df312fdecea7e4959adedb45-r0/git/include/ .
  cd include
  ln -s ../arch/arm/include/asm/ .

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/klibc/klibc-common.inc                    |    1 +
 recipes/klibc/klibc-utils-static.inc              |   14 ++
 recipes/klibc/klibc-utils-static_1.5.15+1.5.16.bb |  141 +------------------
 recipes/klibc/klibc-utils-static_1.5.15.bb        |  124 +----------------
 recipes/klibc/klibc-utils-static_1.5.bb           |  118 +---------------
 recipes/klibc/klibc-utils.inc                     |  125 ++++++++++++++++
 recipes/klibc/klibc.inc                           |   61 ++++++++
 recipes/klibc/klibc_1.5.15+1.5.16.bb              |   12 +--
 recipes/klibc/klibc_1.5.15+1.5.16.inc             |  158 ++-------------------
 recipes/klibc/klibc_1.5.15.bb                     |   10 +-
 recipes/klibc/klibc_1.5.15.inc                    |  151 +-------------------
 recipes/klibc/klibc_1.5.bb                        |   10 +-
 recipes/klibc/klibc_1.5.inc                       |  146 +------------------
 13 files changed, 239 insertions(+), 832 deletions(-)
 create mode 100644 recipes/klibc/klibc-utils-static.inc
 create mode 100644 recipes/klibc/klibc-utils.inc
 create mode 100644 recipes/klibc/klibc.inc

diff --git a/recipes/klibc/klibc-common.inc b/recipes/klibc/klibc-common.inc
index 20154cc..8fa815d 100644
--- a/recipes/klibc/klibc-common.inc
+++ b/recipes/klibc/klibc-common.inc
@@ -9,6 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/libs/klibc/${KLIBC_FETCHDIR}/klibc-${PV
 
 S = "${WORKDIR}/klibc-${PV}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+INC_PR = "r14"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
diff --git a/recipes/klibc/klibc-utils-static.inc b/recipes/klibc/klibc-utils-static.inc
new file mode 100644
index 0000000..e7ec1ec
--- /dev/null
+++ b/recipes/klibc/klibc-utils-static.inc
@@ -0,0 +1,14 @@
+FILESPATHPKG =. "klibc-${PV}:"
+
+do_install() {
+       install -d ${D}${base_bindir}
+       install -m 755 usr/dash/sh ${D}${base_bindir}
+       install -m 755 usr/kinit/kinit ${D}${base_bindir}
+}
+
+#Package only separate utils
+PACKAGES = ""
+
+KLIBC_UTILS_VARIANT = "static"
+KLIBC_UTILS_PKGNAME = "klibc-utils-static"
+require klibc-utils.inc
diff --git a/recipes/klibc/klibc-utils-static_1.5.15+1.5.16.bb b/recipes/klibc/klibc-utils-static_1.5.15+1.5.16.bb
index b6f34b7..b359916 100644
--- a/recipes/klibc/klibc-utils-static_1.5.15+1.5.16.bb
+++ b/recipes/klibc/klibc-utils-static_1.5.15+1.5.16.bb
@@ -1,138 +1,3 @@
-require klibc-common.inc
-PR = "r1"
-
-KLIBC_FETCHDIR = "Testing"
-
-DEFAULT_PREFERENCE = "-1"
-
-# temporary override here in the recipe
-# until 1.5.16 is released
-
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/libs/klibc/${KLIBC_FETCHDIR}/klibc-1.5.15.tar.bz2 \
-            file://1.5.15+1.5.16.patch;patch=1 \
-            "
-
-S = "${WORKDIR}/klibc-1.5.15"
-
-#
-# end override
-
-SRC_URI += "file://fstype-sane-vfat-and-jffs2-for-1.5.patch;patch=1 \
-            file://modprobe.patch;patch=1 \
-            file://losetup.patch;patch=1 \
-            file://dash_readopt.patch;patch=1 \
-            file://wc.patch;patch=1 \
-            file://staging.patch;patch=1 \
-            file://klibc_kexecsyscall.patch;patch=1 \
-            file://mntproc-definitions.patch;patch=1 \
-            file://signal-cleanup.patch;patch=1 \
-            file://isystem.patch;patch=1 \
-            "
-
-FILESPATHPKG =. "klibc-${PV}:"
-
-# We only want the static utils. klibc build both. So we install only what we want.
-do_install() {
-        install -d ${D}${base_bindir}
-        install -d ${D}${base_sbindir}
-        install -m 755 usr/dash/sh ${D}${base_bindir}
-        install -m 755 usr/gzip/gzip ${D}${base_bindir}
-        install -m 755 usr/kinit/kinit ${D}${base_bindir}
-        install -m 755 usr/kinit/fstype/static/fstype ${D}${base_bindir}
-        install -m 755 usr/kinit/ipconfig/static/ipconfig ${D}${base_bindir}
-        install -m 755 usr/kinit/nfsmount/static/nfsmount ${D}${base_bindir}
-        install -m 755 usr/kinit/resume/static/resume ${D}${base_bindir}
-        install -m 755 usr/kinit/run-init/static/run-init ${D}${base_bindir}
-        install -m 755 usr/utils/static/cat ${D}${base_bindir}
-        install -m 755 usr/utils/static/chroot ${D}${base_bindir}
-        install -m 755 usr/utils/static/cpio ${D}${base_bindir}
-        install -m 755 usr/utils/static/dd ${D}${base_bindir}
-        install -m 755 usr/utils/static/dmesg ${D}${base_bindir}
-        install -m 755 usr/utils/static/false ${D}${base_bindir}
-        install -m 755 usr/utils/static/halt ${D}${base_bindir}
-        install -m 755 usr/utils/static/kill ${D}${base_bindir}
-        install -m 755 usr/utils/static/ln ${D}${base_bindir}
-        install -m 755 usr/utils/static/minips ${D}${base_bindir}
-        install -m 755 usr/utils/static/mkdir ${D}${base_bindir}
-        install -m 755 usr/utils/static/mkfifo ${D}${base_bindir}
-        install -m 755 usr/utils/static/mknod ${D}${base_bindir}
-        install -m 755 usr/utils/static/mount ${D}${base_bindir}
-        install -m 755 usr/utils/static/nuke ${D}${base_bindir}
-        install -m 755 usr/utils/static/pivot_root ${D}${base_bindir}
-        install -m 755 usr/utils/static/poweroff ${D}${base_bindir}
-        install -m 755 usr/utils/static/readlink ${D}${base_bindir}
-        install -m 755 usr/utils/static/reboot ${D}${base_bindir}
-        install -m 755 usr/utils/static/sleep ${D}${base_bindir}
-        install -m 755 usr/utils/static/sync ${D}${base_bindir}
-        install -m 755 usr/utils/static/true ${D}${base_bindir}
-        install -m 755 usr/utils/static/umount ${D}${base_bindir}
-        install -m 755 usr/utils/static/uname ${D}${base_bindir}
-        install -m 755 usr/utils/static/modprobe ${D}${base_sbindir}
-        install -m 755 usr/utils/static/losetup ${D}${base_bindir}
-        install -m 755 usr/utils/static/wc ${D}${base_bindir}
-        install -m 755 usr/utils/static/ls ${D}${base_bindir}
-        cd ${D}${base_bindir}
-        ln -s gzip gunzip
-        ln -s gzip zcat
-        cd -
-}
-
-PACKAGES = "klibc-utils-static-sh klibc-utils-static-gzip \
-        klibc-utils-static-kinit klibc-utils-static-fstype \
-        klibc-utils-static-ipconfig klibc-utils-static-nfsmount \
-        klibc-utils-static-resume klibc-utils-static-run-init \
-        klibc-utils-static-cat klibc-utils-static-chroot \
-        klibc-utils-static-cpio klibc-utils-static-dd \
-        klibc-utils-static-dmesg klibc-utils-static-false \
-        klibc-utils-static-halt klibc-utils-static-kill \
-        klibc-utils-static-ln klibc-utils-static-minips \
-        klibc-utils-static-mkdir klibc-utils-static-mkfifo \
-        klibc-utils-static-mknod klibc-utils-static-mount \
-        klibc-utils-static-nuke klibc-utils-static-pivot-root \
-        klibc-utils-static-poweroff klibc-utils-static-readlink \
-        klibc-utils-static-reboot klibc-utils-static-sleep \
-        klibc-utils-static-sync \
-        klibc-utils-static-true klibc-utils-static-umount \
-        klibc-utils-static-uname klibc-utils-static-modprobe \
-        klibc-utils-static-losetup klibc-utils-static-wc \
-        klibc-utils-static-ls"
-
-FILES_klibc-utils-static-sh = "${base_bindir}/sh"
-FILES_klibc-utils-static-gzip = "${base_bindir}/gzip ${base_bindir}/gunzip ${base_bindir}/zcat"
-FILES_klibc-utils-static-kinit = "${base_bindir}/kinit"
-FILES_klibc-utils-static-fstype = "${base_bindir}/fstype"
-FILES_klibc-utils-static-ipconfig = "${base_bindir}/ipconfig"
-FILES_klibc-utils-static-nfsmount = "${base_bindir}/nfsmount"
-FILES_klibc-utils-static-resume = "${base_bindir}/resume"
-FILES_klibc-utils-static-run-init = "${base_bindir}/run-init"
-FILES_klibc-utils-static-cat = "${base_bindir}/cat"
-FILES_klibc-utils-static-chroot = "${base_bindir}/chroot"
-FILES_klibc-utils-static-cpio = "${base_bindir}/cpio"
-FILES_klibc-utils-static-dd = "${base_bindir}/dd"
-FILES_klibc-utils-static-dmesg = "${base_bindir}/dmesg"
-FILES_klibc-utils-static-false = "${base_bindir}/false"
-FILES_klibc-utils-static-halt = "${base_bindir}/halt"
-FILES_klibc-utils-static-kill = "${base_bindir}/kill"
-FILES_klibc-utils-static-ln = "${base_bindir}/ln"
-FILES_klibc-utils-static-minips = "${base_bindir}/minips"
-FILES_klibc-utils-static-mkdir = "${base_bindir}/mkdir"
-FILES_klibc-utils-static-mkfifo = "${base_bindir}/mkfifo"
-FILES_klibc-utils-static-mknod = "${base_bindir}/mknod"
-FILES_klibc-utils-static-mount = "${base_bindir}/mount"
-FILES_klibc-utils-static-nuke = "${base_bindir}/nuke"
-FILES_klibc-utils-static-pivot-root = "${base_bindir}/pivot_root"
-FILES_klibc-utils-static-poweroff = "${base_bindir}/poweroff"
-FILES_klibc-utils-static-readlink = "${base_bindir}/readlink"
-FILES_klibc-utils-static-reboot = "${base_bindir}/reboot"
-FILES_klibc-utils-static-sleep = "${base_bindir}/sleep"
-FILES_klibc-utils-static-sync = "${base_bindir}/sync"
-FILES_klibc-utils-static-true = "${base_bindir}/true"
-FILES_klibc-utils-static-umount = "${base_bindir}/umount"
-FILES_klibc-utils-static-uname = "${base_bindir}/uname"
-FILES_klibc-utils-static-modprobe = "${base_sbindir}/modprobe"
-FILES_klibc-utils-static-losetup = "${base_bindir}/losetup"
-FILES_klibc-utils-static-wc = "${base_bindir}/wc"
-FILES_klibc-utils-static-ls = "${base_bindir}/ls"
-
-SRC_URI[md5sum] = "db2152a8a03bd81e21a5f451f537ae3d"
-SRC_URI[sha256sum] = "8b5334ef88b075f374b031695181b4302c3e5621bf2737a39fdf28262b0f80f4"
+require klibc-utils-static.inc
+require klibc_${PV}.inc
+PR = "${INC_PR}.0"
diff --git a/recipes/klibc/klibc-utils-static_1.5.15.bb b/recipes/klibc/klibc-utils-static_1.5.15.bb
index 8bad3f5..b359916 100644
--- a/recipes/klibc/klibc-utils-static_1.5.15.bb
+++ b/recipes/klibc/klibc-utils-static_1.5.15.bb
@@ -1,121 +1,3 @@
-require klibc-common.inc
-PR = "r3"
-
-KLIBC_FETCHDIR = "Testing"
-
-SRC_URI += "file://fstype-sane-vfat-and-jffs2-for-1.5.patch;patch=1 \
-            file://modprobe.patch;patch=1 \
-            file://losetup.patch;patch=1 \
-            file://dash_readopt.patch;patch=1 \
-            file://wc.patch;patch=1 \
-            file://staging.patch;patch=1 \
-            file://klibc_kexecsyscall.patch;patch=1 \
-            file://mntproc-definitions.patch;patch=1 \
-            file://signal-cleanup.patch;patch=1 \
-            file://isystem.patch;patch=1 \
-            "
-
-FILESPATHPKG =. "klibc-${PV}:"
-
-# We only want the static utils. klibc build both. So we install only what we want.
-do_install() {
-        install -d ${D}${base_bindir}
-        install -d ${D}${base_sbindir}
-        install -m 755 usr/dash/sh ${D}${base_bindir}
-        install -m 755 usr/gzip/gzip ${D}${base_bindir}
-        install -m 755 usr/kinit/kinit ${D}${base_bindir}
-        install -m 755 usr/kinit/fstype/static/fstype ${D}${base_bindir}
-        install -m 755 usr/kinit/ipconfig/static/ipconfig ${D}${base_bindir}
-        install -m 755 usr/kinit/nfsmount/static/nfsmount ${D}${base_bindir}
-        install -m 755 usr/kinit/resume/static/resume ${D}${base_bindir}
-        install -m 755 usr/kinit/run-init/static/run-init ${D}${base_bindir}
-        install -m 755 usr/utils/static/cat ${D}${base_bindir}
-        install -m 755 usr/utils/static/chroot ${D}${base_bindir}
-        install -m 755 usr/utils/static/cpio ${D}${base_bindir}
-        install -m 755 usr/utils/static/dd ${D}${base_bindir}
-        install -m 755 usr/utils/static/dmesg ${D}${base_bindir}
-        install -m 755 usr/utils/static/false ${D}${base_bindir}
-        install -m 755 usr/utils/static/halt ${D}${base_bindir}
-        install -m 755 usr/utils/static/kill ${D}${base_bindir}
-        install -m 755 usr/utils/static/ln ${D}${base_bindir}
-        install -m 755 usr/utils/static/minips ${D}${base_bindir}
-        install -m 755 usr/utils/static/mkdir ${D}${base_bindir}
-        install -m 755 usr/utils/static/mkfifo ${D}${base_bindir}
-        install -m 755 usr/utils/static/mknod ${D}${base_bindir}
-        install -m 755 usr/utils/static/mount ${D}${base_bindir}
-        install -m 755 usr/utils/static/nuke ${D}${base_bindir}
-        install -m 755 usr/utils/static/pivot_root ${D}${base_bindir}
-        install -m 755 usr/utils/static/poweroff ${D}${base_bindir}
-        install -m 755 usr/utils/static/readlink ${D}${base_bindir}
-        install -m 755 usr/utils/static/reboot ${D}${base_bindir}
-        install -m 755 usr/utils/static/sleep ${D}${base_bindir}
-        install -m 755 usr/utils/static/sync ${D}${base_bindir}
-        install -m 755 usr/utils/static/true ${D}${base_bindir}
-        install -m 755 usr/utils/static/umount ${D}${base_bindir}
-        install -m 755 usr/utils/static/uname ${D}${base_bindir}
-        install -m 755 usr/utils/static/modprobe ${D}${base_sbindir}
-        install -m 755 usr/utils/static/losetup ${D}${base_bindir}
-        install -m 755 usr/utils/static/wc ${D}${base_bindir}
-        cd ${D}${base_bindir}
-        ln -s gzip gunzip
-        ln -s gzip zcat
-        cd -
-}
-
-PACKAGES = "klibc-utils-static-sh klibc-utils-static-gzip \
-        klibc-utils-static-kinit klibc-utils-static-fstype \
-        klibc-utils-static-ipconfig klibc-utils-static-nfsmount \
-        klibc-utils-static-resume klibc-utils-static-run-init \
-        klibc-utils-static-cat klibc-utils-static-chroot \
-        klibc-utils-static-cpio klibc-utils-static-dd \
-        klibc-utils-static-dmesg klibc-utils-static-false \
-        klibc-utils-static-halt klibc-utils-static-kill \
-        klibc-utils-static-ln klibc-utils-static-minips \
-        klibc-utils-static-mkdir klibc-utils-static-mkfifo \
-        klibc-utils-static-mknod klibc-utils-static-mount \
-        klibc-utils-static-nuke klibc-utils-static-pivot-root \
-        klibc-utils-static-poweroff klibc-utils-static-readlink \
-        klibc-utils-static-reboot klibc-utils-static-sleep \
-        klibc-utils-static-sync \
-        klibc-utils-static-true klibc-utils-static-umount \
-        klibc-utils-static-uname klibc-utils-static-modprobe \
-        klibc-utils-static-losetup klibc-utils-static-wc"
-
-FILES_klibc-utils-static-sh = "${base_bindir}/sh"
-FILES_klibc-utils-static-gzip = "${base_bindir}/gzip ${base_bindir}/gunzip ${base_bindir}/zcat"
-FILES_klibc-utils-static-kinit = "${base_bindir}/kinit"
-FILES_klibc-utils-static-fstype = "${base_bindir}/fstype"
-FILES_klibc-utils-static-ipconfig = "${base_bindir}/ipconfig"
-FILES_klibc-utils-static-nfsmount = "${base_bindir}/nfsmount"
-FILES_klibc-utils-static-resume = "${base_bindir}/resume"
-FILES_klibc-utils-static-run-init = "${base_bindir}/run-init"
-FILES_klibc-utils-static-cat = "${base_bindir}/cat"
-FILES_klibc-utils-static-chroot = "${base_bindir}/chroot"
-FILES_klibc-utils-static-cpio = "${base_bindir}/cpio"
-FILES_klibc-utils-static-dd = "${base_bindir}/dd"
-FILES_klibc-utils-static-dmesg = "${base_bindir}/dmesg"
-FILES_klibc-utils-static-false = "${base_bindir}/false"
-FILES_klibc-utils-static-halt = "${base_bindir}/halt"
-FILES_klibc-utils-static-kill = "${base_bindir}/kill"
-FILES_klibc-utils-static-ln = "${base_bindir}/ln"
-FILES_klibc-utils-static-minips = "${base_bindir}/minips"
-FILES_klibc-utils-static-mkdir = "${base_bindir}/mkdir"
-FILES_klibc-utils-static-mkfifo = "${base_bindir}/mkfifo"
-FILES_klibc-utils-static-mknod = "${base_bindir}/mknod"
-FILES_klibc-utils-static-mount = "${base_bindir}/mount"
-FILES_klibc-utils-static-nuke = "${base_bindir}/nuke"
-FILES_klibc-utils-static-pivot-root = "${base_bindir}/pivot_root"
-FILES_klibc-utils-static-poweroff = "${base_bindir}/poweroff"
-FILES_klibc-utils-static-readlink = "${base_bindir}/readlink"
-FILES_klibc-utils-static-reboot = "${base_bindir}/reboot"
-FILES_klibc-utils-static-sleep = "${base_bindir}/sleep"
-FILES_klibc-utils-static-sync = "${base_bindir}/sync"
-FILES_klibc-utils-static-true = "${base_bindir}/true"
-FILES_klibc-utils-static-umount = "${base_bindir}/umount"
-FILES_klibc-utils-static-uname = "${base_bindir}/uname"
-FILES_klibc-utils-static-modprobe = "${base_sbindir}/modprobe"
-FILES_klibc-utils-static-losetup = "${base_bindir}/losetup"
-FILES_klibc-utils-static-wc = "${base_bindir}/wc"
-
-SRC_URI[md5sum] = "db2152a8a03bd81e21a5f451f537ae3d"
-SRC_URI[sha256sum] = "8b5334ef88b075f374b031695181b4302c3e5621bf2737a39fdf28262b0f80f4"
+require klibc-utils-static.inc
+require klibc_${PV}.inc
+PR = "${INC_PR}.0"
diff --git a/recipes/klibc/klibc-utils-static_1.5.bb b/recipes/klibc/klibc-utils-static_1.5.bb
index 7602a9b..b359916 100644
--- a/recipes/klibc/klibc-utils-static_1.5.bb
+++ b/recipes/klibc/klibc-utils-static_1.5.bb
@@ -1,115 +1,3 @@
-require klibc-common.inc
-PR = "r13"
-
-KLIBC_FETCHDIR = "Stable"
-
-SRC_URI += "file://fstype-sane-vfat-and-jffs2-for-1.5.patch;patch=1 \
-            file://modprobe.patch;patch=1 \
-            file://losetup.patch;patch=1 \
-            file://dash_readopt.patch;patch=1 \
-            file://wc.patch;patch=1 \
-            file://staging.patch;patch=1 \
-            file://klibc_kexecsyscall.patch;patch=1 \
-            "
-
-FILESPATHPKG =. "klibc-${PV}:"
-
-# We only want the static utils. klibc build both. So we install only what we want.
-do_install() {
-        install -d ${D}${base_bindir}
-        install -d ${D}${base_sbindir}
-        install -m 755 usr/dash/sh ${D}${base_bindir}
-        install -m 755 usr/gzip/gzip ${D}${base_bindir}
-        install -m 755 usr/kinit/kinit ${D}${base_bindir}
-        install -m 755 usr/kinit/fstype/static/fstype ${D}${base_bindir}
-        install -m 755 usr/kinit/ipconfig/static/ipconfig ${D}${base_bindir}
-        install -m 755 usr/kinit/nfsmount/static/nfsmount ${D}${base_bindir}
-        install -m 755 usr/kinit/resume/static/resume ${D}${base_bindir}
-        install -m 755 usr/kinit/run-init/static/run-init ${D}${base_bindir}
-        install -m 755 usr/utils/static/cat ${D}${base_bindir}
-        install -m 755 usr/utils/static/chroot ${D}${base_bindir}
-        install -m 755 usr/utils/static/cpio ${D}${base_bindir}
-        install -m 755 usr/utils/static/dd ${D}${base_bindir}
-        install -m 755 usr/utils/static/false ${D}${base_bindir}
-        install -m 755 usr/utils/static/halt ${D}${base_bindir}
-        install -m 755 usr/utils/static/insmod ${D}${base_bindir}
-        install -m 755 usr/utils/static/kill ${D}${base_bindir}
-        install -m 755 usr/utils/static/ln ${D}${base_bindir}
-        install -m 755 usr/utils/static/minips ${D}${base_bindir}
-        install -m 755 usr/utils/static/mkdir ${D}${base_bindir}
-        install -m 755 usr/utils/static/mkfifo ${D}${base_bindir}
-        install -m 755 usr/utils/static/mknod ${D}${base_bindir}
-        install -m 755 usr/utils/static/mount ${D}${base_bindir}
-        install -m 755 usr/utils/static/nuke ${D}${base_bindir}
-        install -m 755 usr/utils/static/pivot_root ${D}${base_bindir}
-        install -m 755 usr/utils/static/poweroff ${D}${base_bindir}
-        install -m 755 usr/utils/static/readlink ${D}${base_bindir}
-        install -m 755 usr/utils/static/reboot ${D}${base_bindir}
-        install -m 755 usr/utils/static/sleep ${D}${base_bindir}
-        install -m 755 usr/utils/static/true ${D}${base_bindir}
-        install -m 755 usr/utils/static/umount ${D}${base_bindir}
-        install -m 755 usr/utils/static/uname ${D}${base_bindir}
-        install -m 755 usr/utils/static/modprobe ${D}${base_sbindir}
-        install -m 755 usr/utils/static/losetup ${D}${base_bindir}
-        install -m 755 usr/utils/static/wc ${D}${base_bindir}
-        cd ${D}${base_bindir}
-        ln -s gzip gunzip
-        ln -s gzip zcat
-        cd -
-}
-
-PACKAGES = "klibc-utils-static-sh klibc-utils-static-gzip \
-        klibc-utils-static-kinit klibc-utils-static-fstype \
-        klibc-utils-static-ipconfig klibc-utils-static-nfsmount \
-        klibc-utils-static-resume klibc-utils-static-run-init \
-        klibc-utils-static-cat klibc-utils-static-chroot \
-        klibc-utils-static-cpio klibc-utils-static-dd \
-        klibc-utils-static-false klibc-utils-static-halt \
-        klibc-utils-static-insmod klibc-utils-static-kill \
-        klibc-utils-static-ln klibc-utils-static-minips \
-        klibc-utils-static-mkdir klibc-utils-static-mkfifo \
-        klibc-utils-static-mknod klibc-utils-static-mount \
-        klibc-utils-static-nuke klibc-utils-static-pivot-root \
-        klibc-utils-static-poweroff klibc-utils-static-readlink \
-        klibc-utils-static-reboot klibc-utils-static-sleep \
-        klibc-utils-static-true klibc-utils-static-umount \
-        klibc-utils-static-uname klibc-utils-static-modprobe \
-        klibc-utils-static-losetup klibc-utils-static-wc"
-
-FILES_klibc-utils-static-sh = "${base_bindir}/sh"
-FILES_klibc-utils-static-gzip = "${base_bindir}/gzip ${base_bindir}/gunzip ${base_bindir}/zcat"
-FILES_klibc-utils-static-kinit = "${base_bindir}/kinit"
-FILES_klibc-utils-static-fstype = "${base_bindir}/fstype"
-FILES_klibc-utils-static-ipconfig = "${base_bindir}/ipconfig"
-FILES_klibc-utils-static-nfsmount = "${base_bindir}/nfsmount"
-FILES_klibc-utils-static-resume = "${base_bindir}/resume"
-FILES_klibc-utils-static-run-init = "${base_bindir}/run-init"
-FILES_klibc-utils-static-cat = "${base_bindir}/cat"
-FILES_klibc-utils-static-chroot = "${base_bindir}/chroot"
-FILES_klibc-utils-static-cpio = "${base_bindir}/cpio"
-FILES_klibc-utils-static-dd = "${base_bindir}/dd"
-FILES_klibc-utils-static-false = "${base_bindir}/false"
-FILES_klibc-utils-static-halt = "${base_bindir}/halt"
-FILES_klibc-utils-static-insmod = "${base_bindir}/insmod"
-FILES_klibc-utils-static-kill = "${base_bindir}/kill"
-FILES_klibc-utils-static-ln = "${base_bindir}/ln"
-FILES_klibc-utils-static-minips = "${base_bindir}/minips"
-FILES_klibc-utils-static-mkdir = "${base_bindir}/mkdir"
-FILES_klibc-utils-static-mkfifo = "${base_bindir}/mkfifo"
-FILES_klibc-utils-static-mknod = "${base_bindir}/mknod"
-FILES_klibc-utils-static-mount = "${base_bindir}/mount"
-FILES_klibc-utils-static-nuke = "${base_bindir}/nuke"
-FILES_klibc-utils-static-pivot-root = "${base_bindir}/pivot_root"
-FILES_klibc-utils-static-poweroff = "${base_bindir}/poweroff"
-FILES_klibc-utils-static-readlink = "${base_bindir}/readlink"
-FILES_klibc-utils-static-reboot = "${base_bindir}/reboot"
-FILES_klibc-utils-static-sleep = "${base_bindir}/sleep"
-FILES_klibc-utils-static-true = "${base_bindir}/true"
-FILES_klibc-utils-static-umount = "${base_bindir}/umount"
-FILES_klibc-utils-static-uname = "${base_bindir}/uname"
-FILES_klibc-utils-static-modprobe = "${base_sbindir}/modprobe"
-FILES_klibc-utils-static-losetup = "${base_bindir}/losetup"
-FILES_klibc-utils-static-wc = "${base_bindir}/wc"
-
-SRC_URI[md5sum] = "481dfdef7273f2cc776c2637f481f017"
-SRC_URI[sha256sum] = "27000ba4bc73a5977502b27d7036df24dd6ab94a1c33b8f5d6d54ba62772f0c7"
+require klibc-utils-static.inc
+require klibc_${PV}.inc
+PR = "${INC_PR}.0"
diff --git a/recipes/klibc/klibc-utils.inc b/recipes/klibc/klibc-utils.inc
new file mode 100644
index 0000000..7bbcee3
--- /dev/null
+++ b/recipes/klibc/klibc-utils.inc
@@ -0,0 +1,125 @@
+KLIBC_UTILS_VARIANT ?= "shared"
+KLIBC_UTILS_PKGNAME ?= "klibc-utils"
+
+# We only want the static utils. klibc build both. So we install only what we want.
+do_install_append() {
+        install -d ${D}${base_bindir}
+        install -d ${D}${base_sbindir}
+        install -m 755 usr/gzip/gzip ${D}${base_bindir}
+        install -m 755 usr/kinit/fstype/${KLIBC_UTILS_VARIANT}/fstype ${D}${base_bindir}
+        install -m 755 usr/kinit/ipconfig/${KLIBC_UTILS_VARIANT}/ipconfig ${D}${base_bindir}
+        install -m 755 usr/kinit/nfsmount/${KLIBC_UTILS_VARIANT}/nfsmount ${D}${base_bindir}
+        install -m 755 usr/kinit/resume/${KLIBC_UTILS_VARIANT}/resume ${D}${base_bindir}
+        install -m 755 usr/kinit/run-init/${KLIBC_UTILS_VARIANT}/run-init ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/cat ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/chroot ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/cpio ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/dd ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/false ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/halt ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/kill ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ln ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/minips ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/mkdir ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/mkfifo ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/mknod ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/mount ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/nuke ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/pivot_root ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/poweroff ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/readlink ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/reboot ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/sleep ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/true ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/umount ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/uname ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/modprobe ${D}${base_sbindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/losetup ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/wc ${D}${base_bindir}
+        ln -s gzip ${D}${base_bindir}/gunzip
+        ln -s gzip ${D}${base_bindir}/zcat
+}
+
+# only in 1.5
+# install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/insmod ${D}${base_bindir}
+
+# only in >= 1.5.15
+# install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/dmesg ${D}${base_bindir}
+# install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/sync ${D}${base_bindir}
+
+# only in >= 1.5.15+1.5.16
+# install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ls ${D}${base_bindir}
+
+PACKAGES += "${KLIBC_UTILS_PKGNAME}-sh \
+             ${KLIBC_UTILS_PKGNAME}-gzip \
+             ${KLIBC_UTILS_PKGNAME}-kinit \
+             ${KLIBC_UTILS_PKGNAME}-fstype \
+             ${KLIBC_UTILS_PKGNAME}-ipconfig \
+             ${KLIBC_UTILS_PKGNAME}-nfsmount \
+             ${KLIBC_UTILS_PKGNAME}-resume \
+             ${KLIBC_UTILS_PKGNAME}-run-init \
+             ${KLIBC_UTILS_PKGNAME}-cat \
+             ${KLIBC_UTILS_PKGNAME}-chroot \
+             ${KLIBC_UTILS_PKGNAME}-cpio \
+             ${KLIBC_UTILS_PKGNAME}-dd \
+             ${KLIBC_UTILS_PKGNAME}-dmesg \
+             ${KLIBC_UTILS_PKGNAME}-false \
+             ${KLIBC_UTILS_PKGNAME}-halt \
+             ${KLIBC_UTILS_PKGNAME}-kill \
+             ${KLIBC_UTILS_PKGNAME}-ln \
+             ${KLIBC_UTILS_PKGNAME}-minips \
+             ${KLIBC_UTILS_PKGNAME}-mkdir \
+             ${KLIBC_UTILS_PKGNAME}-mkfifo \
+             ${KLIBC_UTILS_PKGNAME}-mknod \
+             ${KLIBC_UTILS_PKGNAME}-mount \
+             ${KLIBC_UTILS_PKGNAME}-nuke \
+             ${KLIBC_UTILS_PKGNAME}-pivot-root \
+             ${KLIBC_UTILS_PKGNAME}-poweroff \
+             ${KLIBC_UTILS_PKGNAME}-readlink \
+             ${KLIBC_UTILS_PKGNAME}-reboot \
+             ${KLIBC_UTILS_PKGNAME}-sleep \
+             ${KLIBC_UTILS_PKGNAME}-sync \
+             ${KLIBC_UTILS_PKGNAME}-true \
+             ${KLIBC_UTILS_PKGNAME}-umount \
+             ${KLIBC_UTILS_PKGNAME}-uname \
+             ${KLIBC_UTILS_PKGNAME}-modprobe \
+             ${KLIBC_UTILS_PKGNAME}-losetup \
+             ${KLIBC_UTILS_PKGNAME}-wc \
+             ${KLIBC_UTILS_PKGNAME}-ls"
+
+FILES_${KLIBC_UTILS_PKGNAME}-sh = "${base_bindir}/sh"
+FILES_${KLIBC_UTILS_PKGNAME}-gzip = "${base_bindir}/gzip ${base_bindir}/gunzip ${base_bindir}/zcat"
+FILES_${KLIBC_UTILS_PKGNAME}-kinit = "${base_bindir}/kinit"
+FILES_${KLIBC_UTILS_PKGNAME}-fstype = "${base_bindir}/fstype"
+FILES_${KLIBC_UTILS_PKGNAME}-ipconfig = "${base_bindir}/ipconfig"
+FILES_${KLIBC_UTILS_PKGNAME}-nfsmount = "${base_bindir}/nfsmount"
+FILES_${KLIBC_UTILS_PKGNAME}-resume = "${base_bindir}/resume"
+FILES_${KLIBC_UTILS_PKGNAME}-run-init = "${base_bindir}/run-init"
+FILES_${KLIBC_UTILS_PKGNAME}-cat = "${base_bindir}/cat"
+FILES_${KLIBC_UTILS_PKGNAME}-chroot = "${base_bindir}/chroot"
+FILES_${KLIBC_UTILS_PKGNAME}-cpio = "${base_bindir}/cpio"
+FILES_${KLIBC_UTILS_PKGNAME}-dd = "${base_bindir}/dd"
+FILES_${KLIBC_UTILS_PKGNAME}-dmesg = "${base_bindir}/dmesg"
+FILES_${KLIBC_UTILS_PKGNAME}-false = "${base_bindir}/false"
+FILES_${KLIBC_UTILS_PKGNAME}-halt = "${base_bindir}/halt"
+FILES_${KLIBC_UTILS_PKGNAME}-kill = "${base_bindir}/kill"
+FILES_${KLIBC_UTILS_PKGNAME}-ln = "${base_bindir}/ln"
+FILES_${KLIBC_UTILS_PKGNAME}-minips = "${base_bindir}/minips"
+FILES_${KLIBC_UTILS_PKGNAME}-mkdir = "${base_bindir}/mkdir"
+FILES_${KLIBC_UTILS_PKGNAME}-mkfifo = "${base_bindir}/mkfifo"
+FILES_${KLIBC_UTILS_PKGNAME}-mknod = "${base_bindir}/mknod"
+FILES_${KLIBC_UTILS_PKGNAME}-mount = "${base_bindir}/mount"
+FILES_${KLIBC_UTILS_PKGNAME}-nuke = "${base_bindir}/nuke"
+FILES_${KLIBC_UTILS_PKGNAME}-pivot-root = "${base_bindir}/pivot_root"
+FILES_${KLIBC_UTILS_PKGNAME}-poweroff = "${base_bindir}/poweroff"
+FILES_${KLIBC_UTILS_PKGNAME}-readlink = "${base_bindir}/readlink"
+FILES_${KLIBC_UTILS_PKGNAME}-reboot = "${base_bindir}/reboot"
+FILES_${KLIBC_UTILS_PKGNAME}-sleep = "${base_bindir}/sleep"
+FILES_${KLIBC_UTILS_PKGNAME}-sync = "${base_bindir}/sync"
+FILES_${KLIBC_UTILS_PKGNAME}-true = "${base_bindir}/true"
+FILES_${KLIBC_UTILS_PKGNAME}-umount = "${base_bindir}/umount"
+FILES_${KLIBC_UTILS_PKGNAME}-uname = "${base_bindir}/uname"
+FILES_${KLIBC_UTILS_PKGNAME}-modprobe = "${base_sbindir}/modprobe"
+FILES_${KLIBC_UTILS_PKGNAME}-losetup = "${base_bindir}/losetup"
+FILES_${KLIBC_UTILS_PKGNAME}-wc = "${base_bindir}/wc"
+FILES_${KLIBC_UTILS_PKGNAME}-ls = "${base_bindir}/ls"
diff --git a/recipes/klibc/klibc.inc b/recipes/klibc/klibc.inc
new file mode 100644
index 0000000..9ae6c5b
--- /dev/null
+++ b/recipes/klibc/klibc.inc
@@ -0,0 +1,61 @@
+do_install() {
+        install -d ${D}${base_bindir}
+        install -m 755 usr/dash/sh.${KLIBC_UTILS_VARIANT} ${D}${base_bindir}/sh
+        install -m 755 usr/kinit/kinit.${KLIBC_UTILS_VARIANT} ${D}${base_bindir}/kinit
+
+        install -d ${D}${base_libdir}
+        install -m 755 usr/klibc/klibc-*.so ${D}${base_libdir}
+        cd ${D}${base_libdir}
+        ln -s klibc-*.so klibc.so
+        cd -
+}
+
+export INST=${STAGING_DIR_TARGET}
+do_stage() {
+        oe_runmake  install
+        cp '${STAGING_DIR_TARGET}/bin/klcc'  '${CROSS_DIR}/bin/${TARGET_PREFIX}klcc'
+}
+
+PACKAGES = "${PN} ${PN}-dev "
+FILES_${PN} = "${base_libdir}/klibc-*.so"
+FILES_${PN}-dev = "${base_libdir}/klibc.so"
+
+require klibc-utils.inc
+
+# Yes we want exactly the klibc that was compiled with the utils
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-sh = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-kinit = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-fstype = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-ipconfig = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-nfsmount = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-resume = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-run-init = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-cat = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-chroot = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-cpio = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-dd = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-dmesg = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-false = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-halt = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-insmod = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-kill = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-ln = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-minips = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-mkdir = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-mkfifo = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-mknod = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-mount = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-nuke = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-pivot-root = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-poweroff = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-readlink = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-reboot = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-sleep = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-sync = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-true = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-umount = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-uname = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-modprobe = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-losetup = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-wc = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-ls = "${PN} (=${PV}-${PR})"
diff --git a/recipes/klibc/klibc_1.5.15+1.5.16.bb b/recipes/klibc/klibc_1.5.15+1.5.16.bb
index ba3eb49..4b299f2 100644
--- a/recipes/klibc/klibc_1.5.15+1.5.16.bb
+++ b/recipes/klibc/klibc_1.5.15+1.5.16.bb
@@ -1,9 +1,3 @@
-require klibc_1.5.15+1.5.16.inc
-PR = "r1"
-
-KLIBC_FETCHDIR = "Testing"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI[md5sum] = "db2152a8a03bd81e21a5f451f537ae3d"
-SRC_URI[sha256sum] = "8b5334ef88b075f374b031695181b4302c3e5621bf2737a39fdf28262b0f80f4"
+require klibc.inc
+require klibc_${PV}.inc
+PR = "${INC_PR}.0"
diff --git a/recipes/klibc/klibc_1.5.15+1.5.16.inc b/recipes/klibc/klibc_1.5.15+1.5.16.inc
index 7685cf8..1a1ab5b 100644
--- a/recipes/klibc/klibc_1.5.15+1.5.16.inc
+++ b/recipes/klibc/klibc_1.5.15+1.5.16.inc
@@ -24,155 +24,15 @@ S = "${WORKDIR}/klibc-1.5.15"
 
 # end temporary overrides
 
-# we want only the shared programms and the lib so we chose them manually
-do_install() {
-        install -d ${D}${base_bindir}
-        install -m 755 usr/dash/sh.shared ${D}${base_bindir}/sh
-        install -m 755 usr/gzip/gzip ${D}${base_bindir}
-        install -m 755 usr/kinit/kinit.shared ${D}${base_bindir}/kinit
-        install -m 755 usr/kinit/fstype/shared/fstype ${D}${base_bindir}
-        install -m 755 usr/kinit/ipconfig/shared/ipconfig ${D}${base_bindir}
-        install -m 755 usr/kinit/nfsmount/shared/nfsmount ${D}${base_bindir}
-        install -m 755 usr/kinit/resume/shared/resume ${D}${base_bindir}
-        install -m 755 usr/kinit/run-init/shared/run-init ${D}${base_bindir}
-        install -m 755 usr/utils/shared/cat ${D}${base_bindir}
-        install -m 755 usr/utils/shared/chroot ${D}${base_bindir}
-        install -m 755 usr/utils/shared/cpio ${D}${base_bindir}
-        install -m 755 usr/utils/shared/dd ${D}${base_bindir}
-        install -m 755 usr/utils/shared/dmesg ${D}${base_bindir}
-        install -m 755 usr/utils/shared/false ${D}${base_bindir}
-        install -m 755 usr/utils/shared/halt ${D}${base_bindir}
-        install -m 755 usr/utils/shared/kill ${D}${base_bindir}
-        install -m 755 usr/utils/shared/ln ${D}${base_bindir}
-        install -m 755 usr/utils/shared/minips ${D}${base_bindir}
-        install -m 755 usr/utils/shared/mkdir ${D}${base_bindir}
-        install -m 755 usr/utils/shared/mkfifo ${D}${base_bindir}
-        install -m 755 usr/utils/shared/mknod ${D}${base_bindir}
-        install -m 755 usr/utils/shared/mount ${D}${base_bindir}
-        install -m 755 usr/utils/shared/nuke ${D}${base_bindir}
-        install -m 755 usr/utils/shared/pivot_root ${D}${base_bindir}
-        install -m 755 usr/utils/shared/poweroff ${D}${base_bindir}
-        install -m 755 usr/utils/shared/readlink ${D}${base_bindir}
-        install -m 755 usr/utils/shared/reboot ${D}${base_bindir}
-        install -m 755 usr/utils/shared/sleep ${D}${base_bindir}
-        install -m 755 usr/utils/shared/sync ${D}${base_bindir}
-        install -m 755 usr/utils/shared/true ${D}${base_bindir}
-        install -m 755 usr/utils/shared/umount ${D}${base_bindir}
-        install -m 755 usr/utils/shared/uname ${D}${base_bindir}
-        install -m 755 usr/utils/shared/modprobe ${D}${base_bindir}
-        install -m 755 usr/utils/shared/losetup ${D}${base_bindir}
-        install -m 755 usr/utils/shared/wc ${D}${base_bindir}
-        install -m 755 usr/utils/shared/ls ${D}${base_bindir}
+DEFAULT_PREFERENCE = "-1"
 
-        install -d ${D}${base_libdir}
-        install -m 755 usr/klibc/klibc-*.so ${D}${base_libdir}
-        cd ${D}${base_libdir}
-        ln -s klibc-*.so klibc.so
-        cd -
-        cd ${D}${base_bindir}
-        ln -s gzip gunzip
-        ln -s gzip zcat
-        cd -
-}
-
-export INST=${STAGING_DIR_TARGET}
-do_stage() {
-        oe_runmake  install
-        cp '${STAGING_DIR_TARGET}/bin/klcc'  '${CROSS_DIR}/bin/${TARGET_PREFIX}klcc'
-}
+KLIBC_FETCHDIR = "1.5"
 
-PACKAGES = "${PN} ${PN}-dev klibc-utils-sh klibc-utils-kinit \
-        klibc-utils-fstype klibc-utils-ipconfig \
-        klibc-utils-nfsmount klibc-utils-resume \
-        klibc-utils-run-init klibc-utils-cat \
-        klibc-utils-chroot klibc-utils-cpio \
-        klibc-utils-dd klibc-utils-dmesg \
-        klibc-utils-false klibc-utils-halt \
-        klibc-utils-kill klibc-utils-ln \
-        klibc-utils-minips klibc-utils-mkdir \
-        klibc-utils-mkfifo klibc-utils-mknod \
-        klibc-utils-mount klibc-utils-nuke \
-        klibc-utils-pivot-root klibc-utils-poweroff \
-        klibc-utils-readlink klibc-utils-reboot \
-        klibc-utils-sleep \
-        klibc-utils-sync klibc-utils-true \
-        klibc-utils-umount klibc-utils-uname \
-        klibc-utils-gzip klibc-utils-modprobe \
-        klibc-utils-losetup klibc-utils-wc \
-        klibc-utils-ls"
+SRC_URI[md5sum] = "db2152a8a03bd81e21a5f451f537ae3d"
+SRC_URI[sha256sum] = "8b5334ef88b075f374b031695181b4302c3e5621bf2737a39fdf28262b0f80f4"
 
-FILES_${PN} = "${base_libdir}/klibc-*.so"
-FILES_${PN}-dev = "${base_libdir}/klibc.so"
-FILES_klibc-utils-sh = "${base_bindir}/sh"
-FILES_klibc-utils-gzip = "${base_bindir}/gzip ${base_bindir}/gunzip ${base_bindir}/zcat"
-FILES_klibc-utils-kinit = "${base_bindir}/kinit"
-FILES_klibc-utils-fstype = "${base_bindir}/fstype"
-FILES_klibc-utils-ipconfig = "${base_bindir}/ipconfig"
-FILES_klibc-utils-nfsmount = "${base_bindir}/nfsmount"
-FILES_klibc-utils-resume = "${base_bindir}/resume"
-FILES_klibc-utils-run-init = "${base_bindir}/run-init"
-FILES_klibc-utils-cat = "${base_bindir}/cat"
-FILES_klibc-utils-chroot = "${base_bindir}/chroot"
-FILES_klibc-utils-cpio = "${base_bindir}/cpio"
-FILES_klibc-utils-dd = "${base_bindir}/dd"
-FILES_klibc-utils-dmesg = "${base_bindir}/dmesg"
-FILES_klibc-utils-false = "${base_bindir}/false"
-FILES_klibc-utils-halt = "${base_bindir}/halt"
-FILES_klibc-utils-kill = "${base_bindir}/kill"
-FILES_klibc-utils-ln = "${base_bindir}/ln"
-FILES_klibc-utils-minips = "${base_bindir}/minips"
-FILES_klibc-utils-mkdir = "${base_bindir}/mkdir"
-FILES_klibc-utils-mkfifo = "${base_bindir}/mkfifo"
-FILES_klibc-utils-mknod = "${base_bindir}/mknod"
-FILES_klibc-utils-mount = "${base_bindir}/mount"
-FILES_klibc-utils-nuke = "${base_bindir}/nuke"
-FILES_klibc-utils-pivot-root = "${base_bindir}/pivot_root"
-FILES_klibc-utils-poweroff = "${base_bindir}/poweroff"
-FILES_klibc-utils-readlink = "${base_bindir}/readlink"
-FILES_klibc-utils-reboot = "${base_bindir}/reboot"
-FILES_klibc-utils-sleep = "${base_bindir}/sleep"
-FILES_klibc-utils-sync = "${base_bindir}/sync"
-FILES_klibc-utils-true = "${base_bindir}/true"
-FILES_klibc-utils-umount = "${base_bindir}/umount"
-FILES_klibc-utils-uname = "${base_bindir}/uname"
-FILES_klibc-utils-modprobe = "${base_bindir}/modprobe"
-FILES_klibc-utils-losetup = "${base_bindir}/losetup"
-FILES_klibc-utils-wc = "${base_bindir}/wc"
-FILES_klibc-utils-ls = "${base_bindir}/ls"
-
-# Yes we want exactly the klibc that was compiled with the utils
-RDEPENDS_klibc-utils-sh = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-kinit = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-fstype = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-ipconfig = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-nfsmount = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-resume = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-run-init = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-cat = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-chroot = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-cpio = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-dd = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-dmesg = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-false = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-halt = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-kill = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-ln = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-minips = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-mkdir = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-mkfifo = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-mknod = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-mount = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-nuke = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-pivot-root = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-poweroff = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-readlink = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-reboot = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-sleep = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-sync = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-true = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-umount = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-uname = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-modprobe = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-losetup = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-wc = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-ls = "${PN} (=${PV}-${PR})"
+do_install_append() {
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/dmesg ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/sync ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ls ${D}${base_bindir}
+}
diff --git a/recipes/klibc/klibc_1.5.15.bb b/recipes/klibc/klibc_1.5.15.bb
index 1c81818..4b299f2 100644
--- a/recipes/klibc/klibc_1.5.15.bb
+++ b/recipes/klibc/klibc_1.5.15.bb
@@ -1,7 +1,3 @@
-require klibc_1.5.15.inc
-PR = "r6"
-
-KLIBC_FETCHDIR = "Testing"
-
-SRC_URI[md5sum] = "db2152a8a03bd81e21a5f451f537ae3d"
-SRC_URI[sha256sum] = "8b5334ef88b075f374b031695181b4302c3e5621bf2737a39fdf28262b0f80f4"
+require klibc.inc
+require klibc_${PV}.inc
+PR = "${INC_PR}.0"
diff --git a/recipes/klibc/klibc_1.5.15.inc b/recipes/klibc/klibc_1.5.15.inc
index fa4fae1..eb89e58 100644
--- a/recipes/klibc/klibc_1.5.15.inc
+++ b/recipes/klibc/klibc_1.5.15.inc
@@ -12,151 +12,12 @@ SRC_URI += "file://fstype-sane-vfat-and-jffs2-for-1.5.patch;patch=1 \
             file://isystem.patch;patch=1 \
             "
 
-# we want only the shared programms and the lib so we chose them manually
-do_install() {
-        install -d ${D}${base_bindir}
-        install -m 755 usr/dash/sh.shared ${D}${base_bindir}/sh
-        install -m 755 usr/gzip/gzip ${D}${base_bindir}
-        install -m 755 usr/kinit/kinit.shared ${D}${base_bindir}/kinit
-        install -m 755 usr/kinit/fstype/shared/fstype ${D}${base_bindir}
-        install -m 755 usr/kinit/ipconfig/shared/ipconfig ${D}${base_bindir}
-        install -m 755 usr/kinit/nfsmount/shared/nfsmount ${D}${base_bindir}
-        install -m 755 usr/kinit/resume/shared/resume ${D}${base_bindir}
-        install -m 755 usr/kinit/run-init/shared/run-init ${D}${base_bindir}
-        install -m 755 usr/utils/shared/cat ${D}${base_bindir}
-        install -m 755 usr/utils/shared/chroot ${D}${base_bindir}
-        install -m 755 usr/utils/shared/cpio ${D}${base_bindir}
-        install -m 755 usr/utils/shared/dd ${D}${base_bindir}
-        install -m 755 usr/utils/shared/dmesg ${D}${base_bindir}
-        install -m 755 usr/utils/shared/false ${D}${base_bindir}
-        install -m 755 usr/utils/shared/halt ${D}${base_bindir}
-        install -m 755 usr/utils/shared/kill ${D}${base_bindir}
-        install -m 755 usr/utils/shared/ln ${D}${base_bindir}
-        install -m 755 usr/utils/shared/minips ${D}${base_bindir}
-        install -m 755 usr/utils/shared/mkdir ${D}${base_bindir}
-        install -m 755 usr/utils/shared/mkfifo ${D}${base_bindir}
-        install -m 755 usr/utils/shared/mknod ${D}${base_bindir}
-        install -m 755 usr/utils/shared/mount ${D}${base_bindir}
-        install -m 755 usr/utils/shared/nuke ${D}${base_bindir}
-        install -m 755 usr/utils/shared/pivot_root ${D}${base_bindir}
-        install -m 755 usr/utils/shared/poweroff ${D}${base_bindir}
-        install -m 755 usr/utils/shared/readlink ${D}${base_bindir}
-        install -m 755 usr/utils/shared/reboot ${D}${base_bindir}
-        install -m 755 usr/utils/shared/sleep ${D}${base_bindir}
-        install -m 755 usr/utils/shared/sync ${D}${base_bindir}
-        install -m 755 usr/utils/shared/true ${D}${base_bindir}
-        install -m 755 usr/utils/shared/umount ${D}${base_bindir}
-        install -m 755 usr/utils/shared/uname ${D}${base_bindir}
-        install -m 755 usr/utils/shared/modprobe ${D}${base_bindir}
-        install -m 755 usr/utils/shared/losetup ${D}${base_bindir}
-        install -m 755 usr/utils/shared/wc ${D}${base_bindir}
+KLIBC_FETCHDIR = "1.5"
 
-        install -d ${D}${base_libdir}
-        install -m 755 usr/klibc/klibc-*.so ${D}${base_libdir}
-        cd ${D}${base_libdir}
-        ln -s klibc-*.so klibc.so
-        cd -
-        cd ${D}${base_bindir}
-        ln -s gzip gunzip
-        ln -s gzip zcat
-        cd -
-}
+SRC_URI[md5sum] = "db2152a8a03bd81e21a5f451f537ae3d"
+SRC_URI[sha256sum] = "8b5334ef88b075f374b031695181b4302c3e5621bf2737a39fdf28262b0f80f4"
 
-export INST=${STAGING_DIR_TARGET}
-do_stage() {
-        oe_runmake  install
-        cp '${STAGING_DIR_TARGET}/bin/klcc'  '${CROSS_DIR}/bin/${TARGET_PREFIX}klcc'
+do_install_append() {
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/dmesg ${D}${base_bindir}
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/sync ${D}${base_bindir}
 }
-
-PACKAGES = "${PN} ${PN}-dev klibc-utils-sh klibc-utils-kinit \
-        klibc-utils-fstype klibc-utils-ipconfig \
-        klibc-utils-nfsmount klibc-utils-resume \
-        klibc-utils-run-init klibc-utils-cat \
-        klibc-utils-chroot klibc-utils-cpio \
-        klibc-utils-dd klibc-utils-dmesg \
-        klibc-utils-false klibc-utils-halt \
-        klibc-utils-kill klibc-utils-ln \
-        klibc-utils-minips klibc-utils-mkdir \
-        klibc-utils-mkfifo klibc-utils-mknod \
-        klibc-utils-mount klibc-utils-nuke \
-        klibc-utils-pivot-root klibc-utils-poweroff \
-        klibc-utils-readlink klibc-utils-reboot \
-        klibc-utils-sleep \
-        klibc-utils-sync klibc-utils-true \
-        klibc-utils-umount klibc-utils-uname \
-        klibc-utils-gzip klibc-utils-modprobe \
-        klibc-utils-losetup klibc-utils-wc"
-
-FILES_${PN} = "${base_libdir}/klibc-*.so"
-FILES_${PN}-dev = "${base_libdir}/klibc.so"
-FILES_klibc-utils-sh = "${base_bindir}/sh"
-FILES_klibc-utils-gzip = "${base_bindir}/gzip ${base_bindir}/gunzip ${base_bindir}/zcat"
-FILES_klibc-utils-kinit = "${base_bindir}/kinit"
-FILES_klibc-utils-fstype = "${base_bindir}/fstype"
-FILES_klibc-utils-ipconfig = "${base_bindir}/ipconfig"
-FILES_klibc-utils-nfsmount = "${base_bindir}/nfsmount"
-FILES_klibc-utils-resume = "${base_bindir}/resume"
-FILES_klibc-utils-run-init = "${base_bindir}/run-init"
-FILES_klibc-utils-cat = "${base_bindir}/cat"
-FILES_klibc-utils-chroot = "${base_bindir}/chroot"
-FILES_klibc-utils-cpio = "${base_bindir}/cpio"
-FILES_klibc-utils-dd = "${base_bindir}/dd"
-FILES_klibc-utils-dmesg = "${base_bindir}/dmesg"
-FILES_klibc-utils-false = "${base_bindir}/false"
-FILES_klibc-utils-halt = "${base_bindir}/halt"
-FILES_klibc-utils-kill = "${base_bindir}/kill"
-FILES_klibc-utils-ln = "${base_bindir}/ln"
-FILES_klibc-utils-minips = "${base_bindir}/minips"
-FILES_klibc-utils-mkdir = "${base_bindir}/mkdir"
-FILES_klibc-utils-mkfifo = "${base_bindir}/mkfifo"
-FILES_klibc-utils-mknod = "${base_bindir}/mknod"
-FILES_klibc-utils-mount = "${base_bindir}/mount"
-FILES_klibc-utils-nuke = "${base_bindir}/nuke"
-FILES_klibc-utils-pivot-root = "${base_bindir}/pivot_root"
-FILES_klibc-utils-poweroff = "${base_bindir}/poweroff"
-FILES_klibc-utils-readlink = "${base_bindir}/readlink"
-FILES_klibc-utils-reboot = "${base_bindir}/reboot"
-FILES_klibc-utils-sleep = "${base_bindir}/sleep"
-FILES_klibc-utils-sync = "${base_bindir}/sync"
-FILES_klibc-utils-true = "${base_bindir}/true"
-FILES_klibc-utils-umount = "${base_bindir}/umount"
-FILES_klibc-utils-uname = "${base_bindir}/uname"
-FILES_klibc-utils-modprobe = "${base_bindir}/modprobe"
-FILES_klibc-utils-losetup = "${base_bindir}/losetup"
-FILES_klibc-utils-wc = "${base_bindir}/wc"
-
-# Yes we want exactly the klibc that was compiled with the utils
-RDEPENDS_klibc-utils-sh = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-kinit = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-fstype = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-ipconfig = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-nfsmount = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-resume = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-run-init = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-cat = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-chroot = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-cpio = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-dd = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-dmesg = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-false = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-halt = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-kill = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-ln = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-minips = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-mkdir = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-mkfifo = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-mknod = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-mount = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-nuke = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-pivot-root = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-poweroff = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-readlink = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-reboot = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-sleep = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-sync = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-true = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-umount = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-uname = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-modprobe = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-losetup = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-wc = "${PN} (=${PV}-${PR})"
diff --git a/recipes/klibc/klibc_1.5.bb b/recipes/klibc/klibc_1.5.bb
index 1655100..4b299f2 100644
--- a/recipes/klibc/klibc_1.5.bb
+++ b/recipes/klibc/klibc_1.5.bb
@@ -1,7 +1,3 @@
-require klibc_1.5.inc
-PR = "r10"
-
-KLIBC_FETCHDIR = "Stable"
-
-SRC_URI[md5sum] = "481dfdef7273f2cc776c2637f481f017"
-SRC_URI[sha256sum] = "27000ba4bc73a5977502b27d7036df24dd6ab94a1c33b8f5d6d54ba62772f0c7"
+require klibc.inc
+require klibc_${PV}.inc
+PR = "${INC_PR}.0"
diff --git a/recipes/klibc/klibc_1.5.inc b/recipes/klibc/klibc_1.5.inc
index 5c10df7..7847009 100644
--- a/recipes/klibc/klibc_1.5.inc
+++ b/recipes/klibc/klibc_1.5.inc
@@ -9,147 +9,11 @@ SRC_URI += "file://fstype-sane-vfat-and-jffs2-for-1.5.patch;patch=1 \
             file://klibc_kexecsyscall.patch;patch=1 \
             "
 
-# we want only the shared programms and the lib so we chose them manually
-do_install() {
-        install -d ${D}${base_bindir}
-        install -m 755 usr/dash/sh.shared ${D}${base_bindir}/sh
-        install -m 755 usr/gzip/gzip ${D}${base_bindir}
-        install -m 755 usr/kinit/kinit.shared ${D}${base_bindir}/kinit
-        install -m 755 usr/kinit/fstype/shared/fstype ${D}${base_bindir}
-        install -m 755 usr/kinit/ipconfig/shared/ipconfig ${D}${base_bindir}
-        install -m 755 usr/kinit/nfsmount/shared/nfsmount ${D}${base_bindir}
-        install -m 755 usr/kinit/resume/shared/resume ${D}${base_bindir}
-        install -m 755 usr/kinit/run-init/shared/run-init ${D}${base_bindir}
-        install -m 755 usr/utils/shared/cat ${D}${base_bindir}
-        install -m 755 usr/utils/shared/chroot ${D}${base_bindir}
-        install -m 755 usr/utils/shared/cpio ${D}${base_bindir}
-        install -m 755 usr/utils/shared/dd ${D}${base_bindir}
-        install -m 755 usr/utils/shared/false ${D}${base_bindir}
-        install -m 755 usr/utils/shared/halt ${D}${base_bindir}
-        install -m 755 usr/utils/shared/insmod ${D}${base_bindir}
-        install -m 755 usr/utils/shared/kill ${D}${base_bindir}
-        install -m 755 usr/utils/shared/ln ${D}${base_bindir}
-        install -m 755 usr/utils/shared/minips ${D}${base_bindir}
-        install -m 755 usr/utils/shared/mkdir ${D}${base_bindir}
-        install -m 755 usr/utils/shared/mkfifo ${D}${base_bindir}
-        install -m 755 usr/utils/shared/mknod ${D}${base_bindir}
-        install -m 755 usr/utils/shared/mount ${D}${base_bindir}
-        install -m 755 usr/utils/shared/nuke ${D}${base_bindir}
-        install -m 755 usr/utils/shared/pivot_root ${D}${base_bindir}
-        install -m 755 usr/utils/shared/poweroff ${D}${base_bindir}
-        install -m 755 usr/utils/shared/readlink ${D}${base_bindir}
-        install -m 755 usr/utils/shared/reboot ${D}${base_bindir}
-        install -m 755 usr/utils/shared/sleep ${D}${base_bindir}
-        install -m 755 usr/utils/shared/true ${D}${base_bindir}
-        install -m 755 usr/utils/shared/umount ${D}${base_bindir}
-        install -m 755 usr/utils/shared/uname ${D}${base_bindir}
-        install -m 755 usr/utils/shared/modprobe ${D}${base_bindir}
-        install -m 755 usr/utils/shared/losetup ${D}${base_bindir}
-        install -m 755 usr/utils/shared/wc ${D}${base_bindir}
+KLIBC_FETCHDIR = "1.5"
 
-        install -d ${D}${base_libdir}
-        install -m 755 usr/klibc/klibc-*.so ${D}${base_libdir}
-        cd ${D}${base_libdir}
-        ln -s klibc-*.so klibc.so
-        cd -
-        cd ${D}${base_bindir}
-        ln -s gzip gunzip
-        ln -s gzip zcat
-        cd -
-}
+SRC_URI[md5sum] = "481dfdef7273f2cc776c2637f481f017"
+SRC_URI[sha256sum] = "27000ba4bc73a5977502b27d7036df24dd6ab94a1c33b8f5d6d54ba62772f0c7"
 
-export INST=${STAGING_DIR_TARGET}
-do_stage() {
-        oe_runmake  install
-        cp '${STAGING_DIR_TARGET}/bin/klcc'  '${CROSS_DIR}/bin/${TARGET_PREFIX}klcc'
+do_install_append() {
+        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/insmod ${D}${base_bindir}
 }
-
-PACKAGES = "${PN} ${PN}-dev klibc-utils-sh klibc-utils-kinit \
-        klibc-utils-fstype klibc-utils-ipconfig \
-        klibc-utils-nfsmount klibc-utils-resume \
-        klibc-utils-run-init klibc-utils-cat \
-        klibc-utils-chroot klibc-utils-cpio \
-        klibc-utils-dd klibc-utils-false \
-        klibc-utils-halt klibc-utils-insmod \
-        klibc-utils-kill klibc-utils-ln \
-        klibc-utils-minips klibc-utils-mkdir \
-        klibc-utils-mkfifo klibc-utils-mknod \
-        klibc-utils-mount klibc-utils-nuke \
-        klibc-utils-pivot-root klibc-utils-poweroff \
-        klibc-utils-readlink klibc-utils-reboot \
-        klibc-utils-sleep klibc-utils-true \
-        klibc-utils-umount klibc-utils-uname \
-        klibc-utils-gzip klibc-utils-modprobe \
-        klibc-utils-losetup klibc-utils-wc"
-
-FILES_${PN} = "${base_libdir}/klibc-*.so"
-FILES_${PN}-dev = "${base_libdir}/klibc.so"
-FILES_klibc-utils-sh = "${base_bindir}/sh"
-FILES_klibc-utils-gzip = "${base_bindir}/gzip ${base_bindir}/gunzip ${base_bindir}/zcat"
-FILES_klibc-utils-kinit = "${base_bindir}/kinit"
-FILES_klibc-utils-fstype = "${base_bindir}/fstype"
-FILES_klibc-utils-ipconfig = "${base_bindir}/ipconfig"
-FILES_klibc-utils-nfsmount = "${base_bindir}/nfsmount"
-FILES_klibc-utils-resume = "${base_bindir}/resume"
-FILES_klibc-utils-run-init = "${base_bindir}/run-init"
-FILES_klibc-utils-cat = "${base_bindir}/cat"
-FILES_klibc-utils-chroot = "${base_bindir}/chroot"
-FILES_klibc-utils-cpio = "${base_bindir}/cpio"
-FILES_klibc-utils-dd = "${base_bindir}/dd"
-FILES_klibc-utils-false = "${base_bindir}/false"
-FILES_klibc-utils-halt = "${base_bindir}/halt"
-FILES_klibc-utils-insmod = "${base_bindir}/insmod"
-FILES_klibc-utils-kill = "${base_bindir}/kill"
-FILES_klibc-utils-ln = "${base_bindir}/ln"
-FILES_klibc-utils-minips = "${base_bindir}/minips"
-FILES_klibc-utils-mkdir = "${base_bindir}/mkdir"
-FILES_klibc-utils-mkfifo = "${base_bindir}/mkfifo"
-FILES_klibc-utils-mknod = "${base_bindir}/mknod"
-FILES_klibc-utils-mount = "${base_bindir}/mount"
-FILES_klibc-utils-nuke = "${base_bindir}/nuke"
-FILES_klibc-utils-pivot-root = "${base_bindir}/pivot_root"
-FILES_klibc-utils-poweroff = "${base_bindir}/poweroff"
-FILES_klibc-utils-readlink = "${base_bindir}/readlink"
-FILES_klibc-utils-reboot = "${base_bindir}/reboot"
-FILES_klibc-utils-sleep = "${base_bindir}/sleep"
-FILES_klibc-utils-true = "${base_bindir}/true"
-FILES_klibc-utils-umount = "${base_bindir}/umount"
-FILES_klibc-utils-uname = "${base_bindir}/uname"
-FILES_klibc-utils-modprobe = "${base_bindir}/modprobe"
-FILES_klibc-utils-losetup = "${base_bindir}/losetup"
-FILES_klibc-utils-wc = "${base_bindir}/wc"
-
-# Yes we want exactly the klibc that was compiled with the utils
-RDEPENDS_klibc-utils-sh = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-kinit = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-fstype = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-ipconfig = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-nfsmount = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-resume = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-run-init = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-cat = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-chroot = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-cpio = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-dd = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-false = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-halt = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-insmod = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-kill = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-ln = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-minips = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-mkdir = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-mkfifo = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-mknod = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-mount = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-nuke = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-pivot-root = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-poweroff = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-readlink = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-reboot = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-sleep = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-true = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-umount = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-uname = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-modprobe = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-losetup = "${PN} (=${PV}-${PR})"
-RDEPENDS_klibc-utils-wc = "${PN} (=${PV}-${PR})"
-- 
1.7.0.4



