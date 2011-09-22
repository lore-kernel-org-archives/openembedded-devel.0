Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6qzD-00031I-BO
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 23:39:15 +0200
Received: (qmail invoked by alias); 22 Sep 2011 21:33:55 -0000
Received: from p5B0A1554.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.21.84]
	by mail.gmx.net (mp066) with SMTP; 22 Sep 2011 23:33:55 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19VaSADvmJVWVOP1NODBOR7R5+qiKElpUDUWdI6kk
	vS9F6zrjVVEybD
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Sep 2011 23:37:30 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-96.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201109222337.30836.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: do_rootfs fails with network-manager-applet included
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
X-List-Received-Date: Thu, 22 Sep 2011 21:39:15 -0000
X-Groupsio-MsgNum: 34455
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_aq6eO9FSo3grcGk"

--Boundary-00=_aq6eO9FSo3grcGk
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

For my xfce-image ( lives in meta-angstrom/recipes-angstrom/images )  I want to make use of network-manager-applet which came in meta oe few days ago. 

It seems that as soon as I add network-manager-applet do_rootfs fails with something like:


| Setting flags for package xfwm4 to unpacked.
| + false
| + install -d /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce-base-image-1.0-r0/rootfs//etc
| + echo Angstrom v2011.09-core
| + rm -f /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce-base-image-1.0-r0/rootfs/var/lib/opkg/lists/oe /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce-base-image-1.0-r0/rootfs/var/lib/opkg/lists/oe-all /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce-base-image-1.0-r0/rootfs/var/lib/opkg/lists/oe-armv7a /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce-base-image-1.0-r0/rootfs/var/lib/opkg/lists/oe-overo
| + true
| + '[' 1 -eq 0 ']'
| + set +x
| log_check: Using /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce-base-image-1.0-r0/temp/log.do_rootfs.28313 as logfile
| log_check: There were error messages in the logfile
| log_check: Matched keyword: [Collected errors]
| 
| Configuring openssh-sftp.
| Configuring xf86-input-evdev.
| Configuring cpufrequtils.
| Configuring systemd-compat-units.
| Configuring gvfsd-ftp.
| Collected errors:
|  * extract_archive: Cannot create symlink from ./var/run to 'volatile/run': File exists.
| + '[' '!' -z '' ']'
| + package_tryout_install_multilib_ipk
| + multilib_tryout_dirs=
| + '[' '!' -z /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce-base-image-1.0-r0/multilib_check.py ']'
| 
| ERROR: Function 'do_rootfs' failed (see /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce-base-image-1.0-r0/temp/log.do_rootfs.28313 for further information)
NOTE: package xfce-base-image-1.0-r0: task do_rootfs: Failed
ERROR: Task 8 (/home/Superandy/data/oe-core/sources/meta-angstrom/recipes-angstrom/images/xfce-base-image.bb, do_rootfs) failed with exit code '1'
ERROR: '/home/Superandy/data/oe-core/sources/meta-angstrom/recipes-angstrom/images/xfce-base-image.bb' failed


Is there somebody with a hint on where to check for further information to fix this error?

I add the two recipes I made tests with:

1. xfce-base-image-ok-noconman.bb This removes conman stuff ( conman conflicts with network-manager ) and builds without issues
2. xfce-base-image-err-network-manager-applet.bb: This recipe including network-manager instead of conman causes error above

Thanks in advance

Andreas

--Boundary-00=_aq6eO9FSo3grcGk
Content-Type: text/plain;
  charset="UTF-8";
  name="xfce-base-image-ok-noconman.bb"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="xfce-base-image-ok-noconman.bb"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
PR = "r0"

require systemd-image.bb

# conman conflicts with networkmanager
CONMANPKGS = ""

export IMAGE_BASENAME = "xfce-base-image"

XSERVER ?= " \
    xserver-xorg \
    xf86-input-evdev \
    xf86-input-mouse \
    xf86-video-fbdev \
    xf86-input-keyboard \
"

IMAGE_INSTALL += " \
    ${XSERVER} \
    task-base-extended \
    task-xfce-base \
    xfce4-appfinder \ 
    \
    gvfs \
    gvfsd-ftp gvfsd-sftp gvfsd-trash \
    udev-extra-rules \
    \
    kernel-module-fuse \
    marvell-sdio-fw \
    \
    xserver-common \
    ttf-dejavu-sans ttf-dejavu-sans-mono ttf-dejavu-common \
    gnome-icon-theme \
    \
    xfce4-screenshooter \
    \
    gtk-xfce-engine \
"

#    orage
#    network-manager-applet
#    midori
#    udisks
#    xserver-nodm-init


inherit image

--Boundary-00=_aq6eO9FSo3grcGk
Content-Type: text/plain;
  charset="UTF-8";
  name="xfce-base-image-err-network-manager-applet.bb"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="xfce-base-image-err-network-manager-applet.bb"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
PR = "r0"

require systemd-image.bb

# conman conflicts with networkmanager
CONMANPKGS = "network-manager-applet"

export IMAGE_BASENAME = "xfce-base-image"

XSERVER ?= " \
    xserver-xorg \
    xf86-input-evdev \
    xf86-input-mouse \
    xf86-video-fbdev \
    xf86-input-keyboard \
"

IMAGE_INSTALL += " \
    ${XSERVER} \
    task-base-extended \
    task-xfce-base \
    xfce4-appfinder \ 
    \
    gvfs \
    gvfsd-ftp gvfsd-sftp gvfsd-trash \
    udev-extra-rules \
    \
    kernel-module-fuse \
    marvell-sdio-fw \
    \
    xserver-common \
    ttf-dejavu-sans ttf-dejavu-sans-mono ttf-dejavu-common \
    gnome-icon-theme \
    \
    xfce4-screenshooter \
    \
    gtk-xfce-engine \
"

#    orage
#    network-manager-applet
#    midori
#    udisks
#    xserver-nodm-init


inherit image

--Boundary-00=_aq6eO9FSo3grcGk--
