Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NYfB4-00080d-VN
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 13:33:26 +0100
Received: by gxk7 with SMTP id 7so2477232gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 04:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=bh1mssp+hHBdb4cms4sA0gqN8ViCmY4RjVQVl3MyQKY=;
	b=LmK0dzV7JkN3ACaQLpfIdi4LV72c1lO1DrOeeZR3+B9ECYRLKJL5ysp2N5d4jTRe/l
	hWNxJZZWfffZiWjfsccNAw6pDgRfrP4IP2J8W2Zv1lxNTYZGOE+xxR20Ch/cr2JF4R8e
	WJQ1FlWsp/rrptEZRAFFQmF2JXgNogrF1adf8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=e/1TvlNjzjVw7VYYbd0iBI15m5URMbQWJSB5aiVi58cIdWjjJ8FXwkged+g+c/YdWf
	T2bFU1tUgmgTZIltVrCwU3b+e4M5bKgAreDykAzvv/7d/8DDep15A2hdALSL98nWpPOU
	6JYjRsgikgdfCDxfEcKlJyrXru/FrgHxVxlQs=
MIME-Version: 1.0
Received: by 10.101.105.30 with SMTP id h30mr5299601anm.225.1264249863927; 
	Sat, 23 Jan 2010 04:31:03 -0800 (PST)
Date: Sat, 23 Jan 2010 13:31:03 +0100
Message-ID: <ac9c93b11001230431s6a9dc637y370ad9999d82c83@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: packaged staging fails in do_deploy for kernel
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
X-List-Received-Date: Sat, 23 Jan 2010 12:33:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

I decided to give packaged staging a try.
(more or less) following the instructions on
http://marcin.juszkiewicz.com.pl/2008/07/01/packaged-staging-and-what-it-gives/

distribution angstrom (dev head)
machine: beagleboard.

I set the DEPLOY_DIR_PSTAGE to outside tmp. (packaged-staging is
already inherited by default in Angstrom).

rm tmp; bitbake console-image
great, few hours later everything is rebuild. now the final proof.
mv tmp tmp.bak; bitbake console-image

And lo-and-behold things are fetched from pstage.
Until suddenly after 20 minutes:

NOTE: Running task 2352 of 2433 (ID: 538,
/home/frans/oe/openembedded/recipes/linux/linux-omap_2.6.29.bb,
do_deploy)
ERROR: function do_deploy failed

Bummer.

Log file for deploy has just a single line: install: cannot stat
`arch/arm/boot/uImage': No such file or directory
There is also a log.staging_helper.11952 but that one is empty.
and there is a dir git adjacent to temp in the work dir which is also empty.


The uImage file exists in staging:
staging/beagleboard-angstrom-linux-gnueabi/kernel/arch/arm/boot/uImage
staging/beagleboard-angstrom-linux-gnueabi/kernel/arch/arm/boot/.uImage.cmd
staging/beagleboard-angstrom-linux-gnueabi/kernel/uImage

and do_deploy says:
do_deploy() {
        install -d /home/frans/oe/tmp_angstrom/deploy/glibc/images/beagleboard
        install -m 0644 arch/arm/boot/uImage
/home/frans/oe/tmp_angstrom/deploy/glibc/images/beagleboard/uImage-2.6.29-r51-beagleboard.bin
        package_stagefile_shell
/home/frans/oe/tmp_angstrom/deploy/glibc/images/beagleboard/uImage-2.6.29-r51-beagleboard.bin

        if [ -d
"/home/frans/oe/tmp_angstrom/work/beagleboard-angstrom-linux-gnueabi/linux-omap-2.6.29-r51/package/lib"
]; then
                fakeroot tar -cvzf
/home/frans/oe/tmp_angstrom/deploy/glibc/images/beagleboard/modules-2.6.29-r51-beagleboard.tgz
-C /home/frans/oe/tmp_angstrom/work/beagleboard-angstrom-linux-gnueabi/linux-omap-2.6.29-r51/package
lib
        fi

        cd /home/frans/oe/tmp_angstrom/deploy/glibc/images/beagleboard
        rm -f uImage-beagleboard.bin
        ln -sf uImage-2.6.29-r51-beagleboard.bin uImage-beagleboard.bin
        package_stagefile_shell
/home/frans/oe/tmp_angstrom/deploy/glibc/images/beagleboard/uImage-beagleboard.bin

}


which of course fails on the install -m as  $arch/arm/boot/uImage does
not exist in work

the code is from kernel.bbclass.

do_deploy() {
        install -d ${DEPLOY_DIR_IMAGE}
        install -m 0644 ${KERNEL_OUTPUT}
${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
        package_stagefile_shell
${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin

        if [ -d "${PKGD}/lib" ]; then
                fakeroot tar -cvzf
${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.tgz -C ${PKGD} lib
        fi

        cd ${DEPLOY_DIR_IMAGE}
        rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
        ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
        package_stagefile_shell
${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_SYMLINK_NAME}.bin
}

Not really an idea how to fix this. Any expert with an opinion?

next steps:
after that I did a bitbake -cclean virtual/kernel and got several
messages of the type:
 * Package staging-strace-armv7a-angstrom-linux-gnueabi version
4.5.14-r9 has no architecture specified, defaulting to i686-linux.
which also seem odd to me.

after cleaning the kernel I tried to rebuild console-image. The kernel
compiles but the system fails when building the rootfs:

From work/beagleboard-angstrom-linux-gnueabi/console-image-1.0-r0/temp/log.do_rootfs.28400
 * Cannot find package task-base.
 * Cannot find package psplash-angstrom.
 * Cannot find package psplash-zap.
 * Cannot find package task-base-extended.
 * Cannot find package initscripts.
 * Cannot find package udev.
 * Cannot find package sysvinit.
 * Cannot find package sysvinit-pidof.
 * Cannot find package tinylogin.
 * Cannot find package opkg-nogpg-nocurl.
 * Cannot find package angstrom-feed-configs.
 * Cannot find package opkg-collateral.

task-base did run staging-helper. I did not dig into the others

Did a bitbake -cclean for the packages listed above, but got new failures.
See below.

That is where I gave up. Suggestions are welcome!

Frans

PS: logs are also sent to tinderbox (as eFfeM)

log_check: Using
/home/frans/oe/tmp_angstrom/work/beagleboard-angstrom-linux-gnueabi/console-image-1.0-r0/temp/log.do_rootfs.32140
as logfile
log_check: There were error messages in the logfile
log_check: Matched keyword: [Cannot find package]
         *  task-boot *  libgcc1 (>= 4.3.3) *  libc6 (>= 2.9) *
util-linux-ng-mount *  util-linux-ng-umount *
angstrom-libc-fixup-hack *  dropbear *  sysfsutils *
module-init-tools *  apm *  apmd *  alsa-utils-alsactl *
alsa-utils-alsamixer *  update-modules *  update-modules *
update-modules *  update-modules *  update-modules *  usbutils *
update-modules *  portmap *  update-modules *  update-modules *  ppp *
 ppp-dialin *  update-modules *  update-modules *  update-modules *
update-modules *  update-modules *
 * Cannot find package task-base.
 * ERROR: Cannot satisfy the following dependencies for psplash-angstrom:
         *  makedevs *  libc6 (>= 2.9) *  update-rc.d *  libc6 (>= 2.9) *
 * Cannot find package psplash-angstrom.
 * ERROR: Cannot satisfy the following dependencies for psplash-zap:
         *  update-rc.d *
 * Cannot find package psplash-zap.
 * ERROR: Cannot satisfy the following dependencies for task-base-extended:
         *  wireless-tools *  wpa-supplicant *  blueprobe *  bluez4 *
 * Cannot find package task-base-extended.
 * ERROR: Cannot satisfy the following dependencies for udev:
         *  libc6 (>= 2.9) *  update-rc.d *  libc6 (>= 2.9) *  libc6 (>= 2.9) *
 * Cannot find package udev.
 * ERROR: Cannot satisfy the following dependencies for sysvinit:
         *  libc6 (>= 2.9) *  libc6 (>= 2.9) *
 * Cannot find package sysvinit.
 * ERROR: Cannot satisfy the following dependencies for tinylogin:
         *  libc6 (>= 2.9) *
 * Cannot find package tinylogin.
+ export D=/home/frans/oe/tmp_angstrom/rootfs/console-image

log_check: There were error messages in the logfile
log_check: Matched keyword: [Cannot satisfy the following dependencies]
Collected errors:
 * ERROR: Cannot satisfy the following dependencies for task-base:
         *  task-boot *  libgcc1 (>= 4.3.3) *  libc6 (>= 2.9) *
util-linux-ng-mount *  util-linux-ng-umount *
angstrom-libc-fixup-hack *  dropbear *  sysfsutils *
module-init-tools *  apm *  apmd *  alsa-utils-alsactl *
alsa-utils-alsamixer *  update-modules *  update-modules *
update-modules *  update-modules *  update-modules *  usbutils *
update-modules *  portmap *  update-modules *  update-modules *  ppp *
 ppp-dialin *  update-modules *  update-modules *  update-modules *
update-modules *  update-modules *
 * Cannot find package task-base.
 * ERROR: Cannot satisfy the following dependencies for psplash-angstrom:
         *  makedevs *  libc6 (>= 2.9) *  update-rc.d *  libc6 (>= 2.9) *
 * Cannot find package psplash-angstrom.
 * ERROR: Cannot satisfy the following dependencies for psplash-zap:
         *  update-rc.d *
 * Cannot find package psplash-zap.
 * ERROR: Cannot satisfy the following dependencies for task-base-extended:
         *  wireless-tools *  wpa-supplicant *  blueprobe *  bluez4 *
 * Cannot find package task-base-extended.
 * ERROR: Cannot satisfy the following dependencies for udev:
         *  libc6 (>= 2.9) *  update-rc.d *  libc6 (>= 2.9) *  libc6 (>= 2.9) *
 * Cannot find package udev.
 * ERROR: Cannot satisfy the following dependencies for sysvinit:
         *  libc6 (>= 2.9) *  libc6 (>= 2.9) *
 * Cannot find package sysvinit.
 * ERROR: Cannot satisfy the following dependencies for tinylogin:
         *  libc6 (>= 2.9) *


