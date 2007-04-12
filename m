Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1Hc48a-0007Di-Fe
	for openembedded-devel@openembedded.org; Thu, 12 Apr 2007 20:35:16 +0200
Received: (qmail 21013 invoked by uid 813007); 12 Apr 2007 18:35:13 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.local)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 12 Apr 2007 18:35:12 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Apr 2007 20:35:00 +0200
User-Agent: KMail/1.9.6
References: <200703042228.03665.openembedded@hrw.one.pl>
In-Reply-To: <200703042228.03665.openembedded@hrw.one.pl>
MIME-Version: 1.0
Message-Id: <200704122035.03980.openembedded@hrw.one.pl>
Cc: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>,
	Koen Kooi <koen@linuxtogo.org>
Subject: Re: RFC: Task-base rewrite
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
X-List-Received-Date: Thu, 12 Apr 2007 18:35:17 -0000
X-Groupsio-MsgNum: 1840
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_XvnHGpFyXM4zwtE"

--Boundary-00=_XvnHGpFyXM4zwtE
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 4 marca 2007, Marcin Juszkiewicz napisa=B3:
> During last two months I was working on new version of task-base. It
> was done from time to time without too much testing as I had many other
> things on my todo list.
>
> The main problem of task-base is that it give one package as result so
> if you want to create smaller rootfs for only few features you need to
> create own-task-base and base image on it.
>
> My version create several task-base-*, task-distro-* packages which
> cover several features one by one. Some features contain extra stuff
> only if other features are available (for example Bluetooth on USB bus
> only if distro supports BT and device support USB Host).

New version attached is based on task-base r23.=20

Packages.small is result of build for progear/angstrom combination (with=20
some changes to both configs - added some features).

What this version gives:

=2D each feature gets own package,
=2D task-boot contain ONLY stuff needed to boot
=2D task-distro-base contain distro addons
=2D task-machine-base contain machine specific addons
=2D task-base depend on all needed task-* packages
=2D ability to choose SSH daemon (dropbear, openssh, none) by distro
=2D ability to choose /dev/ manager (udev, devfsd, mdev) by distro
=2D ability to choose getty provider (tinylogin by default) by distro

With this version it is easier to create smaller rootfs - for example=20
image with ONLY bluetooth support is "task-boot + task-base-bluetooth".

Do some tests, post opinions - I think that this will be nice improvement=20
of task-base.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

    I used to think the brain is the most wonderfull organ in my body,=20
    till I realised what was telling me that

--Boundary-00=_XvnHGpFyXM4zwtE
Content-Type: text/plain;
  charset="iso-8859-15";
  name="task-base.bb"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="task-base.bb"

DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
PR = "r24"

PACKAGES = 'task-boot \
            task-base \
	    task-distro-base \
	    task-machine-base \
            ${@base_contains("MACHINE_FEATURES","acpi","task-base-acpi","", d)} \
            ${@base_contains("MACHINE_FEATURES","alsa","task-base-alsa","", d)} \
            ${@base_contains("MACHINE_FEATURES","apm","task-base-apm","", d)} \
            ${@base_contains("MACHINE_FEATURES","bluetooth","task-base-bluetooth","", d)} \
            ${@base_contains("MACHINE_FEATURES","ext2","task-base-ext2","", d)} \
            ${@base_contains("MACHINE_FEATURES","irda","task-base-irda","", d)} \
            ${@base_contains("MACHINE_FEATURES","keyboard","task-base-keyboard","", d)} \
            ${@base_contains("MACHINE_FEATURES","nfs","task-base-nfs","", d)} \
            ${@base_contains("MACHINE_FEATURES","pci","task-base-pci","", d)} \
            ${@base_contains("MACHINE_FEATURES","pcmcia","task-base-pcmcia","", d)} \
            ${@base_contains("MACHINE_FEATURES","phone","task-base-phone","", d)} \
            ${@base_contains("MACHINE_FEATURES","screen","task-base-screen","", d)} \
            ${@base_contains("MACHINE_FEATURES","smbfs","task-base-smbfs","", d)} \
            ${@base_contains("MACHINE_FEATURES","touchscreen","task-base-touchscreen","", d)} \
            ${@base_contains("MACHINE_FEATURES","usbgadget","task-base-usbgadget","", d)} \
            ${@base_contains("MACHINE_FEATURES","usbhost","task-base-usbhost","", d)} \
            ${@base_contains("MACHINE_FEATURES","wifi","task-base-wifi","", d)} \
            ${@base_contains("MACHINE_FEATURES","kernel26","task-base-kernel26","task-base-kernel24",d)} \
            \
            ${@base_contains("DISTRO_FEATURES","cramfs","task-base-cramfs","", d)} \
            ${@base_contains("DISTRO_FEATURES","ipsec","task-base-ipsec","", d)} \
            ${@base_contains("DISTRO_FEATURES","ipv6","task-base-ipv6","", d)} \
            ${@base_contains("DISTRO_FEATURES","nfs","task-base-nfs","", d)} \
            ${@base_contains("DISTRO_FEATURES","ppp","task-base-ppp","", d)} \
            ${@base_contains("DISTRO_FEATURES","smbfs","task-base-smbfs","", d)} \
            ${@base_contains("DISTRO_FEATURES","wifi","task-base-wifi","", d)} \
	    '

ALLOW_EMPTY = "1"

PACKAGE_ARCH = "${MACHINE_ARCH}"

#
# udev, devfsd, mdev (from busybox) or none
#
DISTRO_DEV_MANAGER ?= "${@base_contains("MACHINE_FEATURES", "kernel26",  "udev","",d)} "

#
# sysvinit, upstart
#
DISTRO_INIT_MANAGER ?= "sysvinit"

#
# tinylogin, getty
#
DISTRO_LOGIN_MANAGER ?= "tinylogin"

#
# linux-hotplug or none
#
HOTPLUG ?= "${@base_contains("MACHINE_FEATURES", "kernel24",  "linux-hotplug","",d)} "

#
# dropbear, openssh or none
#
DISTRO_SSH_DAEMON ?= "dropbear"

#
# pcmciautils for >= 2.6.13-rc1, pcmcia-cs for others
#
PCMCIA_MANAGER ?= "${@base_contains('MACHINE_FEATURES', 'kernel26','pcmciautils','pcmcia-cs',d)} "

MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""

#
# task-base
#
RDEPENDS_task-base = "\
    task-boot \
    task-distro-base \
    task-machine-base \
    ${DISTRO_SSH_DAEMON} \
    ${HOTPLUG} \
    \
    ${@base_contains('MACHINE_FEATURES', 'kernel26','task-base-kernel26','task-base-kernel24',d)} \
    ${@base_contains('MACHINE_FEATURES', 'apm', 'task-base-apm', '',d)} \
    ${@base_contains('MACHINE_FEATURES', 'acpi', 'task-base-acpi', '',d)} \
    ${@base_contains('MACHINE_FEATURES', 'keyboard', 'task-base-keyboard', '',d)} \
    \
    ${@base_contains('COMBINED_FEATURES', 'alsa', 'task-base-alsa', '',d)} \
    ${@base_contains('COMBINED_FEATURES', 'ext2', 'task-base-ext2', '',d)} \
    ${@base_contains('COMBINED_FEATURES', 'irda', 'task-base-irda', '',d)} \
    ${@base_contains('COMBINED_FEATURES', 'pci', 'task-base-pci', '',d)} \
    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'task-base-pcmcia', '',d)} \
    ${@base_contains('COMBINED_FEATURES', 'usbhost', 'task-base-usbhost', '',d)} \
    ${@base_contains('COMBINED_FEATURES', 'bluetooth', 'task-base-bluetooth', '',d)} \
    ${@base_contains('COMBINED_FEATURES', 'wifi', 'task-base-wifi', '',d)} \
    ${@base_contains('COMBINED_FEATURES', 'uboot', 'task-base-uboot', '',d)} \
    ${@base_contains('COMBINED_FEATURES', 'redboot', 'task-base-redboot', '',d)} \
    \
    ${@base_contains('DISTRO_FEATURES', 'nfs', 'task-base-nfs', '',d)} \
    ${@base_contains('DISTRO_FEATURES', 'ipsec', 'task-base-ipsec', '',d)} \
    ${@base_contains('DISTRO_FEATURES', 'ppp', 'task-base-ppp', '',d)} \
    ${@base_contains('DISTRO_FEATURES', 'raid', 'task-base-raid', '',d)} \
    "

RDEPENDS_task-distro-base = "${DISTRO_EXTRA_RDEPENDS}"
RRECOMMENDS_task-distro-base = "${DISTRO_EXTRA_RRECOMMENDS}"

RDEPENDS_task-machine-base = "${MACHINE_EXTRA_RDEPENDS}"
RRECOMMENDS_task-machine-base = "${MACHINE_EXTRA_RRECOMMENDS}"
#
# task-boot
# Minimal set of packages - needed to boot
#
RDEPENDS_task-boot = "\
    kernel \
    base-files \
    base-passwd \
    busybox \
    initscripts \
    modutils-initscripts \
    netbase \
    ${DISTRO_DEV_MANAGER} \
    ${DISTRO_INIT_MANAGER} \
    ${DISTRO_LOGIN_MANAGER} \
    ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"

RRECOMMENDS_task-boot = "\
    ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}"

RDEPENDS_task-base-kernel24 = "\
    modutils-depmod"

RDEPENDS_task-base-kernel26 = "\
    sysfsutils \
    module-init-tools"

RDEPENDS_task-base-keyboard = "\
    keymaps"

RDEPENDS_task-base-pci = "\
    pciutils"

RRECOMMENDS_task-base-kernel26 = "\
    kernel-module-input \
    kernel-module-uinput"

RDEPENDS_task-base-acpi = "\
    acpid"

RDEPENDS_task-base-apm = "\
    apm \
    apmd \
    ${@base_contains('MACHINE_FEATURES', 'kernel24', 'network-suspend-scripts', '',d)}"

RDEPENDS_task-base-ext2 = "\
    hdparm \
    e2fsprogs \
    e2fsprogs-e2fsck \
    e2fsprogs-mke2fs"

RDEPENDS_task-base-alsa = "\
    alsa-utils-alsactl \
    alsa-utils-alsamixer"

RRECOMMENDS_task-base-alsa = "\
    alsa-state \
    kernel-module-snd-mixer-oss \
    kernel-module-snd-pcm-oss"

RDEPENDS_task-base-pcmcia = "\
    ${PCMCIA_MANAGER} \
    ${@base_contains('DISTRO_FEATURES', 'wifi', 'prism3-firmware', '',d)} \
    ${@base_contains('DISTRO_FEATURES', 'wifi', 'prism3-support', '',d)} \
    ${@base_contains('DISTRO_FEATURES', 'wifi', 'spectrum-fw', '',d)} \
    ${@base_contains('DISTRO_FEATURES', 'wifi', 'hostap-conf', '',d)} \
    ${@base_contains('DISTRO_FEATURES', 'wifi', 'orinoco-conf', '',d)}"

RRECOMMENDS_task-base-pcmcia = "\
    ${@base_contains('MACHINE_FEATURES', 'kernel26', '${task-base-pcmcia26}', '${task-base-pcmcia24}',d)} \
    kernel-module-pcmcia \
    kernel-module-airo-cs \
    kernel-module-pcnet-cs \
    kernel-module-serial-cs \
    kernel-module-ide-cs \
    kernel-module-ide-disk \
    "

task-base-pcmcia24 = "\
    ${@base_contains('DISTRO_FEATURES', 'wifi', 'hostap-modules-cs', '',d)} \
    ${@base_contains('DISTRO_FEATURES', 'wifi', 'orinoco-modules-cs', '',d)}"

task-base-pcmcia26 = "\
    ${@base_contains('DISTRO_FEATURES', 'wifi', 'kernel-module-hostap-cs', '',d)} \
    ${@base_contains('DISTRO_FEATURES', 'wifi', 'kernel-module-orinoco-cs', '',d)} \
    ${@base_contains('DISTRO_FEATURES', 'wifi', 'kernel-module-spectrum-cs', '',d)}"

RDEPENDS_task-base-bluetooth = "\ 
	blueprobe \
	bluez-utils"

RRECOMMENDS_task-base-bluetooth = "\
    kernel-module-bluetooth \
    kernel-module-l2cap \
    kernel-module-rfcomm \
    kernel-module-hci-vhci \
    kernel-module-bnep \
    kernel-module-hidp \
    kernel-module-hci-uart \
    kernel-module-sco \
    ${@base_contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-hci-usb', '',d)} \
    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetooth3c-cs', '',d)} \
    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluecard-cs', '',d)} \
    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetoothuart-cs', '',d)} \
    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-dtl1-cs', '',d)}"

RDEPENDS_task-base-irda = "\
    irda-utils"

RRECOMMENDS_task-base-irda = "\
    kernel-module-pxaficp-ir \
    kernel-module-irda \
    kernel-module-ircomm \
    kernel-module-ircomm-tty \
    kernel-module-irlan \
    ${@base_contains('DISTRO_FEATURES', 'ppp', 'kernel-module-irnet', '',d)} \
    kernel-module-irport \
    kernel-module-irtty \
    kernel-module-irtty-sir \
    kernel-module-sir-dev \
    ${@base_contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-ir-usb', '',d)} "

RRECOMMENDS_task-base-usbgadget = "\
    kernel-module-pxa27x_udc \
    kernel-module-gadgetfs \
    kernel-module-g-file-storage \
    kernel-module-g-serial \
    kernel-module-g-ether"

RDEPENDS_task-base-usbhost = "\
    usbutils "

RRECOMMENDS_task-base-usbhost = "\
    kernel-module-uhci-hcd \
    kernel-module-ohci-hcd \
    kernel-module-ehci-hcd \
    kernel-module-usbcore \
    kernel-module-usbhid \
    kernel-module-usbnet \
    kernel-module-sd-mod \
    kernel-module-scsi-mod \
    kernel-module-usbmouse \
    kernel-module-mousedev \
    kernel-module-usbserial \
    kernel-module-usb-storage "

RDEPENDS_task-base-uboot = "\
    uboot-utils"

RDEPENDS_task-base-redboot = "\
    fis"

RDEPENDS_task-base-ppp = "\
    ppp \
    ppp-dialin"

RRECOMMENDS_task-base-ppp = "\
    kernel-module-ppp-async \
    kernel-module-ppp-deflate \
    kernel-module-ppp-mppe"

RDEPENDS_task-base-ipsec = "\
    openswan"

RRECOMMENDS_task-base-ipsec = "\
    kernel-module-ipsec"

RDEPENDS_task-base-wifi = "\
    wireless-tools \
    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'hostap-utils', '',d)} \
    ${@base_contains('COMBINED_FEATURES', 'pci', 'hostap-utils', '',d)} \
    wpa-supplicant"

RRECOMMENDS_task-base-wifi = "\
    kernel-module-ieee80211-crypt \
    kernel-module-ieee80211-crypt-ccmp \
    kernel-module-ieee80211-crypt-tkip \
    kernel-module-ieee80211-crypt-wep \
    kernel-module-ecb \
    kernel-module-arc4 \
    kernel-module-michael-mic \
    kernel-module-aes"

RRECOMMENDS_task-base-smbfs = "\
    kernel-module-cifs \
    kernel-module-smbfs"

RRECOMMENDS_task-base-cramfs = "\
    kernel-module-cramfs"

RDEPENDS_task-base-nfs = "\
    portmap"

RRECOMMENDS_task-base-nfs = "\
    kernel-module-nfs "

RDEPENDS_task-base-raid = "\
	"

RDEPENDS_task-base-screen = "\
	"

RDEPENDS_task-base-touchscreen = "\
    tslib-tests \
    tslib-calibrate "

RDEPENDS_task-base-ipv6 = "\
    "

RRECOMMENDS_task-base-ipv6 = "\
    kernel-module-ipv6 "

# Tosort
# kernel-module-nvrd
# kernel-module-mip6-mn
# kernel-module-tun
# kernel-module-ide-disk
# kernel-module-ide-probe-mo
# kernel-module-loop
# kernel-module-vfat
# kernel-module-ext2
# kernel-module-sco
# kernel-module-af_packet
# kernel-module-ip-gre
# kernel-module-ip-tables
# kernel-module-ipip
# kernel-module-des
# kernel-module-md5
# kernel-module-8250
# Should be DISTRO_EXTRA_RRECOMMENDS: lrzsz

--Boundary-00=_XvnHGpFyXM4zwtE
Content-Type: text/plain;
  charset="iso-8859-15";
  name="Packages.small"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="Packages.small"

Package: task-base-acpi
Depends: acpid

Package: task-base-alsa
Depends: alsa-utils-alsactl, alsa-utils-alsamixer
Recommends: alsa-state, kernel-module-snd-mixer-oss, kernel-module-snd-pcm-oss

Package: task-base-ext2
Depends: hdparm, e2fsprogs, e2fsprogs-e2fsck, e2fsprogs-mke2fs

Package: task-base-ipsec
Depends: openswan
Recommends: kernel-module-ipsec

Package: task-base-ipv6
Recommends: kernel-module-ipv6

Package: task-base-irda
Depends: irda-utils
Recommends: kernel-module-pxaficp-ir, kernel-module-irda, kernel-module-ircomm, kernel-module-ircomm-tty, kernel-module-irlan, kernel-module-irnet, kernel-module-irport, kernel-module-irtty, kernel-module-irtty-sir, kernel-module-sir-dev, kernel-module-ir-usb

Package: task-base-kernel26
Depends: sysfsutils, module-init-tools
Recommends: kernel-module-input, kernel-module-uinput

Package: task-base-nfs
Depends: portmap
Recommends: kernel-module-nfs

Package: task-base-pci
Depends: pciutils

Package: task-base-pcmcia
Depends: pcmciautils, prism3-firmware, prism3-support, spectrum-fw, hostap-conf, orinoco-conf
Recommends: kernel-module-hostap-cs, kernel-module-orinoco-cs, kernel-module-spectrum-cs, kernel-module-pcmcia, kernel-module-airo-cs, kernel-module-pcnet-cs, kernel-module-serial-cs, kernel-module-ide-cs, kernel-module-ide-disk

Package: task-base-ppp
Depends: ppp, ppp-dialin
Recommends: kernel-module-ppp-async, kernel-module-ppp-deflate, kernel-module-ppp-mppe

Package: task-base-screen

Package: task-base-smbfs
Recommends: kernel-module-cifs, kernel-module-smbfs

Package: task-base-touchscreen
Depends: tslib-tests, tslib-calibrate

Package: task-base-usbhost
Depends: usbutils
Recommends: kernel-module-uhci-hcd, kernel-module-ohci-hcd, kernel-module-ehci-hcd, kernel-module-usbcore, kernel-module-usbhid, kernel-module-usbnet, kernel-module-sd-mod, kernel-module-scsi-mod, kernel-module-usbmouse, kernel-module-mousedev, kernel-module-usbserial, kernel-module-usb-storage

Package: task-base-wifi
Depends: wireless-tools, hostap-utils, hostap-utils, wpa-supplicant
Recommends: kernel-module-ieee80211-crypt, kernel-module-ieee80211-crypt-ccmp, kernel-module-ieee80211-crypt-tkip, kernel-module-ieee80211-crypt-wep, kernel-module-ecb, kernel-module-arc4, kernel-module-michael-mic, kernel-module-aes

Package: task-base
Depends: task-boot, task-distro-base, task-machine-base, dropbear, task-base-kernel26, task-base-acpi, task-base-alsa, task-base-ext2, task-base-irda, task-base-pci, task-base-pcmcia, task-base-usbhost, task-base-nfs, task-base-ipsec, task-base-ppp

Package: task-boot
Depends: kernel, base-files, base-passwd, busybox, initscripts, modutils-initscripts, netbase, udev, sysvinit, tinylogin

Package: task-distro-base
Depends: update-modules, module-init-tools, modutils-initscripts, sysvinit, initscripts, sysvinit-pidof, psplash, netbase, dropbear, angstrom-version, ipkg, ipkg-collateral, util-linux-mount, util-linux-umount, avahi-daemon, avahi-autoipd, tslib-tests, tslib-calibrate, gdb, strace, procps
Recommends: kernel-module-vfat, kernel-module-ext2

Package: task-machine-base
Recommends: progear-ac, progear-battery, kernel-module-snd-ali5451, kernel-module-i2c-ali1535, kernel-module-i2c-ali15x3, kernel-module-yenta-socket


--Boundary-00=_XvnHGpFyXM4zwtE--
