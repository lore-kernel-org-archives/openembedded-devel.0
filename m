Received: from [59.160.240.215] (helo=rediffmail.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <suhas7860@rediffmail.com>) id 1HHCdD-0007li-97
	for openembedded-devel@openembedded.org; Wed, 14 Feb 2007 06:24:39 +0100
Received: (qmail 18455 invoked by uid 510); 14 Feb 2007 05:21:34 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
Date: 14 Feb 2007 05:21:34 -0000
Message-ID: <20070214052134.18453.qmail@webmail90.rediffmail.com>
Received: from unknown (221.243.162.19) by rediffmail.com via HTTP;
	14 feb 2007 05:21:34 -0000
MIME-Version: 1.0
From: "Mr. Suhas Ghosh" <suhas7860@rediffmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: busy box failed
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
X-List-Received-Date: Wed, 14 Feb 2007 05:24:39 -0000
Content-Type: text/plain;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi
I am trying to make a simple kernel for ARM926EJ-S using=20
OEM..I used simpad machine name and generic distro.
I have already got success to create bootstrap image using this configurat=
ion in my i386 32 bits laptop.When I treied to run same conf in my this X86=
_64 I got this following error
I used:-
monotone-0.31-2.fc5 in X86_64 but in my i386 32 bit laptop I uesed 0.32 ve=
rsion.
Here is my machine configuration(simpad.conf)
-----------------------------------------------
MACHINE_KERNEL_VERSION ?=3D "2.4"
require conf/machine/include/simpad-${MACHINE_KERNEL_VERSION}.conf

TARGET_ARCH =3D "arm"
BOOTSTRAP_EXTRA_RDEPENDS +=3D "kernel"
#This is needed for the ramdisk script to work
BOOTSTRAP_EXTRA_RDEPENDS +=3D "e2fsprogs-mke2fs"
SERIAL_CONSOLE =3D "ttySA0 115200 vt100"
USE_DEVFS =3D "1"
USE_VT =3D "0"
require conf/machine/include/tune-strongarm.conf
--------------------------------------------------=20
I give the command
[suhas@l5ac197 build]$ bitbake -D bootstrap-image
After long time I got the following error
make[1]: Entering directory `/home/suhas/openembed/build/tmp/work/arm-linu=
x/busybox-1.2.1-r11/busybox-1.2.1'
  HOSTLINK scripts/bb_mkdep
  GEN .depend
  LINK busybox_unstripped
/home/suhas/openembed/build/tmp/work/arm-linux/busybox-1.2.1-r11/busybox-1=
.2.1/coreutils/df.c: In function &#65533;df_main&#65533;:
/home/suhas/openembed/build/tmp/work/arm-linux/busybox-1.2.1-r11/busybox-1=
.2.1/coreutils/df.c:119: warning: passing argument 1 of &#65533;find_block_=
device&#65533; discards qualifiers from pointer target type
/home/suhas/openembed/build/tmp/work/arm-linux/busybox-1.2.1-r11/busybox-1=
.2.1/networking/udhcp/dhcpc.c: In function &#65533;udhcpc_main&#65533;:
/home/suhas/openembed/build/tmp/work/arm-linux/busybox-1.2.1-r11/busybox-1=
.2.1/networking/udhcp/dhcpc.c:180: warning: pointer targets in passing argu=
ment 1 of &#65533;__builtin_strncpy&#65533; differ in signedness
arm-linux-gcc: Internal error: Killed (program cc1)
Please submit a full bug report.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.
make[1]: *** [busybox_unstripped] Error 1
make[1]: Leaving directory `/home/suhas/openembed/build/tmp/work/arm-linux=
/busybox-1.2.1-r11/busybox-1.2.1'
make: *** [_all] Error 2
+ die 'oe_runmake failed'
+ oefatal 'oe_runmake failed'
+ echo FATAL: 'oe_runmake failed'
FATAL: oe_runmake failed
+ exit 1
ERROR: function do_compile failed
ERROR: see log in /home/suhas/openembed/build/tmp/work/arm-linux/busybox-1=
.2.1-r11/temp/log.do_compile.18686
NOTE: Task failed: /home/suhas/openembed/build/tmp/work/arm-linux/busybox-=
1.2.1-r11/temp/log.do_compile.18686
NOTE: package busybox-1.2.1-r11: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package busybox-1.2.1: failed
ERROR: Build of bootstrap-image failed.
So please help me what to do now.
            Thanks in advance
               Suhas

From gerwin@vanderkruis.net Wed Feb 14 07:43:26 2007
Received: from [195.121.247.4] (helo
