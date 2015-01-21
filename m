Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D3D52726CC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 09:45:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jan 2015 01:45:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="443107159"
Received: from irsmsx107.ger.corp.intel.com ([163.33.3.99])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2015 01:32:17 -0800
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.81]) by
	IRSMSX107.ger.corp.intel.com ([169.254.10.75]) with mapi id
	14.03.0195.001; Wed, 21 Jan 2015 09:45:35 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] meta-java: Problems creating java image inside VM?
	openjdk-6 build gets killed by host OOM killer.
Thread-Index: AQHQLmc/DRCfiB3fZ0uiDz2wXBd7A5zKYIvw
Date: Wed, 21 Jan 2015 09:45:35 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F4193B8@irsmsx105.ger.corp.intel.com>
References: <D0D920B6.892D%csmiley@icontrol.com>
In-Reply-To: <D0D920B6.892D%csmiley@icontrol.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: meta-java: Problems creating java image inside VM? openjdk-6 build gets killed by host OOM killer.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Jan 2015 09:45:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Colin,

I think I have a fix for this, please contact me off the list to try it out=
.
( cristian.iorga@intel.com )
It is about the proper invocation of qemu user mode.

Regards,
Cristian Iorga
Yocto Project
Intel Corporation

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Colin Smiley
Sent: Monday, January 12, 2015 2:57 PM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] meta-java: Problems creating java image inside VM? openjdk-6 =
build gets killed by host OOM killer.



I sent the following to the main Yocto project email alias, but since this =
deals with open-embedded recipes, I'll send it here as well.


I need help.

I am trying to use yocto and bitbake to create a QEMU-x86 image containing =
the openjdk-6 jvm. I am using open-embedded and meta-java for this.

Since I am running on a Mac, I am attempting creation from inside a VMWare =
VM (similar to the Yocto Build Appliance). I have tried using Ubuntu 14.04 =
Server, Fedora Core 18, 19, & 20 and met with the same results. My VM has
4 cores, and 8GB of RAM, and with the OOM killer involved I've tried giving=
 it 10GB and 12GB as well.

With all VMs, the failure is the same. OOM killer kills the qemu-i386 when =
running the following:

GENERATING
/home/csmiley/yocto/poky/build/tmp/work/i586-poky-linux/openjdk-6-jre/6b24-
1.11.9-r22.1/icedtea6-1.11.9/build/generated.build/sun/awt/X11/generator/si
zes.32


Here are the steps and configuration I follow:

1) Create a VM with either Ubuntu or Fedora (failure has been same for
all). VM has 50GB of disk and 8GB of RAM (although have tried increasing
to 10GB and 12GB with same result).

2) Perform os updates per yocto page here:
http://www.yoctoproject.org/docs/1.7/ref-manual/ref-manual.html#required-pa
ckages-for-the-host-development-system

3) Check out appropriate version and branches, per meta-java readme.
$ git clone http://git.yoctoproject.org/git/poky
$ cd poky
$ git checkout -b daisy origin/daisy
$ git clone git://git.openembedded.org/meta-openembedded
$ cd meta-openembedded
$ git checkout -b daisy origin/daisy
$ cd ..
$ git clone git://git.yoctoproject.org/meta-java

4) Since I only want java 6, copy meta-java=B9s java-test-image.bb recipe,
calling it java-6-test-image.bb. It reads:

LICENSE =3D "MIT"
inherit core-image
IMAGE_LINGUAS =3D " "
IMAGE_INSTALL =3D "busybox modutils-initscripts initscripts opkg udev
sysvinit netbase base-files base-passwd busybox-hwclock \
                 ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL}
\
openjdk-6-jre openjdk-6-vm-zero openjdk-6-vm-jamvm openjdk-6-vm-cacao \
                 strace dropbear binutils \
                 classpath \
                 classpath-common \
                 classpath-examples \
                 classpath-tools \
                 jamvm \
                 cacao \
"

5) Set up environment with `. ./oe-init-build-env`


6) Modify build/conf/local.conf and add (I have tried setting threads and
parallel_make to 1, 2, 4, and 8 with the same results):
# Added for OpenJDK6
PREFERRED_PROVIDER_virtual/java-initial =3D "cacao-initial"
PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"
PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"
PREFERRED_VERSION_openjdk-6-jre =3D "6b24-1.11.9"
PREFERRED_PROVIDER_openjdk-6-jre =3D "openjdk-6-jre"
PREFERRED_VERSION_icedtea6-native =3D "1.8.11"
# The maximum number of tasks BitBake should run in parallel at any one
time
BB_NUMBER_THREADS =3D "8"
# Extra options passed to the make command during the do_compile task in
order to specify parallel compilation on the local build host.
PARALLEL_MAKE =3D "-j 8"

7) Modify build/conf/bblayers.conf

# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION =3D "6"

BBPATH =3D "${TOPDIR}"
BBFILES ?=3D ""

BBLAYERS ?=3D " \
  /home/csmiley/yocto/poky/meta \
  /home/csmiley/yocto/poky/meta-yocto \
  /home/csmiley/yocto/poky/meta-yocto-bsp \
  /home/csmiley/yocto/poky/meta-openembedded/meta-oe \
  /home/csmiley/yocto/poky/meta-java \
  "
BBLAYERS_NON_REMOVABLE ?=3D " \
  /home/csmiley/yocto/poky/meta \
  /home/csmiley/yocto/poky/meta-yocto \
  "

8) Run `bitbake java-6-test-image`. This runs until compilation failure,
due to a date bug introduced in meta-java on 12/31/14, with:

/home/csmiley/yacto/poky/build/tmp/work/i586-poky-linux/openjdk-6-jre/6b24-
1.11.9-r22.1/build/bootstrap/jdk1.6.0/bin/java  -client -Xmx896m -Xms128m
-XX:PermSize=3D32m -XX:MaxPermSize=3D160m -jar
/home/csmiley/yacto/poky/build/tmp/work/i586-poky-linux/openjdk-6-jre/6b24-
1.11.9-r22.1/build/openjdk.build-ecj/btjars/generatecurrencydata.jar -o
/home/csmiley/yacto/poky/build/tmp/work/i586-poky-linux/openjdk-6-jre/6b24-
1.11.9-r22.1/build/openjdk.build-ecj/lib/currency.data.temp \
| 	< ../../../src/share/classes/java/util/CurrencyData.properties
| Error: time is more than 10 years from present: 1104530400000
| java.lang.RuntimeException: time is more than 10 years from present:
1104530400000
| 	at=20
build.tools.generatecurrencydata.GenerateCurrencyData.makeSpecialCaseEntry(
GenerateCurrencyData.java:285)
| 	at=20
build.tools.generatecurrencydata.GenerateCurrencyData.buildMainAndSpecialCa
seTables(GenerateCurrencyData.java:225)
| 	at=20
build.tools.generatecurrencydata.GenerateCurrencyData.main(GenerateCurrency
Data.java:154)

9) Fix above problem by editing all instances of
build/tmp/work/work/.../CurrencyData.properties to get rid of Turkish
Currency Issue.


10) Restart by running `bitbake java-6-test-image`. This now fails when
doing the generation on Sizes.32 with:
| i586-poky-linux-gcc  -m32 -march=3Di586
--sysroot=3D/home/csmiley/yocto/poky/build/tmp/sysroots/qemux86  -O2 -pipe
-g -feliminate-unused-debug-types   -fno-strict-aliasing -fPIC -W -Wall
-Wno-unused -Wno-parentheses -m32 -D_LITTLE_ENDIAN -g   -DARCH=3D'"i586"'
-Di586 -DLINUX -DRELEASE=3D'"1.6.0_24"' -D_LARGEFILE64_SOURCE -D_GNU_SOURCE
-D_REENTRANT -I.=20
-I/home/csmiley/yocto/poky/build/tmp/work/i586-poky-linux/openjdk-6-jre/6b2
4-1.11.9-r22.1/icedtea6-1.11.9/build/openjdk.build-ecj/tmp/sun/sun.awt.X11/
xawt/CClassHeaders -I../../../src/solaris/javavm/export
-I../../../src/share/javavm/export -I../../../src/share/javavm/include
-I../../../src/solaris/javavm/include -I../../../src/share/native/common
-I../../../src/solaris/native/common
-I../../../src/share/native/sun/awt/X11
-I../../../src/solaris/native/sun/awt/X11
-I/home/csmiley/yocto/poky/build/tmp/sysroots/qemux86/usr/include -DXAWT
-DXAWT_HACK=20
-I/home/csmiley/yocto/poky/build/tmp/work/i586-poky-linux/openjdk-6-jre/6b2
4-1.11.9-r22.1/icedtea6-1.11.9/build/openjdk.build-ecj/tmp/sun/sun.awt.X11/
xawt/../../sun.awt/awt/CClassHeaders -I../../../src/solaris/native/sun/awt
-I../../../src/solaris/native/sun/xawt
-I../../../src/solaris/native/sun/jdga
-I../../../src/share/native/sun/awt/debug
-I../../../src/share/native/sun/awt/image/cvutils
-I../../../src/share/native/sun/java2d
-I../../../src/share/native/sun/java2d/loops
-I../../../src/share/native/sun/awt/image/cvutils
-I../../../src/share/native/sun/awt/image
-I../../../src/share/native/sun/font
-I../../../src/solaris/native/sun/java2d
-I../../../src/share/native/sun/java2d/pipe
-I../../../src/share/native/sun/java2d/opengl
-I../../../src/solaris/native/sun/java2d/opengl
-I../../../src/solaris/native/sun/java2d/x11
-I../../../src/share/native/sun/dc/path
-I../../../src/share/native/sun/dc/doe
-I../../../src/share/native/sun/awt/alphacomposite
-I../../../src/share/native/sun/awt/medialib
-I../../../src/solaris/native/sun/awt/medialib
-I../../../src/solaris/native/sun/font -I../../../src/share/native/sun/awt
-I../../../src/solaris/native/sun/awt -o
/home/csmiley/yocto/poky/build/tmp/work/i586-poky-linux/openjdk-6-jre/6b24-
1.11.9-r22.1/icedtea6-1.11.9/build/generated.build/sun/awt/X11/generator/si
zer.32=20
/home/csmiley/yocto/poky/build/tmp/work/i586-poky-linux/openjdk-6-jre/6b24-
1.11.9-r22.1/icedtea6-1.11.9/build/generated.build/sun/awt/X11/generator/si
zer.32.c
| GENERATING=20
/home/csmiley/yocto/poky/build/tmp/work/i586-poky-linux/openjdk-6-jre/6b24-
1.11.9-r22.1/icedtea6-1.11.9/build/generated.build/sun/awt/X11/generator/si
zes.32
| Killed
| make[5]: ***=20
[/home/csmiley/yocto/poky/build/tmp/work/i586-poky-linux/openjdk-6-jre/6b24
-1.11.9-r22.1/icedtea6-1.11.9/build/generated.build/sun/awt/X11/generator/s
izes.32] Error 137



System console has the message:
Jan 11 02:00:47 yoctomatic kernel: [59600.572556] Out of memory: Kill
process 69268 (qemu-i386) score 944 or sacrifice child
Jan 11 02:00:47 yoctomatic kernel: [59600.573756] Killed process 69268
(qemu-i386) total-vm:15519392kB, anon-rss:7674264kB, file-rss:32kB



I have tried the following while diagnosing:

* Build core-image-minimal (works)
* Build java-6-test-image without java/jdk portions (dependencies only)
(works)
* Builds varying number of threads/parallel make, memory of VM, OS of VM
(all break in same place).

I would like some help diagnosing this. Please help!


Thanks,


Colin


--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

