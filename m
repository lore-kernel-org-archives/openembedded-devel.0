Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OgfnG-00052O-2k
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 17:22:13 +0200
Received: by ywe9 with SMTP id 9so2144259ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=83HDKkFgneOOR+S6sd+USqwqtGEdEpsMNe99xp8Hajk=;
	b=CGzg/nQDjXFGbsUQFG+loKzuaIEaTqKoQD+z1i+s6Ls1pS6FUL4CcpcwcNZGstgHYT
	E9vRpAV5H1rsVBZSmwnCeVaoBdqF9X5PPdiJUpXXh3rp6vEUDP/WJbkNKiioZU7IW1vb
	YJY1/mKbCARYOzTlRKz6oycXlJHONAglG/G58=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=NCmzwFtVPv+e8OwCAZuXqfQ2U62qoevCBBbCs/Uxl7MUOtdhL8SS1pFsSqT8XCoAgf
	L6aepcVPzcOYs9+B56mzLTEXtMJfon+D4ZnT409hlLbpmBY/StIMZPNHJ9XykspE8/ih
	4dIkusvT5MQW+y7OWcS7teYL3Q0975ar7Ze2s=
Received: by 10.150.59.19 with SMTP id h19mr10241872yba.389.1280935325140;
	Wed, 04 Aug 2010 08:22:05 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id q31sm8015323ybk.1.2010.08.04.08.22.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 08:22:04 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 10:17:34 -0500
Message-Id: <1280935054-22073-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/1] ti-tisdk-setup: add recipe to install setup scripts
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
X-List-Received-Date: Wed, 04 Aug 2010 15:22:13 -0000

* Added recipe that installs setup scripts for the development
  host.  i.e. configurating nfs and tftp.
* Adds script to setup u-boot environment variables.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/ti/ti-tisdk-setup.bb                       |   30 +++
 .../am37x-evm/setup/setup-uboot-env.sh             |  217 ++++++++++++++++++
 .../dm365-evm/setup/setup-uboot-env.sh             |  237 ++++++++++++++++++++
 .../dm37x-evm/setup/setup-uboot-env.sh             |  217 ++++++++++++++++++
 .../omap3evm/setup/setup-uboot-env.sh              |  217 ++++++++++++++++++
 .../omapl138/setup/setup-uboot-env.sh              |  213 ++++++++++++++++++
 recipes/ti/ti-tisdk-setup/setup/common.sh          |    9 +
 .../ti/ti-tisdk-setup/setup/setup-host-check.sh    |   13 +
 recipes/ti/ti-tisdk-setup/setup/setup-minicom.sh   |   51 +++++
 .../ti-tisdk-setup/setup/setup-package-install.sh  |   21 ++
 .../ti/ti-tisdk-setup/setup/setup-targetfs-nfs.sh  |   79 +++++++
 recipes/ti/ti-tisdk-setup/setup/setup-tftp.sh      |   81 +++++++
 recipes/ti/ti-tisdk-setup/setup/setup.sh           |   35 +++
 13 files changed, 1420 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-tisdk-setup.bb
 create mode 100644 recipes/ti/ti-tisdk-setup/am37x-evm/setup/setup-uboot-env.sh
 create mode 100644 recipes/ti/ti-tisdk-setup/dm365-evm/setup/setup-uboot-env.sh
 create mode 100644 recipes/ti/ti-tisdk-setup/dm37x-evm/setup/setup-uboot-env.sh
 create mode 100644 recipes/ti/ti-tisdk-setup/omap3evm/setup/setup-uboot-env.sh
 create mode 100644 recipes/ti/ti-tisdk-setup/omapl138/setup/setup-uboot-env.sh
 create mode 100644 recipes/ti/ti-tisdk-setup/setup/common.sh
 create mode 100644 recipes/ti/ti-tisdk-setup/setup/setup-host-check.sh
 create mode 100644 recipes/ti/ti-tisdk-setup/setup/setup-minicom.sh
 create mode 100644 recipes/ti/ti-tisdk-setup/setup/setup-package-install.sh
 create mode 100644 recipes/ti/ti-tisdk-setup/setup/setup-targetfs-nfs.sh
 create mode 100644 recipes/ti/ti-tisdk-setup/setup/setup-tftp.sh
 create mode 100644 recipes/ti/ti-tisdk-setup/setup/setup.sh

diff --git a/recipes/ti/ti-tisdk-setup.bb b/recipes/ti/ti-tisdk-setup.bb
new file mode 100644
index 0000000..6713ef1
--- /dev/null
+++ b/recipes/ti/ti-tisdk-setup.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Package containing scripts to setup the development host and target board"
+LICENSE = "TI"
+
+COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|dm37x-evm|dm365-evm|da830-omapl138-evm.conf)"
+
+require ti-paths.inc
+
+SRC_URI = "\
+	file://setup/setup.sh \
+  	file://setup/common.sh \
+  	file://setup/setup-host-check.sh \
+  	file://setup/setup-minicom.sh \
+  	file://setup/setup-package-install.sh \
+  	file://setup/setup-targetfs-nfs.sh \
+  	file://setup/setup-tftp.sh \
+  	file://setup/setup-uboot-env.sh \
+"
+
+PR = "r11"
+
+do_install () {
+	install -d ${D}/${installdir}/bin
+	install -m 0755 ${WORKDIR}/setup/* ${D}/${installdir}/bin/
+        # Place the setup.sh script one directory higher
+        mv ${D}/${installdir}/bin/setup.sh ${D}/${installdir}/setup.sh
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FILES_${PN} = "${installdir}/*"
diff --git a/recipes/ti/ti-tisdk-setup/am37x-evm/setup/setup-uboot-env.sh b/recipes/ti/ti-tisdk-setup/am37x-evm/setup/setup-uboot-env.sh
new file mode 100644
index 0000000..009928d
--- /dev/null
+++ b/recipes/ti/ti-tisdk-setup/am37x-evm/setup/setup-uboot-env.sh
@@ -0,0 +1,217 @@
+#!/bin/sh
+
+cwd=`dirname $0`
+. $cwd/common.sh
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "This step will set up the u-boot variables for booting the EVM."
+
+ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
+prompt="EVM #"
+
+echo "Autodetected the following ip address of your host, correct it if necessary"
+read -p "[ $ipdefault ] " ip
+echo
+
+if [ ! -n "$ip" ]; then
+    ip=$ipdefault
+fi
+
+if [ -f $cwd/../.targetfs ]; then
+    rootpath=`cat $cwd/../.targetfs`
+else
+    echo "Where is your target filesystem extracted?"
+    read -p "[ ${HOME}/targetfs ]" rootpath
+
+    if [ ! -n "$rootpath" ]; then
+        rootpath="${HOME}/targetfs"
+    fi
+    echo
+fi
+
+uimagesrc=`ls -1 $cwd/../psp/prebuilt-images/uImage*.bin`
+uimagedefault=`basename $uimagesrc`
+
+baseargs="console=ttyS0,115200n8 rw mem=99M mpurate=1000"
+videoargs1="omap_vout.vid1_static_vrfb_alloc=y"
+videoargs2="omapfb.vrfb=y vram=20M omapfb.vram=0:20M"
+videoargs3="omapfb.mode=dvi:720x480MR-16@60"
+videoargs="$videoargs1 $videoargs2 $videoargs3"
+fssdargs="root=/dev/mmcblk0p2 rootfstype=ext3"
+fsnfsargs="root=/dev/nfs nfsroot=$ip:$rootpath"
+
+echo "Select Linux kernel location:"
+echo " 1: TFTP"
+echo " 2: SD card"
+echo
+read -p "[ 1 ] " kernel
+
+if [ ! -n "$kernel" ]; then
+    kernel="1"
+fi
+
+echo
+echo "Select root file system location:"
+echo " 1: NFS"
+echo " 2: SD card"
+echo
+read -p "[ 1 ] " fs
+
+if [ ! -n "$fs" ]; then
+    fs="1"
+fi
+
+if [ "$kernel" -eq "1" ]; then
+    echo
+    echo "Available kernel images in /tftproot:"
+    for file in /tftpboot/*; do
+        basefile=`basename $file`
+        echo "    $basefile"
+    done
+    echo
+    echo "Which kernel image do you want to boot from TFTP?"
+    read -p "[ $uimagedefault ] " uimage
+
+    if [ ! -n "$uimage" ]; then
+        uimage=$uimagedefault
+    fi
+
+    bootcmd="setenv bootcmd 'dhcp;setenv serverip $ip;tftpboot;bootm'"
+    serverip="setenv serverip $ip"
+    bootfile="setenv bootfile $uimage"
+
+    if [ "$fs" -eq "1" ]; then
+        bootargs="setenv bootargs $baseargs $videoargs $fsnfsargs ip=dhcp"
+        cfg="uimage-tftp_fs-nfs"
+    else
+        bootargs="setenv bootargs $baseargs $videoargs $fssdargs ip=off"
+        cfg="uimage-tftp_fs-sd"
+    fi
+else
+    if [ "$fs" -eq "1" ]; then
+        bootargs="setenv bootargs $baseargs $videoargs $fsnfsargs ip=dhcp"
+        bootcmd="setenv bootcmd 'mmc init;fatload mmc 0 0x82000000 uImage;bootm 0x82000000'"
+        cfg="uimage-sd_fs-nfs"
+    else
+        bootargs="setenv bootargs $baseargs $videoargs $fssdargs ip=off"
+        bootcmd="setenv bootcmd 'mmc init;fatload mmc 0 0x82000000 uImage;bootm 0x82000000'"
+        cfg="uimage-sd_fs-sd"
+    fi
+fi
+
+echo
+echo "Resulting u-boot variable settings:"
+echo
+echo "setenv bootdelay 4"
+echo "setenv baudrate 115200"
+echo $bootargs
+echo $bootcmd
+
+if [ -n "$serverip" ]; then
+    echo "setenv autoload no"
+    echo $serverip
+fi
+
+if [ -n "$bootfile" ]; then
+    echo $bootfile
+fi
+echo "--------------------------------------------------------------------------------"
+
+do_expect() {
+    echo "expect {" >> $3
+    check_status
+    echo "    $1" >> $3
+    check_status
+    echo "}" >> $3
+    check_status
+    echo $2 >> $3
+    check_status
+    echo >> $3
+}
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "Would you like to create a minicom script with the above parameters (y/n)?"
+read -p "[ y ] " minicom
+echo
+
+if [ ! -n "$minicom" ]; then
+    minicom="y"
+fi
+
+if [ "$minicom" == "y" ]; then
+    minicomfile=setup_$platform_$cfg.minicom
+    minicomfilepath=$cwd/../$minicomfile
+
+    if [ -f $minicomfilepath ]; then
+        echo "Moving existing $minicomfile to $minicomfile.old"
+        mv $minicomfilepath $minicomfilepath.old
+        check_status
+    fi
+
+    timeout=300
+    echo "timeout $timeout" >> $minicomfilepath
+    echo "verbose on" >> $minicomfilepath
+    echo >> $minicomfilepath
+    do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv bootdelay 4\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
+    do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv oldbootargs \$\{bootargs\}\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv bootargs $baseargs \c\"" $minicomfilepath
+    echo "send \"$videoargs1 \c\"" >> $minicomfilepath
+    echo "send \"$videoargs2 \c\"" >> $minicomfilepath
+    echo "send \"$videoargs3 \c\"" >> $minicomfilepath
+#    echo "send \"$videoargs4 \c\"" >> $minicomfilepath
+    if [ "$fs" -eq "1" ]; then
+        echo "send \"$fsnfsargs \c\"" >> $minicomfilepath
+        echo "send \"ip=dhcp\"" >> $minicomfilepath
+    else
+        echo "send \"$fssdargs \c\"" >> $minicomfilepath
+        echo "send \"ip=off\"" >> $minicomfilepath
+    fi
+    if [ "$kernel" -eq "1" ]; then
+        do_expect "\"$prompt\"" "send \"setenv autoload no\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"setenv oldserverip \$\{serverip\}\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"$serverip\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"setenv oldbootfile \$\{bootfile\}\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"$bootfile\"" $minicomfilepath
+    fi
+    do_expect "\"$prompt\"" "send \"setenv oldbootcmd \$\{bootcmd\}\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"$bootcmd\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
+    do_expect "\"$prompt\"" "! killall -s SIGHUP minicom" $minicomfilepath
+
+    echo "Successfully wrote $minicomfile"
+    echo
+    echo "Would you like to run the setup script now (y/n)? This requires you to connect"
+    echo "the RS-232 cable between your host and EVM as well as your ethernet cable as"
+    echo "described in the Quick Start Guide. Once answering 'y' on the prompt below"
+    echo "you will have $timeout seconds to connect the board and power cycle it"
+    echo "before the setup times out"
+    echo
+    echo "After successfully executing this script, your EVM will be set up. You will be "
+    echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
+    echo "you can set up Tera Term as explained in the Software Developer's Guide."
+    echo "If you connect minicom or Tera Term and power cycle the board Linux will boot."
+    echo
+    read -p "[ y ] " minicomsetup
+
+    if [ ! -n "$minicomsetup" ]; then
+        minicomsetup="y"
+    fi
+
+    if [ "$minicomsetup" == "y" ]; then
+        pushd $cwd/..
+        check_status
+        minicom -S $minicomfile
+        popd >> /dev/null
+        check_status
+
+    fi
+    
+    echo "You can manually run minicom in the future with this setup script using: minicom -S $minicomfile"
+fi
+echo "--------------------------------------------------------------------------------"
diff --git a/recipes/ti/ti-tisdk-setup/dm365-evm/setup/setup-uboot-env.sh b/recipes/ti/ti-tisdk-setup/dm365-evm/setup/setup-uboot-env.sh
new file mode 100644
index 0000000..98089fc
--- /dev/null
+++ b/recipes/ti/ti-tisdk-setup/dm365-evm/setup/setup-uboot-env.sh
@@ -0,0 +1,237 @@
+#!/bin/sh
+
+cwd=`dirname $0`
+. $cwd/common.sh
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "This step will set up the u-boot variables for booting the EVM."
+
+ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
+prompt="EVM >"
+
+echo "Autodetected the following ip address of your host, correct it if necessary"
+read -p "[ $ipdefault ] " ip
+echo
+
+if [ ! -n "$ip" ]; then
+    ip=$ipdefault
+fi
+
+if [ -f $cwd/../.targetfs ]; then
+    rootpath=`cat $cwd/../.targetfs`
+else
+    echo "Where is your target filesystem extracted?"
+    read -p "[ ${HOME}/targetfs ]" rootpath
+
+    if [ ! -n "$rootpath" ]; then
+        rootpath="${HOME}/targetfs"
+    fi
+    echo
+fi
+
+uimagesrc=`ls -1 $cwd/../psp/prebuilt-images/uImage*.bin`
+uimagedefault=`basename $uimagesrc`
+
+baseargs="console=ttyS0,115200n8 rw mem=59M"
+videoargs1="video=davincifb:vid0=OFF:vid1=OFF:osd0=720x576x16,4050K"
+videoargs2="dm365_imp.oper_mode=0 davinci_capture.device_type=4"
+videoargs3="davinci_display.cont2_bufsize=6291456"
+videoargs4="vpfe_capture.cont_bufoffset=6291456"
+videoargs5="vpfe_capture.cont_bufsize=6291456"
+videoargs6="davinci_enc_mngr.ch0_output=COMPONENT"
+videoargs7="davinci_enc_mngr.ch0_mode=480P-60"
+videoargs="$videoargs1 $videoargs2 $videoargs3 $videoargs4 $videoargs5 $videoargs6 $videoargs7"
+fssdargs="root=/dev/mmcblk0p2 rootwait"
+fsnfsargs="root=/dev/nfs nfsroot=$ip:$rootpath"
+
+#echo "Select UBL location:"
+#echo " 1: flash"
+#echo " 2: SD card"
+#echo
+#read -p "[ 1 ] " ubl
+
+#if [ ! -n "$ubl" ]; then
+#    ubl="1"
+#fi
+
+echo "Select Linux kernel location:"
+echo " 1: TFTP"
+echo " 2: SD card"
+echo
+read -p "[ 1 ] " kernel
+
+if [ ! -n "$kernel" ]; then
+    kernel="1"
+fi
+
+echo
+echo "Select root file system location:"
+echo " 1: NFS"
+echo " 2: SD card"
+echo
+read -p "[ 1 ] " fs
+
+if [ ! -n "$fs" ]; then
+    fs="1"
+fi
+
+if [ "$kernel" -eq "1" ]; then
+    echo
+    echo "Available kernel images in /tftproot:"
+    for file in /tftpboot/*; do
+        basefile=`basename $file`
+        echo "    $basefile"
+    done
+    echo
+    echo "Which kernel image do you want to boot from TFTP?"
+    read -p "[ $uimagedefault ] " uimage
+
+    if [ ! -n "$uimage" ]; then
+        uimage=$uimagedefault
+    fi
+
+    bootcmd="setenv bootcmd 'dhcp;setenv serverip $ip;tftpboot;bootm'"
+    serverip="setenv serverip $ip"
+    bootfile="setenv bootfile $uimage"
+
+    if [ "$fs" -eq "1" ]; then
+        bootargs="setenv bootargs $baseargs $videoargs $fsnfsargs ip=dhcp"
+        cfg="uimage-tftp_fs-nfs"
+    else
+        bootargs="setenv bootargs $baseargs $videoargs $fssdargs ip=off"
+        cfg="uimage-tftp_fs-sd"
+    fi
+else
+    if [ "$fs" -eq "1" ]; then
+        bootargs="setenv bootargs $baseargs $videoargs $fsnfsargs ip=dhcp"
+        bootcmd="setenv bootcmd 'bootm 0x80700000'"
+        cfg="uimage-sd_fs-nfs"
+    else
+        bootargs="setenv bootargs $baseargs $videoargs $fssdargs ip=off"
+        bootcmd="setenv bootcmd 'bootm 0x80700000'"
+        cfg="uimage-sd_fs-sd"
+    fi
+fi
+
+echo
+echo "Resulting u-boot variable settings:"
+echo
+echo "setenv bootdelay 4"
+echo "setenv baudrate 115200"
+echo $bootargs
+echo $bootcmd
+
+if [ -n "$serverip" ]; then
+    echo "setenv autoload no"
+    echo $serverip
+fi
+
+if [ -n "$bootfile" ]; then
+    echo $bootfile
+fi
+echo "--------------------------------------------------------------------------------"
+
+do_expect() {
+    echo "expect {" >> $3
+    check_status
+    echo "    $1" >> $3
+    check_status
+    echo "}" >> $3
+    check_status
+    echo $2 >> $3
+    check_status
+    echo >> $3
+}
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "Would you like to create a minicom script with the above parameters (y/n)?"
+read -p "[ y ] " minicom
+echo
+
+if [ ! -n "$minicom" ]; then
+    minicom="y"
+fi
+
+if [ "$minicom" == "y" ]; then
+    minicomfile=setup_$platform_$cfg.minicom
+    minicomfilepath=$cwd/../$minicomfile
+
+    if [ -f $minicomfilepath ]; then
+        echo "Moving existing $minicomfile to $minicomfile.old"
+        mv $minicomfilepath $minicomfilepath.old
+        check_status
+    fi
+
+    timeout=300
+    echo "timeout $timeout" >> $minicomfilepath
+    echo "verbose on" >> $minicomfilepath
+    echo >> $minicomfilepath
+#if [ "$ubl" -eq "2" ]; then
+#    do_expect "\"\ > \"" "send \"1\"" $minicomfilepath
+#fi
+    do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv bootdelay 4\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
+    do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv oldbootargs \$\{bootargs\}\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv bootargs $baseargs \c\"" $minicomfilepath
+    echo "send \"$videoargs1 \c\"" >> $minicomfilepath
+    echo "send \"$videoargs2 \c\"" >> $minicomfilepath
+    echo "send \"$videoargs3 \c\"" >> $minicomfilepath
+    echo "send \"$videoargs4 \c\"" >> $minicomfilepath
+    echo "send \"$videoargs5 \c\"" >> $minicomfilepath
+    echo "send \"$videoargs6 \c\"" >> $minicomfilepath
+    echo "send \"$videoargs7 \c\"" >> $minicomfilepath
+    if [ "$fs" -eq "1" ]; then
+        echo "send \"$fsnfsargs \c\"" >> $minicomfilepath
+        echo "send \"ip=dhcp\"" >> $minicomfilepath
+    else
+        echo "send \"$fssdargs \c\"" >> $minicomfilepath
+        echo "send \"ip=off\"" >> $minicomfilepath
+    fi
+    if [ "$kernel" -eq "1" ]; then
+        do_expect "\"$prompt\"" "send \"setenv autoload no\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"setenv oldserverip \$\{serverip\}\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"$serverip\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"setenv oldbootfile \$\{bootfile\}\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"$bootfile\"" $minicomfilepath
+    fi
+    do_expect "\"$prompt\"" "send \"setenv oldbootcmd \$\{bootcmd\}\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"$bootcmd\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
+    do_expect "\"$prompt\"" "! killall -s SIGHUP minicom" $minicomfilepath
+
+    echo "Successfully wrote $minicomfile"
+    echo
+    echo "Would you like to run the setup script now (y/n)? This requires you to connect"
+    echo "the RS-232 cable between your host and EVM as well as your ethernet cable as"
+    echo "described in the Quick Start Guide. Once answering 'y' on the prompt below"
+    echo "you will have $timeout seconds to connect the board and power cycle it"
+    echo "before the setup times out"
+    echo
+    echo "After successfully executing this script, your EVM will be set up. You will be "
+    echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
+    echo "you can set up Tera Term as explained in the Software Developer's Guide."
+    echo "If you connect minicom or Tera Term and power cycle the board Linux will boot."
+    echo
+    read -p "[ y ] " minicomsetup
+
+    if [ ! -n "$minicomsetup" ]; then
+        minicomsetup="y"
+    fi
+
+    if [ "$minicomsetup" == "y" ]; then
+        pushd $cwd/..
+        check_status
+        minicom -S $minicomfile
+        popd >> /dev/null
+        check_status
+
+    fi
+    
+    echo "You can manually run minicom in the future with this setup script using: minicom -S $minicomfile"
+fi
+echo "--------------------------------------------------------------------------------"
diff --git a/recipes/ti/ti-tisdk-setup/dm37x-evm/setup/setup-uboot-env.sh b/recipes/ti/ti-tisdk-setup/dm37x-evm/setup/setup-uboot-env.sh
new file mode 100644
index 0000000..009928d
--- /dev/null
+++ b/recipes/ti/ti-tisdk-setup/dm37x-evm/setup/setup-uboot-env.sh
@@ -0,0 +1,217 @@
+#!/bin/sh
+
+cwd=`dirname $0`
+. $cwd/common.sh
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "This step will set up the u-boot variables for booting the EVM."
+
+ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
+prompt="EVM #"
+
+echo "Autodetected the following ip address of your host, correct it if necessary"
+read -p "[ $ipdefault ] " ip
+echo
+
+if [ ! -n "$ip" ]; then
+    ip=$ipdefault
+fi
+
+if [ -f $cwd/../.targetfs ]; then
+    rootpath=`cat $cwd/../.targetfs`
+else
+    echo "Where is your target filesystem extracted?"
+    read -p "[ ${HOME}/targetfs ]" rootpath
+
+    if [ ! -n "$rootpath" ]; then
+        rootpath="${HOME}/targetfs"
+    fi
+    echo
+fi
+
+uimagesrc=`ls -1 $cwd/../psp/prebuilt-images/uImage*.bin`
+uimagedefault=`basename $uimagesrc`
+
+baseargs="console=ttyS0,115200n8 rw mem=99M mpurate=1000"
+videoargs1="omap_vout.vid1_static_vrfb_alloc=y"
+videoargs2="omapfb.vrfb=y vram=20M omapfb.vram=0:20M"
+videoargs3="omapfb.mode=dvi:720x480MR-16@60"
+videoargs="$videoargs1 $videoargs2 $videoargs3"
+fssdargs="root=/dev/mmcblk0p2 rootfstype=ext3"
+fsnfsargs="root=/dev/nfs nfsroot=$ip:$rootpath"
+
+echo "Select Linux kernel location:"
+echo " 1: TFTP"
+echo " 2: SD card"
+echo
+read -p "[ 1 ] " kernel
+
+if [ ! -n "$kernel" ]; then
+    kernel="1"
+fi
+
+echo
+echo "Select root file system location:"
+echo " 1: NFS"
+echo " 2: SD card"
+echo
+read -p "[ 1 ] " fs
+
+if [ ! -n "$fs" ]; then
+    fs="1"
+fi
+
+if [ "$kernel" -eq "1" ]; then
+    echo
+    echo "Available kernel images in /tftproot:"
+    for file in /tftpboot/*; do
+        basefile=`basename $file`
+        echo "    $basefile"
+    done
+    echo
+    echo "Which kernel image do you want to boot from TFTP?"
+    read -p "[ $uimagedefault ] " uimage
+
+    if [ ! -n "$uimage" ]; then
+        uimage=$uimagedefault
+    fi
+
+    bootcmd="setenv bootcmd 'dhcp;setenv serverip $ip;tftpboot;bootm'"
+    serverip="setenv serverip $ip"
+    bootfile="setenv bootfile $uimage"
+
+    if [ "$fs" -eq "1" ]; then
+        bootargs="setenv bootargs $baseargs $videoargs $fsnfsargs ip=dhcp"
+        cfg="uimage-tftp_fs-nfs"
+    else
+        bootargs="setenv bootargs $baseargs $videoargs $fssdargs ip=off"
+        cfg="uimage-tftp_fs-sd"
+    fi
+else
+    if [ "$fs" -eq "1" ]; then
+        bootargs="setenv bootargs $baseargs $videoargs $fsnfsargs ip=dhcp"
+        bootcmd="setenv bootcmd 'mmc init;fatload mmc 0 0x82000000 uImage;bootm 0x82000000'"
+        cfg="uimage-sd_fs-nfs"
+    else
+        bootargs="setenv bootargs $baseargs $videoargs $fssdargs ip=off"
+        bootcmd="setenv bootcmd 'mmc init;fatload mmc 0 0x82000000 uImage;bootm 0x82000000'"
+        cfg="uimage-sd_fs-sd"
+    fi
+fi
+
+echo
+echo "Resulting u-boot variable settings:"
+echo
+echo "setenv bootdelay 4"
+echo "setenv baudrate 115200"
+echo $bootargs
+echo $bootcmd
+
+if [ -n "$serverip" ]; then
+    echo "setenv autoload no"
+    echo $serverip
+fi
+
+if [ -n "$bootfile" ]; then
+    echo $bootfile
+fi
+echo "--------------------------------------------------------------------------------"
+
+do_expect() {
+    echo "expect {" >> $3
+    check_status
+    echo "    $1" >> $3
+    check_status
+    echo "}" >> $3
+    check_status
+    echo $2 >> $3
+    check_status
+    echo >> $3
+}
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "Would you like to create a minicom script with the above parameters (y/n)?"
+read -p "[ y ] " minicom
+echo
+
+if [ ! -n "$minicom" ]; then
+    minicom="y"
+fi
+
+if [ "$minicom" == "y" ]; then
+    minicomfile=setup_$platform_$cfg.minicom
+    minicomfilepath=$cwd/../$minicomfile
+
+    if [ -f $minicomfilepath ]; then
+        echo "Moving existing $minicomfile to $minicomfile.old"
+        mv $minicomfilepath $minicomfilepath.old
+        check_status
+    fi
+
+    timeout=300
+    echo "timeout $timeout" >> $minicomfilepath
+    echo "verbose on" >> $minicomfilepath
+    echo >> $minicomfilepath
+    do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv bootdelay 4\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
+    do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv oldbootargs \$\{bootargs\}\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv bootargs $baseargs \c\"" $minicomfilepath
+    echo "send \"$videoargs1 \c\"" >> $minicomfilepath
+    echo "send \"$videoargs2 \c\"" >> $minicomfilepath
+    echo "send \"$videoargs3 \c\"" >> $minicomfilepath
+#    echo "send \"$videoargs4 \c\"" >> $minicomfilepath
+    if [ "$fs" -eq "1" ]; then
+        echo "send \"$fsnfsargs \c\"" >> $minicomfilepath
+        echo "send \"ip=dhcp\"" >> $minicomfilepath
+    else
+        echo "send \"$fssdargs \c\"" >> $minicomfilepath
+        echo "send \"ip=off\"" >> $minicomfilepath
+    fi
+    if [ "$kernel" -eq "1" ]; then
+        do_expect "\"$prompt\"" "send \"setenv autoload no\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"setenv oldserverip \$\{serverip\}\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"$serverip\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"setenv oldbootfile \$\{bootfile\}\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"$bootfile\"" $minicomfilepath
+    fi
+    do_expect "\"$prompt\"" "send \"setenv oldbootcmd \$\{bootcmd\}\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"$bootcmd\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
+    do_expect "\"$prompt\"" "! killall -s SIGHUP minicom" $minicomfilepath
+
+    echo "Successfully wrote $minicomfile"
+    echo
+    echo "Would you like to run the setup script now (y/n)? This requires you to connect"
+    echo "the RS-232 cable between your host and EVM as well as your ethernet cable as"
+    echo "described in the Quick Start Guide. Once answering 'y' on the prompt below"
+    echo "you will have $timeout seconds to connect the board and power cycle it"
+    echo "before the setup times out"
+    echo
+    echo "After successfully executing this script, your EVM will be set up. You will be "
+    echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
+    echo "you can set up Tera Term as explained in the Software Developer's Guide."
+    echo "If you connect minicom or Tera Term and power cycle the board Linux will boot."
+    echo
+    read -p "[ y ] " minicomsetup
+
+    if [ ! -n "$minicomsetup" ]; then
+        minicomsetup="y"
+    fi
+
+    if [ "$minicomsetup" == "y" ]; then
+        pushd $cwd/..
+        check_status
+        minicom -S $minicomfile
+        popd >> /dev/null
+        check_status
+
+    fi
+    
+    echo "You can manually run minicom in the future with this setup script using: minicom -S $minicomfile"
+fi
+echo "--------------------------------------------------------------------------------"
diff --git a/recipes/ti/ti-tisdk-setup/omap3evm/setup/setup-uboot-env.sh b/recipes/ti/ti-tisdk-setup/omap3evm/setup/setup-uboot-env.sh
new file mode 100644
index 0000000..0cbd7bb
--- /dev/null
+++ b/recipes/ti/ti-tisdk-setup/omap3evm/setup/setup-uboot-env.sh
@@ -0,0 +1,217 @@
+#!/bin/sh
+
+cwd=`dirname $0`
+. $cwd/common.sh
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "This step will set up the u-boot variables for booting the EVM."
+
+ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
+prompt="EVM #"
+
+echo "Autodetected the following ip address of your host, correct it if necessary"
+read -p "[ $ipdefault ] " ip
+echo
+
+if [ ! -n "$ip" ]; then
+    ip=$ipdefault
+fi
+
+if [ -f $cwd/../.targetfs ]; then
+    rootpath=`cat $cwd/../.targetfs`
+else
+    echo "Where is your target filesystem extracted?"
+    read -p "[ ${HOME}/targetfs ]" rootpath
+
+    if [ ! -n "$rootpath" ]; then
+        rootpath="${HOME}/targetfs"
+    fi
+    echo
+fi
+
+uimagesrc=`ls -1 $cwd/../psp/prebuilt-images/uImage*.bin`
+uimagedefault=`basename $uimagesrc`
+
+baseargs="console=ttyS0,115200n8 rw mem=99M mpurate=720"
+videoargs1="omap_vout.vid1_static_vrfb_alloc=y"
+videoargs2="omapfb.vrfb=y vram=20M omapfb.vram=0:20M"
+videoargs3="omapfb.mode=dvi:720x480MR-16@60"
+videoargs="$videoargs1 $videoargs2 $videoargs3"
+fssdargs="root=/dev/mmcblk0p2 rootfstype=ext3"
+fsnfsargs="root=/dev/nfs nfsroot=$ip:$rootpath"
+
+echo "Select Linux kernel location:"
+echo " 1: TFTP"
+echo " 2: SD card"
+echo
+read -p "[ 1 ] " kernel
+
+if [ ! -n "$kernel" ]; then
+    kernel="1"
+fi
+
+echo
+echo "Select root file system location:"
+echo " 1: NFS"
+echo " 2: SD card"
+echo
+read -p "[ 1 ] " fs
+
+if [ ! -n "$fs" ]; then
+    fs="1"
+fi
+
+if [ "$kernel" -eq "1" ]; then
+    echo
+    echo "Available kernel images in /tftproot:"
+    for file in /tftpboot/*; do
+        basefile=`basename $file`
+        echo "    $basefile"
+    done
+    echo
+    echo "Which kernel image do you want to boot from TFTP?"
+    read -p "[ $uimagedefault ] " uimage
+
+    if [ ! -n "$uimage" ]; then
+        uimage=$uimagedefault
+    fi
+
+    bootcmd="setenv bootcmd 'dhcp;setenv serverip $ip;tftpboot;bootm'"
+    serverip="setenv serverip $ip"
+    bootfile="setenv bootfile $uimage"
+
+    if [ "$fs" -eq "1" ]; then
+        bootargs="setenv bootargs $baseargs $videoargs $fsnfsargs ip=dhcp"
+        cfg="uimage-tftp_fs-nfs"
+    else
+        bootargs="setenv bootargs $baseargs $videoargs $fssdargs ip=off"
+        cfg="uimage-tftp_fs-sd"
+    fi
+else
+    if [ "$fs" -eq "1" ]; then
+        bootargs="setenv bootargs $baseargs $videoargs $fsnfsargs ip=dhcp"
+        bootcmd="setenv bootcmd 'mmc init;fatload mmc 0 0x82000000 uImage;bootm 0x82000000'"
+        cfg="uimage-sd_fs-nfs"
+    else
+        bootargs="setenv bootargs $baseargs $videoargs $fssdargs ip=off"
+        bootcmd="setenv bootcmd 'mmc init;fatload mmc 0 0x82000000 uImage;bootm 0x82000000'"
+        cfg="uimage-sd_fs-sd"
+    fi
+fi
+
+echo
+echo "Resulting u-boot variable settings:"
+echo
+echo "setenv bootdelay 4"
+echo "setenv baudrate 115200"
+echo $bootargs
+echo $bootcmd
+
+if [ -n "$serverip" ]; then
+    echo "setenv autoload no"
+    echo $serverip
+fi
+
+if [ -n "$bootfile" ]; then
+    echo $bootfile
+fi
+echo "--------------------------------------------------------------------------------"
+
+do_expect() {
+    echo "expect {" >> $3
+    check_status
+    echo "    $1" >> $3
+    check_status
+    echo "}" >> $3
+    check_status
+    echo $2 >> $3
+    check_status
+    echo >> $3
+}
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "Would you like to create a minicom script with the above parameters (y/n)?"
+read -p "[ y ] " minicom
+echo
+
+if [ ! -n "$minicom" ]; then
+    minicom="y"
+fi
+
+if [ "$minicom" == "y" ]; then
+    minicomfile=setup_$platform_$cfg.minicom
+    minicomfilepath=$cwd/../$minicomfile
+
+    if [ -f $minicomfilepath ]; then
+        echo "Moving existing $minicomfile to $minicomfile.old"
+        mv $minicomfilepath $minicomfilepath.old
+        check_status
+    fi
+
+    timeout=300
+    echo "timeout $timeout" >> $minicomfilepath
+    echo "verbose on" >> $minicomfilepath
+    echo >> $minicomfilepath
+    do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv bootdelay 4\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
+    do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv oldbootargs \$\{bootargs\}\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv bootargs $baseargs \c\"" $minicomfilepath
+    echo "send \"$videoargs1 \c\"" >> $minicomfilepath
+    echo "send \"$videoargs2 \c\"" >> $minicomfilepath
+    echo "send \"$videoargs3 \c\"" >> $minicomfilepath
+#    echo "send \"$videoargs4 \c\"" >> $minicomfilepath
+    if [ "$fs" -eq "1" ]; then
+        echo "send \"$fsnfsargs \c\"" >> $minicomfilepath
+        echo "send \"ip=dhcp\"" >> $minicomfilepath
+    else
+        echo "send \"$fssdargs \c\"" >> $minicomfilepath
+        echo "send \"ip=off\"" >> $minicomfilepath
+    fi
+    if [ "$kernel" -eq "1" ]; then
+        do_expect "\"$prompt\"" "send \"setenv autoload no\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"setenv oldserverip \$\{serverip\}\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"$serverip\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"setenv oldbootfile \$\{bootfile\}\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"$bootfile\"" $minicomfilepath
+    fi
+    do_expect "\"$prompt\"" "send \"setenv oldbootcmd \$\{bootcmd\}\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"$bootcmd\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
+    do_expect "\"$prompt\"" "! killall -s SIGHUP minicom" $minicomfilepath
+
+    echo "Successfully wrote $minicomfile"
+    echo
+    echo "Would you like to run the setup script now (y/n)? This requires you to connect"
+    echo "the RS-232 cable between your host and EVM as well as your ethernet cable as"
+    echo "described in the Quick Start Guide. Once answering 'y' on the prompt below"
+    echo "you will have $timeout seconds to connect the board and power cycle it"
+    echo "before the setup times out"
+    echo
+    echo "After successfully executing this script, your EVM will be set up. You will be "
+    echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
+    echo "you can set up Tera Term as explained in the Software Developer's Guide."
+    echo "If you connect minicom or Tera Term and power cycle the board Linux will boot."
+    echo
+    read -p "[ y ] " minicomsetup
+
+    if [ ! -n "$minicomsetup" ]; then
+        minicomsetup="y"
+    fi
+
+    if [ "$minicomsetup" == "y" ]; then
+        pushd $cwd/..
+        check_status
+        minicom -S $minicomfile
+        popd >> /dev/null
+        check_status
+
+    fi
+    
+    echo "You can manually run minicom in the future with this setup script using: minicom -S $minicomfile"
+fi
+echo "--------------------------------------------------------------------------------"
diff --git a/recipes/ti/ti-tisdk-setup/omapl138/setup/setup-uboot-env.sh b/recipes/ti/ti-tisdk-setup/omapl138/setup/setup-uboot-env.sh
new file mode 100644
index 0000000..f089880
--- /dev/null
+++ b/recipes/ti/ti-tisdk-setup/omapl138/setup/setup-uboot-env.sh
@@ -0,0 +1,213 @@
+#!/bin/sh
+
+cwd=`dirname $0`
+. $cwd/common.sh
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "This step will set up the u-boot variables for booting the EVM."
+
+ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
+prompt=" >"
+
+echo "Autodetected the following ip address of your host, correct it if necessary"
+read -p "[ $ipdefault ] " ip
+echo
+
+if [ ! -n "$ip" ]; then
+    ip=$ipdefault
+fi
+
+if [ -f $cwd/../.targetfs ]; then
+    rootpath=`cat $cwd/../.targetfs`
+else
+    echo "Where is your target filesystem extracted?"
+    read -p "[ ${HOME}/targetfs ]" rootpath
+
+    if [ ! -n "$rootpath" ]; then
+        rootpath="${HOME}/targetfs"
+    fi
+    echo
+fi
+
+uimagesrc=`ls -1 $cwd/../psp/prebuilt-images/uImage*.bin`
+uimagedefault=`basename $uimagesrc`
+
+baseargs="console=ttyS2,115200n8 noinitrd rw mem=32M@0xc0000000"
+fssdargs="root=/dev/mmcblk0p2 rootfstype=ext3 rootwait"
+fsnfsargs="root=/dev/nfs nfsroot=$ip:$rootpath,nolock"
+
+echo "Select Linux kernel location:"
+echo " 1: TFTP"
+echo " 2: flash"
+echo
+read -p "[ 1 ] " kernel
+
+if [ ! -n "$kernel" ]; then
+    kernel="1"
+fi
+
+echo
+echo "Select root file system location:"
+echo " 1: NFS"
+echo " 2: SD card"
+echo
+read -p "[ 1 ] " fs
+
+if [ ! -n "$fs" ]; then
+    fs="1"
+fi
+
+if [ "$kernel" -eq "1" ]; then
+    echo
+    echo "Available kernel images in /tftproot:"
+    for file in /tftpboot/*; do
+        basefile=`basename $file`
+        echo "    $basefile"
+    done
+    echo
+    echo "Which kernel image do you want to boot from TFTP?"
+    read -p "[ $uimagedefault ] " uimage
+
+    if [ ! -n "$uimage" ]; then
+        uimage=$uimagedefault
+    fi
+
+#    bootcmd="setenv bootcmd 'dhcp;bootm'"
+    bootcmd="setenv bootcmd 'dhcp;setenv serverip $ip;tftpboot;bootm'"
+    serverip="setenv serverip $ip"
+    bootfile="setenv bootfile $uimage"
+
+    if [ "$fs" -eq "1" ]; then
+        bootargs="setenv bootargs $baseargs $videoargs $fsnfsargs ip=dhcp"
+        cfg="uimage-tftp_fs-nfs"
+    else
+        bootargs="setenv bootargs $baseargs $videoargs $fssdargs ip=off"
+        cfg="uimage-tftp_fs-sd"
+    fi
+else
+    if [ "$fs" -eq "1" ]; then
+        bootargs="setenv bootargs $baseargs $videoargs $fsnfsargs ip=dhcp"
+        bootcmd="setenv bootcmd 'sf probe 0; sf read 0xc0700000 0x80000 0x280000; bootm 0xc0700000'"
+        cfg="uimage-flash_fs-nfs"
+    else
+        bootargs="setenv bootargs $baseargs $videoargs $fssdargs ip=off"
+        bootcmd="setenv bootcmd 'sf probe 0; sf read 0xc0700000 0x80000 0x280000; bootm 0xc0700000'"
+        cfg="uimage-flash_fs-sd"
+    fi
+fi
+
+echo
+echo "Resulting u-boot variable settings:"
+echo
+echo "setenv bootdelay 4"
+echo "setenv baudrate 115200"
+echo $bootargs
+echo $bootcmd
+
+if [ -n "$serverip" ]; then
+    echo "setenv autoload no"
+    echo $serverip
+fi
+
+if [ -n "$bootfile" ]; then
+    echo $bootfile
+fi
+echo "--------------------------------------------------------------------------------"
+
+do_expect() {
+    echo "expect {" >> $3
+    check_status
+    echo "    $1" >> $3
+    check_status
+    echo "}" >> $3
+    check_status
+    echo $2 >> $3
+    check_status
+    echo >> $3
+}
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "Would you like to create a minicom script with the above parameters (y/n)?"
+read -p "[ y ] " minicom
+echo
+
+if [ ! -n "$minicom" ]; then
+    minicom="y"
+fi
+
+if [ "$minicom" == "y" ]; then
+    minicomfile=setup_$platform_$cfg.minicom
+    minicomfilepath=$cwd/../$minicomfile
+
+    if [ -f $minicomfilepath ]; then
+        echo "Moving existing $minicomfile to $minicomfile.old"
+        mv $minicomfilepath $minicomfilepath.old
+        check_status
+    fi
+
+    timeout=300
+    echo "timeout $timeout" >> $minicomfilepath
+    echo "verbose on" >> $minicomfilepath
+    echo >> $minicomfilepath
+    do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv bootdelay 4\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
+    do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv oldbootargs \$\{bootargs\}\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"setenv bootargs $baseargs \c\"" $minicomfilepath
+    echo "send \"$videoargs1 \c\"" >> $minicomfilepath
+    echo "send \"$videoargs2 \c\"" >> $minicomfilepath
+    echo "send \"$videoargs3 \c\"" >> $minicomfilepath
+    if [ "$fs" -eq "1" ]; then
+        echo "send \"$fsnfsargs \c\"" >> $minicomfilepath
+        echo "send \"ip=dhcp\"" >> $minicomfilepath
+    else
+        echo "send \"$fssdargs \c\"" >> $minicomfilepath
+        echo "send \"ip=off\"" >> $minicomfilepath
+    fi
+    if [ "$kernel" -eq "1" ]; then
+        do_expect "\"$prompt\"" "send \"setenv autoload no\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"setenv oldserverip \$\{serverip\}\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"$serverip\"" $minicomfilepath
+#        do_expect "\"$prompt\"" "send \"setenv oldbootfile \$\{bootfile\}\"" $minicomfilepath
+        do_expect "\"$prompt\"" "send \"$bootfile\"" $minicomfilepath
+    fi
+    do_expect "\"$prompt\"" "send \"setenv oldbootcmd \$\{bootcmd\}\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"$bootcmd\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
+    do_expect "\"$prompt\"" "! killall -s SIGHUP minicom" $minicomfilepath
+
+    echo "Successfully wrote $minicomfile"
+    echo
+    echo "Would you like to run the setup script now (y/n)? This requires you to connect"
+    echo "the RS-232 cable between your host and EVM as well as your ethernet cable as"
+    echo "described in the Quick Start Guide. Once answering 'y' on the prompt below"
+    echo "you will have $timeout seconds to connect the board and power cycle it"
+    echo "before the setup times out."
+    echo
+    echo "After successfully executing this script, your EVM will be set up. You will be "
+    echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
+    echo "you can set up Tera Term as explained in the Software Developer's Guide."
+    echo "If you connect minicom or Tera Term and power cycle the board Linux will boot."
+    echo
+    read -p "[ y ] " minicomsetup
+
+    if [ ! -n "$minicomsetup" ]; then
+        minicomsetup="y"
+    fi
+
+    if [ "$minicomsetup" == "y" ]; then
+        pushd $cwd/..
+        check_status
+        minicom -S $minicomfile
+        popd >> /dev/null
+        check_status
+
+    fi
+    
+    echo "You can manually run minicom in the future with this setup script using: minicom -S $minicomfile"
+fi
+echo "--------------------------------------------------------------------------------"
diff --git a/recipes/ti/ti-tisdk-setup/setup/common.sh b/recipes/ti/ti-tisdk-setup/setup/common.sh
new file mode 100644
index 0000000..ccd5b47
--- /dev/null
+++ b/recipes/ti/ti-tisdk-setup/setup/common.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+check_status() {
+    ret=$?
+    if [ "$ret" -ne "0" ]; then
+        echo "Failed setup, aborting.."
+        exit 1
+    fi
+}
diff --git a/recipes/ti/ti-tisdk-setup/setup/setup-host-check.sh b/recipes/ti/ti-tisdk-setup/setup/setup-host-check.sh
new file mode 100644
index 0000000..93352ed
--- /dev/null
+++ b/recipes/ti/ti-tisdk-setup/setup/setup-host-check.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "Verifying Linux host distribution"
+host=`lsb_release -a 2>/dev/null | grep Codename: | awk {'print $2'}`
+if [ "$host" != "lucid" ]; then
+    echo "Unsupported host machine, only Ubuntu 10.04 LTS supported"
+    exit 1
+fi
+echo "Ubuntu 10.04 LTS found successfully, continuing.."
+echo "--------------------------------------------------------------------------------"
+echo
diff --git a/recipes/ti/ti-tisdk-setup/setup/setup-minicom.sh b/recipes/ti/ti-tisdk-setup/setup/setup-minicom.sh
new file mode 100644
index 0000000..f5f4125
--- /dev/null
+++ b/recipes/ti/ti-tisdk-setup/setup/setup-minicom.sh
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+cwd=`dirname $0`
+. $cwd/common.sh
+
+portdefault="/dev/ttyS0"
+minicomcfg=${HOME}/.minirc.dfl
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "This step will set up minicom (serial communication application) for"
+echo "DVSDK development"
+echo
+echo "Which serial port do you want to use with minicom?"
+read -p "[ $portdefault ] " port
+
+if [ ! -n "$port" ]; then
+    port=$portdefault
+fi
+
+if [ -f $minicomcfg ]; then
+    cp $minicomcfg $minicomcfg.old
+    echo
+    echo "Copied existing $minicomcfg to $minicomcfg.old"
+fi
+
+echo "pu port             $port
+pu baudrate         115200
+pu bits             8
+pu parity           N
+pu stopbits         1
+pu minit
+pu mreset
+pu mdialpre
+pu mdialsuf
+pu mdialpre2
+pu mdialsuf2
+pu mdialpre3
+pu mdialsuf3
+pu mconnect
+pu mnocon1          NO CARRIER
+pu mnocon2          BUSY
+pu mnocon3          NO DIALTONE
+pu mnocon4          VOICE
+pu rtscts           No" | tee $minicomcfg > /dev/null
+check_status
+
+echo
+echo "Configuration saved to $minicomcfg. You can change it further from inside"
+echo "minicom, see the Software Development Guide for more information."
+echo "--------------------------------------------------------------------------------"
diff --git a/recipes/ti/ti-tisdk-setup/setup/setup-package-install.sh b/recipes/ti/ti-tisdk-setup/setup/setup-package-install.sh
new file mode 100644
index 0000000..0011e08
--- /dev/null
+++ b/recipes/ti/ti-tisdk-setup/setup/setup-package-install.sh
@@ -0,0 +1,21 @@
+#!/bin/sh
+
+. `dirname $0`/common.sh
+
+cmd="sudo apt-get install xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev"
+echo "--------------------------------------------------------------------------------"
+echo "This step will make sure you have the proper host support packages installed"
+echo "using the following command: $cmd"
+echo
+echo "Note! This command requires you to have administrator priviliges (sudo access) "
+echo "on your host."
+echo -n "Press return to continue"
+read
+
+echo
+$cmd
+check_status
+echo
+echo "Package verification and installation successfully completed"
+echo "--------------------------------------------------------------------------------"
+echo
diff --git a/recipes/ti/ti-tisdk-setup/setup/setup-targetfs-nfs.sh b/recipes/ti/ti-tisdk-setup/setup/setup-targetfs-nfs.sh
new file mode 100644
index 0000000..f1873e7
--- /dev/null
+++ b/recipes/ti/ti-tisdk-setup/setup/setup-targetfs-nfs.sh
@@ -0,0 +1,79 @@
+#!/bin/sh
+
+cwd=`dirname $0`
+. $cwd/common.sh
+
+dstdefault="${HOME}/targetfs"
+echo "--------------------------------------------------------------------------------"
+echo "In which directory do you want to keep your target filesystem?"
+read -p "[ $dstdefault ] " dst
+
+if [ ! -n "$dst" ]; then
+    dst=$dstdefault
+fi
+echo "--------------------------------------------------------------------------------"
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "This step will extract the target filesystem to $dst"
+echo
+echo "Note! This command requires you to have administrator priviliges (sudo access) "
+echo "on your host."
+read -p "Press return to continue"
+
+if [ -d $dst ]; then
+    echo "$dst already exists, skipping extraction..."
+else
+    sudo mkdir -p $dst
+    check_status
+
+    fstar=`ls -1 $cwd/../filesystem/dvsdk*rootfs.tar.gz`
+    sudo tar xzf $fstar -C $dst
+    check_status
+fi
+echo $dst > $cwd/../.targetfs
+echo "--------------------------------------------------------------------------------"
+
+platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
+echo
+echo "--------------------------------------------------------------------------------"
+echo "This step will set up the DVSDK to install binaries in to:"
+echo "    $dst/home/root/$platform"
+echo
+echo "The files will be available from /home/root/$platform on the target."
+echo
+echo "This setting can be changed later by editing Rules.make and changing the"
+echo "EXEC_DIR variable."
+echo
+read -p "Press return to continue"
+
+sed -i "s=EXEC_DIR\=.*$=EXEC_DIR\=$dst/home/root/$platform=g" $cwd/../Rules.make
+check_status
+
+echo "Rules.make edited successfully.."
+echo "--------------------------------------------------------------------------------"
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "This step will export your target filesystem for NFS access."
+echo
+echo "Note! This command requires you to have administrator priviliges (sudo access) "
+echo "on your host."
+read -p "Press return to continue"
+
+grep $dst /etc/exports > /dev/null
+if [ "$?" -eq "0" ]; then
+    echo "$dst already NFS exported, skipping.."
+else
+    sudo chmod 666 /etc/exports
+    check_status
+    sudo echo "$dst *(rw,nohide,insecure,no_subtree_check,async,no_root_squash)" >> /etc/exports
+    check_status
+    sudo chmod 644 /etc/exports
+    check_status
+fi
+
+echo
+sudo /etc/init.d/nfs-kernel-server restart
+check_status
+echo "--------------------------------------------------------------------------------"
diff --git a/recipes/ti/ti-tisdk-setup/setup/setup-tftp.sh b/recipes/ti/ti-tisdk-setup/setup/setup-tftp.sh
new file mode 100644
index 0000000..b597e37
--- /dev/null
+++ b/recipes/ti/ti-tisdk-setup/setup/setup-tftp.sh
@@ -0,0 +1,81 @@
+#!/bin/sh
+
+cwd=`dirname $0`
+. $cwd/common.sh
+
+tftpcfg=/etc/xinetd.d/tftp
+tftproot=/tftpboot
+
+tftp() {
+    echo "
+service tftp
+{
+protocol = udp
+port = 69
+socket_type = dgram
+wait = yes
+user = nobody
+server = /usr/sbin/in.tftpd
+server_args = $tftproot
+disable = no
+}
+" | sudo tee $tftpcfg > /dev/null
+     check_status
+     echo
+     echo "$tftpcfg successfully created"
+}
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "This step will set up the tftp server in the $tftproot directory."
+echo
+echo "Note! This command requires you to have administrator priviliges (sudo access) "
+echo "on your host."
+read -p "Press return to continue"
+
+if [ -d $tftproot ]; then
+    echo
+    echo "$tftproot already exists, not creating.."
+else
+    sudo mkdir -p $tftproot
+    check_status
+    sudo chmod 777 $tftproot
+    check_status
+    sudo chown nobody $tftproot
+    check_status
+fi
+
+uimagesrc=`ls -1 $cwd/../psp/prebuilt-images/uImage*.bin`
+uimage=`basename $uimagesrc`
+if [ -f $tftproot/$uimage ]; then
+    echo
+    echo "$tftproot/$uimage already exists, skipping copy.."
+else
+    sudo cp $uimagesrc $tftproot
+    check_status
+    echo
+    echo "Successfully copied $uimage to tftp root directory $tftproot"
+fi
+
+echo
+if [ -f $tftpcfg ]; then
+    echo "$tftpcfg already exists.."
+
+    grep "$tftproot" $tftpcfg > /dev/null
+    if [ "$?" -eq "0" ]; then
+        echo "$tftproot already exported for TFTP, skipping.."
+    else
+        echo "Copying old $tftpcfg to $tftpcfg.old"
+        sudo cp $tftpcfg $tftpcfg.old
+        check_status
+        tftp
+    fi
+else
+    tftp
+fi
+
+echo
+echo "Restarting tftp server"
+sudo /etc/init.d/xinetd stop
+sudo /etc/init.d/xinetd start
+echo "--------------------------------------------------------------------------------"
diff --git a/recipes/ti/ti-tisdk-setup/setup/setup.sh b/recipes/ti/ti-tisdk-setup/setup/setup.sh
new file mode 100644
index 0000000..3701287
--- /dev/null
+++ b/recipes/ti/ti-tisdk-setup/setup/setup.sh
@@ -0,0 +1,35 @@
+#!/bin/sh
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "DVSDK setup script"
+echo
+echo "This script will set up your development host for dvsdk development."
+echo "Parts of this script require administrator priviliges (sudo access)."
+echo "--------------------------------------------------------------------------------"
+
+cwd=`dirname $0`
+. $cwd/bin/common.sh
+
+$cwd/bin/setup-host-check.sh
+check_status
+
+$cwd/bin/setup-package-install.sh
+check_status
+
+$cwd/bin/setup-targetfs-nfs.sh
+check_status
+
+$cwd/bin/setup-tftp.sh
+check_status
+
+$cwd/bin/setup-minicom.sh
+check_status
+
+$cwd/bin/setup-uboot-env.sh
+check_status
+
+echo
+echo "DVSDK setup completed!"
+echo "Please continue reading the Software Developer's Guide for more information on"
+echo "how to develop software on the EVM"
-- 
1.7.0.4



