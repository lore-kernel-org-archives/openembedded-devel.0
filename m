Received: from moutng.kundenserver.de ([212.227.126.186])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eng1@koblersystems.de>) id 1Q8ID8-0006wU-Uw
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 22:23:20 +0200
Received: from [192.168.1.34] (p57B40D8C.dip0.t-ipconnect.de [87.180.13.140])
	by mrelayeu.kundenserver.de (node=mreu2) with ESMTP (Nemesis)
	id 0MXkkl-1QSHF40jFX-00Wjik; Fri, 08 Apr 2011 22:16:00 +0200
Message-ID: <4D9F6CFC.3060801@koblersystems.de>
Date: Fri, 08 Apr 2011 22:15:56 +0200
From: Jan Kobler <eng1@koblersystems.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20110120 Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1302291183-17622-1-git-send-email-eng1@koblersystems.de>
In-Reply-To: <1302291183-17622-1-git-send-email-eng1@koblersystems.de>
X-Provags-ID: V02:K0:lFhJNJ+deG7I0BQ1DXWnuwHXge0DoHIfnytuXmOa4v3
	6zYGZSV6kOdgsOQCdXYW4AuFKV7gOEdZFBACXvOwLZ+qLybdWN
	e8BcrBShdZVXs9YKZlBJIc+ID4vqhL9dwDTZ102XfLP1pBJv4F
	tz1yyVq7xRVqQN9e1rcwTwAb+2xrCXVxRww4FD3ckW0S9d90bo
	HrO9qaeffQ1Ea4wP0CORQ==
Subject: mpc5125-twr: Tutorial
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
X-List-Received-Date: Fri, 08 Apr 2011 20:23:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

1. I have described the usage and the current state of the BSP of the
new machine  mpc5125-twr in a tutorial and wanted to publish it on
gentoo-wiki.com. Unfortunately gentoo-wiki.com is currently  not accessible.

Here is the tutorial in text form.

2. I can provide it also as html file, if someone wants it.

3. I would like to publish this tutorial under
http://www.openembedded.org/index.php/Category:Machine
because I think this would be the right place for it.
How can I get write access to the openembedded-wiki?

Best regards

Jan

_________________________________________________________________

Openembedded for Freescale TWR-MPC5125

     ----------------------------------------------------------------------

   Table of Contents

   About this tutorial

   Freescale TWR-MPC5125

   Openembedded

                Git Paths

   Folder Names

   Install Software for Openembedded

   Install Bitbake

   Install Openembedded

   Update

   Install the Patch for the Board Freescale TWR-MPC5125

   Create the configuration file

   Environment setup

   Image minimal-image

                Build Image

                Linux Kernel

                Create the Root File System

                nfs server

                Prepare the Board

                Serial Port

                U-boot

                Target Log

                Status

   Image opie-image

                Build Image opie-image

                Create the Root File System

                NFS Server

                U-boot

                Target Log

                Status

                Screenshots

   Image x11-gpe-image

                Build Image x11-gpe-image

                Create the Root File System

                NFS Server

                U-boot

                Target Log

                Status

                Screenshots

   Image xfce46-image

                Build Image xfce46-image

                Create the Root File System

                NFS Server

                U-boot

                Start Xfce

                Target Log

                Status

   Troubleshooting

                Workaround when fetch fails

                Workaround for cannot stat error

                Bitbake Reports an Error

About this tutorial

   This tutorial describes all the steps which are needed to create the
linux
   kernel and different root file systems on a Gentoo Linux host for the
   board Freescale TWR-MPC5125 with Openembedded, a build framework for
   embedded Linux. The Linux Distribution Angstrom, which is part of
   Openembedded, is used here to create the linux kernel and to create
   several root file systems:

     o a minimal-image for testing purposes,

     o OPIE (Open Palmtop Integrated Environment), a graphical user
interface
       for PDAs,

     o GPE (GPE Palmtop Environment), a graphical user interface for
PDAs and

     o Xfce, a lightweight desktop environment.

   The minimal-image uses about 35MB RAM at runtime on the Freescale
   TWR-MPC5125. OPIE uses about 51MB RAM at runtime. GPE uses about 61MB RAM
   at runtime. Xfce uses about 95MB RAM at runtime.

   Note: This is the first release of a BSP for the board Freescale
   TWR-MPC5125 in Openembedded. It seems to work, but only few tests have
   been made so far.

Freescale TWR-MPC5125

   The Freescale TWR-MPC5125-KIT consists of one MPU module and a peripheral
   module which can be plugged between two backplane boards. On the MPU
   module is the Freescale MPC5125 with a Power Architecture e300c4 core.
   Freescale provides a Linux demo and the source code for the Linux kernel
   and for U-boot.

   Freescale TWR-MPC5125:

http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=TWR-MPC5125-KIT

   Freescale MPC5125:
   http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=MPC5125

   TowerGeeks Group for TWR-MPC5125:
   http://www.towergeeks.org/group/twrmpc5125

Openembedded

   You can find further explanations for the following steps in the
   Openembedded wiki: http://wiki.openembedded.org/index.php/Main_Page.

   How to install Openembedded on Gentoo Linux:
   http://www.openembedded.org/index.php/OEandYourDistro#Gentoo_instructions

   How to get started: http://www.openembedded.org/index.php/Getting_started

   Advanced configuration settings:
   http://www.openembedded.org/index.php/Advanced_configuration

   User manual: http://docs.openembedded.org/usermanual/usermanual.html

  Git Paths

   The source code of the Openembedded project is saved in git-repositories:
   http://cgit.openembedded.org/cgit.cgi

   The source code of the bitbake application:
   http://cgit.openembedded.org/cgit.cgi/bitbake/

   You can look at each source file:
   http://cgit.openembedded.org/cgit.cgi/bitbake/tree/

   The configuration files and the defintions of the software packages:
   http://cgit.openembedded.org/cgit.cgi/openembedded/

   You can look at each file:
   http://cgit.openembedded.org/cgit.cgi/openembedded/tree

   Config files for the supported hardware:
   http://cgit.openembedded.org/cgit.cgi/openembedded/tree/conf/machine

   Patches for openembedded:
http://patches.openembedded.org/project/oe/list/

   Apply patches: http://wiki.openembedded.net/index.php/Patchwork

Folder Names

   These folders are used for

   Bitbake: $MY_BITBAKE

   Openembedded: $MY_OPENEMBEDDED

   Project configuration: $MY_PROJECT

   Build: $MY_TMP

   NFSRoot: $MY_NFSROOT

   Source: $MY_SRC

   The application bitbake is installed into the folder $MY_BITBAKE.

   The project definitions of openembedded are installed into the folder
   $MY_OPENEMBEDDED.

   Source files are downloaded by bitbake into the folder $MY_SRC.

   The configuration files for the current project are created in the folder
   $MY_PROJECT.

   bitbake creates all files in the folder $MY_TMP.

   The created root file systems are extracted in the folder $MY_NFSROOT and
   can be mounted by the target via NFS.

   The current project is just called test01.

   Define environment variables:

 export MY_BITBAKE=/MyOE/bitbake-1.12;
 export MY_OPENEMBEDDED=/MyOE/openembedded;
 export MY_PROJECT=/MyOE/project/test01;
 export MY_TMP=/MyOE/tmp/test01;
 export MY_NFSROOT=/MyOE/nfsroot/test01;
 export MY_SRC=/usr/portage/distfiles;

Install Software for Openembedded

   Before you can install and use openembedded, you need to install some
   software. At first set the use flags.

 nano /etc/portage/package.use/openembedded-use

   New or changed content of file openembedded-use:

 # use flags for openembedded
 dev-util/quilt graphviz

   Emerge the software, which is missing.

 emerge --update --ask -v psyco patch make sed dev-lang/python m4 bison
cvs openjade \
 quilt sgmltools-lite docbook-xml-dtd docbook-dsssl-stylesheets xmlto
docbook-sgml-utils \
 libpcre boost subversion texi2html pysqlite chrpath diffstat

   It is possible that portage requests that some other use flags are set
   too. psyco is not available for gentoo amd64 i.e. x86_64.

   Now you can check, if all needed applications exist

 which libtool python2.6 git svn cvs make gcc g++ patch help2man
diffstat texi2html \
 bzip2 gawk tar md5sum texi2pdf chrpath

   texi2pdf is part of the package texinfo.

Install Bitbake

   Create folders and download the branch 1.12 of bitbake:

 mkdir -p $MY_BITBAKE;
 git clone -b 1.12 git://git.openembedded.net/bitbake $MY_BITBAKE

   The size of this folder is about 3MB.

Install Openembedded

   Create folders and download the branch master of openembedded:

 git clone git://git.openembedded.net/openembedded $MY_OPENEMBEDDED

   The size of this folder is about 150MB.

Update

   From time to time you need to update your local versions of openembedded
   and bitbake.

   Update Openembedded

 cd $MY_OPENEMBEDDED;
 git pull --rebase

   Update Bitbake

 cd $MY_BITBAKE;
 git pull --rebase

Install the Patch for the Board Freescale TWR-MPC5125

   Because Openembedded has so far no configuration files for the board
   Freescale TWR-MPC5125, some patches need to be applied.

   Note: The patches will be soon released and the URL announced.

   When the patches are published on the Openembedded patch list
   http://patches.openembedded.org/project/oe/list they can be easily
   applied:

 more $MY_OPENEMBEDDED/contrib/patchwork/pw-am.sh
 cd $MY_OPENEMBEDDED;
 $MY_OPENEMBEDDED/contrib/patchwork/pw-am.sh  xxx yyy

Create the configuration file

   For each project you should create a project folder with a configuration
   file. Here it is $MY_PROJECT. Almost all settings for your project are
   defined in the local.conf file. At first use the file
local.conf.sample as
   template for the local.conf file.

 mkdir -p $MY_PROJECT/conf;
 cp $MY_OPENEMBEDDED/conf/local.conf.sample $MY_PROJECT/conf/local.conf

   Then adjust the configuration file

 nano $MY_PROJECT/conf/local.conf

   New or changed content of file local.conf:

 # DL_DIR = "${HOME}/sources"
 # use the distfiles of gentoo
 DL_DIR = "/usr/portage/distfiles"

   Bitbake downloads source files into and creates md5 files in the folder
   which is specified by the environment variable DL_DIR. Portage and
bitbake
   download the same source files. You can define DL_DIR to point to the
   source file repository of portage which is by default
   /usr/portage/distfiles. This avoids downloading a file two times by
   portage and bitbake. Make sure that you have access permissions to this
   folder. If you don't want to use the same download folder, then choose
   some other folder name for DL_DIR.

   Note: I don't know if sharing the download folder is a real feature of
   portage and openembedded, but it works for me. Sometimes when a fetch
   fails, I use Workaround_when_fetch_fails

   Continue adjusting the local.conf file. New or changed content of file
   local.conf:

 # BBFILES := "${@bb.fatal('Edit your conf/local.conf: BBFILES')}"
 BBFILES = "/MyOE/openembedded/recipes/*/*.bb"

 # on gentoo help2man unknown arg --no-discard-stderr
 # ASSUME_PROVIDED += "help2man-native"

 # TMPDIR = /usr/local/projects/oetmp
 TMPDIR = /MyOE/tmp/test01
 # TMPDIR is created by bitbake

 # GLIBC_GENERATE_LOCALES = "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8"
 GLIBC_GENERATE_LOCALES = "en_US.UTF-8"

 #IMAGE_FSTYPES = "jffs2 tar"
 IMAGE_FSTYPES = "jffs2 tar"

 # PARALLEL_MAKE = "-j 4"
 PARALLEL_MAKE = "-j 4"

 # BB_NUMBER_THREADS = "2"
 BB_NUMBER_THREADS = "2"

   Delete the last line of the file, otherwise you will get an error
message.
   The value of the variable DISTRO is the name of a distribution. The
   allowed values are the file names without suffix in the folder
   $MY_OPENEMBEDDED/conf/distro.

 ls $MY_OPENEMBEDDED/conf/distro

   The value of the variable MACHINE is the name of a target board or target
   system. The allowed values are the file names without suffix in the
folder
   $MY_OPENEMBEDDED/conf/machine.

 ls $MY_OPENEMBEDDED/conf/machine

   Define distribution and machine. Here mpc5125-twr.conf fits best to
   Freescale TWR-MPC5125.New or changed content of file local.conf:

 DISTRO="angstrom"
 MACHINE="mpc5125-twr"

   Clean work folder after succesfully building.New or changed content of
   file local.conf:

 INHERIT += "rm_work"

Environment setup

   Before you can call bitbake, you need to setup the environment. Because
   each project can have its own environment, you should create a script in
   the project folder.

   nano $MY_PROJECT/setup-env

   New or changed content of file setup-env:

 export PATH="/MyOE/bitbake-1.12/bin:${PATH}"
 export BBPATH="/MyOE/project/test01:/MyOE/openembedded/"

 # you can set also here: BB_ENV_EXTRAWHITE

 # set a new prompt
 export PS1="test01 $PS1"

 echo "Configure Openembedded for test01 "

   Call the script file setup-env only once, before you start using bitbake.
   The prompt will indicate, if you have called it or not.

   All the settings in setup-env and local.conf are independent of the
   environment variables MY_OPENEMBEDDED, MY_BITBAKE, MY_SRC, MY_NFSROOT,
   MY_PROJECT. You don't need them to run bitbake.

Image minimal-image

  Build Image

   You can be in any folder you like. You should be logged in as a common
   user. You don't need root privileges most of the time. Start building an
   image

 source $MY_PROJECT/setup-env;
 bitbake minimal-image

   Output:

 Build Configuration:
 BB_VERSION        = "1.12.0"
 METADATA_BRANCH   = "master"
 METADATA_REVISION = "6b9a381"
 TARGET_ARCH       = "ppc"
 TARGET_OS         = "linux"
 MACHINE           = "mpc5125-twr"
 DISTRO            = "angstrom"
 DISTRO_VERSION    = "v20110406"


   At first all cross-tools (called native in openembedded), e.g. the
   cross-compiler are build and installed in the folder $MY_TMP. Then the
   cross-tools are used to build all needed software packages. Root file
   images and the kernel images can be found in the folder
   $MY_TMP/deploy/eglibc/images/mpc5125-twr/

 ls  -1s $MY_TMP/deploy/eglibc/images/mpc5125-twr/

   These are the files which are created: Output:

  7152
Angstrom-minimalist-image-eglibc-ipk-v20110406-mpc5125-twr.rootfs.jffs2
 10668 Angstrom-minimalist-image-eglibc-ipk-v20110406-mpc5125-twr.rootfs.tar
  6256
Angstrom-minimalist-image-eglibc-ipk-v20110406-mpc5125-twr.rootfs.tar.gz
  6204 modules-2.6.29-r11-mpc5125-twr.tgz
  2448 uImage-2.6.29-r11-mpc5125-twr.bin
    12 uImage-2.6.29-r11-mpc5125-twr.dtb

   These are the links which are created: Output:

 minimalist-image-mpc5125-twr.jffs2 ->
Angstrom-minimalist-image-eglibc-ipk-v20110406-mpc5125-twr.rootfs.jffs2
 minimalist-image-mpc5125-twr.tar ->
Angstrom-minimalist-image-eglibc-ipk-v20110406-mpc5125-twr.rootfs.tar
 minimalist-image-mpc5125-twr.tar.gz ->
Angstrom-minimalist-image-eglibc-ipk-v20110406-mpc5125-twr.tar.gz
 uImage-mpc5125-twr.bin -> uImage-2.6.29-r11-mpc5125-twr.bin
 uImage-mpc5125-twr.dtb -> uImage-2.6.29-r11-mpc5125-twr.dtb

  Linux Kernel

   The board is already shipped with a Linux kernel in flash. U-boot can
load
   the kernel from a TFTP server or from flash. Here we load the kernel from
   a TFTP server.

 cp
$MY_TMP/deploy/eglibc/images/mpc5125-twr/uImage-2.6.29-r11-mpc5125-twr.bin
/tftpboot/uImage-mpc5125-twr;
 cp
$MY_TMP/deploy/eglibc/images/mpc5125-twr/uImage-2.6.29-r11-mpc5125-twr.dtb
 /tftpboot/uImage-mpc5125-twr-dtb;

  Create the Root File System

   Take the rootfs image and extract it into another folder. The extraction
   needs to be done with root privileges.

 mkdir -p $MY_NFSROOT/mpc5125-twr-minimal-image;
 cd  $MY_NFSROOT/mpc5125-twr-minimal-image;
 sudo tar xzf
$MY_TMP/deploy/eglibc/images/mpc5125-twr/minimalist-image-mpc5125-twr.tar.gz

   Extract the kernel modules into the root file system.

 cd  $MY_NFSROOT/mpc5125-twr-minimal-image;
 tar tzf
$MY_TMP/deploy/eglibc/images/mpc5125-twr/modules-2.6.29-r11-mpc5125-twr.tgz;
 sudo rm -rf lib/modules/2.6.29.1;
 sudo tar xzf
$MY_TMP/deploy/eglibc/images/mpc5125-twr/modules-2.6.29-r11-mpc5125-twr.tgz;

   The rootfs can be now mounted via NFS.

  nfs server

   Configure the nfs server to export the rootfs

 nano /etc/exports

   New or changed content of file /etc/exports:

 /MyOE/nfsroot/test01/mpc5125-twr-minimal-image
192.168.1.255/24(rw,no_root_squash,async,subtree_check)

 exportfs -r

  Prepare the Board

   You need a monitor, a USB mouse, a USB keyboard and a USB Hub. Only the
   TWR-MPC5125 MPU module is used.

     o Connect the monitor to the HDMI port of the TWR-MPC5125 MPU module.
       E.g. you can use a HDMI to DVI-D cable. The resolution has been
       640x480 60Hz during the tests.

     o Connect the mouse and the keyboard to a USB hub. Connect the USB hub
       to the Mini-AB connector on the board which is next to the HDMI
       connector. Use the Mini-B to receptable A cable.

     o Connect a USB cable to your host computer and to the Mini-B connector
       next to the SDHC card slot. This is the Serial-to-USB bridge.

     o Connect an Ethernet cable to the board.

     o Connect a 5V power supply to the board, if it is not already provided
       by the USB cable to your host computer.

  Serial Port

   There is a Serial-to-USB bridge on the board, which connects the serial
   port PSC0 to a USB port. When the Mini-B connector next to the SDHC card
   slot on the board is connected to a USB port of the host, then this
   message appears in /var/log/messages:Output:

 usb 1-1.2: new full speed USB device using ehci_hcd and address 5
 cdc_acm 1-1.2:1.0: This device cannot do calls on its own. It is not a
modem.
 cdc_acm 1-1.2:1.0: ttyACM0: USB ACM device
 usbcore: registered new interface driver cdc_acm
 cdc_acm: v0.26:USB Abstract Control Model driver for USB modems and
ISDN adapters

   Install the terminal application cu on your host system.

 emerge -av taylor-uucp

   Now open a terminal to the board

 cu -l /dev/ttyACM0

  U-boot

   Use the Serial-to-USB bridge to connect to the serial port PSC0 of the
   CPU. Boot the board and enter the command line of u-boot. Define the IP
   address of the board, the IP address of the server and the path for
   nfsroot. Check the current settings of the variables which are used to
   boot the board.

 echo ipaddr=$ipaddr;
 echo gatewayip=$gatewayip;
 echo netmask=$netmask;
 echo serverip=$serverip;
 echo kernel_loader=$kernel_loader_addr;
 echo fdt_loader_addr=$fdt_loader_addr;
 echo rootpath=$rootpath;
 echo consoledev=$consoledev;
 echo baudrate=$baudrate;
 echo hostname=$hostname;
 echo netdev=$netdev;
 echo bootargs=$bootargs;
 echo bootcmd=$bootcmd;
 echo tftpboot=$tftpboot;

   Change the variables which are used to boot the board.

 setenv ipaddr 192.168.1.8;
 setenv gatewayip 192.168.1.1;
 setenv netmask 255.255.255.0;
 setenv serverip 192.168.1.33;
 setenv consoledev ttyPSC0;
 setenv netdev eth0;

   Define the command to load the kernel from a TFTP server.

 set tftpboot 'tftp $kernel_loader_addr uImage-mpc5125-twr; tftp
$fdt_loader_addr uImage-mpc5125-twr-dtb; bootm $kernel_loader_addr -
$fdt_loader_addr '

   Define the nfsroot path and the bootcmd argument. When you want to use a
   different nfsroot, you need to change only rootpath and bootargs.

 setenv rootpath /MyOE/nfsroot/test01/mpc5125-twr-minimal-image;
 setenv bootargs root=/dev/nfs rw nfsroot=${serverip}:${rootpath}
console=${consoledev},${baudrate}
ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:${hostname}:${netdev}:off
panic=1;

   Save the new environment and boot again.

 saveenv
 run tftpboot

  Target Log

   The linux kernel specific part:

   Output:

 U-Boot 2009.03-00004-gd37ab38 (Apr 14 2010 - 10:48:22) MPC512X

 CPU:   MPC5125 rev. 1.0, Core e300c4 at 393.216 MHz, CSB at 196.608 MHz
 board:  mpc5125_mpu
 I2C:   ready
 DRAM:  256 MB
 NAND:  4096 MiB
 In:    serial
 Out:   serial
 Err:   serial
 Net:   FEC ETHERNET

 Type "run flash_nfs" to mount root filesystem over NFS

 Hit any key to stop autoboot:  0
 =>
 => setenv ipaddr 192.168.1.8;
 => setenv gatewayip 192.168.1.1;
 => setenv netmask 255.255.255.0;
 => setenv serverip 192.168.1.33;
 => setenv consoledev ttyPSC0;
 => setenv netdev eth0;
 => set tftpboot 'tftp $kernel_loader_addr uImage-mpc5125-twr; tftp
$fdt_loader_addr uImage-mpc5125-twr-dtb; bootm $kernel_loader_addr -
$fdt_loader_addr '
 => setenv rootpath /MyOE/nfsroot/test01/mpc5125-twr-minimal-image;
 => setenv bootargs root=/dev/nfs rw nfsroot=${serverip}:${rootpath}
console=${consoledev},${baudrate}
ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:${hostname}:${netdev}:off
panic=1;
 => echo $tftpboot
 tftp $kernel_loader_addr uImage-mpc5125-twr; tftp $fdt_loader_addr
uImage-mpc5125-twr-dtb; bootm $kernel_loader_addr - $fdt_loader_addr
 => echo $rootpath
 /MyOE/nfsroot/test01/mpc5125-twr-minimal-image
 => echo $bootargs
 root=/dev/nfs rw
nfsroot=192.168.1.33:/MyOE/nfsroot/test01/mpc5125-twr-minimal-image
console=ttyPSC0,115200
ip=192.168.1.8:192.168.1.33:192.168.1.1:255.255.255.0:ads5125:eth0:off
panic=1
 => saveenv
 Saving Environment to NAND...
 Erasing Nand...
 Writing to Nand... done
 => run tftpboot
 Using FEC ETHERNET device
 TFTP from server 192.168.1.33; our IP address is 192.168.1.8
 Filename 'uImage-mpc5125-twr'.
 Load address: 0x2000000
 Loading: #################################################################
          #################################################################
          #################################################################
          #################################################################
          #################################################################
          #################################################################
          #################################################################
          ##################################
 done
 Bytes transferred = 2499150 (26224e hex)
 Using FEC ETHERNET device
 TFTP from server 192.168.1.33; our IP address is 192.168.1.8
 Filename 'uImage-mpc5125-twr-dtb'.
 Load address: 0x2800000
 Loading: ###
 done
 Bytes transferred = 12288 (3000 hex)
 ## Booting kernel from Legacy Image at 02000000 ...
    Image Name:   Angstrom/2.6.29/mpc5125-twr
    Created:      2011-04-06   8:58:20 UTC
    Image Type:   PowerPC Linux Kernel Image (gzip compressed)
    Data Size:    2499086 Bytes =  2.4 MB
    Load Address: 00000000
    Entry Point:  00000000
    Verifying Checksum ... OK
 ## Flattened Device Tree blob at 02800000
    Booting using the fdt blob at 0x2800000
    Uncompressing Kernel Image ... OK
    Loading Device Tree to 007fa000, end 007fffff ... OK
 boot_jump_linux line:101 60000000 60000000 60000000 2c050000
 Using MPC5125 ADS machine description
 Initializing cgroup subsys cpu
 Linux version 2.6.29.1 (userA@hostX) (gcc version 4.5.3 20110311
(prerelease) (GCC) ) #1 PREEMPT Wed Apr 6 10:58:12 CEST 2011
 MPC5125 ADS board from Freescale Semiconductor
 preallocate_diu_videomemory: diu_size=5242880
 preallocate_diu_videomemory: diu_mem=c07fc000
 PSC0 psc_fifo_base:0 tx_fifo_size:00000060 rx_fifo_size:00000060
 PSC1 psc_fifo_base:192 tx_fifo_size:00000004 rx_fifo_size:00000004
 PSC9 psc_fifo_base:200 tx_fifo_size:00000004 rx_fifo_size:00000004
 Zone PFN ranges:
   DMA      0x00000000 -> 0x00010000
   Normal   0x00010000 -> 0x00010000
 Movable zone start PFN for each node
 early_node_map[1] active PFN ranges
     0: 0x00000000 -> 0x00010000
 Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 65024
 Kernel command line: root=/dev/nfs rw
nfsroot=192.168.1.33:/MyOE/nfsroot/test01/mpc5125-twr-minimal-image
console=ttyPSC0,115200
ip=192.168.1.8:192.168.1.33:192.168.1.1:255.255.255.0:ads5125:eth0:off
panic=1
 IPIC (128 IRQ sources) at fdffbc00
 PID hash table entries: 1024 (order: 10, 4096 bytes)
 clocksource: timebase mult[5161555] shift[22] registered
 Console: colour dummy device 80x25
 console [ttyPSC0] enabled
 Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
 Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
 Memory: 248892k/262144k available (4912k kernel code, 12928k reserved,
192k data, 396k bss, 192k init)
 Calibrating delay loop... 98.04 BogoMIPS (lpj=196096)
 Mount-cache hash table entries: 512
 Initializing cgroup subsys ns
 Initializing cgroup subsys cpuacct
 Initializing cgroup subsys devices
 Initializing cgroup subsys freezer
 Initializing cgroup subsys net_cls
 net_namespace: 992 bytes
 NET: Registered protocol family 16
 Could not initialize clk spdif_txclk without a calc routine
 Could not initialize clk spdif_rxclk without a calc routine
 register :mscan0_clk
 register :mscan1_clk
 mapped ioctl to d1004000 and gpioctl to d1008100
 PCI: Probing PCI hardware
 bio: create slab <bio-0> at 0
 SCSI subsystem initialized
 usbcore: registered new interface driver usbfs
 usbcore: registered new interface driver hub
 usbcore: registered new device driver usb
 Freescale Elo / Elo Plus DMA driver
 Freescale(R) MPC5121 DMA Engine found, 64 channels
 fsldma: Self-test copy successfully
 NET: Registered protocol family 2
 IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
 TCP established hash table entries: 8192 (order: 4, 65536 bytes)
 TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
 TCP: Hash tables configured (established 8192 bind 8192)
 TCP reno registered
 NET: Registered protocol family 1
 audit: initializing netlink socket (disabled)
 type=2000 audit(0.329:1): initialized
 NTFS driver 2.1.29 [Flags: R/W].
 fuse init (API version 7.11)
 yaffs Apr  6 2011 10:57:54 Installing.
 msgmni has been set to 486
 alg: No test for stdrng (krng)
 Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
 io scheduler noop registered
 io scheduler anticipatory registered (default)
 io scheduler deadline registered
 io scheduler cfq registered
 fsl_diu_alloc: size=64
 fsl_diu_alloc: size=1382400
 Console: switching to colour frame buffer device 90x30
 fb0: Panel0 fb device registered successfully.
 fsl_diu_alloc: size=76800
 fb1: Panel1 AOI0 fb device registered successfully.
 fsl_diu_alloc: size=76800
 fb2: Panel1 AOI1 fb device registered successfully.
 fsl_diu_alloc: size=76800
 fb3: Panel2 AOI0 fb device registered successfully.
 fsl_diu_alloc: size=76800
 fb4: Panel2 AOI1 fb device registered successfully.
 fsl_diu_alloc: size=32768
 FSL_DIU_FB: registed FB device driver!
 Generic non-volatile memory driver v1.1
 Serial: MPC52xx PSC UART driver
 80011100.serial: ttyPSC0 at MMIO 0x80011100 (irq = 40) is a MPC52xx PSC
 80011900.serial: ttyPSC1 at MMIO 0x80011900 (irq = 40) is a MPC52xx PSC
 brd: module loaded
 usbcore: registered new interface driver ub
 vcan: Virtual CAN interface driver
 fsl-mscan initializing
 can0 (fsl-mscan): not using net_device_ops yet
 fsl-mscan fsl-mscan.0: probe port 0xD102C300 done, clk rate:98500000
 can1 (fsl-mscan): not using net_device_ops yet
 fsl-mscan fsl-mscan.1: probe port 0xD1030380 done, clk rate:98500000
 eth0 (fs_enet): not using net_device_ops yet
 eth0: fs_enet: 00:11:22:33:44:55
 FEC MII Bus: probed
 Driver 'sd' needs updating - please use bus_type methods
 Driver 'sr' needs updating - please use bus_type methods
 SCSI Media Changer driver v0.25
 Driver 'ch' needs updating - please use bus_type methods
 MPC5125 MTD nand Driver 0.5
 NAND device: Manufacturer ID: 0x2c, Chip ID: 0x68 (Micron NAND 4GiB
3,3V 8-bit)
 mpc5125_nfc 40000000.nfc: Using OF partition info
 Creating 9 MTD partitions on "MPC5125 NAND":
 0x000000000000-0x000000100000 : "loader"
 0x000000100000-0x000000200000 : "uboot"
 0x000000200000-0x000000300000 : "envirment"
 0x000000300000-0x000000b00000 : "kernel"
 0x000000b00000-0x000000c00000 : "device-tree"
 0x000000c00000-0x000001400000 : "rootfs"
 0x000001400000-0x000080000000 : "filesystem"
 0x000080000000-0x000086400000 : "mqx"
 0x000086400000-0x000100000000 : "data"
 ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
 fsl-ehci fsl-ehci.0: Freescale On-Chip EHCI Host Controller
 fsl-ehci fsl-ehci.0: new USB bus registered, assigned bus number 1
 fsl-ehci fsl-ehci.0: irq 43, io mem 0x80003000
 fsl-ehci fsl-ehci.0: USB 2.0 started, EHCI 1.00
 usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
 usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
 usb usb1: Product: Freescale On-Chip EHCI Host Controller
 usb usb1: Manufacturer: Linux 2.6.29.1 ehci_hcd
 usb usb1: SerialNumber: fsl-ehci.0
 usb usb1: configuration #1 chosen from 1 choice
 hub 1-0:1.0: USB hub found
 hub 1-0:1.0: 1 port detected
 Initializing USB Mass Storage driver...
 usbcore: registered new interface driver usb-storage
 USB Mass Storage support registered.
 usbcore: registered new interface driver libusual
 mice: PS/2 mouse device common for all mice
 mpc5121-rtc 80000a00.rtc: rtc core: registered mpc5121-rtc as rtc0
 sdhc: Freescale Enhanced Secure Digital Host Controller driver
 mmc0: SDHC at 0x80001500 irq 23 PIO
 usbcore: registered new interface driver hiddev
 usbcore: registered new interface driver usbhid
 usbhid: v2.6:USB HID core driver
 Advanced Linux Sound Architecture Driver Version 1.0.18a.
 Freescale MPC5121 ADS ALSA SoC fabric driver
 No device for DAI AC97 HiFi
 No device for DAI psc0
 AC97 SoC Audio Codec 0.6
 asoc: AC97 HiFi <-> psc0 mapping ok
 ALSA device list:
   #0: MPC5121 ADS (AC97)
 TCP cubic registered
 NET: Registered protocol family 17
 can: controller area network core (rev 20090105 abi 8)
 NET: Registered protocol family 29
 can: raw protocol (rev 20090105)
 RPC: Registered udp transport module.
 RPC: Registered tcp transport module.
 registered taskstats version 1
 mpc5121-rtc 80000a00.rtc: setting system clock to 2011-04-07 11:51:57
UTC (1302177117)
 usb 1-1: new high speed USB device using fsl-ehci and address 2
 usb 1-1: New USB device found, idVendor=05e3, idProduct=0608
 usb 1-1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
 usb 1-1: Product: USB2.0 Hub
 usb 1-1: configuration #1 chosen from 1 choice
 hub 1-1:1.0: USB hub found
 hub 1-1:1.0: 4 ports detected
 usb 1-1.3: new low speed USB device using fsl-ehci and address 3
 usb 1-1.3: New USB device found, idVendor=099a, idProduct=610c
 usb 1-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
 usb 1-1.3: Product: USB Multimedia Keyboard
 usb 1-1.3: Manufacturer:
 usb 1-1.3: configuration #1 chosen from 1 choice
 input:   USB Multimedia Keyboard  as
/devices/platform/fsl-ehci.0/usb1/1-1/1-1.3/1-1.3:1.0/input/input0
 generic-usb 0003:099A:610C.0001: input,hidraw0: USB HID v1.00 Keyboard
[  USB Multimedia Keyboard ] on usb-fsl-ehci.0-1.3/input0
 input:   USB Multimedia Keyboard  as
/devices/platform/fsl-ehci.0/usb1/1-1/1-1.3/1-1.3:1.1/input/input1
 generic-usb 0003:099A:610C.0002: input,hidraw1: USB HID v1.00 Device [
 USB Multimedia Keyboard ] on usb-fsl-ehci.0-1.3/input1
 usb 1-1.4: new low speed USB device using fsl-ehci and address 4
 usb 1-1.4: New USB device found, idVendor=15ca, idProduct=00c3
 usb 1-1.4: New USB device strings: Mfr=0, Product=2, SerialNumber=0
 usb 1-1.4: Product: USB Optical Mouse
 usb 1-1.4: configuration #1 chosen from 1 choice
 input: USB Optical Mouse as
/devices/platform/fsl-ehci.0/usb1/1-1/1-1.4/1-1.4:1.0/input/input2
 generic-usb 0003:15CA:00C3.0003: input,hidraw2: USB HID v1.10 Mouse
[USB Optical Mouse] on usb-fsl-ehci.0-1.4/input0
 IP-Config: Complete:
      device=eth0, addr=192.168.1.8, mask=255.255.255.0, gw=192.168.1.1,
      host=ads5125, domain=, nis-domain=(none),
      bootserver=192.168.1.33, rootserver=192.168.1.33, rootpath=
 Looking up port of RPC 100003/2 on 192.168.1.33
 Looking up port of RPC 100005/1 on 192.168.1.33
 VFS: Mounted root (nfs filesystem) on device 0:14.
 Freeing unused kernel memory: 192k init


   The minimal-image specific part:

   Output:

 INIT: version 2.86 booting
 Please wait: booting...
 Starting udev
 WARNING: -e needs -E or -F
 UnCorrectable RS-ECC Error
 end_request: I/O error, dev mtdblock7, sector 248
 Buffer I/O error on device mtdblock7, logical block 31


   A lot of error messages: UnCorrectable RS-ECC ErrorOutput:

 Remounting root file system...
 Caching udev devnodes
 Populating dev cache
 NOT configuring network interfaces: / is an NFS mount
 INIT: Entering runlevel: 5
 Creating Dropbear SSH server RSA host key.
 Will output 1024 bit rsa secret key to
'/etc/dropbear/dropbear_rsa_host_key'
 Generating key, this may take a while...
 Public key portion is:
 ssh-rsa
AAAAB3NzaC1yc2EAAAADAQABAAAAgwCjY0uE3muO0KOvrUe45Fsk+wY3ov4ZAdurgTqNbVzuIaKBAB3rqgHyas7VPTnjr79EmpokXtdQk6L5mBoouvVUIG1JocSiiEo+/w9bwcHXi82MFJlUUOG+z4ZXX5wVfnQ2+uIzzgZKo3FDs5B0GhSgKVY/oMcERVb4FEQ+xDJf7cfT
root@mpc5125-twr
 Fingerprint: md5 20:6c:d5:6b:37:b6:28:be:f5:05:4d:2a:c2:ec:38:2f
 Starting Dropbear SSH server: NET: Registered protocol family 10
 lo: Disabled Privacy Extensions
 dropbear.
 Starting syslogd/klogd: done


 .-------.
 |       |                  .-.
 |   |   |-----.-----.-----.| |   .----..-----.-----.
 |       |     | __  |  ---'| '--.|  .-'|     |     |
 |   |   |  |  |     |---  ||  --'|  |  |  '  | | | |
 '---'---'--'--'--.  |-----''----''--'  '-----'-'-'-'
                 -'  |
                 '---'

 The Angstrom Distribution mpc5125-twr ttyPSC0

 Angstromv20110406 mpc5125-twr ttyPSC0

 INIT: Id "S" respawning too fast: disabled for 5 minutes
 INIT: Id "1" respawning
 INIT: no more processes

   Login with ssh via Ethernet

 uname -a

   Output:

 Linux mpc5125-twr 2.6.29.1 #1 PREEMPT Wed Apr 6 10:58:12 CEST 2011 ppc
GNU/Linux

 cat /proc/cpuinfo

   Output:

 processor       : 0
 cpu             : e300c4
 clock           : 393.216000MHz
 revision        : 1.0 (pvr 8086 2010)
 bogomips        : 98.04
 timebase        : 49152000
 platform        : MPC5125 ADS
 model           : mpc5125ads
 Memory          : 256 MB

 top

   Output:

 Mem: 35776K used, 213632K free, 0K shrd, 0K buff, 24900K cached

   Only the line with the memory usage. vmstat is not available.

 cat /proc/meminfo

   Output:

 MemTotal:         249408 kB
 MemFree:          213624 kB
 Buffers:               0 kB
 Cached:            24912 kB
 SwapCached:            0 kB
 Active:             4804 kB
 Inactive:          21624 kB
 Active(anon):       1804 kB
 Inactive(anon):        0 kB
 Active(file):       3000 kB
 Inactive(file):    21624 kB
 SwapTotal:             0 kB
 SwapFree:              0 kB
 Dirty:                 0 kB
 Writeback:             0 kB
 AnonPages:          1564 kB
 Mapped:             1480 kB
 Slab:               6020 kB
 SReclaimable:       2792 kB
 SUnreclaim:         3228 kB
 PageTables:          216 kB
 NFS_Unstable:          0 kB
 Bounce:                0 kB
 WritebackTmp:          0 kB
 CommitLimit:      124704 kB
 Committed_AS:       4356 kB
 VmallocTotal:     737256 kB
 VmallocUsed:        1560 kB
 VmallocChunk:     734460 kB

 ps

   Output:

   PID USER       VSZ STAT COMMAND
     1 root      1864 S    init [5]
     2 root         0 SW<  [kthreadd]
     3 root         0 SW<  [ksoftirqd/0]
     4 root         0 SW<  [events/0]
     5 root         0 SW<  [khelper]
     6 root         0 SW<  [netns]
     7 root         0 SW<  [kintegrityd/0]
     8 root         0 SW<  [kblockd/0]
     9 root         0 SW<  [ksuspend_usbd]
    10 root         0 SW<  [khubd]
    11 root         0 SW<  [kmmcd]
    12 root         0 SW   [pdflush]
    13 root         0 SW   [pdflush]
    14 root         0 SW<  [kswapd0]
    15 root         0 SW<  [aio/0]
    16 root         0 SW<  [nfsiod]
    21 root         0 SW<  [mtdblockd]
    22 root         0 SW<  [hid_compat]
    27 root         0 SW<  [rpciod/0]
    50 root      2588 S <  /sbin/udevd -d
   131 root      2584 S <  /sbin/udevd -d
   132 root      2584 S <  /sbin/udevd -d
   342 root      2512 S    /usr/sbin/dropbear -r
/etc/dropbear/dropbear_rsa_host_key -p 22
   345 root      3420 S    /sbin/syslogd -n -C64 -m 20
   347 root      3356 S    /sbin/klogd -n
   390 root      2764 R    /usr/sbin/dropbear -r
/etc/dropbear/dropbear_rsa_host_key -p 22
   391 root      3612 S    -sh
   459 root      3612 R    ps


  Status

   The image seems to work with one exception. Unfortunately getty reports a
   Segmentation fault, when started. Therefore login via the devices
   /dev/tty1 or /dev/ttyPSC0 is not possible. You can login to the board
only
   with ssh via Ethernet.

 ssh root@192.168.1.8

   No password is needed.

    Problem with getty

   When getty is called in /etc/inittab, it is respawned. You can test it on
   the command line:

 getty 115200 /dev/tty1

   Output:

 Segmentation fault

   Output on the display consoleOutput:

 getty:ioctl() TIOCSPGRP call failed: Inappropriate ioctl for device

   For the device /dev/ttyPSC0 a segmentation fault occurs too.

 getty 115200 /dev/tty1

   Output:

 Segmentation fault

Image opie-image

   Only the differences to Image_minimal-image are described.

  Build Image opie-image

   You can be in any folder you like. You should be logged in as a common
   user.Call the script setup-env only once.

 source $MY_PROJECT/setup-env

   Start building the image.

 bitbake opie-image

   Root file images and the kernel images can be found in the folder
   $MY_TMP/deploy/eglibc/images/mpc5125-twr/

 ls  -1s $MY_TMP/deploy/eglibc/images/mpc5125-twr/

  Create the Root File System

   Take the rootfs image and extract it into another folder. The extraction
   needs to be done with root privileges.

 mkdir -p $MY_NFSROOT/mpc5125-twr-opie-image;
 cd  $MY_NFSROOT/mpc5125-twr-opie-image;
 sudo tar xzf
$MY_TMP/deploy/eglibc/images/mpc5125-twr/opie-image-mpc5125-twr.tar.gz

   Extract the kernel modules into the root file system.

 cd  $MY_NFSROOT/mpc5125-twr-opie-image;
 tar tzf
$MY_TMP/deploy/eglibc/images/mpc5125-twr/modules-2.6.29-r11-mpc5125-twr.tgz;
 sudo rm -rf lib/modules/2.6.29.1;
 sudo tar xzf
$MY_TMP/deploy/eglibc/images/mpc5125-twr/modules-2.6.29-r11-mpc5125-twr.tgz;

   The rootfs can be now mounted via nfs.

  NFS Server

   Configure the NFS server to export the rootfs

 nano /etc/exports

   New or changed content of file /etc/exports:

 /MyOE/nfsroot/test01/mpc5125-twr-opie-image
192.168.1.255/24(rw,no_root_squash,async,subtree_check)

 exportfs -r

  U-boot

   Change the path of the root file system and the bootargs.

 setenv rootpath /MyOE/nfsroot/test01/mpc5125-twr-opie-image;
 setenv bootargs root=/dev/nfs rw nfsroot=${serverip}:${rootpath}
console=${consoledev},${baudrate}
ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:${hostname}:${netdev}:off
panic=1

   Save the new environment and boot the board again.

 saveenv
 run tftpboot

  Target Log

   The opie-image specific part:

   Output:

 Please wait: booting...
 Starting udev
 WARNING: -e needs -E or -F
 Remounting root file system...
 Caching udev devnodes
 Populating dev cache
 Configuring opie-pickboard.
 Configuring opie-multikeyapplet.
 Configuring opie-multikey.
 Configuring update-modules.
 Configuring opie-ttf-support.
 Configuring ttf-dejavu-common.
 Configuring ttf-dejavu-sans.
 Configuring ttf-dejavu-sans-mono.
 Configuring ppp.
 Configuring ppp-dialin.
 Segmentation fault
 Configuring ntpdate.
 adding crontab
 Configuring e2fsprogs.
 update-alternatives: Error: cannot register alternative chattr to
/usr/bin/chattr since it is already registered to /bin/chattr
 update-alternatives: Linking //sbin/uuidd to uuidd.util-linux-ng
 Configuring opie-screenshotapplet.
 Configuring dbus.
 Segmentation fault
 chgrp: unknown group messagebus
 adduser: group messagebus does not exist
 chown: unknown user/group messagebus:messagebus
 Segmentation fault
  Adding system startup for /etc/init.d/dbus-1.
 Configuring opie-brightnessapplet.
 Configuring bluez4.
 update-rc.d: /etc/init.d/bluetooth: file does not exist
 Configuring opie-handwriting-classicset.
 Configuring wpa-supplicant.
 Configuring angstrom-libc-fixup-hack.
 Configuring libnss-mdns.
 Configuring avahi-daemon.
 Segmentation fault
 adduser: group avahi does not exist
  Adding system startup for /etc/init.d/avahi-daemon.
 Configuring avahi-autoipd.
 Segmentation fault
 adduser: group avahi-autoipd does not exist
 Configuring opie-handwriting.
 Configuring opie-volumeapplet.
 Configuring opie-clockapplet.
 Configuration for powerpc.generic not found, trying powerpc
 NET: Registered protocol family 10
 lo: Disabled Privacy Extensions
 Collected errors:
  * pkg_run_script: package "ppp-dialin" postinst script returned status
139.
  * opkg_configure: ppp-dialin.postinst returned 139.
  * pkg_run_script: package "avahi-autoipd" postinst script returned
status 1.
  * opkg_configure: avahi-autoipd.postinst returned 1.
 NOT configuring network interfaces: / is an NFS mount
 Starting portmap daemon: portmap.
 net.ipv4.conf.default.rp_filter = 1
 net.ipv4.conf.all.rp_filter = 1
 Checking for built-in Bluetooth: no
 INIT: Entering runlevel: 5
 chown: unknown user messagebus
 Creating Dropbear SSH server RSA host key.
 Will output 1024 bit rsa secret key to
'/etc/dropbear/dropbear_rsa_host_key'
 Generating key, this may take a while...
 Public key portion is:
 ssh-rsa
AAAAB3NzaC1yc2EAAAADAQABAAAAgnxdVwJ5zZuD3moquSOU0RfczAYZQo+vTkjomUmclxSW4Tn25yyyIAdwarZv5juPy1guXxbVppfYMoYvlcOOerCSL/+eXzJI48nhQ78MTHSZqx/8h05UF64i2GsKaV18IGhF3NuxkU01/Sz86nK+OpUCVmLmN2TU2Z8qvfxhcUqTHAU=
root@mpc5125-twr
 Fingerprint: md5 db:e0:a9:6e:64:fa:e1:ef:85:8c:84:1c:40:ed:7e:d2
 Starting Dropbear SSH server: dropbear.
 Starting advanced power management daemon: No APM support in kernel
 (failed.)
 Starting syslogd/klogd: done
  * Starting Avahi mDNS/DNS-SD Daemon: avahi-daemon
 Timeout reached while wating for return value
 Could not receive return value from daemon process.
    ...fail!
 Copying default qpe.conf into /home/root/Settings/
 Starting Opie....
 OGlobal::creating global configuration instance.
 OConfig::OConfig()
 <unknown>: ODevice reports transformation to be 0
 <unknown>: setting QWS_DISPLAY to 'Transformed:Rot0:0'
 qt_init() - starting in daemon mode...

 .-------.
 |       |                  .-.
 |   |   |-----.-----.-----.| |   .----..-----.-----.
 |       |     | __  |  ---'| '--.|  .-'|     |     |
 |   |   |  |  |     |---  ||  --'|  |  |  '  | | | |
 '---'---'--'--'--.  |-----''----''--'  '-----'-'-'-'
                 -'  |
                 '---'

 The Angstrom Distribution mpc5125-twr ttyPSC0

 Angstrom v20110406 mpc5125-twr ttyPSC0

 INIT: Id "S" respawning
 INIT: Id "1" respawning
 INIT: no more processes

   Login with ssh via Ethernet

 uname -a

   Output:

 Linux mpc5125-twr 2.6.29.1 #1 PREEMPT Wed Apr 6 10:58:12 CEST 2011 ppc
GNU/Linux


 vmstat

   Output:

 procs -----------memory---------- ---swap-- -----io---- -system--
----cpu----
  r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy
id wa
  0  0      0 189988      0  39168    0    0     1     0  340  326  3  7
89  1


 cat /proc/meminfo

   Output:

 MemTotal:         249408 kB
 MemFree:          189988 kB
 Buffers:               0 kB
 Cached:            39168 kB
 SwapCached:            0 kB
 Active:            19668 kB
 Inactive:          29464 kB
 Active(anon):      10300 kB
 Inactive(anon):        0 kB
 Active(file):       9368 kB
 Inactive(file):    29464 kB
 SwapTotal:             0 kB
 SwapFree:              0 kB
 Dirty:                 0 kB
 Writeback:             0 kB
 AnonPages:         10012 kB
 Mapped:             7620 kB
 Slab:               6668 kB
 SReclaimable:       3384 kB
 SUnreclaim:         3284 kB
 PageTables:          324 kB
 NFS_Unstable:          0 kB
 Bounce:                0 kB
 WritebackTmp:          0 kB
 CommitLimit:      124704 kB
 Committed_AS:      16032 kB
 VmallocTotal:     737256 kB
 VmallocUsed:        1560 kB
 VmallocChunk:     734504 kB

 ps aux

   Output:

 USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
 root         1  0.2  0.2   1864   656 ?        Ss   11:48   0:01 init [5]
 root         2  0.0  0.0      0     0 ?        S<   11:48   0:00 [kthreadd]
 root         3  0.0  0.0      0     0 ?        S<   11:48   0:00
[ksoftirqd/0]
 root         4  0.0  0.0      0     0 ?        S<   11:48   0:00 [events/0]
 root         5  0.0  0.0      0     0 ?        S<   11:48   0:00 [khelper]
 root         6  0.0  0.0      0     0 ?        S<   11:48   0:00 [netns]
 root         7  0.0  0.0      0     0 ?        S<   11:48   0:00
[kintegrityd/0]
 root         8  0.0  0.0      0     0 ?        S<   11:48   0:00
[kblockd/0]
 root         9  0.0  0.0      0     0 ?        S<   11:48   0:00
[ksuspend_usbd]
 root        10  0.0  0.0      0     0 ?        S<   11:48   0:00 [khubd]
 root        11  4.3  0.0      0     0 ?        S<   11:48   0:19 [kmmcd]
 root        12  0.0  0.0      0     0 ?        S    11:48   0:00 [pdflush]
 root        13  0.0  0.0      0     0 ?        S    11:48   0:00 [pdflush]
 root        14  0.0  0.0      0     0 ?        S<   11:48   0:00 [kswapd0]
 root        15  0.0  0.0      0     0 ?        S<   11:48   0:00 [aio/0]
 root        16  0.0  0.0      0     0 ?        S<   11:48   0:00 [nfsiod]
 root        21  0.0  0.0      0     0 ?        S<   11:48   0:00
[mtdblockd]
 root        22  0.0  0.0      0     0 ?        S<   11:48   0:00
[hid_compat]
 root        27  0.1  0.0      0     0 ?        S<   11:48   0:00 [rpciod/0]
 root        50  0.1  0.2   2588   712 ?        S<s  11:48   0:00
/sbin/udevd -d
 root        97  0.0  0.3   2584   768 ?        S<   11:48   0:00
/sbin/udevd -d
 root       114  0.0  0.3   2584   752 ?        S<   11:48   0:00
/sbin/udevd -d
 daemon     638  0.0  0.1   1852   412 ?        Ss   11:48   0:00
/sbin/portmap
 root       673  0.0  0.1   2512   496 ?        Ss   11:48   0:00
/usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
 root       678  0.0  0.3   3420   812 ?        Ss   11:48   0:00
/sbin/syslogd -n -C64 -m 20
 root       680  0.0  0.2   3356   740 ?        Ss   11:48   0:00
/sbin/klogd -n
 root       702  0.0  0.1   3360   316 ?        S    11:48   0:00
/bin/sh /etc/rc5.d/S99opie start
 root       758  3.3  5.3  24388 13296 ?        S    11:54   0:02 qpe
 root       760  0.1  1.2   9196  3152 ?        S<   11:54   0:00 qss
 root       761  0.1  2.0  12344  5132 ?        SN   11:54   0:00
quicklauncher
 root       762  1.1  0.3   2764   972 ?        Ss   11:55   0:00
/usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
 root       763  0.1  0.4   3612  1016 pts/0    Ss   11:55   0:00 -sh
 root       768  0.0  0.4   2668  1000 pts/0    R+   11:55   0:00 ps aux


   In the GUI you can select Application -> Systeminfo -> Benchmark and run
   some benchmarks. Here are the results:Output:

 Integer Arithmetic 1161170 dhrys
 Floating Point Unit 0.09 secs
 Text Rendering 1285 chars/sec
 Gfx Rendering 3324.75.00gops/sec
 RAM Performance 62.00 MB/s; 44.64 MB/s

  Status

   The GUI of OPIE appears on the screen and can be controlled by the mouse
   and the keyboard. A small black rectangle appears in the upper left
   corner. Several errors like missing group names are reported, when
   booting, but the GUI appears and can be used. This is just a starting
   point for using OPIE. Unfortunately getty reports a Segmentation fault,
   when started. Therefore login via the devices /dev/ttyPSC0 or
/dev/tty1 is
   not possible.

  Screenshots

   A screenshot can be found at
   http://en.wikipedia.org/wiki/OPIE_user_interface.

Image x11-gpe-image

   Only the differences to Image_minimal-image are described.

  Build Image x11-gpe-image

   You can be in any folder you like. You should be logged in as a common
   user.Call the script setup-env only once.

 source $MY_PROJECT/setup-env

   Start building the image.

 bitbake x11-gpe-image

   Root file images and the kernel images can be found in the folder
   $MY_TMP/deploy/eglibc/images/mpc5125-twr/

 ls  -1s $MY_TMP/deploy/eglibc/images/mpc5125-twr/

  Create the Root File System

   Take the rootfs image and extract it into another folder. The extraction
   needs to be done with root privileges.

 mkdir -p $MY_NFSROOT/mpc5125-twr-x11-gpe-image;
 cd  $MY_NFSROOT/mpc5125-twr-x11-gpe-image;
 sudo tar xzf
$MY_TMP/deploy/eglibc/images/mpc5125-twr/x11-gpe-image-mpc5125-twr.tar.gz

   Extract the kernel modules into the root file system.

 cd  $MY_NFSROOT/mpc5125-twr-x11-gpe-image;
 tar tzf
$MY_TMP/deploy/eglibc/images/mpc5125-twr/modules-2.6.29-r11-mpc5125-twr.tgz;
 sudo rm -rf lib/modules/2.6.29.1;
 sudo tar xzf
$MY_TMP/deploy/eglibc/images/mpc5125-twr/modules-2.6.29-r11-mpc5125-twr.tgz;

   The rootfs can be now mounted via nfs.

  NFS Server

   Configure the NFS server to export the rootfs

 nano /etc/exports

   New or changed content of file /etc/exports:

 /MyOE/nfsroot/test01/mpc5125-twr-x11-gpe-image
192.168.1.255/24(rw,no_root_squash,async,subtree_check)

 exportfs -r

  U-boot

   Change the path of the root file system and the bootargs.

 setenv rootpath /MyOE/nfsroot/test01/mpc5125-twr-x11-gpe-image;
 setenv bootargs root=/dev/nfs rw nfsroot=${serverip}:${rootpath}
console=${consoledev},${baudrate}
ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:${hostname}:${netdev}:off
panic=1

   Save the new environment and boot the board again.

 saveenv
 run tftpboot

  Target Log

   The x11-gpe-image specific part:

   Output:

 INIT: version 2.86 booting
 Please wait: booting...
 Starting udev
 WARNING: -e needs -E or -F
 Remounting root file system...
 Caching udev devnodes
 Populating dev cache
 Undefined users:
 Skipping /etc/default/volatiles/99_hal
 Configuring hicolor-icon-theme.
 Configuring pango-module-basic-x.
 Configuring pango-module-basic-fc.
 Configuring ttf-dejavu-common.
 Configuring ttf-dejavu-sans.
 Configuring gdk-pixbuf-loader-png.
 Configuring gdk-pixbuf-loader-jpeg.
 Configuring gdk-pixbuf-loader-gif.
 Configuring gdk-pixbuf-loader-xpm.
 Configuring dbus.
 Segmentation fault
 chgrp: unknown group messagebus
 adduser: group messagebus does not exist
 chown: unknown user/group messagebus:messagebus
 Segmentation fault
  Adding system startup for /etc/init.d/dbus-1.
 Configuring policykit.
 Segmentation fault
 adduser: group polkituser does not exist
 Configuring ntpdate.
 adding crontab
 Configuring update-modules.
 Configuring ppp.
 Configuring ppp-dialin.
 Segmentation fault
 Configuring e2fsprogs.
 update-alternatives: Error: cannot register alternative chattr to
/usr/bin/chattr since it is already registered to /bin/chattr
 update-alternatives: Linking //sbin/uuidd to uuidd.util-linux-ng
 Configuring ttf-dejavu-sans-mono.
 Configuring bluez4.
 update-rc.d: /etc/init.d/bluetooth: file does not exist
 Configuring wpa-supplicant.
 Configuring angstrom-libc-fixup-hack.
 Configuring libnss-mdns.
 Configuring avahi-daemon.
 Segmentation fault
 adduser: group avahi does not exist
  Adding system startup for /etc/init.d/avahi-daemon.
 Configuring avahi-autoipd.
 Segmentation fault
 adduser: group avahi-autoipd does not exist
 Configuring hal.
 Segmentation fault
 adduser: group haldaemon does not exist
 Undefined users:
 Skipping /etc/default/volatiles/99_hal
 Configuration for powerpc.generic not found, trying powerpc
 NET: Registered protocol family 10
 lo: Disabled Privacy Extensions
 Collected errors:
  * pkg_run_script: package "ppp-dialin" postinst script returned status
139.
  * opkg_configure: ppp-dialin.postinst returned 139.
  * pkg_run_script: package "avahi-autoipd" postinst script returned
status 1.
  * opkg_configure: avahi-autoipd.postinst returned 1.
 NOT configuring network interfaces: / is an NFS mount
 Starting portmap daemon: portmap.
 net.ipv4.conf.default.rp_filter = 1
 net.ipv4.conf.all.rp_filter = 1
 Checking for built-in Bluetooth: no
 INIT: Entering runlevel: 5
 Starting system message bus: start-stop-daemon: unknown user messagebus
 Creating Dropbear SSH server RSA host key.
 Will output 1024 bit rsa secret key to
'/etc/dropbear/dropbear_rsa_host_key'
 Generating key, this may take a while...
 Public key portion is:
 ssh-rsa
AAAAB3NzaC1yc2EAAAADAQABAAAAgwCNJll+8PxiR1VoBxKHxIdwPml8w7TV1CwrUAySlN4Rj5T732hWROJRjAzhVyBfcdE7Lqis2o7dw+UIQigw1+JwkayO1MWIezABLHbQr5k9mrnYPjGdLPmp/yauxul8pNYAS/7DhOvq3g7OcppYGFjU33QK80xIdZUA+VV8H/lsKjQF
root@mpc5125-twr
 Fingerprint: md5 a3:41:e1:72:58:15:22:82:bc:73:43:4e:bc:94:86:1d
 Starting Dropbear SSH server: dropbear.
 Starting syslogd/klogd: done
  * Starting Avahi mDNS/DNS-SD Daemon: avahi-daemon
 Timeout reached while wating for return value
 Could not receive return value from daemon process.
    ...fail!
 Starting GPE display manager: gpe-dm

 .-------.
 |       |                  .-.
 |   |   |-----.-----.-----.| |   .----..-----.-----.
 |       |     | __  |  ---'| '--.|  .-'|     |     |
 |   |   |  |  |     |---  ||  --'|  |  |  '  | | | |
 '---'---'--'--'--.  |-----''----''--'  '-----'-'-'-'
                 -'  |
                 '---'

 The Angstrom Distribution mpc5125-twr ttyPSC0

 Angstrom v20110406 mpc5125-twr ttyPSC0

 mpc5125-twr login:
 INIT: Id "S" respawning too fast: disabled for 5 minutes
 INIT: Id "1" respawning
 INIT: no more processes

   Login with ssh via Ethernet

 uname -a

   Output:

 Linux mpc5125-twr 2.6.29.1 #1 PREEMPT Wed Apr 6 10:58:12 CEST 2011 ppc
GNU/Linux


 vmstat

   Output:

 procs -----------memory---------- ---swap-- -----io---- -system--
----cpu----
  r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy
id wa
  2  0      0 169732      0  50604    0    0     2     0  817  771 13 16
69  3

 cat /proc/meminfo

   Output:

 MemTotal:         249408 kB
 MemFree:          169732 kB
 Buffers:               0 kB
 Cached:            50604 kB
 SwapCached:            0 kB
 Active:            31512 kB
 Inactive:          36624 kB
 Active(anon):      17936 kB
 Inactive(anon):        0 kB
 Active(file):      13576 kB
 Inactive(file):    36624 kB
 SwapTotal:             0 kB
 SwapFree:              0 kB
 Dirty:                 0 kB
 Writeback:             0 kB
 AnonPages:         17580 kB
 Mapped:            12340 kB
 Slab:               7520 kB
 SReclaimable:       3972 kB
 SUnreclaim:         3548 kB
 PageTables:          644 kB
 NFS_Unstable:          0 kB
 Bounce:                0 kB
 WritebackTmp:          0 kB
 CommitLimit:      124704 kB
 Committed_AS:      33296 kB
 VmallocTotal:     737256 kB
 VmallocUsed:        1560 kB
 VmallocChunk:     734648 kB

 ps aux

   Output:

 USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
 root         1  0.5  0.2   1864   656 ?        Ss   12:28   0:00 init [5]
 root         2  0.0  0.0      0     0 ?        S<   12:28   0:00 [kthreadd]
 root         3  0.0  0.0      0     0 ?        S<   12:28   0:00
[ksoftirqd/0]
 root         4  0.0  0.0      0     0 ?        S<   12:28   0:00 [events/0]
 root         5  0.0  0.0      0     0 ?        S<   12:28   0:00 [khelper]
 root         6  0.0  0.0      0     0 ?        S<   12:28   0:00 [netns]
 root         7  0.0  0.0      0     0 ?        S<   12:28   0:00
[kintegrityd/0]
 root         8  0.0  0.0      0     0 ?        S<   12:28   0:00
[kblockd/0]
 root         9  0.0  0.0      0     0 ?        S<   12:28   0:00
[ksuspend_usbd]
 root        10  0.0  0.0      0     0 ?        S<   12:28   0:00 [khubd]
 root        11  4.4  0.0      0     0 ?        D<   12:28   0:07 [kmmcd]
 root        12  0.0  0.0      0     0 ?        S    12:28   0:00 [pdflush]
 root        13  0.0  0.0      0     0 ?        S    12:28   0:00 [pdflush]
 root        14  0.0  0.0      0     0 ?        S<   12:28   0:00 [kswapd0]
 root        15  0.0  0.0      0     0 ?        S<   12:28   0:00 [aio/0]
 root        16  0.1  0.0      0     0 ?        S<   12:28   0:00 [nfsiod]
 root        21  0.0  0.0      0     0 ?        S<   12:28   0:00
[mtdblockd]
 root        22  0.0  0.0      0     0 ?        S<   12:28   0:00
[hid_compat]
 root        27  0.4  0.0      0     0 ?        S<   12:28   0:00 [rpciod/0]
 root        50  0.3  0.2   2588   716 ?        S<s  12:28   0:00
/sbin/udevd -d
 root       112  0.0  0.3   2584   764 ?        S<   12:28   0:00
/sbin/udevd -d
 root       113  0.0  0.3   2584   764 ?        S<   12:28   0:00
/sbin/udevd -d
 daemon     866  0.0  0.1   1852   412 ?        Ss   12:29   0:00
/sbin/portmap
 root       901  0.0  0.1   2512   496 ?        Ss   12:29   0:00
/usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
 root       904  0.0  0.3   3420   812 ?        Ss   12:29   0:00
/sbin/syslogd -n -C64 -m 20
 root       906  0.0  0.2   3356   740 ?        Ss   12:29   0:00
/sbin/klogd -n
 root       917  0.0  0.1   3140   412 ?        Ss   12:29   0:00 gpe-dm
 root       919  4.9  3.9  24456  9860 tty2     Ss+  12:29   0:06 Xorg
-br -pn -dpi 100 :0 -noreset
 root       921  0.0  0.2   3356   676 ?        S    12:29   0:00
run-parts /etc/X11/Xinit.d
 userA      999  1.8  1.8  11400  4556 ?        Ss   12:29   0:02
matchbox-window-manager -use_cursor yes
 userA     1040  0.0  0.3   4444   752 ?        S    12:30   0:00
/usr/bin/dbus-launch --auto-syntax --exit-with-session
 userA     1041  0.0  0.3   2892   764 ?        Ss   12:30   0:00
/usr/bin/dbus-daemon --fork --print-pid 5 --print-address 8 --session
 userA     1045  0.5  3.0  20324  7724 ?        S    12:30   0:00
gpe-login --autolock
 userA     1052  0.1  0.7   5784  1908 ?        S    12:30   0:00 gpe-confd
 userA     1053  0.1  0.6   7024  1616 ?        S    12:30   0:00
mb-applet-startup-monitor
 userA     1054  0.0  0.3   3880   796 ?        Ss   12:30   0:00
/usr/bin/ipaq-sleep
 userA     1066  2.7  1.7   9756  4468 ?        S    12:30   0:02
matchbox-desktop
 userA     1067  0.6  1.1   7912  2976 ?        S    12:30   0:00
matchbox-panel --no-flip --orientation south
 userA     1071  0.1  1.0   5436  2556 ?        S    12:30   0:00
/usr/libexec/gconfd-2
 userA     1075  0.4  1.0   7888  2740 ?        S    12:30   0:00
mb-applet-menu-launcher
 userA     1077  0.2  1.0   7388  2496 ?        S    12:30   0:00 mbinputmgr
 userA     1079  0.1  0.6   7104  1624 ?        S    12:30   0:00
mb-applet-battery
 userA     1081  0.5  3.0  20676  7716 ?        S    12:30   0:00 minilite
 root      1084  1.3  0.3   2764   968 ?        Ss   12:31   0:00
/usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
 root      1085  0.2  0.4   3612  1036 pts/0    Ss   12:31   0:00 -sh
 root      1090  0.0  0.4   2668  1000 pts/0    R+   12:31   0:00 ps aux


  Status

   The GUI of GPE appears on the screen and can be controlled by the mouse
   and keyboard. A small black rectangle appears in the upper left corner of
   the display. Several errors like missing group names are reported, when
   booting, but the GUI appears and can be used. This is just a starting
   point for using GPE. Unfortunately getty reports a Segmentation fault,
   when started. Therefore login via the devices /dev/ttyPSC0 or
/dev/tty1 is
   not possible. You can login to the board with ssh via Ethernet.

  Screenshots

   Screenshots can be found here

http://gpe.linuxtogo.org/gallery/gallery/view_album.php?set_albumName=Applications.

Image xfce46-image

   Only the differences to Image_minimal-image are described.

  Build Image xfce46-image

   You can be in any folder you like. You should be logged in as a common
   user.Call the script setup-env only once.

 source $MY_PROJECT/setup-env

   Start building the image.

 bitbake xfce46-image

   Root file images and the kernel images can be found in the folder
   $MY_TMP/deploy/eglibc/images/mpc5125-twr/

 ls  -1s $MY_TMP/deploy/eglibc/images/mpc5125-twr/

  Create the Root File System

   Take the rootfs image and extract it into another folder. The extraction
   needs to be done with root privileges.

 mkdir -p $MY_NFSROOT/mpc5125-twr-xfce46-image;
 cd  $MY_NFSROOT/mpc5125-twr-xfce46-image;
 sudo tar xzf
$MY_TMP/deploy/eglibc/images/mpc5125-twr/xfce46-image-mpc5125-twr.tar.gz

   Extract the kernel modules into the root file system.

 cd  $MY_NFSROOT/mpc5125-twr-xfce46-image;
 tar tzf
$MY_TMP/deploy/eglibc/images/mpc5125-twr/modules-2.6.29-r11-mpc5125-twr.tgz;
 sudo rm -rf lib/modules/2.6.29.1;
 sudo tar xzf
$MY_TMP/deploy/eglibc/images/mpc5125-twr/modules-2.6.29-r11-mpc5125-twr.tgz;

   The rootfs can be now mounted via nfs.

  NFS Server

   Configure the NFS server to export the rootfs

 nano /etc/exports

   New or changed content of file /etc/exports:

 /MyOE/nfsroot/test01/mpc5125-twr-xfce46-image
192.168.1.255/24(rw,no_root_squash,async,subtree_check)

 exportfs -r

  U-boot

   Change the path of the root file system and the bootargs.

 setenv rootpath /MyOE/nfsroot/test01/mpc5125-twr-xfce46-image;
 setenv bootargs root=/dev/nfs rw nfsroot=${serverip}:${rootpath}
console=${consoledev},${baudrate}
ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:${hostname}:${netdev}:off
panic=1

   Save the new environment and boot the board again.

 saveenv
 run tftpboot

  Start Xfce

   Login as root, check the current settings of the nameserver and adjust
   them, if needed.

 cat /etc/resolv.conf
 echo "nameserver 192.168.1.1" >/etc/resolv.conf

   Start the GUI.

 startxfce4 &

  Target Log

   The xfce46-image specific part:

   Output:

 INIT: version 2.86 booting
 Please wait: booting...
 Starting udev
 WARNING: -e needs -E or -F
 Remounting root file system...
 Caching udev devnodes
 Populating dev cache
 Undefined users:
 Skipping /etc/default/volatiles/99_hal
 Configuring hicolor-icon-theme.
 Configuring dbus.
 Segmentation fault
 chgrp: unknown group messagebus
 adduser: group messagebus does not exist
 chown: unknown user/group messagebus:messagebus
 Segmentation fault
  Adding system startup for /etc/init.d/dbus-1.
 Configuring pango-module-basic-x.
 Configuring pango-module-basic-fc.
 Configuring ttf-dejavu-common.
 Configuring ttf-dejavu-sans.
 Configuring gdk-pixbuf-loader-png.
 Configuring gdk-pixbuf-loader-jpeg.
 Configuring gdk-pixbuf-loader-gif.
 Configuring gdk-pixbuf-loader-xpm.
 Configuring libxfcegui4-4.
 Configuring policykit.
 Segmentation fault
 adduser: group polkituser does not exist
 Configuring gnome-keyring.
 Configuring hal.
 Segmentation fault
 adduser: group haldaemon does not exist
 Undefined users:
 Skipping /etc/default/volatiles/99_hal
 Configuring bluez4.
 update-rc.d: /etc/init.d/bluetooth: file does not exist
 Configuring xfwm4.
 update-alternatives: Linking //usr/bin/x-window-manager to
/usr/bin/xfce4-session
 Configuring update-modules.
 Configuring xfce4-panel.
 Configuring xfce4-panel-plugin-separator.
 Configuring exo.
 Configuring ppp.
 Configuring ppp-dialin.
 Segmentation fault
 Configuring xfce-utils.
 Configuring e2fsprogs.
 update-alternatives: Error: cannot register alternative chattr to
/usr/bin/chattr since it is already registered to /bin/chattr
 update-alternatives: Linking //sbin/uuidd to uuidd.util-linux-ng
 Configuring xfprint.
 Configuring thunar.
 Configuring xfce4-appfinder.
 Configuring xfce4-notifyd.
 Configuring xfce4-session.
 Configuring xfdesktop.
 Configuring xfce4-panel-plugin-clock.
 Configuring xfce4-panel-plugin-iconbox.
 Configuring xfce4-panel-plugin-systray.
 Configuring xfce-terminal.
 Configuring midori.
 Configuring orage.
 Configuring squeeze.
 Configuring ristretto.
 Configuring angstrom-libc-fixup-hack.
 Configuring libnss-mdns.
 Configuring avahi-daemon.
 Segmentation fault
 adduser: group avahi does not exist
  Adding system startup for /etc/init.d/avahi-daemon.
 Configuring avahi-autoipd.
 Segmentation fault
 adduser: group avahi-autoipd does not exist
 Configuration for powerpc.generic not found, trying powerpc
 NET: Registered protocol family 10
 lo: Disabled Privacy Extensions
 Collected errors:
  * pkg_run_script: package "ppp-dialin" postinst script returned status
139.
  * opkg_configure: ppp-dialin.postinst returned 139.
  * pkg_run_script: package "avahi-autoipd" postinst script returned
status 1.
  * opkg_configure: avahi-autoipd.postinst returned 1.
 NOT configuring network interfaces: / is an NFS mount
 Starting portmap daemon: portmap.
 net.ipv4.conf.default.rp_filter = 1
 net.ipv4.conf.all.rp_filter = 1
 INIT: Entering runlevel: 5
 chown: unknown user messagebus
 Creating Dropbear SSH server RSA host key.
 Will output 1024 bit rsa secret key to
'/etc/dropbear/dropbear_rsa_host_key'
 Generating key, this may take a while...
 Public key portion is:
 ssh-rsa
AAAAB3NzaC1yc2EAAAADAQABAAAAgnNDJQjm83pY+GAUl01g+mL6ivTSDFW2IwkXdZgimbDnNSLrdiLTTxn7H1C35CEhP1tvRpQbW3LP6hDiNtlbjwH4qKWERBo2FSMVBb0pBJyMlaw0i/ZLawSHb6t+zMdoYiY6+5uhvkS4Zj6qYWwb9s1wYZVSKp/lUzQ+rpp0I8iT51c=
root@mpc5125-twr
 Fingerprint: md5 39:dc:e2:4c:54:83:4a:b0:e6:2c:9f:4e:7d:14:8a:22
 Starting Dropbear SSH server: dropbear.
 Starting Samba: smbd nmbd.
 Starting syslogd/klogd: done
  * Starting Avahi mDNS/DNS-SD Daemon: avahi-daemon
 Timeout reached while wating for return value
 Could not receive return value from daemon process.
    ...fail!

 .-------.
 |       |                  .-.
 |   |   |-----.-----.-----.| |   .----..-----.-----.
 |       |     | __  |  ---'| '--.|  .-'|     |     |
 |   |   |  |  |     |---  ||  --'|  |  |  '  | | | |
 '---'---'--'--'--.  |-----''----''--'  '-----'-'-'-'
                 -'  |
                 '---'

 The Angstrom Distribution mpc5125-twr ttyPSC0

 Angstrom v20110406 mpc5125-twr ttyPSC0

 mpc5125-twr login:
 INIT: Id "S" respawning too fast: disabled for 5 minutes
 INIT: Id "1" respawning
 INIT: no more processes

   Login with ssh via Ethernet

 uname -a

   Output:

 Linux mpc5125-twr 2.6.29.1 #1 PREEMPT Wed Apr 6 10:58:12 CEST 2011 ppc
GNU/Linux

 cat /etc/resolv.conf
 echo "nameserver 192.168.1.1" >/etc/resolv.conf
 cat /etc/resolv.conf


   Output:

 nameserver 192.168.1.1

 startxfce4 &

   Output:

 /usr/bin/startxfce4: Starting X server


 X.Org X Server 1.9.4
 Release Date: 2011-02-04
 X Protocol Version 11, Revision 0
 Build Operating System: Linux 2.6.37-gentoo-01 x86_64
 Current Operating System: Linux mpc5125-twr 2.6.29.1 #1 PREEMPT Wed Apr
6 10:58:12 CEST 2011 ppc
 Kernel command line: root=/dev/nfs rw
nfsroot=192.168.1.33:/MyOE/nfsroot/test01/mpc5125-twr-xfce46-image
console=ttyPSC0,115200
ip=192.168.1.8:192.168.1.33:192.168.1.1:255.255.255.0:ads5125:eth0:off
panic=1
 Build Date: 06 April 2011  01:22:10PM

 Current version of pixman: 0.21.6
         Before reporting problems, check http://wiki.x.org
         to make sure that you have the latest version.
 Markers: (--) probed, (**) from config file, (==) default setting,
         (++) from command line, (!!) notice, (II) informational,
         (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
 (==) Log file: "/var/log/Xorg.0.log", Time: Wed Apr  6 12:52:01 2011
 (==) Using config file: "/etc/X11/xorg.conf"
 (==) Using system config directory "/usr/share/X11/xorg.conf.d"
 (EE) Failed to load module "glx" (module does not exist, 0)
 (EE) Failed to load module "dri" (module does not exist, 0)
 (EE) Failed to load module "dri2" (module does not exist, 0)
 Primary device is not PCI
 (EE)   USB Multimedia Keyboard : failed to initialize for relative axes.
 /etc/xdg/xfce4/xinitrc: line 97: xrdb: not found

 ** (xfce4-session:1056): WARNING **: Unable to launch
"/usr/libexec/xfce4/xfconf-migration/xfconf-migration-4.6.pl" (specified
by autostart/xfconf-migration-4.6.desktop): Failed to execute child
process "/usr/libexec/xfce4/xfconf-migration/xfconf-migration-4.6.pl"
(No such file or directory)

 ** (xfsettingsd:1079): CRITICAL **: Failed to spawn xrdb: Failed to
execute child process "xrdb" (No such file or directory)

 ** (xfsettingsd:1079): CRITICAL **: Failed to spawn xrdb: Failed to
execute child process "xrdb" (No such file or directory)
 xfdesktop[1070]: starting up

 ** (xfsettingsd:1079): CRITICAL **: Failed to spawn xrdb: Failed to
execute child process "xrdb" (No such file or directory)

 ** (xfsettingsd:1079): CRITICAL **: Failed to spawn xrdb: Failed to
execute child process "xrdb" (No such file or directory)

 (Thunar:1068): thunar-vfs-WARNING **: Failed to connect to the HAL
daemon: Failed to connect to socket /var/run/dbus/system_bus_socket: No
such file or directory

 ** (xfsettingsd:1079): CRITICAL **: Failed to spawn xrdb: Failed to
execute child process "xrdb" (No such file or directory)

 ** (xfsettingsd:1079): CRITICAL **: Failed to spawn xrdb: Failed to
execute child process "xrdb" (No such file or directory)

 (xfdesktop:1070): thunar-vfs-WARNING **: Failed to connect to the HAL
daemon: Failed to connect to socket /var/run/dbus/system_bus_socket: No
such file or directory
 sh: fortune: not found
 Gtk-Message: (for origin information, set GTK_DEBUG): failed to
retrieve property `GtkOptionMenu::indicator-size' of type
`GtkRequisition' from rc file value "0" of type `glong'
 Gtk-Message: (for origin information, set GTK_DEBUG): failed to
retrieve property `GtkOptionMenu::indicator-spacing' of type `GtkBorder'
from rc file value "0" of type `glong'

 vmstat

   Output:

 procs -----------memory---------- ---swap-- -----io---- -system--
----cpu----
  r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy
id wa
  1  0      0 152576      0  61896    0    0     1     0  783  773 11 15
71  2

 cat /proc/meminfo

   Output:

 MemTotal:         249408 kB
 MemFree:          152576 kB
 Buffers:               0 kB
 Cached:            61896 kB
 SwapCached:            0 kB
 Active:            39156 kB
 Inactive:          45132 kB
 Active(anon):      24660 kB
 Inactive(anon):        0 kB
 Active(file):      14496 kB
 Inactive(file):    45132 kB
 SwapTotal:             0 kB
 SwapFree:              0 kB
 Dirty:                 0 kB
 Writeback:             0 kB
 AnonPages:         22440 kB
 Mapped:            17832 kB
 Slab:               8116 kB
 SReclaimable:       4256 kB
 SUnreclaim:         3860 kB
 PageTables:          836 kB
 NFS_Unstable:          0 kB
 Bounce:                0 kB
 WritebackTmp:          0 kB
 CommitLimit:      124704 kB
 Committed_AS:      75076 kB
 VmallocTotal:     737256 kB
 VmallocUsed:        1560 kB
 VmallocChunk:     734648 kB

 ps aux

   Output:

 USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
 root         1  0.4  0.2   1864   644 ?        Ss   12:48   0:00 init [5]
 root         2  0.0  0.0      0     0 ?        S<   12:48   0:00 [kthreadd]
 root         3  0.0  0.0      0     0 ?        S<   12:48   0:00
[ksoftirqd/0]
 root         4  0.0  0.0      0     0 ?        S<   12:48   0:00 [events/0]
 root         5  0.0  0.0      0     0 ?        S<   12:48   0:00 [khelper]
 root         6  0.0  0.0      0     0 ?        S<   12:48   0:00 [netns]
 root         7  0.0  0.0      0     0 ?        S<   12:48   0:00
[kintegrityd/0]
 root         8  0.0  0.0      0     0 ?        S<   12:48   0:00
[kblockd/0]
 root         9  0.0  0.0      0     0 ?        S<   12:48   0:00
[ksuspend_usbd]
 root        10  0.0  0.0      0     0 ?        S<   12:48   0:00 [khubd]
 root        11  4.5  0.0      0     0 ?        R<   12:48   0:10 [kmmcd]
 root        12  0.0  0.0      0     0 ?        S    12:48   0:00 [pdflush]
 root        13  0.0  0.0      0     0 ?        S    12:48   0:00 [pdflush]
 root        14  0.0  0.0      0     0 ?        S<   12:48   0:00 [kswapd0]
 root        15  0.0  0.0      0     0 ?        S<   12:48   0:00 [aio/0]
 root        16  0.0  0.0      0     0 ?        S<   12:48   0:00 [nfsiod]
 root        21  0.0  0.0      0     0 ?        S<   12:48   0:00
[mtdblockd]
 root        22  0.0  0.0      0     0 ?        S<   12:48   0:00
[hid_compat]
 root        27  0.3  0.0      0     0 ?        S<   12:48   0:00 [rpciod/0]
 root        50  0.2  0.3   2668   896 ?        S<s  12:49   0:00
/sbin/udevd -d
 root       105  0.0  0.3   2664   944 ?        S<   12:49   0:00
/sbin/udevd -d
 root       107  0.0  0.3   2664   932 ?        S<   12:49   0:00
/sbin/udevd -d
 daemon     960  0.0  0.1   1852   412 ?        Ss   12:49   0:00
/sbin/portmap
 root       987  0.0  0.1   2512   496 ?        Ss   12:49   0:00
/usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
 root       990  0.1  1.1  11184  2860 ?        Ss   12:49   0:00
/usr/sbin/smbd
 root       992  0.0  0.6   6296  1536 ?        Ss   12:49   0:00
/usr/sbin/nmbd
 root       995  0.0  0.3   3420   776 ?        Ss   12:49   0:00
/sbin/syslogd -n -C64 -m 20
 root       997  0.0  0.2   3356   716 ?        Ss   12:49   0:00
/sbin/klogd -n
 root      1004  0.0  0.4  11184  1028 ?        S    12:49   0:00
/usr/sbin/smbd
 root      1027  0.3  0.3   2764   960 ?        Ss   12:50   0:00
/usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
 root      1028  0.0  0.4   3612  1020 pts/0    Ss   12:50   0:00 -sh
 root      1036  0.0  0.3   3592   868 pts/0    S    12:52   0:00 xinit
/etc/xdg/xfce4/xinitrc
 root      1037 10.2  3.9  24368  9812 tty2     S<s+ 12:52   0:05 X :0
 root      1042  0.0  0.2   3360   748 pts/0    T    12:52   0:00 sh
/etc/xdg/xfce4/xinitrc
 root      1053  0.0  0.3   4192   784 pts/0    T    12:52   0:00
/usr/bin/dbus-launch --sh-syntax --exit-with-session
 root      1054  4.6  0.3   2892   864 ?        Ss   12:52   0:02
/usr/bin/dbus-daemon --fork --print-pid 4 --print-address 7 --session
 root      1056  1.3  2.4  20952  6132 pts/0    T    12:52   0:00
/usr/bin/xfce4-session
 root      1058  4.0  0.8   4424  2016 ?        S    12:52   0:02
/usr/libexec/xfconfd
 root      1064 13.4  4.2  23764 10708 pts/0    T    12:52   0:06 xfwm4
 root      1066  2.9  4.2  25480 10480 pts/0    T    12:52   0:01
xfce4-panel
 root      1068  0.5  2.3  21484  5956 pts/0    T    12:52   0:00 Thunar
--daemon
 root      1070  3.5  4.5  34768 11396 pts/0    T    12:52   0:01 xfdesktop
 root      1079  0.5  1.5  19304  3844 pts/0    T    12:52   0:00
xfsettingsd
 root      1081  0.2  0.5   3596  1444 ?        S    12:52   0:00
/usr/libexec/gam_server
 root      1095  0.6  1.5  20948  3816 ?        S    12:52   0:00
xfce4-settings-helper
 root      1097  1.9  3.3  23976  8232 pts/0    T    12:52   0:00
/usr/libexec/xfce4/panel-plugins/xfce4-menu-plugin socket_id 10485785
name xfce4-menu id 5 display_name Xfce Menu size 28 screen_position 11
 root      1099  0.1  0.8   6252  2112 ?        S    12:52   0:00
/usr/libexec/gvfsd
 root      1103  0.0  1.0  31776  2548 ?        Ssl  12:52   0:00
/usr/libexec//gvfs-fuse-daemon /home/root/.gvfs
 root      1111  0.0  0.3   2668   992 pts/0    R+   12:52   0:00 ps aux

  Status

   The GUI of Xfce appears on the screen and can be controlled by the mouse
   and keyboard. A small black rectangle appears in the upper left corner of
   the display. Several errors like missing group names are reported, when
   booting, but the GUI appears and can be used. X server reports serveral
   warnings but works. This is just a starting point for using xfce.
   Unfortunately getty reports a Segmentation fault, when started. Therefore
   login via the devices /dev/ttyPSC0 or /dev/tty1 is not possible. You can
   login to the board with ssh via Ethernet.

Troubleshooting

  Workaround when fetch fails

   When you use the portage distfiles folder for downloads and bitbake fails
   while fetching even when the file is there, this has helped usually:

 sudo chmod -R g+w /usr/portage/distfiles

   Start bitbake again.

  Workaround for cannot stat error

   When you start bitbake the current date is saved in some folder names.
   When bitbake fails and you restart it on another day, the the folder
names
   are different. You need to copy the files from the old folder to the new
   folder like in this example and then start bitbake again: Output:

 install: cannot stat
`/MyOE/tmp/test01/work/mpc5125-twr-angstrom-linux/angstrom-version-1_v20110406-r6/lsb_release':
No such file or directory
 NOTE: package angstrom-version-1_v20110406-r6: task do_install: Failed

 cd /MyOE/tmp/test01/work/mpc5125-twr-angstrom-linux;
 cp angstrom-version-1_v20110406-r6/lsb_release
angstrom-version-1_v20110406-r6/

  Bitbake Reports an Error

   You are using the master branch of openembedded, which is constantly
   changing. This is the latest version of openembedded. If the latest
   version cannot be build, you can try to use the latest tested version.
   Currently this is the version with the tag
   021312cbea3bd07f2ec8591d667998c9c7b28b3a.

 git status

   Save all your changes, which you don't want to lose, before you continue.
   Change to the tag 021312cbea3bd07f2ec8591d667998c9c7b28b3a.

 git reflog;
 git tag;
 git reset 021312cbea3bd07f2ec8591d667998c9c7b28b3a;

   Save and remove tracked files.

 git stash save

   Delete untracked files and directories dry-run

 git clean -fdn

   Delete untracked files and directories

 git clean -fd

   Check the current status.

 git status;
 git reflog;

   Now install the patches for mpc5125-twr and try to build the images in an
   empty directory $MY_TMP again.



