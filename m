Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HNyFC-0003c0-Qe
	for openembedded-devel@openembedded.org; Sun, 04 Mar 2007 22:27:51 +0100
Received: (qmail 7526 invoked by uid 813007); 4 Mar 2007 21:27:50 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 4 Mar 2007 21:27:49 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 4 Mar 2007 22:28:02 +0100
User-Agent: KMail/1.9.6
MIME-Version: 1.0
Message-Id: <200703042228.03665.openembedded@hrw.one.pl>
Subject: RFC: Task-base rewrite
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
X-List-Received-Date: Sun, 04 Mar 2007 21:27:54 -0000
X-Groupsio-MsgNum: 1553
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_jnz6FCAhPxMnNKn"

--Boundary-00=_jnz6FCAhPxMnNKn
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


During last two months I was working on new version of task-base. It was 
done from time to time without too much testing as I had many other 
things on my todo list.

The main problem of task-base is that it give one package as result so if 
you want to create smaller rootfs for only few features you need to 
create own-task-base and base image on it.

My version create several task-base-*, task-distro-* packages which cover 
several features one by one. Some features contain extra stuff only if 
other features are available (for example Bluetooth on USB bus only if 
distro supports BT and device support USB Host).

Code needs cleanup, changes here and there but it should be better then 
current implementation. Recent changes made to task-base in .dev are not 
in my version yet.

Opinions? Ideas? Patches? Suggestions?

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                 Try not! Do, or do not! There is no try!
                 		-- Yoda

--Boundary-00=_jnz6FCAhPxMnNKn
Content-Type: text/plain;
  charset="us-ascii";
  name="task-base-new.bb"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="task-base-new.bb"

DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
PR = "r17.6"

PACKAGES = "\
            task-base-minimal \
            task-base-core-default \
            \
            task-base \
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
            ${@base_contains("DISTRO_FEATURES","cramfs","task-distro-cramfs","", d)} \
            ${@base_contains("DISTRO_FEATURES","ipsec","task-distro-ipsec","", d)} \
            ${@base_contains("DISTRO_FEATURES","ipv6","task-distro-ipv6","", d)} \
            ${@base_contains("DISTRO_FEATURES","nfs","task-distro-nfs","", d)} \
            ${@base_contains("DISTRO_FEATURES","ppp","task-distro-ppp","", d)} \
            ${@base_contains("DISTRO_FEATURES","smbfs","task-distro-smbfs","", d)} \
            ${@base_contains("DISTRO_FEATURES","wifi","task-distro-wifi","", d)} \
            \
            task-distro-base \
            task-distro-extras \
            task-base-machine \
            task-base-machine-extras \
           "

ALLOW_EMPTY = "1"

PACKAGE_ARCH = "${MACHINE_ARCH}"

# Valid only in MACHINE_FEATURES:
#
# kernel24
# kernel26
# apm
# keyboard
# touchscreen
# screen
# pci
# acpi
# phone

# Valid only in DISTRO_FEATURES:
#
# nfs
# smbfs
# ipsec
# wifi
# ppp

# Valid COMBINED_FEATURES:
# (These features need to be supported by both the machine and the distro)
#
# alsa
# bluetooth
# ext2
# irda
# pci
# pcmcia
# usbgadget
# usbhost

DISTRO_CORE_PACKAGE ?= "task-base-core-default"

#
# task-base
#

#
# task-base-oh-minimal
# An example of a small cut down machine configuration
#
RDEPENDS_task-base-minimal = "\
    kernel \
    ${@base_contains("MACHINE_FEATURES","kernel26","task-base-kernel26","task-base-kernel24",d)} \
    ${@base_contains("MACHINE_FEATURES","apm","task-base-apm","",d)} \
    ${@base_contains("COMBINED_FEATURES","pcmcia","${PCMCIA_MANAGER}","",d)} \
    ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"

RRECOMMENDS_task-base-minimal = "\
    ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}"

RDEPENDS_task-base-core-default = "\
    base-files \
    base-passwd \
    busybox \
    initscripts \
    netbase \
    sysvinit \
    sysvinit-pidof \
    tinylogin \
    modutils-initscripts"

RRECOMMENDS_task-base-core-default = "\
    dropbear \
    fuser \
    setserial"

RDEPENDS_task-base = "\
    ${DISTRO_CORE_PACKAGE} \
    kernel \
    ${@base_contains("MACHINE_FEATURES", "kernel24", "task-base-kernel24","",d)} \
    ${@base_contains("MACHINE_FEATURES", "kernel26", "task-base-kernel26","",d)} \
    ${@base_contains("MACHINE_FEATURES", "apm",      "task-base-apm","",d)} \
    ${@base_contains("MACHINE_FEATURES", "acpi",     "task-base-acpi","",d)} \
    ${@base_contains("MACHINE_FEATURES", "keyboard", "task-base-keyboard","",d)} \
    ${@base_contains("COMBINED_FEATURES","alsa",     "task-base-alsa","",d)} \
    ${@base_contains("COMBINED_FEATURES","ext2",     "task-base-ext2","",d)} \
    ${@base_contains("COMBINED_FEATURES","irda",     "task-base-irda","",d)} \
    ${@base_contains("COMBINED_FEATURES","pci",      "task-base-pci","",d)} \
    ${@base_contains("COMBINED_FEATURES","pcmcia",   "task-base-pcmcia","",d)} \
    ${@base_contains("COMBINED_FEATURES","usbhost",  "task-base-usbhost","",d)} \
    ${@base_contains("COMBINED_FEATURES","bluetooth","task-base-bluetooth","",d)} \
    ${@base_contains("COMBINED_FEATURES","wifi",     "task-base-wifi","",d)} \
    ${@base_contains("DISTRO_FEATURES",  "nfs",      "task-distro-nfs","",d)} \
    ${@base_contains("DISTRO_FEATURES",  "ipsec",    "task-distro-ipsec","",d)} \
    ${@base_contains("DISTRO_FEATURES",  "ppp",      "task-distro-ppp","",d)} \
    task-base-machine \
    task-distro-base"

RRECOMMENDS_task-base = "\
    ${@base_contains("MACHINE_FEATURES", "kernel26",  "task-base-kernel26-extras","",d)} \
    task-base-machine-extras \
    task-distro-extras"

RDEPENDS_task-distro-base = "${DISTRO_EXTRA_RDEPENDS}"

RRECOMMENDS_task-distro-extras = "${DISTRO_EXTRA_RRECOMMENDS}"

RDEPENDS_task-base-machine = "${MACHINE_EXTRA_RDEPENDS} ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"

RRECOMMENDS_task-base-machine-extras = "\
    ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS} \
    ${MACHINE_EXTRA_RRECOMMENDS}"

RDEPENDS_task-base-kernel24 = "\
    modutils-depmod \
    linux-hotplug"

RDEPENDS_task-base-kernel26 = "\
    udev \
    sysfsutils \
    module-init-tools"

RRECOMMENDS_task-base-kernel24-extras = "\
    kernel-module-input \
    kernel-module-uinput"

RRECOMMENDS_task-base-kernel26-extras = "\
    kernel-module-input \
    kernel-module-uinput"

RDEPENDS_task-base-keyboard = "\
    keymaps"

RDEPENDS_task-base-pci = "\
    pciutils"

RDEPENDS_task-base-acpi = "\
    acpid"

RDEPENDS_task-base-apm = "\
    apm \
    apmd \
    ${@base_contains("MACHINE_FEATURES", "kernel24",  "network-suspend-scripts","",d)}"

RDEPENDS_task-base-ext2 = "\
    e2fsprogs \
    e2fsprogs-e2fsck \
    e2fsprogs-mke2fs"

RRECOMMENDS_task-base-ext2 = "\
    hdparm"

RDEPENDS_task-base-alsa = "\
    alsa-utils-alsactl \
    alsa-utils-alsamixer"

RRECOMMENDS_task-base-alsa = "\
    kernel-module-snd-mixer-oss \
    kernel-module-snd-pcm-oss"

RDEPENDS_task-base-pcmcia = "\
    ${PCMCIA_MANAGER}"

RRECOMMENDS_task-base-pcmcia = "\
    ${@base_contains("DISTRO_FEATURES","wifi","task-base-pcmcia-wifi","", d)} \
    ${@base_contains("DISTRO_FEATURES","bluetooth","task-base-pcmcia-bluetooth","", d)} \
    kernel-module-pcmcia \
    kernel-module-airo-cs \
    kernel-module-pcnet-cs \
    kernel-module-serial-cs \
    kernel-module-ide-cs"

RDEPENDS_task-base-pcmcia-wifi = "\
    prism3-firmware \
    prism3-support \
    spectrum-fw \
    hostap-conf \
    orinoco-conf \
    ${@base_contains("MACHINE_FEATURES","kernel26","kernel-module-hostap-cs kernel-module-orinoco-cs kernel-module-spectrum-cs","hostap-modules-cs orinoco-modules-cs",d)}"

RRECOMMENDS_task-base-pcmcia-wifi = "\
    hostap-utils"

RDEPENDS_task-base-bluetooth = "\ 
    bluez-utils"

RRECOMMENDS_task-base-bluetooth = "\
    blueprobe \
    kernel-module-bluetooth \
    kernel-module-l2cap \
    kernel-module-rfcomm \
    kernel-module-hci-vhci \
    kernel-module-bnep \
    kernel-module-hidp \
    kernel-module-hci-uart \
    kernel-module-sco"

RRECOMMENDS_task-base-usbhost-bluetooth = "\
    kernel-module-hci-usb"

RRECOMMENDS_task-base-pcmcia-bluetooth = "\
    kernel-module-bluetooth3c-cs \
    kernel-module-bluecard-cs \
    kernel-module-bluetoothuart-cs \
    kernel-module-dtl1-cs \
    kernel-module-serial-cs"

RDEPENDS_task-base-irda = "\
    irda-utils"

RRECOMMENDS_task-base-irda = "\
    ${@base_contains("DISTRO_FEATURES","ppp","task-base-irda-ppp","", d)} \
    kernel-module-pxaficp-ir \
    kernel-module-irda \
    kernel-module-ircomm \
    kernel-module-ircomm-tty \
    kernel-module-irlan \
    kernel-module-irport \
    kernel-module-irtty"

RRECOMMENDS_task-base-irda-ppp = "\
    kernel-module-irnet"

RRECOMMENDS_task-base-usbhost-irda = "\
    kernel-module-ir-usb"

RRECOMMENDS_task-base-usbgadget = "\
    kernel-module-pxa27x_udc \
    kernel-module-gadgetfs \
    kernel-module-g-file-storage \
    kernel-module-g-serial \
    kernel-module-g-ether"

RDEPENDS_task-base-usbhost = "\
    usbutils"

RRECOMMENDS_task-base-usbhost = "\
    ${@base_contains("DISTRO_FEATURES","bluetooth","task-base-usbhost-bluetooth","", d)} \
    ${@base_contains("DISTRO_FEATURES","irda","task-base-usbhost-irda","", d)} \
    kernel-module-ohci-hcd \
    kernel-module-usbcore \
    kernel-module-usbhid \
    kernel-module-usbnet \
    kernel-module-sd-mod \
    kernel-module-scsi-mod \
    kernel-module-usbmouse \
    kernel-module-mousedev \
    kernel-module-usbserial \
    kernel-module-usb-storage"

RRECOMMENDS_task-base-pci-wifi = "\
    hostap-utils"

RDEPENDS_task-distro-ppp = "\
    ppp \
    ppp-dialin"

RRECOMMENDS_task-distro-ppp = "\
    kernel-module-ppp-async \
    kernel-module-ppp-deflate \
    kernel-module-ppp-mppe"

RDEPENDS_task-distro-ipsec = "\
    openswan"

RRECOMMENDS_task-distro-ipsec = "\
    kernel-module-ipsec"

RDEPENDS_task-distro-wifi = "\
    wireless-tools"

RRECOMMENDS_task-distro-wifi = "\
    kernel-module-ieee80211-crypt \
    kernel-module-ieee80211-crypt-ccmp \
    kernel-module-ieee80211-crypt-tkip \
    kernel-module-ieee80211-crypt-wep \
    kernel-module-arc4 \
    kernel-module-michael-mic \
    kernel-module-aes \
    wpa-supplicant"

RRECOMMENDS_task-distro-smbfs = "\
    kernel-module-cifs \
    kernel-module-smbfs"

RRECOMMENDS_task-distro-cramfs = "\
    kernel-module-cramfs"

RDEPENDS_task-distro-nfs = "\
    portmap"

RRECOMMENDS_task-distro-nfs = "\
    kernel-module-nfs \
    kernel-module-lockd \
    kernel-module-sunrpc"

RRECOMMENDS_task-distro-ipv6 = "\
    kernel-module-ipv6"

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

--Boundary-00=_jnz6FCAhPxMnNKn--
